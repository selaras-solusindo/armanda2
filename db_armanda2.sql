-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 26, 2017 at 10:12 AM
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_armanda2`
--

-- --------------------------------------------------------

--
-- Table structure for table `audittrail`
--

CREATE TABLE IF NOT EXISTS `audittrail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `script` varchar(255) DEFAULT NULL,
  `user` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `table` varchar(255) DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `keyvalue` longtext,
  `oldvalue` longtext,
  `newvalue` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `audittrail`
--

INSERT INTO `audittrail` (`id`, `datetime`, `script`, `user`, `action`, `table`, `field`, `keyvalue`, `oldvalue`, `newvalue`) VALUES
(1, '2017-01-23 16:16:44', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(2, '2017-01-23 16:17:27', '/armanda2/logout.php', 'admin', 'logout', '::1', '', '', '', ''),
(3, '2017-01-23 16:19:38', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(4, '2017-01-23 16:19:49', '/armanda2/logout.php', 'admin', 'logout', '::1', '', '', '', ''),
(5, '2017-01-23 16:33:55', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(6, '2017-01-24 00:29:50', '/armanda2/logout.php', 'admin', 'logout', '::1', '', '', '', ''),
(7, '2017-01-24 00:29:52', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(8, '2017-01-24 11:06:37', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(9, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', '*** Batch insert begin ***', 't_invoice_fee', '', '', '', ''),
(10, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'fee_id', '3', '', '9'),
(11, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'harga', '3', '', '3000'),
(12, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'qty', '3', '', '4'),
(13, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'satuan', '3', '', 'sat.002.001'),
(14, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'jumlah', '3', '', '12000'),
(15, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'keterangan', '3', '', 'ket.002.001'),
(16, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'invoice_id', '3', '', '2'),
(17, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'invoice_detail_id', '3', '', '3'),
(18, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'fee_id', '4', '', '5'),
(19, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'harga', '4', '', '4500'),
(20, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'qty', '4', '', '5'),
(21, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'satuan', '4', '', 'sat.002.002'),
(22, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'jumlah', '4', '', '22500'),
(23, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'keterangan', '4', '', 'ket.002.002'),
(24, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'invoice_id', '4', '', '2'),
(25, '2017-01-24 12:24:44', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice_fee', 'invoice_detail_id', '4', '', '4'),
(26, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', '*** Batch insert successful ***', 't_invoice_fee', '', '', '', ''),
(27, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', '*** Batch insert begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(28, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'customer_id', '2', '', '8'),
(29, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'nomor', '2', '', 'inv.002'),
(30, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'tanggal', '2', '', '2017-01-24'),
(31, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'no_order', '2', '', 'ord.002'),
(32, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'no_referensi', '2', '', 'ref.002'),
(33, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'kegiatan', '2', '', 'keg.002'),
(34, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'no_sertifikat', '2', '', 'ser.002'),
(35, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'keterangan', '2', '', 'ket.002'),
(36, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'ppn', '2', '', '10'),
(37, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'terbayar', '2', '', '0'),
(38, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'pasal23', '2', '', '0'),
(39, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'no_kwitansi', '2', '', '-'),
(40, '2017-01-24 12:24:45', '/armanda2/t_invoiceadd.php', '3', 'A', 't_invoice', 'invoice_id', '2', '', '2'),
(41, '2017-01-24 12:25:28', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'tanggal', '3', '', '2017-02-01'),
(42, '2017-01-24 12:25:28', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'invoice_id', '3', '', '2'),
(43, '2017-01-24 12:25:28', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '3', '', '3'),
(44, '2017-01-24 12:25:39', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'tanggal', '4', '', '2017-02-02'),
(45, '2017-01-24 12:25:39', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'invoice_id', '4', '', '2'),
(46, '2017-01-24 12:25:39', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '4', '', '4'),
(47, '2017-01-24 12:25:51', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'tanggal', '5', '', '2017-02-03'),
(48, '2017-01-24 12:25:51', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'invoice_id', '5', '', '2'),
(49, '2017-01-24 12:25:51', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '5', '', '5');

-- --------------------------------------------------------

--
-- Table structure for table `t_customer`
--

CREATE TABLE IF NOT EXISTS `t_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `kota` varchar(50) NOT NULL,
  `kodepos` varchar(10) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `t_customer`
--

INSERT INTO `t_customer` (`customer_id`, `nama`, `alamat`, `kota`, `kodepos`, `npwp`) VALUES
(1, 'PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '01.874.422.7-641.000'),
(2, 'PT. ALUMINDO LIGHT METAL INDUSTRY TBK', 'Ds. Sawotratap Gedangan', 'Sidoarjo', '61254', '01.122.572.9-092.000'),
(3, 'PT. ARTHA KARYA NUSA', 'JL. VETERAN SEGOROMADU NO. 10 RT. 002 RW. 003 GENDING - KEBOMAS', 'GRESIK', '61123', '02.713.701.7-612.000'),
(4, 'PT. ATLAS BAHAGIA MANDIRI', 'GRIYO MAPAN SELATAN NO 18 RT 003 RW 001 TROPODO – WARU', 'SIDOARJO', '61256', '02.710.188.0-643.000'),
(5, 'PT. BATARA ELOK SEMESTA TERPADU', 'JL GAMMA MASPION Q NO.2 KAWASAN INDUSTRI MASPION RT.000 RW.000 MANYAR SIDOMUKTI', 'GRESIK', '61151', '31. 533.825.1-612.000'),
(6, 'PT. EKA TIMUR RAYA', 'JL. RAYA NONGKOJAJAR KM 1.4 PURWODADI', 'PASURUAN', '67163', '-'),
(7, 'UD WATTA TEGUH MANDIRI', 'JL KUNIR NO 12-14', 'SURABAYA', '60175', '-'),
(8, 'PT. SUKSES INDOTRAN PERKASA', 'IKAN BELANAK NO. 22 RT.002 RW. 001 PERAK BARAT KREMBANGAN', 'SURABAYA JAWA TIMUR', '60177', '03.120.468.8-605.000'),
(9, 'PT.WILMAR NABATI INDONESIA', 'GEDUNG B & G LT. 9, JL PUTRI HIJAU NO. 10, KESAWAN  MEDAN BARAT MEDAN', 'SUMATERA UTARA', '20111', '01.269.805.6-092.000'),
(10, 'PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK EAST JAVA', '61176', '01.874.422.7-641.000'),
(11, 'PT. GRESIK PRIMA UTAMA', 'DS, SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '31.430.862.8-642.000'),
(12, 'CV. KHARISMA DUTA UTAMA', 'JL. MAYJEN SUNGKONO 53 DESA/KEL. PRAMBANGAN – KEC. KEBOMAS', 'GRESIK', '61151', '02.525.076.2-641.000'),
(13, 'PT. SAMUDERA LAUTAN LUAS', 'LETDA SUJONO IV NO. 22 RT 000 RW 000 KEL. BANDAR SELAMAT KEC. MEDAN TEMBUNG', 'MEDAN SUMATERA UTARA', '20223', '02.443.917.6-113.000');

-- --------------------------------------------------------

--
-- Table structure for table `t_fee`
--

CREATE TABLE IF NOT EXISTS `t_fee` (
  `fee_id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` text NOT NULL,
  PRIMARY KEY (`fee_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `t_fee`
--

INSERT INTO `t_fee` (`fee_id`, `jenis`) VALUES
(1, 'ISPM # 15 Dan Fumigasi MB'),
(2, 'Fumigasi MB IMPORT'),
(3, 'Fumigasi MB(Barantan)+Phytosanitary+ISPM#15'),
(4, 'Biaya Perjalanan (PNBP) PP.35'),
(5, 'Biaya Storage'),
(6, 'FUMIGASI KAPAL ( PH3)'),
(7, 'FUMIGASI AQIS'),
(8, 'FUMIGASI MB ( BARANTAN)'),
(9, 'Phytosanitary');

-- --------------------------------------------------------

--
-- Table structure for table `t_invoice`
--

CREATE TABLE IF NOT EXISTS `t_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `no_order` varchar(100) NOT NULL,
  `no_referensi` varchar(100) NOT NULL,
  `kegiatan` text NOT NULL,
  `no_sertifikat` text NOT NULL,
  `keterangan` text NOT NULL,
  `total` float(10,2) NOT NULL,
  `ppn` int(11) NOT NULL,
  `total_ppn` float(10,2) NOT NULL,
  `terbilang` text NOT NULL,
  `terbayar` tinyint(4) NOT NULL,
  `pasal23` tinyint(4) NOT NULL,
  `no_kwitansi` varchar(100) NOT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `t_invoice`
--

INSERT INTO `t_invoice` (`invoice_id`, `customer_id`, `nomor`, `tanggal`, `no_order`, `no_referensi`, `kegiatan`, `no_sertifikat`, `keterangan`, `total`, `ppn`, `total_ppn`, `terbilang`, `terbayar`, `pasal23`, `no_kwitansi`) VALUES
(1, 1, 'inv.001', '2017-01-22', 'ord.001', 'ref.001', 'keg', 'serti, serti2', 'ket1, ket2', 16000.00, 10, 17600.00, ' tujuhbelas ribu enam ratus ', 0, 0, '-'),
(2, 8, 'inv.002', '2017-01-24', 'ord.002', 'ref.002', 'keg.002', 'ser.002', 'ket.002', 34500.00, 10, 37950.00, ' tiga puluh tujuh ribu sembilan ratus lima puluh ', 0, 0, '-');

-- --------------------------------------------------------

--
-- Table structure for table `t_invoice_fee`
--

CREATE TABLE IF NOT EXISTS `t_invoice_fee` (
  `invoice_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  `harga` float(10,2) NOT NULL,
  `qty` int(11) NOT NULL,
  `satuan` varchar(100) NOT NULL,
  `jumlah` float(10,2) DEFAULT NULL,
  `keterangan` text NOT NULL,
  PRIMARY KEY (`invoice_detail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `t_invoice_fee`
--

INSERT INTO `t_invoice_fee` (`invoice_detail_id`, `invoice_id`, `fee_id`, `harga`, `qty`, `satuan`, `jumlah`, `keterangan`) VALUES
(1, 1, 1, 1500.00, 4, 'sat', 6000.00, 'ket'),
(2, 1, 2, 2000.00, 5, 'sat2', 10000.00, 'ket2'),
(3, 2, 9, 3000.00, 4, 'sat.002.001', 12000.00, 'ket.002.001'),
(4, 2, 5, 4500.00, 5, 'sat.002.002', 22500.00, 'ket.002.002');

-- --------------------------------------------------------

--
-- Table structure for table `t_invoice_pelaksanaan`
--

CREATE TABLE IF NOT EXISTS `t_invoice_pelaksanaan` (
  `pelaksanaan_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`pelaksanaan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `t_invoice_pelaksanaan`
--

INSERT INTO `t_invoice_pelaksanaan` (`pelaksanaan_id`, `invoice_id`, `tanggal`) VALUES
(1, 1, '2017-01-23'),
(2, 1, '2017-01-24'),
(3, 2, '2017-02-01'),
(4, 2, '2017-02-02'),
(5, 2, '2017-02-03');

-- --------------------------------------------------------

--
-- Table structure for table `t_tmp_invoice_all`
--

CREATE TABLE IF NOT EXISTS `t_tmp_invoice_all` (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_kwitansi` varchar(100) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `no_sertifikat` text NOT NULL,
  `tgl_pelaksanaan` date NOT NULL,
  `total_ppn` float(10,2) NOT NULL,
  PRIMARY KEY (`temp_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `t_tmp_invoice_all`
--

INSERT INTO `t_tmp_invoice_all` (`temp_id`, `tanggal`, `nama`, `no_kwitansi`, `nomor`, `no_sertifikat`, `tgl_pelaksanaan`, `total_ppn`) VALUES
(1, '2017-01-22', 'PT. ANEKA RIMBA INDONUSA', '-', 'inv.001', 'serti, serti2', '0000-00-00', 17600.00);

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `userlevel` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`user_id`, `username`, `password`, `userlevel`) VALUES
(2, 'INDRI', 'administrasi0303', -1),
(3, 'admin', 'admin', -1);

-- --------------------------------------------------------

--
-- Table structure for table `v_invoice_fee`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_invoice_fee` AS select `db_armanda2`.`t_customer`.`nama` AS `nama`,`db_armanda2`.`t_customer`.`alamat` AS `alamat`,`db_armanda2`.`t_customer`.`kota` AS `kota`,`db_armanda2`.`t_customer`.`kodepos` AS `kodepos`,`db_armanda2`.`t_customer`.`npwp` AS `npwp`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`tanggal` AS `tanggal`,`db_armanda2`.`t_invoice`.`no_order` AS `no_order`,`db_armanda2`.`t_invoice`.`no_referensi` AS `no_referensi`,`db_armanda2`.`t_invoice`.`kegiatan` AS `kegiatan`,`db_armanda2`.`t_invoice`.`no_sertifikat` AS `no_sertifikat`,`db_armanda2`.`t_invoice`.`keterangan` AS `keterangan`,`db_armanda2`.`t_invoice`.`total` AS `total`,`db_armanda2`.`t_invoice`.`ppn` AS `ppn`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`terbilang` AS `terbilang`,`db_armanda2`.`t_invoice`.`terbayar` AS `terbayar`,`db_armanda2`.`t_invoice`.`pasal23` AS `pasal23`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`db_armanda2`.`t_fee`.`jenis` AS `jenis`,`db_armanda2`.`t_invoice_fee`.`harga` AS `harga`,`db_armanda2`.`t_invoice_fee`.`qty` AS `qty`,`db_armanda2`.`t_invoice_fee`.`satuan` AS `satuan`,`db_armanda2`.`t_invoice_fee`.`jumlah` AS `jumlah`,`db_armanda2`.`t_invoice_fee`.`keterangan` AS `keterangan1` from (((`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) join `db_armanda2`.`t_invoice_fee` on((`db_armanda2`.`t_invoice`.`invoice_id` = `db_armanda2`.`t_invoice_fee`.`invoice_id`))) join `db_armanda2`.`t_fee` on((`db_armanda2`.`t_invoice_fee`.`fee_id` = `db_armanda2`.`t_fee`.`fee_id`)));

--
-- Dumping data for table `v_invoice_fee`
--

INSERT INTO `v_invoice_fee` (`nama`, `alamat`, `kota`, `kodepos`, `npwp`, `invoice_id`, `nomor`, `tanggal`, `no_order`, `no_referensi`, `kegiatan`, `no_sertifikat`, `keterangan`, `total`, `ppn`, `total_ppn`, `terbilang`, `terbayar`, `pasal23`, `no_kwitansi`, `jenis`, `harga`, `qty`, `satuan`, `jumlah`, `keterangan1`) VALUES
('PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '01.874.422.7-641.000', 1, 'inv.001', '2017-01-22', 'ord.001', 'ref.001', 'keg', 'serti, serti2', 'ket1, ket2', 16000.00, 10, 17600.00, ' tujuhbelas ribu enam ratus ', 0, 0, '-', 'ISPM # 15 Dan Fumigasi MB', 1500.00, 4, 'sat', 6000.00, 'ket'),
('PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '01.874.422.7-641.000', 1, 'inv.001', '2017-01-22', 'ord.001', 'ref.001', 'keg', 'serti, serti2', 'ket1, ket2', 16000.00, 10, 17600.00, ' tujuhbelas ribu enam ratus ', 0, 0, '-', 'Fumigasi MB IMPORT', 2000.00, 5, 'sat2', 10000.00, 'ket2'),
('PT. SUKSES INDOTRAN PERKASA', 'IKAN BELANAK NO. 22 RT.002 RW. 001 PERAK BARAT KREMBANGAN', 'SURABAYA JAWA TIMUR', '60177', '03.120.468.8-605.000', 2, 'inv.002', '2017-01-24', 'ord.002', 'ref.002', 'keg.002', 'ser.002', 'ket.002', 34500.00, 10, 37950.00, ' tiga puluh tujuh ribu sembilan ratus lima puluh ', 0, 0, '-', 'Phytosanitary', 3000.00, 4, 'sat.002.001', 12000.00, 'ket.002.001'),
('PT. SUKSES INDOTRAN PERKASA', 'IKAN BELANAK NO. 22 RT.002 RW. 001 PERAK BARAT KREMBANGAN', 'SURABAYA JAWA TIMUR', '60177', '03.120.468.8-605.000', 2, 'inv.002', '2017-01-24', 'ord.002', 'ref.002', 'keg.002', 'ser.002', 'ket.002', 34500.00, 10, 37950.00, ' tiga puluh tujuh ribu sembilan ratus lima puluh ', 0, 0, '-', 'Biaya Storage', 4500.00, 5, 'sat.002.002', 22500.00, 'ket.002.002');

-- --------------------------------------------------------

--
-- Table structure for table `v_invoice_pelaksanaan`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_invoice_pelaksanaan` AS select `db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id`,`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal` AS `tanggal` from (`db_armanda2`.`t_invoice` join `db_armanda2`.`t_invoice_pelaksanaan` on((`db_armanda2`.`t_invoice`.`invoice_id` = `db_armanda2`.`t_invoice_pelaksanaan`.`invoice_id`)));

--
-- Dumping data for table `v_invoice_pelaksanaan`
--

INSERT INTO `v_invoice_pelaksanaan` (`invoice_id`, `tanggal`) VALUES
(1, '2017-01-23'),
(1, '2017-01-24'),
(2, '2017-02-01'),
(2, '2017-02-02'),
(2, '2017-02-03');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
