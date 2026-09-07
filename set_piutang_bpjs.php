<?php
// ============================================================
// FILE: set_piutang_bpjs.php
// FUNGSI:
// - Mengubah transaksi BPJS menjadi transaksi PIUTANG
// - Membuat HEADER pada tabel kwitansi
// - Membuat DETAIL pada tabel kwitansi_item
// - Supaya transaksi tampil di index utama sebagai PIUTANG
//
// CATATAN PENTING:
// kwitansi_item.kwitansi_id harus berisi kwitansi.id,
// bukan id dari tb_tagihan_bpjs.
// ============================================================

require_once "db.php";


// ============================================================
// 1) VALIDASI ID TRANSAKSI BPJS
// Parameter id adalah primary key tb_tagihan_bpjs.
// ============================================================
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($id <= 0) {
    die("ID transaksi BPJS tidak valid.");
}


// ============================================================
// 2) AMBIL DATA TRANSAKSI BPJS
// ============================================================
$sql = "SELECT
            id,
            tgl_bayar,
            no_polis,
            nama,
            Jml_peserta AS jml_peserta,
            periode,
            rp_tagihan,
            admin_bank,
            total_bayar
        FROM tb_tagihan_bpjs
        WHERE id = ?
        LIMIT 1";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Gagal menyiapkan query transaksi BPJS: " . $conn->error);
}

$stmt->bind_param("i", $id);
$stmt->execute();

$row = $stmt->get_result()->fetch_assoc();
$stmt->close();

if (!$row) {
    die("Data transaksi BPJS tidak ditemukan.");
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

// Karena tabel BPJS tidak punya alamat,
// kolom alamat dipakai sebagai referensi nomor polis.
$alamat = 'No Polis BPJS: ' . trim((string)$row['no_polis']);

// Catatan menjadi penanda sumber transaksi BPJS
// sekaligus dipakai untuk mencegah duplikasi.
$catatan = 'BPJS | ID BPJS: ' . (int)$row['id']
          . ' | No Polis: ' . trim((string)$row['no_polis']);

$status_bayar = 'Piutang';
$discount = 0;
$total = (float)$row['total_bayar'];


// ============================================================
// 4) CEGAH DUPLIKASI
// Jika transaksi BPJS ini sudah pernah dijadikan piutang,
// jangan membuat kwitansi kedua kali.
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
    header("Location: list_bpjs.php?msg=already_piutang");
    exit;
}


// ============================================================
// 5) GENERATE NOMOR KWITANSI
// Format:
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

if (!$stmt) {
    die("Gagal menyiapkan nomor kwitansi: " . $conn->error);
}

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
// 6) SIAPKAN DESKRIPSI ITEM KWITANSI
// Gabungan informasi BPJS:
// - Nomor Polis
// - Jumlah Peserta
// - Periode
// - Tagihan BPJS
// - Admin Bank
// ============================================================
$deskripsi =
    'BPJS KESEHATAN' .
    ' | No Polis: ' . trim((string)$row['no_polis']) .
    ' | Peserta: ' . (int)$row['jml_peserta'] . ' Orang' .
    ' | Periode: ' . trim((string)$row['periode']) .
    ' | Tagihan: Rp ' . number_format((float)$row['rp_tagihan'], 0, ',', '.') .
    ' | Admin: Rp ' . number_format((float)$row['admin_bank'], 0, ',', '.');


// ============================================================
// 7) NILAI ITEM KWITANSI
// qty      = 1
// harga    = total_bayar BPJS
// subtotal = total_bayar BPJS
// ============================================================
$qty = 1;
$harga = $total;
$subtotal = $total;


// ============================================================
// 8) DATABASE TRANSACTION
// Header dan detail harus sukses bersama-sama.
// ============================================================
$conn->begin_transaction();

try {

    // --------------------------------------------------------
    // 8a) INSERT HEADER KWITANSI
    // Agar muncul di index sebagai PIUTANG.
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
        throw new Exception(
            "Gagal menyiapkan insert kwitansi: " . $conn->error
        );
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
        throw new Exception(
            "Gagal menyimpan header kwitansi: " . $stmt->error
        );
    }

    // ID header kwitansi inilah yang dipakai sebagai foreign key item.
    $kwitansi_id = $stmt->insert_id;

    $stmt->close();


    // --------------------------------------------------------
    // 8b) INSERT ITEM KWITANSI
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
        throw new Exception(
            "Gagal menyiapkan insert kwitansi item: " . $conn->error
        );
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
        throw new Exception(
            "Gagal menyimpan item kwitansi: " . $stmt->error
        );
    }

    $stmt->close();


    // --------------------------------------------------------
    // 8c) COMMIT
    // --------------------------------------------------------
    $conn->commit();

    header("Location: list_bpjs.php?msg=piutang_ok");
    exit;

} catch (Throwable $e) {

    // Jika salah satu query gagal,
    // batalkan seluruh perubahan.
    $conn->rollback();

    die(
        "Gagal membuat piutang BPJS: " .
        htmlspecialchars($e->getMessage())
    );
}
