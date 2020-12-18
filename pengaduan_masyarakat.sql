-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2020 at 08:07 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_masyarakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(3, 'Umum'),
(4, 'Kemahasiswaan'),
(5, 'Keuangan');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `level` enum('masyarakat','petugas','admin') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`id_login`, `email`, `password`, `level`) VALUES
(1, 'admin@gmail.com', '$2y$10$fxaQOxPocYskneYwzuPZH.M5iH/imvW8F0T8uMMTwPR0GneAE0woS', 'admin'),
(2, 'petugas1@gmail.com', '$2y$12$XVBLpgeldkwU3uqPrXv7kOASu/QXSyS/PxMpEBD6KU2bMR5wRWoNu', 'petugas'),
(4, 'achmad@gmail.com', '$2y$12$XVBLpgeldkwU3uqPrXv7kOASu/QXSyS/PxMpEBD6KU2bMR5wRWoNu', 'masyarakat'),
(8, 'dadan@gmail.com', '$2y$10$gj8GLpyVJpaAGpq5.qPi7OO/YWorSPEVoMRBCiGu4sG1soDgmdqPW', 'masyarakat'),
(13, 'arif@gmail.com', '$2y$10$90iP45e5CZz4s45ftBBPFe./wTsyyjeou4xPAeYuSJ.WZOGDska86', 'masyarakat'),
(14, 'arifwp@gmail.com', '$2y$10$cmh0NII68135eeBcfrSY1e.Gdc9FpbcVMJs8rWsp1nO0owtG9mEqi', 'petugas'),
(15, 'masyarakat@gmail.com', '$2y$10$1Kq8J3iG0Gid3re1nwKBYuLHTifDuUxwWcsfSkfU4NCotLbjjEonK', 'masyarakat'),
(16, 'petugas@gmail.com', '$2y$10$g1FxTY55KLuX2thfsErJnOtRMzv0LGE79673cBmw9J5UNHSyaxHZi', 'petugas');

-- --------------------------------------------------------

--
-- Table structure for table `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` varchar(16) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `telp` varbinary(13) DEFAULT NULL,
  `id_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `telp`, `id_login`) VALUES
('12345', 'masyarakat', 0x313233, 15);

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `nik` varchar(16) DEFAULT NULL,
  `tanggal_pengaduan` date DEFAULT NULL,
  `isi_pengaduan` text,
  `file` varchar(50) DEFAULT NULL,
  `status` enum('pending','proses','approved','selesai') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `id_kategori`, `nik`, `tanggal_pengaduan`, `isi_pengaduan`, `file`, `status`) VALUES
(8, 2, '1234567891234567', '2020-03-29', 'qwerty', '1585482025.png', 'selesai'),
(9, 2, '123456789', '2020-03-29', 'kebijakan publik', '1585494239.PNG', 'approved'),
(10, 2, '123', '2020-12-17', 'ini pengaduan', '1608205566.png', 'selesai'),
(11, 2, '123', '2020-12-05', 'qwerqerqqer', '1608209213.png', 'selesai'),
(12, 2, '123', '2020-12-14', 'asdf', '1608270764.png', 'proses'),
(13, 3, '12345', '2020-12-11', 'Isi pengaduan', '1608272306.png', 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(50) DEFAULT NULL,
  `telp` varchar(13) DEFAULT NULL,
  `id_login` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `telp`, `id_login`) VALUES
(6, 'petugas', '123', 16);

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int(11) NOT NULL,
  `id_pengaduan` int(11) DEFAULT NULL,
  `id_petugas` int(11) DEFAULT NULL,
  `tanggal_tanggapan` date DEFAULT NULL,
  `isi_tanggapan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `id_petugas`, `tanggal_tanggapan`, `isi_tanggapan`) VALUES
(1, 8, 2, '2020-03-30', 'ok'),
(2, 9, 2, NULL, NULL),
(3, 10, 5, '2020-12-17', 'blablablabla'),
(4, 11, 5, '2020-12-18', 'ini tanggapan saya'),
(5, 12, 5, NULL, NULL),
(6, 13, 6, '2020-12-18', 'Tanggapan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
