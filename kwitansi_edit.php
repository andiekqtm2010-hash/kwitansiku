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

<style>
  /* Sedikit styling agar input nyaman dilihat */
  .table-items textarea { min-width: 220px; }
  .table-items input { min-width: 120px; }
  .desc-td { min-width: 260px; }
</style>
</head>
<body class="bg-light">
<div class="container py-4">

  <!-- Header navigasi sederhana -->
  <div class="d-flex justify-content-between align-items-center mb-3">
    <a href="index.php" class="btn btn-link">&larr; Kembali</a>
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

    <!-- Kartu daftar item -->
    <div class="card mt-4">
      <div class="card-header d-flex justify-content-between align-items-center">
        <strong>Item Penjualan</strong>
        <!-- Tombol tambah baris item baru (diproses di JS: addRow()) -->
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
            <?php if (!empty($items)): ?>
              <?php foreach ($items as $it): ?>
                <tr>
                  <!-- Deskripsi item -->
                  <td class="desc-td">
                    <textarea name="deskripsi[]" class="form-control" rows="2" required><?= htmlspecialchars($it['deskripsi']) ?></textarea>
                  </td>

                  <!-- Qty item; gunakan class 'qty' agar mudah diproses JS -->
                  <td>
                    <input name="qty[]" type="number" min="1" class="form-control text-end qty" 
                           value="<?= (int)$it['qty'] ?>" required>
                  </td>

                  <!-- Harga satuan; gunakan class 'harga' agar mudah diproses JS -->
                  <td>
                    <input name="harga[]" class="form-control text-end harga" 
                           value="<?= (int)$it['harga'] ?>">
                  </td>

                  <!-- Subtotal baris; readonly karena dihitung otomatis -->
                  <td>
                    <input class="form-control text-end subtotal" name="subtotal[]" readonly>
                  </td>

                  <!-- Tombol hapus baris; panggil hitung() setelah remove -->
                  <td class="text-center">
                    <button type="button" class="btn btn-sm btn-outline-danger" 
                            onclick="this.closest('tr').remove();hitung();">Hapus</button>
                  </td>
                </tr>
              <?php endforeach; ?>
            <?php endif; ?>
          </tbody>

          <tfoot>
            <tr>
              <!-- Label Discount -->
              <th class="text-end">Discount</th>

              <!-- 
                Input discount global:
                - id="discount" dipakai oleh JS untuk membaca nilainya
                - value: jika di DB tidak 0, pakai nilai DB; jika 0/null, pakai 0
              -->
                
              <th>
                <input 
                  type="number" 
                  id="discount" 
                  name="discount"
                  value="<?= ($head['discount'] ?? 0) != 0 ? htmlspecialchars((string)$head['discount']) : '0'; ?>">
              </th>

              <!-- Kolom total (gunakan style untuk width) -->
              <th class="text-end" style="width:20%">Total</th>

              <!-- 
                Field total akhir:
                - readonly; dihitung otomatis oleh JS = (sum subtotal) - discount
              -->
              <th>
                <input type="text" class="form-control" id="total" name="total" readonly>
              </th>
              <th></th>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>

    <!-- Tombol simpan & lihat cetak -->
    <div class="mt-3 d-flex gap-2">
      <button type="submit" class="btn btn-primary">Simpan Perubahan & Cetak</button>
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
/**
 * Format angka ke format ribuan Indonesia tanpa prefix "Rp".
 * Contoh: 12345 -> "12.345"
 * @param {number} x
 * @returns {string}
 */
function rupiah(x){
  return (x || 0).toLocaleString('id-ID');
}

/**
 * Ubah string angka (yang mungkin berisi titik/koma/pemisah) menjadi Number.
 * - Menghapus karakter selain digit, koma, titik, minus
 * - Menghapus semua titik/koma sebagai pemisah ribuan
 * - Menghasilkan integer (bisa diubah ke float jika perlu)
 * @param {string|number} v
 * @returns {number}
 */
function parseNum(v){
  if (v == null) return 0;
  v = String(v).trim();
  if (!v) return 0;

  // buang semua selain angka, koma, titik, minus
  v = v.replace(/[^0-9.,-]/g, "");

  // buang pemisah ribuan (titik/koma)
  v = v.replace(/[.,]/g, "");

  const n = parseInt(v, 10);
  return isNaN(n) ? 0 : n;
}

/**
 * Tambah baris item baru ke tabel:
 * - desc: deskripsi default (string)
 * - qty:  jumlah default (number)
 * - harga: harga default (number)
 * Setelah ditambahkan:
 * - pasang event listener (bindRow)
 * - jalankan hitung() agar subtotal & total ter-update
 */
function addRow(desc = 'Item', qty = 1, harga = 0){
  const tr = document.createElement('tr');

  tr.innerHTML = `
    <td class="desc-td">
      <textarea name="deskripsi[]" class="form-control" rows="2" required>${desc}</textarea>
    </td>
    <td>
      <input name="qty[]" type="number" min="1" class="form-control text-end qty" value="${qty}" required>
    </td>
    <td>
      <input name="harga[]" class="form-control text-end harga" value="${harga}">
    </td>
    <td>
      <input class="form-control text-end subtotal" name="subtotal[]" readonly>
    </td>
    <td class="text-center">
      <button type="button" class="btn btn-sm btn-outline-danger" 
              onclick="this.closest('tr').remove();hitung();">Hapus</button>
    </td>
  `;

  document.getElementById('itemsBody').appendChild(tr);
  bindRow(tr);
  hitung();
}

/**
 * Pasang event listener input pada satu baris:
 * - Saat qty/harga berubah -> panggil hitung()
 * @param {HTMLTableRowElement} tr 
 */
function bindRow(tr){
  tr.querySelector('.qty')?.addEventListener('input', hitung);
  tr.querySelector('.harga')?.addEventListener('input', hitung);
}

/**
 * Pasang event listener untuk SEMUA baris yang sudah ada saat page load.
 * (Baris baru akan dipasang listener-nya via bindRow() di addRow)
 */
function bindAll(){
  document.querySelectorAll('#itemsBody tr').forEach(tr => bindRow(tr));
}

/**
 * Fungsi utama perhitungan:
 * - Loop semua baris item -> hitung subtotal per baris = qty * harga
 * - Jumlahkan semua subtotal -> total
 * - Ambil discount global (footer)
 * - grandTotal = max(total - discount, 0)
 * - Tampilkan grandTotal ke field #total (format rupiah)
 */
function hitung(){
  let total = 0;

  // Hitung subtotal per baris
  document.querySelectorAll('#itemsBody tr').forEach(tr => {
    const qty   = parseNum(tr.querySelector('.qty')?.value || 0);
    const harga = parseNum(tr.querySelector('.harga')?.value || 0);
    const sub   = qty * harga;

    const subEl = tr.querySelector('.subtotal');
    if (subEl) subEl.value = rupiah(sub);

    total += sub;
  });

  // Ambil discount global dari footer
  const discount = parseNum(document.getElementById('discount')?.value || 0);

  // Pastikan tidak negatif (kalau mau mengizinkan negatif, hilangkan Math.max)
  const grandTotal = Math.max(total - discount);

  // Tampilkan grand total
  const totalEl = document.getElementById('total');
  if (totalEl) totalEl.value = rupiah(grandTotal);
}

/**
 * Inisialisasi setelah dokumen siap:
 * - Pasang listener untuk baris yang sudah ada (bindAll)
 * - Jika belum ada baris item, tambahkan satu baris default
 * - Pasang listener untuk perubahan di tbody (event delegation)
 * - Pasang listener untuk perubahan discount
 * - Jalankan hitung() awal
 */
document.addEventListener('DOMContentLoaded', () => {
  bindAll();

  // Jika tidak ada baris item saat load, buat satu baris default
  if (document.querySelectorAll('#itemsBody tr').length === 0){
    addRow('Item', 1, 0);
  } else {
    hitung();
  }

  // Event delegation: bila ada perubahan di qty/harga dalam tbody -> hitung ulang
  document.getElementById('itemsBody')?.addEventListener('input', (e) => {
    if (e.target.classList.contains('qty') || e.target.classList.contains('harga')) {
      hitung();
    }
  });

  // Re-hitung saat discount berubah
  document.getElementById('discount')?.addEventListener('input', hitung);
});
</script>
</body>
</html>