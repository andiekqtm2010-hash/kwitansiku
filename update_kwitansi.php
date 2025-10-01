<?php
require_once "db.php"; // Koneksi ($conn)

/**
 * rupiah_to_number
 * ----------------
 * Ubah string rupiah jadi angka:
 * - Hapus titik, koma, dan spasi.
 * - "1.250,00" -> "125000" -> 125000.0
 * Catatan: ini menghapus desimal. Jika butuh 2 desimal, pakai parser lokal khusus.
 */
function rupiah_to_number($s) {
  $s = str_replace(['.',',',' '], '', $s);
  return (float)$s;
}

// Hanya izinkan POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
  header("Location: index.php");
  exit;
}

// Ambil ID kwitansi (wajib)
$id = (int)($_POST['id'] ?? 0);
if ($id <= 0) { die("ID tidak valid."); }

// ================== Ambil data HEADER ==================
$tanggal       = $_POST['tanggal'] ?? date('Y-m-d');          // Tanggal transaksi
$nama          = trim($_POST['nama_pelanggan'] ?? '');        // Nama pelanggan
$alamat        = trim($_POST['alamat_pelanggan'] ?? '');      // Alamat pelanggan
$catatan       = trim($_POST['catatan'] ?? '');               // Catatan
$status_bayar  = trim($_POST['status_bayar'] ?? '');          // Status bayar
$discount_hdr  = rupiah_to_number($_POST['discount'] ?? '0'); // Diskon header (nominal)

// ================== Ambil data DETAIL (items) ==================
$deskripsi = $_POST['deskripsi'] ?? []; // array deskripsi per baris
$qty       = $_POST['qty'] ?? [];       // array qty per baris
$harga     = $_POST['harga'] ?? [];     // array harga per baris

// ================== Hitung total ==================
// total_bruto = jumlah semua (qty * harga) per baris
$items = [];        // akan diinsert ulang ke kwitansi_item
$total_bruto = 0.0; // total sebelum diskon

for ($i = 0; $i < count($deskripsi); $i++) {
  $d = trim($deskripsi[$i] ?? '');
  if ($d === '') continue; // skip baris kosong

  // qty minimal 1
  $q = max(1, (int)($qty[$i] ?? 0));

  // harga satuan -> angka
  $h = rupiah_to_number($harga[$i] ?? '0');

  // subtotal baris
  $s = $q * $h;

  $total_bruto += $s;
  $items[] = [$d, $q, $h, $s];
}

// Validasi: harus ada minimal 1 item
if (empty($items)) {
  die("Item tidak boleh kosong. <a href='kwitansi_edit.php?id=".$id."'>Kembali</a>");
}

// Pastikan diskon tidak melebihi total_bruto & tidak negatif
$discount_hdr = max(0, min($discount_hdr, $total_bruto));

// total_netto = total_bruto - discount (disimpan ke kolom `total`)
$total_netto = $total_bruto - $discount_hdr;

// ================== Update header kwitansi ==================
// Catatan: no_kwitansi tidak diubah di sini
$stmt = $conn->prepare("
  UPDATE kwitansi
     SET tanggal = ?,
         nama_pelanggan = ?,
         alamat_pelanggan = ?,
         catatan = ?,
         status_bayar = ?,
         discount = ?,     -- simpan diskon nominal (grand total discount)
         total = ?         -- simpan total setelah diskon (netto)
   WHERE id = ?
");
$stmt->bind_param(
  "sssssddi",
  $tanggal,
  $nama,
  $alamat,
  $catatan,
  $status_bayar,
  $discount_hdr,  // d
  $total_netto,   // d
  $id             // i
);
$stmt->execute();
$stmt->close();

// ================== Refresh detail: hapus lama, insert baru ==================
$stmtDel = $conn->prepare("DELETE FROM kwitansi_item WHERE kwitansi_id = ?");
$stmtDel->bind_param("i", $id);
$stmtDel->execute();
$stmtDel->close();

$stmtIns = $conn->prepare("
  INSERT INTO kwitansi_item (kwitansi_id, deskripsi, qty, harga, subtotal)
  VALUES (?,?,?,?,?)
");
foreach ($items as [$d, $q, $h, $s]) {
  $stmtIns->bind_param("isidd", $id, $d, $q, $h, $s);
  $stmtIns->execute();
}
$stmtIns->close();

// ================== Selesai -> ke halaman print ==================
header("Location: kwitansi_print.php?id=".$id);
exit;
