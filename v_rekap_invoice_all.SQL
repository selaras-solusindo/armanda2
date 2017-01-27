Select t_customer.nama As nama, t_invoice.invoice_id As invoice_id, t_invoice.nomor As nomor, t_invoice.tanggal As tanggal, t_invoice.no_sertifikat As no_sertifikat, t_invoice.total_ppn As total_ppn, t_invoice.no_kwitansi As no_kwitansi, v_invoice_pelaksanaan.tgl_pelaksanaan As tgl_pelaksanaan From (t_invoice Join t_customer On t_invoice.customer_id = t_customer.customer_id) Join v_invoice_pelaksanaan On t_invoice.invoice_id = v_invoice_pelaksanaan.invoice_id