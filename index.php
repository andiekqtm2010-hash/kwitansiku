<?php
    require_once "db.php"; // Koneksi database ($conn)

    // ================================
    // 1) Konfigurasi Page Size (dropdown)
    //    - Hanya izinkan pilihan yang ada di $allowed_sizes
    //    - $limit dipakai untuk LIMIT di query
    // ================================
    $allowed_sizes = [5,10,20,50];
    $ps = (int)($_GET['ps'] ?? 10);
    $limit = in_array($ps, $allowed_sizes) ? $ps : 10;

    // ================================
    // 2) Paging & Pencarian
    //    - $page: halaman aktif (min 1)
    //    - $offset: posisi awal row untuk LIMIT/OFFSET
    //    - $search: kata kunci pencarian (q)
    // ================================
    $page = max(1, (int)($_GET['page'] ?? 1));
    $offset = ($page - 1) * $limit;
    $search = trim($_GET['q'] ?? "");

    // ================================
    // 3) Susun Query Dasar (SELECT data)
    //    - Disiapkan untuk ditambah WHERE jika ada pencarian
    //    - Gunakan prepared statement (bind param) agar aman
    // ================================
    $sql = "SELECT * FROM kwitansi ";
    $params = [];
    $types = "";
    
    // ================================
    // 4) Jika pencarian tidak kosong:
    //    - Tambahkan WHERE untuk 3 kolom:
    //      no_kwitansi, nama_pelanggan, status_bayar
    //    - Siapkan parameter & types ('sss')
    //    - Hitung grand total 
    // ================================
    if ($search !== "") {
        $sql .= "WHERE no_kwitansi LIKE ? OR nama_pelanggan LIKE ? OR status_bayar LIKE ? ";
        $params = ["%$search%", "%$search%", "%$search%"];
        $types = "sss";

          // Grand total dengan filter yang sama
          $sql_sum = preg_replace('/SELECT \* FROM/', 'SELECT COALESCE(SUM(total),0) as gtotal FROM', $sql, 1);
          $stmt_sum = $conn->prepare($sql_sum);
          $stmt_sum->bind_param($types, ...$params);
          $stmt_sum->execute();
          $grand_total = $stmt_sum->get_result()->fetch_assoc()['gtotal'] ?? 0;
          $stmt_sum->close();
    }

    // ================================
    // 5) Query COUNT(*) untuk pagination
    //    - Turunan dari $sql yang sama (ganti SELECT * -> COUNT(*))
    //    - Menghitung total baris yang match (tanpa LIMIT)
    // ================================
    $sql_count = preg_replace('/SELECT \* FROM/', 'SELECT COUNT(*) as jml FROM', $sql, 1);
    $stmt = $conn->prepare($sql_count);
    if ($types) { $stmt->bind_param($types, ...$params); }
    $stmt->execute();
    $count = $stmt->get_result()->fetch_assoc()['jml'] ?? 0;
    $stmt->close();

    // ================================
    // 6) Query data utama + ORDER & LIMIT/OFFSET
    //    - ORDER BY id DESC (terbaru di atas)
    //    - Bind param disesuaikan: jika ada $types -> tambahkan "ii"
    // ================================
    $sql .= "ORDER BY id DESC LIMIT ? OFFSET ?";
    $stmt = $conn->prepare($sql);
    if ($types) {
        $types2 = $types . "ii";
        $params2 = array_merge($params, [$limit, $offset]);
        $stmt->bind_param($types2, ...$params2);
    } else {
        $stmt->bind_param("ii", $limit, $offset);
    }
    $stmt->execute();
    $res = $stmt->get_result();
    // $stmt->close(); // (opsional) bisa ditutup setelah $res habis dipakai
?>

<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<title>Kwitansi Mugnesia - Daftar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">

  <!-- ================================
       7) Header halaman + tombol buat kwitansi
       ================================ -->
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h3 class="m-0">Kwitansi Mugnesia</h3>
    <a class="btn btn-primary" href="kwitansi_form.php">+ Buat Kwitansi</a>
  </div>

  <!-- ================================
       8) Form pencarian + page size
       - Method GET agar bisa share URL
       - Pertahankan q saat ganti page size
       ================================ -->
  <form class="row g-2 align-items-center mb-3" method="get">
    <div class="col-sm-6" style="border:1px solid #0f0f0f0f">
      <div class="input-group">
        <input type="text" class="form-control"
              placeholder="Cari No Kwitansi / Nama / Status Bayar"
              name="q"
              value="<?= htmlspecialchars($search) ?>">
        <button class="btn btn-outline-secondary" type="submit">Cari</button>
      </div>
    </div>
    
    <div class="col-sm-6 text-sm-end">
      <div class="input-group" style="max-width:260px; margin-left:auto;">
        <label class="input-group-text" for="ps">Tampil</label>
        <select class="form-select" name="ps" id="ps" onchange="this.form.submit()">
          <?php foreach($allowed_sizes as $s): ?>
            <option value="<?=$s?>" <?=$s==$limit?'selected':''?>><?=$s?> / halaman</option>
          <?php endforeach; ?>
        </select>
        <!-- Pertahankan halaman ke-1 saat user ganti page size -->
        <input type="hidden" name="page" value="1">
      </div>
    </div>
  </form>

  <!--======================================================================================
   (Opsional) 8a) Tampilkan Grand Total hasil pencarian
       - Saat ini $grand_total hanya dihitung untuk nama_pelanggan (lihat catatan perbaikan)
       - Aktifkan blok di bawah jika ingin menampilkannya 
  ======================================================================================-->
  <?php  if (!empty($search)) : ?>
    <div class="alert alert-info py-2">
      <strong>Grand Total untuk pencarian "<?= htmlspecialchars($search) ?>" :</strong>
      Rp <?= number_format($grand_total ?? 0, 0, ',', '.') ?>
    </div>
  <?php endif;  ?>

  <!-- ================================
       9) Tabel daftar kwitansi
       - Thead: judul kolom
       - Tbody: loop data
       ================================ -->
  <div class="card">
    <div class="table-responsive">
      <table class="table table-hover align-middle mb-0">
        <thead class="table-light">
          <tr>
            <th>No Kwitansi</th>
            <th>Tanggal</th>
            <th>Nama Pelanggan</th>
            <th>Catatan</th>
            <th>Status Bayar</th>
            <th>Discount</th>
            <th class="text-end">Total</th>
            <th class="text-center">Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php while($row = $res->fetch_assoc()): ?>
            <tr>
              <td><?= htmlspecialchars($row['no_kwitansi']) ?></td>
              <td><?= date('d/m/Y', strtotime($row['tanggal'])) ?></td>
              <td><?= htmlspecialchars($row['nama_pelanggan']) ?></td>
              <td><?= htmlspecialchars($row['catatan']) ?></td>
              <td><?= htmlspecialchars($row['status_bayar']) ?></td>

              <!-- Catatan: number_format di sini belum pakai pemisah Indonesia.
                   Lihat catatan perbaikan opsional di bawah. -->
              <td><?= number_format($row['discount'], 0,',','.') ?></td>

              <td class="text-end"><?= number_format($row['total'], 0, ',', '.') ?></td>
              <td class="text-center">
                <div class="btn-group btn-group-sm">
                    <a class="btn btn-outline-secondary" href="kwitansi_edit.php?id=<?= $row['id'] ?>">Edit</a>
                    <a class="btn btn-outline-primary" target="_blank" href="kwitansi_print.php?id=<?= $row['id'] ?>">Print</a>
                </div>              
              </td>
            </tr>
          <?php endwhile; ?>

          <?php if ($res->num_rows === 0): ?>
            <!-- Kalau kosong, tampilkan satu baris info.
                 Catatan: colspan sebaiknya = jumlah kolom tabel (8). -->
            <tr><td colspan="8" class="text-center text-muted">Belum ada data.</td></tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>
  </div>

  <!-- ================================
       10) Pagination
       - Hitung total halaman = ceil(total_row / limit)
       - Render link 1..N, pertahankan q & ps dalam URL
       ================================ -->
  <?php
    $total_pages = max(1, ceil($count / $limit));
    if ($total_pages > 1):
  ?>
  <nav class="mt-3">
    <ul class="pagination">
      <?php for($i=1; $i<=$total_pages; $i++): ?>
        <li class="page-item <?= $i==$page ? 'active' : '' ?>">
          <a class="page-link" href="?page=<?= $i ?>&q=<?= urlencode($search) ?>&ps=<?= $limit ?>"><?= $i ?></a>
        </li>
      <?php endfor; ?>
    </ul>
  </nav>
  <?php endif; ?>
</div>
</body>
</html>
