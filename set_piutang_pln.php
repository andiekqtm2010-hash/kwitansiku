<?php
// ============================================================
// FILE: set_piutang_pln.php
// FUNGSI:
// - Mengubah transaksi PLN menjadi transaksi PIUTANG di modul kwitansi
// - Membuat HEADER pada tabel kwitansi
// - Membuat DETAIL pada tabel kwitansi_item
// - Setelah berhasil kembali ke list_tagihan.php
//
// CATATAN PENTING:
// kwitansi_item.kwitansi_id harus menunjuk ke kwitansi.id.
// Karena itu ID Transaksi PLN TIDAK langsung dimasukkan ke kwitansi_id.
// ID Transaksi PLN disimpan pada catatan/deskripsi sebagai referensi.
// ============================================================

require_once "db.php";


// ============================================================
// 1) VALIDASI ID ROW TB_TAGIHAN_LISTRIK
// Parameter id yang diterima adalah primary key tabel tb_tagihan_listrik.
// ============================================================
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($id <= 0) {
    die("ID transaksi PLN tidak valid.");
}


// ============================================================
// 2) AMBIL DATA TRANSAKSI PLN
// Field yang dipakai:
// - id_transaksi
// - tgl_bayar
// - no_pelanggan
// - nama
// - tarif_daya
// - stand_awal
// - stand_akhir
// - periode
// - total_bayar
// ============================================================
$sql = "SELECT
            id,
            id_transaksi,
            tgl_bayar,
            no_pelanggan,
            nama,
            tarif_daya,
            stand_awal,
            stand_akhir,
            periode,
            total_bayar
        FROM tb_tagihan_listrik
        WHERE id = ?
        LIMIT 1";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Gagal menyiapkan query transaksi PLN: " . $conn->error);
}

$stmt->bind_param("i", $id);
$stmt->execute();

$row = $stmt->get_result()->fetch_assoc();
$stmt->close();

if (!$row) {
    die("Data transaksi PLN tidak ditemukan.");
}


// ============================================================
// 3) SIAPKAN DATA HEADER KWITANSI
// ============================================================
$tanggal = date('Y-m-d', strtotime($row['tgl_bayar']));

// Nama pelanggan dibuat uppercase agar konsisten.
$nama = trim((string)$row['nama']);
$nama = function_exists('mb_strtoupper')
    ? mb_strtoupper($nama, 'UTF-8')
    : strtoupper($nama);

// Alamat tidak tersedia di tb_tagihan_listrik.
// Diisi referensi nomor pelanggan agar tetap informatif.
$alamat = 'No Pelanggan PLN: ' . trim((string)$row['no_pelanggan']);

// Catatan menyimpan referensi sumber PLN.
// Ini juga dipakai untuk mencegah transaksi yang sama masuk dua kali.
$catatan = 'PLN PASCA | ID Transaksi: ' . trim((string)$row['id_transaksi']);

$status_bayar = 'Piutang';
$discount = 0;
$total = (float)$row['total_bayar'];


// ============================================================
// 4) CEGAH DUPLIKASI
// Jika ID Transaksi PLN yang sama sudah pernah dibuat menjadi piutang,
// jangan membuat header/detail kwitansi kedua kali.
// ============================================================
$stmt = $conn->prepare("
    SELECT id
    FROM kwitansi
    WHERE catatan = ?
    LIMIT 1
");

$stmt->bind_param("s", $catatan);
$stmt->execute();

$existing = $stmt->get_result()->fetch_assoc();
$stmt->close();

if ($existing) {
    header("Location: list_tagihan.php?msg=already_piutang");
    exit;
}


// ============================================================
// 5) GENERATE NOMOR KWITANSI
// Mengikuti pola existing:
// KWT/<bulan>/<tahun>/<nomor 5 digit>
// ============================================================
$bulan = date('n', strtotime($tanggal));
$tahun = date('Y', strtotime($tanggal));

$sql_last = "SELECT no_kwitansi
             FROM kwitansi
             WHERE no_kwitansi LIKE CONCAT('KWT/', ?, '/', ?, '/%')
             ORDER BY no_kwitansi DESC
             LIMIT 1";

$stmt = $conn->prepare($sql_last);
$stmt->bind_param("ss", $bulan, $tahun);
$stmt->execute();

$res = $stmt->get_result();
$last = 0;

if ($last_row = $res->fetch_assoc()) {
    $parts = explode('/', $last_row['no_kwitansi']);
    $last = (int)end($parts);
}

$stmt->close();

$next = $last + 1;
$nomor_urut = str_pad($next, 5, "0", STR_PAD_LEFT);
$no_kwitansi = "KWT/$bulan/$tahun/$nomor_urut";


// ============================================================
// 6) SIAPKAN DESKRIPSI ITEM
// Gabungan dari:
// - Tarif / Daya
// - Stand Meter Awal
// - Stand Meter Akhir
// - Periode
// - ID Transaksi PLN sebagai referensi tambahan
// ============================================================
$deskripsi =
    'PLN PASCA | Tarif/Daya: ' . trim((string)$row['tarif_daya']) .
    ' | Stand: ' . (int)$row['stand_awal'] . '-' . (int)$row['stand_akhir'] .
    ' | Periode: ' . trim((string)$row['periode']) .
    ' | ID Transaksi: ' . trim((string)$row['id_transaksi']);

$qty = 1;
$harga = $total;
$subtotal = $total;


// ============================================================
// 7) TRANSACTION DATABASE
// Header dan detail harus sama-sama berhasil.
// Jika salah satu gagal, semuanya di-rollback.
// ============================================================
$conn->begin_transaction();

try {

    // --------------------------------------------------------
    // 7a) INSERT HEADER KWITANSI
    // Supaya transaksi muncul di index utama sebagai PIUTANG.
    // --------------------------------------------------------
    $stmt = $conn->prepare("
        INSERT INTO kwitansi
        (
            no_kwitansi,
            tanggal,
            nama_pelanggan,
            alamat_pelanggan,
            catatan,
            status_bayar,
            discount,
            total
        )
        VALUES (?,?,?,?,?,?,?,?)
    ");

    if (!$stmt) {
        throw new Exception("Gagal menyiapkan insert kwitansi: " . $conn->error);
    }

    $stmt->bind_param(
        "ssssssdd",
        $no_kwitansi,
        $tanggal,
        $nama,
        $alamat,
        $catatan,
        $status_bayar,
        $discount,
        $total
    );

    if (!$stmt->execute()) {
        throw new Exception("Gagal menyimpan header kwitansi: " . $stmt->error);
    }

    // ID inilah yang benar untuk kwitansi_item.kwitansi_id
    $kwitansi_id = $stmt->insert_id;

    $stmt->close();


    // --------------------------------------------------------
    // 7b) INSERT DETAIL KWITANSI ITEM
    // qty      = 1
    // harga    = total_bayar PLN
    // subtotal = total_bayar PLN
    // --------------------------------------------------------
    $stmt = $conn->prepare("
        INSERT INTO kwitansi_item
        (
            kwitansi_id,
            deskripsi,
            qty,
            harga,
            subtotal
        )
        VALUES (?,?,?,?,?)
    ");

    if (!$stmt) {
        throw new Exception("Gagal menyiapkan insert kwitansi item: " . $conn->error);
    }

    $stmt->bind_param(
        "isidd",
        $kwitansi_id,
        $deskripsi,
        $qty,
        $harga,
        $subtotal
    );

    if (!$stmt->execute()) {
        throw new Exception("Gagal menyimpan item kwitansi: " . $stmt->error);
    }

    $stmt->close();


    // --------------------------------------------------------
    // 7c) COMMIT
    // --------------------------------------------------------
    $conn->commit();

    header("Location: list_tagihan.php?msg=piutang_ok");
    exit;

} catch (Throwable $e) {

    // Jika ada error, batalkan semua perubahan.
    $conn->rollback();

    die(
        "Gagal membuat piutang PLN: " .
        htmlspecialchars($e->getMessage())
    );
}
