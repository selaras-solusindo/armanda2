

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_invoice_fee` AS select `db_armanda2`.`t_customer`.`nama` AS `nama`,`db_armanda2`.`t_customer`.`alamat` AS `alamat`,`db_armanda2`.`t_customer`.`kota` AS `kota`,`db_armanda2`.`t_customer`.`kodepos` AS `kodepos`,`db_armanda2`.`t_customer`.`npwp` AS `npwp`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`tanggal` AS `tanggal`,`db_armanda2`.`t_invoice`.`no_order` AS `no_order`,`db_armanda2`.`t_invoice`.`no_referensi` AS `no_referensi`,`db_armanda2`.`t_invoice`.`kegiatan` AS `kegiatan`,`db_armanda2`.`t_invoice`.`no_sertifikat` AS `no_sertifikat`,`db_armanda2`.`t_invoice`.`keterangan` AS `keterangan`,`db_armanda2`.`t_invoice`.`total` AS `total`,`db_armanda2`.`t_invoice`.`ppn` AS `ppn`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`terbilang` AS `terbilang`,`db_armanda2`.`t_invoice`.`terbayar` AS `terbayar`,`db_armanda2`.`t_invoice`.`pasal23` AS `pasal23`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`db_armanda2`.`t_fee`.`jenis` AS `jenis`,`db_armanda2`.`t_invoice_fee`.`harga` AS `harga`,`db_armanda2`.`t_invoice_fee`.`qty` AS `qty`,`db_armanda2`.`t_invoice_fee`.`satuan` AS `satuan`,`db_armanda2`.`t_invoice_fee`.`jumlah` AS `jumlah`,`db_armanda2`.`t_invoice_fee`.`keterangan` AS `keterangan1`,`v_invoice_pelaksanaan`.`tgl_pelaksanaan` AS `tgl_pelaksanaan` from ((((`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) left join `db_armanda2`.`t_invoice_fee` on((`db_armanda2`.`t_invoice`.`invoice_id` = `db_armanda2`.`t_invoice_fee`.`invoice_id`))) left join `db_armanda2`.`t_fee` on((`db_armanda2`.`t_invoice_fee`.`fee_id` = `db_armanda2`.`t_fee`.`fee_id`))) left join `db_armanda2`.`v_invoice_pelaksanaan` on((`db_armanda2`.`t_invoice`.`invoice_id` = `v_invoice_pelaksanaan`.`invoice_id`)));
--------------------------------------------------------

--
-- Table structure for table `v_invoice_pelaksanaan`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_invoice_pelaksanaan` AS select `db_armanda2`.`t_invoice_pelaksanaan`.`invoice_id` AS `invoice_id`,concat(group_concat(date_format(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`,'%d') separator ', '),' ',date_format(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`,'%b'),' ',date_format(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`,'%Y')) AS `tgl_pelaksanaan` from `db_armanda2`.`t_invoice_pelaksanaan` group by `db_armanda2`.`t_invoice_pelaksanaan`.`invoice_id`,concat(month(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`),year(`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`)) order by `db_armanda2`.`t_invoice_pelaksanaan`.`invoice_id`,`db_armanda2`.`t_invoice_pelaksanaan`.`tanggal`;


-- --------------------------------------------------------

--
-- Table structure for table `v_rekap_hutang`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_rekap_hutang` AS select `db_armanda2`.`t_customer`.`nama` AS `nama`,`v_invoice_pelaksanaan`.`tgl_pelaksanaan` AS `tgl_pelaksanaan`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id` from ((`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) left join `db_armanda2`.`v_invoice_pelaksanaan` on((`db_armanda2`.`t_invoice`.`invoice_id` = `v_invoice_pelaksanaan`.`invoice_id`))) where (`db_armanda2`.`t_invoice`.`terbayar` = 0);

--
-- Dumping data for table `v_rekap_hutang`
--

-- --------------------------------------------------------

--
-- Table structure for table `v_rekap_invoice_all`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_rekap_invoice_all` AS select `db_armanda2`.`t_customer`.`nama` AS `nama`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`tanggal` AS `tanggal`,`db_armanda2`.`t_invoice`.`no_sertifikat` AS `no_sertifikat`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`v_invoice_pelaksanaan`.`tgl_pelaksanaan` AS `tgl_pelaksanaan`,`db_armanda2`.`t_invoice`.`periode` AS `periode`,`db_armanda2`.`t_invoice`.`tgl_bayar` AS `tgl_bayar`,date_format(`db_armanda2`.`t_invoice`.`tanggal`,'%d %b %Y') AS `tanggal_short`,date_format(`db_armanda2`.`t_invoice`.`periode`,'%b %Y') AS `periode_short` from ((`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) left join `db_armanda2`.`v_invoice_pelaksanaan` on((`db_armanda2`.`t_invoice`.`invoice_id` = `v_invoice_pelaksanaan`.`invoice_id`)));


-- --------------------------------------------------------

--
-- Table structure for table `v_rekap_invoice_ppn`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `db_armanda2`.`v_rekap_invoice_ppn` AS select `db_armanda2`.`t_invoice`.`tanggal` AS `tanggal`,`db_armanda2`.`t_customer`.`nama` AS `nama`,`db_armanda2`.`t_invoice`.`no_kwitansi` AS `no_kwitansi`,`db_armanda2`.`t_invoice`.`nomor` AS `nomor`,`db_armanda2`.`t_invoice`.`no_referensi` AS `no_referensi`,((`db_armanda2`.`t_invoice`.`ppn` / 100) * `db_armanda2`.`t_invoice`.`total`) AS `nilai_ppn`,`db_armanda2`.`t_invoice`.`total_ppn` AS `total_ppn`,`db_armanda2`.`t_invoice`.`invoice_id` AS `invoice_id`,`db_armanda2`.`t_invoice`.`periode` AS `periode`,date_format(`db_armanda2`.`t_invoice`.`tanggal`,'%d %b %Y') AS `tanggal_short`,date_format(`db_armanda2`.`t_invoice`.`periode`,'%b %Y') AS `periode_short` from (`db_armanda2`.`t_invoice` join `db_armanda2`.`t_customer` on((`db_armanda2`.`t_invoice`.`customer_id` = `db_armanda2`.`t_customer`.`customer_id`))) where (`db_armanda2`.`t_invoice`.`ppn` <> 0);

--
-- Dumping data for table `v_rekap_invoice_ppn`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
