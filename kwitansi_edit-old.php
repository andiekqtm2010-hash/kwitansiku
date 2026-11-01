<?php
require_once "db.php";

/**
 * Ambil parameter id dari query string, default 0.
 * (int) untuk memastikan tipe integer (hindari SQL injection sederhana)
 */
$id = (int)($_GET['id'] ?? 0);

/** =======================
 *  Query Header Kwitansi
 *  =======================
 *  - Gunakan prepared statement untuk aman dari SQL injection
 *  - Ambil satu baris header kwitansi berdasarkan id
 */
$stmt = $conn->prepare("SELECT * FROM kwitansi WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$head = $stmt->get_result()->fetch_assoc();
$stmt->close();

if (!$head) { 
  // Jika data tidak ditemukan, hentikan eksekusi.
  die("Data kwitansi tidak ditemukan."); 
}

/** ======================
 *  Query Detail Item
 *  ======================
 *  - Ambil semua item yang terkait dengan kwitansi
 *  - Simpan ke array $items untuk dipakai di tampilan
 */
$stmt = $conn->prepare("SELECT * FROM kwitansi_item WHERE kwitansi_id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$resItems = $stmt->get_result();
$items = $resItems->fetch_all(MYSQLI_ASSOC);
$stmt->close();

/** 
 * Simpan status bayar saat ini untuk memudahkan set <option selected>
 */
$status_now = trim($head['status_bayar'] ?? '');

?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<title>Edit Kwitansi - <?= htmlspecialchars($head['no_kwitansi']) ?></title>

<!-- Bootstrap CSS untuk styling cepat -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
  /* Sedikit styling agar input nyaman dilihat */
  .table-items textarea { min-width: 220px; }
  .table-items input { min-width: 0; }\n  .table-items textarea { width:100%; }
  .desc-td { min-width: 260px; }

  /* ===== Persistent Mugnesia Sidebar Layout ===== */
  body{margin:0 !important;padding:0 !important;background:#f4f7fb;}
  .mug-app{min-height:100vh;display:flex;}
  .mug-sidebar{
      width:260px;background:linear-gradient(180deg,#0f172a,#172554);color:#fff;
      position:fixed;inset:0 auto 0 0;padding:22px 16px;overflow-y:auto;z-index:1000;
  }
  .mug-brand{padding:4px 10px 22px;border-bottom:1px solid rgba(255,255,255,.12);margin-bottom:18px}
  .mug-brand-title{font-size:22px;font-weight:800;letter-spacing:.2px}
  .mug-brand-sub{font-size:12px;color:#cbd5e1;margin-top:4px}
  .mug-nav-section{font-size:10px;font-weight:800;letter-spacing:1.2px;color:#94a3b8;padding:14px 12px 7px}
  .mug-side-link{display:flex;align-items:center;gap:11px;color:#dbeafe;text-decoration:none;padding:11px 12px;border-radius:10px;margin:3px 0;font-size:14px;font-weight:600}
  .mug-side-link i{font-size:17px;width:20px;text-align:center}
  .mug-side-link:hover,.mug-side-link.active{background:rgba(255,255,255,.12);color:#fff}
  .mug-side-link.active{box-shadow:inset 3px 0 0 #60a5fa}
  .mug-main{margin-left:260px;width:calc(100% - 260px);min-height:100vh;padding:24px 28px;}
  @media(max-width:900px){
    .mug-sidebar{width:78px;padding:20px 10px}
    .mug-brand-title,.mug-brand-sub,.mug-side-link span,.mug-nav-section{display:none}
    .mug-side-link{justify-content:center}.mug-side-link i{font-size:20px}
    .mug-main{margin-left:78px;width:calc(100% - 78px);padding:18px}
  }

</style>
</head>
<body class="bg-light">
<div class="mug-app">
<?php require __DIR__ . '/layout/sidebar.php'; ?>
<main class="mug-main">
<div class="container-fluid py-2">

  <!-- Header navigasi sederhana -->
  <div class="d-flex justify-content-between align-items-center mb-3">
    <a href="list_kwitansi.php" class="btn btn-link">&larr; Kembali ke Daftar Kwitansi</a>
    <div class="text-muted">
      No. Kwitansi: <strong><?= htmlspecialchars($head['no_kwitansi']) ?></strong>
    </div>
  </div>

  <h3>Edit Kwitansi</h3>

  <!-- 
    Form utama untuk update kwitansi.
    - action mengarah ke update_kwitansi.php (proses simpan)
    - method POST
  -->
  <form action="update_kwitansi.php" method="post" id="formKwitansi">
    <!-- Hidden id untuk identifikasi record saat submit -->
    <input type="hidden" name="id" value="<?= (int)$head['id'] ?>">

    <div class="row g-3">
      <!-- Field tanggal -->
      <div class="col-md-4">
        <label class="form-label">Tanggal</label>
        <input type="date" class="form-control" name="tanggal"
               value="<?= htmlspecialchars($head['tanggal'] ?? '') ?>" required>
      </div>

      <!-- Field nama pelanggan -->
      <div class="col-md-4">
        <label class="form-label">Nama Pelanggan</label>
        <input type="text" class="form-control" name="nama_pelanggan"
               value="<?= htmlspecialchars($head['nama_pelanggan'] ?: 'Pelanggan') ?>">
      </div>

      <!-- Field alamat pelanggan -->
      <div class="col-md-4">
        <label class="form-label">Alamat Pelanggan</label>
        <input type="text" class="form-control" name="alamat_pelanggan"
               value="<?= htmlspecialchars($head['alamat_pelanggan'] ?: 'Kemangsen Selatan') ?>">
      </div>

      <!-- Dropdown Status: konsisten pakai "Lunas" & "Piutang" -->
      <div class="col-md-4">
        <label class="form-label">Status</label>
        <select class="form-select" name="status_bayar" required>
          <option value="Lunas"   <?= $status_now === 'Lunas'   ? 'selected' : '' ?>>Lunas</option>
          <option value="Piutang" <?= $status_now === 'Piutang' ? 'selected' : '' ?>>Piutang</option>
        </select>
      </div>

      <!-- Field catatan bebas -->
      <div class="col-12">
        <label class="form-label">Catatan</label>
        <textarea class="form-control" name="catatan" rows="2"><?= htmlspecialchars($head['catatan'] ?? '') ?></textarea>
      </div>
    </div>

    <div class="card mt-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <strong>Item Penjualan</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="addRow()">+ Tambah Baris</button>
      </div>
      <div class="table-responsive">
        <table class="table table-items mb-0 align-middle" id="itemsTable" style="min-width:1100px;table-layout:fixed">
          <colgroup><col style="width:34%"><col style="width:7%"><col style="width:11%"><col style="width:12%"><col style="width:11%"><col style="width:11%"><col style="width:11%"><col style="width:3%"></colgroup>
          <thead class="table-light"><tr>
            <th>Deskripsi</th><th>Qty</th><th>HPP/Unit</th><th>Harga Jual/Unit</th><th>Laba/Unit</th><th>Subtotal</th><th>Total Laba</th><th></th>
          </tr></thead>
          <tbody id="itemsBody">
          <?php foreach ($items as $it): ?>
          <tr>
            <td><textarea name="deskripsi[]" class="form-control deskripsi" rows="2" required><?= htmlspecialchars($it['deskripsi'], ENT_QUOTES, 'UTF-8') ?></textarea></td>
            <td><input name="qty[]" type="number" min="1" step="1" class="form-control text-end qty" value="<?= (int)$it['qty'] ?>" required></td>
            <td><input name="hpp[]" type="number" min="0" step="1" class="form-control text-end hpp" value="<?= htmlspecialchars((string)($it['hpp'] ?? 0)) ?>" required></td>
            <td><input name="harga[]" type="number" min="0" step="1" class="form-control text-end harga" value="<?= htmlspecialchars((string)$it['harga']) ?>" required></td>
            <td><input class="form-control text-end laba-satuan" readonly tabindex="-1"></td>
            <td><input class="form-control text-end subtotal" readonly tabindex="-1"></td>
            <td><input class="form-control text-end total-laba" readonly tabindex="-1"></td>
            <td><button type="button" class="btn btn-sm btn-outline-danger" onclick="this.closest('tr').remove();hitung()" tabindex="-1">Hapus</button></td>
          </tr>
          <?php endforeach; ?>
          </tbody>
          <tfoot>
            <tr><th colspan="6" class="text-end">Total HPP</th><th><input id="total_hpp" class="form-control text-end" readonly></th><th></th></tr>
            <tr><th colspan="6" class="text-end">Laba Kotor</th><th><input id="laba_kotor" class="form-control text-end" readonly></th><th></th></tr>
            <tr><th colspan="6" class="text-end">Discount</th><th><input type="number" min="0" step="1" name="discount" id="discount" class="form-control text-end" value="<?= htmlspecialchars((string)($head['discount'] ?? 0)) ?>"></th><th></th></tr>
            <tr><th colspan="6" class="text-end">Total Penjualan</th><th><input id="total" class="form-control text-end fw-bold" readonly></th><th></th></tr>
            <tr><th colspan="6" class="text-end">Laba Setelah Diskon</th><th><input id="laba_bersih" class="form-control text-end fw-bold" readonly></th><th></th></tr>
          </tfoot>
        </table>
      </div>
    </div>
    <div class="mt-3 d-flex gap-2">
      <button type="submit" name="aksi_simpan" value="update" class="btn btn-success">Update</button>
      <button type="submit" name="aksi_simpan" value="cetak" class="btn btn-primary">Update &amp; Cetak</button>
      <a href="kwitansi_print.php?id=<?= (int)$head['id'] ?>" target="_blank" class="btn btn-outline-secondary">Lihat Print</a>
    </div>
  </form>
</div>

<!-- ========================
     JavaScript Section
     ========================
     Catatan:
     - Semua fungsi dibuat modular dan diberi komentar
     - Event listener dipasang setelah DOM siap (DOMContentLoaded)
-->
<script>
const fmt=n=>(Number(n)||0).toLocaleString('id-ID');
function addRow(){
  const tr=document.createElement('tr');
  tr.innerHTML=`<td><textarea name="deskripsi[]" class="form-control deskripsi" rows="2" required></textarea></td>
  <td><input name="qty[]" type="number" min="1" step="1" value="1" class="form-control text-end qty" required></td>
  <td><input name="hpp[]" type="number" min="0" step="1" value="0" class="form-control text-end hpp" required></td>
  <td><input name="harga[]" type="number" min="0" step="1" value="0" class="form-control text-end harga" required></td>
  <td><input class="form-control text-end laba-satuan" readonly tabindex="-1"></td>
  <td><input class="form-control text-end subtotal" readonly tabindex="-1"></td>
  <td><input class="form-control text-end total-laba" readonly tabindex="-1"></td>
  <td><button type="button" class="btn btn-sm btn-outline-danger" onclick="this.closest('tr').remove();hitung()" tabindex="-1">Hapus</button></td>`;
  document.getElementById('itemsBody').appendChild(tr);
  hitung();
}
function hitung(){
 let bruto=0,hppTotal=0,labaTotal=0;
 document.querySelectorAll('#itemsBody tr').forEach(tr=>{
  const q=Number(tr.querySelector('.qty').value)||0;
  const hpp=Number(tr.querySelector('.hpp').value)||0;
  const harga=Number(tr.querySelector('.harga').value)||0;
  const laba=harga-hpp,subtotal=q*harga,totalLaba=q*laba;
  tr.querySelector('.laba-satuan').value=fmt(laba);
  tr.querySelector('.subtotal').value=fmt(subtotal);
  tr.querySelector('.total-laba').value=fmt(totalLaba);
  bruto+=subtotal;hppTotal+=q*hpp;labaTotal+=totalLaba;
 });
 const disc=Number(document.getElementById('discount').value)||0;
 document.getElementById('total_hpp').value=fmt(hppTotal);
 document.getElementById('laba_kotor').value=fmt(labaTotal);
 document.getElementById('total').value=fmt(bruto-disc);
 document.getElementById('laba_bersih').value=fmt(labaTotal-disc);
}
document.addEventListener('DOMContentLoaded',()=>{
 if(!document.querySelector('#itemsBody tr'))addRow();
 document.getElementById('itemsBody').addEventListener('input',e=>{
  if(e.target.matches('.qty,.hpp,.harga'))hitung();
 });
 document.getElementById('discount').addEventListener('input',hitung);
 ['nama_pelanggan','alamat_pelanggan'].forEach(name=>{
  const el=document.querySelector('[name="'+name+'"]');
  el.addEventListener('input',()=>{const a=el.selectionStart,b=el.selectionEnd;el.value=el.value.toLocaleUpperCase('id-ID');el.setSelectionRange(a,b);});
 });
 document.getElementById('formKwitansi').addEventListener('submit',e=>{
  hitung();
  if(!document.querySelector('#itemsBody tr') || Number(document.getElementById('total').value.replace(/\\./g,''))<=0){
   e.preventDefault();alert('Total transaksi tidak boleh Rp 0. Isi harga transaksi terlebih dahulu.');
  }
 });
 hitung();
});
</script>
</main>
</div>
</body>
</html>