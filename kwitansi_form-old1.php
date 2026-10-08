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
  .table-items input { min-width: 120px; }
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

<div class="container py-4">
  <a href="index.php" class="btn btn-link">&larr; Kembali</a>
  <h3>Buat Kwitansi</h3>
  <form action="save_kwitansi.php" method="post" id="formKwitansi">
    <div class="row g-3">
      <div class="col-md-4">
        <label class="form-label">Tanggal</label>
        <input type="date" class="form-control" name="tanggal" value="<?=date('Y-m-d')?>" required>
      </div>
      <div class="col-md-4">
        <label class="form-label">Nama Pelanggan</label>
        <input type="text" class="form-control" name="nama_pelanggan" placeholder="Nama pelanggan (opsional)">
      </div>
      <div class="col-md-4">
        <label class="form-label">Alamat Pelanggan</label>
        <input type="text" class="form-control" name="alamat_pelanggan" placeholder="Alamat (opsional)">
      </div>

      <!-- === Tambahan: Dropdown Status === -->
      <div class="col-md-4">
          <label class="form-label">Status</label>
          <select class="form-select" name="status_bayar" required>
            <option value="Lunas" selected>Lunas</option>
            <option value="Piutang">Piutang</option>
          </select>
        </div>
      </div>
      <!-- === End Tambahan === -->

      <div class="col-12">
        <label class="form-label">Catatan</label>
        <textarea class="form-control" name="catatan" rows="2" placeholder="Catatan di kwitansi (opsional)"></textarea>
      </div>
      
    <div class="card mt-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <strong>Item Penjualan</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary" onclick="addRow()">+ Tambah Baris</button>
      </div>
      <div class="table-responsive">
        <table class="table table-items mb-0 align-middle" id="itemsTable">
          <thead class="table-light">
            <tr>
              <th style="width:40%">Deskripsi</th>
              <th style="width:10%">Qty</th>
              <th style="width:20%">Harga Satuan (Rp)</th>
              <th style="width:20%">Subtotal</th>
              <th style="width:10%"></th>
            </tr>
          </thead>
          <tbody id="itemsBody">
          </tbody>
          <tfoot>
            <!-- ============================================================
                 DISCOUNT & TOTAL AKHIR
                 - Discount dapat langsung diisi saat membuat kwitansi
                 - Total akhir = jumlah subtotal - discount
                 ============================================================ -->
            <tr>
              <th colspan="2"></th>
              <th class="text-end">Discount</th>
              <th>
                <input type="number"
                       class="form-control text-end"
                       id="discount"
                       name="discount"
                       value="0"
                       min="0"
                       step="1">
              </th>
              <th></th>
            </tr>
            <tr>
              <th colspan="3" class="text-end">Total</th>
              <th><input type="text" class="form-control fw-bold" id="total" name="total" readonly></th>
              <th></th>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>

    <div class="mt-3 d-flex gap-2">
      <button type="submit" class="btn btn-primary">Simpan & Cetak</button>
      <button type="reset" class="btn btn-outline-secondary">Reset</button>
    </div>
  </form>
</div>

<script>
function rupiah(x){ return (x||0).toLocaleString('id-ID'); }
function parseNum(v){ v = (v||'').toString().replace(/\./g,'').replace(/,/g,'').trim(); return Number(v||0); }

function addRow(desc='', qty=1, harga=0){
  const tr = document.createElement('tr');
  tr.innerHTML = `
    <td><input name="deskripsi[]" class="form-control" required value="${desc}"></td>
    <td><input name="qty[]" type="number" min="1" class="form-control text-end qty" value="${qty}" required></td>
    <td><input name="harga[]" class="form-control text-end harga" value="${harga}"></td>
    <td><input class="form-control text-end subtotal" name="subtotal[]" readonly></td>
    <td class="text-center"><button type="button" class="btn btn-sm btn-outline-danger" onclick="this.closest('tr').remove();hitung();">Hapus</button></td>
  `;
  document.getElementById('itemsBody').appendChild(tr);
  bindRow(tr);
  hitung();
}

function bindRow(tr){
  tr.querySelector('.qty').addEventListener('input', hitung);
  tr.querySelector('.harga').addEventListener('input', hitung);
}

function hitung(){
  let totalBruto = 0;

  // Hitung seluruh subtotal item
  document.querySelectorAll('#itemsBody tr').forEach(tr=>{
    const qty = parseInt(tr.querySelector('.qty').value||0);
    const harga = parseNum(tr.querySelector('.harga').value);
    const sub = qty * harga;
    tr.querySelector('.subtotal').value = rupiah(sub);
    totalBruto += sub;
  });

  // ============================================================
  // DISCOUNT
  // Total akhir = total bruto - discount
  // ============================================================
  const discount = parseNum(document.getElementById('discount')?.value || 0);
  const totalAkhir = Math.max(totalBruto - discount, 0);

  document.getElementById('total').value = rupiah(totalAkhir);
}

document.addEventListener('DOMContentLoaded', ()=>{
  addRow('Kaos', 1, 0);

  // Hitung ulang otomatis saat discount berubah
  document.getElementById('discount')?.addEventListener('input', hitung);

  // Cegah submit jika total transaksi Rp 0
  document.getElementById('formKwitansi')?.addEventListener('submit', (e) => {
    hitung();
    const total = parseNum(document.getElementById('total')?.value || 0);
    if (total <= 0) {
      e.preventDefault();
      alert('Total transaksi tidak boleh Rp 0. Silakan isi harga/nominal transaksi terlebih dahulu.');
      document.querySelector('.harga')?.focus();
    }
  });
});
</script>

</main>
</div>
</body>
</html>