<?php
// ============================================================
// FILE: nota_bpjs.php
// FUNGSI:
// - Menampilkan nota pembayaran BPJS Kesehatan
// - Layout dibuat HORIZONTAL agar hemat kertas A4
// - Mengambil data transaksi berdasarkan parameter GET: ?id=...
// - Tombol navigasi tidak ikut tercetak
// ============================================================

require_once "db.php"; // Koneksi database ($conn)


// ============================================================
// 1) VALIDASI ID TRANSAKSI
// Pastikan parameter id tersedia dan berupa angka positif.
// ============================================================
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

if ($id <= 0) {
    die("ID transaksi BPJS tidak valid.");
}


// ============================================================
// 2) AMBIL DATA TRANSAKSI BPJS
// Menggunakan prepared statement agar query lebih aman.
// ============================================================
$sql = "SELECT
            id,
            id_transaksi,
            tgl_bayar,
            no_polis,
            nama,
            jml_peserta,
            periode,
            rp_tagihan,
            admin_bank,
            total_bayar,
            keterangan,
            cetak_keterangan
        FROM tb_tagihan_bpjs
        WHERE id = ?
        LIMIT 1";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Gagal menyiapkan query: " . $conn->error);
}

$stmt->bind_param("i", $id);
$stmt->execute();

$result = $stmt->get_result();
$data   = $result->fetch_assoc();

$stmt->close();


// ============================================================
// 3) VALIDASI DATA HASIL QUERY
// ============================================================
if (!$data) {
    die("Data transaksi BPJS tidak ditemukan.");
}


// ============================================================
// 4) HELPER FORMAT RUPIAH
// Contoh:
// 202917 -> 202.917
// ============================================================
function format_angka_rupiah($value)
{
    return number_format((float)$value, 0, ',', '.');
}


// ============================================================
// 5) HELPER ESCAPE HTML
// Mencegah karakter khusus merusak HTML.
// ============================================================
function e($value)
{
    return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8');
}


// ============================================================
// 6) SIAPKAN DATA TAMPILAN
// ============================================================
$tgl_bayar_display = date('d-m-Y H:i:s', strtotime($data['tgl_bayar']));
$periode_display   = trim((string)$data['periode']) !== '' ? $data['periode'] : '-';
$jml_peserta       = max(1, (int)$data['jml_peserta']);
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Nota BPJS - <?= e($data['nama']) ?></title>

<style>
    /* ============================================================
       7) RESET DASAR
       ============================================================ */
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        padding: 18px;
        background: #eef1f5;
        color: #111;
        font-family: "Courier New", Courier, monospace;
    }


    /* ============================================================
       8) ACTION BAR
       Tombol hanya tampil di browser, tidak ikut dicetak.
       ============================================================ */
    .action-bar {
        width: 100%;
        max-width: 1120px;
        margin: 0 auto 12px;
        display: flex;
        justify-content: space-between;
        gap: 10px;
        font-family: Arial, Helvetica, sans-serif;
    }

    .btn {
        display: inline-block;
        padding: 9px 14px;
        border-radius: 8px;
        border: 1px solid #cbd5e1;
        background: #fff;
        color: #1f2937;
        text-decoration: none;
        font-size: 13px;
        font-weight: 700;
        cursor: pointer;
    }

    .btn-print {
        background: #0d6efd;
        color: #fff;
        border-color: #0d6efd;
    }


    /* ============================================================
       9) CONTAINER NOTA
       Dibuat lebar dan pendek agar hemat penggunaan kertas A4.
       ============================================================ */
    .receipt {
        width: 100%;
        max-width: 1120px;
        margin: 0 auto;
        background: #fff;
        border: 1px solid #222;
        padding: 18px 24px 14px;
        box-shadow: 0 5px 20px rgba(15,23,42,.06);
    }


    /* ============================================================
       10) HEADER BRAND MUGNESIA
       Tanpa gambar / icon sesuai permintaan.
       ============================================================ */
    .brand {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 27px;
        font-weight: 900;
        letter-spacing: .3px;
        line-height: 1;
        margin-bottom: 8px;
    }

    .brand .mug {
        color: #111;
    }

    .brand .nesia {
        color: #e91e63;
    }

    .brand .counter {
        color: #111;
    }

    .store-line {
        font-size: 15px;
        font-weight: 700;
        line-height: 1.35;
    }


    /* ============================================================
       11) JUDUL NOTA
       ============================================================ */
    .receipt-title {
        text-align: center;
        font-size: 17px;
        font-weight: 700;
        margin: 10px 0 8px;
        text-transform: uppercase;
    }


    /* ============================================================
       12) AREA INFORMASI 2 KOLOM
       Kiri  : detail peserta/transaksi
       Kanan : rincian pembayaran
       ============================================================ */
    .receipt-grid {
        display: grid;
        grid-template-columns: 1.08fr .92fr;
        gap: 70px;
        align-items: start;
    }

    .info-table,
    .payment-table {
        width: 100%;
        border-collapse: collapse;
    }

    .info-table td,
    .payment-table td {
        padding: 2px 0;
        font-size: 15px;
        line-height: 1.25;
        vertical-align: top;
    }

    .label {
        width: 155px;
        white-space: nowrap;
    }

    .colon {
        width: 16px;
        text-align: center;
    }

    .value {
        font-weight: 700;
    }

    /* Keterangan dibuat full-width di bawah area 2 kolom.
       Dengan begitu teks baru turun setelah memakai hampir seluruh lebar nota. */
    .keterangan-full {
        display: grid;
        grid-template-columns: 155px 16px minmax(0, 1fr);
        width: 100%;
        margin-top: 2px;
        font-size: 15px;
        line-height: 1.25;
        align-items: start;
    }

    .keterangan-label {
        white-space: nowrap;
    }

    .keterangan-colon {
        text-align: center;
    }

    .keterangan-value {
        min-width: 0;
        font-weight: 700;
        white-space: normal;
        overflow-wrap: anywhere;
        word-break: normal;
    }


    /* ============================================================
       13) RINCIAN PEMBAYARAN
       ============================================================ */
    .payment-table .payment-label {
        width: 155px;
        white-space: nowrap;
    }

    .payment-table .currency {
        width: 38px;
        white-space: nowrap;
    }

    .payment-table .amount {
        text-align: right;
        white-space: nowrap;
        font-weight: 700;
    }

    .payment-divider td {
        padding: 2px 0 3px;
    }

    .dash-line {
        border-top: 2px dashed #111;
        height: 1px;
        width: 100%;
    }

    .payment-total td {
        padding-top: 6px;
        font-size: 16px;
        font-weight: 900;
    }


    /* ============================================================
       14) FOOTER NOTA
       ============================================================ */
    .receipt-footer {
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
        gap: 20px;
        margin-top: 16px;
        padding-bottom: 7px;
        border-bottom: 2px dashed #111;
        font-size: 13px;
    }

    .footer-left {
        font-weight: 700;
    }

    .footer-right {
        text-align: right;
        white-space: nowrap;
    }


    /* ============================================================
       15) RESPONSIVE LAYAR KECIL
       Di layar kecil dibuat bertumpuk agar tetap terbaca.
       ============================================================ */
    @media (max-width: 700px) {
        body {
            padding: 8px;
        }

        .receipt {
            padding: 15px;
        }

        .receipt-grid {
            grid-template-columns: 1fr;
            gap: 12px;
        }

        .receipt-footer {
            flex-direction: column;
            align-items: flex-start;
        }

        .footer-right {
            text-align: left;
        }

        .action-bar {
            flex-direction: column;
        }

        .btn {
            width: 100%;
            text-align: center;
        }
    }


    /* ============================================================
       16) SETTING KHUSUS CETAK A4
       - Kertas tetap A4 portrait
       - Nota dibuat melebar memenuhi area A4
       - Margin kecil agar hemat kertas
       ============================================================ */
    @media print {
        @page {
            size: A4 portrait;
            margin: 7mm;
        }

        body {
            background: #fff;
            padding: 0;
        }

        .action-bar {
            display: none !important;
        }

        .receipt {
            width: 196mm;
            max-width: 196mm;
            margin: 0;
            padding: 5mm 6mm 4mm;
            border: 0.4mm solid #111;
            box-shadow: none;
        }

        .brand {
            font-size: 20pt;
        }

        .store-line {
            font-size: 11pt;
        }

        .receipt-title {
            font-size: 12pt;
            margin: 2.5mm 0 2mm;
        }

        .receipt-grid {
            grid-template-columns: 1.08fr .92fr;
            gap: 13mm;
        }

        .info-table td,
        .payment-table td {
            font-size: 10.5pt;
            line-height: 1.18;
            padding: .6mm 0;
        }

        .keterangan-full {
            grid-template-columns: 155px 16px minmax(0, 1fr);
            margin-top: .6mm;
            font-size: 10.5pt;
            line-height: 1.18;
        }

        .receipt-footer {
            margin-top: 3mm;
            font-size: 9.5pt;
        }
    }
</style>
</head>

<body>

<!-- ============================================================
     17) TOMBOL NAVIGASI
     Tidak ikut tercetak.
     ============================================================ -->
<div class="action-bar">

    <button
        type="button"
        class="btn btn-print"
        onclick="window.print()">
        Cetak Nota
    </button>

    <a href="index.php" class="btn">
        ← Kembali
    </a>

</div>


<!-- ============================================================
     18) AREA UTAMA NOTA BPJS
     ============================================================ -->
<div class="receipt">

    <!-- ========================================================
         18a) HEADER TOKO
         Tanpa icon/gambar; hanya tulisan MUGNESIA COUNTER.
         ======================================================== -->
    <div class="brand">
        <span class="mug">MUG</span><span class="nesia">NESIA</span>
        <span class="counter">COUNTER</span>
        
    </div>
    <div class="store-line">
        AGEN PEMBAYARAN ONLINE (PPOB) * SABLON KAOS DTF * CETAK MUG
    </div>

    <div class="store-line">
        KEMANGSEN SELATAN RT.05 RW.02
    </div>


    <!-- ========================================================
         18b) JUDUL TRANSAKSI
         ======================================================== -->
    <div class="receipt-title">
        INFO TAGIHAN BPJS KESEHATAN
    </div>


    <!-- ========================================================
         18c) INFORMASI TRANSAKSI + PEMBAYARAN
         Layout horizontal dua kolom.
         ======================================================== -->
    <div class="receipt-grid">

        <!-- ----------------------------------------------------
             KOLOM KIRI : DATA PESERTA
             ---------------------------------------------------- -->
        <table class="info-table">

            <tr>
                <td class="label">ID Transaksi</td>
                <td class="colon">:</td>
                <td class="value"><?= e(trim((string)($data['id_transaksi'] ?? '')) !== '' ? $data['id_transaksi'] : '-') ?></td>
            </tr>

            <tr>
                <td class="label">Tanggal</td>
                <td class="colon">:</td>
                <td class="value"><?= e($tgl_bayar_display) ?></td>
            </tr>

            <tr>
                <td class="label">Nomor Polis</td>
                <td class="colon">:</td>
                <td class="value"><?= e($data['no_polis']) ?></td>
            </tr>

            <tr>
                <td class="label">Nama</td>
                <td class="colon">:</td>
                <td class="value"><?= e($data['nama']) ?></td>
            </tr>

            <tr>
                <td class="label">Jml Peserta</td>
                <td class="colon">:</td>
                <td class="value">
                    <?= number_format($jml_peserta, 0, ',', '.') ?> Orang
                </td>
            </tr>

            <tr>
                <td class="label">Periode</td>
                <td class="colon">:</td>
                <td class="value"><?= e($periode_display) ?></td>
            </tr>

        </table>


        <!-- ----------------------------------------------------
             KOLOM KANAN : NILAI PEMBAYARAN
             ---------------------------------------------------- -->
        <table class="payment-table">

            <tr>
                <td class="payment-label">Rp Tagihan</td>
                <td class="colon">:</td>
                <td class="currency">Rp</td>
                <td class="amount">
                    <?= format_angka_rupiah($data['rp_tagihan']) ?>
                </td>
            </tr>

            <tr>
                <td class="payment-label">Admin Bank</td>
                <td class="colon">:</td>
                <td class="currency">Rp</td>
                <td class="amount">
                    <?= format_angka_rupiah($data['admin_bank']) ?>
                </td>
            </tr>

            <!-- Garis putus-putus sebelum Total Bayar -->
            <tr class="payment-divider">
                <td></td>
                <td></td>
                <td colspan="2">
                    <div class="dash-line"></div>
                </td>
            </tr>

            <tr class="payment-total">
                <td class="payment-label">Total Bayar</td>
                <td class="colon">:</td>
                <td class="currency">Rp</td>
                <td class="amount">
                    <?= format_angka_rupiah($data['total_bayar']) ?>
                </td>
            </tr>

        </table>

    </div>

    <?php if ((int)($data['cetak_keterangan'] ?? 0) === 1 && trim((string)($data['keterangan'] ?? '')) !== ''): ?>
    <div class="keterangan-full">
        <div class="keterangan-label">Keterangan</div>
        <div class="keterangan-colon">:</div>
        <div class="keterangan-value"><?= e($data['keterangan']) ?></div>
    </div>
    <?php endif; ?>


    <!-- ========================================================
         18d) FOOTER NOTA
         ======================================================== -->
    <div class="receipt-footer">

        <div class="footer-left">
            Terima kasih telah bertransaksi di Mugnesia Counter
        </div>

        <div class="footer-right">
            Dicetak: <?= e($tgl_bayar_display) ?>
        </div>

    </div>

</div>

</body>
</html>
