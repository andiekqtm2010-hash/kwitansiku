<?php
    require_once "db.php"; // Koneksi database ($conn)

    // ================================
    // 1) Konfigurasi Page Size
    // ================================
    $allowed_sizes = [5,10,20,50];
    $ps = (int)($_GET['ps'] ?? 10);
    $limit = in_array($ps, $allowed_sizes) ? $ps : 10;

    // ================================
    // 2) Paging & Pencarian
    // ================================
    $page = max(1, (int)($_GET['page'] ?? 1));
    $offset = ($page - 1) * $limit;
    $search = trim($_GET['q'] ?? "");

    // ================================
    // 3) Query dasar
    // ================================
    $sql = "SELECT * FROM kwitansi ";
    $params = [];
    $types = "";

    // ================================
    // 4) Filter pencarian + grand total
    // ================================
    if ($search !== "") {
        $sql .= "WHERE no_kwitansi LIKE ? OR nama_pelanggan LIKE ? OR status_bayar LIKE ? ";
        $params = ["%$search%", "%$search%", "%$search%"];
        $types = "sss";

        $sql_sum = preg_replace('/SELECT \* FROM/', 'SELECT COALESCE(SUM(total),0) as gtotal FROM', $sql, 1);
        $stmt_sum = $conn->prepare($sql_sum);
        $stmt_sum->bind_param($types, ...$params);
        $stmt_sum->execute();
        $grand_total = $stmt_sum->get_result()->fetch_assoc()['gtotal'] ?? 0;
        $stmt_sum->close();
    }

    // ================================
    // 5) Hitung total data
    // ================================
    $sql_count = preg_replace('/SELECT \* FROM/', 'SELECT COUNT(*) as jml FROM', $sql, 1);
    $stmt = $conn->prepare($sql_count);
    if ($types) { $stmt->bind_param($types, ...$params); }
    $stmt->execute();
    $count = $stmt->get_result()->fetch_assoc()['jml'] ?? 0;
    $stmt->close();

    // Pastikan page tidak melewati halaman terakhir
    $total_pages = max(1, (int)ceil($count / $limit));
    if ($page > $total_pages) {
        $page = $total_pages;
        $offset = ($page - 1) * $limit;
    }

    // ================================
    // 6) Query data utama
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

    // Info range data
    $start_row = $count > 0 ? $offset + 1 : 0;
    $end_row = min($offset + $limit, $count);

    // Helper URL pagination agar q dan ps tetap terbawa
    function pageUrl($targetPage, $search, $limit) {
        return '?page=' . (int)$targetPage . '&q=' . urlencode($search) . '&ps=' . (int)$limit;
    }
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Kwitansi Mugnesia - Daftar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
  :root {
    --app-bg:#f4f7fb;
    --card-border:#e7ecf2;
    --head-bg:#f8fafc;
    --text-main:#1f2937;
    --text-muted:#6b7280;
  }

  body {
    background:var(--app-bg);
    color:var(--text-main);
    font-family:Arial, Helvetica, sans-serif;
  }

  .app-wrap { max-width: 1450px; }

  .page-title {
    font-size:28px;
    font-weight:800;
    letter-spacing:-.4px;
  }

  .page-subtitle { color:var(--text-muted); font-size:14px; }

  .toolbar-card,
  .grid-card {
    background:#fff;
    border:1px solid var(--card-border);
    border-radius:14px;
    box-shadow:0 6px 20px rgba(15,23,42,.05);
  }

  .toolbar-card { padding:14px; }

  .search-box .input-group-text {
    background:#fff;
    border-right:0;
    color:#94a3b8;
  }

  .search-box .form-control {
    border-left:0;
    box-shadow:none !important;
  }

  .search-box .form-control:focus,
  .search-box .input-group:focus-within .input-group-text {
    border-color:#86b7fe;
  }

  .grid-card { overflow:hidden; }

  .grid-head {
    padding:16px 18px;
    border-bottom:1px solid var(--card-border);
  }

  .record-info { font-size:13px; color:var(--text-muted); }

  .table { margin:0; }

  .table thead th {
    background:var(--head-bg);
    color:#475569;
    border-bottom:1px solid #dfe6ee;
    padding:13px 12px;
    font-size:12px;
    font-weight:800;
    text-transform:uppercase;
    letter-spacing:.35px;
    white-space:nowrap;
  }

  .table tbody td {
    padding:13px 12px;
    border-color:#edf1f5;
    font-size:13px;
    vertical-align:middle;
  }

  .table tbody tr { transition:.15s ease; }
  .table tbody tr:hover { background:#f8fbff; }

  .invoice-no {
    color:#1d4ed8;
    font-weight:700;
    white-space:nowrap;
  }

  .customer-name { font-weight:600; }

  .note-cell {
    color:#64748b;
    max-width:360px;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
  }

  .money { font-variant-numeric:tabular-nums; white-space:nowrap; }
  .total-money { font-weight:800; color:#0f172a; }

  .status-badge {
    display:inline-flex;
    align-items:center;
    gap:6px;
    padding:6px 10px;
    border-radius:999px;
    font-size:12px;
    font-weight:700;
    white-space:nowrap;
  }

  .status-lunas { background:#dcfce7; color:#166534; }
  .status-piutang { background:#fff7d6; color:#92400e; }
  .status-other { background:#e8eef7; color:#475569; }

  .action-btn {
    width:34px;
    height:34px;
    padding:0;
    display:inline-flex;
    align-items:center;
    justify-content:center;
    border-radius:8px !important;
  }

  .grid-footer {
    padding:12px 16px;
    border-top:1px solid var(--card-border);
    background:#fff;
  }

  .pagination { margin:0; gap:4px; }
  .pagination .page-link {
    min-width:36px;
    height:36px;
    display:flex;
    align-items:center;
    justify-content:center;
    border-radius:8px !important;
    border:1px solid #e2e8f0;
    color:#475569;
    font-size:13px;
  }
  .pagination .page-item.active .page-link {
    background:#0d6efd;
    border-color:#0d6efd;
    color:#fff;
  }
  .pagination .page-item.disabled .page-link { background:#f8fafc; color:#cbd5e1; }

  .btn { border-radius:9px; font-weight:600; }

  .search-summary {
    border:1px solid #bfdbfe;
    background:#eff6ff;
    color:#1e3a8a;
    border-radius:10px;
    padding:10px 13px;
    font-size:13px;
  }

  @media (max-width: 767.98px) {
    .page-title { font-size:23px; }
    .header-actions { width:100%; }
    .header-actions .btn { flex:1; }
    .grid-head { align-items:flex-start !important; flex-direction:column; gap:8px; }
  }
</style>
</head>
<body>
<div class="container-fluid app-wrap py-4 px-3 px-lg-4">

  <!-- =========================================================
       HEADER HALAMAN
       ========================================================= -->
  <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-3">
    <div>
      <div class="page-title">Kwitansi Mugnesia</div>
      <div class="page-subtitle">Kelola transaksi, status pembayaran, dan cetak kwitansi pelanggan.</div>
    </div>

    <div class="d-flex gap-2 header-actions">
      <a class="btn btn-outline-primary" href="input_tagihan.php">
        <i class="bi bi-lightning-charge me-1"></i> PLN PASCA
      </a>
      <a class="btn btn-primary" href="kwitansi_form.php">
        <i class="bi bi-plus-lg me-1"></i> Buat Kwitansi
      </a>
    </div>
  </div>

  <!-- =========================================================
       TOOLBAR SEARCH + PAGE SIZE
       Tetap menggunakan server-side search/pagination bawaan PHP.
       ========================================================= -->
  <form class="toolbar-card mb-3" method="get">
    <div class="row g-2 align-items-center">
      <div class="col-12 col-md-8 col-lg-6">
        <div class="input-group search-box">
          <span class="input-group-text"><i class="bi bi-search"></i></span>
          <input type="text" class="form-control"
                 placeholder="Cari no kwitansi, nama pelanggan, atau status bayar..."
                 name="q"
                 value="<?= htmlspecialchars($search) ?>">
          <button class="btn btn-primary px-4" type="submit">Cari</button>
          <?php if ($search !== ''): ?>
            <a class="btn btn-outline-secondary" href="?ps=<?= $limit ?>" title="Reset pencarian">
              <i class="bi bi-x-lg"></i>
            </a>
          <?php endif; ?>
        </div>
      </div>

      <div class="col-12 col-md-4 col-lg-6 d-flex justify-content-md-end">
        <div class="input-group" style="max-width:210px;">
          <label class="input-group-text" for="ps"><i class="bi bi-list-ul me-1"></i> Tampil</label>
          <select class="form-select" name="ps" id="ps" onchange="this.form.submit()">
            <?php foreach($allowed_sizes as $s): ?>
              <option value="<?=$s?>" <?=$s==$limit?'selected':''?>><?=$s?> / halaman</option>
            <?php endforeach; ?>
          </select>
          <input type="hidden" name="page" value="1">
        </div>
      </div>
    </div>
  </form>

  <?php if (!empty($search)) : ?>
    <div class="search-summary mb-3 d-flex flex-column flex-sm-row justify-content-between gap-1">
      <span><i class="bi bi-funnel me-1"></i> Hasil pencarian: <strong>“<?= htmlspecialchars($search) ?>”</strong></span>
      <span>Grand Total: <strong>Rp <?= number_format($grand_total ?? 0, 0, ',', '.') ?></strong></span>
    </div>
  <?php endif; ?>

  <!-- =========================================================
       MODERN DATA GRID
       ========================================================= -->
  <div class="grid-card">
    <div class="grid-head d-flex justify-content-between align-items-center">
      <div>
        <div class="fw-bold">Daftar Kwitansi</div>
        <div class="record-info">Menampilkan <?= $start_row ?>–<?= $end_row ?> dari <?= number_format($count,0,',','.') ?> data</div>
      </div>
      <span class="badge text-bg-light border px-3 py-2">
        <i class="bi bi-receipt me-1"></i><?= number_format($count,0,',','.') ?> transaksi
      </span>
    </div>

    <div class="table-responsive">
      <table class="table table-hover align-middle">
        <thead>
          <tr>
            <th>No Kwitansi</th>
            <th>Tanggal</th>
            <th>Nama Pelanggan</th>
            <th>Catatan</th>
            <th>Status Bayar</th>
            <th class="text-end">Discount</th>
            <th class="text-end">Total</th>
            <th class="text-center">Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php while($row = $res->fetch_assoc()): ?>
            <?php
              $status = trim($row['status_bayar'] ?? '');
              $statusLower = strtolower($status);
              if ($statusLower === 'lunas') {
                  $statusClass = 'status-lunas';
                  $statusIcon = 'bi-check-circle-fill';
              } elseif ($statusLower === 'piutang') {
                  $statusClass = 'status-piutang';
                  $statusIcon = 'bi-clock-fill';
              } else {
                  $statusClass = 'status-other';
                  $statusIcon = 'bi-info-circle-fill';
              }
            ?>
            <tr>
              <td><span class="invoice-no"><?= htmlspecialchars($row['no_kwitansi']) ?></span></td>
              <td class="text-nowrap"><?= date('d/m/Y', strtotime($row['tanggal'])) ?></td>
              <td><span class="customer-name"><?= htmlspecialchars($row['nama_pelanggan']) ?></span></td>
              <td>
                <div class="note-cell" title="<?= htmlspecialchars($row['catatan'] ?? '') ?>">
                  <?= trim($row['catatan'] ?? '') !== '' ? htmlspecialchars($row['catatan']) : '<span class="text-muted">-</span>' ?>
                </div>
              </td>
              <td>
                <span class="status-badge <?= $statusClass ?>">
                  <i class="bi <?= $statusIcon ?>"></i><?= htmlspecialchars($status !== '' ? $status : '-') ?>
                </span>
              </td>
              <td class="text-end money">Rp <?= number_format($row['discount'], 0, ',', '.') ?></td>
              <td class="text-end money total-money">Rp <?= number_format($row['total'], 0, ',', '.') ?></td>
              <td class="text-center text-nowrap">
                <div class="d-inline-flex gap-1">
                  <a class="btn btn-outline-secondary btn-sm action-btn"
                     href="kwitansi_edit.php?id=<?= (int)$row['id'] ?>"
                     title="Edit kwitansi">
                    <i class="bi bi-pencil-square"></i>
                  </a>
                  <a class="btn btn-outline-primary btn-sm action-btn"
                     target="_blank"
                     href="kwitansi_print.php?id=<?= (int)$row['id'] ?>"
                     title="Print kwitansi">
                    <i class="bi bi-printer"></i>
                  </a>
                </div>
              </td>
            </tr>
          <?php endwhile; ?>

          <?php if ($res->num_rows === 0): ?>
            <tr>
              <td colspan="8" class="text-center py-5 text-muted">
                <i class="bi bi-inbox fs-2 d-block mb-2"></i>
                Belum ada data yang ditemukan.
              </td>
            </tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>

    <!-- =========================================================
         PAGINATION RINGKAS
         Tidak lagi menampilkan 1..29 sekaligus.
         ========================================================= -->
    <div class="grid-footer d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-2">
      <div class="record-info">
        Halaman <strong><?= $page ?></strong> dari <strong><?= $total_pages ?></strong>
      </div>

      <?php if ($total_pages > 1): ?>
        <nav aria-label="Pagination kwitansi">
          <ul class="pagination pagination-sm">
            <li class="page-item <?= $page <= 1 ? 'disabled' : '' ?>">
              <a class="page-link" href="<?= pageUrl(max(1,$page-1), $search, $limit) ?>" aria-label="Sebelumnya">
                <i class="bi bi-chevron-left"></i>
              </a>
            </li>

            <?php
              $window = 2;
              $shown = [];
              $candidates = [1, $total_pages];
              for ($i = max(1, $page-$window); $i <= min($total_pages, $page+$window); $i++) {
                  $candidates[] = $i;
              }
              $candidates = array_values(array_unique($candidates));
              sort($candidates);
              $prevShown = null;
            ?>

            <?php foreach($candidates as $i): ?>
              <?php if ($prevShown !== null && $i > $prevShown + 1): ?>
                <li class="page-item disabled"><span class="page-link">…</span></li>
              <?php endif; ?>
              <li class="page-item <?= $i == $page ? 'active' : '' ?>">
                <a class="page-link" href="<?= pageUrl($i, $search, $limit) ?>"><?= $i ?></a>
              </li>
              <?php $prevShown = $i; ?>
            <?php endforeach; ?>

            <li class="page-item <?= $page >= $total_pages ? 'disabled' : '' ?>">
              <a class="page-link" href="<?= pageUrl(min($total_pages,$page+1), $search, $limit) ?>" aria-label="Berikutnya">
                <i class="bi bi-chevron-right"></i>
              </a>
            </li>
          </ul>
        </nav>
      <?php endif; ?>
    </div>
  </div>

</div>
</body>
</html>
