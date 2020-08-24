-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Agu 2020 pada 11.59
-- Versi server: 10.4.8-MariaDB
-- Versi PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pevita`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `desa_kelurahan`
--

CREATE TABLE `desa_kelurahan` (
  `id` varchar(10) NOT NULL,
  `nama_desa_kelurahan` varchar(225) NOT NULL,
  `kecamatan_id` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hobi`
--

CREATE TABLE `hobi` (
  `id` int(11) NOT NULL,
  `nama_hobi` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `hobi_pelanggan`
--

CREATE TABLE `hobi_pelanggan` (
  `id` int(11) NOT NULL,
  `pelanggan_id` int(11) NOT NULL,
  `hobi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kecamatan`
--

CREATE TABLE `kecamatan` (
  `kota_kabupaten_id` varchar(4) NOT NULL,
  `nama_kecamatan` varchar(225) NOT NULL,
  `id` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kodepos`
--

CREATE TABLE `kodepos` (
  `id` varchar(5) NOT NULL,
  `desa_kelurahan_id` varchar(10) NOT NULL,
  `kodepos` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kota_kabupaten`
--

CREATE TABLE `kota_kabupaten` (
  `nama_kota_kabupaten` varchar(225) NOT NULL,
  `id` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media_social`
--

CREATE TABLE `media_social` (
  `id` int(11) NOT NULL,
  `nama_media_social` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `media_social_pelanggan`
--

CREATE TABLE `media_social_pelanggan` (
  `id` int(11) NOT NULL,
  `pelanggan_id` int(11) NOT NULL,
  `media_social_id` int(11) NOT NULL,
  `username` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pekerjaan`
--

CREATE TABLE `pekerjaan` (
  `id` int(11) NOT NULL,
  `nama_pekerjaan` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id` int(11) NOT NULL,
  `no_indihome` varchar(16) NOT NULL,
  `no_telepon` varchar(16) NOT NULL,
  `nama_lengkap` varchar(125) NOT NULL,
  `kota_kabupaten_id` varchar(4) NOT NULL,
  `kecamatan_id` varchar(7) NOT NULL,
  `desa_kelurahan_id` varchar(10) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `kodepos_id` varchar(5) NOT NULL,
  `no_handphone` varchar(16) NOT NULL,
  `email` varchar(125) NOT NULL,
  `pekerjaan_id` int(11) NOT NULL,
  `kartu_tanda_penduduk` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `token`
--

CREATE TABLE `token` (
  `pelanggan_id` int(11) NOT NULL,
  `kode` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `desa_kelurahan`
--
ALTER TABLE `desa_kelurahan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kecamatan_id` (`kecamatan_id`);

--
-- Indeks untuk tabel `hobi`
--
ALTER TABLE `hobi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `hobi_pelanggan`
--
ALTER TABLE `hobi_pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_id` (`pelanggan_id`),
  ADD KEY `hobi_id` (`hobi_id`);

--
-- Indeks untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kota_kabupaten_id` (`kota_kabupaten_id`);

--
-- Indeks untuk tabel `kodepos`
--
ALTER TABLE `kodepos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `desa_kelurahan_id` (`desa_kelurahan_id`);

--
-- Indeks untuk tabel `kota_kabupaten`
--
ALTER TABLE `kota_kabupaten`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `media_social`
--
ALTER TABLE `media_social`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `media_social_pelanggan`
--
ALTER TABLE `media_social_pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_id` (`pelanggan_id`),
  ADD KEY `media_social_id` (`media_social_id`);

--
-- Indeks untuk tabel `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelanggan_ibfk_1` (`kota_kabupaten_id`),
  ADD KEY `pelanggan_ibfk_2` (`desa_kelurahan_id`),
  ADD KEY `pelanggan_ibfk_3` (`kecamatan_id`),
  ADD KEY `pelanggan_ibfk_4` (`kodepos_id`),
  ADD KEY `pelanggan_ibfk_5` (`pekerjaan_id`);

--
-- Indeks untuk tabel `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`pelanggan_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `hobi`
--
ALTER TABLE `hobi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `hobi_pelanggan`
--
ALTER TABLE `hobi_pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media_social`
--
ALTER TABLE `media_social`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `media_social_pelanggan`
--
ALTER TABLE `media_social_pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pekerjaan`
--
ALTER TABLE `pekerjaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `token`
--
ALTER TABLE `token`
  MODIFY `pelanggan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `desa_kelurahan`
--
ALTER TABLE `desa_kelurahan`
  ADD CONSTRAINT `desa_kelurahan_ibfk_1` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`);

--
-- Ketidakleluasaan untuk tabel `hobi`
--
ALTER TABLE `hobi`
  ADD CONSTRAINT `hobi_ibfk_1` FOREIGN KEY (`id`) REFERENCES `hobi_pelanggan` (`hobi_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `hobi_pelanggan`
--
ALTER TABLE `hobi_pelanggan`
  ADD CONSTRAINT `hobi_pelanggan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`),
  ADD CONSTRAINT `hobi_pelanggan_ibfk_2` FOREIGN KEY (`hobi_id`) REFERENCES `hobi` (`Id`);

--
-- Ketidakleluasaan untuk tabel `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD CONSTRAINT `kecamatan_ibfk_1` FOREIGN KEY (`kota_kabupaten_id`) REFERENCES `kota_kabupaten` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kodepos`
--
ALTER TABLE `kodepos`
  ADD CONSTRAINT `kodepos_ibfk_1` FOREIGN KEY (`desa_kelurahan_id`) REFERENCES `desa_kelurahan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `media_social_pelanggan`
--
ALTER TABLE `media_social_pelanggan`
  ADD CONSTRAINT `media_social_pelanggan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`),
  ADD CONSTRAINT `media_social_pelanggan_ibfk_2` FOREIGN KEY (`media_social_id`) REFERENCES `media_social` (`id`);

--
-- Ketidakleluasaan untuk tabel `pekerjaan`
--
ALTER TABLE `pekerjaan`
  ADD CONSTRAINT `pekerjaan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `pelanggan` (`pekerjaan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`kota_kabupaten_id`) REFERENCES `kota_kabupaten` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pelanggan_ibfk_2` FOREIGN KEY (`desa_kelurahan_id`) REFERENCES `desa_kelurahan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pelanggan_ibfk_3` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pelanggan_ibfk_4` FOREIGN KEY (`kodepos_id`) REFERENCES `kodepos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pelanggan_ibfk_5` FOREIGN KEY (`pekerjaan_id`) REFERENCES `pekerjaan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `token_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
