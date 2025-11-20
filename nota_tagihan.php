<?php
include 'db.php';

function rupiah($angka) {
    return number_format($angka, 0, ',', '.');
}

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$q  = $conn->query("SELECT * FROM tb_tagihan_listrik WHERE id = $id");
$data = $q->fetch_assoc();
if (!$data) {
    die("Data tidak ditemukan");
}

$tgl_bayar = date('d-m-Y H:i:s', strtotime($data['tgl_bayar']));
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Struk Tagihan Listrik</title>
<style>
    * { box-sizing: border-box; }
    body {
        font-family: Arial, sans-serif;
        font-size: 12px;
        margin: 0;
        padding: 10px;
    }

    /* Mengatur lebar dan tinggi kwitansi */
    .wrapper {
        width: 21cm;
        height: 7cm;
        margin: 0 auto;
        border: 1px solid #000;
        padding: 10px 15px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .header-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .header-text {
        flex: 1;
        text-align: center;
    }

    .logo {
        height: 55px;         /* ukuran aman untuk landscape 21 x 11 */
        width: auto;
    }

    .logo.left {
        margin-right: 10px;
    }

    .logo.right {
        margin-left: 10px;
    }


    .header {
        text-align: center;
        line-height: 1.4;
        margin-bottom: 8px;
    }
    .header .title {
        margin-top: 6px;
        font-weight: bold;
    }

    .info-block {
        font-size: 11px;
        margin-top: 6px;
    }

    .row {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-bottom: 3px;
    }
    .col {
        flex: 1;
    }
    .col-right {
        text-align: right;
    }

    table.detail {
        width: 100%;
        border-collapse: collapse;
        margin-top: 12px;
        font-size: 11px;
    }
    table.detail th,
    table.detail td {
        padding: 3px 4px;
        text-align: center;
    }
    table.detail th {
        font-weight: bold;
    }
    table.detail td.num {
        text-align: right;
    }

    .footer {
        text-align: center;
        font-size: 11px;
        line-height: 1.4;
        margin-top: 10px;
    }

    @media print {
        @page {
            size: 21cm 11cm landscape;
            margin: 5mm;
        }
        body {
            margin: 0;
            padding: 0;
        }
        .wrapper {
            margin: 0 auto;
        }
        button {
            display: none;
        }
    }
</style>
</head>
<body>

<div class="wrapper">
    <div>
        <div class="header">
            <div class="header-row">
                <img src="logo_pln.png" class="logo left">
                <div class="header-text">
                    <div>MUGNESIA - AGEN PEMBAYARAN ONLINE</div>
                    <div>KEMANGSEN SELATAN RT.05 RW.02</div>
                    <div class="title">Struk Pembayaran Tagihan Listrik</div>
                </div>
                <img src="logo_mugnesia.png" class="logo right">
            </div>
        </div>
        <!-- INFO UTAMA -->
        <div class="info-block">
            <div class="row">
                <div class="col">
                    Tgl Bayar : <?= $tgl_bayar ?>
                </div>
                <div class="col col-right">
                    ID Transaksi : <?= htmlspecialchars($data['id_transaksi']) ?>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    No Pelanggan : <?= htmlspecialchars($data['no_pelanggan']) ?>
                </div>
                <div class="col">
                    Nama : <?= strtoupper(htmlspecialchars($data['nama'])) ?>
                </div>
                <div class="col col-right">
                    Tarif/Daya : <?= htmlspecialchars($data['tarif_daya']) ?>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    Stand Meter : <?= $data['stand_awal'] ?> - <?= $data['stand_akhir'] ?>
                </div>
                <div class="col col-right">
                    Reff : <?= htmlspecialchars($data['reff1']) ?><br>
                    <?= htmlspecialchars($data['reff2']) ?>
                </div>
            </div>
        </div>

        <!-- TABEL RINCIAN -->
        <table class="detail">
            <tr>
                <th>Bulan</th>
                <th>Tagihan</th>
                <th>Denda</th>
                <th>Lain-Lain</th>
                <th>Admin Bank</th>
                <th>Total bayar</th>
            </tr>
            <tr>
                <td><?= htmlspecialchars($data['periode']) ?></td>
                <td class="num"><?= rupiah($data['rp_tagihan']) ?></td>
                <td class="num"><?= rupiah($data['denda']) ?></td>
                <td class="num"><?= rupiah($data['lain_lain']) ?></td>
                <td class="num"><?= rupiah($data['admin_bank']) ?></td>
                <td class="num"><?= rupiah($data['total_bayar']) ?></td>
            </tr>
        </table>
    </div>

    <!-- FOOTER -->
    <div class="footer">
        <div>MUGNESIA - Bank Central Asia</div>
        <div>Informasi Hubungi Call Center 123 Atau Hub PLN Terdekat</div>
        <div>Download PLN Mobile</div>
    </div>
</div>

<div style="text-align:center; margin-top:10px;">
    <button onclick="window.print()">Cetak</button>
</div>

</body>
</html>
f