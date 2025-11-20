<?php
include 'db.php';

// proses simpan
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $tgl_bayar    = $_POST['tgl_bayar'];       // format: 2025-11-16T12:00
    $id_transaksi = $_POST['id_transaksi'];
    $no_pelanggan = $_POST['no_pelanggan'];
    $nama         = $_POST['nama'];
    $tarif_daya   = $_POST['tarif_daya'];
    $stand_awal   = (int)$_POST['stand_awal'];
    $stand_akhir  = (int)$_POST['stand_akhir'];
    $reff1        = $_POST['reff1'];
    $reff2        = $_POST['reff2'];
    $periode      = $_POST['periode'];
    $rp_tagihan   = (int)$_POST['rp_tagihan'];
    $denda        = (int)$_POST['denda'];
    $lain_lain    = (int)$_POST['lain_lain'];
    $admin_bank   = (int)$_POST['admin_bank'];

    // hitung total
    $total_bayar  = $rp_tagihan + $denda + $lain_lain + $admin_bank;

    // ubah tgl_bayar jadi format DATETIME
    $tgl_bayar_dt = date('Y-m-d H:i:s', strtotime($tgl_bayar));

    $stmt = $conn->prepare("INSERT INTO tb_tagihan_listrik
            (tgl_bayar,id_transaksi,no_pelanggan,nama,tarif_daya,
            stand_awal,stand_akhir,reff1,reff2,periode,
            rp_tagihan,denda,lain_lain,admin_bank,total_bayar)
            VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    $stmt->bind_param(
        "sssssiisssiiiii",   // sekarang 15 karakter, cocok 15 kolom
        $tgl_bayar_dt,   // s
        $id_transaksi,   // s
        $no_pelanggan,   // s
        $nama,           // s
        $tarif_daya,     // s
        $stand_awal,     // i
        $stand_akhir,    // i
        $reff1,          // s
        $reff2,          // s
        $periode,        // s
        $rp_tagihan,     // i
        $denda,          // i
        $lain_lain,      // i
        $admin_bank,     // i
        $total_bayar     // i
);

    if ($stmt->execute()) {
        $last_id = $stmt->insert_id;
        header("Location: nota_tagihan.php?id=" . $last_id);
        exit;
    } else {
        echo "Gagal simpan: " . $stmt->error;
    }
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Input Tagihan PLN</title>
<style>
    body {
        font-family: Arial, sans-serif;
        font-size: 14px;
        padding: 20px;
    }

    h2 {
        margin-bottom: 15px;
    }

    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }

    .form-group label {
        width: 180px;            /* Lebar label */
        font-weight: bold;
    }

    .form-group input {
        flex: 1;                /* Input otomatis melebar */
        padding: 6px;
        border: 1px solid #999;
        border-radius: 4px;
    }

    .form-container {
        max-width: 600px;
        padding: 20px;
        border: 1px solid #444;
        border-radius: 6px;
        background: #f9f9f9;
    }

    button {
        padding: 8px 16px;
        border: none;
        background: #333;
        color: white;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 10px;
    }

    button:hover {
        background: #000;
    }
</style>
<div class="form-container">
    <a href="index.php" class="btn btn-link">&larr; Kembali</a>
    <h2>Input Tagihan Listrik PLN</h2>
    <form method="post">

        <div class="form-group">
            <label>Tanggal Bayar</label>
            <input type="datetime-local" name="tgl_bayar" required>
        </div>

        <div class="form-group">
            <label>ID Transaksi</label>
            <input type="text" name="id_transaksi" required>
        </div>

        <div class="form-group">
            <label>No Pelanggan</label>
            <input type="text" name="no_pelanggan" required>
        </div>

        <div class="form-group">
            <label>Nama</label>
            <input type="text" name="nama" required>
        </div>

        <div class="form-group">
            <label>Tarif / Daya</label>
            <input type="text" placeholder="mis: R1M/900 VA" name="tarif_daya" required>
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
            <input type="text" name="reff1">
        </div>

        <div class="form-group">
            <label>Reff 2</label>
            <input type="text" name="reff2">
        </div>

        <div class="form-group">
            <label>Periode</label>
            <input type="text" placeholder="mis: Nov25" name="periode">
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

        <button type="submit">Simpan & Cetak Nota</button>
    </form>
</div>


</body>
</html>
