<?php
require_once "db.php";

function rupiah_to_number($s) {
  $s = str_replace(['.',',',' '], '', $s);
  return (float)$s;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  header("Location: index.php");
  exit;
}

$id = (int)($_POST['id'] ?? 0);
if ($id <= 0) { die("ID tidak valid."); }

// Ambil data form
$tanggal = $_POST['tanggal'] ?? date('Y-m-d');
$nama    = trim($_POST['nama_pelanggan'] ?? '');
$alamat  = trim($_POST['alamat_pelanggan'] ?? '');
$catatan = trim($_POST['catatan'] ?? '');
$status_bayar=trim($_POST['status_bayar'] ?? '');

// Array item
$deskripsi = $_POST['deskripsi'] ?? [];
$qty       = $_POST['qty'] ?? [];
$harga     = $_POST['harga'] ?? [];

// Hitung ulang total & bentuk array item valid
$items = [];
$total = 0;
for ($i=0; $i<count($deskripsi); $i++) {
  $d = trim($deskripsi[$i] ?? '');
  if ($d === '') continue;
  $q = max(1, (int)($qty[$i] ?? 0));
  $h = rupiah_to_number($harga[$i] ?? '0');
  $s = $q * $h;
  $total += $s;
  $items[] = [$d, $q, $h, $s];
}
if (empty($items)) {
  die("Item tidak boleh kosong. <a href='kwitansi_edit.php?id=".$id."'>Kembali</a>");
}

// Update header (no_kwitansi tidak diubah)
$stmt = $conn->prepare("UPDATE kwitansi SET tanggal=?, nama_pelanggan=?, alamat_pelanggan=?, catatan=?,status_bayar=?, total=? WHERE id=?");
$stmt->bind_param("sssssdi", $tanggal, $nama, $alamat, $catatan, $status_bayar, $total, $id);
$stmt->execute();
$stmt->close();

// Hapus item lama & insert baru (lebih simpel & aman)
$stmtDel = $conn->prepare("DELETE FROM kwitansi_item WHERE kwitansi_id=?");
$stmtDel->bind_param("i", $id);
$stmtDel->execute();
$stmtDel->close();

$stmtIns = $conn->prepare("INSERT INTO kwitansi_item (kwitansi_id, deskripsi, qty, harga, subtotal) VALUES (?,?,?,?,?)");
foreach ($items as $it) {
  [$d,$q,$h,$s] = $it;
  $stmtIns->bind_param("isidd", $id, $d, $q, $h, $s);
  $stmtIns->execute();
}
$stmtIns->close();

// Selesai -> ke halaman print
header("Location: kwitansi_print.php?id=".$id);
exit;