<?php
    require_once "db.php";

    // --- page size dropdown ---
    $allowed_sizes = [5,10,20,50];
    $ps = (int)($_GET['ps'] ?? 10);
    $limit = in_array($ps, $allowed_sizes) ? $ps : 10;

    $page = max(1, (int)($_GET['page'] ?? 1));
    $offset = ($page - 1) * $limit;
    $search = trim($_GET['q'] ?? "");

    // query receipts
    $sql = "SELECT * FROM kwitansi ";
    $params = [];
    $types = "";
    
    //Apbila serach tidak kosong
    if ($search !== "") {
        $sql .= "WHERE no_kwitansi LIKE ? OR nama_pelanggan LIKE ? OR status_bayar LIKE ? ";
        $params = ["%$search%", "%$search%", "%$search%"];
        $types = "sss";

        $stmt_total=$conn->prepare("SELECT SUM(total) as gtotal from kwitansi WHERE nama_pelanggan LIKE ?");
        $search_like="%$search%";
        $stmt_total->bind_param("s",$search_like);
        $stmt_total->execute();
        $grand_total=$stmt_total->get_result()->fetch_assoc()['gtotal']??0;
        //echo "Grand total: " . number_format($grand_total, 0, ',', '.');
        $stmt_total->close();
    }

    $sql_count = preg_replace('/SELECT \* FROM/', 'SELECT COUNT(*) as jml FROM', $sql, 1);
    $stmt = $conn->prepare($sql_count);
    if ($types) { $stmt->bind_param($types, ...$params); }
    $stmt->execute();
    $count = $stmt->get_result()->fetch_assoc()['jml'] ?? 0;
    $stmt->close();

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
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h3 class="m-0">Kwitansi Mugnesia</h3>
    <a class="btn btn-primary" href="kwitansi_form.php">+ Buat Kwitansi</a>
  </div>

<!--Tampilan serach enggine-->
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
        <!-- pertahankan query saat ganti page size -->
        <input type="hidden" name="page" value="1">
      </div>
    </div>
</form>

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
            <th class="text-end">Total</th>
            <th class="text-center">Aksi</th>
          </tr>
        </thead>
        <tbody>
          <?php while($row = $res->fetch_assoc()): ?>
            <tr>
              <td><?=htmlspecialchars($row['no_kwitansi'])?></td>
              <td><?=date('d/m/Y', strtotime($row['tanggal']))?></td>
              <td><?=htmlspecialchars($row['nama_pelanggan'])?></td>
              <td><?=htmlspecialchars($row['catatan'])?></td>
              <td><?=htmlspecialchars($row['status_bayar'])?></td>
              <td class="text-end"><?=number_format($row['total'],0,',','.')?></td>
              <td class="text-center">
                <div class="btn-group btn-group-sm">
                    <a class="btn btn-outline-secondary" href="kwitansi_edit.php?id=<?= $row['id'] ?>">Edit</a>
                    <a class="btn btn-outline-primary" target="_blank" href="kwitansi_print.php?id=<?= $row['id'] ?>">Print</a>
                </div>              
            </td>
            </tr>
          <?php endwhile; ?>
          <?php if ($res->num_rows === 0): ?>
            <tr><td colspan="5" class="text-center text-muted">Belum ada data.</td></tr>
          <?php endif; ?>
        </tbody>
      </table>
    </div>
  </div>

  <?php
    $total_pages = max(1, ceil($count / $limit));
    if ($total_pages > 1):
  ?>
  <nav class="mt-3">
    <ul class="pagination">
      <?php for($i=1;$i<=$total_pages;$i++): ?>
        <li class="page-item <?=$i==$page?'active':''?>">
          <a class="page-link" href="?page=<?=$i?>&q=<?=urlencode($search)?>&ps=<?=$limit?>"><?=$i?></a>
        </li>
      <?php endfor; ?>
    </ul>
  </nav>
  <?php endif; ?>
</div>
</body>
</html>