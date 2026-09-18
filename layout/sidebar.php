<?php
$current_page = basename($_SERVER['PHP_SELF'] ?? '');
function mug_active($file, $current_page) { return $current_page === $file ? ' active' : ''; }
?>
<aside class="mug-sidebar">
  <div class="mug-brand">
    <div class="mug-brand-title">MUGNESIA</div>
    <div class="mug-brand-sub">Counter &amp; Payment System</div>
  </div>
  <a class="mug-side-link<?= mug_active('index.php',$current_page) ?>" href="index.php"><i class="bi bi-grid-1x2-fill"></i><span>Dashboard</span></a>
  <div class="mug-nav-section">TRANSAKSI</div>
  <a class="mug-side-link<?= mug_active('list_kwitansi.php',$current_page) ?>" href="list_kwitansi.php"><i class="bi bi-receipt"></i><span>Daftar Kwitansi</span></a>
  <a class="mug-side-link<?= mug_active('kwitansi_form.php',$current_page) ?>" href="kwitansi_form.php"><i class="bi bi-plus-square"></i><span>Buat Kwitansi</span></a>
  <div class="mug-nav-section">LAYANAN</div>
  <a class="mug-side-link<?= mug_active('input_tagihan.php',$current_page) ?>" href="input_tagihan.php"><i class="bi bi-lightning-charge"></i><span>Input PLN Pasca</span></a>
  <a class="mug-side-link<?= mug_active('list_tagihan.php',$current_page) ?>" href="list_tagihan.php"><i class="bi bi-list-check"></i><span>List PLN Pasca</span></a>
  <a class="mug-side-link<?= mug_active('input_bpjs.php',$current_page) ?>" href="input_bpjs.php"><i class="bi bi-heart-pulse"></i><span>Input BPJS</span></a>
  <a class="mug-side-link<?= mug_active('list_bpjs.php',$current_page) ?>" href="list_bpjs.php"><i class="bi bi-card-list"></i><span>List BPJS</span></a>
  <div class="mug-nav-section">LAPORAN</div>
  <a class="mug-side-link<?= mug_active('laporan_penjualan.php',$current_page) ?>" href="laporan_penjualan.php"><i class="bi bi-bar-chart-line"></i><span>Dashboard Penjualan</span></a>
</aside>
