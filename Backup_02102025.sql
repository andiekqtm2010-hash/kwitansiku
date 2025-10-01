-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2025 at 12:39 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar_php`
--
CREATE DATABASE IF NOT EXISTS `belajar_php` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `belajar_php`;

-- --------------------------------------------------------

--
-- Table structure for table `anakyatim`
--

CREATE TABLE `anakyatim` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` int(13) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anakyatim`
--

INSERT INTO `anakyatim` (`id`, `nama`, `tgl_lahir`, `alamat`, `telp`, `pic`, `status`) VALUES
('IDB/9/2025/00001', 'Iyan', '2010-06-02', 'Temulus', 85263256, 'Hoironi', 'Aktif'),
('IDB/9/2025/00002', 'Dina', '2009-03-01', 'Sirapan', 2147483647, 'Okta', 'Aktif'),
('IDB/9/2025/00003', 'Okta', '2011-06-02', 'Pilang Bangu', 2147483647, 'Dina', 'Aktif'),
('IDB/9/2025/00004', 'Juari', '2009-06-02', 'Pilang bangu', 2147483647, 'Okta', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `nim` varchar(30) NOT NULL,
  `jurusan` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nama`, `nim`, `jurusan`, `created_at`) VALUES
(1, 'Andiek', '123', 'IT', '2025-09-12 07:40:12'),
(2, 'ISAM', '124', 'TI', '2025-09-12 13:57:56'),
(3, 'Dwi', '1234', 'Akuntansi', '2025-09-15 10:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`) VALUES
(1, 'Andiek', 'andiek@kano.com', '123456'),
(2, 'Mimi Dwi', 'mimi@kano.com', '123456'),
(4, 'Isam', 'isam@gmail.com', '321456'),
(5, 'kila', 'kila@gmail.com', '0454534543'),
(6, 'Alif', 'alif@gmail.com', 'ganteng01'),
(7, 'Revina', 'revina@gmail.com', '0945234'),
(8, 'Yanto', 'yanto@gmaill.com', '2354345345');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nim` (`nim`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `db_lazisnu`
--
CREATE DATABASE IF NOT EXISTS `db_lazisnu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_lazisnu`;

-- --------------------------------------------------------

--
-- Table structure for table `anakyatim`
--

CREATE TABLE `anakyatim` (
  `id` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telp` int(13) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anakyatim`
--

INSERT INTO `anakyatim` (`id`, `nama`, `tgl_lahir`, `alamat`, `telp`, `pic`, `status`) VALUES
('IDB/9/2025/00001', 'Iyan Purnama', '2010-06-10', 'Temulus', 85263256, 'Hoironi', 'Aktif'),
('IDB/9/2025/00002', 'Dina Pungki', '2009-03-01', 'Sirapan Kerajan', 2147483647, 'Okta', 'Aktif'),
('IDB/9/2025/00003', 'Dina Anggita', '2011-06-02', 'Pilang Bangu', 318956324, 'Dina', 'Aktif'),
('IDB/9/2025/00004', 'Juari krupuk', '2009-06-02', 'Pilang bangu', 2147483647, 'Okta', 'Aktif'),
('IDB/9/2025/00005', 'Iyan Purnama', '2021-03-02', 'Sirapan Kerajan', 85236952, 'Tono', 'Aktif'),
('IDB/9/2025/00006', 'Dadang', '2009-03-01', 'Pilang Bangu', 2147483647, 'Dina', 'Tidak Aktif'),
('IDB/9/2025/00007', 'Bambang', '2011-06-03', 'Temulus', 0, 'Hoironi', 'Aktif'),
('IDB/9/2025/00008', 'Ulum', '2007-09-25', 'Kemangsen Utara', 321599823, 'Dono', 'Aktif'),
('IDB/9/2025/00009', 'Rian Adi', '2011-06-30', 'Kemangsen Utara', 0, 'Dono', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`) VALUES
(1, 'Andiek', 'andiek@kano.com', '123456'),
(2, 'Mimi Dwi', 'mimi@kano.com', '123456'),
(3, 'admin', 'admin@gmail.com', 'admin.1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anakyatim`
--
ALTER TABLE `anakyatim`
  ADD KEY `idx_anakyatim_nama` (`nama`),
  ADD KEY `idx_anakyatim_alamat` (`alamat`),
  ADD KEY `idx_anakyatim_tgl` (`tgl_lahir`);
--
-- Database: `mugnesia_app`
--
CREATE DATABASE IF NOT EXISTS `mugnesia_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mugnesia_app`;

-- --------------------------------------------------------

--
-- Table structure for table `kwitansi`
--

CREATE TABLE `kwitansi` (
  `id` int(11) NOT NULL,
  `no_kwitansi` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `nama_pelanggan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_pelanggan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` text COLLATE utf8mb4_unicode_ci,
  `status_bayar` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(12,0) NOT NULL,
  `total` decimal(12,0) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kwitansi`
--

INSERT INTO `kwitansi` (`id`, `no_kwitansi`, `tanggal`, `nama_pelanggan`, `alamat_pelanggan`, `catatan`, `status_bayar`, `discount`, `total`, `created_at`) VALUES
(6, 'KWT/9/2025/00001', '2025-09-27', 'Lazisnu Kemangsen', 'Kemangsen - Sirapan', 'Mug Ngopi Bareng Lazisnu', 'Piutang', '0', '120000', '2025-09-27 06:55:48'),
(7, 'KWT/9/2025/00002', '2025-09-27', 'Bapak Dewo', 'Kemangsen Selatan', 'Beli Tokoen PLN 50', 'Lunas', '0', '53000', '2025-09-27 07:23:23'),
(8, 'KWT/9/2025/00003', '2025-09-18', 'Rosit Madura', 'Kemangsen', 'Pembayaran Tagihan PLN', 'Piutang', '0', '12500', '2025-09-28 00:13:45'),
(9, 'KWT/9/2025/00004', '2025-09-30', 'Ustad Jailani', 'Sirapan', 'Pembuatan 10 Mug TPQ Al-AMIN', 'Piutang', '7000', '143000', '2025-09-29 23:11:46'),
(10, 'KWT/9/2025/00005', '2025-09-30', 'Chulwati', 'Kemangsen Selatan RT.05', 'TOKEN PLN 20RB 86263511403', 'Lunas', '0', '23000', '2025-09-30 01:53:31'),
(11, 'KWT/10/2025/00001', '2025-10-01', 'Pak Rofii', 'Kemangsen Selatan RT.05', '085607075759 /Indosat (Mini Kuota Bulanan) / Indosat 2GB / 28 Hari', 'Lunas', '0', '13500', '2025-10-01 01:13:13');

-- --------------------------------------------------------

--
-- Table structure for table `kwitansi_item`
--

CREATE TABLE `kwitansi_item` (
  `id` int(11) NOT NULL,
  `kwitansi_id` int(11) NOT NULL,
  `deskripsi` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` decimal(12,2) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kwitansi_item`
--

INSERT INTO `kwitansi_item` (`id`, `kwitansi_id`, `deskripsi`, `qty`, `harga`, `subtotal`) VALUES
(39, 8, 'Samiadi-511810570314-IDTRX3377206229-FPY', 1, '12500.00', '12500.00'),
(66, 10, 'PLN 20.000 - 0073-3272-4323-2979-7819/CHULWATI 86263511403 / (B)/R1M/900VA/13,5KWH', 1, '23000.00', '23000.00'),
(68, 11, '085607075759 /Indosat (Mini Kuota Bulanan) / Indosat 2GB / 28 Hari', 1, '13500.00', '13500.00'),
(72, 6, 'Gelas Mug dengan Desain Ngopi Bareng', 8, '15000.00', '120000.00'),
(81, 7, '0204-4007-9178-4927-0883 /ZAENAL MUSTOFA/R1M/900VA/33.7 - 45085018906', 1, '53000.00', '53000.00'),
(82, 9, 'Pembuatan 10 Mug TPQ Al-AMIN', 10, '15000.00', '150000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kwitansi`
--
ALTER TABLE `kwitansi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `no_kwitansi` (`no_kwitansi`),
  ADD KEY `idx_kwitansi_no` (`no_kwitansi`),
  ADD KEY `idx_kwitansi_nama` (`nama_pelanggan`),
  ADD KEY `idx_kwitansi_status` (`status_bayar`);

--
-- Indexes for table `kwitansi_item`
--
ALTER TABLE `kwitansi_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kwitansi_id` (`kwitansi_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kwitansi`
--
ALTER TABLE `kwitansi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kwitansi_item`
--
ALTER TABLE `kwitansi_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kwitansi_item`
--
ALTER TABLE `kwitansi_item`
  ADD CONSTRAINT `kwitansi_item_ibfk_1` FOREIGN KEY (`kwitansi_id`) REFERENCES `kwitansi` (`id`) ON DELETE CASCADE;
--
-- Database: `my_db`
--
CREATE DATABASE IF NOT EXISTS `my_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `my_db`;
--
-- Database: `numberseridb`
--
CREATE DATABASE IF NOT EXISTS `numberseridb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `numberseridb`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `pegawai`
--
CREATE DATABASE IF NOT EXISTS `pegawai` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pegawai`;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DepartmentID` int(11) NOT NULL,
  `DepartmentName` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employeeprojects`
--

CREATE TABLE `employeeprojects` (
  `EmployeeID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `AssignedDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id_jabatan` int(5) NOT NULL,
  `nama_jabatan` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`) VALUES
(10001, 'Direktur'),
(10002, 'Wakil Direktur');

-- --------------------------------------------------------

--
-- Table structure for table `pekerja`
--

CREATE TABLE `pekerja` (
  `id_pegawai` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `foto` varchar(50) NOT NULL,
  `ketengan` text NOT NULL,
  `id_jabatan` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `ProjectID` int(11) NOT NULL,
  `ProjectName` varchar(100) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indexes for table `employeeprojects`
--
ALTER TABLE `employeeprojects`
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `pekerja`
--
ALTER TABLE `pekerja`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`ProjectID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employeeprojects`
--
ALTER TABLE `employeeprojects`
  ADD CONSTRAINT `employeeprojects_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  ADD CONSTRAINT `employeeprojects_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'database', 'db_lazisnu', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"structure_or_data_forced\":\"0\",\"table_select[]\":[\"anakyatim\",\"mahasiswa\",\"users\"],\"table_structure[]\":[\"anakyatim\",\"mahasiswa\",\"users\"],\"table_data[]\":[\"anakyatim\",\"mahasiswa\",\"users\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'table', 'backup_db_lazisnu', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(3, 'root', 'table', 'TB_anak_yatim', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(4, 'root', 'server', 'Backup DB Mugnesia', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"belajar_php\",\"db_lazisnu\",\"mugnesia_app\",\"my_db\",\"numberseridb\",\"pegawai\",\"phpmyadmin\",\"projectkano\",\"sales\",\"test\",\"tutorial\",\"wordpress\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"mugnesia_app\",\"table\":\"kwitansi\"},{\"db\":\"mugnesia_app\",\"table\":\"kwitansi_item\"},{\"db\":\"db_lazisnu\",\"table\":\"anakyatim\"},{\"db\":\"db_lazisnu\",\"table\":\"users\"},{\"db\":\"belajar_php\",\"table\":\"anakyatim\"},{\"db\":\"belajar_php\",\"table\":\"mahasiswa\"},{\"db\":\"belajar_php\",\"table\":\"users\"},{\"db\":\"mysql\",\"table\":\"user\"},{\"db\":\"numberseridb\",\"table\":\"users\"},{\"db\":\"sales\",\"table\":\"trx\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'belajar_php', 'anakyatim', '{\"CREATE_TIME\":\"2025-09-21 15:14:10\",\"col_order\":[0,2,1,3,4,5,6],\"col_visib\":[1,1,1,1,1,1,1]}', '2025-09-21 12:27:33');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-10-01 22:34:17', '{\"collation_connection\":\"utf8mb4_unicode_ci\",\"Console\\/Mode\":\"collapse\",\"DefaultConnectionCollation\":\"utf8_bin\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `projectkano`
--
CREATE DATABASE IF NOT EXISTS `projectkano` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `projectkano`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donaturs`
--

CREATE TABLE `donaturs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wilayah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donaturs`
--

INSERT INTO `donaturs` (`id`, `nama`, `alamat`, `wilayah`, `phonenumber`, `status`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'Hendras', 'jl Arjuno', '1', '0812345678', 'Aktif', 'Mafia Pentol', '2025-02-14 03:22:48', '2025-02-20 21:49:44'),
(2, 'Bimbim', 'Jl Sambas', '4', '08123456789', 'Aktif', 'Mafia Pentol', '2025-02-14 04:21:14', '2025-02-20 21:49:34'),
(4, 'Budi', 'asdasd', '1', '08123456789', 'Aktif', 'fgvbajdfgavdxnvczhcvhha', '2025-02-20 21:39:21', '2025-02-20 21:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_02_14_094852_donatur', 1),
(5, '2025_02_20_104843_wilayah', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('VHkzhj1DgZ85XGEvNAnQCdFiAYxrboKmP1gHSmMW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0FCa1pieXpBbVFvS3lheWlIWUdtUlpMdnVXdGtVUml1M0dIbGNDeCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9qZWN0Ijt9fQ==', 1740487201),
('W2ozN9gbX9EdFiuC18bYQ6zmoHGEk9lpe4xlJqPR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWM2dU5HNlNSbmhJYnhMcjBGUnM4QlFCa3JIMHBWTGgwTXRvcGJjbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740564696);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` enum('supervisor','admin','staff') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wilayah` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `role`, `password`, `wilayah`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-02-14 03:20:19', 'admin', '$2y$12$fw5FwToq653AjSsuk7kCTeRexLoDDa0x5WUDxcADrG4DF34QLGqSe', '', 'uzXjedwSIO', '2025-02-14 03:20:20', '2025-02-14 03:20:20'),
(2, 'admin1', 'admin@gmail.com', NULL, 'admin', '$2y$12$lI9iZb.7GTESjRCIiTSsHOlYnmu8pin5evEmEg5I64acHxQg8koVm', '', NULL, '2025-02-14 03:21:18', '2025-02-14 03:21:18'),
(4, 'staff1', 'staff@gmail.com', NULL, 'staff', '$2y$12$B2ugPMWzVxd89pEcAX0hIu7/DecYb/zWwDG2NGv0xFvYxK6me3HWK', '', NULL, '2025-02-14 03:21:18', '2025-02-14 03:21:18'),
(5, 'bandi', 'bandi@gmail.com', NULL, 'supervisor', '$2y$12$Vfok9OUUyc8Fub3/nJ/is.RNAIbL7LFaN0QAyAP/CRgQjw0wfD8kW', '4', NULL, '2025-02-20 02:55:08', '2025-02-21 01:37:19'),
(6, 'Budionosiregar', 'budionosiregar@gmail.com', NULL, 'supervisor', '$2y$12$mxSlpZVtkiKpG08wgNtz9.kmSJ3XDl6vJYhr6U6PYcUFixScOQ/uu', '1', NULL, '2025-02-20 02:57:12', '2025-02-21 01:37:28'),
(7, 'rendi', 'rendi@gmail.com', NULL, 'supervisor', '$2y$12$1j66WyL2RaippDWzhyrNeOwBWGSt4GuGreXQZRdMXEIGG9AHCacyC', '1', NULL, '2025-02-21 01:33:05', '2025-02-21 01:33:05');

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'Jawa Timur', '2025-02-20 06:00:22', '2025-02-20 06:00:22'),
(4, 'Jakarta Barat', '2025-02-20 20:56:13', '2025-02-20 21:12:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `donaturs`
--
ALTER TABLE `donaturs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`(191));

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donaturs`
--
ALTER TABLE `donaturs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `sales`
--
CREATE DATABASE IF NOT EXISTS `sales` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sales`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `code_customer` varchar(100) NOT NULL,
  `nama_customer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`code_customer`, `nama_customer`) VALUES
('Cust-0001', 'Nabila Cell'),
('Cust-0002', 'Bangkit Jaya'),
('Cust-0003', 'Makmur Sejati');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rate` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `tax` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `sub_total` varchar(100) NOT NULL,
  `o_tax` varchar(100) NOT NULL,
  `grand_total` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`id`, `customer_name`, `date`, `name`, `rate`, `quantity`, `tax`, `amount`, `sub_total`, `o_tax`, `grand_total`, `status`) VALUES
(1, 'Boomi', '14-06-2015', 'item,Item', '100,100', '1,10', '1,1', '101.00,1010.00', '1111.00', '111.10', '1222.10', '0'),
(2, 'Boomi', '14-06-2015', 'Item', '100', '1', '1', '101.00', '101.00', '10.10', '111.10', '1');

-- --------------------------------------------------------

--
-- Table structure for table `item_details`
--

CREATE TABLE `item_details` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `rate` varchar(100) NOT NULL,
  `tax` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `item_details`
--

INSERT INTO `item_details` (`id`, `item_name`, `rate`, `tax`, `date`, `status`) VALUES
(1, 'Item', '100', '1', '14-06-2015', 1),
(2, 'Apple', '10', '0', '14-06-2015', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mst_invoice`
--

CREATE TABLE `mst_invoice` (
  `id_inv` int(100) NOT NULL,
  `jenis_inv` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `mst_invoice`
--

INSERT INTO `mst_invoice` (`id_inv`, `jenis_inv`) VALUES
(1, 'INV');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` varchar(100) NOT NULL,
  `desc` varchar(250) DEFAULT NULL,
  `price` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `desc`, `price`) VALUES
('JSM001', 'Ji Samsoe', 150000),
('MLB001', 'Malioboro', 100000),
('SMM01', 'Sampoerna Mentoel', 150000),
('SMP001', 'Sampoerna Mild', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `trx`
--

CREATE TABLE `trx` (
  `id_trx` int(100) NOT NULL,
  `id_inv` int(100) DEFAULT NULL,
  `nomor_inv` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `bulan` varchar(6) DEFAULT NULL,
  `tahun` varchar(6) DEFAULT NULL,
  `id_cust` varchar(100) DEFAULT NULL,
  `id_product` varchar(100) DEFAULT NULL,
  `qty` int(100) DEFAULT NULL,
  `price` int(100) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `trx`
--

INSERT INTO `trx` (`id_trx`, `id_inv`, `nomor_inv`, `date`, `bulan`, `tahun`, `id_cust`, `id_product`, `qty`, `price`, `total`) VALUES
(1, 1, 'INV/04/2022/0001', '2022-04-04', '04', '2022', 'Cust-0001', 'SMP001', 1, 50000, '50000'),
(2, 1, 'INV/04/2022/0001', '2022-04-04', '04', '2022', 'Cust-0001', 'MLB001', 2, 10000, '200000'),
(3, 1, 'INV/04/2022/0001', '2022-04-04', '04', '2022', 'Cust-0001', 'JSM001', 10, 150000, '1500000'),
(4, 1, 'INV/04/2022/0002', '2022-04-06', '04', '2022', 'Cust-0002', 'SMP001', 10, 50000, '500000'),
(5, 1, 'INV/04/2022/0002', '2022-04-06', '04', '2022', 'Cust-0002', 'MLB001', 20, 100000, '2000000'),
(6, 1, 'INV/04/2022/0002', '2022-04-06', '04', '2022', 'Cust-0002', 'JSM001', 150, 150000, '22500000'),
(7, 1, 'INV/04/2022/0003', '2022-04-09', '04', '2022', 'Cust-0003', 'JSM001', 5, 150000, '750000'),
(8, 1, 'INV/04/2022/0003', '2022-04-09', '04', '2022', 'Cust-0003', 'SMP001', 200, 50000, '10000000'),
(9, 1, 'INV/04/2022/0003', '2022-04-09', '04', '2022', 'Cust-0003', 'MLB001', 30, 100000, '3000000'),
(10, 1, 'INV/04/2022/0003', '2022-04-09', '04', '2022', 'Cust-0003', 'SMM01', 75, 150000, '11250000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`code_customer`) USING BTREE;

--
-- Indexes for table `invoice_details`
--
ALTER TABLE `invoice_details`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `item_details`
--
ALTER TABLE `item_details`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `mst_invoice`
--
ALTER TABLE `mst_invoice`
  ADD PRIMARY KEY (`id_inv`) USING BTREE;

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`) USING BTREE;

--
-- Indexes for table `trx`
--
ALTER TABLE `trx`
  ADD PRIMARY KEY (`id_trx`) USING BTREE,
  ADD KEY `id_inv` (`id_inv`) USING BTREE,
  ADD KEY `id_cust` (`id_cust`) USING BTREE,
  ADD KEY `id_product` (`id_product`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice_details`
--
ALTER TABLE `invoice_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `item_details`
--
ALTER TABLE `item_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mst_invoice`
--
ALTER TABLE `mst_invoice`
  MODIFY `id_inv` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trx`
--
ALTER TABLE `trx`
  ADD CONSTRAINT `id_cust` FOREIGN KEY (`id_cust`) REFERENCES `customer` (`code_customer`),
  ADD CONSTRAINT `id_inv` FOREIGN KEY (`id_inv`) REFERENCES `mst_invoice` (`id_inv`),
  ADD CONSTRAINT `id_product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `tutorial`
--
CREATE DATABASE IF NOT EXISTS `tutorial` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `tutorial`;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_05_21_200000_create_team_user_table', 1),
(8, '2020_05_21_300000_create_team_invitations_table', 1),
(9, '2021_02_20_125411_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('andiek@kanosolution.com', '$2y$10$yTGb8yn.PprDtMQJfKHNxuQTBS.vxmQwoEoUNmm08Yv8383S.s17O', '2024-01-13 02:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('DBtM15Ql2NPkha6e9LPQ8DgdD1IEzVqueZPPYYim', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEJwS0w3TUxOaUFiQTVLY1FCSHJuMThzOUR1UVdBN0tXOWFOWEFUSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1705898980);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Andiek Suncahyo', 'andiek@kanosolution.com', '2022-12-30 18:01:01', 'Quantum81', '002', '002', '002', NULL, NULL, '2022-12-30 18:01:01', '2022-12-30 18:01:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
--
-- Database: `wordpress`
--
CREATE DATABASE IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wordpress`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2024-09-25 11:18:22', '2024-09-25 11:18:22', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://en.gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0),
(2, 63, 'admin', 'andiek.qtm2010@gmail.com', 'http://localhost/wordpress/wordpress', '::1', '2024-10-02 03:23:26', '2024-10-02 10:23:26', 'Mohon info untuk melakukan donatut harus ke mana ?', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', 'comment', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'cron', 'a:10:{i:1741331906;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1741346305;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1741346336;a:3:{s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1741346343;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1741349889;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1741351689;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1741353489;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1741779161;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1741864705;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'auto'),
(2, 'siteurl', 'http://localhost/lazisnukemangsen', 'on'),
(3, 'home', 'http://localhost/lazisnukemangsen', 'on'),
(4, 'blogname', 'Lazisnukemangsen.com', 'on'),
(5, 'blogdescription', 'Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama', 'on'),
(6, 'users_can_register', '1', 'on'),
(7, 'admin_email', 'andiek.qtm2010@gmail.com', 'on'),
(8, 'start_of_week', '1', 'on'),
(9, 'use_balanceTags', '0', 'on'),
(10, 'use_smilies', '1', 'on'),
(11, 'require_name_email', '1', 'on'),
(12, 'comments_notify', '1', 'on'),
(13, 'posts_per_rss', '10', 'on'),
(14, 'rss_use_excerpt', '0', 'on'),
(15, 'mailserver_url', 'mail.example.com', 'on'),
(16, 'mailserver_login', 'login@example.com', 'on'),
(17, 'mailserver_pass', 'password', 'on'),
(18, 'mailserver_port', '110', 'on'),
(19, 'default_category', '1', 'on'),
(20, 'default_comment_status', 'open', 'on'),
(21, 'default_ping_status', 'open', 'on'),
(22, 'default_pingback_flag', '1', 'on'),
(23, 'posts_per_page', '10', 'on'),
(24, 'date_format', 'Y-m-d', 'on'),
(25, 'time_format', 'g:i A', 'on'),
(26, 'links_updated_date_format', 'F j, Y g:i a', 'on'),
(27, 'comment_moderation', '', 'on'),
(28, 'moderation_notify', '1', 'on'),
(29, 'permalink_structure', '/%postname%/', 'on'),
(30, 'rewrite_rules', 'a:92:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=2&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'on'),
(31, 'hack_file', '0', 'on'),
(32, 'blog_charset', 'UTF-8', 'on'),
(33, 'moderation_keys', '', 'off'),
(34, 'active_plugins', 'a:1:{i:0;s:31:\"templatespare/templatespare.php\";}', 'on'),
(35, 'category_base', '', 'on'),
(36, 'ping_sites', 'http://rpc.pingomatic.com/', 'on'),
(37, 'comment_max_links', '2', 'on'),
(38, 'gmt_offset', '-7', 'on'),
(39, 'default_email_category', '1', 'on'),
(40, 'recently_edited', 'a:2:{i:0;s:72:\"D:\\xampp\\htdocs\\lazisnukemangsen/wp-content/themes/centralnews/style.css\";i:2;s:0:\"\";}', 'off'),
(41, 'template', 'morenews', 'on'),
(42, 'stylesheet', 'centralnews', 'on'),
(43, 'comment_registration', '', 'on'),
(44, 'html_type', 'text/html', 'on'),
(45, 'use_trackback', '0', 'on'),
(46, 'default_role', 'subscriber', 'on'),
(47, 'db_version', '58975', 'on'),
(48, 'uploads_use_yearmonth_folders', '1', 'on'),
(49, 'upload_path', '', 'on'),
(50, 'blog_public', '1', 'on'),
(51, 'default_link_category', '2', 'on'),
(52, 'show_on_front', 'page', 'on'),
(53, 'tag_base', '', 'on'),
(54, 'show_avatars', '1', 'on'),
(55, 'avatar_rating', 'G', 'on'),
(56, 'upload_url_path', '', 'on'),
(57, 'thumbnail_size_w', '150', 'on'),
(58, 'thumbnail_size_h', '150', 'on'),
(59, 'thumbnail_crop', '1', 'on'),
(60, 'medium_size_w', '300', 'on'),
(61, 'medium_size_h', '300', 'on'),
(62, 'avatar_default', 'gravatar_default', 'on'),
(63, 'large_size_w', '1024', 'on'),
(64, 'large_size_h', '1024', 'on'),
(65, 'image_default_link_type', 'none', 'on'),
(66, 'image_default_size', '', 'on'),
(67, 'image_default_align', '', 'on'),
(68, 'close_comments_for_old_posts', '', 'on'),
(69, 'close_comments_days_old', '14', 'on'),
(70, 'thread_comments', '1', 'on'),
(71, 'thread_comments_depth', '5', 'on'),
(72, 'page_comments', '', 'on'),
(73, 'comments_per_page', '50', 'on'),
(74, 'default_comments_page', 'newest', 'on'),
(75, 'comment_order', 'asc', 'on'),
(76, 'sticky_posts', 'a:0:{}', 'on'),
(77, 'widget_categories', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'auto'),
(78, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'auto'),
(79, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'auto'),
(80, 'uninstall_plugins', 'a:0:{}', 'off'),
(81, 'timezone_string', '', 'on'),
(82, 'page_for_posts', '0', 'on'),
(83, 'page_on_front', '2', 'on'),
(84, 'default_post_format', '0', 'on'),
(85, 'link_manager_enabled', '0', 'on'),
(86, 'finished_splitting_shared_terms', '1', 'on'),
(87, 'site_icon', '36', 'on'),
(88, 'medium_large_size_w', '768', 'on'),
(89, 'medium_large_size_h', '0', 'on'),
(90, 'wp_page_for_privacy_policy', '3', 'on'),
(91, 'show_comments_cookies_opt_in', '1', 'on'),
(92, 'admin_email_lifespan', '1742815089', 'on'),
(93, 'disallowed_keys', '', 'off'),
(94, 'comment_previously_approved', '1', 'on'),
(95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'off'),
(96, 'auto_update_core_dev', 'enabled', 'on'),
(97, 'auto_update_core_minor', 'enabled', 'on'),
(98, 'auto_update_core_major', 'enabled', 'on'),
(99, 'wp_force_deactivated_plugins', 'a:0:{}', 'off'),
(100, 'wp_attachment_pages_enabled', '0', 'on'),
(101, 'initial_db_version', '57155', 'on'),
(102, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'auto'),
(103, 'fresh_site', '0', 'off'),
(104, 'user_count', '1', 'off'),
(105, 'widget_block', 'a:10:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:157:\"<!-- wp:group -->\n<div class=\"wp-block-group\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Recent Post</h2>\n<!-- /wp:heading --></div>\n<!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:258:\"<!-- wp:group -->\n<div class=\"wp-block-group\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Recent Comments</h2>\n<!-- /wp:heading -->\n\n<!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div>\n<!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:177:\"<!-- wp:group -->\n<div class=\"wp-block-group\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Archives</h2>\n<!-- /wp:heading -->\n\n<!-- wp:archives /--></div>\n<!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:181:\"<!-- wp:group -->\n<div class=\"wp-block-group\"><!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Categories</h2>\n<!-- /wp:heading -->\n\n<!-- wp:categories /--></div>\n<!-- /wp:group -->\";}i:9;a:1:{s:7:\"content\";s:264:\"<!-- wp:image {\"id\":34,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00248-1024x680.jpg\" alt=\"\" class=\"wp-image-34\"/></figure>\n<!-- /wp:image -->\";}i:11;a:1:{s:7:\"content\";s:146:\"<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"></figure>\n<!-- /wp:gallery -->\";}i:12;a:1:{s:7:\"content\";s:266:\"<!-- wp:image {\"id\":44,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/Berbagi-1-1024x771.jpeg\" alt=\"\" class=\"wp-image-44\"/></figure>\n<!-- /wp:image -->\";}s:12:\"_multiwidget\";i:1;i:15;a:1:{s:7:\"content\";s:410:\"<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":40,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/Berbagi-1024x771.jpeg\" alt=\"\" class=\"wp-image-40\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\";}}', 'on'),
(106, 'sidebars_widgets', 'a:10:{s:19:\"wp_inactive_widgets\";a:2:{i:0;s:7:\"block-9\";i:1;s:8:\"block-12\";}s:9:\"sidebar-1\";a:6:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";i:5;s:8:\"block-15\";}s:20:\"home-content-widgets\";a:0:{}s:20:\"home-sidebar-widgets\";a:0:{}s:26:\"home-advertisement-widgets\";a:1:{i:0;s:8:\"block-11\";}s:24:\"express-off-canvas-panel\";a:0:{}s:28:\"footer-first-widgets-section\";a:0:{}s:29:\"footer-second-widgets-section\";a:0:{}s:28:\"footer-third-widgets-section\";a:0:{}s:13:\"array_version\";i:3;}', 'on'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(116, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(117, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(118, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(119, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(120, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(121, '_transient_wp_core_block_css_files', 'a:2:{s:7:\"version\";s:5:\"6.6.2\";s:5:\"files\";a:496:{i:0;s:23:\"archives/editor-rtl.css\";i:1;s:27:\"archives/editor-rtl.min.css\";i:2;s:19:\"archives/editor.css\";i:3;s:23:\"archives/editor.min.css\";i:4;s:22:\"archives/style-rtl.css\";i:5;s:26:\"archives/style-rtl.min.css\";i:6;s:18:\"archives/style.css\";i:7;s:22:\"archives/style.min.css\";i:8;s:20:\"audio/editor-rtl.css\";i:9;s:24:\"audio/editor-rtl.min.css\";i:10;s:16:\"audio/editor.css\";i:11;s:20:\"audio/editor.min.css\";i:12;s:19:\"audio/style-rtl.css\";i:13;s:23:\"audio/style-rtl.min.css\";i:14;s:15:\"audio/style.css\";i:15;s:19:\"audio/style.min.css\";i:16;s:19:\"audio/theme-rtl.css\";i:17;s:23:\"audio/theme-rtl.min.css\";i:18;s:15:\"audio/theme.css\";i:19;s:19:\"audio/theme.min.css\";i:20;s:21:\"avatar/editor-rtl.css\";i:21;s:25:\"avatar/editor-rtl.min.css\";i:22;s:17:\"avatar/editor.css\";i:23;s:21:\"avatar/editor.min.css\";i:24;s:20:\"avatar/style-rtl.css\";i:25;s:24:\"avatar/style-rtl.min.css\";i:26;s:16:\"avatar/style.css\";i:27;s:20:\"avatar/style.min.css\";i:28;s:21:\"button/editor-rtl.css\";i:29;s:25:\"button/editor-rtl.min.css\";i:30;s:17:\"button/editor.css\";i:31;s:21:\"button/editor.min.css\";i:32;s:20:\"button/style-rtl.css\";i:33;s:24:\"button/style-rtl.min.css\";i:34;s:16:\"button/style.css\";i:35;s:20:\"button/style.min.css\";i:36;s:22:\"buttons/editor-rtl.css\";i:37;s:26:\"buttons/editor-rtl.min.css\";i:38;s:18:\"buttons/editor.css\";i:39;s:22:\"buttons/editor.min.css\";i:40;s:21:\"buttons/style-rtl.css\";i:41;s:25:\"buttons/style-rtl.min.css\";i:42;s:17:\"buttons/style.css\";i:43;s:21:\"buttons/style.min.css\";i:44;s:22:\"calendar/style-rtl.css\";i:45;s:26:\"calendar/style-rtl.min.css\";i:46;s:18:\"calendar/style.css\";i:47;s:22:\"calendar/style.min.css\";i:48;s:25:\"categories/editor-rtl.css\";i:49;s:29:\"categories/editor-rtl.min.css\";i:50;s:21:\"categories/editor.css\";i:51;s:25:\"categories/editor.min.css\";i:52;s:24:\"categories/style-rtl.css\";i:53;s:28:\"categories/style-rtl.min.css\";i:54;s:20:\"categories/style.css\";i:55;s:24:\"categories/style.min.css\";i:56;s:19:\"code/editor-rtl.css\";i:57;s:23:\"code/editor-rtl.min.css\";i:58;s:15:\"code/editor.css\";i:59;s:19:\"code/editor.min.css\";i:60;s:18:\"code/style-rtl.css\";i:61;s:22:\"code/style-rtl.min.css\";i:62;s:14:\"code/style.css\";i:63;s:18:\"code/style.min.css\";i:64;s:18:\"code/theme-rtl.css\";i:65;s:22:\"code/theme-rtl.min.css\";i:66;s:14:\"code/theme.css\";i:67;s:18:\"code/theme.min.css\";i:68;s:22:\"columns/editor-rtl.css\";i:69;s:26:\"columns/editor-rtl.min.css\";i:70;s:18:\"columns/editor.css\";i:71;s:22:\"columns/editor.min.css\";i:72;s:21:\"columns/style-rtl.css\";i:73;s:25:\"columns/style-rtl.min.css\";i:74;s:17:\"columns/style.css\";i:75;s:21:\"columns/style.min.css\";i:76;s:29:\"comment-content/style-rtl.css\";i:77;s:33:\"comment-content/style-rtl.min.css\";i:78;s:25:\"comment-content/style.css\";i:79;s:29:\"comment-content/style.min.css\";i:80;s:30:\"comment-template/style-rtl.css\";i:81;s:34:\"comment-template/style-rtl.min.css\";i:82;s:26:\"comment-template/style.css\";i:83;s:30:\"comment-template/style.min.css\";i:84;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:85;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:86;s:38:\"comments-pagination-numbers/editor.css\";i:87;s:42:\"comments-pagination-numbers/editor.min.css\";i:88;s:34:\"comments-pagination/editor-rtl.css\";i:89;s:38:\"comments-pagination/editor-rtl.min.css\";i:90;s:30:\"comments-pagination/editor.css\";i:91;s:34:\"comments-pagination/editor.min.css\";i:92;s:33:\"comments-pagination/style-rtl.css\";i:93;s:37:\"comments-pagination/style-rtl.min.css\";i:94;s:29:\"comments-pagination/style.css\";i:95;s:33:\"comments-pagination/style.min.css\";i:96;s:29:\"comments-title/editor-rtl.css\";i:97;s:33:\"comments-title/editor-rtl.min.css\";i:98;s:25:\"comments-title/editor.css\";i:99;s:29:\"comments-title/editor.min.css\";i:100;s:23:\"comments/editor-rtl.css\";i:101;s:27:\"comments/editor-rtl.min.css\";i:102;s:19:\"comments/editor.css\";i:103;s:23:\"comments/editor.min.css\";i:104;s:22:\"comments/style-rtl.css\";i:105;s:26:\"comments/style-rtl.min.css\";i:106;s:18:\"comments/style.css\";i:107;s:22:\"comments/style.min.css\";i:108;s:20:\"cover/editor-rtl.css\";i:109;s:24:\"cover/editor-rtl.min.css\";i:110;s:16:\"cover/editor.css\";i:111;s:20:\"cover/editor.min.css\";i:112;s:19:\"cover/style-rtl.css\";i:113;s:23:\"cover/style-rtl.min.css\";i:114;s:15:\"cover/style.css\";i:115;s:19:\"cover/style.min.css\";i:116;s:22:\"details/editor-rtl.css\";i:117;s:26:\"details/editor-rtl.min.css\";i:118;s:18:\"details/editor.css\";i:119;s:22:\"details/editor.min.css\";i:120;s:21:\"details/style-rtl.css\";i:121;s:25:\"details/style-rtl.min.css\";i:122;s:17:\"details/style.css\";i:123;s:21:\"details/style.min.css\";i:124;s:20:\"embed/editor-rtl.css\";i:125;s:24:\"embed/editor-rtl.min.css\";i:126;s:16:\"embed/editor.css\";i:127;s:20:\"embed/editor.min.css\";i:128;s:19:\"embed/style-rtl.css\";i:129;s:23:\"embed/style-rtl.min.css\";i:130;s:15:\"embed/style.css\";i:131;s:19:\"embed/style.min.css\";i:132;s:19:\"embed/theme-rtl.css\";i:133;s:23:\"embed/theme-rtl.min.css\";i:134;s:15:\"embed/theme.css\";i:135;s:19:\"embed/theme.min.css\";i:136;s:19:\"file/editor-rtl.css\";i:137;s:23:\"file/editor-rtl.min.css\";i:138;s:15:\"file/editor.css\";i:139;s:19:\"file/editor.min.css\";i:140;s:18:\"file/style-rtl.css\";i:141;s:22:\"file/style-rtl.min.css\";i:142;s:14:\"file/style.css\";i:143;s:18:\"file/style.min.css\";i:144;s:23:\"footnotes/style-rtl.css\";i:145;s:27:\"footnotes/style-rtl.min.css\";i:146;s:19:\"footnotes/style.css\";i:147;s:23:\"footnotes/style.min.css\";i:148;s:23:\"freeform/editor-rtl.css\";i:149;s:27:\"freeform/editor-rtl.min.css\";i:150;s:19:\"freeform/editor.css\";i:151;s:23:\"freeform/editor.min.css\";i:152;s:22:\"gallery/editor-rtl.css\";i:153;s:26:\"gallery/editor-rtl.min.css\";i:154;s:18:\"gallery/editor.css\";i:155;s:22:\"gallery/editor.min.css\";i:156;s:21:\"gallery/style-rtl.css\";i:157;s:25:\"gallery/style-rtl.min.css\";i:158;s:17:\"gallery/style.css\";i:159;s:21:\"gallery/style.min.css\";i:160;s:21:\"gallery/theme-rtl.css\";i:161;s:25:\"gallery/theme-rtl.min.css\";i:162;s:17:\"gallery/theme.css\";i:163;s:21:\"gallery/theme.min.css\";i:164;s:20:\"group/editor-rtl.css\";i:165;s:24:\"group/editor-rtl.min.css\";i:166;s:16:\"group/editor.css\";i:167;s:20:\"group/editor.min.css\";i:168;s:19:\"group/style-rtl.css\";i:169;s:23:\"group/style-rtl.min.css\";i:170;s:15:\"group/style.css\";i:171;s:19:\"group/style.min.css\";i:172;s:19:\"group/theme-rtl.css\";i:173;s:23:\"group/theme-rtl.min.css\";i:174;s:15:\"group/theme.css\";i:175;s:19:\"group/theme.min.css\";i:176;s:21:\"heading/style-rtl.css\";i:177;s:25:\"heading/style-rtl.min.css\";i:178;s:17:\"heading/style.css\";i:179;s:21:\"heading/style.min.css\";i:180;s:19:\"html/editor-rtl.css\";i:181;s:23:\"html/editor-rtl.min.css\";i:182;s:15:\"html/editor.css\";i:183;s:19:\"html/editor.min.css\";i:184;s:20:\"image/editor-rtl.css\";i:185;s:24:\"image/editor-rtl.min.css\";i:186;s:16:\"image/editor.css\";i:187;s:20:\"image/editor.min.css\";i:188;s:19:\"image/style-rtl.css\";i:189;s:23:\"image/style-rtl.min.css\";i:190;s:15:\"image/style.css\";i:191;s:19:\"image/style.min.css\";i:192;s:19:\"image/theme-rtl.css\";i:193;s:23:\"image/theme-rtl.min.css\";i:194;s:15:\"image/theme.css\";i:195;s:19:\"image/theme.min.css\";i:196;s:29:\"latest-comments/style-rtl.css\";i:197;s:33:\"latest-comments/style-rtl.min.css\";i:198;s:25:\"latest-comments/style.css\";i:199;s:29:\"latest-comments/style.min.css\";i:200;s:27:\"latest-posts/editor-rtl.css\";i:201;s:31:\"latest-posts/editor-rtl.min.css\";i:202;s:23:\"latest-posts/editor.css\";i:203;s:27:\"latest-posts/editor.min.css\";i:204;s:26:\"latest-posts/style-rtl.css\";i:205;s:30:\"latest-posts/style-rtl.min.css\";i:206;s:22:\"latest-posts/style.css\";i:207;s:26:\"latest-posts/style.min.css\";i:208;s:18:\"list/style-rtl.css\";i:209;s:22:\"list/style-rtl.min.css\";i:210;s:14:\"list/style.css\";i:211;s:18:\"list/style.min.css\";i:212;s:25:\"media-text/editor-rtl.css\";i:213;s:29:\"media-text/editor-rtl.min.css\";i:214;s:21:\"media-text/editor.css\";i:215;s:25:\"media-text/editor.min.css\";i:216;s:24:\"media-text/style-rtl.css\";i:217;s:28:\"media-text/style-rtl.min.css\";i:218;s:20:\"media-text/style.css\";i:219;s:24:\"media-text/style.min.css\";i:220;s:19:\"more/editor-rtl.css\";i:221;s:23:\"more/editor-rtl.min.css\";i:222;s:15:\"more/editor.css\";i:223;s:19:\"more/editor.min.css\";i:224;s:30:\"navigation-link/editor-rtl.css\";i:225;s:34:\"navigation-link/editor-rtl.min.css\";i:226;s:26:\"navigation-link/editor.css\";i:227;s:30:\"navigation-link/editor.min.css\";i:228;s:29:\"navigation-link/style-rtl.css\";i:229;s:33:\"navigation-link/style-rtl.min.css\";i:230;s:25:\"navigation-link/style.css\";i:231;s:29:\"navigation-link/style.min.css\";i:232;s:33:\"navigation-submenu/editor-rtl.css\";i:233;s:37:\"navigation-submenu/editor-rtl.min.css\";i:234;s:29:\"navigation-submenu/editor.css\";i:235;s:33:\"navigation-submenu/editor.min.css\";i:236;s:25:\"navigation/editor-rtl.css\";i:237;s:29:\"navigation/editor-rtl.min.css\";i:238;s:21:\"navigation/editor.css\";i:239;s:25:\"navigation/editor.min.css\";i:240;s:24:\"navigation/style-rtl.css\";i:241;s:28:\"navigation/style-rtl.min.css\";i:242;s:20:\"navigation/style.css\";i:243;s:24:\"navigation/style.min.css\";i:244;s:23:\"nextpage/editor-rtl.css\";i:245;s:27:\"nextpage/editor-rtl.min.css\";i:246;s:19:\"nextpage/editor.css\";i:247;s:23:\"nextpage/editor.min.css\";i:248;s:24:\"page-list/editor-rtl.css\";i:249;s:28:\"page-list/editor-rtl.min.css\";i:250;s:20:\"page-list/editor.css\";i:251;s:24:\"page-list/editor.min.css\";i:252;s:23:\"page-list/style-rtl.css\";i:253;s:27:\"page-list/style-rtl.min.css\";i:254;s:19:\"page-list/style.css\";i:255;s:23:\"page-list/style.min.css\";i:256;s:24:\"paragraph/editor-rtl.css\";i:257;s:28:\"paragraph/editor-rtl.min.css\";i:258;s:20:\"paragraph/editor.css\";i:259;s:24:\"paragraph/editor.min.css\";i:260;s:23:\"paragraph/style-rtl.css\";i:261;s:27:\"paragraph/style-rtl.min.css\";i:262;s:19:\"paragraph/style.css\";i:263;s:23:\"paragraph/style.min.css\";i:264;s:25:\"post-author/style-rtl.css\";i:265;s:29:\"post-author/style-rtl.min.css\";i:266;s:21:\"post-author/style.css\";i:267;s:25:\"post-author/style.min.css\";i:268;s:33:\"post-comments-form/editor-rtl.css\";i:269;s:37:\"post-comments-form/editor-rtl.min.css\";i:270;s:29:\"post-comments-form/editor.css\";i:271;s:33:\"post-comments-form/editor.min.css\";i:272;s:32:\"post-comments-form/style-rtl.css\";i:273;s:36:\"post-comments-form/style-rtl.min.css\";i:274;s:28:\"post-comments-form/style.css\";i:275;s:32:\"post-comments-form/style.min.css\";i:276;s:27:\"post-content/editor-rtl.css\";i:277;s:31:\"post-content/editor-rtl.min.css\";i:278;s:23:\"post-content/editor.css\";i:279;s:27:\"post-content/editor.min.css\";i:280;s:23:\"post-date/style-rtl.css\";i:281;s:27:\"post-date/style-rtl.min.css\";i:282;s:19:\"post-date/style.css\";i:283;s:23:\"post-date/style.min.css\";i:284;s:27:\"post-excerpt/editor-rtl.css\";i:285;s:31:\"post-excerpt/editor-rtl.min.css\";i:286;s:23:\"post-excerpt/editor.css\";i:287;s:27:\"post-excerpt/editor.min.css\";i:288;s:26:\"post-excerpt/style-rtl.css\";i:289;s:30:\"post-excerpt/style-rtl.min.css\";i:290;s:22:\"post-excerpt/style.css\";i:291;s:26:\"post-excerpt/style.min.css\";i:292;s:34:\"post-featured-image/editor-rtl.css\";i:293;s:38:\"post-featured-image/editor-rtl.min.css\";i:294;s:30:\"post-featured-image/editor.css\";i:295;s:34:\"post-featured-image/editor.min.css\";i:296;s:33:\"post-featured-image/style-rtl.css\";i:297;s:37:\"post-featured-image/style-rtl.min.css\";i:298;s:29:\"post-featured-image/style.css\";i:299;s:33:\"post-featured-image/style.min.css\";i:300;s:34:\"post-navigation-link/style-rtl.css\";i:301;s:38:\"post-navigation-link/style-rtl.min.css\";i:302;s:30:\"post-navigation-link/style.css\";i:303;s:34:\"post-navigation-link/style.min.css\";i:304;s:28:\"post-template/editor-rtl.css\";i:305;s:32:\"post-template/editor-rtl.min.css\";i:306;s:24:\"post-template/editor.css\";i:307;s:28:\"post-template/editor.min.css\";i:308;s:27:\"post-template/style-rtl.css\";i:309;s:31:\"post-template/style-rtl.min.css\";i:310;s:23:\"post-template/style.css\";i:311;s:27:\"post-template/style.min.css\";i:312;s:24:\"post-terms/style-rtl.css\";i:313;s:28:\"post-terms/style-rtl.min.css\";i:314;s:20:\"post-terms/style.css\";i:315;s:24:\"post-terms/style.min.css\";i:316;s:24:\"post-title/style-rtl.css\";i:317;s:28:\"post-title/style-rtl.min.css\";i:318;s:20:\"post-title/style.css\";i:319;s:24:\"post-title/style.min.css\";i:320;s:26:\"preformatted/style-rtl.css\";i:321;s:30:\"preformatted/style-rtl.min.css\";i:322;s:22:\"preformatted/style.css\";i:323;s:26:\"preformatted/style.min.css\";i:324;s:24:\"pullquote/editor-rtl.css\";i:325;s:28:\"pullquote/editor-rtl.min.css\";i:326;s:20:\"pullquote/editor.css\";i:327;s:24:\"pullquote/editor.min.css\";i:328;s:23:\"pullquote/style-rtl.css\";i:329;s:27:\"pullquote/style-rtl.min.css\";i:330;s:19:\"pullquote/style.css\";i:331;s:23:\"pullquote/style.min.css\";i:332;s:23:\"pullquote/theme-rtl.css\";i:333;s:27:\"pullquote/theme-rtl.min.css\";i:334;s:19:\"pullquote/theme.css\";i:335;s:23:\"pullquote/theme.min.css\";i:336;s:39:\"query-pagination-numbers/editor-rtl.css\";i:337;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:338;s:35:\"query-pagination-numbers/editor.css\";i:339;s:39:\"query-pagination-numbers/editor.min.css\";i:340;s:31:\"query-pagination/editor-rtl.css\";i:341;s:35:\"query-pagination/editor-rtl.min.css\";i:342;s:27:\"query-pagination/editor.css\";i:343;s:31:\"query-pagination/editor.min.css\";i:344;s:30:\"query-pagination/style-rtl.css\";i:345;s:34:\"query-pagination/style-rtl.min.css\";i:346;s:26:\"query-pagination/style.css\";i:347;s:30:\"query-pagination/style.min.css\";i:348;s:25:\"query-title/style-rtl.css\";i:349;s:29:\"query-title/style-rtl.min.css\";i:350;s:21:\"query-title/style.css\";i:351;s:25:\"query-title/style.min.css\";i:352;s:20:\"query/editor-rtl.css\";i:353;s:24:\"query/editor-rtl.min.css\";i:354;s:16:\"query/editor.css\";i:355;s:20:\"query/editor.min.css\";i:356;s:19:\"quote/style-rtl.css\";i:357;s:23:\"quote/style-rtl.min.css\";i:358;s:15:\"quote/style.css\";i:359;s:19:\"quote/style.min.css\";i:360;s:19:\"quote/theme-rtl.css\";i:361;s:23:\"quote/theme-rtl.min.css\";i:362;s:15:\"quote/theme.css\";i:363;s:19:\"quote/theme.min.css\";i:364;s:23:\"read-more/style-rtl.css\";i:365;s:27:\"read-more/style-rtl.min.css\";i:366;s:19:\"read-more/style.css\";i:367;s:23:\"read-more/style.min.css\";i:368;s:18:\"rss/editor-rtl.css\";i:369;s:22:\"rss/editor-rtl.min.css\";i:370;s:14:\"rss/editor.css\";i:371;s:18:\"rss/editor.min.css\";i:372;s:17:\"rss/style-rtl.css\";i:373;s:21:\"rss/style-rtl.min.css\";i:374;s:13:\"rss/style.css\";i:375;s:17:\"rss/style.min.css\";i:376;s:21:\"search/editor-rtl.css\";i:377;s:25:\"search/editor-rtl.min.css\";i:378;s:17:\"search/editor.css\";i:379;s:21:\"search/editor.min.css\";i:380;s:20:\"search/style-rtl.css\";i:381;s:24:\"search/style-rtl.min.css\";i:382;s:16:\"search/style.css\";i:383;s:20:\"search/style.min.css\";i:384;s:20:\"search/theme-rtl.css\";i:385;s:24:\"search/theme-rtl.min.css\";i:386;s:16:\"search/theme.css\";i:387;s:20:\"search/theme.min.css\";i:388;s:24:\"separator/editor-rtl.css\";i:389;s:28:\"separator/editor-rtl.min.css\";i:390;s:20:\"separator/editor.css\";i:391;s:24:\"separator/editor.min.css\";i:392;s:23:\"separator/style-rtl.css\";i:393;s:27:\"separator/style-rtl.min.css\";i:394;s:19:\"separator/style.css\";i:395;s:23:\"separator/style.min.css\";i:396;s:23:\"separator/theme-rtl.css\";i:397;s:27:\"separator/theme-rtl.min.css\";i:398;s:19:\"separator/theme.css\";i:399;s:23:\"separator/theme.min.css\";i:400;s:24:\"shortcode/editor-rtl.css\";i:401;s:28:\"shortcode/editor-rtl.min.css\";i:402;s:20:\"shortcode/editor.css\";i:403;s:24:\"shortcode/editor.min.css\";i:404;s:24:\"site-logo/editor-rtl.css\";i:405;s:28:\"site-logo/editor-rtl.min.css\";i:406;s:20:\"site-logo/editor.css\";i:407;s:24:\"site-logo/editor.min.css\";i:408;s:23:\"site-logo/style-rtl.css\";i:409;s:27:\"site-logo/style-rtl.min.css\";i:410;s:19:\"site-logo/style.css\";i:411;s:23:\"site-logo/style.min.css\";i:412;s:27:\"site-tagline/editor-rtl.css\";i:413;s:31:\"site-tagline/editor-rtl.min.css\";i:414;s:23:\"site-tagline/editor.css\";i:415;s:27:\"site-tagline/editor.min.css\";i:416;s:25:\"site-title/editor-rtl.css\";i:417;s:29:\"site-title/editor-rtl.min.css\";i:418;s:21:\"site-title/editor.css\";i:419;s:25:\"site-title/editor.min.css\";i:420;s:24:\"site-title/style-rtl.css\";i:421;s:28:\"site-title/style-rtl.min.css\";i:422;s:20:\"site-title/style.css\";i:423;s:24:\"site-title/style.min.css\";i:424;s:26:\"social-link/editor-rtl.css\";i:425;s:30:\"social-link/editor-rtl.min.css\";i:426;s:22:\"social-link/editor.css\";i:427;s:26:\"social-link/editor.min.css\";i:428;s:27:\"social-links/editor-rtl.css\";i:429;s:31:\"social-links/editor-rtl.min.css\";i:430;s:23:\"social-links/editor.css\";i:431;s:27:\"social-links/editor.min.css\";i:432;s:26:\"social-links/style-rtl.css\";i:433;s:30:\"social-links/style-rtl.min.css\";i:434;s:22:\"social-links/style.css\";i:435;s:26:\"social-links/style.min.css\";i:436;s:21:\"spacer/editor-rtl.css\";i:437;s:25:\"spacer/editor-rtl.min.css\";i:438;s:17:\"spacer/editor.css\";i:439;s:21:\"spacer/editor.min.css\";i:440;s:20:\"spacer/style-rtl.css\";i:441;s:24:\"spacer/style-rtl.min.css\";i:442;s:16:\"spacer/style.css\";i:443;s:20:\"spacer/style.min.css\";i:444;s:20:\"table/editor-rtl.css\";i:445;s:24:\"table/editor-rtl.min.css\";i:446;s:16:\"table/editor.css\";i:447;s:20:\"table/editor.min.css\";i:448;s:19:\"table/style-rtl.css\";i:449;s:23:\"table/style-rtl.min.css\";i:450;s:15:\"table/style.css\";i:451;s:19:\"table/style.min.css\";i:452;s:19:\"table/theme-rtl.css\";i:453;s:23:\"table/theme-rtl.min.css\";i:454;s:15:\"table/theme.css\";i:455;s:19:\"table/theme.min.css\";i:456;s:23:\"tag-cloud/style-rtl.css\";i:457;s:27:\"tag-cloud/style-rtl.min.css\";i:458;s:19:\"tag-cloud/style.css\";i:459;s:23:\"tag-cloud/style.min.css\";i:460;s:28:\"template-part/editor-rtl.css\";i:461;s:32:\"template-part/editor-rtl.min.css\";i:462;s:24:\"template-part/editor.css\";i:463;s:28:\"template-part/editor.min.css\";i:464;s:27:\"template-part/theme-rtl.css\";i:465;s:31:\"template-part/theme-rtl.min.css\";i:466;s:23:\"template-part/theme.css\";i:467;s:27:\"template-part/theme.min.css\";i:468;s:30:\"term-description/style-rtl.css\";i:469;s:34:\"term-description/style-rtl.min.css\";i:470;s:26:\"term-description/style.css\";i:471;s:30:\"term-description/style.min.css\";i:472;s:27:\"text-columns/editor-rtl.css\";i:473;s:31:\"text-columns/editor-rtl.min.css\";i:474;s:23:\"text-columns/editor.css\";i:475;s:27:\"text-columns/editor.min.css\";i:476;s:26:\"text-columns/style-rtl.css\";i:477;s:30:\"text-columns/style-rtl.min.css\";i:478;s:22:\"text-columns/style.css\";i:479;s:26:\"text-columns/style.min.css\";i:480;s:19:\"verse/style-rtl.css\";i:481;s:23:\"verse/style-rtl.min.css\";i:482;s:15:\"verse/style.css\";i:483;s:19:\"verse/style.min.css\";i:484;s:20:\"video/editor-rtl.css\";i:485;s:24:\"video/editor-rtl.min.css\";i:486;s:16:\"video/editor.css\";i:487;s:20:\"video/editor.min.css\";i:488;s:19:\"video/style-rtl.css\";i:489;s:23:\"video/style-rtl.min.css\";i:490;s:15:\"video/style.css\";i:491;s:19:\"video/style.min.css\";i:492;s:19:\"video/theme-rtl.css\";i:493;s:23:\"video/theme-rtl.min.css\";i:494;s:15:\"video/theme.css\";i:495;s:19:\"video/theme.min.css\";}}', 'on'),
(125, 'recovery_keys', 'a:0:{}', 'off'),
(126, 'theme_mods_twentytwentyfour', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1727265392;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}}}}', 'off'),
(152, 'finished_updating_comment_type', '1', 'auto'),
(176, 'current_theme', 'CentralNews', 'auto'),
(177, 'theme_mods_lovecraft', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1727265462;s:4:\"data\";a:5:{s:19:\"wp_inactive_widgets\";a:0:{}s:7:\"sidebar\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:10:\"footer-one\";a:0:{}s:10:\"footer-two\";a:0:{}s:12:\"footer-three\";a:0:{}}}}', 'off'),
(178, 'theme_switched', '', 'auto'),
(179, 'widget_widget_lovecraft_recent_posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(180, 'widget_widget_lovecraft_recent_comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(189, 'theme_mods_centralnews', 'a:20:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1727265763;s:4:\"data\";a:9:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}s:20:\"home-content-widgets\";a:0:{}s:20:\"home-sidebar-widgets\";a:0:{}s:26:\"home-advertisement-widgets\";a:0:{}s:24:\"express-off-canvas-panel\";a:0:{}s:28:\"footer-first-widgets-section\";a:0:{}s:29:\"footer-second-widgets-section\";a:0:{}s:28:\"footer-third-widgets-section\";a:0:{}}}s:30:\"main_banner_background_section\";i:24;s:16:\"background_image\";s:0:\"\";s:21:\"footer_copyright_text\";s:30:\"Copyright © Lazisnu Kemangsen\";s:24:\"hide_footer_menu_section\";b:1;s:16:\"header_textcolor\";s:6:\"16050e\";s:28:\"banner_advertisement_section\";i:0;s:11:\"custom_logo\";s:0:\"\";s:20:\"site_title_uppercase\";b:0;s:30:\"main_banner_news_section_title\";s:38:\"Lazisnu Berbagi Dengan Anak-Anak Yatim\";s:30:\"main_latest_news_section_title\";s:8:\"Santunan\";s:32:\"main_trending_news_section_title\";s:7:\"Berbagi\";s:12:\"header_image\";s:70:\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/Heder.jpg\";s:17:\"header_image_data\";O:8:\"stdClass\":5:{s:13:\"attachment_id\";i:38;s:3:\"url\";s:70:\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/Heder.jpg\";s:13:\"thumbnail_url\";s:70:\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/Heder.jpg\";s:6:\"height\";i:110;s:5:\"width\";i:920;}s:20:\"site_title_font_size\";s:3:\"100\";s:33:\"disable_header_image_tint_overlay\";b:1;s:25:\"show_popular_tags_section\";b:1;}', 'on'),
(191, 'widget_morenews_author_info', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(192, 'widget_morenews_posts_list', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(193, 'widget_morenews_express_posts_list', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(194, 'widget_morenews_posts_single_column', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(195, 'widget_morenews_posts_double_column', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(196, 'widget_morenews_featured_posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(197, 'widget_morenews_posts_slider', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(198, 'widget_morenews_trending_news', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(199, 'widget_morenews_social_contacts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(214, 'theme_mods_skt-physiotherapy', 'a:4:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1727265941;s:4:\"data\";a:6:{s:19:\"wp_inactive_widgets\";a:0:{}s:8:\"fc-1-phy\";a:0:{}s:8:\"fc-2-phy\";a:0:{}s:8:\"fc-3-phy\";a:0:{}s:8:\"fc-4-phy\";a:0:{}s:9:\"sidebar-1\";a:5:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";i:3;s:7:\"block-5\";i:4;s:7:\"block-6\";}}}}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(220, 'downloaded_font_files', 'a:52:{s:75:\"https://fonts.gstatic.com/s/assistant/v19/2sDcZGJYnIjSi6H75xkzamW5O7w.woff2\";s:97:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/assistant/2sDcZGJYnIjSi6H75xkzamW5O7w.woff2\";s:75:\"https://fonts.gstatic.com/s/assistant/v19/2sDcZGJYnIjSi6H75xkzZmW5O7w.woff2\";s:97:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/assistant/2sDcZGJYnIjSi6H75xkzZmW5O7w.woff2\";s:72:\"https://fonts.gstatic.com/s/assistant/v19/2sDcZGJYnIjSi6H75xkzaGW5.woff2\";s:94:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/assistant/2sDcZGJYnIjSi6H75xkzaGW5.woff2\";s:68:\"https://fonts.gstatic.com/s/oswald/v53/TK3iWkUHHAIjg752FD8Ghe4.woff2\";s:90:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/oswald/TK3iWkUHHAIjg752FD8Ghe4.woff2\";s:68:\"https://fonts.gstatic.com/s/oswald/v53/TK3iWkUHHAIjg752HT8Ghe4.woff2\";s:90:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/oswald/TK3iWkUHHAIjg752HT8Ghe4.woff2\";s:68:\"https://fonts.gstatic.com/s/oswald/v53/TK3iWkUHHAIjg752Fj8Ghe4.woff2\";s:90:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/oswald/TK3iWkUHHAIjg752Fj8Ghe4.woff2\";s:68:\"https://fonts.gstatic.com/s/oswald/v53/TK3iWkUHHAIjg752Fz8Ghe4.woff2\";s:90:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/oswald/TK3iWkUHHAIjg752Fz8Ghe4.woff2\";s:65:\"https://fonts.gstatic.com/s/oswald/v53/TK3iWkUHHAIjg752GT8G.woff2\";s:87:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/oswald/TK3iWkUHHAIjg752GT8G.woff2\";s:93:\"https://fonts.gstatic.com/s/playfairdisplay/v37/nuFkD-vYSZviVYUb_rj3ij__anPXDTnohkk72xU.woff2\";s:116:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/playfair-display/nuFkD-vYSZviVYUb_rj3ij__anPXDTnohkk72xU.woff2\";s:93:\"https://fonts.gstatic.com/s/playfairdisplay/v37/nuFkD-vYSZviVYUb_rj3ij__anPXDTnojUk72xU.woff2\";s:116:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/playfair-display/nuFkD-vYSZviVYUb_rj3ij__anPXDTnojUk72xU.woff2\";s:93:\"https://fonts.gstatic.com/s/playfairdisplay/v37/nuFkD-vYSZviVYUb_rj3ij__anPXDTnojEk72xU.woff2\";s:116:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/playfair-display/nuFkD-vYSZviVYUb_rj3ij__anPXDTnojEk72xU.woff2\";s:90:\"https://fonts.gstatic.com/s/playfairdisplay/v37/nuFkD-vYSZviVYUb_rj3ij__anPXDTnogkk7.woff2\";s:113:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/playfair-display/nuFkD-vYSZviVYUb_rj3ij__anPXDTnogkk7.woff2\";s:90:\"https://fonts.gstatic.com/s/playfairdisplay/v37/nuFiD-vYSZviVYUb_rj3ij__anPXDTjYgFE_.woff2\";s:113:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/playfair-display/nuFiD-vYSZviVYUb_rj3ij__anPXDTjYgFE_.woff2\";s:90:\"https://fonts.gstatic.com/s/playfairdisplay/v37/nuFiD-vYSZviVYUb_rj3ij__anPXDTPYgFE_.woff2\";s:113:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/playfair-display/nuFiD-vYSZviVYUb_rj3ij__anPXDTPYgFE_.woff2\";s:90:\"https://fonts.gstatic.com/s/playfairdisplay/v37/nuFiD-vYSZviVYUb_rj3ij__anPXDTLYgFE_.woff2\";s:113:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/playfair-display/nuFiD-vYSZviVYUb_rj3ij__anPXDTLYgFE_.woff2\";s:88:\"https://fonts.gstatic.com/s/playfairdisplay/v37/nuFiD-vYSZviVYUb_rj3ij__anPXDTzYgA.woff2\";s:111:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/playfair-display/nuFiD-vYSZviVYUb_rj3ij__anPXDTzYgA.woff2\";s:76:\"https://fonts.gstatic.com/s/poppins/v21/pxiAyp8kv8JHgFVrJJLmE0tMMPKzSQ.woff2\";s:98:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiAyp8kv8JHgFVrJJLmE0tMMPKzSQ.woff2\";s:73:\"https://fonts.gstatic.com/s/poppins/v21/pxiAyp8kv8JHgFVrJJLmE0tCMPI.woff2\";s:95:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiAyp8kv8JHgFVrJJLmE0tCMPI.woff2\";s:77:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLmv1pVGdeOcEg.woff2\";s:99:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLmv1pVGdeOcEg.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLmv1pVF9eO.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLmv1pVF9eO.woff2\";s:77:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLm21lVGdeOcEg.woff2\";s:99:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLm21lVGdeOcEg.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLm21lVF9eO.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLm21lVF9eO.woff2\";s:73:\"https://fonts.gstatic.com/s/poppins/v21/pxiGyp8kv8JHgFVrJJLufntAKPY.woff2\";s:95:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiGyp8kv8JHgFVrJJLufntAKPY.woff2\";s:70:\"https://fonts.gstatic.com/s/poppins/v21/pxiGyp8kv8JHgFVrJJLucHtA.woff2\";s:92:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiGyp8kv8JHgFVrJJLucHtA.woff2\";s:77:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLmg1hVGdeOcEg.woff2\";s:99:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLmg1hVGdeOcEg.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLmg1hVF9eO.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLmg1hVF9eO.woff2\";s:77:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLmr19VGdeOcEg.woff2\";s:99:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLmr19VGdeOcEg.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLmr19VF9eO.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLmr19VF9eO.woff2\";s:77:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLmy15VGdeOcEg.woff2\";s:99:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLmy15VGdeOcEg.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLmy15VF9eO.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLmy15VF9eO.woff2\";s:77:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLm111VGdeOcEg.woff2\";s:99:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLm111VGdeOcEg.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLm111VF9eO.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLm111VF9eO.woff2\";s:77:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLm81xVGdeOcEg.woff2\";s:99:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLm81xVGdeOcEg.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiDyp8kv8JHgFVrJJLm81xVF9eO.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiDyp8kv8JHgFVrJJLm81xVF9eO.woff2\";s:73:\"https://fonts.gstatic.com/s/poppins/v21/pxiGyp8kv8JHgFVrLPTufntAKPY.woff2\";s:95:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiGyp8kv8JHgFVrLPTufntAKPY.woff2\";s:70:\"https://fonts.gstatic.com/s/poppins/v21/pxiGyp8kv8JHgFVrLPTucHtA.woff2\";s:92:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiGyp8kv8JHgFVrLPTucHtA.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLFj_Z1JlFc-K.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLFj_Z1JlFc-K.woff2\";s:72:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLFj_Z1xlFQ.woff2\";s:94:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLFj_Z1xlFQ.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLDz8Z1JlFc-K.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLDz8Z1JlFc-K.woff2\";s:72:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLDz8Z1xlFQ.woff2\";s:94:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLDz8Z1xlFQ.woff2\";s:70:\"https://fonts.gstatic.com/s/poppins/v21/pxiEyp8kv8JHgFVrJJnecmNE.woff2\";s:92:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiEyp8kv8JHgFVrJJnecmNE.woff2\";s:68:\"https://fonts.gstatic.com/s/poppins/v21/pxiEyp8kv8JHgFVrJJfecg.woff2\";s:90:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiEyp8kv8JHgFVrJJfecg.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLGT9Z1JlFc-K.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLGT9Z1JlFc-K.woff2\";s:72:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLGT9Z1xlFQ.woff2\";s:94:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLGT9Z1xlFQ.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLEj6Z1JlFc-K.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLEj6Z1JlFc-K.woff2\";s:72:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLEj6Z1xlFQ.woff2\";s:94:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLEj6Z1xlFQ.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLCz7Z1JlFc-K.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLCz7Z1JlFc-K.woff2\";s:72:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLCz7Z1xlFQ.woff2\";s:94:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLCz7Z1xlFQ.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLDD4Z1JlFc-K.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLDD4Z1JlFc-K.woff2\";s:72:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLDD4Z1xlFQ.woff2\";s:94:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLDD4Z1xlFQ.woff2\";s:74:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLBT5Z1JlFc-K.woff2\";s:96:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLBT5Z1JlFc-K.woff2\";s:72:\"https://fonts.gstatic.com/s/poppins/v21/pxiByp8kv8JHgFVrLBT5Z1xlFQ.woff2\";s:94:\"D:/xampp/htdocs/wordpress/wordpress/wp-content//fonts/poppins/pxiByp8kv8JHgFVrLBT5Z1xlFQ.woff2\";}', 'off'),
(224, 'morenews_theme_installed_time_v2', '1727265942', 'auto'),
(233, 'WPLANG', '', 'auto'),
(234, 'new_admin_email', 'andiek.qtm2010@gmail.com', 'auto'),
(372, 'category_color_4', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(374, 'category_color_5', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(376, 'category_color_6', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(378, 'category_color_7', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(380, 'category_color_8', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(382, 'category_color_9', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(384, 'category_color_10', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(386, 'category_color_11', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(388, 'category_color_12', 'a:1:{s:21:\"color_class_term_meta\";s:16:\"category-color-1\";}', 'auto'),
(395, 'wp_calendar_block_has_published_posts', '1', 'auto'),
(400, 'category_children', 'a:2:{i:4;a:2:{i:0;i:6;i:1;i:7;}i:5;a:6:{i:0;i:8;i:1;i:9;i:2;i:10;i:3;i:11;i:4;i:12;i:5;i:19;}}', 'auto'),
(434, 'https_detection_errors', 'a:1:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:24:\"SSL verification failed.\";}}', 'off'),
(435, '_transient_health-check-site-status-result', '{\"good\":17,\"recommended\":6,\"critical\":0}', 'on'),
(603, '_site_transient_timeout_wp_theme_files_patterns-e2fd55a22c9bd988cff21056db6a3e57', '1741332252', 'off'),
(604, '_site_transient_wp_theme_files_patterns-e2fd55a22c9bd988cff21056db6a3e57', 'a:2:{s:7:\"version\";s:5:\"1.2.0\";s:8:\"patterns\";a:0:{}}', 'off'),
(605, '_site_transient_timeout_wp_theme_files_patterns-bafdde3bd58cf387e2246f17f285053e', '1741332252', 'off'),
(606, '_site_transient_wp_theme_files_patterns-bafdde3bd58cf387e2246f17f285053e', 'a:2:{s:7:\"version\";s:5:\"2.8.2\";s:8:\"patterns\";a:0:{}}', 'off'),
(613, '_site_transient_timeout_theme_roots', '1741332285', 'off'),
(614, '_site_transient_theme_roots', 'a:7:{s:11:\"centralnews\";s:7:\"/themes\";s:8:\"morenews\";s:7:\"/themes\";s:17:\"skt-physiotherapy\";s:7:\"/themes\";s:12:\"skt-pizzeria\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";s:15:\"twentytwentytwo\";s:7:\"/themes\";}', 'off'),
(616, '_site_transient_timeout_wp_theme_files_patterns-9e3cf20d85d68718a7e3fc7b51be3723', '1741332399', 'off'),
(617, '_site_transient_wp_theme_files_patterns-9e3cf20d85d68718a7e3fc7b51be3723', 'a:2:{s:7:\"version\";s:5:\"1.2.1\";s:8:\"patterns\";a:0:{}}', 'off'),
(618, '_site_transient_timeout_wp_theme_files_patterns-2b3ecf4be41a77362be2641da8bf7ccc', '1741332399', 'off'),
(619, '_site_transient_wp_theme_files_patterns-2b3ecf4be41a77362be2641da8bf7ccc', 'a:2:{s:7:\"version\";s:5:\"2.8.3\";s:8:\"patterns\";a:0:{}}', 'off'),
(620, 'db_upgraded', '1', 'auto'),
(621, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.7.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.7.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.7.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.7.2-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.7.2\";s:7:\"version\";s:5:\"6.7.2\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1741330603;s:15:\"version_checked\";s:5:\"6.7.2\";s:12:\"translations\";a:0:{}}', 'off'),
(622, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1741330604;s:7:\"checked\";a:7:{s:11:\"centralnews\";s:5:\"1.2.1\";s:8:\"morenews\";s:5:\"2.8.3\";s:17:\"skt-physiotherapy\";s:3:\"1.2\";s:12:\"skt-pizzeria\";s:3:\"1.2\";s:16:\"twentytwentyfour\";s:3:\"1.2\";s:17:\"twentytwentythree\";s:3:\"1.5\";s:15:\"twentytwentytwo\";s:3:\"1.8\";}s:8:\"response\";a:7:{s:11:\"centralnews\";a:6:{s:5:\"theme\";s:11:\"centralnews\";s:11:\"new_version\";s:6:\"2.0.43\";s:3:\"url\";s:41:\"https://wordpress.org/themes/centralnews/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/centralnews.2.0.43.zip\";s:8:\"requires\";s:3:\"4.0\";s:12:\"requires_php\";s:3:\"5.3\";}s:8:\"morenews\";a:6:{s:5:\"theme\";s:8:\"morenews\";s:11:\"new_version\";s:5:\"3.3.5\";s:3:\"url\";s:38:\"https://wordpress.org/themes/morenews/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/theme/morenews.3.3.5.zip\";s:8:\"requires\";s:3:\"4.0\";s:12:\"requires_php\";s:3:\"5.3\";}s:17:\"skt-physiotherapy\";a:6:{s:5:\"theme\";s:17:\"skt-physiotherapy\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:47:\"https://wordpress.org/themes/skt-physiotherapy/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/skt-physiotherapy.1.4.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";s:3:\"7.4\";}s:12:\"skt-pizzeria\";a:6:{s:5:\"theme\";s:12:\"skt-pizzeria\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:42:\"https://wordpress.org/themes/skt-pizzeria/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/skt-pizzeria.1.4.zip\";s:8:\"requires\";b:0;s:12:\"requires_php\";s:3:\"7.4\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.3.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}s:15:\"twentytwentytwo\";a:6:{s:5:\"theme\";s:15:\"twentytwentytwo\";s:11:\"new_version\";s:3:\"1.9\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentytwo/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentytwo.1.9.zip\";s:8:\"requires\";s:3:\"5.9\";s:12:\"requires_php\";s:3:\"5.6\";}}s:9:\"no_update\";a:0:{}s:12:\"translations\";a:0:{}}', 'off'),
(623, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1741330606;s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"5.3.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.5.3.7.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";s:6:\"tested\";s:5:\"6.7.2\";s:12:\"requires_php\";s:6:\"5.6.20\";s:16:\"requires_plugins\";a:0:{}}s:31:\"templatespare/templatespare.php\";O:8:\"stdClass\":13:{s:2:\"id\";s:27:\"w.org/plugins/templatespare\";s:4:\"slug\";s:13:\"templatespare\";s:6:\"plugin\";s:31:\"templatespare/templatespare.php\";s:11:\"new_version\";s:5:\"3.0.0\";s:3:\"url\";s:44:\"https://wordpress.org/plugins/templatespare/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/templatespare.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/templatespare/assets/icon-256x256.png?rev=2849750\";s:2:\"1x\";s:66:\"https://ps.w.org/templatespare/assets/icon-128x128.png?rev=2849750\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:68:\"https://ps.w.org/templatespare/assets/banner-772x250.png?rev=3240563\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.0\";s:6:\"tested\";s:5:\"6.7.2\";s:12:\"requires_php\";b:0;s:16:\"requires_plugins\";a:0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:3:{s:19:\"akismet/akismet.php\";s:5:\"5.3.3\";s:9:\"hello.php\";s:5:\"1.7.2\";s:31:\"templatespare/templatespare.php\";s:5:\"2.4.4\";}}', 'off'),
(624, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:24:\"andiek.qtm2010@gmail.com\";s:7:\"version\";s:5:\"6.7.2\";s:9:\"timestamp\";i:1741330605;}', 'off'),
(625, '_site_transient_timeout_php_check_da775d00ae55849f14f81cf79fc50d46', '1741935408', 'off'),
(626, '_site_transient_php_check_da775d00ae55849f14f81cf79fc50d46', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off'),
(627, '_transient_wp_styles_for_blocks', 'a:2:{s:4:\"hash\";s:32:\"0ee315c7ad2fa59a5c4abc2786f39b0d\";s:6:\"blocks\";a:5:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:0:\"\";s:12:\"core/columns\";s:0:\"\";s:14:\"core/pullquote\";s:69:\":root :where(.wp-block-pullquote){font-size: 1.5em;line-height: 1.6;}\";}}', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 3, '_edit_lock', '1727346745:1'),
(4, 2, '_edit_lock', '1727346796:1'),
(5, 7, '_edit_lock', '1727332557:1'),
(6, 8, '_wp_attached_file', '2024/09/DSC00317-scaled.jpg'),
(7, 8, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1099;s:4:\"file\";s:27:\"2024/09/DSC00317-scaled.jpg\";s:8:\"filesize\";i:521864;s:5:\"sizes\";a:6:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"DSC00317-300x129.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:129;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14962;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"DSC00317-1024x439.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:439;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:114448;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"DSC00317-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9317;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"DSC00317-768x330.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:70582;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:21:\"DSC00317-1536x659.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:659;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:225550;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:21:\"DSC00317-2048x879.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:879;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:362373;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"5.6\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"NEX-5N\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1711876468\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"18\";s:3:\"iso\";s:4:\"1600\";s:13:\"shutter_speed\";s:5:\"0.008\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:12:\"DSC00317.jpg\";}'),
(13, 13, '_wp_attached_file', '2024/09/DSC00302-scaled.jpg'),
(14, 13, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1701;s:4:\"file\";s:27:\"2024/09/DSC00302-scaled.jpg\";s:8:\"filesize\";i:638557;s:5:\"sizes\";a:9:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"DSC00302-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:20618;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"DSC00302-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:145567;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"DSC00302-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9231;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"DSC00302-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:91862;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:22:\"DSC00302-1536x1021.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1021;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:279506;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:22:\"DSC00302-2048x1361.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1361;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:444844;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:21:\"DSC00302-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:145567;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:20:\"DSC00302-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:106982;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:20:\"DSC00302-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:62754;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"5.6\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"NEX-5N\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1711875957\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"32\";s:3:\"iso\";s:4:\"1600\";s:13:\"shutter_speed\";s:4:\"0.01\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:12:\"DSC00302.jpg\";}'),
(29, 20, '_wp_attached_file', '2024/09/cropped-nu-green-background-copy.jpg'),
(30, 20, '_wp_attachment_context', 'main-banner-background-section'),
(31, 20, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:44:\"2024/09/cropped-nu-green-background-copy.jpg\";s:8:\"filesize\";i:61789;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:44:\"cropped-nu-green-background-copy-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7872;}s:5:\"large\";a:5:{s:4:\"file\";s:45:\"cropped-nu-green-background-copy-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:47494;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:44:\"cropped-nu-green-background-copy-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3956;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:44:\"cropped-nu-green-background-copy-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:31304;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:45:\"cropped-nu-green-background-copy-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:47494;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:44:\"cropped-nu-green-background-copy-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:39740;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:44:\"cropped-nu-green-background-copy-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:24400;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(38, 24, '_wp_attached_file', '2024/09/cropped-nu-green-background-copy-1.jpg'),
(39, 24, '_wp_attachment_context', 'main-banner-background-section'),
(40, 24, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1199;s:6:\"height\";i:674;s:4:\"file\";s:46:\"2024/09/cropped-nu-green-background-copy-1.jpg\";s:8:\"filesize\";i:54258;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:46:\"cropped-nu-green-background-copy-1-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6559;}s:5:\"large\";a:5:{s:4:\"file\";s:47:\"cropped-nu-green-background-copy-1-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:41457;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:46:\"cropped-nu-green-background-copy-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3315;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:46:\"cropped-nu-green-background-copy-1-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:27022;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:47:\"cropped-nu-green-background-copy-1-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:41457;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:46:\"cropped-nu-green-background-copy-1-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:34731;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:46:\"cropped-nu-green-background-copy-1-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:21028;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(44, 26, '_wp_attached_file', '2024/09/nu-green-background-copy2.jpg'),
(45, 26, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1200;s:6:\"height\";i:675;s:4:\"file\";s:37:\"2024/09/nu-green-background-copy2.jpg\";s:8:\"filesize\";i:240835;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:37:\"nu-green-background-copy2-300x169.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:169;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:6872;}s:5:\"large\";a:5:{s:4:\"file\";s:38:\"nu-green-background-copy2-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:41307;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:37:\"nu-green-background-copy2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:3346;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:37:\"nu-green-background-copy2-768x432.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:432;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:27115;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:38:\"nu-green-background-copy2-1024x576.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:41307;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:37:\"nu-green-background-copy2-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:34698;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:37:\"nu-green-background-copy2-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:21332;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(46, 26, '_wp_attachment_is_custom_background', 'centralnews'),
(49, 7, '_edit_last', '1'),
(50, 7, 'morenews-meta-content-alignment', 'align-content-left'),
(51, 7, 'morenews-meta-content-mode', 'single-content-mode-default'),
(63, 34, '_wp_attached_file', '2024/09/DSC00248-scaled.jpg'),
(64, 34, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1701;s:4:\"file\";s:27:\"2024/09/DSC00248-scaled.jpg\";s:8:\"filesize\";i:573077;s:5:\"sizes\";a:9:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"DSC00248-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19941;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"DSC00248-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:137674;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"DSC00248-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8754;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"DSC00248-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:88106;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:22:\"DSC00248-1536x1021.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1021;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:258873;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:22:\"DSC00248-2048x1361.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1361;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:404695;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:21:\"DSC00248-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:137674;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:20:\"DSC00248-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:101446;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:20:\"DSC00248-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:60192;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"3.5\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"NEX-5N\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1711870700\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"18\";s:3:\"iso\";s:3:\"800\";s:13:\"shutter_speed\";s:6:\"0.0125\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:12:\"DSC00248.jpg\";}'),
(67, 36, '_wp_attached_file', '2024/09/cropped-download.png'),
(68, 36, '_wp_attachment_context', 'site-icon'),
(69, 36, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:28:\"2024/09/cropped-download.png\";s:8:\"filesize\";i:74776;s:5:\"sizes\";a:7:{s:6:\"medium\";a:5:{s:4:\"file\";s:28:\"cropped-download-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:61517;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:28:\"cropped-download-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:20971;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:28:\"cropped-download-512x410.png\";s:5:\"width\";i:512;s:6:\"height\";i:410;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:73920;}s:13:\"site_icon-270\";a:5:{s:4:\"file\";s:28:\"cropped-download-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:53231;}s:13:\"site_icon-192\";a:5:{s:4:\"file\";s:28:\"cropped-download-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:31593;}s:13:\"site_icon-180\";a:5:{s:4:\"file\";s:28:\"cropped-download-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:28233;}s:12:\"site_icon-32\";a:5:{s:4:\"file\";s:26:\"cropped-download-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";s:8:\"filesize\";i:1825;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(72, 38, '_wp_attached_file', '2024/09/Heder.jpg'),
(73, 38, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:920;s:6:\"height\";i:110;s:4:\"file\";s:17:\"2024/09/Heder.jpg\";s:8:\"filesize\";i:82115;s:5:\"sizes\";a:5:{s:6:\"medium\";a:5:{s:4:\"file\";s:16:\"Heder-300x36.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:36;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:4858;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:17:\"Heder-150x110.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:110;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:5256;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:16:\"Heder-768x92.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:92;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:15706;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:17:\"Heder-825x110.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:110;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:20140;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:17:\"Heder-590x110.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:110;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:16769;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}}'),
(75, 40, '_wp_attached_file', '2024/09/Berbagi.jpeg'),
(76, 40, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1600;s:6:\"height\";i:1204;s:4:\"file\";s:20:\"2024/09/Berbagi.jpeg\";s:8:\"filesize\";i:281974;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"Berbagi-300x226.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:226;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:21809;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"Berbagi-1024x771.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:771;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:161553;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"Berbagi-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8481;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"Berbagi-768x578.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:578;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:101669;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:22:\"Berbagi-1536x1156.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:1156;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:301335;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:21:\"Berbagi-1024x771.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:771;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:161553;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:20:\"Berbagi-825x575.jpeg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:106259;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:20:\"Berbagi-590x410.jpeg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:61537;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(101, 38, '_wp_attachment_custom_header_last_used_centralnews', '1727281474'),
(102, 38, '_wp_attachment_is_custom_header', 'centralnews'),
(108, 2, '_edit_last', '1'),
(109, 2, 'morenews-meta-content-alignment', 'align-content-left'),
(110, 2, 'morenews-meta-content-mode', 'single-content-mode-default'),
(111, 59, '_edit_lock', '1728038145:1'),
(114, 59, '_edit_last', '1'),
(117, 59, 'morenews-meta-content-alignment', 'align-content-left'),
(118, 59, 'morenews-meta-content-mode', 'single-content-mode-default'),
(120, 62, '_wp_attached_file', '2024/09/WhatsApp-Image-2024-09-13-at-22.08.25.jpeg'),
(121, 62, '_wp_attachment_metadata', 'a:6:{s:5:\"width\";i:1600;s:6:\"height\";i:1201;s:4:\"file\";s:50:\"2024/09/WhatsApp-Image-2024-09-13-at-22.08.25.jpeg\";s:8:\"filesize\";i:253385;s:5:\"sizes\";a:8:{s:6:\"medium\";a:5:{s:4:\"file\";s:50:\"WhatsApp-Image-2024-09-13-at-22.08.25-300x225.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19396;}s:5:\"large\";a:5:{s:4:\"file\";s:51:\"WhatsApp-Image-2024-09-13-at-22.08.25-1024x769.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:769;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:137569;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:50:\"WhatsApp-Image-2024-09-13-at-22.08.25-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8116;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:50:\"WhatsApp-Image-2024-09-13-at-22.08.25-768x576.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:576;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:86722;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:52:\"WhatsApp-Image-2024-09-13-at-22.08.25-1536x1153.jpeg\";s:5:\"width\";i:1536;s:6:\"height\";i:1153;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:252960;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:51:\"WhatsApp-Image-2024-09-13-at-22.08.25-1024x769.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:769;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:137569;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:50:\"WhatsApp-Image-2024-09-13-at-22.08.25-825x575.jpeg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:92475;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:50:\"WhatsApp-Image-2024-09-13-at-22.08.25-590x410.jpeg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:54601;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(122, 59, '_thumbnail_id', '62'),
(127, 63, '_edit_lock', '1728037902:1'),
(128, 64, '_wp_attached_file', '2024/09/DSC00317-1-scaled.jpg'),
(129, 64, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1099;s:4:\"file\";s:29:\"2024/09/DSC00317-1-scaled.jpg\";s:8:\"filesize\";i:521864;s:5:\"sizes\";a:9:{s:6:\"medium\";a:5:{s:4:\"file\";s:22:\"DSC00317-1-300x129.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:129;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:14962;}s:5:\"large\";a:5:{s:4:\"file\";s:23:\"DSC00317-1-1024x439.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:439;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:114448;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:22:\"DSC00317-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:9317;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:22:\"DSC00317-1-768x330.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:330;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:70582;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:23:\"DSC00317-1-1536x659.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:659;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:225550;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:23:\"DSC00317-1-2048x879.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:879;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:362373;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:23:\"DSC00317-1-1024x439.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:439;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:114448;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:22:\"DSC00317-1-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:121355;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:22:\"DSC00317-1-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:68681;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"5.6\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"NEX-5N\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1711876468\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"18\";s:3:\"iso\";s:4:\"1600\";s:13:\"shutter_speed\";s:5:\"0.008\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:14:\"DSC00317-1.jpg\";}'),
(132, 63, '_thumbnail_id', '64'),
(133, 63, '_edit_last', '1'),
(136, 63, 'morenews-meta-content-alignment', 'align-content-left'),
(137, 63, 'morenews-meta-content-mode', 'single-content-mode-default'),
(159, 77, '_edit_lock', '1728037676:1'),
(162, 77, '_thumbnail_id', '40'),
(163, 77, '_edit_last', '1'),
(164, 77, 'morenews-meta-content-alignment', 'align-content-left'),
(165, 77, 'morenews-meta-content-mode', 'single-content-mode-default'),
(166, 1, '_edit_lock', '1727865337:1'),
(169, 1, '_edit_last', '1'),
(172, 1, 'morenews-meta-content-alignment', 'align-content-left'),
(173, 1, 'morenews-meta-content-mode', 'single-content-mode-default'),
(174, 80, '_wp_attached_file', '2024/09/DSC00364-scaled.jpg'),
(175, 80, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1701;s:4:\"file\";s:27:\"2024/09/DSC00364-scaled.jpg\";s:8:\"filesize\";i:418632;s:5:\"sizes\";a:9:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"DSC00364-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:15853;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"DSC00364-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:93003;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"DSC00364-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:7781;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"DSC00364-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:60663;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:22:\"DSC00364-1536x1021.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1021;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:175259;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:22:\"DSC00364-2048x1361.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1361;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:283712;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:21:\"DSC00364-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:93003;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:20:\"DSC00364-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:70243;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:20:\"DSC00364-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:43094;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:2:\"22\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"NEX-5N\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1711876769\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"38\";s:3:\"iso\";s:4:\"1600\";s:13:\"shutter_speed\";s:7:\"0.00625\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:12:\"DSC00364.jpg\";}'),
(177, 1, '_thumbnail_id', '80'),
(183, 84, '_wp_attached_file', '2024/09/DSC00267-scaled.jpg'),
(184, 84, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1701;s:4:\"file\";s:27:\"2024/09/DSC00267-scaled.jpg\";s:8:\"filesize\";i:609652;s:5:\"sizes\";a:9:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"DSC00267-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:19418;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"DSC00267-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:142085;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"DSC00267-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8613;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"DSC00267-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:88870;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:22:\"DSC00267-1536x1021.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1021;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:272649;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:22:\"DSC00267-2048x1361.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1361;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:430081;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:21:\"DSC00267-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:142085;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:20:\"DSC00267-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:104032;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:20:\"DSC00267-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:60069;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"6.3\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"NEX-5N\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1711873568\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"18\";s:3:\"iso\";s:3:\"800\";s:13:\"shutter_speed\";s:5:\"0.025\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:12:\"DSC00267.jpg\";}'),
(189, 86, '_wp_attached_file', '2024/09/DSC00282-scaled.jpg'),
(190, 86, '_wp_attachment_metadata', 'a:7:{s:5:\"width\";i:2560;s:6:\"height\";i:1701;s:4:\"file\";s:27:\"2024/09/DSC00282-scaled.jpg\";s:8:\"filesize\";i:535474;s:5:\"sizes\";a:9:{s:6:\"medium\";a:5:{s:4:\"file\";s:20:\"DSC00282-300x199.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:199;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:17410;}s:5:\"large\";a:5:{s:4:\"file\";s:21:\"DSC00282-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:115749;}s:9:\"thumbnail\";a:5:{s:4:\"file\";s:20:\"DSC00282-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:8052;}s:12:\"medium_large\";a:5:{s:4:\"file\";s:20:\"DSC00282-768x510.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:510;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:73730;}s:9:\"1536x1536\";a:5:{s:4:\"file\";s:22:\"DSC00282-1536x1021.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1021;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:223553;}s:9:\"2048x2048\";a:5:{s:4:\"file\";s:22:\"DSC00282-2048x1361.jpg\";s:5:\"width\";i:2048;s:6:\"height\";i:1361;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:362800;}s:17:\"morenews-featured\";a:5:{s:4:\"file\";s:21:\"DSC00282-1024x680.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:680;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:115749;}s:14:\"morenews-large\";a:5:{s:4:\"file\";s:20:\"DSC00282-825x575.jpg\";s:5:\"width\";i:825;s:6:\"height\";i:575;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:85054;}s:15:\"morenews-medium\";a:5:{s:4:\"file\";s:20:\"DSC00282-590x410.jpg\";s:5:\"width\";i:590;s:6:\"height\";i:410;s:9:\"mime-type\";s:10:\"image/jpeg\";s:8:\"filesize\";i:50553;}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:3:\"3.5\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:6:\"NEX-5N\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:10:\"1711874191\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:2:\"18\";s:3:\"iso\";s:4:\"1600\";s:13:\"shutter_speed\";s:4:\"0.01\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"1\";s:8:\"keywords\";a:0:{}}s:14:\"original_image\";s:12:\"DSC00282.jpg\";}'),
(194, 59, '_pingme', '1'),
(195, 59, '_encloseme', '1');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2024-09-25 11:18:22', '2024-09-25 11:18:22', '<!-- wp:paragraph -->\n<p>Kemangsen, 2 Oktober 2024 – Dalam upaya meringankan beban masyarakat yang terdampak oleh situasi ekonomi yang sulit, Lembaga Amil Zakat, Infaq, dan Shodaqoh Nahdlatul Ulama (LAZISNU) Kemangsen kembali menyalurkan bantuan sembako kepada keluarga-keluarga kurang mampu di wilayah Desa Kemangsen, Kecamatan Balongbendo.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Kegiatan yang dilaksanakan pada [tanggal kegiatan] ini dihadiri oleh pengurus LAZISNU Kemangsen, tokoh masyarakat, serta relawan yang turut berpartisipasi dalam pendistribusian bantuan. Sebanyak [jumlah paket] paket sembako telah disalurkan kepada warga yang sebelumnya telah terdata melalui survei dan koordinasi dengan pihak RT dan RW setempat.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ketua LAZISNU Kemangsen, [nama ketua], menyampaikan bahwa kegiatan ini merupakan salah satu bentuk kepedulian terhadap masyarakat, terutama di masa sulit seperti sekarang ini. \"Kami berharap bantuan ini bisa sedikit meringankan beban mereka yang membutuhkan, serta menjadi bentuk kepedulian bersama untuk saling membantu dan berbagi rezeki,” ujarnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Isi paket sembako yang dibagikan mencakup beras, minyak goreng, gula, mie instan, dan kebutuhan pokok lainnya yang diharapkan dapat membantu mencukupi kebutuhan sehari-hari para penerima manfaat selama beberapa hari ke depan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Salah satu penerima bantuan, [nama penerima, jika diperbolehkan], mengucapkan terima kasih atas kepedulian LAZISNU Kemangsen. “Bantuan ini sangat berarti bagi kami, terutama dalam menghadapi kebutuhan hidup sehari-hari. Semoga LAZISNU dan para donatur mendapatkan balasan kebaikan dari Allah SWT,” ungkapnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Selain kegiatan pembagian sembako, LAZISNU Kemangsen juga mengajak masyarakat yang memiliki rezeki lebih untuk turut berdonasi dan berpartisipasi dalam program-program sosial yang dijalankan. “Donasi dari masyarakat sangat membantu keberlanjutan program-program ini, dan kami akan terus berupaya untuk menjadi jembatan kebaikan bagi mereka yang membutuhkan,” tambah [nama ketua].</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU Kemangsen terus berkomitmen untuk hadir di tengah masyarakat melalui berbagai program sosial yang bermanfaat. Diharapkan, kegiatan ini bisa menjadi inspirasi bagi semua pihak untuk lebih peduli dan saling membantu sesama.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Untuk informasi lebih lanjut tentang program dan cara berdonasi, silakan kunjungi laman resmi kami atau hubungi Tim Donasi LAZISNU Kemangsen.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Bantuan Sembako Untuk Keluarga Kurang Mampu', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2024-10-02 02:31:30', '2024-10-02 09:31:30', '', 0, 'http://localhost/wordpress/wordpress/?p=1', 0, 'post', '', 1),
(2, 1, '2024-09-25 11:18:22', '2024-09-25 11:18:22', '<!-- wp:paragraph -->\n<p><strong>LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) </strong>adalah sebuah lembaga yang dibentuk oleh organisasi Nahdlatul Ulama (NU) untuk mengelola zakat, infaq, dan sedekah secara profesional dan amanah. Lembaga ini bertujuan untuk mengoptimalkan pengumpulan, pendistribusian, dan pendayagunaan zakat, infak, sedekah, serta dana sosial lainnya untuk membantu pemberdayaan ekonomi umat, kesejahteraan sosial, dan pembangunan masyarakat yang lebih berkeadilan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Beberapa tujuan utama dari LAZISNU antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Pemberdayaan Ekonomi Umat</strong>: LAZISNU mengarahkan dana yang terkumpul untuk meningkatkan kesejahteraan masyarakat melalui program-program pemberdayaan ekonomi, terutama bagi mereka yang kurang mampu.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Sosial dan Kemanusiaan</strong>: LAZISNU turut berperan dalam kegiatan sosial seperti bantuan bencana alam, pendidikan, kesehatan, serta kegiatan kemanusiaan lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Transparansi dan Akuntabilitas</strong>: Lembaga ini mengedepankan transparansi dalam pengelolaan dana dengan melaporkan secara terbuka bagaimana zakat, infak, dan sedekah disalurkan dan digunakan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Sebagai lembaga yang resmi, LAZISNU telah diakui oleh pemerintah Indonesia sebagai salah satu lembaga pengelola zakat yang sah dan memiliki jaringan nasional yang luas di berbagai wilayah di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'News', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2024-09-25 23:39:09', '2024-09-26 06:39:09', '', 0, 'http://localhost/wordpress/wordpress/?page_id=2', 0, 'page', '', 0),
(3, 1, '2024-09-25 11:18:22', '2024-09-25 11:18:22', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost/wordpress/wordpress.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2024-09-25 11:18:22', '2024-09-25 11:18:22', '', 0, 'http://localhost/wordpress/wordpress/?page_id=3', 0, 'page', '', 0),
(4, 0, '2024-09-25 11:18:27', '2024-09-25 11:18:27', '<!-- wp:page-list /-->', 'Navigation', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2024-09-25 11:18:27', '2024-09-25 11:18:27', '', 0, 'http://localhost/wordpress/wordpress/2024/09/25/navigation/', 0, 'wp_navigation', '', 0),
(6, 1, '2024-09-25 11:23:01', '2024-09-25 11:23:01', '{\"version\": 3, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-twentytwentyfour', '', '', '2024-09-25 11:23:01', '2024-09-25 11:23:01', '', 0, 'http://localhost/wordpress/wordpress/2024/09/25/wp-global-styles-twentytwentyfour/', 0, 'wp_global_styles', '', 0),
(7, 1, '2024-09-25 11:44:06', '2024-09-25 11:44:06', '<!-- wp:heading {\"textAlign\":\"left\",\"level\":4} -->\n<h4 class=\"wp-block-heading has-text-align-left\"></h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'About Us', '', 'publish', 'closed', 'closed', '', 'about', '', '', '2024-09-25 23:35:55', '2024-09-26 06:35:55', '', 0, 'http://localhost/wordpress/wordpress/?page_id=7', 0, 'page', '', 0),
(8, 1, '2024-09-25 11:39:38', '2024-09-25 11:39:38', '', 'DSC00317', '', 'inherit', 'open', 'closed', '', 'dsc00317', '', '', '2024-09-25 11:39:38', '2024-09-25 11:39:38', '', 7, 'http://localhost/wordpress/wordpress/wp-content/uploads/2024/09/DSC00317.jpg', 0, 'attachment', 'image/jpeg', 0),
(9, 1, '2024-09-25 11:43:05', '2024-09-25 11:43:05', '<!-- wp:image {\"id\":8,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/wordpress/wordpress/wp-content/uploads/2024/09/DSC00317-1024x439.jpg\" alt=\"\" class=\"wp-image-8\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"textAlign\":\"left\",\"level\":5} -->\n<h5 class=\"wp-block-heading has-text-align-left\">LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) adalah sebuah lembaga yang dibentuk oleh organisasi Nahdlatul Ulama (NU) untuk mengelola zakat, infaq, dan sedekah secara profesional dan amanah. Lembaga ini bertujuan untuk mengoptimalkan pengumpulan, pendistribusian, dan pendayagunaan zakat, infak, sedekah, serta dana sosial lainnya untuk membantu pemberdayaan ekonomi umat, kesejahteraan sosial, dan pembangunan masyarakat yang lebih berkeadilan.</h5>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Beberapa tujuan utama dari LAZISNU antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Pemberdayaan Ekonomi Umat</strong>: LAZISNU mengarahkan dana yang terkumpul untuk meningkatkan kesejahteraan masyarakat melalui program-program pemberdayaan ekonomi, terutama bagi mereka yang kurang mampu.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Sosial dan Kemanusiaan</strong>: LAZISNU turut berperan dalam kegiatan sosial seperti bantuan bencana alam, pendidikan, kesehatan, serta kegiatan kemanusiaan lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Transparansi dan Akuntabilitas</strong>: Lembaga ini mengedepankan transparansi dalam pengelolaan dana dengan melaporkan secara terbuka bagaimana zakat, infak, dan sedekah disalurkan dan digunakan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Sebagai lembaga yang resmi, LAZISNU telah diakui oleh pemerintah Indonesia sebagai salah satu lembaga pengelola zakat yang sah dan memiliki jaringan nasional yang luas di berbagai wilayah di Indonesia.</p>\n<!-- /wp:paragraph -->', 'About Us', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2024-09-25 11:43:05', '2024-09-25 11:43:05', '', 7, 'http://localhost/wordpress/wordpress/?p=9', 0, 'revision', '', 0),
(11, 1, '2024-09-25 12:09:00', '2024-09-25 12:09:00', '{\"version\": 3, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-centralnews', '', '', '2024-09-25 12:09:00', '2024-09-25 12:09:00', '', 0, 'http://localhost/wordpress/wordpress/2024/09/25/wp-global-styles-centralnews/', 0, 'wp_global_styles', '', 0),
(13, 1, '2024-09-25 12:24:33', '2024-09-25 12:24:33', '', 'DSC00302', '', 'inherit', 'open', 'closed', '', 'dsc00302', '', '', '2024-09-25 12:24:33', '2024-09-25 12:24:33', '', 0, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00302.jpg', 0, 'attachment', 'image/jpeg', 0),
(20, 1, '2024-09-25 12:42:19', '2024-09-25 12:42:19', 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/cropped-nu-green-background-copy.jpg', 'cropped-nu-green-background-copy.jpg', '', 'inherit', 'open', 'closed', '', 'cropped-nu-green-background-copy-jpg', '', '', '2024-09-25 12:42:19', '2024-09-25 12:42:19', '', 19, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/cropped-nu-green-background-copy.jpg', 0, 'attachment', 'image/jpeg', 0),
(24, 1, '2024-09-25 12:45:59', '2024-09-25 12:45:59', 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/cropped-nu-green-background-copy-1.jpg', 'nu-green-background copy', '', 'inherit', 'open', 'closed', '', 'nu-green-background-copy-3', '', '', '2024-09-25 12:45:59', '2024-09-25 12:45:59', '', 23, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/cropped-nu-green-background-copy-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(26, 1, '2024-09-25 12:47:51', '2024-09-25 12:47:51', '', 'nu-green-background copy2', '', 'inherit', 'open', 'closed', '', 'nu-green-background-copy2', '', '', '2024-09-25 12:47:51', '2024-09-25 12:47:51', '', 0, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/nu-green-background-copy2.jpg', 0, 'attachment', 'image/jpeg', 0),
(28, 1, '2024-09-25 12:49:51', '2024-09-25 12:49:51', '<!-- wp:image {\"id\":8,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/wordpress/wordpress/wp-content/uploads/2024/09/DSC00317-1024x439.jpg\" alt=\"\" class=\"wp-image-8\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"textAlign\":\"left\",\"level\":4} -->\n<h4 class=\"wp-block-heading has-text-align-left\">LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) adalah sebuah lembaga yang dibentuk oleh organisasi Nahdlatul Ulama (NU) untuk mengelola zakat, infaq, dan sedekah secara profesional dan amanah. Lembaga ini bertujuan untuk mengoptimalkan pengumpulan, pendistribusian, dan pendayagunaan zakat, infak, sedekah, serta dana sosial lainnya untuk membantu pemberdayaan ekonomi umat, kesejahteraan sosial, dan pembangunan masyarakat yang lebih berkeadilan.</h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Beberapa tujuan utama dari LAZISNU antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Pemberdayaan Ekonomi Umat</strong>: LAZISNU mengarahkan dana yang terkumpul untuk meningkatkan kesejahteraan masyarakat melalui program-program pemberdayaan ekonomi, terutama bagi mereka yang kurang mampu.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Sosial dan Kemanusiaan</strong>: LAZISNU turut berperan dalam kegiatan sosial seperti bantuan bencana alam, pendidikan, kesehatan, serta kegiatan kemanusiaan lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Transparansi dan Akuntabilitas</strong>: Lembaga ini mengedepankan transparansi dalam pengelolaan dana dengan melaporkan secara terbuka bagaimana zakat, infak, dan sedekah disalurkan dan digunakan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Sebagai lembaga yang resmi, LAZISNU telah diakui oleh pemerintah Indonesia sebagai salah satu lembaga pengelola zakat yang sah dan memiliki jaringan nasional yang luas di berbagai wilayah di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'About Us', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2024-09-25 12:49:51', '2024-09-25 12:49:51', '', 7, 'http://localhost/lazisnukemangsen/?p=28', 0, 'revision', '', 0),
(34, 1, '2024-09-25 13:00:39', '2024-09-25 13:00:39', '', 'DSC00248', '', 'inherit', 'open', 'closed', '', 'dsc00248', '', '', '2024-09-25 13:00:39', '2024-09-25 13:00:39', '', 0, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00248.jpg', 0, 'attachment', 'image/jpeg', 0),
(36, 1, '2024-09-25 13:02:47', '2024-09-25 13:02:47', 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/cropped-download.png', 'cropped-download.png', '', 'inherit', 'open', 'closed', '', 'cropped-download-png', '', '', '2024-09-25 13:02:47', '2024-09-25 13:02:47', '', 35, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/cropped-download.png', 0, 'attachment', 'image/png', 0),
(38, 1, '2024-09-25 15:36:07', '2024-09-25 15:36:07', '', 'Heder', '', 'inherit', 'open', 'closed', '', 'heder', '', '', '2024-09-25 15:36:07', '2024-09-25 15:36:07', '', 0, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/Heder.jpg', 0, 'attachment', 'image/jpeg', 0),
(40, 1, '2024-09-25 15:43:39', '2024-09-25 15:43:39', '', 'Peduli dan Berbagi', '', 'inherit', 'open', 'closed', '', 'berbagi', '', '', '2024-09-26 03:50:48', '2024-09-26 10:50:48', '', 0, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/Berbagi.jpeg', 0, 'attachment', 'image/jpeg', 0),
(53, 1, '2024-09-25 23:29:15', '2024-09-26 06:29:15', '<!-- wp:paragraph -->\n<p>LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) adalah sebuah lembaga yang dibentuk oleh organisasi Nahdlatul Ulama (NU) untuk mengelola zakat, infaq, dan sedekah secara profesional dan amanah. Lembaga ini bertujuan untuk mengoptimalkan pengumpulan, pendistribusian, dan pendayagunaan zakat, infak, sedekah, serta dana sosial lainnya untuk membantu pemberdayaan ekonomi umat, kesejahteraan sosial, dan pembangunan masyarakat yang lebih berkeadilan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Beberapa tujuan utama dari LAZISNU antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Pemberdayaan Ekonomi Umat</strong>: LAZISNU mengarahkan dana yang terkumpul untuk meningkatkan kesejahteraan masyarakat melalui program-program pemberdayaan ekonomi, terutama bagi mereka yang kurang mampu.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Sosial dan Kemanusiaan</strong>: LAZISNU turut berperan dalam kegiatan sosial seperti bantuan bencana alam, pendidikan, kesehatan, serta kegiatan kemanusiaan lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Transparansi dan Akuntabilitas</strong>: Lembaga ini mengedepankan transparansi dalam pengelolaan dana dengan melaporkan secara terbuka bagaimana zakat, infak, dan sedekah disalurkan dan digunakan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Sebagai lembaga yang resmi, LAZISNU telah diakui oleh pemerintah Indonesia sebagai salah satu lembaga pengelola zakat yang sah dan memiliki jaringan nasional yang luas di berbagai wilayah di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'LAZISNU KEMANGSEN', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2024-09-25 23:29:15', '2024-09-26 06:29:15', '', 2, 'http://localhost/lazisnukemangsen/?p=53', 0, 'revision', '', 0),
(54, 1, '2024-09-25 23:30:11', '2024-09-26 06:30:11', '<!-- wp:paragraph -->\n<p><strong>LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) </strong>adalah sebuah lembaga yang dibentuk oleh organisasi Nahdlatul Ulama (NU) untuk mengelola zakat, infaq, dan sedekah secara profesional dan amanah. Lembaga ini bertujuan untuk mengoptimalkan pengumpulan, pendistribusian, dan pendayagunaan zakat, infak, sedekah, serta dana sosial lainnya untuk membantu pemberdayaan ekonomi umat, kesejahteraan sosial, dan pembangunan masyarakat yang lebih berkeadilan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Beberapa tujuan utama dari LAZISNU antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Pemberdayaan Ekonomi Umat</strong>: LAZISNU mengarahkan dana yang terkumpul untuk meningkatkan kesejahteraan masyarakat melalui program-program pemberdayaan ekonomi, terutama bagi mereka yang kurang mampu.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Sosial dan Kemanusiaan</strong>: LAZISNU turut berperan dalam kegiatan sosial seperti bantuan bencana alam, pendidikan, kesehatan, serta kegiatan kemanusiaan lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Transparansi dan Akuntabilitas</strong>: Lembaga ini mengedepankan transparansi dalam pengelolaan dana dengan melaporkan secara terbuka bagaimana zakat, infak, dan sedekah disalurkan dan digunakan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Sebagai lembaga yang resmi, LAZISNU telah diakui oleh pemerintah Indonesia sebagai salah satu lembaga pengelola zakat yang sah dan memiliki jaringan nasional yang luas di berbagai wilayah di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2024-09-25 23:30:11', '2024-09-26 06:30:11', '', 2, 'http://localhost/lazisnukemangsen/?p=54', 0, 'revision', '', 0),
(55, 1, '2024-09-25 23:35:42', '2024-09-26 06:35:42', '<!-- wp:image {\"id\":8,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/wordpress/wordpress/wp-content/uploads/2024/09/DSC00317-1024x439.jpg\" alt=\"\" class=\"wp-image-8\"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:heading {\"textAlign\":\"left\",\"level\":4} -->\n<h4 class=\"wp-block-heading has-text-align-left\"></h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'About Us', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2024-09-25 23:35:42', '2024-09-26 06:35:42', '', 7, 'http://localhost/lazisnukemangsen/?p=55', 0, 'revision', '', 0),
(56, 1, '2024-09-25 23:35:54', '2024-09-26 06:35:54', '<!-- wp:heading {\"textAlign\":\"left\",\"level\":4} -->\n<h4 class=\"wp-block-heading has-text-align-left\"></h4>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'About Us', '', 'inherit', 'closed', 'closed', '', '7-revision-v1', '', '', '2024-09-25 23:35:54', '2024-09-26 06:35:54', '', 7, 'http://localhost/lazisnukemangsen/?p=56', 0, 'revision', '', 0),
(57, 1, '2024-09-25 23:37:38', '2024-09-26 06:37:38', '<!-- wp:paragraph -->\n<p><strong>LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) </strong>adalah sebuah lembaga yang dibentuk oleh organisasi Nahdlatul Ulama (NU) untuk mengelola zakat, infaq, dan sedekah secara profesional dan amanah. Lembaga ini bertujuan untuk mengoptimalkan pengumpulan, pendistribusian, dan pendayagunaan zakat, infak, sedekah, serta dana sosial lainnya untuk membantu pemberdayaan ekonomi umat, kesejahteraan sosial, dan pembangunan masyarakat yang lebih berkeadilan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Beberapa tujuan utama dari LAZISNU antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Pemberdayaan Ekonomi Umat</strong>: LAZISNU mengarahkan dana yang terkumpul untuk meningkatkan kesejahteraan masyarakat melalui program-program pemberdayaan ekonomi, terutama bagi mereka yang kurang mampu.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Sosial dan Kemanusiaan</strong>: LAZISNU turut berperan dalam kegiatan sosial seperti bantuan bencana alam, pendidikan, kesehatan, serta kegiatan kemanusiaan lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Transparansi dan Akuntabilitas</strong>: Lembaga ini mengedepankan transparansi dalam pengelolaan dana dengan melaporkan secara terbuka bagaimana zakat, infak, dan sedekah disalurkan dan digunakan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Sebagai lembaga yang resmi, LAZISNU telah diakui oleh pemerintah Indonesia sebagai salah satu lembaga pengelola zakat yang sah dan memiliki jaringan nasional yang luas di berbagai wilayah di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Berita', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2024-09-25 23:37:38', '2024-09-26 06:37:38', '', 2, 'http://localhost/lazisnukemangsen/?p=57', 0, 'revision', '', 0),
(58, 1, '2024-09-25 23:39:02', '2024-09-26 06:39:02', '<!-- wp:paragraph -->\n<p><strong>LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) </strong>adalah sebuah lembaga yang dibentuk oleh organisasi Nahdlatul Ulama (NU) untuk mengelola zakat, infaq, dan sedekah secara profesional dan amanah. Lembaga ini bertujuan untuk mengoptimalkan pengumpulan, pendistribusian, dan pendayagunaan zakat, infak, sedekah, serta dana sosial lainnya untuk membantu pemberdayaan ekonomi umat, kesejahteraan sosial, dan pembangunan masyarakat yang lebih berkeadilan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Beberapa tujuan utama dari LAZISNU antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true} -->\n<ol class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Pemberdayaan Ekonomi Umat</strong>: LAZISNU mengarahkan dana yang terkumpul untuk meningkatkan kesejahteraan masyarakat melalui program-program pemberdayaan ekonomi, terutama bagi mereka yang kurang mampu.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Sosial dan Kemanusiaan</strong>: LAZISNU turut berperan dalam kegiatan sosial seperti bantuan bencana alam, pendidikan, kesehatan, serta kegiatan kemanusiaan lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Transparansi dan Akuntabilitas</strong>: Lembaga ini mengedepankan transparansi dalam pengelolaan dana dengan melaporkan secara terbuka bagaimana zakat, infak, dan sedekah disalurkan dan digunakan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p>Sebagai lembaga yang resmi, LAZISNU telah diakui oleh pemerintah Indonesia sebagai salah satu lembaga pengelola zakat yang sah dan memiliki jaringan nasional yang luas di berbagai wilayah di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'News', '', 'inherit', 'closed', 'closed', '', '2-revision-v1', '', '', '2024-09-25 23:39:02', '2024-09-26 06:39:02', '', 2, 'http://localhost/lazisnukemangsen/?p=58', 0, 'revision', '', 0),
(59, 1, '2024-09-26 00:18:35', '2024-09-26 07:18:35', '<!-- wp:paragraph -->\n<p>LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) didirikan oleh Nahdlatul Ulama (NU) sebagai bagian dari upaya organisasi tersebut untuk mengelola zakat, infaq, dan sedekah secara lebih terstruktur, profesional, dan transparan. Berikut adalah beberapa poin penting mengenai sejarah awal berdirinya LAZISNU:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. <strong>Latar Belakang</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Nahdlatul Ulama, sebagai organisasi Islam terbesar di Indonesia, memiliki komitmen kuat untuk meningkatkan kesejahteraan umat melalui pengelolaan dana sosial keagamaan seperti zakat, infaq, dan sedekah. Sebelum terbentuknya LAZISNU, berbagai upaya pengumpulan dan pendistribusian zakat dan sedekah dilakukan secara sporadis dan tidak terpusat, sehingga dampaknya kurang maksimal.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2. <strong>Pembentukan dan Legalitas</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU secara resmi dibentuk pada tahun 2004, berdasarkan kebutuhan untuk menyatukan dan mengelola dana-dana sosial tersebut dengan lebih efektif. Pendirian ini juga didasari oleh dorongan dari UU No. 38 Tahun 1999 tentang Pengelolaan Zakat, yang mengatur bahwa pengelolaan zakat dapat dilakukan oleh lembaga resmi yang diakui pemerintah. Pada tahun 2016, status hukum LAZISNU diperkuat dengan SK Kemenag RI No. 118 Tahun 2016 sebagai Lembaga Amil Zakat Nasional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. <strong>Tujuan Pembentukan</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Tujuan utama pembentukan LAZISNU adalah untuk:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Mengoptimalkan pengumpulan, pengelolaan, dan pendistribusian zakat, infaq, dan sedekah secara terpusat dan akuntabel.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Meningkatkan kesejahteraan masyarakat, terutama di kalangan umat Islam, melalui program-program yang terstruktur.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Memanfaatkan potensi zakat, infaq, dan sedekah sebagai salah satu instrumen ekonomi umat untuk mengurangi kemiskinan dan ketimpangan sosial.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. <strong>Perkembangan Organisasi</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Setelah pembentukannya, LAZISNU mulai berkembang pesat dan memiliki cabang-cabang di berbagai wilayah di Indonesia. Kegiatan dan program-programnya terus berkembang, mencakup berbagai sektor seperti pendidikan, kesehatan, pemberdayaan ekonomi, dan bantuan kemanusiaan. LAZISNU juga berupaya meningkatkan kapasitas pengelolaan zakat dengan memperbaiki sistem teknologi informasi, pelatihan SDM, dan jaringan distribusi yang lebih luas.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. <strong>Peran dan Pengaruh</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU telah berperan signifikan dalam membantu masyarakat, khususnya yang berada di bawah garis kemiskinan. Dengan jaringan NU yang luas dan dukungan dari berbagai pihak, LAZISNU terus menjadi salah satu lembaga pengelola zakat yang terpercaya dan diandalkan di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Seiring waktu, LAZISNU bertransformasi menjadi lembaga yang tidak hanya mengelola zakat, tetapi juga berbagai dana sosial lainnya, serta menjalankan berbagai program pemberdayaan yang berkelanjutan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":86,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00282-1024x680.jpg\" alt=\"\" class=\"wp-image-86\"/></figure>\n<!-- /wp:image -->', 'Sejarah Berdirinya LAZISNU', '', 'publish', 'open', 'open', '', 'sejarah-berdirinya-lazisnu', '', '', '2024-10-04 03:33:56', '2024-10-04 10:33:56', '', 0, 'http://localhost/lazisnukemangsen/?p=59', 0, 'post', '', 0),
(60, 1, '2024-09-26 00:18:35', '2024-09-26 07:18:35', '<!-- wp:paragraph -->\n<p>LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) didirikan oleh Nahdlatul Ulama (NU) sebagai bagian dari upaya organisasi tersebut untuk mengelola zakat, infaq, dan sedekah secara lebih terstruktur, profesional, dan transparan. Berikut adalah beberapa poin penting mengenai sejarah awal berdirinya LAZISNU:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. <strong>Latar Belakang</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Nahdlatul Ulama, sebagai organisasi Islam terbesar di Indonesia, memiliki komitmen kuat untuk meningkatkan kesejahteraan umat melalui pengelolaan dana sosial keagamaan seperti zakat, infaq, dan sedekah. Sebelum terbentuknya LAZISNU, berbagai upaya pengumpulan dan pendistribusian zakat dan sedekah dilakukan secara sporadis dan tidak terpusat, sehingga dampaknya kurang maksimal.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2. <strong>Pembentukan dan Legalitas</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU secara resmi dibentuk pada tahun 2004, berdasarkan kebutuhan untuk menyatukan dan mengelola dana-dana sosial tersebut dengan lebih efektif. Pendirian ini juga didasari oleh dorongan dari UU No. 38 Tahun 1999 tentang Pengelolaan Zakat, yang mengatur bahwa pengelolaan zakat dapat dilakukan oleh lembaga resmi yang diakui pemerintah. Pada tahun 2016, status hukum LAZISNU diperkuat dengan SK Kemenag RI No. 118 Tahun 2016 sebagai Lembaga Amil Zakat Nasional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. <strong>Tujuan Pembentukan</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Tujuan utama pembentukan LAZISNU adalah untuk:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Mengoptimalkan pengumpulan, pengelolaan, dan pendistribusian zakat, infaq, dan sedekah secara terpusat dan akuntabel.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Meningkatkan kesejahteraan masyarakat, terutama di kalangan umat Islam, melalui program-program yang terstruktur.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Memanfaatkan potensi zakat, infaq, dan sedekah sebagai salah satu instrumen ekonomi umat untuk mengurangi kemiskinan dan ketimpangan sosial.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. <strong>Perkembangan Organisasi</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Setelah pembentukannya, LAZISNU mulai berkembang pesat dan memiliki cabang-cabang di berbagai wilayah di Indonesia. Kegiatan dan program-programnya terus berkembang, mencakup berbagai sektor seperti pendidikan, kesehatan, pemberdayaan ekonomi, dan bantuan kemanusiaan. LAZISNU juga berupaya meningkatkan kapasitas pengelolaan zakat dengan memperbaiki sistem teknologi informasi, pelatihan SDM, dan jaringan distribusi yang lebih luas.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. <strong>Peran dan Pengaruh</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU telah berperan signifikan dalam membantu masyarakat, khususnya yang berada di bawah garis kemiskinan. Dengan jaringan NU yang luas dan dukungan dari berbagai pihak, LAZISNU terus menjadi salah satu lembaga pengelola zakat yang terpercaya dan diandalkan di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Seiring waktu, LAZISNU bertransformasi menjadi lembaga yang tidak hanya mengelola zakat, tetapi juga berbagai dana sosial lainnya, serta menjalankan berbagai program pemberdayaan yang berkelanjutan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Sejarah Berdirinya LAZISNU', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2024-09-26 00:18:35', '2024-09-26 07:18:35', '', 59, 'http://localhost/lazisnukemangsen/?p=60', 0, 'revision', '', 0),
(62, 1, '2024-09-26 00:29:04', '2024-09-26 07:29:04', '', 'Foto Anggota LAZISNU Kemangsen', '', 'inherit', 'open', 'closed', '', 'whatsapp-image-2024-09-13-at-22-08-25', '', '', '2024-09-26 00:29:42', '2024-09-26 07:29:42', '', 59, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/WhatsApp-Image-2024-09-13-at-22.08.25.jpeg', 0, 'attachment', 'image/jpeg', 0),
(63, 1, '2024-09-26 00:37:20', '2024-09-26 07:37:20', '<!-- wp:paragraph -->\n<p><strong>Kegiatan Rutin Santunan Anak Yatim di Balongbendo</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Balongbendo, Sidoarjo — Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama (LAZISNU) MWC NU Balongbendo bersama dengan NU Care Ranting Kemangsen menggelar kegiatan santunan anak yatim yang berlangsung rutin setiap bulan. Kegiatan ini bertujuan untuk memberikan dukungan moril dan materiil kepada anak-anak yatim di wilayah Kemangsen dan sekitarnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Acara yang dilaksanakan di aula MWC NU Balongbendo pada hari Minggu, disambut antusias oleh masyarakat sekitar. Dalam acara ini, sebanyak puluhan anak yatim dari berbagai usia berkumpul dan menerima santunan berupa bantuan uang tunai dan paket sembako. Selain itu, mereka juga diajak untuk mengikuti berbagai kegiatan positif yang dirancang untuk menumbuhkan rasa kebersamaan dan saling peduli.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":84,\"sizeSlug\":\"medium\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-medium\"><img src=\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00267-300x199.jpg\" alt=\"\" class=\"wp-image-84\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Kegiatan ini dimulai dengan pembukaan yang dipimpin oleh ketua panitia acara, dilanjutkan dengan sambutan dari pengurus MWC NU Balongbendo. Dalam sambutannya, beliau menekankan pentingnya kepedulian terhadap anak-anak yatim sebagai bagian dari tanggung jawab sosial dan keagamaan. \"Anak-anak yatim adalah tanggung jawab kita bersama. Dengan santunan ini, kita berharap dapat meringankan beban mereka dan memberikan kebahagiaan serta harapan untuk masa depan yang lebih baik,\" ujarnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Selama acara berlangsung, suasana penuh keakraban terasa, di mana para anak yatim dan hadirin bersama-sama menikmati hiburan yang disajikan oleh para relawan. Acara ditutup dengan pembagian santunan secara simbolis oleh para pengurus dan donatur yang hadir.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Kegiatan santunan anak yatim ini tidak hanya memberikan bantuan materi, tetapi juga menjadi sarana untuk mempererat silaturahmi antarwarga dan memupuk rasa solidaritas sosial. LAZISNU MWC NU Balongbendo berharap kegiatan seperti ini dapat terus berjalan dan lebih banyak lagi masyarakat yang tergerak untuk berpartisipasi dan berbagi rezeki kepada mereka yang membutuhkan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Dengan adanya kegiatan ini, diharapkan dapat menjadi inspirasi bagi berbagai pihak untuk senantiasa peduli terhadap sesama, terutama mereka yang kurang beruntung. Mari kita terus bersama-sama menebar kebaikan dan membantu sesama, demi terciptanya masyarakat yang lebih harmonis dan sejahtera.</p>\n<!-- /wp:paragraph -->', 'Santunan Anak Yatim', '', 'publish', 'open', 'open', '', 'santunan-anak-yatim', '', '', '2024-10-04 03:30:46', '2024-10-04 10:30:46', '', 0, 'http://localhost/lazisnukemangsen/?p=63', 0, 'post', '', 1),
(64, 1, '2024-09-26 00:36:55', '2024-09-26 07:36:55', '', 'DSC00317', '', 'inherit', 'open', 'closed', '', 'dsc00317-2', '', '', '2024-09-26 00:36:55', '2024-09-26 07:36:55', '', 63, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00317-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(65, 1, '2024-09-26 00:37:20', '2024-09-26 07:37:20', '<!-- wp:paragraph -->\n<p><strong>Kegiatan Rutin Santunan Anak Yatim di Balongbendo</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Balongbendo, Sidoarjo — Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama (LAZISNU) MWC NU Balongbendo bersama dengan NU Care Ranting Kemangsen menggelar kegiatan santunan anak yatim yang berlangsung rutin setiap bulan. Kegiatan ini bertujuan untuk memberikan dukungan moril dan materiil kepada anak-anak yatim di wilayah Kemangsen dan sekitarnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Acara yang dilaksanakan di aula MWC NU Balongbendo pada hari Minggu, disambut antusias oleh masyarakat sekitar. Dalam acara ini, sebanyak puluhan anak yatim dari berbagai usia berkumpul dan menerima santunan berupa bantuan uang tunai dan paket sembako. Selain itu, mereka juga diajak untuk mengikuti berbagai kegiatan positif yang dirancang untuk menumbuhkan rasa kebersamaan dan saling peduli.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Kegiatan ini dimulai dengan pembukaan yang dipimpin oleh ketua panitia acara, dilanjutkan dengan sambutan dari pengurus MWC NU Balongbendo. Dalam sambutannya, beliau menekankan pentingnya kepedulian terhadap anak-anak yatim sebagai bagian dari tanggung jawab sosial dan keagamaan. \"Anak-anak yatim adalah tanggung jawab kita bersama. Dengan santunan ini, kita berharap dapat meringankan beban mereka dan memberikan kebahagiaan serta harapan untuk masa depan yang lebih baik,\" ujarnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Selama acara berlangsung, suasana penuh keakraban terasa, di mana para anak yatim dan hadirin bersama-sama menikmati hiburan yang disajikan oleh para relawan. Acara ditutup dengan pembagian santunan secara simbolis oleh para pengurus dan donatur yang hadir.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Kegiatan santunan anak yatim ini tidak hanya memberikan bantuan materi, tetapi juga menjadi sarana untuk mempererat silaturahmi antarwarga dan memupuk rasa solidaritas sosial. LAZISNU MWC NU Balongbendo berharap kegiatan seperti ini dapat terus berjalan dan lebih banyak lagi masyarakat yang tergerak untuk berpartisipasi dan berbagi rezeki kepada mereka yang membutuhkan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Dengan adanya kegiatan ini, diharapkan dapat menjadi inspirasi bagi berbagai pihak untuk senantiasa peduli terhadap sesama, terutama mereka yang kurang beruntung. Mari kita terus bersama-sama menebar kebaikan dan membantu sesama, demi terciptanya masyarakat yang lebih harmonis dan sejahtera.</p>\n<!-- /wp:paragraph -->', 'Santunan Anak Yatim', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2024-09-26 00:37:20', '2024-09-26 07:37:20', '', 63, 'http://localhost/lazisnukemangsen/?p=65', 0, 'revision', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(77, 1, '2024-10-01 23:42:29', '2024-10-02 06:42:29', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Kehilangan orang tercinta merupakan momen yang penuh duka dan kesedihan mendalam bagi setiap keluarga. Saat duka menyelimuti, sering kali beban emosional yang dirasakan turut dibarengi dengan beban finansial yang tak terelakkan. Di sinilah peran LAZISNU hadir untuk meringankan beban tersebut melalui program LAZISNU Peduli dan Berbagi.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU, sebagai lembaga zakat, infaq, dan sedekah, memiliki komitmen untuk membantu masyarakat yang membutuhkan, terutama mereka yang sedang mengalami masa-masa sulit karena kehilangan anggota keluarga. Program LAZISNU Peduli dan Berbagi didedikasikan untuk memberikan dukungan kepada keluarga yang ditinggalkan oleh orang terkasih. Dukungan ini tidak hanya berupa bantuan materi, tetapi juga dukungan moral dan spiritual.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Bentuk Bantuan yang Diberikan</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Melalui program ini, LAZISNU memberikan bantuan dalam berbagai bentuk, antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true,\"start\":1} -->\n<ol start=\"1\" class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Santunan Tunai</strong>: LAZISNU memberikan bantuan tunai untuk membantu meringankan beban biaya keluarga yang ditinggalkan. Bantuan ini diharapkan dapat membantu memenuhi kebutuhan sehari-hari atau biaya tak terduga lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Logistik</strong>: Selain bantuan tunai, LAZISNU juga memberikan bantuan berupa bahan makanan pokok dan kebutuhan sehari-hari lainnya. Ini sebagai bentuk dukungan agar keluarga yang ditinggalkan dapat tetap melanjutkan hidup dengan lebih tenang tanpa harus khawatir tentang kebutuhan dasar mereka.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Dukungan Moral dan Spiritual</strong>: LAZISNU tidak hanya memberikan bantuan material, tetapi juga hadir untuk memberikan dukungan moral dan spiritual. LAZISNU mengadakan kunjungan langsung ke rumah keluarga yang sedang berduka untuk memberikan doa dan dukungan moral agar mereka tetap tegar dan tabah dalam menghadapi cobaan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p><strong>Meningkatkan Kepedulian Sosial</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Program LAZISNU Peduli dan Berbagi juga menjadi ajakan bagi seluruh masyarakat untuk lebih peduli dan berbagi dengan sesama, terutama kepada mereka yang sedang berduka. Dengan berbagi, kita dapat meringankan beban saudara-saudara kita yang tengah dilanda musibah. Keterlibatan masyarakat dalam program ini juga diharapkan dapat meningkatkan rasa solidaritas dan kepedulian sosial yang lebih luas.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Mengajak Semua Pihak untuk Berkontribusi</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU mengajak seluruh elemen masyarakat, baik individu, komunitas, maupun perusahaan, untuk turut berkontribusi dalam program ini. Setiap donasi dan bantuan yang diberikan akan sangat berarti bagi keluarga yang sedang berduka. LAZISNU memastikan bahwa setiap bantuan yang disalurkan akan sampai tepat sasaran dan dikelola dengan transparan dan akuntabel.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Penutup</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Kepedulian kita kepada sesama, terutama kepada mereka yang sedang berduka, merupakan cerminan dari rasa kemanusiaan yang mendalam. Melalui program LAZISNU Peduli dan Berbagi, LAZISNU berkomitmen untuk selalu hadir di tengah-tengah masyarakat, memberikan bantuan, dan menjadi pelita di saat-saat yang paling gelap. Bersama LAZISNU, mari kita ulurkan tangan, berbagi kasih, dan meringankan beban keluarga yang ditinggalkan. Setiap uluran tangan Anda akan sangat berarti untuk mereka.</p>\n<!-- /wp:paragraph -->', 'LAZISNU Peduli dan Berbagi: Kepedulian kepada Keluarga yang Ditinggal Meninggal Dunia', '', 'publish', 'open', 'open', '', 'lazisnu-peduli-dan-berbagi-kepedulian-kepada-keluarga-yang-ditinggal-meninggal-dunia', '', '', '2024-10-01 23:42:31', '2024-10-02 06:42:31', '', 0, 'http://localhost/lazisnukemangsen/?p=77', 0, 'post', '', 0),
(78, 1, '2024-10-01 23:42:29', '2024-10-02 06:42:29', '<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Kehilangan orang tercinta merupakan momen yang penuh duka dan kesedihan mendalam bagi setiap keluarga. Saat duka menyelimuti, sering kali beban emosional yang dirasakan turut dibarengi dengan beban finansial yang tak terelakkan. Di sinilah peran LAZISNU hadir untuk meringankan beban tersebut melalui program LAZISNU Peduli dan Berbagi.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU, sebagai lembaga zakat, infaq, dan sedekah, memiliki komitmen untuk membantu masyarakat yang membutuhkan, terutama mereka yang sedang mengalami masa-masa sulit karena kehilangan anggota keluarga. Program LAZISNU Peduli dan Berbagi didedikasikan untuk memberikan dukungan kepada keluarga yang ditinggalkan oleh orang terkasih. Dukungan ini tidak hanya berupa bantuan materi, tetapi juga dukungan moral dan spiritual.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Bentuk Bantuan yang Diberikan</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Melalui program ini, LAZISNU memberikan bantuan dalam berbagai bentuk, antara lain:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list {\"ordered\":true,\"start\":1} -->\n<ol start=\"1\" class=\"wp-block-list\"><!-- wp:list-item -->\n<li><strong>Santunan Tunai</strong>: LAZISNU memberikan bantuan tunai untuk membantu meringankan beban biaya keluarga yang ditinggalkan. Bantuan ini diharapkan dapat membantu memenuhi kebutuhan sehari-hari atau biaya tak terduga lainnya.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Bantuan Logistik</strong>: Selain bantuan tunai, LAZISNU juga memberikan bantuan berupa bahan makanan pokok dan kebutuhan sehari-hari lainnya. Ini sebagai bentuk dukungan agar keluarga yang ditinggalkan dapat tetap melanjutkan hidup dengan lebih tenang tanpa harus khawatir tentang kebutuhan dasar mereka.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li><strong>Dukungan Moral dan Spiritual</strong>: LAZISNU tidak hanya memberikan bantuan material, tetapi juga hadir untuk memberikan dukungan moral dan spiritual. LAZISNU mengadakan kunjungan langsung ke rumah keluarga yang sedang berduka untuk memberikan doa dan dukungan moral agar mereka tetap tegar dan tabah dalam menghadapi cobaan.</li>\n<!-- /wp:list-item --></ol>\n<!-- /wp:list -->\n\n<!-- wp:paragraph -->\n<p><strong>Meningkatkan Kepedulian Sosial</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Program LAZISNU Peduli dan Berbagi juga menjadi ajakan bagi seluruh masyarakat untuk lebih peduli dan berbagi dengan sesama, terutama kepada mereka yang sedang berduka. Dengan berbagi, kita dapat meringankan beban saudara-saudara kita yang tengah dilanda musibah. Keterlibatan masyarakat dalam program ini juga diharapkan dapat meningkatkan rasa solidaritas dan kepedulian sosial yang lebih luas.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Mengajak Semua Pihak untuk Berkontribusi</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU mengajak seluruh elemen masyarakat, baik individu, komunitas, maupun perusahaan, untuk turut berkontribusi dalam program ini. Setiap donasi dan bantuan yang diberikan akan sangat berarti bagi keluarga yang sedang berduka. LAZISNU memastikan bahwa setiap bantuan yang disalurkan akan sampai tepat sasaran dan dikelola dengan transparan dan akuntabel.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p><strong>Penutup</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Kepedulian kita kepada sesama, terutama kepada mereka yang sedang berduka, merupakan cerminan dari rasa kemanusiaan yang mendalam. Melalui program LAZISNU Peduli dan Berbagi, LAZISNU berkomitmen untuk selalu hadir di tengah-tengah masyarakat, memberikan bantuan, dan menjadi pelita di saat-saat yang paling gelap. Bersama LAZISNU, mari kita ulurkan tangan, berbagi kasih, dan meringankan beban keluarga yang ditinggalkan. Setiap uluran tangan Anda akan sangat berarti untuk mereka.</p>\n<!-- /wp:paragraph -->', 'LAZISNU Peduli dan Berbagi: Kepedulian kepada Keluarga yang Ditinggal Meninggal Dunia', '', 'inherit', 'closed', 'closed', '', '77-revision-v1', '', '', '2024-10-01 23:42:29', '2024-10-02 06:42:29', '', 77, 'http://localhost/lazisnukemangsen/?p=78', 0, 'revision', '', 0),
(79, 1, '2024-10-02 02:25:24', '2024-10-02 09:25:24', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'New Post', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2024-10-02 02:25:24', '2024-10-02 09:25:24', '', 1, 'http://localhost/lazisnukemangsen/?p=79', 0, 'revision', '', 0),
(80, 1, '2024-10-02 02:28:23', '2024-10-02 09:28:23', '', 'DSC00364', '', 'inherit', 'open', 'closed', '', 'dsc00364', '', '', '2024-10-02 02:28:23', '2024-10-02 09:28:23', '', 1, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00364.jpg', 0, 'attachment', 'image/jpeg', 0),
(82, 1, '2024-10-02 02:31:00', '2024-10-02 09:31:00', '<!-- wp:paragraph -->\n<p>Kemangsen, 2 Oktober 2024 – Dalam upaya meringankan beban masyarakat yang terdampak oleh situasi ekonomi yang sulit, Lembaga Amil Zakat, Infaq, dan Shodaqoh Nahdlatul Ulama (LAZISNU) Kemangsen kembali menyalurkan bantuan sembako kepada keluarga-keluarga kurang mampu di wilayah Desa Kemangsen, Kecamatan Balongbendo.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Kegiatan yang dilaksanakan pada [tanggal kegiatan] ini dihadiri oleh pengurus LAZISNU Kemangsen, tokoh masyarakat, serta relawan yang turut berpartisipasi dalam pendistribusian bantuan. Sebanyak [jumlah paket] paket sembako telah disalurkan kepada warga yang sebelumnya telah terdata melalui survei dan koordinasi dengan pihak RT dan RW setempat.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Ketua LAZISNU Kemangsen, [nama ketua], menyampaikan bahwa kegiatan ini merupakan salah satu bentuk kepedulian terhadap masyarakat, terutama di masa sulit seperti sekarang ini. \"Kami berharap bantuan ini bisa sedikit meringankan beban mereka yang membutuhkan, serta menjadi bentuk kepedulian bersama untuk saling membantu dan berbagi rezeki,” ujarnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Isi paket sembako yang dibagikan mencakup beras, minyak goreng, gula, mie instan, dan kebutuhan pokok lainnya yang diharapkan dapat membantu mencukupi kebutuhan sehari-hari para penerima manfaat selama beberapa hari ke depan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Salah satu penerima bantuan, [nama penerima, jika diperbolehkan], mengucapkan terima kasih atas kepedulian LAZISNU Kemangsen. “Bantuan ini sangat berarti bagi kami, terutama dalam menghadapi kebutuhan hidup sehari-hari. Semoga LAZISNU dan para donatur mendapatkan balasan kebaikan dari Allah SWT,” ungkapnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Selain kegiatan pembagian sembako, LAZISNU Kemangsen juga mengajak masyarakat yang memiliki rezeki lebih untuk turut berdonasi dan berpartisipasi dalam program-program sosial yang dijalankan. “Donasi dari masyarakat sangat membantu keberlanjutan program-program ini, dan kami akan terus berupaya untuk menjadi jembatan kebaikan bagi mereka yang membutuhkan,” tambah [nama ketua].</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU Kemangsen terus berkomitmen untuk hadir di tengah masyarakat melalui berbagai program sosial yang bermanfaat. Diharapkan, kegiatan ini bisa menjadi inspirasi bagi semua pihak untuk lebih peduli dan saling membantu sesama.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Untuk informasi lebih lanjut tentang program dan cara berdonasi, silakan kunjungi laman resmi kami atau hubungi Tim Donasi LAZISNU Kemangsen.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Bantuan Sembako Untuk Keluarga Kurang Mampu', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2024-10-02 02:31:00', '2024-10-02 09:31:00', '', 1, 'http://localhost/lazisnukemangsen/?p=82', 0, 'revision', '', 0),
(84, 1, '2024-10-04 03:29:56', '2024-10-04 10:29:56', '', 'DSC00267', '', 'inherit', 'open', 'closed', '', 'dsc00267', '', '', '2024-10-04 03:29:56', '2024-10-04 10:29:56', '', 63, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00267.jpg', 0, 'attachment', 'image/jpeg', 0),
(85, 1, '2024-10-04 03:30:44', '2024-10-04 10:30:44', '<!-- wp:paragraph -->\n<p><strong>Kegiatan Rutin Santunan Anak Yatim di Balongbendo</strong></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Balongbendo, Sidoarjo — Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama (LAZISNU) MWC NU Balongbendo bersama dengan NU Care Ranting Kemangsen menggelar kegiatan santunan anak yatim yang berlangsung rutin setiap bulan. Kegiatan ini bertujuan untuk memberikan dukungan moril dan materiil kepada anak-anak yatim di wilayah Kemangsen dan sekitarnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Acara yang dilaksanakan di aula MWC NU Balongbendo pada hari Minggu, disambut antusias oleh masyarakat sekitar. Dalam acara ini, sebanyak puluhan anak yatim dari berbagai usia berkumpul dan menerima santunan berupa bantuan uang tunai dan paket sembako. Selain itu, mereka juga diajak untuk mengikuti berbagai kegiatan positif yang dirancang untuk menumbuhkan rasa kebersamaan dan saling peduli.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {\"linkTo\":\"none\"} -->\n<figure class=\"wp-block-gallery has-nested-images columns-default is-cropped\"><!-- wp:image {\"id\":84,\"sizeSlug\":\"medium\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-medium\"><img src=\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00267-300x199.jpg\" alt=\"\" class=\"wp-image-84\"/></figure>\n<!-- /wp:image --></figure>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Kegiatan ini dimulai dengan pembukaan yang dipimpin oleh ketua panitia acara, dilanjutkan dengan sambutan dari pengurus MWC NU Balongbendo. Dalam sambutannya, beliau menekankan pentingnya kepedulian terhadap anak-anak yatim sebagai bagian dari tanggung jawab sosial dan keagamaan. \"Anak-anak yatim adalah tanggung jawab kita bersama. Dengan santunan ini, kita berharap dapat meringankan beban mereka dan memberikan kebahagiaan serta harapan untuk masa depan yang lebih baik,\" ujarnya.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Selama acara berlangsung, suasana penuh keakraban terasa, di mana para anak yatim dan hadirin bersama-sama menikmati hiburan yang disajikan oleh para relawan. Acara ditutup dengan pembagian santunan secara simbolis oleh para pengurus dan donatur yang hadir.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Kegiatan santunan anak yatim ini tidak hanya memberikan bantuan materi, tetapi juga menjadi sarana untuk mempererat silaturahmi antarwarga dan memupuk rasa solidaritas sosial. LAZISNU MWC NU Balongbendo berharap kegiatan seperti ini dapat terus berjalan dan lebih banyak lagi masyarakat yang tergerak untuk berpartisipasi dan berbagi rezeki kepada mereka yang membutuhkan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {\"align\":\"left\"} -->\n<p class=\"has-text-align-left\">Dengan adanya kegiatan ini, diharapkan dapat menjadi inspirasi bagi berbagai pihak untuk senantiasa peduli terhadap sesama, terutama mereka yang kurang beruntung. Mari kita terus bersama-sama menebar kebaikan dan membantu sesama, demi terciptanya masyarakat yang lebih harmonis dan sejahtera.</p>\n<!-- /wp:paragraph -->', 'Santunan Anak Yatim', '', 'inherit', 'closed', 'closed', '', '63-revision-v1', '', '', '2024-10-04 03:30:44', '2024-10-04 10:30:44', '', 63, 'http://localhost/lazisnukemangsen/?p=85', 0, 'revision', '', 0),
(86, 1, '2024-10-04 03:33:29', '2024-10-04 10:33:29', '', 'DSC00282', '', 'inherit', 'open', 'closed', '', 'dsc00282', '', '', '2024-10-04 03:33:29', '2024-10-04 10:33:29', '', 59, 'http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00282.jpg', 0, 'attachment', 'image/jpeg', 0),
(88, 1, '2024-10-04 03:33:54', '2024-10-04 10:33:54', '<!-- wp:paragraph -->\n<p>LAZISNU (Lembaga Amil Zakat, Infaq, dan Shadaqah Nahdlatul Ulama) didirikan oleh Nahdlatul Ulama (NU) sebagai bagian dari upaya organisasi tersebut untuk mengelola zakat, infaq, dan sedekah secara lebih terstruktur, profesional, dan transparan. Berikut adalah beberapa poin penting mengenai sejarah awal berdirinya LAZISNU:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">1. <strong>Latar Belakang</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Nahdlatul Ulama, sebagai organisasi Islam terbesar di Indonesia, memiliki komitmen kuat untuk meningkatkan kesejahteraan umat melalui pengelolaan dana sosial keagamaan seperti zakat, infaq, dan sedekah. Sebelum terbentuknya LAZISNU, berbagai upaya pengumpulan dan pendistribusian zakat dan sedekah dilakukan secara sporadis dan tidak terpusat, sehingga dampaknya kurang maksimal.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">2. <strong>Pembentukan dan Legalitas</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU secara resmi dibentuk pada tahun 2004, berdasarkan kebutuhan untuk menyatukan dan mengelola dana-dana sosial tersebut dengan lebih efektif. Pendirian ini juga didasari oleh dorongan dari UU No. 38 Tahun 1999 tentang Pengelolaan Zakat, yang mengatur bahwa pengelolaan zakat dapat dilakukan oleh lembaga resmi yang diakui pemerintah. Pada tahun 2016, status hukum LAZISNU diperkuat dengan SK Kemenag RI No. 118 Tahun 2016 sebagai Lembaga Amil Zakat Nasional.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">3. <strong>Tujuan Pembentukan</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Tujuan utama pembentukan LAZISNU adalah untuk:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul class=\"wp-block-list\"><!-- wp:list-item -->\n<li>Mengoptimalkan pengumpulan, pengelolaan, dan pendistribusian zakat, infaq, dan sedekah secara terpusat dan akuntabel.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Meningkatkan kesejahteraan masyarakat, terutama di kalangan umat Islam, melalui program-program yang terstruktur.</li>\n<!-- /wp:list-item -->\n\n<!-- wp:list-item -->\n<li>Memanfaatkan potensi zakat, infaq, dan sedekah sebagai salah satu instrumen ekonomi umat untuk mengurangi kemiskinan dan ketimpangan sosial.</li>\n<!-- /wp:list-item --></ul>\n<!-- /wp:list -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">4. <strong>Perkembangan Organisasi</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Setelah pembentukannya, LAZISNU mulai berkembang pesat dan memiliki cabang-cabang di berbagai wilayah di Indonesia. Kegiatan dan program-programnya terus berkembang, mencakup berbagai sektor seperti pendidikan, kesehatan, pemberdayaan ekonomi, dan bantuan kemanusiaan. LAZISNU juga berupaya meningkatkan kapasitas pengelolaan zakat dengan memperbaiki sistem teknologi informasi, pelatihan SDM, dan jaringan distribusi yang lebih luas.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading {\"level\":3} -->\n<h3 class=\"wp-block-heading\">5. <strong>Peran dan Pengaruh</strong></h3>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>LAZISNU telah berperan signifikan dalam membantu masyarakat, khususnya yang berada di bawah garis kemiskinan. Dengan jaringan NU yang luas dan dukungan dari berbagai pihak, LAZISNU terus menjadi salah satu lembaga pengelola zakat yang terpercaya dan diandalkan di Indonesia.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Seiring waktu, LAZISNU bertransformasi menjadi lembaga yang tidak hanya mengelola zakat, tetapi juga berbagai dana sosial lainnya, serta menjalankan berbagai program pemberdayaan yang berkelanjutan.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {\"id\":86,\"sizeSlug\":\"large\",\"linkDestination\":\"none\"} -->\n<figure class=\"wp-block-image size-large\"><img src=\"http://localhost/lazisnukemangsen/wp-content/uploads/2024/09/DSC00282-1024x680.jpg\" alt=\"\" class=\"wp-image-86\"/></figure>\n<!-- /wp:image -->', 'Sejarah Berdirinya LAZISNU', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2024-10-04 03:33:54', '2024-10-04 10:33:54', '', 59, 'http://localhost/lazisnukemangsen/?p=88', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'twentytwentyfour', 'twentytwentyfour', 0),
(3, 'centralnews', 'centralnews', 0),
(4, 'Artikel', 'artikel', 0),
(5, 'Organisasi', 'organisasi', 0),
(6, 'Santunan', 'santunan', 0),
(7, 'Kegiatan', 'kegiatan', 0),
(8, 'Pendidikan', 'pendidikan', 0),
(9, 'Kesehatan', 'kesehatan', 0),
(10, 'Ekonomi', 'ekonomi', 0),
(11, 'Keagamaan', 'keagamaan', 0),
(12, 'Sosial', 'sosial', 0),
(13, 'santunan', 'santunan', 0),
(14, 'pendidikan', 'pendidikan', 0),
(15, 'keagamaan', 'keagamaan', 0),
(16, 'nu', 'nu', 0),
(17, 'anakyatim', 'anakyatim', 0),
(18, 'sosial', 'sosial', 0),
(19, 'Informasi', 'informasi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 4, 0),
(1, 6, 0),
(6, 2, 0),
(11, 3, 0),
(59, 5, 0),
(59, 19, 0),
(63, 4, 0),
(63, 6, 0),
(77, 4, 0),
(77, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0),
(2, 2, 'wp_theme', '', 0, 1),
(3, 3, 'wp_theme', '', 0, 1),
(4, 4, 'category', '', 0, 3),
(5, 5, 'category', '', 0, 1),
(6, 6, 'category', '', 4, 3),
(7, 7, 'category', '', 4, 0),
(8, 8, 'category', '', 5, 0),
(9, 9, 'category', '', 5, 0),
(10, 10, 'category', '', 5, 0),
(11, 11, 'category', '', 5, 0),
(12, 12, 'category', '', 5, 0),
(13, 13, 'post_tag', '', 0, 0),
(14, 14, 'post_tag', '', 0, 0),
(15, 15, 'post_tag', '', 0, 0),
(16, 16, 'post_tag', '', 0, 0),
(17, 17, 'post_tag', '', 0, 0),
(18, 18, 'post_tag', '', 0, 0),
(19, 19, 'category', '', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:5:{s:64:\"1bdc64350b00630743af064e7217926322dbf29097781aeed9fd70f47c073a8d\";a:4:{s:10:\"expiration\";i:1728472736;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36\";s:5:\"login\";i:1727263136;}s:64:\"99649aaee26bda83428e504c96d333a495c7f7050fac3f195055a44f2ebeae23\";a:4:{s:10:\"expiration\";i:1727439410;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36\";s:5:\"login\";i:1727266610;}s:64:\"827b3640651eb75f79d9fec9175f5f66513fdd32e6d6d580c0f2b9332c686863\";a:4:{s:10:\"expiration\";i:1728476242;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36\";s:5:\"login\";i:1727266642;}s:64:\"405c953e04fa30f55de8f26fc461e7af08a7466888b2219b0042bdd19767f35b\";a:4:{s:10:\"expiration\";i:1727439526;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36\";s:5:\"login\";i:1727266726;}s:64:\"24e511c88f093b958e21ea832df100c3c0d877c857bac8eff755a56a53c9d5a9\";a:4:{s:10:\"expiration\";i:1728528827;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36\";s:5:\"login\";i:1727319227;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '76'),
(18, 1, 'wp_persisted_preferences', 'a:5:{s:4:\"core\";a:3:{s:26:\"isComplementaryAreaVisible\";b:1;s:10:\"openPanels\";a:3:{i:0;s:11:\"post-status\";i:1;s:23:\"taxonomy-panel-category\";i:2;s:23:\"taxonomy-panel-post_tag\";}s:10:\"editorMode\";s:6:\"visual\";}s:14:\"core/edit-post\";a:1:{s:12:\"welcomeGuide\";b:0;}s:9:\"_modified\";s:24:\"2024-09-26T10:42:57.273Z\";s:22:\"core/customize-widgets\";a:1:{s:12:\"welcomeGuide\";b:0;}s:17:\"core/edit-widgets\";a:2:{s:26:\"isComplementaryAreaVisible\";b:1;s:12:\"welcomeGuide\";b:0;}}'),
(19, 1, 'wp_user-settings', 'libraryContent=browse'),
(20, 1, 'wp_user-settings-time', '1727267242'),
(21, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}'),
(22, 1, 'metaboxhidden_nav-menus', 'a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}'),
(23, 1, 'wp_media_library_mode', 'grid'),
(24, 1, 'closedpostboxes_page', 'a:1:{i:0;s:23:\"morenews-theme-settings\";}'),
(25, 1, 'metaboxhidden_page', 'a:0:{}'),
(26, 1, 'meta-box-order_page', 'a:3:{s:6:\"normal\";s:0:\"\";s:8:\"advanced\";s:23:\"morenews-theme-settings\";s:4:\"side\";s:0:\"\";}');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BdoXRlIGA/RTprZlKiAqLdlyNfcC/b.', 'admin', 'andiek.qtm2010@gmail.com', 'http://localhost/wordpress/wordpress', '2024-09-25 11:18:20', '', 0, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=628;

--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
