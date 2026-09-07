<?php
// ============================================================
// FILE: input_bpjs.php
// FUNGSI:
// - Form input pembayaran BPJS Kesehatan
// - Menyimpan transaksi ke tabel tb_tagihan_bpjs
// - Menghitung Total Bayar = Tagihan BPJS + Admin Bank
// - Setelah tersimpan, redirect ke nota_bpjs.php
// ============================================================

require_once "db.php"; // Koneksi database ($conn)


// ============================================================
// 1) HELPER: KONVERSI FORMAT RUPIAH MENJADI ANGKA
// Contoh:
// "202.917" -> 202917
// "2,500"   -> 2500
// ============================================================
function rupiah_to_number($value)
{
    $value = (string)$value;

    // Hapus titik, koma, spasi, dan karakter non angka/minus.
    $value = preg_replace('/[^0-9\-]/', '', $value);

    return (int)($value !== '' ? $value : 0);
}


// ============================================================
// 2) PROSES SIMPAN TRANSAKSI BPJS
// Bagian ini hanya dijalankan saat form dikirim menggunakan POST.
// ============================================================
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // --------------------------------------------------------
    // 2a) Ambil data dari form
    // --------------------------------------------------------
    $tgl_bayar    = trim($_POST['tgl_bayar'] ?? '');
    $no_polis     = trim($_POST['no_polis'] ?? '');
    $nama         = trim($_POST['nama'] ?? '');

    // Nama peserta diseragamkan menjadi HURUF BESAR.
    // Jika ekstensi mbstring tersedia, gunakan mb_strtoupper agar lebih aman untuk UTF-8.
    $nama = function_exists('mb_strtoupper')
        ? mb_strtoupper($nama, 'UTF-8')
        : strtoupper($nama);
    $jml_peserta  = max(1, (int)($_POST['jml_peserta'] ?? 1));
    $periode      = trim($_POST['periode'] ?? '');

    // Nilai uang dibersihkan agar aman untuk perhitungan server-side.
    $rp_tagihan   = max(0, rupiah_to_number($_POST['rp_tagihan'] ?? 0));
    $admin_bank   = max(0, rupiah_to_number($_POST['admin_bank'] ?? 2500));

    // --------------------------------------------------------
    // 2b) Validasi sederhana field wajib
    // --------------------------------------------------------
    if ($tgl_bayar === '' || $no_polis === '' || $nama === '') {
        die("Tanggal bayar, Nomor Polis, dan Nama wajib diisi. <a href='input_bpjs.php'>Kembali</a>");
    }

    // --------------------------------------------------------
    // 2c) Hitung total bayar di SERVER
    // Jangan hanya mengandalkan total dari JavaScript/browser.
    // --------------------------------------------------------
    $total_bayar = $rp_tagihan + $admin_bank;

    // --------------------------------------------------------
    // 2d) Ubah tanggal dari datetime-local ke format MySQL DATETIME
    // --------------------------------------------------------
    $tgl_bayar_dt = date('Y-m-d H:i:s', strtotime($tgl_bayar));

    // --------------------------------------------------------
    // 2e) Simpan data ke tabel tb_tagihan_bpjs
    // Menggunakan prepared statement agar lebih aman.
    // --------------------------------------------------------
    $sql = "INSERT INTO tb_tagihan_bpjs
            (
                tgl_bayar,
                no_polis,
                nama,
                jml_peserta,
                periode,
                rp_tagihan,
                admin_bank,
                total_bayar
            )
            VALUES (?,?,?,?,?,?,?,?)";

    $stmt = $conn->prepare($sql);

    if (!$stmt) {
        die("Gagal menyiapkan query: " . $conn->error);
    }

    $stmt->bind_param(
        "sssissii",
        $tgl_bayar_dt,
        $no_polis,
        $nama,
        $jml_peserta,
        $periode,
        $rp_tagihan,
        $admin_bank,
        $total_bayar
    );

    // --------------------------------------------------------
    // 2f) Jika penyimpanan berhasil, buka nota BPJS
    // --------------------------------------------------------
    if ($stmt->execute()) {

        $last_id = $stmt->insert_id;
        $stmt->close();

        header("Location: nota_bpjs.php?id=" . $last_id);
        exit;

    } else {

        $error = $stmt->error;
        $stmt->close();

        die("Gagal menyimpan transaksi BPJS: " . htmlspecialchars($error));
    }
}


// ============================================================
// 3) DEFAULT VALUE FORM
// - Tanggal/jam otomatis mengikuti waktu server
// - Admin default Rp2.500 tetapi tetap editable
// ============================================================
date_default_timezone_set('Asia/Jakarta');

$default_datetime = date('Y-m-d\TH:i');
$default_admin    = 2500;
?>
<!doctype html>
<html lang="id">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Input Pembayaran BPJS - Mugnesia</title>

<!-- ============================================================
     4) BOOTSTRAP & ICON
     ============================================================ -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
    /* ============================================================
       5) STYLE DASAR HALAMAN
       ============================================================ */
    body {
        font-family: Arial, Helvetica, sans-serif;
        background:#f4f7fb;
        margin:0;
        padding:24px;
        color:#1f2937;
    }

    /* ============================================================
       6) CONTAINER FORM
       ============================================================ */
    .bpjs-container {
        width:100%;
        max-width:760px;
        margin:0 auto;
        background:#ffffff;
        border:1px solid #e5e7eb;
        border-radius:14px;
        box-shadow:0 8px 26px rgba(15,23,42,.07);
        overflow:hidden;
    }

    /* ============================================================
       7) HEADER FORM
       ============================================================ */
    .bpjs-header {
        padding:20px 24px;
        border-bottom:1px solid #e5e7eb;
        background:#f8fafc;
    }

    .bpjs-title {
        font-size:24px;
        font-weight:800;
        margin:0;
    }

    .bpjs-subtitle {
        color:#6b7280;
        font-size:13px;
        margin-top:4px;
    }

    /* ============================================================
       8) BODY FORM
       ============================================================ */
    .bpjs-body {
        padding:24px;
    }

    .section-title {
        font-size:13px;
        font-weight:800;
        text-transform:uppercase;
        letter-spacing:.4px;
        color:#475569;
        margin-bottom:14px;
    }

    .form-label {
        font-weight:700;
        font-size:13px;
        color:#374151;
    }

    .form-control {
        border-radius:9px;
        min-height:42px;
    }

    .form-control:focus {
        box-shadow:none;
        border-color:#86b7fe;
    }

    /* ============================================================
       9) BOX RINGKASAN PEMBAYARAN
       ============================================================ */
    .summary-box {
        margin-top:22px;
        padding:18px;
        border:1px solid #dbeafe;
        background:#f8fbff;
        border-radius:12px;
    }

    .summary-row {
        display:flex;
        justify-content:space-between;
        align-items:center;
        gap:15px;
        padding:5px 0;
    }

    .summary-row.total {
        border-top:1px solid #cbd5e1;
        margin-top:8px;
        padding-top:12px;
        font-size:18px;
        font-weight:800;
    }

    .money-value {
        font-variant-numeric:tabular-nums;
        white-space:nowrap;
    }

    /* ============================================================
       10) FOOTER TOMBOL
       ============================================================ */
    .form-footer {
        display:flex;
        justify-content:space-between;
        gap:10px;
        margin-top:22px;
    }

    .btn {
        border-radius:9px;
        font-weight:600;
    }

    /* ============================================================
       11) RESPONSIVE MOBILE
       ============================================================ */
    @media (max-width: 576px) {
        body {
            padding:10px;
        }

        .bpjs-header,
        .bpjs-body {
            padding:16px;
        }

        .form-footer {
            flex-direction:column;
        }

        .form-footer .btn {
            width:100%;
        }
    }
</style>
</head>

<body>

<div class="bpjs-container">

    <!-- ========================================================
         12) HEADER HALAMAN
         ======================================================== -->
    <div class="bpjs-header">
        <div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-center gap-3">

            <div>
                <h1 class="bpjs-title">
                    <i class="bi bi-heart-pulse me-1"></i>
                    Input Pembayaran BPJS
                </h1>

                <div class="bpjs-subtitle">
                    Mugnesia Counter • Pembayaran BPJS Kesehatan
                </div>
            </div>

            <div class="d-flex gap-2">
                <!-- Tombol menuju daftar transaksi BPJS yang sudah tersimpan -->
                <a href="list_bpjs.php" class="btn btn-outline-success btn-sm">
                    <i class="bi bi-list-ul me-1"></i>
                    List Transaksi
                </a>

                <a href="index.php" class="btn btn-outline-secondary btn-sm">
                    <i class="bi bi-arrow-left me-1"></i>
                    Kembali
                </a>
            </div>

        </div>
    </div>


    <!-- ========================================================
         13) FORM INPUT BPJS
         ======================================================== -->
    <div class="bpjs-body">

        <form method="post" id="formBpjs">

            <!-- =================================================
                 13a) INFORMASI TRANSAKSI
                 ================================================= -->
            <div class="section-title">
                Informasi Transaksi
            </div>

            <div class="row g-3">

                <!-- Tanggal dan jam pembayaran -->
                <div class="col-md-6">
                    <label class="form-label">Tanggal / Jam Bayar</label>

                    <input
                        type="datetime-local"
                        class="form-control"
                        name="tgl_bayar"
                        value="<?= htmlspecialchars($default_datetime) ?>"
                        required>
                </div>

                <!-- Nomor polis / nomor peserta BPJS -->
                <div class="col-md-6">
                    <label class="form-label">Nomor Polis / Nomor Peserta</label>

                    <input
                        type="text"
                        class="form-control"
                        name="no_polis"
                        placeholder="Masukkan nomor polis / peserta"
                        required>
                </div>

                <!-- Nama peserta -->
                <div class="col-md-6">
                    <label class="form-label">Nama Peserta</label>

                    <input
                        type="text"
                        class="form-control"
                        id="nama"
                        name="nama"
                        placeholder="Nama peserta BPJS"
                        style="text-transform: uppercase;"
                        required>
                </div>

                <!-- Jumlah peserta -->
                <div class="col-md-3">
                    <label class="form-label">Jumlah Peserta</label>

                    <input
                        type="number"
                        class="form-control text-end"
                        name="jml_peserta"
                        value="1"
                        min="1"
                        required>
                </div>

                <!-- Periode tagihan -->
                <div class="col-md-3">
                    <label class="form-label">Periode</label>

                    <input
                        type="text"
                        class="form-control"
                        name="periode"
                        value="1 Bulan"
                        placeholder="1 Bulan">
                </div>

            </div>


            <!-- =================================================
                 13b) INFORMASI NILAI PEMBAYARAN
                 ================================================= -->
            <div class="section-title mt-4">
                Nilai Pembayaran
            </div>

            <div class="row g-3">

                <!-- Tagihan BPJS -->
                <div class="col-md-6">
                    <label class="form-label">Tagihan BPJS</label>

                    <div class="input-group">
                        <span class="input-group-text">Rp</span>

                        <input
                            type="text"
                            class="form-control text-end money-input"
                            id="rp_tagihan"
                            name="rp_tagihan"
                            value="0"
                            inputmode="numeric"
                            required>
                    </div>
                </div>

                <!-- Admin Bank
                     Default 2.500 tetapi tetap bisa diedit -->
                <div class="col-md-6">
                    <label class="form-label">Admin Bank</label>

                    <div class="input-group">
                        <span class="input-group-text">Rp</span>

                        <input
                            type="text"
                            class="form-control text-end money-input"
                            id="admin_bank"
                            name="admin_bank"
                            value="<?= number_format($default_admin, 0, ',', '.') ?>"
                            inputmode="numeric"
                            required>
                    </div>

                    <div class="form-text">
                        Default Rp2.500. Bisa diubah sesuai admin transaksi.
                    </div>
                </div>

            </div>


            <!-- =================================================
                 13c) RINGKASAN TOTAL
                 Total dihitung otomatis dari Tagihan + Admin
                 ================================================= -->
            <div class="summary-box">

                <div class="summary-row">
                    <span>Tagihan BPJS</span>

                    <strong class="money-value">
                        Rp <span id="summary_tagihan">0</span>
                    </strong>
                </div>

                <div class="summary-row">
                    <span>Admin Bank</span>

                    <strong class="money-value">
                        Rp <span id="summary_admin">2.500</span>
                    </strong>
                </div>

                <div class="summary-row total">
                    <span>Total Bayar</span>

                    <span class="money-value">
                        Rp <span id="summary_total">2.500</span>
                    </span>
                </div>

                <!-- Field hidden untuk referensi UI.
                     Total final tetap dihitung ulang di server. -->
                <input type="hidden" id="total_bayar" name="total_bayar" value="2500">

            </div>


            <!-- =================================================
                 13d) TOMBOL FORM
                 ================================================= -->
            <div class="form-footer">

                <button
                    type="reset"
                    class="btn btn-outline-secondary"
                    id="btnReset">
                    <i class="bi bi-arrow-counterclockwise me-1"></i>
                    Reset
                </button>

                <button
                    type="submit"
                    class="btn btn-success px-4">
                    <i class="bi bi-floppy me-1"></i>
                    Simpan & Cetak Nota BPJS
                </button>

            </div>

        </form>

    </div>
</div>


<script>
// ============================================================
// 14) HELPER JAVASCRIPT: PARSE NILAI RUPIAH
// Mengubah contoh:
// "202.917" menjadi 202917
// ============================================================
function parseRupiah(value) {

    value = String(value || '');

    // Sisakan angka saja.
    value = value.replace(/[^0-9]/g, '');

    return Number(value || 0);
}


// ============================================================
// 15) HELPER JAVASCRIPT: FORMAT RUPIAH
// Mengubah contoh:
// 202917 menjadi "202.917"
// ============================================================
function formatRupiah(value) {

    const number = Number(value || 0);

    return number.toLocaleString('id-ID');
}


// ============================================================
// 16) FUNGSI HITUNG TOTAL
// Total Bayar = Tagihan BPJS + Admin Bank
//
// Catatan:
// Perhitungan JavaScript hanya untuk tampilan real-time.
// Saat disimpan, PHP menghitung ulang total dari server.
// ============================================================
function hitungTotal() {

    const tagihanInput = document.getElementById('rp_tagihan');
    const adminInput   = document.getElementById('admin_bank');

    const tagihan = parseRupiah(tagihanInput.value);
    const admin   = parseRupiah(adminInput.value);

    const total = tagihan + admin;

    // Update ringkasan.
    document.getElementById('summary_tagihan').textContent = formatRupiah(tagihan);
    document.getElementById('summary_admin').textContent   = formatRupiah(admin);
    document.getElementById('summary_total').textContent   = formatRupiah(total);

    // Simpan angka raw di hidden input.
    document.getElementById('total_bayar').value = total;
}


// ============================================================
// 17) FORMAT INPUT UANG SAAT USER MENGETIK
// Contoh:
// user mengetik 202917
// tampilan otomatis menjadi 202.917
// ============================================================
function formatMoneyInput(input) {

    const number = parseRupiah(input.value);

    input.value = formatRupiah(number);

    hitungTotal();
}


// ============================================================
// 18) INISIALISASI HALAMAN
// - Pasang event input ke Tagihan & Admin
// - Jalankan perhitungan awal
// - Atur reset agar Admin kembali default Rp2.500
// ============================================================
document.addEventListener('DOMContentLoaded', function () {

    const tagihanInput = document.getElementById('rp_tagihan');
    const adminInput   = document.getElementById('admin_bank');
    const namaInput    = document.getElementById('nama');
    const formBpjs     = document.getElementById('formBpjs');

    // --------------------------------------------------------
    // Nama peserta selalu diubah menjadi HURUF BESAR saat diketik.
    // Server-side juga tetap melakukan uppercase sebagai pengaman.
    // --------------------------------------------------------
    namaInput.addEventListener('input', function () {
        this.value = this.value.toUpperCase();
    });

    // --------------------------------------------------------
    // Event saat nilai Tagihan berubah
    // --------------------------------------------------------
    tagihanInput.addEventListener('input', function () {
        formatMoneyInput(this);
    });

    // --------------------------------------------------------
    // Event saat nilai Admin berubah
    // Admin tetap editable.
    // --------------------------------------------------------
    adminInput.addEventListener('input', function () {
        formatMoneyInput(this);
    });

    // --------------------------------------------------------
    // Saat Reset:
    // browser mengembalikan field ke value awal,
    // lalu total dihitung ulang setelah reset selesai.
    // --------------------------------------------------------
    formBpjs.addEventListener('reset', function () {

        setTimeout(function () {

            tagihanInput.value = '0';
            adminInput.value   = '2.500';

            hitungTotal();

        }, 0);
    });

    // Hitung nilai awal saat halaman pertama kali dibuka.
    hitungTotal();
});
</script>

</body>
</html>
