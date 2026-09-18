<?php
require_once "db.php";

function rupiah_to_number($s) {
    $s = str_replace(['.',',',' '], '', $s);
    return (float)$s;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $tanggal = $_POST['tanggal'] ?? date('Y-m-d');
    $nama = trim($_POST['nama_pelanggan'] ?? '');
    $alamat = trim($_POST['alamat_pelanggan'] ?? '');
    $catatan = trim($_POST['catatan'] ?? '');
    $status_bayar = trim($_POST['status_bayar'] ?? '');

    // ============================================================
    // DISCOUNT DARI FORM KWITANSI BARU
    // - Nilai discount dikirim dari field name="discount"
    // - Konversi ke angka agar aman dipakai dalam perhitungan
    // - Tidak mengizinkan discount negatif
    // ============================================================
    $discount = max(0, rupiah_to_number($_POST['discount'] ?? '0'));

    $deskripsi = $_POST['deskripsi'] ?? [];
    $qty = $_POST['qty'] ?? [];
    $harga = $_POST['harga'] ?? [];
    $subtotal = $_POST['subtotal'] ?? [];

    // ============================================================
    // HITUNG TOTAL SERVER-SIDE
    // $total_bruto = jumlah seluruh subtotal item sebelum discount
    // $total       = nilai akhir setelah dikurangi discount
    // ============================================================
    $total_bruto = 0;
    $items = [];
    for ($i=0; $i<count($deskripsi); $i++) {
        $d = trim($deskripsi[$i] ?? '');
        if ($d === '') continue;
        $q = max(1, (int)($qty[$i] ?? 0));
        $h = rupiah_to_number($harga[$i] ?? '0');
        $sub = $q * $h;
        $total_bruto += $sub;
        $items[] = [$d, $q, $h, $sub];
    }
    if (empty($items)) {
        die("Item tidak boleh kosong. <a href='kwitansi_form.php'>Kembali</a>");
    }

    // Nilai akhir tidak boleh minus walaupun discount lebih besar dari bruto
    $total = max(0, $total_bruto - $discount);

    // VALIDASI WAJIB: transaksi dengan total Rp 0 tidak boleh disimpan
    if ($total <= 0) {
        die("<script>
            alert('Total transaksi tidak boleh Rp 0. Silakan isi harga/nominal transaksi terlebih dahulu.');
            window.history.back();
        </script>");
    }

    // generate no kwitansi: KWT/9/2025/00001
    $bulan = date('n', strtotime($tanggal));
    $tahun = date('Y', strtotime($tanggal));

    $sql_last = "SELECT no_kwitansi FROM kwitansi
                 WHERE no_kwitansi LIKE CONCAT('KWT/', ?, '/', ?, '/%')
                 ORDER BY no_kwitansi DESC LIMIT 1";
    $stmt = $conn->prepare($sql_last);
    $stmt->bind_param("ss", $bulan, $tahun);
    $stmt->execute();
    $res = $stmt->get_result();
    $last = 0;
    if ($row = $res->fetch_assoc()) {
        $parts = explode('/', $row['no_kwitansi']);
        $last = (int) end($parts);
    }
    $stmt->close();
    $next = $last + 1;
    $nomor_urut = str_pad($next, 5, "0", STR_PAD_LEFT);
    $no_kwitansi = "KWT/$bulan/$tahun/$nomor_urut";

    // ============================================================
    // INSERT HEADER KWITANSI
    // Simpan discount dan total akhir langsung saat kwitansi dibuat
    // ============================================================
    $stmt = $conn->prepare(
        "INSERT INTO kwitansi
        (no_kwitansi, tanggal, nama_pelanggan, alamat_pelanggan, catatan, status_bayar, discount, total)
        VALUES (?,?,?,?,?,?,?,?)"
    );
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
    $stmt->execute();
    $kwitansi_id = $stmt->insert_id;
    $stmt->close();

    // insert items
    $stmt = $conn->prepare("INSERT INTO kwitansi_item (kwitansi_id, deskripsi, qty, harga, subtotal) VALUES (?,?,?,?,?)");
    foreach ($items as $it) {
        [$d,$q,$h,$s] = $it;
        $stmt->bind_param("isidd", $kwitansi_id, $d, $q, $h, $s);
        $stmt->execute();
    }
    $stmt->close();

    header("Location: kwitansi_print.php?id=" . $kwitansi_id);
    exit;
} else {
    header("Location: kwitansi_form.php");
    exit;
}