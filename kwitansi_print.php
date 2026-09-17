<?php
require_once "db.php"; // Ambil koneksi database ($conn)

// =========================
// 1) Ambil parameter ID dari query string
//    - Pastikan bertipe integer agar aman dari injection/typo
// =========================
$id = (int)($_GET['id'] ?? 0);

// =========================
// 2) Ambil data HEADER kwitansi
//    - Menggunakan prepared statement untuk keamanan
//    - Jika id tidak ditemukan -> hentikan (die)
// =========================
$stmt = $conn->prepare("SELECT * FROM kwitansi WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$head = $stmt->get_result()->fetch_assoc();
$stmt->close();
if (!$head) { die("Kwitansi tidak ditemukan."); }

// =========================
// 3) Ambil data DETAIL (items) kwitansi
//    - Semua item berdasarkan kwitansi_id
// =========================
$stmt = $conn->prepare("SELECT * FROM kwitansi_item WHERE kwitansi_id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$items = $stmt->get_result();
$stmt->close();
$item_count = $items->num_rows;

// =========================
// 4) Informasi toko (static/display)
//    - Bisa dipindah ke tabel pengaturan jika perlu dinamis
// =========================
$toko_nama   = "MUGNESIA COUNTER PPOB & SABLON KAOS DTF & CETAK MUG";
$toko_alamat = "Jalan Kemangsen Selatan RT.05 RW.02 No.81 WA: 0813-3260-2222";
$toko_telp   = "081330222222"; // (Belum dipakai di tampilan)

// =========================
// 5) Nama pelanggan & jam transaksi
//    - Set timezone agar jam konsisten WIB
//    - Tampilkan jam dari kolom created_at jika ada, jika tidak gunakan jam saat ini
// =========================
date_default_timezone_set('Asia/Jakarta');
$nama_pelanggan = trim($head['nama_pelanggan'] ?? '') !== '' ? $head['nama_pelanggan'] : 'Pelanggan';
$jam_transaksi  = !empty($head['created_at'])
  ? date('H:i', strtotime($head['created_at']))
  : date('H:i'); // fallback jika created_at kosong

// =========================
// 6) Parameter ukuran area kwitansi (opsional via query string)
//    - rw: lebar (cm), rh: tinggi (cm)
//    - Dibatasi agar tetap wajar
// =========================
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
  /* ======================
     7) Gaya cetak & layout
     - @media print: atur margin halaman & sembunyikan elemen no-print
     - .page: area A4
     - .receipt: kartu kwitansi di dalam A4
     ====================== */
  @media print {
    @page { size: A4; margin: 0.5cm; }
    .no-print { display:none !important; }
    html, body { margin:0; padding:0; -webkit-print-color-adjust:exact; print-color-adjust:exact; }
    .page { width:20cm; height:auto; min-height:28.7cm; margin:0; padding:0; box-shadow:none; }
    .receipt { margin:0; }
  }
  body { background:#f3f5f7; margin:0; }
  .page {
    width: 21cm; height: 29.7cm;
    margin: 12px auto; background:#fff; box-shadow:0 0 0 1px #dfe6ec;
    position: relative; box-sizing: border-box; padding:0.5cm;
  }
  /* ============================================================
    AREA KWITANSI
    - Tinggi tetap mengikuti ukuran kwitansi
    - Padding diperkecil agar footer / TOTAL tetap masuk
    ============================================================ */
  .receipt {
      width: <?= $RW ?>cm;
      /* height: <?= $RH ?>cm; */
      height:auto;
      min-height:7 cm;

      border:1px solid #cfd8dc;
      background:#fff;
      box-sizing:border-box;

      padding:4mm 6mm;

      /* Jangan sembunyikan footer / total */
      overflow:visible;

      font-family:Arial, sans-serif;
      font-size:12px;
      line-height:1.20;

      position:relative;
      left:0;
      top:0;
  }

  .brand { color:#1c4fa8; font-weight:800; letter-spacing:.3px; font-size:18px; margin-bottom:3mm; }
  .hdr td { padding:1mm 0; vertical-align:top; }
  .logo { width:34mm; height:auto; object-fit:contain; border:none; solid #eee; padding:3mm; background:#fff; }

  table.kwt { width:100%; border-collapse:collapse; }
  .kwt th, .kwt td { border:1px solid #d8e0e6; padding:2.8mm 3mm; }
  .kwt th { background:#f6f8fb; font-weight:700; }

  /* Jika item banyak, rapatkan vertikal agar footer tetap muat di area 20x10 cm */
  .receipt.compact { padding:5mm 6mm; font-size:12px; line-height:1.18; }
  .receipt.compact .brand { margin-bottom:1.5mm; }
  .receipt.compact .hdr td { padding:.45mm 0; }
  .receipt.compact .mt-2 { margin-top:1.5mm !important; }
  .receipt.compact .kwt th,
  .receipt.compact .kwt td { padding:1.45mm 3mm; }
  .receipt.compact .bar { margin:2.5mm 0 1.5mm; }
  .receipt.compact .note { font-size:11px; line-height:1.15; }
  .receipt.compact .mt-3 { margin-top:1.5mm !important; }
  .text-end { text-align:right !important; }
  .text-center { text-align:center !important; }

  .bar { height:3px; background:#2a75cc; margin:4mm 0 2mm; }
  .note { color:#3b77b6; font-style:italic; }

  /* ============================================================
     CATATAN PELANGGAN DI INVOICE
     - Ditampilkan tepat di bawah tabel item
     - Ukuran font dibuat sama dengan nomor/judul invoice (.brand = 18px)
     - Warna hitam agar jelas saat dicetak
     ============================================================ */
  .customer-note {
      color:#000;
      font-size:16px;
      line-height:1.10;
      margin:1mm 0 0.8mm;
      font-weight:400;
  }
  .customer-note strong { font-weight:800; }

  /* Pada mode compact, margin diperkecil agar tetap muat 20 x 10 cm.
     Ukuran font catatan tetap 18px sesuai permintaan. */
  .receipt.compact .customer-note { margin:1.5mm 0 1mm; }

  .seal { border:2px solid #0f0f0fff; border-radius:50%; width:26mm; height:26mm;
          display:flex; align-items:center; justify-content:center; font-weight:800; font-size:10px; }
</style>
</head>
<body>

<!-- ======================
     8) Bar kontrol (hanya tampil non-print)
     ====================== -->
<div class="no-print d-flex justify-content-end gap-2" style="max-width:21cm;margin:10px auto 0;">
  <a href="index.php" class="btn btn-outline-secondary btn-sm">Kembali</a>
  <button class="btn btn-primary btn-sm" onclick="window.print()">Print</button>
  <div class="btn btn-light btn-sm disabled">Area kwitansi: <?= $RW ?>cm × <?= $RH ?>cm</div>
</div>

<!-- ======================
     9) Area halaman A4 & komponen kwitansi
     ====================== -->
<div class="page">
  <!--<div class="receipt<?= $item_count >= 4 ? ' compact' : '' ?>"> -->
  <div class="receipt<?= ($item_count >= 3 || trim($head['catatan'] ?? '') !== '') ? ' compact' : '' ?>">  
    <!-- 9a) Header: identitas toko + info transaksi -->
    <div class="d-flex justify-content-between align-items-start" style="border:0px solid #0f0f0fff;">
      <div style="flex:1 1 auto; padding-right:8mm;">
        <!-- Judul/Brand + No Kwitansi -->
        <div class="brand" style="border:0px solid #0f0f0fff;">INVOICE <?= htmlspecialchars($head['no_kwitansi']) ?></div>

        <!-- Tabel info toko -->
        <table class="hdr test" style="border-collapse:collapse; table-layout:fixed;">
          <tr>
            <td style="width:26mm;">Nama Toko</td>
            <td style="font-weight:800;">: <?= htmlspecialchars($toko_nama) ?></td>
          </tr>
          <tr>
            <td>Alamat</td>
            <!-- catatan: tambahkan htmlspecialchars untuk keamanan -->
            <td>: <?= htmlspecialchars($toko_alamat) ?></td>
          </tr>
        </table>

        <!-- Tabel tanggal & jam -->
        <table>
          <tr style="border:0px solid #0f0f0f">
            <td style="width:26mm;">Tanggal</td>
            <td>: <?= date('d F Y', strtotime($head['tanggal'])) ?></td>
            <td>Jam</td>
            <td>: <?= $jam_transaksi ?> WIB</td>
          </tr>
        </table>

        <!-- Tabel pelanggan & status -->
        <table>
          <tr style="border:0px solid #0f0f0f;">
            <td style="width:26mm">Pelanggan</td>
            <td style="padding-ledt:0">: <?= htmlspecialchars($head['nama_pelanggan']) ?></td>
          </tr>
        </table>
      </div>

      <!-- Logo & status (opsional) -->
      <div class="text-end">
        <img src="LogoInvoice.png" alt="logo" class="logo">
        <div style="margin-top:1mm; display:flex; justify-content:flex-end; align-items:center; gap:2mm; font-size:12px; white-space:nowrap;">
          <span>Status :</span>
          <strong><?= htmlspecialchars($head['status_bayar']) ?></strong>
        </div>
      </div>
    </div>

    <!-- 9b) Daftar Items -->
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
            <!-- nl2br + htmlspecialchars agar baris deskripsi tetap aman & rapi -->
            <td><?= nl2br(htmlspecialchars($it['deskripsi'])) ?></td>
            <td class="text-center"><?= (int)$it['qty'] ?></td>
            <td class="text-end"><?= number_format($it['harga'],0,',','.') ?></td>
            <td class="text-end"><?= number_format($it['subtotal'],0,',','.') ?></td>
          </tr>
        <?php endwhile; ?>
        </tbody>
      </table>
    </div>

    <!-- ============================================================
         9c) CATATAN PELANGGAN
         Sumber data: kolom `catatan` pada tabel `kwitansi`.
         Hanya tampil jika catatan di form diisi (tidak kosong).
         Posisi: tepat di bawah tabel item, sebelum garis biru/footer.
         ============================================================ -->
    <?php if (trim($head['catatan'] ?? '') !== ''): ?>
      <div class="customer-note">
        <strong>Catatan:</strong> <?= nl2br(htmlspecialchars($head['catatan'])) ?>
      </div>
    <?php endif; ?>

    <!-- 9d) Footer branding & Total -->
    <div class="bar"></div>
    <div class="row g-2">
      <!-- Catatan motivasi/branding -->
      <div class="col-7">
        <div class="note">
          Setiap mug bercerita, dan cerita Anda adalah inspirasi kami. Terima kasih telah menjadi bagian dari perjalanan Mugnesia.
        </div>
      </div>

      <!-- Ringkasan nilai akhir -->
      <div class="col-5">
        <table style="width:100%;">
          <!-- Jika Anda menyimpan total_bruto di DB, bisa ditampilkan di sini juga -->
          <!-- <tr>
            <th style="width:55%; text-align:left;">Total Bruto:</th>
            <td class="text-end"><strong>Rp <?= number_format($head['total_bruto'] ?? 0, 0, ',', '.') ?></strong></td>
          </tr> -->
          <!--
          <tr>
            <th style="width:55%; text-align:left;">Discount:</th>
            <td class="text-end"><strong>Rp <?= number_format($head['discount'],0,',','.') ?></strong></td>
          </tr>
          <tr>
            <th style="width:55%; text-align:left;">Nilai Akhir:</th>
            <td class="text-end"><strong>Rp <?= number_format($head['total'],0,',','.') ?></strong></td>
          </tr>
          -->

                  <!-- ============================================================
              RINGKASAN PEMBAYARAN
              ============================================================ -->
          <tr>
              <th style="width:55%; text-align:left; padding:1px 0;">
                  Discount:
              </th>

              <td class="text-end" style="padding:1px 0;">
                  Rp <?= number_format($head['discount'],0,',','.') ?>
              </td>
          </tr>

          <tr>
              <th style="
                  width:55%;
                  text-align:left;
                  padding-top:3px;
                  font-size:14px;
                  font-weight:800;
                  border-top:1px solid #555;
              ">
                  TOTAL:
              </th>

              <td class="text-end" style="
                  padding-top:3px;
                  font-size:14px;
                  font-weight:800;
                  border-top:1px solid #555;
              ">
                  Rp <?= number_format($head['total'],0,',','.') ?>
              </td>
          </tr>

        </table>

        <!-- Tanda tangan / stempel (opsional desain) -->
        <div class="d-flex text-align:center mt-3" style="border:0px solid #0c0303ff">Hormat Kami</div>
      </div><!-- /.col-5 -->
    </div><!-- /.row -->
  </div><!-- /.receipt -->
</div><!-- /.page -->

</body>
</html>
