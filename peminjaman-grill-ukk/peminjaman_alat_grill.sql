-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Apr 2026 pada 03.04
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peminjaman_alat_grill`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id_log` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `role_user` enum('Admin','Petugas','Peminjam','') NOT NULL,
  `activity` text NOT NULL,
  `reference_id` int(11) NOT NULL,
  `ip_addres` varchar(180) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `activity_logs`
--

INSERT INTO `activity_logs` (`id_log`, `id_user`, `role_user`, `activity`, `reference_id`, `ip_addres`, `created_at`) VALUES
(1, 2, 'Admin', 'Menambahkan alat baru: Carrier 60L', 0, '', '2026-04-01 01:02:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `alat`
--

CREATE TABLE `alat` (
  `id_alat` int(11) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `id_category` int(11) NOT NULL,
  `harga_alat` int(11) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `kondisi` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `status` enum('Tersedia','Dipinjam','','') NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `alat`
--

INSERT INTO `alat` (`id_alat`, `nama_alat`, `id_category`, `harga_alat`, `deskripsi`, `kondisi`, `stok`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pan Grill', 1, 20000, '', 'bagus', 3, 'Tersedia', '2026-03-31 02:06:16', '2026-04-01 00:16:58', '0000-00-00 00:00:00'),
(2, 'Gas Kaleng', 3, 6000, '', 'masih penuh', 10, 'Tersedia', '2026-03-31 02:11:26', '2026-03-31 02:11:26', '0000-00-00 00:00:00'),
(3, 'Kompor', 2, 15000, '', 'bagus', 10, 'Tersedia', '2026-03-31 02:12:03', '2026-03-31 02:12:03', '0000-00-00 00:00:00'),
(4, 'Capitan', 2, 2500, '', 'bersih', 13, 'Tersedia', '2026-03-31 02:12:34', '2026-03-31 02:12:34', '0000-00-00 00:00:00'),
(5, 'Pemanggang Arang', 1, 15000, '', 'bersih', 5, 'Tersedia', '2026-03-31 02:13:04', '2026-04-01 00:13:52', '0000-00-00 00:00:00'),
(6, 'Kuas', 2, 2500, '', 'bagus', 0, 'Tersedia', '2026-03-31 02:13:31', '2026-04-01 00:48:48', '0000-00-00 00:00:00'),
(7, 'Carrier 60L', 3, 2000, '', 'bagus', 10, 'Tersedia', '2026-04-01 01:02:47', '2026-04-01 01:02:47', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `nama_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `nama_category`) VALUES
(1, 'Grill Utama'),
(2, 'Peralatan Masak'),
(3, 'Bahan Bakar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_alat` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `durasi_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `tanggal_jatuh_tempo` int(11) NOT NULL,
  `status` enum('Menunggu','Disetujui','Ditolak','') NOT NULL,
  `keterangan_ditolak` text NOT NULL,
  `denda` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_user`, `id_alat`, `jumlah`, `durasi_pinjam`, `tanggal_pinjam`, `tanggal_kembali`, `tanggal_jatuh_tempo`, `status`, `keterangan_ditolak`, `denda`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 2, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 4, 3, 2, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 4, 2, 3, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 4, 4, 2, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 4, 6, 2, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 5, 6, 3, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 5, 1, 3, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 5, 5, 4, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 4, 5, 1, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 4, 4, 5, 3, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 5, 1, 3, 7, '2026-04-01', '0000-00-00', 2026, 'Ditolak', 'gatau', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 5, 4, 3, 3, '2026-04-01', '0000-00-00', 2026, 'Ditolak', 'gatau', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 4, 6, 3, 7, '2026-04-01', '2026-04-01', 2026, '', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `role_user` enum('Admin','Petugas','Peminjam') NOT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `foto_profile` varchar(1020) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `nama`, `role_user`, `password`, `no_hp`, `email`, `alamat`, `foto_profile`, `created_at`, `updated_at`) VALUES
(2, 'Kinanti Cahya Khaerunnisa', 'Admin', '$2y$10$m288O4SohoZtxrVN5L6vw.3rHu3PLPBAbc1ebZ64K96wr10gjzzGS', '085795176709', 'admin1@gmail.com', 'Cigugur Tengah', '', '2026-03-31 03:59:20', '2026-03-31 02:01:07'),
(3, 'Alescha', 'Petugas', '$2y$10$eiHS7Z4uYIEKqG5tarzFG.bjmRveJ753u4LcEP8kIXgWK0lagD2dS', '085795176700', 'ale@gmail.com', 'Parongpong', '', '2026-03-31 02:14:49', '2026-03-31 02:14:49'),
(4, 'Dea', 'Peminjam', '$2y$10$SH4iTvKSzE89Xid7yaf/cOdKhGC/5J37IcFnflqEXmg3dYUwehQtO', '089897676512', 'deaamel@gmail.com', 'Cipageran', '', '2026-04-01 00:07:58', '2026-04-01 00:07:58'),
(5, 'Keysha Kirana', 'Peminjam', '$2y$10$FW2QOICuMe3IrBe1oY7UceFvc7dqk2eValj.w.m5Tqeqj26TumGbG', '080907006456', 'key@gmail.com', 'Nanjung', '', '2026-04-01 00:18:10', '2026-04-01 00:18:10');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id_log`);

--
-- Indeks untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD PRIMARY KEY (`id_alat`),
  ADD KEY `id_category` (`id_category`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_alat` (`id_alat`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `alat`
--
ALTER TABLE `alat`
  MODIFY `id_alat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `alat_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_alat`) REFERENCES `alat` (`id_alat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
