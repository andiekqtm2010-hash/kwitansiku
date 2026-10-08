<?php
require_once 'db.php';
function rupiah_to_number($value): float {
    return (float)str_replace([',', '.', ' '], '', (string)$value);
}
function gagal_simpan(string $pesan): void {
    http_response_code(422);
    echo '<!doctype html><html lang="id"><meta charset="utf-8"><title>Gagal menyimpan</title>';
    echo '<script>alert(' . json_encode($pesan, JSON_HEX_TAG|JSON_HEX_AMP|JSON_HEX_APOS|JSON_HEX_QUOT) . ');history.back();</script>';
    echo '<p>' . htmlspecialchars($pesan, ENT_QUOTES, 'UTF-8') . ' <a href="kwitansi_form.php">Kembali</a></p>';
    exit;
}
if ($_SERVER['REQUEST_METHOD'] !== 'POST') { header('Location: kwitansi_form.php'); exit; }
$tanggal = $_POST['tanggal'] ?? date('Y-m-d');
$dt = DateTimeImmutable::createFromFormat('!Y-m-d', $tanggal);
if (!$dt || $dt->format('Y-m-d') !== $tanggal) gagal_simpan('Tanggal tidak valid.');
$nama = trim((string)($_POST['nama_pelanggan'] ?? '')) ?: 'END USER';
$alamat = trim((string)($_POST['alamat_pelanggan'] ?? '')) ?: 'KEMANGSEN';
$catatan = trim((string)($_POST['catatan'] ?? ''));
$status = (string)($_POST['status_bayar'] ?? 'Lunas');
if (!in_array($status, ['Lunas','Piutang'], true)) gagal_simpan('Status pembayaran tidak valid.');
$discount = max(0, rupiah_to_number($_POST['discount'] ?? '0'));
$deskripsi = $_POST['deskripsi'] ?? [];
$qty = $_POST['qty'] ?? [];
$harga = $_POST['harga'] ?? [];
$hpp = $_POST['hpp'] ?? [];
if (!is_array($deskripsi) || !is_array($qty) || !is_array($harga) || !is_array($hpp)) gagal_simpan('Data item tidak valid.');
$items=[]; $bruto=0;
foreach($deskripsi as $i=>$d){
    $d=trim((string)$d);
    if ($d==='') continue;
    $q=(int)($qty[$i] ?? 0);
    $h=rupiah_to_number($harga[$i] ?? '0');
    $cost=rupiah_to_number($hpp[$i] ?? '0');
    if($q<1 || $h<0 || $cost<0 || !is_finite($h) || !is_finite($cost)) gagal_simpan('Qty, harga jual, dan HPP harus bernilai valid dan tidak negatif.');
    $sub=$q*$h;
    $labaSatuan=$h-$cost;
    $totalLaba=$q*$labaSatuan;
    $bruto+=$sub;
    $items[]=[$d,$q,$cost,$h,$labaSatuan,$sub,$totalLaba];
}
if(!$items) gagal_simpan('Item penjualan tidak boleh kosong.');
$total=max(0,$bruto-$discount);
if($total<=0) gagal_simpan('Total transaksi tidak boleh Rp 0. Silakan isi harga/nominal transaksi terlebih dahulu.');
$aksi=($_POST['aksi_simpan'] ?? 'saja')==='cetak'?'cetak':'saja';

try {
    $conn->begin_transaction();
    $bulan=(int)$dt->format('n'); $tahun=(int)$dt->format('Y');
    // Kunci baris header selama transaksi untuk meminimalkan benturan nomor.
    $stmt=$conn->prepare("SELECT no_kwitansi FROM kwitansi WHERE no_kwitansi LIKE CONCAT('KWT/', ?, '/', ?, '/%') ORDER BY no_kwitansi DESC LIMIT 1 FOR UPDATE");
    $stmt->bind_param('ss',$bulan,$tahun);$stmt->execute();
    $lastRow=$stmt->get_result()->fetch_assoc();$stmt->close();
    $last=0;
    if($lastRow){$parts=explode('/',$lastRow['no_kwitansi']);$last=(int)end($parts);}
    $nomor='KWT/'.$bulan.'/'.$tahun.'/'.str_pad((string)($last+1),5,'0',STR_PAD_LEFT);
    $stmt=$conn->prepare('INSERT INTO kwitansi (no_kwitansi,tanggal,nama_pelanggan,alamat_pelanggan,catatan,status_bayar,discount,total) VALUES (?,?,?,?,?,?,?,?)');
    $stmt->bind_param('ssssssdd',$nomor,$tanggal,$nama,$alamat,$catatan,$status,$discount,$total);
    $stmt->execute();$id=$stmt->insert_id;$stmt->close();
    $stmt=$conn->prepare('INSERT INTO kwitansi_item (kwitansi_id,deskripsi,qty,hpp,harga,laba_satuan,subtotal,total_laba) VALUES (?,?,?,?,?,?,?,?)');
    foreach($items as $it){
        [$d,$q,$cost,$h,$labaSatuan,$sub,$totalLaba]=$it;
        $stmt->bind_param('isiddddd',$id,$d,$q,$cost,$h,$labaSatuan,$sub,$totalLaba);
        $stmt->execute();
    }
    $stmt->close();$conn->commit();
} catch(Throwable $e) {
    $conn->rollback();
    error_log('Gagal menyimpan kwitansi: '.$e->getMessage());
    gagal_simpan('Gagal menyimpan transaksi. Pastikan kolom HPP dan laba sudah ditambahkan melalui SQL upgrade.');
}
if($aksi==='cetak'){
    header('Location: kwitansi_print.php?id='.$id);
} else {
    header('Location: kwitansi_form.php?saved=1&no='.rawurlencode($nomor));
}
exit;
