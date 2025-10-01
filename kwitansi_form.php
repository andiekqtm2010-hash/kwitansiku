<?php
require_once "db.php";
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<title>Buat Kwitansi - Mugnesia</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  .table-items input { min-width: 120px; }
</style>
</head>
<body class="bg-light">
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
            <tr>
              <th colspan="3" class="text-end">Total</th>
              <th><input type="text" class="form-control" id="total" name="total" readonly></th>
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
  let total = 0;
  document.querySelectorAll('#itemsBody tr').forEach(tr=>{
    const qty = parseInt(tr.querySelector('.qty').value||0);
    const harga = parseNum(tr.querySelector('.harga').value);
    const sub = qty * harga;
    tr.querySelector('.subtotal').value = rupiah(sub);
    total += sub;
  });
  document.getElementById('total').value = rupiah(total);
}

document.addEventListener('DOMContentLoaded', ()=>{
  addRow('Kaos', 1, 0);
});
</script>
</body>
</html>