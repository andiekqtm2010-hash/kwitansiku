<?php
require_once "db.php";
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
function num($v) {
  $v=trim((string)$v);
  // Form input number memakai angka polos; format lama "55.000" tetap diterima.
  if (preg_match('/^-?\\d+([.]\\d{1,2})?$/', $v)) return (float)$v;
  return (float)str_replace(['.',',',' '], '', $v);
}
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {header('Location: index.php');exit;}
$id=(int)($_POST['id']??0);
if($id<=0)die('ID tidak valid.');
$tanggal=$_POST['tanggal']??'';
$nama=mb_strtoupper(trim($_POST['nama_pelanggan']??''),'UTF-8');
$alamat=mb_strtoupper(trim($_POST['alamat_pelanggan']??''),'UTF-8');
$catatan=trim($_POST['catatan']??'');
$status=$_POST['status_bayar']??'';
if(!in_array($status,['Lunas','Piutang'],true))die('Status pembayaran tidak valid.');
if(!preg_match('/^\\d{4}-\\d{2}-\\d{2}$/',$tanggal))die('Tanggal tidak valid.');
$deskripsi=$_POST['deskripsi']??[];
$qty=$_POST['qty']??[];
$hpp=$_POST['hpp']??[];
$harga=$_POST['harga']??[];
if(!is_array($deskripsi)||!is_array($qty)||!is_array($hpp)||!is_array($harga))die('Format item tidak valid.');
if(count($deskripsi)!==count($qty)||count($deskripsi)!==count($hpp)||count($deskripsi)!==count($harga))die('Data item tidak lengkap. HPP tidak boleh hilang.');
$items=[];$bruto=0;
foreach($deskripsi as $i=>$d){
  $d=trim((string)$d);
  if($d==='')continue;
  $q=(int)$qty[$i];$cost=num($hpp[$i]);$price=num($harga[$i]);
  if($q<1||$cost<0||$price<0)die('Qty, HPP, atau harga tidak valid.');
  $sub=$q*$price;$profitUnit=$price-$cost;$profitTotal=$q*$profitUnit;
  $items[]=[$d,$q,$cost,$price,$profitUnit,$sub,$profitTotal];
  $bruto+=$sub;
}
if(!$items)die('Item tidak boleh kosong.');
$discount=num($_POST['discount']??0);
if($discount<0||$discount>$bruto)die('Diskon tidak valid.');
$total=$bruto-$discount;
if($total<=0)die('Total transaksi tidak boleh Rp 0.');
try{
 $conn->begin_transaction();
 $check=$conn->prepare('SELECT id FROM kwitansi WHERE id=? FOR UPDATE');
 $check->bind_param('i',$id);$check->execute();
 if(!$check->get_result()->fetch_assoc())throw new Exception('Kwitansi tidak ditemukan.');
 $check->close();
 $head=$conn->prepare('UPDATE kwitansi SET tanggal=?, nama_pelanggan=?, alamat_pelanggan=?, catatan=?, status_bayar=?, discount=?, total=? WHERE id=?');
 $head->bind_param('sssssddi',$tanggal,$nama,$alamat,$catatan,$status,$discount,$total,$id);
 $head->execute();$head->close();
 // Semua kolom laba disimpan ulang secara konsisten dan atomik.
 $del=$conn->prepare('DELETE FROM kwitansi_item WHERE kwitansi_id=?');
 $del->bind_param('i',$id);$del->execute();$del->close();
 $ins=$conn->prepare('INSERT INTO kwitansi_item (kwitansi_id,deskripsi,qty,hpp,harga,laba_satuan,subtotal,total_laba) VALUES (?,?,?,?,?,?,?,?)');
 foreach($items as [$d,$q,$cost,$price,$profitUnit,$sub,$profitTotal]){
  $ins->bind_param('isiddddd',$id,$d,$q,$cost,$price,$profitUnit,$sub,$profitTotal);
  $ins->execute();
 }
 $ins->close();
 $conn->commit();
 $tujuan = ($_POST['aksi_simpan'] ?? 'cetak') === 'update' ? 'list_kwitansi.php' : 'kwitansi_print.php?id='.$id;
 header('Location: '.$tujuan);exit;
}catch(Throwable $e){
 $conn->rollback();
 http_response_code(500);
 die('Gagal menyimpan perubahan. Data lama tidak dihapus. Detail: '.htmlspecialchars($e->getMessage(),ENT_QUOTES,'UTF-8'));
}
