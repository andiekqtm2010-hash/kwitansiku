<?php
include 'db.php';

function rupiah($angka) {
    return number_format($angka, 0, ',', '.');
}

// ambil filter dari GET
$nama         = isset($_GET['nama']) ? trim($_GET['nama']) : '';
$no_pelanggan = isset($_GET['no_pelanggan']) ? trim($_GET['no_pelanggan']) : '';

// build query dengan filter
$where  = " WHERE 1=1 ";
$params = [];
$types  = "";

if ($nama !== '') {
    $where   .= " AND nama LIKE ? ";
    $params[] = "%".$nama."%";
    $types   .= "s";
}

if ($no_pelanggan !== '') {
    $where   .= " AND no_pelanggan LIKE ? ";
    $params[] = "%".$no_pelanggan."%";
    $types   .= "s";
}

$sql = "SELECT * FROM tb_tagihan_listrik $where ORDER BY tgl_bayar DESC";

$stmt = $conn->prepare($sql);
if ($types !== "") {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$result = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>List Data Tagihan Listrik</title>
<style>
    body {
        font-family: Arial, sans-serif;
        font-size: 13px;
        padding: 20px;
    }
    h2 {
        margin-bottom: 10px;
    }
    .top-menu {
        margin-bottom: 15px;
    }
    .top-menu a {
        margin-right: 10px;
        text-decoration: none;
        color: #0066cc;
    }
    .filter-box {
        border: 1px solid #444;
        padding: 10px;
        border-radius: 6px;
        margin-bottom: 15px;
        background: #f9f9f9;
        max-width: 600px;
    }
    .filter-row {
        display: flex;
        gap: 8px;
        margin-bottom: 6px;
    }
    .filter-row label {
        width: 120px;
        font-weight: bold;
    }
    .filter-row input {
        flex: 1;
        padding: 4px;
        border: 1px solid #999;
        border-radius: 4px;
    }
    table {
        border-collapse: collapse;
        width: 100%;
        margin-top: 5px;
    }
    table th, table td {
        border: 1px solid #999;
        padding: 4px 6px;
    }
    table th {
        background: #eee;
    }
    td.num {
        text-align: right;
    }
    td.center {
        text-align: center;
    }
</style>
</head>
<body>

<div class="top-menu">
    <a href="input_tagihan.php">➕ Input Tagihan</a> |
    <a href="index.php">📄 Dashboard</a>
</div>

<h2>List Data Tagihan Listrik</h2>

<div class="filter-box">
    <form method="get">
        <div class="filter-row">
            <label>Nama</label>
            <input type="text" name="nama" value="<?= htmlspecialchars($nama) ?>">
        </div>
        <div class="filter-row">
            <label>No Pelanggan</label>
            <input type="text" name="no_pelanggan" value="<?= htmlspecialchars($no_pelanggan) ?>">
        </div>
        <button type="submit">Filter</button>
        <button type="button" onclick="window.location='list_tagihan.php'">Reset</button>
    </form>
</div>

<table>
    <tr>
        <th>No</th>
        <th>Tgl Bayar</th>
        <th>No Pelanggan</th>
        <th>Nama</th>
        <th>Periode</th>
        <th>Total Bayar</th>
        <th>Aksi</th>
    </tr>
    <?php
    $no = 1;
    while ($row = $result->fetch_assoc()):
    ?>
    <tr>
        <td class="center"><?= $no++; ?></td>
        <td><?= date('d-m-Y H:i', strtotime($row['tgl_bayar'])); ?></td>
        <td><?= htmlspecialchars($row['no_pelanggan']); ?></td>
        <td><?= htmlspecialchars($row['nama']); ?></td>
        <td class="center"><?= htmlspecialchars($row['periode']); ?></td>
        <td class="num"><?= rupiah($row['total_bayar']); ?></td>
        <td class="center">
            <a href="nota_tagihan.php?id=<?= $row['id']; ?>" target="_blank">Lihat Struk</a>
        </td>
    </tr>
    <?php endwhile; ?>
    <?php if ($no == 1): ?>
    <tr>
        <td colspan="7" class="center">Tidak ada data.</td>
    </tr>
    <?php endif; ?>
</table>

</body>
</html>
