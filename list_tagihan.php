<?php
include 'db.php';
$rows = $koneksi->query("SELECT * FROM tb_tagihan_listrik ORDER BY id DESC");
?>
<!DOCTYPE html>
<html lang="id">
<head>
<meta charset="UTF-8">
<title>Daftar Tagihan</title>
</head>
<body>
<h2>Daftar Tagihan Listrik</h2>
<a href="input_tagihan.php">+ Input Tagihan Baru</a><br><br>

<table border="1" cellpadding="4" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>Tgl Bayar</th>
        <th>No Pelanggan</th>
        <th>Nama</th>
        <th>Total Bayar</th>
        <th>Aksi</th>
    </tr>
    <?php while($d = $rows->fetch_assoc()): ?>
    <tr>
        <td><?= $d['id']; ?></td>
        <td><?= date('d-m-Y H:i', strtotime($d['tgl_bayar'])); ?></td>
        <td><?= $d['no_pelanggan']; ?></td>
        <td><?= $d['nama']; ?></td>
        <td><?= rupiah($d['total_bayar']); ?></td>
        <td><a href="nota_tagihan.php?id=<?= $d['id']; ?>" target="_blank">Lihat Struk</a></td>
    </tr>
    <?php endwhile; ?>
</table>
</body>
</html>
<?php
function rupiah($angka) { return number_format($angka,0,',','.'); }
?>
