<?php
require_once "db.php";
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<title>Buat Kwitansi - Mugnesia</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
  /* Kolom deskripsi diprioritaskan; kolom angka dibuat ringkas */
  .table-items { width:100%; table-layout:fixed; min-width:990px; }
  .table-items th, .table-items td { padding:8px 5px; vertical-align:middle; }
  .table-items input { width:100%; min-width:0; padding:6px 7px; font-size:13px; }
  .table-items th { font-size:12px; line-height:1.25; white-space:normal; }
  .table-items .deskripsi { font-size:14px; }
  .table-items td:last-child { text-align:center; }
  .table-items td:last-child button { padding:5px 7px; font-size:12px; }
  #nama_pelanggan { text-transform:uppercase; }
  .table-items .readonly-value {background:#f1f5f9;}
  .table-items .profit-negative {color:#dc3545;font-weight:700;}
  .table-items .profit-positive {color:#198754;font-weight:700;}
</style>
<style>
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
.mug-main > .container,.mug-main > .container-fluid{max-width:100%;}
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

<div class="container-fluid py-3">
  <a href="list_kwitansi.php" class="btn btn-link">&larr; Kembali</a>
  <h3>Buat Kwitansi</h3>
  <?php if (isset($_GET['saved']) && $_GET['saved'] === '1'): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
    <i class="bi bi-check-circle-fill me-1"></i> Kwitansi <strong><?= htmlspecialchars($_GET['no'] ?? '', ENT_QUOTES, 'UTF-8') ?></strong> berhasil disimpan. Form siap untuk transaksi berikutnya.
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Tutup"></button>
  </div>
  <?php endif; ?>
  <form action="save_kwitansi.php" method="post" id="formKwitansi">
    <input type="hidden" name="aksi_simpan" value="saja">
    <div class="row g-3">
      <div class="col-md-4">
        <label class="form-label">Tanggal</label>
        <input type="date" class="form-control" name="tanggal" value="<?=date('Y-m-d')?>" required>
      </div>
      <div class="col-md-4">
        <label class="form-label">Nama Pelanggan</label>
        <input type="text" class="form-control" name="nama_pelanggan" id="nama_pelanggan" value="END USER" placeholder="Nama pelanggan (opsional)">
      </div>
      <div class="col-md-4">
        <label class="form-label">Alamat Pelanggan</label>
        <input type="text" class="form-control" name="alamat_pelanggan" value="KEMANGSEN" placeholder="Alamat (opsional)">
      </div>

      <!-- === Tambahan: Dropdown Status === -->
      <div class="col-md-4">
          <label class="form-label">Status</label>
          <select class="form-select" name="status_bayar" required>
            <option value="Lunas" selected>Lunas</option>
            <option value="Piutang">Piutang</option>
          </select>
        </div>
      <!-- === End Tambahan === -->

      <div class="col-12">
        <label class="form-label">Catatan</label>
        <textarea class="form-control" name="catatan" rows="2" placeholder="Catatan di kwitansi (opsional)"></textarea>
      </div>
    </div>
    <div class="card mt-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <strong>Item Penjualan</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="addRow()">+ Tambah Baris</button>
      </div>
      <div class="table-responsive">
        <table class="table table-items mb-0 align-middle" id="itemsTable">
          <colgroup>
            <col style="width:36%"><col style="width:6%"><col style="width:10%">
            <col style="width:11%"><col style="width:11%"><col style="width:11%">
            <col style="width:11%"><col style="width:4%">
          </colgroup>
          <thead class="table-light">
            <tr>
              <th >Deskripsi</th>
              <th >Qty</th>
              <th >HPP/Unit (Rp)</th>
              <th >Harga Jual/Unit (Rp)</th>
              <th >Laba/Unit (Rp)</th>
              <th >Subtotal (Rp)</th>
              <th >Total Laba (Rp)</th>
              <th ></th>
            </tr>
          </thead>
          <tbody id="itemsBody">
          </tbody>
          <tfoot>
            <tr><th colspan="5" class="text-end">Total HPP</th><th></th><th><input id="total_hpp" class="form-control text-end" readonly></th><th></th></tr>
            <tr><th colspan="5" class="text-end">Laba Kotor</th><th></th><th><input id="laba_kotor" class="form-control text-end" readonly></th><th></th></tr>
            <tr><th colspan="5" class="text-end">Discount</th><th></th><th><input type="number" min="0" step="1" id="discount" name="discount" class="form-control text-end" value="0"></th><th></th></tr>
            <tr><th colspan="5" class="text-end">Total Penjualan</th><th></th><th><input id="total" name="total" class="form-control text-end fw-bold" readonly></th><th></th></tr>
            <tr><th colspan="5" class="text-end">Laba Setelah Diskon</th><th></th><th><input id="laba_bersih" class="form-control text-end fw-bold" readonly></th><th></th></tr>
          </tfoot>
        </table>
      </div>
    </div>

    <div class="mt-3 d-flex gap-2">
      <button type="submit" data-action="saja" class="btn btn-success" id="btnSimpan"><i class="bi bi-save"></i> Simpan Saja</button>
      <button type="submit" data-action="cetak" class="btn btn-primary" id="btnCetak"><i class="bi bi-printer"></i> Simpan &amp; Cetak</button>
      <button type="reset" class="btn btn-outline-secondary">Reset</button>
    </div>
  </form>
</div>

<script>
function rupiah(x){ return (Number(x)||0).toLocaleString('id-ID'); }
function parseNum(v){return Number(String(v ?? '0').replace(/\./g,'').replace(/,/g,'').trim() || 0);}
function addRow(desc='',qty=1,harga=0,hpp=0){
  const tr=document.createElement('tr');
  tr.innerHTML=`
    <td><input name="deskripsi[]" class="form-control deskripsi" required></td>
    <td><input name="qty[]" type="number" min="1" step="1" class="form-control text-end qty" required></td>
    <td><input name="hpp[]" type="number" min="0" step="1" class="form-control text-end hpp" required></td>
    <td><input name="harga[]" type="number" min="0" step="1" class="form-control text-end harga" required></td>
    <td><input class="form-control text-end readonly-value laba-satuan" readonly></td>
    <td><input class="form-control text-end readonly-value subtotal" readonly></td>
    <td><input class="form-control text-end readonly-value total-laba" readonly></td>
    <td><button type="button" class="btn btn-sm btn-outline-danger">Hapus</button></td>`;
  tr.querySelector('.deskripsi').value=desc;
  tr.querySelector('.qty').value=qty;
  tr.querySelector('.harga').value=harga;
  tr.querySelector('.hpp').value=hpp;
  tr.querySelectorAll('.qty,.harga,.hpp').forEach(el=>el.addEventListener('input',hitung));
  tr.querySelector('button').addEventListener('click',()=>{tr.remove();hitung();});
  document.getElementById('itemsBody').appendChild(tr);
  hitung();
}
function hitung(){
  let bruto=0, totalHpp=0, labaKotor=0;
  document.querySelectorAll('#itemsBody tr').forEach(tr=>{
    const qty=Math.max(0,Number(tr.querySelector('.qty').value)||0);
    const harga=Number(tr.querySelector('.harga').value)||0;
    const hpp=Number(tr.querySelector('.hpp').value)||0;
    const laba=harga-hpp, subtotal=qty*harga, totalLaba=qty*laba;
    for(const [selector,value] of [['.laba-satuan',laba],['.subtotal',subtotal],['.total-laba',totalLaba]]){
      const el=tr.querySelector(selector);el.value=rupiah(value);
      el.classList.toggle('profit-negative',value<0 && selector!=='.subtotal');
      el.classList.toggle('profit-positive',value>0 && selector!=='.subtotal');
    }
    bruto+=subtotal;totalHpp+=qty*hpp;labaKotor+=totalLaba;
  });
  const diskon=Math.max(0,Number(document.getElementById('discount').value)||0);
  document.getElementById('total_hpp').value=rupiah(totalHpp);
  document.getElementById('laba_kotor').value=rupiah(labaKotor);
  document.getElementById('total').value=rupiah(Math.max(0,bruto-diskon));
  document.getElementById('laba_bersih').value=rupiah(labaKotor-diskon);
}
document.addEventListener('DOMContentLoaded',()=>{
  addRow('Kaos',1,0,0);
  const form=document.getElementById('formKwitansi');
  const namaPelanggan=document.getElementById('nama_pelanggan');
  namaPelanggan.addEventListener('input',()=>{
    const start=namaPelanggan.selectionStart, end=namaPelanggan.selectionEnd;
    namaPelanggan.value=namaPelanggan.value.toLocaleUpperCase('id-ID');
    if(start!==null && end!==null) namaPelanggan.setSelectionRange(start,end);
  });
  document.getElementById('discount').addEventListener('input',hitung);
  document.querySelector('button[type="reset"]').addEventListener('click',()=>{
    setTimeout(()=>{
      document.getElementById('itemsBody').innerHTML='';
      addRow('Kaos',1,0,0);
      hitung();
    },0);
  });
  form.querySelectorAll('button[data-action]').forEach(btn=>btn.addEventListener('click',()=>{
    form.querySelectorAll('button[data-action]').forEach(b=>b.dataset.clicked='');
    btn.dataset.clicked='1';
  }));
  form.addEventListener('submit',e=>{
    hitung();
    const total=parseNum(document.getElementById('total').value);
    if(total<=0){
      e.preventDefault();
      alert('Total transaksi tidak boleh Rp 0. Silakan isi harga/nominal transaksi terlebih dahulu.');
      form.querySelector('.harga')?.focus();
      return;
    }
    // Enter pada input tanpa klik tombol mengikuti Simpan Saja.
    const aksi=form.querySelector('button[data-action][data-clicked="1"]')?.dataset.action||'saja';
    let hidden=form.querySelector('input[name="aksi_simpan"]');
    if(!hidden){hidden=document.createElement('input');hidden.type='hidden';hidden.name='aksi_simpan';form.appendChild(hidden);}
    hidden.value=aksi;
  });
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</main>
</div>
</body>
</html>