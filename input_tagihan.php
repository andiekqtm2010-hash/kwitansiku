<?php
// ============================================================
// FILE: input_tagihan.php
// FUNGSI:
// - Form input pembayaran tagihan listrik PLN
// - Generate ID transaksi otomatis per bulan
// - Format ID: INV/KCM/YYYY/MM/0001
// - Nomor urut kembali ke 0001 setiap berganti bulan
// - Semua field teks disimpan dalam HURUF BESAR
// - Setelah simpan, redirect ke nota_tagihan.php
// ============================================================

include 'db.php';

date_default_timezone_set('Asia/Jakarta');

// ============================================================
// 1) HELPER: UBAH STRING MENJADI HURUF BESAR
// ============================================================
function to_uppercase($value)
{
    $value = trim((string)$value);

    return function_exists('mb_strtoupper')
        ? mb_strtoupper($value, 'UTF-8')
        : strtoupper($value);
}

// ============================================================
// 2) HELPER: GENERATE ID TRANSAKSI OTOMATIS
// Format: INV/KCM/YYYY/MM/0001
// Nomor urut reset ke 0001 setiap berganti bulan.
// ============================================================
function generate_id_transaksi($conn, $tanggal)
{
    $timestamp = strtotime($tanggal);

    if ($timestamp === false) {
        $timestamp = time();
    }

    $tahun  = date('Y', $timestamp);
    $bulan  = date('m', $timestamp);
    $prefix = "INV/KCM/$tahun/$bulan/";

    // Cari nomor terakhir untuk bulan yang sama.
    $sql = "SELECT id_transaksi
            FROM tb_tagihan_listrik
            WHERE id_transaksi LIKE CONCAT(?, '%')
            ORDER BY id DESC
            LIMIT 1";

    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        die("Gagal menyiapkan query ID transaksi: " . $conn->error);
    }

    $stmt->bind_param("s", $prefix);
    $stmt->execute();

    $result      = $stmt->get_result();
    $last_number = 0;

    if ($row = $result->fetch_assoc()) {
        // Contoh INV/KCM/2026/09/0010 -> ambil 0010.
        $parts = explode('/', $row['id_transaksi']);
        $last_number = (int)end($parts);
    }

    $stmt->close();

    $next_number = $last_number + 1;
    $nomor_urut  = str_pad($next_number, 4, '0', STR_PAD_LEFT);

    return $prefix . $nomor_urut;
}

// ============================================================
// 3) PROSES SIMPAN
// ============================================================
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // --------------------------------------------------------
    // 3a) Ambil dan validasi tanggal bayar.
    // --------------------------------------------------------
    $tgl_bayar = $_POST['tgl_bayar'] ?? '';

    if ($tgl_bayar === '') {
        die("Tanggal bayar wajib diisi.");
    }

    // --------------------------------------------------------
    // 3b) Generate ID transaksi di SERVER.
    // Jadi walaupun field form dimanipulasi, nomor tetap aman.
    // --------------------------------------------------------
    $id_transaksi = generate_id_transaksi($conn, $tgl_bayar);

    // --------------------------------------------------------
    // 3c) Semua field string diseragamkan menjadi HURUF BESAR.
    // --------------------------------------------------------
    $no_pelanggan = to_uppercase($_POST['no_pelanggan'] ?? '');
    $nama         = to_uppercase($_POST['nama'] ?? '');
    $tarif_daya   = to_uppercase($_POST['tarif_daya'] ?? '');
    $reff1        = to_uppercase($_POST['reff1'] ?? '');
    $reff2        = to_uppercase($_POST['reff2'] ?? '');
    $periode      = to_uppercase($_POST['periode'] ?? '');

    // --------------------------------------------------------
    // 3d) Ambil field angka.
    // --------------------------------------------------------
    $stand_awal   = (int)($_POST['stand_awal'] ?? 0);
    $stand_akhir  = (int)($_POST['stand_akhir'] ?? 0);
    $rp_tagihan   = (int)($_POST['rp_tagihan'] ?? 0);
    $denda        = (int)($_POST['denda'] ?? 0);
    $lain_lain    = (int)($_POST['lain_lain'] ?? 0);
    $admin_bank   = (int)($_POST['admin_bank'] ?? 0);

    // --------------------------------------------------------
    // 3e) Hitung total pembayaran di server.
    // --------------------------------------------------------
    $total_bayar = $rp_tagihan + $denda + $lain_lain + $admin_bank;

    // --------------------------------------------------------
    // 3f) Ubah datetime-local ke format DATETIME MySQL.
    // --------------------------------------------------------
    $tgl_bayar_dt = date('Y-m-d H:i:s', strtotime($tgl_bayar));

    // --------------------------------------------------------
    // 3g) Simpan data dengan prepared statement.
    // --------------------------------------------------------
    $stmt = $conn->prepare("INSERT INTO tb_tagihan_listrik
            (tgl_bayar,id_transaksi,no_pelanggan,nama,tarif_daya,
            stand_awal,stand_akhir,reff1,reff2,periode,
            rp_tagihan,denda,lain_lain,admin_bank,total_bayar)
            VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    if (!$stmt) {
        die("Gagal menyiapkan query simpan: " . $conn->error);
    }

    $stmt->bind_param(
        "sssssiisssiiiii",
        $tgl_bayar_dt,
        $id_transaksi,
        $no_pelanggan,
        $nama,
        $tarif_daya,
        $stand_awal,
        $stand_akhir,
        $reff1,
        $reff2,
        $periode,
        $rp_tagihan,
        $denda,
        $lain_lain,
        $admin_bank,
        $total_bayar
    );

    // --------------------------------------------------------
    // 3h) Jika berhasil, kembali ke form input dalam kondisi default.
    // --------------------------------------------------------
    if ($stmt->execute()) {
        $stmt->close();

        // Redirect kembali ke form agar semua textbox kembali ke kondisi awal.
        // Pola ini juga mencegah INSERT terulang jika browser di-refresh.
        header("Location: input_tagihan.php?saved=1");
        exit;
    } else {
        $error = $stmt->error;
        $stmt->close();

        die("Gagal simpan: " . htmlspecialchars($error));
    }
}

// ============================================================
// 4) DEFAULT VALUE SAAT FORM DIBUKA
// ============================================================
$default_datetime     = date('Y-m-d\\TH:i');
$default_id_transaksi = generate_id_transaksi($conn, $default_datetime);
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Input Tagihan PLN</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    /* ============================================================
       5) STYLE DASAR HALAMAN
       ============================================================ */
    body {
        font-family: Arial, sans-serif;
        font-size: 14px;
        margin: 0;
        padding: 20px;
        background: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        min-height: 100vh;
    }

    h2 {
        margin-bottom: 15px;
        text-align: center;
    }

    /* ============================================================
       6) CONTAINER FORM
       ============================================================ */
    .form-container {
        width: 100%;
        max-width: 650px;
        padding: 20px 24px;
        border: 1px solid #444;
        border-radius: 8px;
        background: #ffffff;
        box-shadow: 0 2px 6px rgba(0,0,0,0.08);
    }

    /* ============================================================
       7) FORM GROUP
       ============================================================ */
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
        gap: 8px;
    }

    .form-group label {
        width: 180px;
        font-weight: bold;
    }

    .form-group input {
        flex: 1;
        padding: 6px;
        border: 1px solid #999;
        border-radius: 4px;
    }

    /* ============================================================
       8) INPUT STRING SELALU TAMPIL HURUF BESAR
       ============================================================ */
    .uppercase-input {
        text-transform: uppercase;
    }

    /* ============================================================
       9) ID TRANSAKSI OTOMATIS / READONLY
       ============================================================ */
    .readonly-id {
        background: #f3f4f6;
        font-weight: bold;
        color: #374151;
    }

    /* ============================================================
       10) RESPONSIVE MOBILE
       ============================================================ */
    @media (max-width: 576px) {
        body {
            padding: 10px;
        }

        .form-container {
            padding: 16px;
        }

        .form-group {
            flex-direction: column;
            align-items: flex-start;
        }

        .form-group label {
            width: 100%;
        }

        .form-group input {
            width: 100%;
        }
    }
</style>
</head>
<body>

<div class="form-container">

    <!-- ========================================================
         11) TOMBOL NAVIGASI
         ======================================================== -->
    <div class="d-flex justify-content-between mb-3">
        <a href="index.php" class="btn btn-primary">&larr; Kembali</a>
        <a href="list_tagihan.php" class="btn btn-success">📄 List Tagihan</a>
    </div>

    <h2>Input Tagihan Listrik PLN</h2>

    <!-- ========================================================
         12) FORM INPUT TAGIHAN
         ======================================================== -->
    <form method="post" id="formTagihan">

        <div class="form-group">
            <label>Tanggal Bayar</label>
            <input
                type="datetime-local"
                name="tgl_bayar"
                value="<?= htmlspecialchars($default_datetime) ?>"
                required>
        </div>

        <!-- ID dibuat otomatis dan tidak boleh diedit manual -->
        <div class="form-group">
            <label>ID Transaksi</label>
            <input
                type="text"
                name="id_transaksi"
                value="<?= htmlspecialchars($default_id_transaksi) ?>"
                class="readonly-id"
                readonly
                required>
        </div>

        <div class="form-group">
            <label>No Pelanggan</label>
            <input type="text" name="no_pelanggan" class="uppercase-input" required>
        </div>

        <div class="form-group">
            <label>Nama</label>
            <input type="text" name="nama" class="uppercase-input" required>
        </div>

        <div class="form-group">
            <label>Tarif / Daya</label>
            <input type="text" placeholder="MIS: R1M/900 VA" name="tarif_daya" class="uppercase-input" required>
        </div>

        <div class="form-group">
            <label>Stand Meter Awal</label>
            <input type="number" name="stand_awal" required>
        </div>

        <div class="form-group">
            <label>Stand Meter Akhir</label>
            <input type="number" name="stand_akhir" required>
        </div>

        <div class="form-group">
            <label>Reff 1</label>
            <input type="text" name="reff1" class="uppercase-input">
        </div>

        <div class="form-group">
            <label>Reff 2</label>
            <input type="text" name="reff2" class="uppercase-input">
        </div>

        <div class="form-group">
            <label>Periode</label>
            <input type="text" placeholder="MIS: SEP26" name="periode" class="uppercase-input">
        </div>

        <div class="form-group">
            <label>Rp Tagihan</label>
            <input type="number" placeholder="tanpa titik, mis: 275132" name="rp_tagihan" required>
        </div>

        <div class="form-group">
            <label>Denda</label>
            <input type="number" name="denda" value="0" required>
        </div>

        <div class="form-group">
            <label>Lain-lain</label>
            <input type="number" name="lain_lain" value="0" required>
        </div>

        <div class="form-group">
            <label>Admin Bank</label>
            <input type="number" name="admin_bank" required>
        </div>

        <div class="text-end mt-3">
            <button type="submit" class="btn btn-secondary">
                Simpan
            </button>
        </div>
    </form>
</div>

<script>
// ============================================================
// 13) UPPERCASE OTOMATIS SAAT USER MENGETIK
// Semua field string yang punya class uppercase-input
// langsung diubah menjadi huruf besar.
// ============================================================
document.addEventListener('DOMContentLoaded', function () {

    const uppercaseInputs = document.querySelectorAll('.uppercase-input');

    uppercaseInputs.forEach(function (input) {
        input.addEventListener('input', function () {
            this.value = this.value.toUpperCase();
        });
    });

    // ========================================================
    // FOCUS OTOMATIS KE NO PELANGGAN
    // ========================================================
    const noPelangganInput = document.getElementById('no_pelanggan');

    if (noPelangganInput) {
        noPelangganInput.focus();
    }

});
</script>

</body>
</html>
