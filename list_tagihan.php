<?php
// ============================================================
// FILE: list_tagihan.php
// FUNGSI:
// - Menampilkan daftar transaksi PLN Pascabayar
// - Tampilan modern seperti index.php
// - Search, sorting, paging server-side
// - Aksi: View Tagihan dan Print Nota
// ============================================================

require_once "db.php";


// ============================================================
// 1) HELPER FORMAT RUPIAH
// ============================================================
function rupiah($angka)
{
    return number_format((float)$angka, 0, ',', '.');
}


// ============================================================
// 2) KONFIGURASI PAGE SIZE
// ============================================================
$allowed_sizes = [5, 10, 20, 50];
$ps = (int)($_GET['ps'] ?? 10);
$limit = in_array($ps, $allowed_sizes, true) ? $ps : 10;


// ============================================================
// 3) PAGING & SEARCH
// ============================================================
$page   = max(1, (int)($_GET['page'] ?? 1));
$offset = ($page - 1) * $limit;
$search = trim($_GET['q'] ?? '');


// ============================================================
// 4) SORTING AMAN DENGAN WHITELIST
// ============================================================
$allowed_sort = [
    'id_transaksi' => 'id_transaksi',
    'tgl_bayar'    => 'tgl_bayar',
    'no_pelanggan' => 'no_pelanggan',
    'nama'          => 'nama',
    'periode'       => 'periode',
    'total_bayar'   => 'total_bayar'
];

$sort = $_GET['sort'] ?? 'tgl_bayar';
$dir  = strtolower($_GET['dir'] ?? 'desc');
$dir  = $dir === 'asc' ? 'ASC' : 'DESC';

$orderBy = $allowed_sort[$sort] ?? 'tgl_bayar';


// ============================================================
// 5) FILTER SEARCH
// ============================================================
$where  = '';
$params = [];
$types  = '';

if ($search !== '') {
    $where = " WHERE no_pelanggan LIKE ?
               OR nama LIKE ?
               OR periode LIKE ? ";

    $keyword = "%{$search}%";
    $params = [$keyword, $keyword, $keyword];
    $types  = "sss";
}


// ============================================================
// 6) HITUNG TOTAL DATA
// ============================================================
$sql_count = "SELECT COUNT(*) AS jml
              FROM tb_tagihan_listrik
              {$where}";

$stmt_count = $conn->prepare($sql_count);

if ($types !== '') {
    $stmt_count->bind_param($types, ...$params);
}

$stmt_count->execute();
$count = (int)($stmt_count->get_result()->fetch_assoc()['jml'] ?? 0);
$stmt_count->close();


// ============================================================
// 7) HITUNG TOTAL HALAMAN
// ============================================================
$total_pages = max(1, (int)ceil($count / $limit));

if ($page > $total_pages) {
    $page = $total_pages;
    $offset = ($page - 1) * $limit;
}


// ============================================================
// 8) QUERY DATA UTAMA
// ============================================================
$sql = "SELECT *
        FROM tb_tagihan_listrik
        {$where}
        ORDER BY {$orderBy} {$dir}, id DESC
        LIMIT ? OFFSET ?";

$stmt = $conn->prepare($sql);

if ($types !== '') {
    $types2  = $types . "ii";
    $params2 = array_merge($params, [$limit, $offset]);
    $stmt->bind_param($types2, ...$params2);
} else {
    $stmt->bind_param("ii", $limit, $offset);
}

$stmt->execute();
$result = $stmt->get_result();


// ============================================================
// 9) INFO RANGE DATA
// ============================================================
$start_row = $count > 0 ? $offset + 1 : 0;
$end_row   = min($offset + $limit, $count);


// ============================================================
// 10) HELPER URL PAGING
// ============================================================
function pageUrl($targetPage, $search, $limit, $sort, $dir)
{
    return '?page=' . (int)$targetPage
        . '&q=' . urlencode($search)
        . '&ps=' . (int)$limit
        . '&sort=' . urlencode($sort)
        . '&dir=' . urlencode(strtolower($dir));
}


// ============================================================
// 11) HELPER URL SORTING
// ============================================================
function sortUrl($column, $currentSort, $currentDir, $search, $limit)
{
    $nextDir = (
        $currentSort === $column &&
        strtoupper($currentDir) === 'ASC'
    ) ? 'desc' : 'asc';

    return '?page=1'
        . '&q=' . urlencode($search)
        . '&ps=' . (int)$limit
        . '&sort=' . urlencode($column)
        . '&dir=' . $nextDir;
}


// ============================================================
// 12) HELPER ICON SORTING
// ============================================================
function sortIcon($column, $currentSort, $currentDir)
{
    if ($currentSort !== $column) {
        return '<i class="bi bi-arrow-down-up sort-icon"></i>';
    }

    return strtoupper($currentDir) === 'ASC'
        ? '<i class="bi bi-sort-up sort-icon active"></i>'
        : '<i class="bi bi-sort-down sort-icon active"></i>';
}
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>List Tagihan PLN - Mugnesia</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
    /* ============================================================
       13) STYLE DASAR
       ============================================================ */
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

    .app-wrap {
        max-width:1450px;
    }

    .page-title {
        font-size:28px;
        font-weight:800;
        letter-spacing:-.4px;
    }

    .page-subtitle {
        color:var(--text-muted);
        font-size:14px;
    }

    .toolbar-card,
    .grid-card {
        background:#fff;
        border:1px solid var(--card-border);
        border-radius:14px;
        box-shadow:0 6px 20px rgba(15,23,42,.05);
    }

    .toolbar-card {
        padding:14px;
    }

    .grid-card {
        overflow:hidden;
    }

    .grid-head {
        padding:16px 18px;
        border-bottom:1px solid var(--card-border);
    }

    .grid-footer {
        padding:12px 16px;
        border-top:1px solid var(--card-border);
        background:#fff;
    }

    .record-info {
        font-size:13px;
        color:var(--text-muted);
    }


    /* ============================================================
       14) SEARCH BOX
       ============================================================ */
    .search-box .input-group-text {
        background:#fff;
        border-right:0;
        color:#94a3b8;
    }

    .search-box .form-control {
        border-left:0;
        box-shadow:none !important;
    }


    /* ============================================================
       15) TABLE
       ============================================================ */
    .table {
        margin:0;
    }

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

    .table tbody tr:hover {
        background:#f8fbff;
    }

    .customer-name {
        font-weight:700;
    }

    .customer-no {
        color:#1d4ed8;
        font-weight:600;
        white-space:nowrap;
    }

    .money {
        white-space:nowrap;
        font-variant-numeric:tabular-nums;
    }

    .total-money {
        font-weight:800;
    }


    /* ============================================================
       16) SORTING HEADER
       ============================================================ */
    .sort-link {
        display:inline-flex;
        align-items:center;
        gap:6px;
        color:inherit;
        text-decoration:none;
    }

    .sort-link:hover {
        color:#0d6efd;
    }

    .sort-icon {
        font-size:12px;
        opacity:.35;
    }

    .sort-icon.active {
        opacity:1;
        color:#0d6efd;
    }


    /* ============================================================
       17) ACTION BUTTON
       ============================================================ */
    .action-btn {
        width:34px;
        height:34px;
        padding:0;
        display:inline-flex;
        align-items:center;
        justify-content:center;
        border-radius:8px !important;
    }

    .btn {
        border-radius:9px;
        font-weight:600;
    }


    /* ============================================================
       18) PAGINATION
       ============================================================ */
    .pagination {
        margin:0;
        gap:4px;
    }

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

    .pagination .page-item.disabled .page-link {
        background:#f8fafc;
        color:#cbd5e1;
    }


    /* ============================================================
       19) RESPONSIVE
       ============================================================ */
    @media (max-width:767.98px) {
        .page-title {
            font-size:23px;
        }

        .header-actions {
            width:100%;
        }

        .header-actions .btn {
            flex:1;
        }

        .grid-head {
            flex-direction:column;
            align-items:flex-start !important;
            gap:8px;
        }
    }
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

<body>
<div class="mug-app">
<?php require __DIR__ . '/layout/sidebar.php'; ?>
<main class="mug-main">


<div class="container-fluid app-wrap py-4 px-3 px-lg-4">

    <!-- ========================================================
         20) HEADER
         ======================================================== -->
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-3">

        <div>
            <div class="page-title">List Tagihan Listrik PLN</div>

            <div class="page-subtitle">
                Kelola transaksi PLN Pascabayar, lihat tagihan, dan cetak ulang nota.
            </div>
        </div>

        <div class="d-flex gap-2 header-actions">

            <a class="btn btn-primary" href="input_tagihan.php">
                <i class="bi bi-plus-lg me-1"></i>
                Input Tagihan
            </a>

            <a class="btn btn-outline-secondary" href="index.php">
                <i class="bi bi-arrow-left me-1"></i>
                Dashboard
            </a>

        </div>
    </div>


    <!-- ========================================================
         21) SEARCH + PAGE SIZE
         ======================================================== -->
    <form class="toolbar-card mb-3" method="get">

        <div class="row g-2 align-items-center">

            <div class="col-12 col-md-8 col-lg-6">

                <div class="input-group search-box">

                    <span class="input-group-text">
                        <i class="bi bi-search"></i>
                    </span>

                    <input
                        type="text"
                        class="form-control"
                        name="q"
                        placeholder="Cari no pelanggan, nama, atau periode..."
                        value="<?= htmlspecialchars($search) ?>">

                    <button class="btn btn-primary px-4" type="submit">
                        Cari
                    </button>

                    <?php if ($search !== ''): ?>

                        <a
                            class="btn btn-outline-secondary"
                            href="?ps=<?= $limit ?>&sort=<?= urlencode($sort) ?>&dir=<?= urlencode(strtolower($dir)) ?>"
                            title="Reset pencarian">

                            <i class="bi bi-x-lg"></i>

                        </a>

                    <?php endif; ?>

                </div>

            </div>


            <div class="col-12 col-md-4 col-lg-6 d-flex justify-content-md-end">

                <div class="input-group" style="max-width:210px;">

                    <label class="input-group-text" for="ps">
                        <i class="bi bi-list-ul me-1"></i>
                        Tampil
                    </label>

                    <select
                        class="form-select"
                        name="ps"
                        id="ps"
                        onchange="this.form.submit()">

                        <?php foreach ($allowed_sizes as $size): ?>

                            <option
                                value="<?= $size ?>"
                                <?= $size === $limit ? 'selected' : '' ?>>

                                <?= $size ?> / halaman

                            </option>

                        <?php endforeach; ?>

                    </select>

                    <input type="hidden" name="sort" value="<?= htmlspecialchars($sort) ?>">
                    <input type="hidden" name="dir" value="<?= htmlspecialchars(strtolower($dir)) ?>">
                    <input type="hidden" name="page" value="1">

                </div>

            </div>

        </div>

    </form>


    <!-- ========================================================
         22) GRID DATA
         ======================================================== -->
    <div class="grid-card">

        <div class="grid-head d-flex justify-content-between align-items-center">

            <div>
                <div class="fw-bold">Daftar Transaksi PLN</div>

                <div class="record-info">
                    Menampilkan <?= $start_row ?>–<?= $end_row ?>
                    dari <?= number_format($count, 0, ',', '.') ?> data
                </div>
            </div>

            <span class="badge text-bg-light border px-3 py-2">
                <i class="bi bi-lightning-charge me-1"></i>
                <?= number_format($count, 0, ',', '.') ?> transaksi
            </span>

        </div>


        <div class="table-responsive">

            <table class="table table-hover align-middle">

                <thead>
                    <tr>

                        <th class="text-center">No</th>

                        <th>
                            <a class="sort-link" href="<?= sortUrl('id_transaksi', $sort, $dir, $search, $limit) ?>">
                                ID Transaksi <?= sortIcon('id_transaksi', $sort, $dir) ?>
                            </a>
                        </th>

                        <th>
                            <a class="sort-link" href="<?= sortUrl('tgl_bayar', $sort, $dir, $search, $limit) ?>">
                                Tgl Bayar <?= sortIcon('tgl_bayar', $sort, $dir) ?>
                            </a>
                        </th>

                        <th>
                            <a class="sort-link" href="<?= sortUrl('no_pelanggan', $sort, $dir, $search, $limit) ?>">
                                No Pelanggan <?= sortIcon('no_pelanggan', $sort, $dir) ?>
                            </a>
                        </th>

                        <th>
                            <a class="sort-link" href="<?= sortUrl('nama', $sort, $dir, $search, $limit) ?>">
                                Nama <?= sortIcon('nama', $sort, $dir) ?>
                            </a>
                        </th>

                        <th>
                            <a class="sort-link" href="<?= sortUrl('periode', $sort, $dir, $search, $limit) ?>">
                                Periode <?= sortIcon('periode', $sort, $dir) ?>
                            </a>
                        </th>

                        <th class="text-end">
                            <a class="sort-link justify-content-end" href="<?= sortUrl('total_bayar', $sort, $dir, $search, $limit) ?>">
                                Total Bayar <?= sortIcon('total_bayar', $sort, $dir) ?>
                            </a>
                        </th>

                        <th class="text-center">Aksi</th>

                    </tr>
                </thead>


                <tbody>

                    <?php $no = $offset + 1; ?>

                    <?php while ($row = $result->fetch_assoc()): ?>

                        <tr>

                            <td class="text-center">
                                <?= $no++ ?>
                            </td>

                            <td class="text-nowrap">
                                <span class="customer-no">
                                    <?= htmlspecialchars($row['id_transaksi']) ?>
                                </span>
                            </td>

                            <td class="text-nowrap">
                                <?= date('d/m/Y H:i', strtotime($row['tgl_bayar'])) ?>
                            </td>

                            <td>
                                <span class="customer-no">
                                    <?= htmlspecialchars($row['no_pelanggan']) ?>
                                </span>
                            </td>

                            <td>
                                <span class="customer-name">
                                    <?= htmlspecialchars($row['nama']) ?>
                                </span>
                            </td>

                            <td class="text-nowrap">
                                <?= trim((string)$row['periode']) !== ''
                                    ? htmlspecialchars($row['periode'])
                                    : '<span class="text-muted">-</span>' ?>
                            </td>

                            <td class="text-end money total-money">
                                Rp <?= rupiah($row['total_bayar']) ?>
                            </td>

                            <td class="text-center text-nowrap">

                                <div class="d-inline-flex gap-1">

                                    <!-- VIEW TAGIHAN -->
                                    <a
                                        class="btn btn-outline-secondary btn-sm action-btn"
                                        href="nota_tagihan.php?id=<?= (int)$row['id'] ?>"
                                        target="_blank"
                                        title="View Tagihan">

                                        <i class="bi bi-eye"></i>

                                    </a>

                                    <!-- PRINT NOTA -->
                                    <button
                                        type="button"
                                        class="btn btn-outline-primary btn-sm action-btn"
                                        onclick="printNota(<?= (int)$row['id'] ?>)"
                                        title="Print Nota">

                                        <i class="bi bi-printer"></i>

                                    </button>

                                    <!-- PIUTANG
                                         Membuat transaksi kwitansi berstatus Piutang
                                         berdasarkan data PLN ini. -->
                                    <a
                                        class="btn btn-outline-warning btn-sm action-btn"
                                        href="set_piutang_pln.php?id=<?= (int)$row['id'] ?>"
                                        onclick="return confirm('Set transaksi PLN ini sebagai PIUTANG?')"
                                        title="Set Piutang">

                                        <i class="bi bi-wallet2"></i>

                                    </a>

                                </div>

                            </td>

                        </tr>

                    <?php endwhile; ?>


                    <?php if ($result->num_rows === 0): ?>

                        <tr>
                            <td colspan="8" class="text-center py-5 text-muted">

                                <i class="bi bi-inbox fs-2 d-block mb-2"></i>

                                Belum ada data tagihan listrik yang ditemukan.

                            </td>
                        </tr>

                    <?php endif; ?>

                </tbody>

            </table>

        </div>


        <!-- ====================================================
             23) PAGINATION RINGKAS
             ==================================================== -->
        <div class="grid-footer d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-2">

            <div class="record-info">
                Halaman <strong><?= $page ?></strong>
                dari <strong><?= $total_pages ?></strong>
            </div>

            <?php if ($total_pages > 1): ?>

                <nav aria-label="Pagination tagihan listrik">

                    <ul class="pagination pagination-sm">

                        <li class="page-item <?= $page <= 1 ? 'disabled' : '' ?>">

                            <a
                                class="page-link"
                                href="<?= pageUrl(max(1, $page - 1), $search, $limit, $sort, $dir) ?>">

                                <i class="bi bi-chevron-left"></i>

                            </a>

                        </li>


                        <?php
                        // ----------------------------------------------------
                        // Pagination model ringkas seperti index:
                        // 1 ... 8 9 10 11 12 ... 30
                        // ----------------------------------------------------
                        $window = 2;
                        $candidates = [1, $total_pages];

                        for (
                            $i = max(1, $page - $window);
                            $i <= min($total_pages, $page + $window);
                            $i++
                        ) {
                            $candidates[] = $i;
                        }

                        $candidates = array_values(array_unique($candidates));
                        sort($candidates);

                        $prevShown = null;
                        ?>


                        <?php foreach ($candidates as $i): ?>

                            <?php if ($prevShown !== null && $i > $prevShown + 1): ?>

                                <li class="page-item disabled">
                                    <span class="page-link">…</span>
                                </li>

                            <?php endif; ?>

                            <li class="page-item <?= $i === $page ? 'active' : '' ?>">

                                <a
                                    class="page-link"
                                    href="<?= pageUrl($i, $search, $limit, $sort, $dir) ?>">

                                    <?= $i ?>

                                </a>

                            </li>

                            <?php $prevShown = $i; ?>

                        <?php endforeach; ?>


                        <li class="page-item <?= $page >= $total_pages ? 'disabled' : '' ?>">

                            <a
                                class="page-link"
                                href="<?= pageUrl(min($total_pages, $page + 1), $search, $limit, $sort, $dir) ?>">

                                <i class="bi bi-chevron-right"></i>

                            </a>

                        </li>

                    </ul>

                </nav>

            <?php endif; ?>

        </div>

    </div>

</div>


<script>
// ============================================================
// 24) FUNCTION PRINT NOTA
// Membuka nota lalu memanggil dialog print browser.
// ============================================================
function printNota(id)
{
    const printWindow = window.open(
        'nota_tagihan.php?id=' + encodeURIComponent(id),
        '_blank'
    );

    if (!printWindow) {
        alert('Popup diblokir browser. Izinkan popup untuk mencetak nota.');
        return;
    }

    printWindow.addEventListener('load', function () {

        setTimeout(function () {
            printWindow.focus();
            printWindow.print();
        }, 300);

    });
}
</script>


</main>
</div>
</body>
</html>
