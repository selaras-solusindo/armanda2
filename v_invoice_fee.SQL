Select t_customer.nama As nama,
  t_customer.alamat As alamat,
  t_customer.kota As kota,
  t_customer.kodepos As kodepos,
  t_customer.npwp As npwp,
  t_invoice.invoice_id As invoice_id,
  t_invoice.nomor As nomor,
  t_invoice.tanggal As tanggal,
  t_invoice.no_order As no_order,
  t_invoice.no_referensi As no_referensi,
  t_invoice.kegiatan As kegiatan,
  t_invoice.no_sertifikat As no_sertifikat,
  t_invoice.keterangan As keterangan,
  t_invoice.total As total,
  t_invoice.ppn As ppn,
  t_invoice.total_ppn As total_ppn,
  t_invoice.terbilang As terbilang,
  t_invoice.terbayar As terbayar,
  t_invoice.pasal23 As pasal23,
  t_invoice.no_kwitansi As no_kwitansi,
  t_fee.jenis As jenis,
  t_invoice_fee.harga As harga,
  t_invoice_fee.qty As qty,
  t_invoice_fee.satuan As satuan,
  t_invoice_fee.jumlah As jumlah,
  t_invoice_fee.keterangan As keterangan1,
  v_invoice_pelaksanaan.tgl_pelaksanaan As tgl_pelaksanaan
From ((t_invoice
  Join t_customer On t_invoice.customer_id = t_customer.customer_id)
  Join t_invoice_fee On t_invoice.invoice_id = t_invoice_fee.invoice_id)
  Join t_fee On t_invoice_fee.fee_id = t_fee.fee_id
  Inner Join v_invoice_pelaksanaan On t_invoice.invoice_id =
    v_invoice_pelaksanaan.invoice_id
