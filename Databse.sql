-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2021 at 02:30 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `nomor_hp` varchar(13) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`nomor_hp`, `nama`, `alamat`, `username`) VALUES
('012098892983', 'admin', 'Jember', 'admin'),
('123456789019', 'toriq', 'Ponorogo', 'toriq');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_cuci`
--

CREATE TABLE `jenis_cuci` (
  `id_jenis` varchar(3) NOT NULL,
  `pilihan_cuci` varchar(30) NOT NULL,
  `harga_cuci` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_cuci`
--

INSERT INTO `jenis_cuci` (`id_jenis`, `pilihan_cuci`, `harga_cuci`) VALUES
('jp1', 'Cuci Kering', 3000),
('jp2', 'Cuci Setrika', 5000),
('jp3', 'Setrika Saja', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `nomor_hp` varchar(13) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`nomor_hp`, `nama`, `alamat`, `username`) VALUES
('098123890321', 'bug', 'bug', 'bug'),
('123456789012', 'Fira Dwi', 'Bondowoso', 'fira');

-- --------------------------------------------------------

--
-- Table structure for table `paket`
--

CREATE TABLE `paket` (
  `id_paket` varchar(3) NOT NULL,
  `nama_paket` varchar(15) NOT NULL,
  `kelipatan_harga` double NOT NULL,
  `durasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `paket`
--

INSERT INTO `paket` (`id_paket`, `nama_paket`, `kelipatan_harga`, `durasi`) VALUES
('p01', 'Biasa', 1, 3),
('p02', 'Express', 1.5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `nama_pelanggan` varchar(50) NOT NULL,
  `alamat_pelanggan` varchar(100) NOT NULL,
  `nomor_hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`nama_pelanggan`, `alamat_pelanggan`, `nomor_hp`) VALUES
('Dana', 'Tanggul', '081330374369'),
('Dwi', 'Sumatra', '123412341234'),
('Fira', 'Bdws', '12345678901'),
('Haris', 'Jember', '123456789781'),
('toriq', 'hoho', '081081081081');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL DEFAULT current_timestamp(),
  `tanggal_selesai` date DEFAULT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `berat` double NOT NULL,
  `id_jenis` varchar(3) NOT NULL,
  `id_paket` varchar(3) NOT NULL,
  `harga_total` double NOT NULL,
  `status_bayar` varchar(15) NOT NULL DEFAULT 'Belum bayar',
  `status_laundry` varchar(15) NOT NULL DEFAULT 'Baru',
  `username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tanggal_masuk`, `tanggal_selesai`, `nama_pelanggan`, `berat`, `id_jenis`, `id_paket`, `harga_total`, `status_bayar`, `status_laundry`, `username`) VALUES
(43, '2020-12-17', NULL, 'Dana', 7, 'jp1', 'p01', 21000, 'Lunas', 'Selesai', ''),
(51, '2020-12-17', NULL, 'toriq', 3, 'jp1', 'p01', 9000, 'Lunas', 'Selesai', ''),
(52, '2020-12-17', NULL, 'toriq', 4, 'jp1', 'p01', 12000, 'Lunas', 'Baru', ''),
(53, '2021-01-21', NULL, 'toriq', 10, 'jp1', 'p01', 30000, 'Lunas', 'Selesai', ''),
(56, '2021-01-23', NULL, 'Fira', 12, 'jp1', 'p01', 36000, 'Belum bayar', 'Selesai', ''),
(57, '2021-01-23', '2021-01-26', 'toriq', 3, 'jp1', 'p01', 9000, 'Belum bayar', 'Baru', ''),
(58, '2021-01-23', '2021-01-26', 'Dwi', 7, 'jp2', 'p01', 35000, 'Lunas', 'Baru', ''),
(59, '2021-01-23', '2021-01-24', 'Dwi', 5, 'jp1', 'p02', 22500, 'Belum bayar', 'Selesai', ''),
(60, '2021-01-23', '2021-01-26', 'Haris', 7, 'jp1', 'p01', 21000, 'Belum bayar', 'Baru', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(16) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `level`) VALUES
('admin', 'admin', 0),
('bug', 'bug', 1),
('fira', 'fira', 1),
('toriq', 'toriq', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `jenis_cuci`
--
ALTER TABLE `jenis_cuci`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `paket`
--
ALTER TABLE `paket`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`nama_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_paket` (`id_paket`),
  ADD KEY `nomor_hp` (`nama_pelanggan`),
  ADD KEY `id_jenis` (`id_jenis`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_paket`) REFERENCES `paket` (`id_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_jenis`) REFERENCES `jenis_cuci` (`id_jenis`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`nama_pelanggan`) REFERENCES `pelanggan` (`nama_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
