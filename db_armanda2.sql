-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 02, 2017 at 04:48 PM
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=220 ;

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
(49, '2017-01-24 12:25:51', '/armanda2/t_invoice_pelaksanaanadd.php', '3', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '5', '', '5'),
(50, '2017-01-26 13:56:34', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(51, '2017-01-29 01:51:02', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(52, '2017-01-29 03:23:10', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(53, '2017-01-29 03:25:00', '/armanda2/t_invoiceedit.php', '3', '*** Batch update begin ***', 't_invoice_fee', '', '', '', ''),
(54, '2017-01-29 03:25:00', '/armanda2/t_invoiceedit.php', '3', 'U', 't_invoice_fee', 'qty', '1', '4.0000', '4.5'),
(55, '2017-01-29 03:25:00', '/armanda2/t_invoiceedit.php', '3', '*** Batch update successful ***', 't_invoice_fee', '', '', '', ''),
(56, '2017-01-29 03:25:00', '/armanda2/t_invoiceedit.php', '3', '*** Batch update begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(57, '2017-01-29 03:25:00', '/armanda2/t_invoiceedit.php', '3', '*** Batch update successful ***', 't_invoice_pelaksanaan', '', '', '', ''),
(58, '2017-01-29 03:29:06', '/armanda2/t_invoice_feeedit.php', '3', 'U', 't_invoice_fee', 'qty', '1', '4.5000', '4.6'),
(59, '2017-01-29 03:29:06', '/armanda2/t_invoice_feeedit.php', '3', 'U', 't_invoice_fee', 'jumlah', '1', '6000.00', '6900'),
(60, '2017-01-29 03:29:22', '/armanda2/t_invoice_feeedit.php', '3', 'U', 't_invoice_fee', 'qty', '1', '4.6000', '4.5'),
(61, '2017-01-29 03:29:22', '/armanda2/t_invoice_feeedit.php', '3', 'U', 't_invoice_fee', 'jumlah', '1', '6900.00', '6750'),
(62, '2017-01-31 02:57:32', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(63, '2017-01-31 04:38:21', '/armanda2/logout.php', 'admin', 'logout', '::1', '', '', '', ''),
(64, '2017-01-31 04:38:26', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(65, '2017-01-31 04:50:39', '/armanda2/logout.php', 'admin', 'logout', '::1', '', '', '', ''),
(66, '2017-01-31 04:50:41', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(67, '2017-01-31 04:56:58', '/armanda2/logout.php', 'admin', 'logout', '::1', '', '', '', ''),
(68, '2017-01-31 04:56:59', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', ''),
(69, '2017-01-31 06:07:05', '/armanda2/t_invoiceedit.php', '3', 'U', 't_invoice', 'no_kwitansi', '1', '-', '123456'),
(70, '2017-01-31 08:38:53', '/armanda2/t_invoiceedit.php', '3', 'U', 't_invoice', 'no_kwitansi', '2', '-', '123456'),
(71, '2017-01-31 09:00:04', '/armanda2/t_invoiceedit.php', '3', '*** Batch update begin ***', 't_invoice_fee', '', '', '', ''),
(72, '2017-01-31 09:00:04', '/armanda2/t_invoiceedit.php', '3', '*** Batch update successful ***', 't_invoice_fee', '', '', '', ''),
(73, '2017-01-31 09:00:04', '/armanda2/t_invoiceedit.php', '3', '*** Batch update begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(74, '2017-01-31 09:00:04', '/armanda2/t_invoiceedit.php', '3', '*** Batch update successful ***', 't_invoice_pelaksanaan', '', '', '', ''),
(75, '2017-01-31 09:00:04', '/armanda2/t_invoiceedit.php', '3', 'U', 't_invoice', 'periode', '1', NULL, '2017-01-31'),
(76, '2017-01-31 09:06:01', '/armanda2/t_invoiceedit.php', '3', 'U', 't_invoice', 'periode', '2', '0000-00-00', '2017-01-31'),
(77, '2017-01-31 09:42:59', '/login.php', 'admin', 'login', '139.194.183.245', '', '', '', ''),
(78, '2017-01-31 09:53:02', '/logout.php', 'admin', 'logout', '139.194.183.245', '', '', '', ''),
(79, '2017-01-31 09:54:35', '/login.php', 'admin', 'login', '114.125.80.6', '', '', '', ''),
(80, '2017-01-31 09:55:10', '/logout.php', 'admin', 'logout', '64.233.173.15', '', '', '', ''),
(81, '2017-02-01 02:05:04', '/login.php', 'INDRI', 'login', '61.5.39.231', '', '', '', ''),
(82, '2017-02-01 02:13:05', '/logout.php', 'INDRI', 'logout', '61.5.39.231', '', '', '', ''),
(83, '2017-02-01 02:43:28', '/login.php', 'INDRI', 'login', '61.5.39.231', '', '', '', ''),
(84, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'customer_id', '3', '', '1'),
(85, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'nomor', '3', '', '12/SBA-AN/I/2017'),
(86, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'tanggal', '3', '', '2017-01-02'),
(87, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_order', '3', '', '12/SBA-AN/I/2017'),
(88, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_referensi', '3', '', '02.170.011.7-609.000'),
(89, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'kegiatan', '3', '', 'FUMIGASI'),
(90, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_sertifikat', '3', '', '0128531'),
(91, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'keterangan', '3', '', 'FUMIGASI'),
(92, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'ppn', '3', '', '10'),
(93, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'terbayar', '3', '', '0'),
(94, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'pasal23', '3', '', '0'),
(95, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_kwitansi', '3', '', 'A. 002546'),
(96, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'periode', '3', '', '2017-01-31'),
(97, '2017-02-01 02:46:40', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'invoice_id', '3', '', '3'),
(98, '2017-02-01 02:51:43', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'fee_id', '5', '', '2'),
(99, '2017-02-01 02:51:43', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'harga', '5', '', '7500'),
(100, '2017-02-01 02:51:43', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'qty', '5', '', '6300'),
(101, '2017-02-01 02:51:43', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'satuan', '5', '', 'MT'),
(102, '2017-02-01 02:51:43', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'keterangan', '5', '', '-'),
(103, '2017-02-01 02:51:43', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'invoice_id', '5', '', '3'),
(104, '2017-02-01 02:51:43', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'jumlah', '5', '', '47250000'),
(105, '2017-02-01 02:51:43', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'invoice_detail_id', '5', '', '5'),
(106, '2017-02-01 02:51:58', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'tanggal', '6', '', '2017-02-07'),
(107, '2017-02-01 02:51:58', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'invoice_id', '6', '', '3'),
(108, '2017-02-01 02:51:58', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '6', '', '6'),
(109, '2017-02-01 02:52:07', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'tanggal', '7', '', '2017-02-07'),
(110, '2017-02-01 02:52:07', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'invoice_id', '7', '', '3'),
(111, '2017-02-01 02:52:07', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '7', '', '7'),
(112, '2017-02-01 02:52:26', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'tanggal', '8', '', '2017-02-15'),
(113, '2017-02-01 02:52:26', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'invoice_id', '8', '', '3'),
(114, '2017-02-01 02:52:26', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '8', '', '8'),
(115, '2017-02-01 02:52:34', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'tanggal', '9', '', '2017-02-10'),
(116, '2017-02-01 02:52:34', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'invoice_id', '9', '', '3'),
(117, '2017-02-01 02:52:34', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '9', '', '9'),
(118, '2017-02-01 02:52:45', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'tanggal', '10', '', '2017-02-22'),
(119, '2017-02-01 02:52:45', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'invoice_id', '10', '', '3'),
(120, '2017-02-01 02:52:45', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '10', '', '10'),
(121, '2017-02-01 02:52:56', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'tanggal', '11', '', '2017-02-26'),
(122, '2017-02-01 02:52:56', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'invoice_id', '11', '', '3'),
(123, '2017-02-01 02:52:56', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '11', '', '11'),
(124, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'customer_id', '4', '', '1'),
(125, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'nomor', '4', '', '12/SBA-AN/I/2017'),
(126, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'tanggal', '4', '', '2013-01-02'),
(127, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_order', '4', '', '12/SBA-AN/I/2017'),
(128, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_referensi', '4', '', '02.170.011.7-609.000'),
(129, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'kegiatan', '4', '', 'FUMIGASI'),
(130, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_sertifikat', '4', '', '0128531'),
(131, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'keterangan', '4', '', 'FUMIGASI'),
(132, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'ppn', '4', '', '10'),
(133, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'terbayar', '4', '', '0'),
(134, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'pasal23', '4', '', '0'),
(135, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_kwitansi', '4', '', 'A. 002546'),
(136, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'periode', '4', '', '2017-01-31'),
(137, '2017-02-01 02:58:36', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'invoice_id', '4', '', '4'),
(138, '2017-02-01 02:59:02', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'fee_id', '6', '', '2'),
(139, '2017-02-01 02:59:02', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'harga', '6', '', '7500'),
(140, '2017-02-01 02:59:02', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'qty', '6', '', '6000'),
(141, '2017-02-01 02:59:02', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'satuan', '6', '', 'MT'),
(142, '2017-02-01 02:59:02', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'keterangan', '6', '', '-'),
(143, '2017-02-01 02:59:02', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'invoice_id', '6', '', '4'),
(144, '2017-02-01 02:59:02', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'jumlah', '6', '', '45000000'),
(145, '2017-02-01 02:59:02', '/t_invoice_feeadd.php', '2', 'A', 't_invoice_fee', 'invoice_detail_id', '6', '', '6'),
(146, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'customer_id', '5', '', '1'),
(147, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'nomor', '5', '', '12/SBA-AN/I/2017'),
(148, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'tanggal', '5', '', '2017-01-02'),
(149, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_order', '5', '', '13/SBA-AN/I/2017'),
(150, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_referensi', '5', '', '02.170.011.7-609.001'),
(151, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'kegiatan', '5', '', 'FUMIGASI'),
(152, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_sertifikat', '5', '', '0128531'),
(153, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'keterangan', '5', '', 'FUMIGASI'),
(154, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'ppn', '5', '', '10'),
(155, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'terbayar', '5', '', '0'),
(156, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'pasal23', '5', '', '0'),
(157, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'no_kwitansi', '5', '', 'A. 002547'),
(158, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'periode', '5', '', '2017-01-31'),
(159, '2017-02-01 02:59:38', '/t_invoiceadd.php', '2', 'A', 't_invoice', 'invoice_id', '5', '', '5'),
(160, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_fee', '', '', '', ''),
(161, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'A', 't_invoice_fee', 'fee_id', '7', '', '2'),
(162, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'A', 't_invoice_fee', 'harga', '7', '', '7500'),
(163, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'A', 't_invoice_fee', 'qty', '7', '', '3300'),
(164, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'A', 't_invoice_fee', 'satuan', '7', '', 'mt'),
(165, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'A', 't_invoice_fee', 'jumlah', '7', '', '24750000'),
(166, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'A', 't_invoice_fee', 'keterangan', '7', '', '-'),
(167, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'A', 't_invoice_fee', 'invoice_id', '7', '', '5'),
(168, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'A', 't_invoice_fee', 'invoice_detail_id', '7', '', '7'),
(169, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_fee', '', '', '', ''),
(170, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(171, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_pelaksanaan', '', '', '', ''),
(172, '2017-02-01 03:01:25', '/t_invoiceedit.php', '2', 'U', 't_invoice', 'no_kwitansi', '5', 'A. 002547', 'A. 002546'),
(173, '2017-02-01 03:02:18', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'tanggal', '12', '', '2017-02-07'),
(174, '2017-02-01 03:02:18', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'invoice_id', '12', '', '5'),
(175, '2017-02-01 03:02:18', '/t_invoice_pelaksanaanadd.php', '2', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '12', '', '12'),
(176, '2017-02-01 03:03:42', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_fee', '', '', '', ''),
(177, '2017-02-01 03:03:42', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_fee', '', '', '', ''),
(178, '2017-02-01 03:03:42', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(179, '2017-02-01 03:03:42', '/t_invoiceedit.php', '2', 'A', 't_invoice_pelaksanaan', 'tanggal', '13', '', '2017-02-15'),
(180, '2017-02-01 03:03:42', '/t_invoiceedit.php', '2', 'A', 't_invoice_pelaksanaan', 'invoice_id', '13', '', '4'),
(181, '2017-02-01 03:03:42', '/t_invoiceedit.php', '2', 'A', 't_invoice_pelaksanaan', 'pelaksanaan_id', '13', '', '13'),
(182, '2017-02-01 03:03:42', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_pelaksanaan', '', '', '', ''),
(183, '2017-02-01 03:06:55', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_fee', '', '', '', ''),
(184, '2017-02-01 03:06:55', '/t_invoiceedit.php', '2', 'U', 't_invoice_fee', 'qty', '6', '6000.0000', '245.36'),
(185, '2017-02-01 03:06:55', '/t_invoiceedit.php', '2', 'U', 't_invoice_fee', 'jumlah', '6', '45000000.00', '1840200'),
(186, '2017-02-01 03:06:55', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_fee', '', '', '', ''),
(187, '2017-02-01 03:06:55', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(188, '2017-02-01 03:06:55', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_pelaksanaan', '', '', '', ''),
(189, '2017-02-01 03:06:55', '/t_invoiceedit.php', '2', 'U', 't_invoice', 'tanggal', '4', '2013-01-02', '2017-01-02'),
(190, '2017-02-01 03:24:18', '/logout.php', 'INDRI', 'logout', '61.5.39.231', '', '', '', ''),
(191, '2017-02-01 03:24:18', '/logout.php', '-1', 'logout', '61.5.39.231', '', '', '', ''),
(192, '2017-02-01 05:16:32', '/login.php', 'admin', 'login', '36.81.253.234', '', '', '', ''),
(193, '2017-02-01 08:23:43', '/login.php', 'admin', 'login', '36.81.253.234', '', '', '', ''),
(194, '2017-02-01 09:30:34', '/t_invoiceedit.php', '3', '*** Batch update begin ***', 't_invoice_fee', '', '', '', ''),
(195, '2017-02-01 09:30:34', '/t_invoiceedit.php', '3', '*** Batch update successful ***', 't_invoice_fee', '', '', '', ''),
(196, '2017-02-01 09:30:34', '/t_invoiceedit.php', '3', '*** Batch update begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(197, '2017-02-01 09:30:34', '/t_invoiceedit.php', '3', '*** Batch update successful ***', 't_invoice_pelaksanaan', '', '', '', ''),
(198, '2017-02-01 09:30:34', '/t_invoiceedit.php', '3', 'U', 't_invoice', 'tgl_bayar', '3', NULL, '2017-03-01'),
(199, '2017-02-01 09:31:29', '/t_invoiceedit.php', '3', 'U', 't_invoice', 'terbayar', '3', '0', '1'),
(200, '2017-02-01 11:22:37', '/t_invoiceedit.php', '3', 'U', 't_invoice', 'periode', '2', '2017-01-31', '2017-02-01'),
(201, '2017-02-02 01:52:55', '/login.php', 'INDRI', 'login', '61.5.39.231', '', '', '', ''),
(202, '2017-02-02 02:03:38', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_fee', '', '', '', ''),
(203, '2017-02-02 02:03:38', '/t_invoiceedit.php', '2', 'U', 't_invoice_fee', 'qty', '3', '4.0000', '4.56'),
(204, '2017-02-02 02:03:38', '/t_invoiceedit.php', '2', 'U', 't_invoice_fee', 'jumlah', '3', '12000.00', '13680'),
(205, '2017-02-02 02:03:38', '/t_invoiceedit.php', '2', 'U', 't_invoice_fee', 'qty', '4', '5.0000', '7'),
(206, '2017-02-02 02:03:38', '/t_invoiceedit.php', '2', 'U', 't_invoice_fee', 'jumlah', '4', '22500.00', '31500'),
(207, '2017-02-02 02:03:38', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_fee', '', '', '', ''),
(208, '2017-02-02 02:03:38', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(209, '2017-02-02 02:03:38', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_pelaksanaan', '', '', '', ''),
(210, '2017-02-02 02:05:36', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_fee', '', '', '', ''),
(211, '2017-02-02 02:05:36', '/t_invoiceedit.php', '2', 'U', 't_invoice_fee', 'harga', '3', '3000.00', '50000'),
(212, '2017-02-02 02:05:36', '/t_invoiceedit.php', '2', 'U', 't_invoice_fee', 'jumlah', '3', '13680.00', '228000'),
(213, '2017-02-02 02:05:36', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_fee', '', '', '', ''),
(214, '2017-02-02 02:05:36', '/t_invoiceedit.php', '2', '*** Batch update begin ***', 't_invoice_pelaksanaan', '', '', '', ''),
(215, '2017-02-02 02:05:36', '/t_invoiceedit.php', '2', '*** Batch update successful ***', 't_invoice_pelaksanaan', '', '', '', ''),
(216, '2017-02-02 02:06:14', '/t_invoice_feeedit.php', '2', 'U', 't_invoice_fee', 'jumlah', '3', '228000.00', '228000'),
(217, '2017-02-02 02:06:46', '/t_invoice_feeedit.php', '2', 'U', 't_invoice_fee', 'qty', '3', '4.5600', '56.5'),
(218, '2017-02-02 02:06:46', '/t_invoice_feeedit.php', '2', 'U', 't_invoice_fee', 'jumlah', '3', '228000.00', '2825000'),
(219, '2017-02-02 02:57:07', '/armanda2/login.php', 'admin', 'login', '::1', '', '', '', '');

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
  `periode` date NOT NULL,
  `tgl_bayar` date DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `t_invoice`
--

INSERT INTO `t_invoice` (`invoice_id`, `customer_id`, `nomor`, `tanggal`, `no_order`, `no_referensi`, `kegiatan`, `no_sertifikat`, `keterangan`, `total`, `ppn`, `total_ppn`, `terbilang`, `terbayar`, `pasal23`, `no_kwitansi`, `periode`, `tgl_bayar`) VALUES
(1, 1, 'inv.001', '2017-01-22', 'ord.001', 'ref.001', 'keg', 'serti, serti2', 'ket1, ket2', 16750.00, 10, 18425.00, ' delapanbelas ribu empat ratus dua puluh lima', 0, 0, '123456', '2017-01-31', NULL),
(2, 8, 'inv.002', '2017-01-24', 'ord.002', 'ref.002', 'keg.002', 'ser.002', 'ket.002', 2856500.00, 10, 3142150.00, ' tiga juta seratus empat puluh dua ribu seratus lima puluh ', 0, 0, '123456', '2017-02-01', NULL),
(3, 1, '12/SBA-AN/I/2017', '2017-01-02', '12/SBA-AN/I/2017', '02.170.011.7-609.000', 'FUMIGASI', '0128531', 'FUMIGASI', 47250000.00, 10, 51975000.00, ' lima puluh satu juta sembilan ratus tujuh puluh lima ribu ', 1, 0, 'A. 002546', '2017-01-31', '2017-03-01'),
(4, 1, '12/SBA-AN/I/2017', '2017-01-02', '12/SBA-AN/I/2017', '02.170.011.7-609.000', 'FUMIGASI', '0128531', 'FUMIGASI', 1840200.00, 10, 2024220.00, ' dua juta dua puluh empat ribu dua ratus dua puluh ', 0, 0, 'A. 002546', '2017-01-31', NULL),
(5, 1, '12/SBA-AN/I/2017', '2017-01-02', '13/SBA-AN/I/2017', '02.170.011.7-609.001', 'FUMIGASI', '0128531', 'FUMIGASI', 24750000.00, 10, 27225000.00, ' dua puluh tujuh juta dua ratus dua puluh lima ribu ', 0, 0, 'A. 002546', '2017-01-31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_invoice_fee`
--

CREATE TABLE IF NOT EXISTS `t_invoice_fee` (
  `invoice_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `fee_id` int(11) NOT NULL,
  `harga` float(10,2) NOT NULL,
  `qty` decimal(10,4) NOT NULL,
  `satuan` varchar(100) DEFAULT NULL,
  `jumlah` float(10,2) DEFAULT NULL,
  `keterangan` text,
  PRIMARY KEY (`invoice_detail_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `t_invoice_fee`
--

INSERT INTO `t_invoice_fee` (`invoice_detail_id`, `invoice_id`, `fee_id`, `harga`, `qty`, `satuan`, `jumlah`, `keterangan`) VALUES
(1, 1, 1, 1500.00, '4.5000', 'sat', 6750.00, 'ket'),
(2, 1, 2, 2000.00, '5.0000', 'sat2', 10000.00, 'ket2'),
(3, 2, 9, 50000.00, '56.5000', 'sat.002.001', 2825000.00, 'ket.002.001'),
(4, 2, 5, 4500.00, '7.0000', 'sat.002.002', 31500.00, 'ket.002.002'),
(5, 3, 2, 7500.00, '6300.0000', 'MT', 47250000.00, '-'),
(6, 4, 2, 7500.00, '245.3600', 'MT', 1840200.00, '-'),
(7, 5, 2, 7500.00, '3300.0000', 'mt', 24750000.00, '-');

-- --------------------------------------------------------

--
-- Table structure for table `t_invoice_pelaksanaan`
--

CREATE TABLE IF NOT EXISTS `t_invoice_pelaksanaan` (
  `pelaksanaan_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`pelaksanaan_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `t_invoice_pelaksanaan`
--

INSERT INTO `t_invoice_pelaksanaan` (`pelaksanaan_id`, `invoice_id`, `tanggal`) VALUES
(1, 1, '2017-01-23'),
(2, 1, '2017-01-24'),
(3, 2, '2017-02-01'),
(4, 2, '2017-02-02'),
(5, 2, '2017-02-03'),
(6, 3, '2017-02-07'),
(7, 3, '2017-02-07'),
(8, 3, '2017-02-15'),
(9, 3, '2017-02-10'),
(10, 3, '2017-02-22'),
(11, 3, '2017-02-26'),
(12, 5, '2017-02-07'),
(13, 4, '2017-02-15');

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_invoice_fee` AS select `db_armanda2`.`t_customer`.`nama` AS `nama`,`db_armanda2`.`t_customer`.`alamat` AS `alamat`,`db_armanda2`.`t_customer`.`kota` AS `kota`,`db_armanda2`.`t_customer`.`kodepos` AS `kodepos`,`db_armanda2`.`t_customer`.`npwp` AS `npwp`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`tanggal` AS `tanggal`,`db_armanda2`.`t_invoice`.`no_order` AS `no_order`,`db_armanda2`.`t_invoice`.`no_referensi` AS `no_referensi`,`db_armanda2`.`t_invoice`.`kegiatan` AS `kegiatan`,`db_armanda2`.`t_invoice`.`no_sertifikat` AS `no_sertifikat`,`db_armanda2`.`t_invoice`.`keterangan` AS `keterangan`,`db_armanda2`.`t_invoice`.`total` AS `total`,`db_armanda2`.`t_invoice`.`ppn` AS `ppn`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`terbilang` AS `terbilang`,`db_armanda2`.`t_invoice`.`terbayar` AS `terbayar`,`db_armanda2`.`t_invoice`.`pasal23` AS `pasal23`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`db_armanda2`.`t_fee`.`jenis` AS `jenis`,`db_armanda2`.`t_invoice_fee`.`harga` AS `harga`,`db_armanda2`.`t_invoice_fee`.`qty` AS `qty`,`db_armanda2`.`t_invoice_fee`.`satuan` AS `satuan`,`db_armanda2`.`t_invoice_fee`.`jumlah` AS `jumlah`,`db_armanda2`.`t_invoice_fee`.`keterangan` AS `keterangan1`,`v_invoice_pelaksanaan`.`tgl_pelaksanaan` AS `tgl_pelaksanaan` from ((((`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) join `db_armanda2`.`t_invoice_fee` on((`db_armanda2`.`t_invoice`.`invoice_id` = `db_armanda2`.`t_invoice_fee`.`invoice_id`))) join `db_armanda2`.`t_fee` on((`db_armanda2`.`t_invoice_fee`.`fee_id` = `db_armanda2`.`t_fee`.`fee_id`))) join `db_armanda2`.`v_invoice_pelaksanaan` on((`db_armanda2`.`t_invoice`.`invoice_id` = `v_invoice_pelaksanaan`.`invoice_id`)));

--
-- Dumping data for table `v_invoice_fee`
--

INSERT INTO `v_invoice_fee` (`nama`, `alamat`, `kota`, `kodepos`, `npwp`, `invoice_id`, `nomor`, `tanggal`, `no_order`, `no_referensi`, `kegiatan`, `no_sertifikat`, `keterangan`, `total`, `ppn`, `total_ppn`, `terbilang`, `terbayar`, `pasal23`, `no_kwitansi`, `jenis`, `harga`, `qty`, `satuan`, `jumlah`, `keterangan1`, `tgl_pelaksanaan`) VALUES
('PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '01.874.422.7-641.000', 1, 'inv.001', '2017-01-22', 'ord.001', 'ref.001', 'keg', 'serti, serti2', 'ket1, ket2', 16750.00, 10, 18425.00, ' delapanbelas ribu empat ratus dua puluh lima', 0, 0, '123456', 'ISPM # 15 Dan Fumigasi MB', 1500.00, '4.5000', 'sat', 6750.00, 'ket', '23, 24 Jan 2017'),
('PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '01.874.422.7-641.000', 1, 'inv.001', '2017-01-22', 'ord.001', 'ref.001', 'keg', 'serti, serti2', 'ket1, ket2', 16750.00, 10, 18425.00, ' delapanbelas ribu empat ratus dua puluh lima', 0, 0, '123456', 'Fumigasi MB IMPORT', 2000.00, '5.0000', 'sat2', 10000.00, 'ket2', '23, 24 Jan 2017'),
('PT. SUKSES INDOTRAN PERKASA', 'IKAN BELANAK NO. 22 RT.002 RW. 001 PERAK BARAT KREMBANGAN', 'SURABAYA JAWA TIMUR', '60177', '03.120.468.8-605.000', 2, 'inv.002', '2017-01-24', 'ord.002', 'ref.002', 'keg.002', 'ser.002', 'ket.002', 2856500.00, 10, 3142150.00, ' tiga juta seratus empat puluh dua ribu seratus lima puluh ', 0, 0, '123456', 'Phytosanitary', 50000.00, '56.5000', 'sat.002.001', 2825000.00, 'ket.002.001', '01, 02, 03 Feb 2017'),
('PT. SUKSES INDOTRAN PERKASA', 'IKAN BELANAK NO. 22 RT.002 RW. 001 PERAK BARAT KREMBANGAN', 'SURABAYA JAWA TIMUR', '60177', '03.120.468.8-605.000', 2, 'inv.002', '2017-01-24', 'ord.002', 'ref.002', 'keg.002', 'ser.002', 'ket.002', 2856500.00, 10, 3142150.00, ' tiga juta seratus empat puluh dua ribu seratus lima puluh ', 0, 0, '123456', 'Biaya Storage', 4500.00, '7.0000', 'sat.002.002', 31500.00, 'ket.002.002', '01, 02, 03 Feb 2017'),
('PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '01.874.422.7-641.000', 3, '12/SBA-AN/I/2017', '2017-01-02', '12/SBA-AN/I/2017', '02.170.011.7-609.000', 'FUMIGASI', '0128531', 'FUMIGASI', 47250000.00, 10, 51975000.00, ' lima puluh satu juta sembilan ratus tujuh puluh lima ribu ', 1, 0, 'A. 002546', 'Fumigasi MB IMPORT', 7500.00, '6300.0000', 'MT', 47250000.00, '-', '26, 22, 10, 15, 07, 07 Feb 2017'),
('PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '01.874.422.7-641.000', 4, '12/SBA-AN/I/2017', '2017-01-02', '12/SBA-AN/I/2017', '02.170.011.7-609.000', 'FUMIGASI', '0128531', 'FUMIGASI', 1840200.00, 10, 2024220.00, ' dua juta dua puluh empat ribu dua ratus dua puluh ', 0, 0, 'A. 002546', 'Fumigasi MB IMPORT', 7500.00, '245.3600', 'MT', 1840200.00, '-', '15 Feb 2017'),
('PT. ANEKA RIMBA INDONUSA', 'DS. SUMENGKO KM 30.6 WRINGIN ANOM', 'GRESIK', '61176', '01.874.422.7-641.000', 5, '12/SBA-AN/I/2017', '2017-01-02', '13/SBA-AN/I/2017', '02.170.011.7-609.001', 'FUMIGASI', '0128531', 'FUMIGASI', 24750000.00, 10, 27225000.00, ' dua puluh tujuh juta dua ratus dua puluh lima ribu ', 0, 0, 'A. 002546', 'Fumigasi MB IMPORT', 7500.00, '3300.0000', 'mt', 24750000.00, '-', '07 Feb 2017');

-- --------------------------------------------------------

--
-- Table structure for table `v_invoice_pelaksanaan`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_invoice_pelaksanaan` AS select `db_armanda2`.`t_invoice_pelaksanaan`.`invoice_id` AS `invoice_id`,concat(group_concat(date_format(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`,'%d') separator ', '),' ',date_format(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`,'%b'),' ',date_format(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`,'%Y')) AS `tgl_pelaksanaan` from `db_armanda2`.`t_invoice_pelaksanaan` group by `db_armanda2`.`t_invoice_pelaksanaan`.`invoice_id`,concat(month(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`),year(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`)) order by `db_armanda2`.`t_invoice_pelaksanaan`.`invoice_id`,`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`;

--
-- Dumping data for table `v_invoice_pelaksanaan`
--

INSERT INTO `v_invoice_pelaksanaan` (`invoice_id`, `tgl_pelaksanaan`) VALUES
(1, '23, 24 Jan 2017'),
(2, '01, 02, 03 Feb 2017'),
(3, '26, 22, 10, 15, 07, 07 Feb 2017'),
(4, '15 Feb 2017'),
(5, '07 Feb 2017');

-- --------------------------------------------------------

--
-- Table structure for table `v_rekap_hutang`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_rekap_hutang` AS select `db_armanda2`.`t_customer`.`nama` AS `nama`,`v_invoice_pelaksanaan`.`tgl_pelaksanaan` AS `tgl_pelaksanaan`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id` from ((`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) join `db_armanda2`.`v_invoice_pelaksanaan` on((`db_armanda2`.`t_invoice`.`invoice_id` = `v_invoice_pelaksanaan`.`invoice_id`))) where (`db_armanda2`.`t_invoice`.`terbayar` = 0);

--
-- Dumping data for table `v_rekap_hutang`
--

INSERT INTO `v_rekap_hutang` (`nama`, `tgl_pelaksanaan`, `no_kwitansi`, `nomor`, `total_ppn`, `invoice_id`) VALUES
('PT. ANEKA RIMBA INDONUSA', '23, 24 Jan 2017', '123456', 'inv.001', 18425.00, 1),
('PT. SUKSES INDOTRAN PERKASA', '01, 02, 03 Feb 2017', '123456', 'inv.002', 3142150.00, 2),
('PT. ANEKA RIMBA INDONUSA', '15 Feb 2017', 'A. 002546', '12/SBA-AN/I/2017', 2024220.00, 4),
('PT. ANEKA RIMBA INDONUSA', '07 Feb 2017', 'A. 002546', '12/SBA-AN/I/2017', 27225000.00, 5);

-- --------------------------------------------------------

--
-- Table structure for table `v_rekap_invoice_all`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_rekap_invoice_all` AS select `db_armanda2`.`t_customer`.`nama` AS `nama`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`tanggal` AS `tanggal`,`db_armanda2`.`t_invoice`.`no_sertifikat` AS `no_sertifikat`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`v_invoice_pelaksanaan`.`tgl_pelaksanaan` AS `tgl_pelaksanaan`,`db_armanda2`.`t_invoice`.`periode` AS `periode`,`db_armanda2`.`t_invoice`.`tgl_bayar` AS `tgl_bayar` from ((`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) join `db_armanda2`.`v_invoice_pelaksanaan` on((`db_armanda2`.`t_invoice`.`invoice_id` = `v_invoice_pelaksanaan`.`invoice_id`)));

--
-- Dumping data for table `v_rekap_invoice_all`
--

INSERT INTO `v_rekap_invoice_all` (`nama`, `invoice_id`, `nomor`, `tanggal`, `no_sertifikat`, `total_ppn`, `no_kwitansi`, `tgl_pelaksanaan`, `periode`, `tgl_bayar`) VALUES
('PT. ANEKA RIMBA INDONUSA', 1, 'inv.001', '2017-01-22', 'serti, serti2', 18425.00, '123456', '23, 24 Jan 2017', '2017-01-31', NULL),
('PT. SUKSES INDOTRAN PERKASA', 2, 'inv.002', '2017-01-24', 'ser.002', 3142150.00, '123456', '01, 02, 03 Feb 2017', '2017-02-01', NULL),
('PT. ANEKA RIMBA INDONUSA', 3, '12/SBA-AN/I/2017', '2017-01-02', '0128531', 51975000.00, 'A. 002546', '26, 22, 10, 15, 07, 07 Feb 2017', '2017-01-31', '2017-03-01'),
('PT. ANEKA RIMBA INDONUSA', 4, '12/SBA-AN/I/2017', '2017-01-02', '0128531', 2024220.00, 'A. 002546', '15 Feb 2017', '2017-01-31', NULL),
('PT. ANEKA RIMBA INDONUSA', 5, '12/SBA-AN/I/2017', '2017-01-02', '0128531', 27225000.00, 'A. 002546', '07 Feb 2017', '2017-01-31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `v_rekap_invoice_ppn`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_rekap_invoice_ppn` AS select `db_armanda2`.`t_invoice`.`tanggal` AS `tanggal`,`db_armanda2`.`t_customer`.`nama` AS `nama`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`no_referensi` AS `no_referensi`,((`db_armanda2`.`t_invoice`.`ppn` / 100) * `db_armanda2`.`t_invoice`.`total`) AS `nilai_ppn`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id`,`db_armanda2`.`t_invoice`.`periode` AS `periode` from (`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) where (`db_armanda2`.`t_invoice`.`ppn` <> 0);

--
-- Dumping data for table `v_rekap_invoice_ppn`
--

INSERT INTO `v_rekap_invoice_ppn` (`tanggal`, `nama`, `no_kwitansi`, `nomor`, `no_referensi`, `nilai_ppn`, `total_ppn`, `invoice_id`, `periode`) VALUES
('2017-01-22', 'PT. ANEKA RIMBA INDONUSA', '123456', 'inv.001', 'ref.001', 1675.0000, 18425.00, 1, '2017-01-31'),
('2017-01-24', 'PT. SUKSES INDOTRAN PERKASA', '123456', 'inv.002', 'ref.002', 285650.0000, 3142150.00, 2, '2017-02-01'),
('2017-01-02', 'PT. ANEKA RIMBA INDONUSA', 'A. 002546', '12/SBA-AN/I/2017', '02.170.011.7-609.000', 4725000.0000, 51975000.00, 3, '2017-01-31'),
('2017-01-02', 'PT. ANEKA RIMBA INDONUSA', 'A. 002546', '12/SBA-AN/I/2017', '02.170.011.7-609.000', 184020.0000, 2024220.00, 4, '2017-01-31'),
('2017-01-02', 'PT. ANEKA RIMBA INDONUSA', 'A. 002546', '12/SBA-AN/I/2017', '02.170.011.7-609.001', 2475000.0000, 27225000.00, 5, '2017-01-31');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
