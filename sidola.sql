-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29 Nov 2017 pada 04.56
-- Versi Server: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sidola`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `id` int(11) NOT NULL,
  `user` varchar(16) NOT NULL,
  `email` varchar(32) NOT NULL,
  `tlp` varchar(16) NOT NULL,
  `pass` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`id`, `user`, `email`, `tlp`, `pass`) VALUES
(2, 'fuwa', 'fuwa@fuwa.com', '', 'fuwa123'),
(3, 'jkakjf', '22a@fuwa.com', '12739123', 'fuwa123');

-- --------------------------------------------------------

--
-- Struktur dari tabel `beli`
--

CREATE TABLE `beli` (
  `ID` int(11) NOT NULL,
  `ID_form` int(11) NOT NULL,
  `garansi` date NOT NULL,
  `status` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `form`
--

CREATE TABLE `form` (
  `ID` int(11) NOT NULL,
  `ID_barang` varchar(16) NOT NULL,
  `ID_user` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(32) NOT NULL,
  `tgl_msk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tgl_klr` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `form`
--

INSERT INTO `form` (`ID`, `ID_barang`, `ID_user`, `qty`, `harga`, `tgl_msk`, `tgl_klr`, `status`) VALUES
(3, 'acr-1', 2, 12, 450000, '2017-11-28 13:43:01', '2017-11-28 13:43:01', 'harga'),
(4, 'acr-1', 3, 32, 10401000, '2017-11-29 03:48:24', '2017-11-29 03:48:24', 'harga');

-- --------------------------------------------------------

--
-- Struktur dari tabel `katalog`
--

CREATE TABLE `katalog` (
  `id` varchar(6) NOT NULL,
  `jenis` varchar(16) NOT NULL,
  `merk` varchar(16) NOT NULL,
  `tipe` varchar(32) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `katalog`
--

INSERT INTO `katalog` (`id`, `jenis`, `merk`, `tipe`, `deskripsi`, `gambar`) VALUES
('acr-1', 'Laptop', 'Acer', 'TravelMate 6293-872G32Mn', 'Intel® Centrino® 2 processor technology, featuring: Intel® Core2 Duo processor P8700 (3 MB L2 cache, 2.53 GHz, 1066 MHz FSB, 25 W); Mobile Intel® GM45 Express Chipset; Intel® Wireless WiFi Link 802.11a/b/g/Draft-N) Wi-Fi CERTIFIED® network connection, featuring MIMO technology; Genuine Windows 7 Professional (32bit); 12.1\" WXGA TFT LCD Display with LED Backlight; Integrated 3G Modem Module, UMTS/HSPA at 850/1900/2100 MHz and quad-band GSM/GPRS/EDGE (850/900/1800/1900 MHz); 2GB DDR3 ; 320GB HDD with DASP (Disk Anti Shock Protection) Technology; DVD SuperMulti Double Layer Drive ; Integrated Bluetooth 2.1 + EDR; Crystal Eye webcam with Acer PrimaLite technology; Acer Bio-Protection fingerprint solution; TravelMate TPM (Trusted Platform Module) solution; Microsoft® Office Ready 2007 (60 Days)', ''),
('acr-2', 'Laptop', 'Acer', 'AS3810T-354G50n', 'Linux Operating System; Intel® Centrino® processor technology, featuring: Intel® Core®2 Solo processor SU3500 (3 MB L2 cache, 1.40 GHz, 800 MHz FSB, 5.50 W), supporting Intel® 64 architecture; Mobile Intel® GS45 Express Chipset; Intel® Wireless WiFi Link 802.11a/b/g/Draft-N; 13.3\" HD Acer CineCrystal LED-backlit TFT LCD; 16:9 aspect ratio; 4GB DDR3; 500GB HDD; Integrated Bluetooth; 5-in-1 Media Reader; HDMI port with HDCP support; Crystal Eye webcam with Acer PrimaLite technology; Dolby Sound Room®; 8+ hour battery life*\r\n*  Battery life indicated is with Acer PowerSmart Manager enabled & may vary depending on product specifications', ''),
('lnv-1', 'Laptop', 'Lenovo', 'Thinkpad X100e', 'AMD Athlon MV40; 11,6\" HD 1366 x 768 AntiGlare; 320 GB HDD 5400rpm; 2 GB PC3-5300 667MHz DDR2; ATI Radeon HD 3200 graphics; Realtek 802.11 bgn 1 x 2 (Wireless LAN); Trackpoint, Touchpad; Bluetooth, Camera, 4 in 1 Card Reader; No WWAN, USB Power, Windows 7 Professional 32; 6 cell 2.6 Ah/Up to 5hours; One Year Warranty part and labour; INCLUDED with Multiburner', ''),
('lnv-2', 'Laptop', 'Lenovo', 'ThinkPad T400s', 'Intel® Core 2 Duo Processor SP9600 (2.53 GHz, 6MB L2, 1066 MHz FSB); 14.1 \" WXGA + LED; 250GB HDD 5400rpm, 2GB PC3-8500 DDR3 1066MHz (up to 8GB); Intel Graphics Media Accelerator 4500MHD; Intel Wireless Wi-Fi Link 5100 (AGN), Bluetooth; Gigabit Ethernet, Fingerprint Reader, Camera, Trackpoint; DVD Recordable; 6 cell Li-Ion/Up to 5hours; Windows 7 Professional, Three years parts and labour', ''),
('lnv-3', 'Laptop', 'Lenovo', 'ThinkPad X301', 'Intel SU9400 (1.4GHz, 800MHz, 3MB); 13.3\" 1440 x 900; 2GB PC3-8500 1066MHz DDR3; 64 Solid State Drive; Intel 4500 MHD; Intel Wireless Wi-Fi Link 5100 (AGN); Bluetooth, Ultranav, Secure Chip; Finger Print, Camera, DVD Recordable; Win Vista Business, Three years parts and labour; FREE UPGRADE TO WINDOWS 7 PROFESSIONAL', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beli`
--
ALTER TABLE `beli`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_form` (`ID_form`);

--
-- Indexes for table `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_barang` (`ID_barang`),
  ADD KEY `fk_akun` (`ID_user`);

--
-- Indexes for table `katalog`
--
ALTER TABLE `katalog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `beli`
--
ALTER TABLE `beli`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `form`
--
ALTER TABLE `form`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `beli`
--
ALTER TABLE `beli`
  ADD CONSTRAINT `fk_form` FOREIGN KEY (`ID_form`) REFERENCES `form` (`ID`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `form`
--
ALTER TABLE `form`
  ADD CONSTRAINT `fk_akun` FOREIGN KEY (`ID_user`) REFERENCES `akun` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_barang` FOREIGN KEY (`ID_barang`) REFERENCES `katalog` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
