-- Jalankan SEKALI pada database mugnesia_app setelah backup.
USE mugnesia_app;
ALTER TABLE kwitansi_item
  ADD COLUMN hpp DECIMAL(15,2) NOT NULL DEFAULT 0 AFTER qty,
  ADD COLUMN laba_satuan DECIMAL(15,2) NOT NULL DEFAULT 0 AFTER harga,
  ADD COLUMN total_laba DECIMAL(15,2) NOT NULL DEFAULT 0 AFTER subtotal;
-- Data lama: HPP tetap 0 karena biaya historis belum diketahui.
-- Jangan gunakan laba historis sebagai laporan laba akurat sebelum HPP lama dilengkapi.
