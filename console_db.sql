-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jan 2022 pada 05.04
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `console_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `idcart` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `tglorder` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL DEFAULT 'Cart'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `cart`
--

INSERT INTO `cart` (`idcart`, `orderid`, `userid`, `tglorder`, `status`) VALUES
(14, '16D671r9fdZak', 4, '2021-12-29 07:16:55', 'Confirmed'),
(15, '16QcnjxefOTWE', 4, '2022-01-05 01:50:29', 'Payment');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailorder`
--

CREATE TABLE `detailorder` (
  `detailid` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `idproduk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detailorder`
--

INSERT INTO `detailorder` (`detailid`, `orderid`, `idproduk`, `qty`) VALUES
(16, '16D671r9fdZak', 1, 1),
(18, '16QcnjxefOTWE', 5, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(20) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`, `tgldibuat`) VALUES
(1, 'Rent a Console', '2019-12-20 07:28:34'),
(2, 'Buy a Console', '2019-12-20 07:34:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `konfirmasi`
--

CREATE TABLE `konfirmasi` (
  `idkonfirmasi` int(11) NOT NULL,
  `orderid` varchar(100) NOT NULL,
  `userid` int(11) NOT NULL,
  `payment` varchar(10) NOT NULL,
  `namarekening` varchar(25) NOT NULL,
  `tglbayar` date NOT NULL,
  `tglsubmit` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `konfirmasi`
--

INSERT INTO `konfirmasi` (`idkonfirmasi`, `orderid`, `userid`, `payment`, `namarekening`, `tglbayar`, `tglsubmit`) VALUES
(2, '16D671r9fdZak', 4, 'Bank BCA', 'Ahmad Nur Fauzy', '2022-01-05', '2022-01-05 01:29:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `userid` int(11) NOT NULL,
  `namalengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `notelp` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `tgljoin` timestamp NOT NULL DEFAULT current_timestamp(),
  `role` varchar(7) NOT NULL DEFAULT 'Member',
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`userid`, `namalengkap`, `email`, `password`, `notelp`, `alamat`, `tgljoin`, `role`, `lastlogin`) VALUES
(4, 'Ahmad Nur Fauzy', 'ahmadnurfauzy87@gmail.com', '$2y$10$XzmQmFvNBzDgemAWtfCurOHHGrj5kx.1F5Lqbz0JpsHu2VuXfbg/m', '085159604446', 'Griya Alam Sentosa B11/1, Cileungsi, Kabupaten Bogor.', '2021-12-29 07:14:52', 'Member', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `no` int(11) NOT NULL,
  `metode` varchar(25) NOT NULL,
  `norek` varchar(25) NOT NULL,
  `logo` text DEFAULT NULL,
  `an` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`no`, `metode`, `norek`, `logo`, `an`) VALUES
(1, 'Bank BCA', '13131231231', 'images/bca.jpg', 'Console Center'),
(2, 'Bank Mandiri', '943248844843', 'images/mandiri.jpg', 'Console Center'),
(3, 'DANA', '0882313132123', 'images/dana.png', 'Console Center');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `idproduk` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `namaproduk` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `deskripsi` varchar(1000) NOT NULL,
  `rate` int(11) NOT NULL,
  `hargabefore` int(11) NOT NULL,
  `hargaafter` int(11) NOT NULL,
  `tgldibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`idproduk`, `idkategori`, `namaproduk`, `gambar`, `deskripsi`, `rate`, `hargabefore`, `hargaafter`, `tgldibuat`) VALUES
(1, 1, 'Pixel Game Center', 'produk/rental1.jpg', 'Tarif Sewa: 12jam | 24jam | 3hari | 7hari\r\n•••\r\nPROMO !!*\r\nPS 3 50K 2 HARI !!\r\nPS 4 100K 2 HARI !!\r\nPS3 : 25K | 40K | 100K | 230K\r\nXBOX 360 : 25K | 40K | 100K | 230K\r\nPS4 : 70K | 90K | 210K | 550K\r\nPS', 5, 50000, 40000, '2021-12-29 00:00:26'),
(2, 1, 'Sewa Playstation Jogja', 'produk/rental2.jpeg', 'Ps4 : 12 jam -/45k\r\nPs4 : 24 jam -/65k\r\nPs4 + TV 32\" LED : 12 jam /65k\r\nPs4 + TV 32\" LED : 24 jam /100k', 4, 24000, 19500, '2019-12-20 09:24:13'),
(3, 1, 'Ocean Rental PS Jogja', 'produk/rental3.jpeg', 'PS 3\r\n12jam 25K\r\n24jam 35K\r\n\r\nPS 4 \r\n12 Jam 45k\r\n24 Jam 65k\r\n+ TV 12 Jam 70k\r\n+ TV 24 Jam 100k', 5, 40000, 35000, '2021-12-29 02:47:21'),
(4, 2, 'Playstation 5 - Digital Versio', 'produk/produk1.jpg', 'Yang didapat dalam box\r\n- 1x Console PS5\r\n- 1x USB type C (Charging Stik)\r\n- 1x Hdmi\r\n- 1x Stik\r\n- 1x Kabel Power\r\n- 1x Manual Book\r\n- 1x Wadah buat tidurin mesin PS5', 5, 12500000, 11900000, '2022-01-05 02:44:17'),
(5, 2, 'Playstation 4 Slim 1TB MegaPac', 'produk/produk2.jpg', '- 1 Stik Original Dual Shock 4\r\n- Game \"God of War ™\", \"Horizon Zero Dawn Complette Edition™\", \"Ghost of Tsushima\" Disc version\r\n- PlayStation Plus 3-month subscription x 1*\r\n- Headset ORI\r\n- Kabel HDMI\r\n- Kabel recharge stick\r\n- Kabel Power\r\n- Box n book', 5, 7500000, 7050000, '2022-01-05 02:44:17'),
(6, 2, 'Xbox Series X Console – 1 TB B', 'produk/produk3.jpg', 'Bundle Bonus Xbox FIFA 22\r\n\r\n12 Teraflops\r\nVariable Rate Shading\r\nHardware Accelerated DirectX Raytracing\r\nQuick Resume for Multiple Games\r\nSmart Delivery\r\nNative 4K, 8K Support, Up to 120 fps\r\nCustom AMD Zen 2 (8 Core)\r\nCustom AMD Radeon RNDA Navi\r\nNVMe SSD Drive\r\nSeries X Controller (Includes Share Button and hybrid D-Pad), Xbox One Controller Compatible\r\nInclude Auto Low Latency Mode (ALLM) and Dynamic Latency Input (DLI) that will make Xbox Series X the most responsive console ever\r\nNative 4K, 8K Support, Up to 120 fps\r\nCustom AMD Zen 2 (8 Core)\r\nCustom AMD Radeon RNDA Navi\r\nNVMe SSD Drive\r\nSeries X Controller (Includes Share Button and hybrid D-Pad), Xbox One Controller Compatible\r\nInclude Auto Low Latency Mode (ALLM) and Dynamic Latency Input (DLI) that will make Xbox Series X the most responsive console ever', 5, 12000000, 11650000, '2022-01-05 02:54:22');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`idcart`),
  ADD UNIQUE KEY `orderid` (`orderid`),
  ADD KEY `orderid_2` (`orderid`);

--
-- Indeks untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD PRIMARY KEY (`detailid`),
  ADD KEY `orderid` (`orderid`),
  ADD KEY `idproduk` (`idproduk`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`);

--
-- Indeks untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD PRIMARY KEY (`idkonfirmasi`),
  ADD KEY `userid` (`userid`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`no`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`idproduk`),
  ADD KEY `idkategori` (`idkategori`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `idcart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  MODIFY `detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  MODIFY `idkonfirmasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `idproduk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detailorder`
--
ALTER TABLE `detailorder`
  ADD CONSTRAINT `idproduk` FOREIGN KEY (`idproduk`) REFERENCES `produk` (`idproduk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderid` FOREIGN KEY (`orderid`) REFERENCES `cart` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `konfirmasi`
--
ALTER TABLE `konfirmasi`
  ADD CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `login` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `idkategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
