<?php
require_once "db.php";

$id = (int)($_GET['id'] ?? 0);

  // Ambil header kwitansi
  $stmt = $conn->prepare("SELECT * FROM kwitansi WHERE id=?");
  $stmt->bind_param("i", $id);
  $stmt->execute();
  $head = $stmt->get_result()->fetch_assoc();
  $stmt->close();
  if (!$head) { die("Data kwitansi tidak ditemukan."); }

  // Ambil detail item
  $stmt = $conn->prepare("SELECT * FROM kwitansi_item WHERE kwitansi_id=?");
  $stmt->bind_param("i", $id);
  $stmt->execute();
  $resItems = $stmt->get_result();
  $items = $resItems->fetch_all(MYSQLI_ASSOC);
  $stmt->close();

  $status_now=trim($head['status_bayar']);
?>

<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<title>Edit Kwitansi - <?= htmlspecialchars($head['no_kwitansi']) ?></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  .table-items textarea { min-width: 220px; }
  .table-items input { min-width: 120px; }
  .desc-td { min-width: 260px; }
</style>
</head>
<body class="bg-light">
<div class="container py-4">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <a href="index.php" class="btn btn-link">&larr; Kembali</a>
    <div class="text-muted">No. Kwitansi: <strong><?= htmlspecialchars($head['no_kwitansi']) ?></strong></div>
  </div>
  <h3>Edit Kwitansi</h3>

  <form action="update_kwitansi.php" method="post" id="formKwitansi">
    <input type="hidden" name="id" value="<?= $head['id'] ?>">

    <div class="row g-3">
      <div class="col-md-4">
        <label class="form-label">Tanggal</label>
        <input type="date" class="form-control" name="tanggal"
               value="<?= htmlspecialchars($head['tanggal']) ?>" required>
      </div>
      <div class="col-md-4">
        <label class="form-label">Nama Pelanggan</label>
        <input type="text" class="form-control" name="nama_pelanggan"
               value="<?= htmlspecialchars($head['nama_pelanggan'] ?: 'Pelanggan') ?>">
      </div>
      <div class="col-md-4">
        <label class="form-label">Alamat Pelanggan</label>
        <input type="text" class="form-control" name="alamat_pelanggan"
               value="<?= htmlspecialchars($head['alamat_pelanggan'] ?: 'Kemangsen Selatan') ?>">
      </div>

      <!-- === Tambahan: Dropdown Status === -->
      <div class="col-md-4">
        <label class="form-label">Status</label>
        <select class="form-select" name="status_bayar" required>
          <option value="Lunas"     <?= $status_now === 'Lunas' ? 'selected' : '' ?>>Lunas</option>
          <option value="No Lunas"  <?= $status_now === 'Piutang' ? 'selected' : '' ?>>Piutang</option>
        </select>
      </div>
      <!-- === End Tambahan === -->

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
        <table class="table table-items mb-0 align-middle" id="itemsTable">
          <thead class="table-light">
            <tr>
              <th style="width:45%">Deskripsi (multiline)</th>
              <th style="width:10%">Qty</th>
              <th style="width:20%">Harga Satuan (Rp)</th>
              <th style="width:20%">Subtotal</th>
              <th style="width:5%"></th>
            </tr>
          </thead>
          <tbody id="itemsBody">
            <?php if ($items): foreach ($items as $it): ?>
              <tr>
                <td class="desc-td">
                  <textarea name="deskripsi[]" class="form-control" rows="2" required><?= htmlspecialchars($it['deskripsi']) ?></textarea>
                </td>
                <td><input name="qty[]" type="number" min="1" class="form-control text-end qty" value="<?= (int)$it['qty'] ?>" required></td>
                <td><input name="harga[]" class="form-control text-end harga" value="<?= (int)$it['harga'] ?>"></td>
                <td><input class="form-control text-end subtotal" name="subtotal[]" readonly></td>
                <td class="text-center">
                  <button type="button" class="btn btn-sm btn-outline-danger" onclick="this.closest('tr').remove();hitung();">Hapus</button>
                </td>
              </tr>
            <?php endforeach; endif; ?>
          </tbody>
          <tfoot>
            <tr>
              <th class="text-end" style="border: 0px solid #0f0f0f">Discount</th>
              <th style="border:0px solid #0f0f0f"><input type="text" id="discount" name="discount"></th>
              <th colspan="3" class="text-end" style="border:0px solid #0f0f0f; width:20%">Total</th>
              <th style="border:0px solid #0f0f0f"><input type="text" class="form-control" id="total" name="total" readonly></th>
              <th></th>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>

    <div class="mt-3 d-flex gap-2">
      <button type="submit" class="btn btn-primary">Simpan Perubahan & Cetak</button>
      <a href="kwitansi_print.php?id=<?= $head['id'] ?>" target="_blank" class="btn btn-outline-secondary">Lihat Print</a>
    </div>
  </form>
</div>

<script>
function rupiah(x){ return (x||0).toLocaleString('id-ID'); }
function parseNum(v){ v=(v||'').toString().replace(/\./g,'').replace(/,/g,'').trim(); return Number(v||0); }

function addRow(desc='', qty=1, harga=0){
  const tr = document.createElement('tr');
  tr.innerHTML = `
    <td class="desc-td">
      <textarea name="deskripsi[]" class="form-control" rows="2" required>${desc}</textarea>
    </td>
    <td><input name="qty[]" type="number" min="1" class="form-control text-end qty" value="${qty}" required></td>
    <td><input name="harga[]" class="form-control text-end harga" value="${harga}"></td>
    <td><input class="form-control text-end subtotal" name="subtotal[]" readonly></td>
    <td class="text-center">
      <button type="button" class="btn btn-sm btn-outline-danger" onclick="this.closest('tr').remove();hitung();">Hapus</button>
    </td>
  `;
  document.getElementById('itemsBody').appendChild(tr);
  bindRow(tr);
  hitung();
}

function bindRow(tr){
  tr.querySelector('.qty').addEventListener('input', hitung);
  tr.querySelector('.harga').addEventListener('input', hitung);
}

function bindAll(){
  document.querySelectorAll('#itemsBody tr').forEach(tr=>bindRow(tr));
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

// init
document.addEventListener('DOMContentLoaded', ()=>{
  bindAll();
  if(document.querySelectorAll('#itemsBody tr').length === 0){
    addRow('Item', 1, 0);
  } else {
    hitung();
  }
});
</script>
</body>
</html>