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
    $status_bayar=trim($_POST['status_bayar'] ?? '');

    $deskripsi = $_POST['deskripsi'] ?? [];
    $qty = $_POST['qty'] ?? [];
    $harga = $_POST['harga'] ?? [];
    $subtotal = $_POST['subtotal'] ?? [];

    // hitung total server-side
    $total = 0;
    $items = [];
    for ($i=0; $i<count($deskripsi); $i++) {
        $d = trim($deskripsi[$i] ?? '');
        if ($d === '') continue;
        $q = max(1, (int)($qty[$i] ?? 0));
        $h = rupiah_to_number($harga[$i] ?? '0');
        $sub = $q * $h;
        $total += $sub;
        $items[] = [$d, $q, $h, $sub];
    }
    if (empty($items)) {
        die("Item tidak boleh kosong. <a href='kwitansi_form.php'>Kembali</a>");
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

    // insert header
    $stmt = $conn->prepare("INSERT INTO kwitansi (no_kwitansi, tanggal, nama_pelanggan, alamat_pelanggan, catatan, status_bayar, total ) VALUES (?,?,?,?,?,?,?)");
    $stmt->bind_param("ssssssd", $no_kwitansi, $tanggal, $nama, $alamat, $catatan, $status_bayar, $total );
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