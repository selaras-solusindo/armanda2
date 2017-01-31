Select t_customer.nama,
  v_invoice_pelaksanaan.tgl_pelaksanaan,
  t_invoice.no_kwitansi,
  t_invoice.nomor,
  t_invoice.total_ppn,
  t_invoice.invoice_id
From t_invoice
  Inner Join t_customer On t_invoice.customer_id = t_customer.customer_id
  Inner Join v_invoice_pelaksanaan On t_invoice.invoice_id =
    v_invoice_pelaksanaan.invoice_id
Where t_invoice.terbayar = 0
