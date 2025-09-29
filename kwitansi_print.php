<?php
require_once "db.php";
$id = (int)($_GET['id'] ?? 0);

// Header
$stmt = $conn->prepare("SELECT * FROM kwitansi WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$head = $stmt->get_result()->fetch_assoc();
$stmt->close();
if (!$head) { die("Kwitansi tidak ditemukan."); }

// Detail
$stmt = $conn->prepare("SELECT * FROM kwitansi_item WHERE kwitansi_id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$items = $stmt->get_result();
$stmt->close();

// Info toko
$toko_nama   = "MUGNESIA COUNTER PPOB-MUG-TSHIRT";
$toko_alamat = "Jalan Kemangsen Selatan RT.05 RW.02 No.81";
$toko_telp   = "081330222222";

// ===== Tambahan: Nama pelanggan & jam transaksi =====
date_default_timezone_set('Asia/Jakarta'); // agar jam konsisten WIB
$nama_pelanggan = trim($head['nama_pelanggan'] ?? '') !== '' ? $head['nama_pelanggan'] : 'Pelanggan';
$jam_transaksi  = !empty($head['created_at'])
  ? date('H:i', strtotime($head['created_at']))
  : date('H:i'); // fallback

// --- Ukuran kwitansi (cm) bisa diubah lewat query, mis. ?rw=18&rh=8 ---
$RW = is_numeric($_GET['rw'] ?? null) ? max(8, min(21, (float)$_GET['rw'])) : 20.0; // lebar cm
$RH = is_numeric($_GET['rh'] ?? null) ? max(5, min(21, (float)$_GET['rh'])) : 10.0; // tinggi cm
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<title><?=$head['no_kwitansi']?> - A4 (cut)</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  @media print {
    @page { size: A4; margin: 0.5cm; } /* margin 0.5 cm di semua sisi */
    .no-print { display:none !important; }
    body { margin:0; -webkit-print-color-adjust:exact; print-color-adjust:exact; }
  }
  body { background:#f3f5f7; margin:0; }
  .page {
    width: 21cm; height: 29.7cm;
    margin: 12px auto; background:#fff; box-shadow:0 0 0 1px #dfe6ec;
    position: relative; box-sizing: border-box; padding:0.5cm;
  }
  .receipt {
    width: <?= $RW ?>cm; height: <?= $RH ?>cm;
    border:1px solid #cfd8dc; background:#fff; box-sizing:border-box;
    padding:6mm; overflow:hidden; font-family: Arial, sans-serif;
    font-size:12px; line-height:1.28;
    position: relative; left: 0; top: 0;
  }

  .brand { color:#1c4fa8; font-weight:800; letter-spacing:.3px; font-size:18px; margin-bottom:3mm; }
  .hdr td { padding:1mm 0; vertical-align:top; }
  .logo { width:34mm; height:auto; object-fit:contain; border:1px solid #eee; padding:3mm; background:#fff; }

  table.kwt { width:100%; border-collapse:collapse; }
  .kwt th, .kwt td { border:1px solid #d8e0e6; padding:2.8mm 3mm; }
  .kwt th { background:#f6f8fb; font-weight:700; }
  .text-end { text-align:right !important; }
  .text-center { text-align:center !important; }

  .bar { height:3px; background:#2a75cc; margin:4mm 0 2mm; }
  .note { color:#3b77b6; font-style:italic; }

  .seal { border:2px solid #0f0f0fff; border-radius:50%; width:26mm; height:26mm;
          display:flex; align-items:center; justify-content:center; font-weight:800; font-size:10px; }
</style>
</head>
<body>

<div class="no-print d-flex justify-content-end gap-2" style="max-width:21cm;margin:10px auto 0;">
  <a href="index.php" class="btn btn-outline-secondary btn-sm">Kembali</a>
  <button class="btn btn-primary btn-sm" onclick="window.print()">Print A4</button>
  <div class="btn btn-light btn-sm disabled">Area kwitansi: <?= $RW ?>cm × <?= $RH ?>cm</div>
</div>

<div class="page">
  <div class="receipt">
    <!-- Header -->
    <div class="d-flex justify-content-between align-items-start" style="border:0px solid #0f0f0fff;">
      <div style="flex:1 1 auto; padding-right:8mm;">
        <div class="brand" style="border:0px solid #0f0f0fff;">INVOICE <?= htmlspecialchars($head['no_kwitansi']) ?></div>
            <table class="hdr test" style="border-collapse:collapse table-layout:fixed;">
                <tr><td style="width:26mm;">Nama Toko</td><td>: <?= htmlspecialchars($toko_nama) ?></td></tr>
                <tr><td>Alamat</td><td>: <?= htmlspecialchars($toko_alamat) ?></tr>
            </table>
            <table>
                <tr style="border:0px solid #0f0f0f">
                  <td style="width:26mm;">Tanggal</td><td>: <?= date('d F Y', strtotime($head['tanggal'])) ?></td>
                  <td>Jam</td><td>: <?= $jam_transaksi ?> WIB</td>
                </tr>
            </table>
            <table>
                <tr style="border:0px solid #0f0f0f;">
                <!-- BARIS BARU -->
                <td style="width:26mm">Pelanggan</td><td style="width:30%">: <?= htmlspecialchars($head['nama_pelanggan']) ?></td>
                <td>Status</td><td style="width:26mm">: <?= htmlspecialchars($head['status_bayar']) ?></td>
                <!-- END BARU -->
                </tr>
            </table>
      </div>
      <div class="text-end">
        <img src="logo.png" alt="logo" class="logo">
      </div>
    </div>

    <!-- Items -->
    <div class="mt-2">
      <table class="kwt">
        <thead>
        <tr>
          <th>Deskripsi Barang</th>
          <th class="text-center" style="width:12%;">Jumlah</th>
          <th class="text-end" style="width:18%;">Harga (Rp)</th>
          <th class="text-end" style="width:18%;">Total (Rp)</th>
        </tr>
        </thead>
        <tbody>
        <?php while($it = $items->fetch_assoc()): ?>
          <tr>
            <td><?= nl2br(htmlspecialchars($it['deskripsi'])) ?></td>
            <td class="text-center"><?= (int)$it['qty'] ?></td>
            <td class="text-end"><?= number_format($it['harga'],0,',','.') ?></td>
            <td class="text-end"><?= number_format($it['subtotal'],0,',','.') ?></td>
          </tr>
        <?php endwhile; ?>
        </tbody>
      </table>
    </div>

    <!-- Note & Total -->
    <div class="bar"></div>
    <div class="row g-2">
      <div class="col-7">
        <div class="note">
          Setiap mug bercerita, dan cerita Anda adalah inspirasi kami. Terima kasih telah menjadi bagian dari perjalanan Mugnesia.
        </div>
      </div>
      <div class="col-5">
        <table style="width:100%;">
          <tr>
            <th style="width:55%; text-align:left;">Total Bayar:</th>
            <td class="text-end"><strong>Rp <?= number_format($head['total'],0,',','.') ?></strong></td>
          </tr>
        </table>

<div class="d-flex text-align:center mt-3" style="border:0px solid #0c0303ff">Hormat Kami</div>
<div class="d-flex justify-content-between align-items-center mt-4" style="border:0px solid #0c0303ff">Admin Mugnesia</div>
</div><!-- /.receipt -->
</div><!-- /.page -->

</body>
</html>