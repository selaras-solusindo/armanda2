SELECT t_customer.nama AS nama,
  t_invoice.invoice_id AS invoice_id,
  t_invoice.nomor AS nomor,
  t_invoice.tanggal AS tanggal,
  t_invoice.no_sertifikat AS no_sertifikat,
  t_invoice.total_ppn AS total_ppn,
  t_invoice.no_kwitansi AS no_kwitansi,
  v_invoice_pelaksanaan.tgl_pelaksanaan AS tgl_pelaksanaan,
  t_invoice.periode AS periode,
  t_invoice.tgl_bayar AS tgl_bayar
FROM (t_invoice
  JOIN t_customer ON t_invoice.customer_id = t_customer.customer_id)
  left JOIN v_invoice_pelaksanaan ON t_invoice.invoice_id =
    v_invoice_pelaksanaan.invoice_id
