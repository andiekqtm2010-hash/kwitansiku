<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'db.php';

// =============================
// FILTER TANGGAL
// =============================
$tanggal_awal  = $_GET['tanggal_awal'] ?? date('Y-m-01');
$tanggal_akhir = $_GET['tanggal_akhir'] ?? date('Y-m-d');

// Validasi sederhana format tanggal
if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $tanggal_awal)) {
    $tanggal_awal = date('Y-m-01');
}
if (!preg_match('/^\d{4}-\d{2}-\d{2}$/', $tanggal_akhir)) {
    $tanggal_akhir = date('Y-m-d');
}
if ($tanggal_awal > $tanggal_akhir) {
    [$tanggal_awal, $tanggal_akhir] = [$tanggal_akhir, $tanggal_awal];
}

// =============================
// TOTAL OMZET & TRANSAKSI
// =============================
$sqlOmzet = "
    SELECT 
        COALESCE(SUM(total), 0) AS total_omzet,
        COUNT(*) AS total_transaksi
    FROM kwitansi
    WHERE tanggal BETWEEN ? AND ?
      AND LOWER(status_bayar) = 'lunas'
";
$stmt = $conn->prepare($sqlOmzet);
$stmt->bind_param("ss", $tanggal_awal, $tanggal_akhir);
$stmt->execute();
$summary = $stmt->get_result()->fetch_assoc();
$stmt->close();

// =============================
// TOTAL ITEM TERJUAL
// =============================
$sqlItemTotal = "
    SELECT 
        COALESCE(SUM(ki.qty), 0) AS total_item
    FROM kwitansi_item ki
    INNER JOIN kwitansi k ON k.id = ki.kwitansi_id
    WHERE k.tanggal BETWEEN ? AND ?
      AND LOWER(k.status_bayar) = 'lunas'
";
$stmt = $conn->prepare($sqlItemTotal);
$stmt->bind_param("ss", $tanggal_awal, $tanggal_akhir);
$stmt->execute();
$totalItem = $stmt->get_result()->fetch_assoc();
$stmt->close();

// =============================
// CUSTOMER PEMBELIAN TERBESAR
// =============================
$sqlCustomer = "
    SELECT
        nama_pelanggan,
        COUNT(*) AS jumlah_transaksi,
        SUM(total) AS total_pembelian
    FROM kwitansi
    WHERE tanggal BETWEEN ? AND ?
      AND LOWER(status_bayar) = 'lunas'
      AND nama_pelanggan IS NOT NULL
      AND TRIM(nama_pelanggan) <> ''
    GROUP BY nama_pelanggan
    ORDER BY total_pembelian DESC
    LIMIT 10
";
$stmt = $conn->prepare($sqlCustomer);
$stmt->bind_param("ss", $tanggal_awal, $tanggal_akhir);
$stmt->execute();
$resultCustomer = $stmt->get_result();
$customerData = [];
while ($row = $resultCustomer->fetch_assoc()) {
    $customerData[] = $row;
}
$stmt->close();

// =============================
// ITEM PALING BANYAK DIBELI
// =============================
$sqlItem = "
    SELECT
        ki.deskripsi,
        SUM(ki.qty) AS jumlah_qty,
        SUM(ki.subtotal) AS total_penjualan
    FROM kwitansi_item ki
    INNER JOIN kwitansi k ON k.id = ki.kwitansi_id
    WHERE k.tanggal BETWEEN ? AND ?
      AND LOWER(k.status_bayar) = 'lunas'
      AND ki.deskripsi IS NOT NULL
      AND TRIM(ki.deskripsi) <> ''
    GROUP BY ki.deskripsi
    ORDER BY jumlah_qty DESC
    LIMIT 10
";
$stmt = $conn->prepare($sqlItem);
$stmt->bind_param("ss", $tanggal_awal, $tanggal_akhir);
$stmt->execute();
$resultItem = $stmt->get_result();
$itemData = [];
while ($row = $resultItem->fetch_assoc()) {
    $itemData[] = $row;
}
$stmt->close();

// =============================
// PEMASUKAN PER BULAN
// =============================
$sqlBulanan = "
    SELECT
        DATE_FORMAT(tanggal, '%Y-%m') AS periode,
        DATE_FORMAT(tanggal, '%m/%Y') AS bulan,
        SUM(total) AS pemasukan,
        COUNT(*) AS transaksi
    FROM kwitansi
    WHERE tanggal BETWEEN ? AND ?
      AND LOWER(status_bayar) = 'lunas'
    GROUP BY DATE_FORMAT(tanggal, '%Y-%m'), DATE_FORMAT(tanggal, '%m/%Y')
    ORDER BY periode ASC
";
$stmt = $conn->prepare($sqlBulanan);
$stmt->bind_param("ss", $tanggal_awal, $tanggal_akhir);
$stmt->execute();
$resultBulanan = $stmt->get_result();
$bulananData = [];
while ($row = $resultBulanan->fetch_assoc()) {
    $bulananData[] = $row;
}
$stmt->close();

// =============================
// DATA UNTUK CHART.JS
// =============================
$customerLabel = [];
$customerValue = [];
foreach ($customerData as $row) {
    $customerLabel[] = $row['nama_pelanggan'];
    $customerValue[] = (float)$row['total_pembelian'];
}

$itemLabel = [];
$itemValue = [];
foreach ($itemData as $row) {
    $itemLabel[] = $row['deskripsi'];
    $itemValue[] = (int)$row['jumlah_qty'];
}

$bulanLabel = [];
$bulanValue = [];
foreach ($bulananData as $row) {
    $bulanLabel[] = $row['bulan'];
    $bulanValue[] = (float)$row['pemasukan'];
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Dashboard Penjualan Mugnesia</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            background: #f4f7fb;
            color: #172033;
        }
        .page-title { font-weight: 700; }
        .card-dashboard {
            border: 1px solid #e7ebf0;
            border-radius: 14px;
            box-shadow: 0 2px 8px rgba(0,0,0,.04);
        }
        .summary-label {
            font-size: 14px;
            color: #6c757d;
        }
        .summary-value {
            font-size: 27px;
            font-weight: 700;
            margin-top: 5px;
        }
        .chart-box {
            position: relative;
            height: 360px;
        }
        .chart-box-large {
            position: relative;
            height: 420px;
        }
        .quick-filter .btn { min-width: 110px; }
    </style>
</head>
<body>

<div class="container-fluid px-4 py-4">

    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="page-title mb-1">Dashboard Penjualan Mugnesia</h2>
            <div class="text-muted">Analisa transaksi dan pemasukan</div>
        </div>
        <button type="button" class="btn btn-outline-secondary" onclick="history.back()">← Kembali</button>
    </div>

    <div class="card card-dashboard mb-4">
        <div class="card-body">
            <form method="GET" class="row g-3 align-items-end" id="filterForm">
                <div class="col-md-3">
                    <label class="form-label">Dari Tanggal</label>
                    <input type="date" name="tanggal_awal" id="tanggal_awal" class="form-control"
                           value="<?= htmlspecialchars($tanggal_awal) ?>">
                </div>

                <div class="col-md-3">
                    <label class="form-label">Sampai Tanggal</label>
                    <input type="date" name="tanggal_akhir" id="tanggal_akhir" class="form-control"
                           value="<?= htmlspecialchars($tanggal_akhir) ?>">
                </div>

                <div class="col-md-2">
                    <button type="submit" class="btn btn-primary w-100">Tampilkan</button>
                </div>

                <div class="col-md-4 quick-filter d-flex gap-2 flex-wrap">
                    <button type="button" class="btn btn-outline-secondary" onclick="setHariIni()">Hari Ini</button>
                    <button type="button" class="btn btn-outline-secondary" onclick="setBulanIni()">Bulan Ini</button>
                    <button type="button" class="btn btn-outline-secondary" onclick="setTahunIni()">Tahun Ini</button>
                </div>
            </form>
        </div>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-md-4">
            <div class="card card-dashboard h-100">
                <div class="card-body">
                    <div class="summary-label">Total Pemasukan</div>
                    <div class="summary-value text-primary">Rp <?= number_format($summary['total_omzet'] ?? 0, 0, ',', '.') ?></div>
                    <div class="small text-muted mt-2">
                        <?= date('d/m/Y', strtotime($tanggal_awal)) ?> s/d <?= date('d/m/Y', strtotime($tanggal_akhir)) ?>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-dashboard h-100">
                <div class="card-body">
                    <div class="summary-label">Transaksi Lunas</div>
                    <div class="summary-value"><?= number_format($summary['total_transaksi'] ?? 0, 0, ',', '.') ?></div>
                    <div class="small text-muted mt-2">Jumlah transaksi berhasil</div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card card-dashboard h-100">
                <div class="card-body">
                    <div class="summary-label">Item Terjual</div>
                    <div class="summary-value">
                        <?= number_format($totalItem['total_item'] ?? 0, 0, ',', '.') ?>
                        <span style="font-size:14px">pcs</span>
                    </div>
                    <div class="small text-muted mt-2">Total quantity item terjual</div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 mb-4">
        <div class="col-lg-6">
            <div class="card card-dashboard h-100">
                <div class="card-body">
                    <h5 class="fw-bold">Pembelian Customer Terbesar</h5>
                    <div class="small text-muted mb-3">Top 10 customer berdasarkan nilai pembelian</div>
                    <div class="chart-box"><canvas id="chartCustomer"></canvas></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="card card-dashboard h-100">
                <div class="card-body">
                    <h5 class="fw-bold">Item Paling Banyak Dibeli</h5>
                    <div class="small text-muted mb-3">Top 10 item berdasarkan jumlah quantity</div>
                    <div class="chart-box"><canvas id="chartItem"></canvas></div>
                </div>
            </div>
        </div>
    </div>

    <div class="card card-dashboard mb-4">
        <div class="card-body">
            <h5 class="fw-bold">Pemasukan Per Bulan</h5>
            <div class="small text-muted mb-3">Perkembangan pemasukan transaksi lunas</div>
            <div class="chart-box-large"><canvas id="chartBulanan"></canvas></div>
        </div>
    </div>
</div>

<script>
function rupiah(angka) {
    return 'Rp ' + new Intl.NumberFormat('id-ID').format(angka);
}

new Chart(document.getElementById('chartCustomer'), {
    type: 'bar',
    data: {
        labels: <?= json_encode($customerLabel, JSON_UNESCAPED_UNICODE) ?>,
        datasets: [{
            label: 'Total Pembelian',
            data: <?= json_encode($customerValue) ?>,
            borderWidth: 1,
            borderRadius: 6
        }]
    },
    options: {
        indexAxis: 'y',
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: { display: false },
            tooltip: { callbacks: { label: context => rupiah(context.raw) } }
        },
        scales: {
            x: {
                beginAtZero: true,
                ticks: { callback: value => rupiah(value) }
            }
        }
    }
});

new Chart(document.getElementById('chartItem'), {
    type: 'bar',
    data: {
        labels: <?= json_encode($itemLabel, JSON_UNESCAPED_UNICODE) ?>,
        datasets: [{
            label: 'Qty',
            data: <?= json_encode($itemValue) ?>,
            borderWidth: 1,
            borderRadius: 6
        }]
    },
    options: {
        indexAxis: 'y',
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: { display: false },
            tooltip: { callbacks: { label: context => context.raw + ' pcs' } }
        },
        scales: {
            x: { beginAtZero: true, ticks: { precision: 0 } }
        }
    }
});

new Chart(document.getElementById('chartBulanan'), {
    type: 'line',
    data: {
        labels: <?= json_encode($bulanLabel, JSON_UNESCAPED_UNICODE) ?>,
        datasets: [{
            label: 'Pemasukan',
            data: <?= json_encode($bulanValue) ?>,
            borderWidth: 3,
            pointRadius: 5,
            pointHoverRadius: 7,
            tension: 0.3,
            fill: true
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: { display: false },
            tooltip: { callbacks: { label: context => rupiah(context.raw) } }
        },
        scales: {
            y: {
                beginAtZero: true,
                ticks: { callback: value => rupiah(value) }
            }
        }
    }
});

function toYmd(date) {
    const y = date.getFullYear();
    const m = String(date.getMonth() + 1).padStart(2, '0');
    const d = String(date.getDate()).padStart(2, '0');
    return `${y}-${m}-${d}`;
}

function applyRange(start, end) {
    document.getElementById('tanggal_awal').value = toYmd(start);
    document.getElementById('tanggal_akhir').value = toYmd(end);
    document.getElementById('filterForm').submit();
}

function setHariIni() {
    const now = new Date();
    applyRange(now, now);
}

function setBulanIni() {
    const now = new Date();
    const start = new Date(now.getFullYear(), now.getMonth(), 1);
    applyRange(start, now);
}

function setTahunIni() {
    const now = new Date();
    const start = new Date(now.getFullYear(), 0, 1);
    applyRange(start, now);
}
</script>

</body>
</html>
