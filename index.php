<?php
require_once "db.php";

function scalarValue($conn, $sql, $default = 0) {
    $r = $conn->query($sql);
    if (!$r) return $default;
    $row = $r->fetch_row();
    return $row ? ($row[0] ?? $default) : $default;
}

$today = date('Y-m-d');
$monthStart = date('Y-m-01');
$monthEnd = date('Y-m-t');

$transaksi_hari_ini = (int) scalarValue($conn, "SELECT COUNT(*) FROM kwitansi WHERE tanggal = '".$conn->real_escape_string($today)."'");
$pemasukan_hari_ini = (float) scalarValue($conn, "SELECT COALESCE(SUM(total),0) FROM kwitansi WHERE tanggal = '".$conn->real_escape_string($today)."' AND LOWER(status_bayar)='lunas'");
$piutang = (float) scalarValue($conn, "SELECT COALESCE(SUM(total),0) FROM kwitansi WHERE LOWER(status_bayar)='piutang'");
$transaksi_bulan_ini = (int) scalarValue($conn, "SELECT COUNT(*) FROM kwitansi WHERE tanggal BETWEEN '".$conn->real_escape_string($monthStart)."' AND '".$conn->real_escape_string($monthEnd)."'");
$pemasukan_bulan_ini = (float) scalarValue($conn, "SELECT COALESCE(SUM(total),0) FROM kwitansi WHERE tanggal BETWEEN '".$conn->real_escape_string($monthStart)."' AND '".$conn->real_escape_string($monthEnd)."' AND LOWER(status_bayar)='lunas'");

$recent = $conn->query("SELECT id,no_kwitansi,tanggal,nama_pelanggan,status_bayar,total,catatan FROM kwitansi ORDER BY id DESC LIMIT 8");
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard Mugnesia Counter</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
:root{--bg:#f4f7fb;--side:#0f172a;--side2:#172554;--muted:#64748b;--border:#e5eaf0;--blue:#0d6efd}
*{box-sizing:border-box} body{margin:0;background:var(--bg);font-family:Arial,Helvetica,sans-serif;color:#0f172a}
.app{min-height:100vh;display:flex}.sidebar{width:260px;background:linear-gradient(180deg,var(--side),var(--side2));color:#fff;position:fixed;inset:0 auto 0 0;padding:22px 16px;overflow-y:auto}
.brand{padding:4px 10px 22px;border-bottom:1px solid rgba(255,255,255,.12);margin-bottom:18px}.brand-title{font-size:22px;font-weight:800;letter-spacing:.2px}.brand-sub{font-size:12px;color:#cbd5e1;margin-top:4px}
.nav-section{font-size:10px;font-weight:800;letter-spacing:1.2px;color:#94a3b8;padding:14px 12px 7px}.side-link{display:flex;align-items:center;gap:11px;color:#dbeafe;text-decoration:none;padding:11px 12px;border-radius:10px;margin:3px 0;font-size:14px;font-weight:600}.side-link i{font-size:17px;width:20px;text-align:center}.side-link:hover,.side-link.active{background:rgba(255,255,255,.12);color:#fff}.side-link.active{box-shadow:inset 3px 0 0 #60a5fa}.side-sub{padding-left:17px}.side-sub .side-link{font-size:13px;padding:9px 12px;color:#cbd5e1}
.main{margin-left:260px;width:calc(100% - 260px);padding:28px 32px}.topbar{display:flex;justify-content:space-between;gap:20px;align-items:center;margin-bottom:24px}.title{font-size:29px;font-weight:800;letter-spacing:-.5px}.subtitle{color:var(--muted);font-size:14px;margin-top:4px}.date-pill{background:#fff;border:1px solid var(--border);border-radius:10px;padding:9px 13px;color:#475569;font-size:13px}
.stat{background:#fff;border:1px solid var(--border);border-radius:14px;padding:18px;box-shadow:0 5px 18px rgba(15,23,42,.04);height:100%}.stat-icon{width:42px;height:42px;border-radius:11px;display:flex;align-items:center;justify-content:center;font-size:20px;background:#eff6ff;color:#2563eb}.stat-label{color:var(--muted);font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:.35px}.stat-value{font-size:24px;font-weight:800;margin-top:6px}.stat-note{font-size:12px;color:#94a3b8;margin-top:5px}
.cardx{background:#fff;border:1px solid var(--border);border-radius:14px;box-shadow:0 5px 18px rgba(15,23,42,.04);overflow:hidden}.cardx-head{padding:16px 18px;border-bottom:1px solid var(--border);display:flex;justify-content:space-between;align-items:center}.cardx-title{font-weight:800}.quick{display:flex;gap:12px;flex-wrap:wrap}.quick a{min-width:150px;background:#fff;border:1px solid var(--border);border-radius:12px;padding:14px;text-decoration:none;color:#0f172a;display:flex;align-items:center;gap:10px;font-weight:700;box-shadow:0 3px 12px rgba(15,23,42,.03)}.quick a:hover{border-color:#93c5fd;background:#f8fbff}.quick i{font-size:20px;color:#2563eb}
.table{margin:0}.table th{background:#f8fafc;color:#475569;font-size:11px;text-transform:uppercase;padding:12px 14px}.table td{font-size:13px;padding:12px 14px;vertical-align:middle;border-color:#eef2f7}.badge-lunas{background:#dcfce7;color:#166534}.badge-piutang{background:#fff7d6;color:#92400e}.status{display:inline-block;padding:5px 9px;border-radius:999px;font-size:11px;font-weight:700}
@media(max-width:900px){.sidebar{width:78px;padding:20px 10px}.brand-title,.brand-sub,.side-link span,.nav-section{display:none}.side-link{justify-content:center}.side-link i{font-size:20px}.side-sub{padding-left:0}.main{margin-left:78px;width:calc(100% - 78px);padding:20px}.topbar{align-items:flex-start;flex-direction:column}}

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
.mug-main{margin-left:260px;width:calc(100% - 260px);min-height:100vh;padding:28px 32px;}
@media(max-width:900px){
 .mug-sidebar{width:78px;padding:20px 10px}
 .mug-brand-title,.mug-brand-sub,.mug-side-link span,.mug-nav-section{display:none}
 .mug-side-link{justify-content:center}.mug-side-link i{font-size:20px}
 .mug-main{margin-left:78px;width:calc(100% - 78px);padding:20px}
}

</style>
</head>
<body>
<div class="mug-app">
<?php require __DIR__ . "/layout/sidebar.php"; ?>
<main class="mug-main">
  <div class="topbar"><div><div class="title">Dashboard Mugnesia</div><div class="subtitle">Ringkasan transaksi dan akses cepat layanan Mugnesia Counter.</div></div><div class="date-pill"><i class="bi bi-calendar3 me-2"></i><?= date('d/m/Y') ?></div></div>
  <div class="row g-3 mb-4">
    <div class="col-xl-3 col-md-6"><div class="stat"><div class="d-flex justify-content-between"><div><div class="stat-label">Transaksi Hari Ini</div><div class="stat-value"><?= number_format($transaksi_hari_ini,0,',','.') ?></div></div><div class="stat-icon"><i class="bi bi-receipt"></i></div></div><div class="stat-note">Kwitansi tercatat hari ini</div></div></div>
    <div class="col-xl-3 col-md-6"><div class="stat"><div class="d-flex justify-content-between"><div><div class="stat-label">Pemasukan Hari Ini</div><div class="stat-value">Rp <?= number_format($pemasukan_hari_ini,0,',','.') ?></div></div><div class="stat-icon"><i class="bi bi-cash-stack"></i></div></div><div class="stat-note">Transaksi berstatus lunas</div></div></div>
    <div class="col-xl-3 col-md-6"><div class="stat"><div class="d-flex justify-content-between"><div><div class="stat-label">Total Piutang</div><div class="stat-value">Rp <?= number_format($piutang,0,',','.') ?></div></div><div class="stat-icon"><i class="bi bi-hourglass-split"></i></div></div><div class="stat-note">Kwitansi berstatus piutang</div></div></div>
    <div class="col-xl-3 col-md-6"><div class="stat"><div class="d-flex justify-content-between"><div><div class="stat-label">Transaksi Bulan Ini</div><div class="stat-value"><?= number_format($transaksi_bulan_ini,0,',','.') ?></div></div><div class="stat-icon"><i class="bi bi-calendar2-check"></i></div></div><div class="stat-note">Pemasukan Rp <?= number_format($pemasukan_bulan_ini,0,',','.') ?></div></div></div>
  </div>
  <div class="cardx mb-4"><div class="cardx-head"><div><div class="cardx-title">Akses Cepat</div><div class="subtitle">Pilih transaksi yang ingin dikerjakan.</div></div></div><div class="p-3 quick">
    <a href="kwitansi_form.php"><i class="bi bi-plus-circle"></i>Buat Kwitansi</a><a href="input_tagihan.php"><i class="bi bi-lightning-charge"></i>Input PLN</a><a href="input_bpjs.php"><i class="bi bi-heart-pulse"></i>Input BPJS</a><a href="laporan_penjualan.php"><i class="bi bi-graph-up-arrow"></i>Laporan Penjualan</a>
  </div></div>
  <div class="cardx"><div class="cardx-head"><div><div class="cardx-title">Transaksi Terbaru</div><div class="subtitle">8 kwitansi terakhir yang tersimpan.</div></div><a href="list_kwitansi.php" class="btn btn-sm btn-outline-primary">Lihat Semua</a></div><div class="table-responsive"><table class="table"><thead><tr><th>No Kwitansi</th><th>Tanggal</th><th>Pelanggan</th><th>Catatan</th><th>Status</th><th class="text-end">Total</th></tr></thead><tbody>
  <?php if ($recent && $recent->num_rows): while($r=$recent->fetch_assoc()): $st=strtolower(trim($r['status_bayar']??'')); ?>
  <tr><td><a href="kwitansi_edit.php?id=<?= (int)$r['id'] ?>" class="text-decoration-none fw-bold"><?= htmlspecialchars($r['no_kwitansi']) ?></a></td><td class="text-nowrap"><?= date('d/m/Y',strtotime($r['tanggal'])) ?></td><td class="fw-semibold"><?= htmlspecialchars($r['nama_pelanggan']) ?></td><td class="text-muted"><?= htmlspecialchars(mb_strimwidth($r['catatan']??'',0,55,'…')) ?></td><td><span class="status <?= $st==='lunas'?'badge-lunas':($st==='piutang'?'badge-piutang':'bg-light') ?>"><?= htmlspecialchars($r['status_bayar'] ?: '-') ?></span></td><td class="text-end fw-bold text-nowrap">Rp <?= number_format($r['total'],0,',','.') ?></td></tr>
  <?php endwhile; else: ?><tr><td colspan="6" class="text-center text-muted py-4">Belum ada transaksi.</td></tr><?php endif; ?>
  </tbody></table></div></div>
</main>
</div>
</body></html>
