-- Membuat Sebuah Basis Data dengan format penamaan: BasisData_NamaMahasiswa

Create database BasisData_AldiWijaya;
use BasisData_AldiWijaya;

-- Membuat Tabel-Tabel
CREATE TABLE Produk (
    idproduk VARCHAR(10) PRIMARY KEY,
    namaproduk VARCHAR(100) NOT NULL,
    kategori VARCHAR(100),
    satuan VARCHAR(50),
    harga INT NOT NULL,
    stok INT NOT NULL
);

CREATE TABLE Pelanggan (
    idpelanggan VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    notelp VARCHAR(15)
);

CREATE TABLE Transaksi (
    idtransaksi VARCHAR(10) PRIMARY KEY,
    idpelanggan VARCHAR(10),
    tanggal DATE NOT NULL,
    FOREIGN KEY (idpelanggan) REFERENCES Pelanggan(idpelanggan)
);

CREATE TABLE DetailTransaksi (
    idtransaksi VARCHAR(10),
    idproduk VARCHAR(10),
    jumlah INT NOT NULL,
    FOREIGN KEY (idtransaksi) REFERENCES Transaksi(idtransaksi),
    FOREIGN KEY (idproduk) REFERENCES Produk(idproduk)
);


-- Mengisi Tabel-Tabel dengan Data yang ada
INSERT INTO Produk (idproduk, namaproduk, kategori, satuan, harga, stok) VALUES
('BP-BR-001', 'Beras Ramos 5kg', 'Beras', 'sak', 65000, 100),
('BP-MN-002', 'Minyak Goreng 2L', 'Minyak', 'botol', 30000, 80),
('BP-TL-003', 'Telur Ayam 1kg', 'Telur', 'kg', 25000, 150),
('BP-GL-004', 'Gula Pasir 1kg', 'Gula', 'kg', 14000, 200),
('BP-TP-005', 'Tepung Terigu 1kg', 'Tepung', 'kg', 11000, 120),
('BP-GR-006', 'Garam Halus 500g', 'Bumbu', 'pak', 4000, 250),
('BP-GR-007', 'Kecap Manis 600ml', 'Bumbu', 'botol', 16000, 90),
('BP-SU-008', 'Susu Kental Manis', 'Susu', 'kaleng', 12000, 70),
('BP-SY-009', 'Cabe Rawit 250g', 'Sayur', 'pak', 9000, 60),
('BP-SY-010', 'Bawang Merah 1kg', 'Sayur', 'kg', 27000, 100);


INSERT INTO Pelanggan (idpelanggan, nama, alamat, notelp) VALUES
('PL-JK-001', 'Desi Pibriana', 'Jakarta', '081112348765'),
('PL-BD-002', 'Sari Wulandari', 'Bandung', '082212345679'),
('PL-SB-003', 'Dedi Hartono', 'Surabaya', '083212345680'),
('PL-YG-004', 'Lestari Dewi', 'Yogyakarta', '084212345681'),
('PL-ML-005', 'Agus Pranoto', 'Malang', '085212345682'),
('PL-SM-006', 'Rahmat Hidayat', 'Semarang', '086212345683'),
('PL-MD-007', 'Nia Fitriani', 'Medan', '087212345684'),
('PL-BT-008', 'Diana Ayu', 'Banten', '088212345685'),
('PL-PK-009', 'Zaki Alfarizi', 'Pekanbaru', '089212345686'),
('PL-MK-010', 'Siska Novita', 'Makassar', '081212345687');


INSERT INTO Transaksi (idtransaksi, idpelanggan, tanggal) VALUES
('TR-01', 'PL-JK-001', '2026-04-01'),
('TR-02', 'PL-BD-002', '2026-04-01'),
('TR-03', 'PL-SB-003', '2026-04-02'),
('TR-04', 'PL-YG-004', '2026-04-02'),
('TR-05', 'PL-ML-005', '2026-04-02'),
('TR-06', 'PL-SM-006', '2026-04-03'),
('TR-07', 'PL-MD-007', '2026-04-04'),
('TR-08', 'PL-BT-008', '2026-04-04'),
('TR-09', 'PL-PK-009', '2026-04-04'),
('TR-10', 'PL-MK-010', '2026-04-05');


INSERT INTO DetailTransaksi (idtransaksi, idproduk, jumlah) VALUES
('TR-01', 'BP-BR-001', 1),
('TR-01', 'BP-TL-003', 1),
('TR-01', 'BP-GR-006', 1),
('TR-02', 'BP-MN-002', 1),
('TR-02', 'BP-TP-005', 2),
('TR-03', 'BP-SY-010', 2),
('TR-03', 'BP-GR-007', 1),
('TR-04', 'BP-BR-001', 1),
('TR-04', 'BP-GR-006', 1),
('TR-05', 'BP-TL-003', 1);

Select * from produk;
Select * from pelanggan;
Select * from transaksi;
Select * from detailtransaksi;

-- Menghapus kolom Kategori dari tabel produk
Alter Table produk drop kategori;
-- =================================================================================================================================
Select * from produk;
Select * from pelanggan;
Select * from transaksi;
Select * from detailtransaksi;
-- =========================================================== BELAJAR VIEW ========================================================

-- 1.	Buatlah View Untuk Menampilkan seluruh data produk yang telah menipis di gudang, 
-- kemudian urutkan berdasarkan nama produk secara menaik. 
-- (Dikatakan menipis apabila stoknya kurang dari 100). - (10 Point)
Select * from produk;
Select * from produk
Where stok < 100
order by namaproduk ASC;

-- SINTAKS VIEW:
create view no1 as 
select * from produk 
Where stok < 100
order by namaproduk ASC;

select * from no1; -- no1 adalah nama view
drop view no1;


-- 2.	Buatlah View Untuk Menampilkan  tanggal dan Jumlah id transaksi yang bertransaksi di tanggal tersebut (jumlah transaksi Per Hari), 
-- kemudian kelompokkan dan urutkan berdasarkan tanggal secara menaik. — (10 Point)
Select * from transaksi;

select tanggal, COUNT(idtransaksi) as 'Jumlah Transaksi Per Hari'
From transaksi
Group By tanggal
ORDER By tanggal ASC;

-- SINTAKS VIEW:
create view no2 as
select tanggal, COUNT(idtransaksi) as 'Jumlah Transaksi Per Hari'
From transaksi
Group By tanggal
ORDER By tanggal ASC;
select * from no2;


Select * from produk;
Select * from pelanggan;
Select * from transaksi;
Select * from detailtransaksi;

-- 3. Buatlah View Untuk Menampilkan seluruh data produk(id, nama, satuan, harga dan stok produk) yang belum pernah dibeli oleh pelanggan. (20 Point)

Select * from produk;
Select * from detailtransaksi;
-- ========================
Select produk.idproduk, namaproduk, satuan, harga, stok
From Produk
LEFT JOIN detailtransaksi ON produk.idproduk = detailtransaksi.idproduk
Where detailtransaksi.idproduk is null;

-- SINTAKS VIEW:
create view no3 as
Select produk.idproduk, namaproduk, satuan, harga, stok
From Produk
LEFT JOIN detailtransaksi ON produk.idproduk = detailtransaksi.idproduk
Where detailtransaksi.idproduk is null;
select * from no3;


-- 4.	Buatlah View Untuk Menampilkan ID Produk, Nama Produk, Kategori, Harga dan jumlah Produk yang dibeli dengan jumlah lebih dari 1. 
-- Adapun Kategori Produk dapat dikategorikan sebagai berikut. (20 Point)
-- •	Jika Karakter Ke-4 dan Ke-5 adalah "BR", Maka kategori produknya adalah "Beras"
-- •	Jika Karakter Ke-4 dan Ke-5 adalah "GR", kategori produknya adalah "Bumbu"
-- •	Jika Karakter Ke-4 dan Ke-5 adalah "GL", Maka kategori produknya adalah "Gula"
-- •	Jika Karakter Ke-4 dan Ke-5 adalah "MN", kategori produknya adalah "Minyak"
-- •	Jika Karakter Ke-4 dan Ke-5 adalah "SY", kategori produknya adalah "Sayur"
-- •	Jika Karakter Ke-4 dan Ke-5 adalah "SU", kategori produknya adalah "Susu"
-- •	Jika Karakter Ke-4 dan Ke-5 adalah "TL", kategori produknya adalah "Telur"
-- •	Jika Karakter Ke-4 dan Ke-5 adalah "TP", kategori produknya adalah "Tepung"
-- •	Jika bukan diantara kategori produk yang telah disebutkan, artinya kategori produk tersebut belum terdaftar.
-- Setelah itu, urutkan berdasarkan Nama Produknya secara menaik.

Select produk.idproduk, namaproduk, CASE
WHEN substr(produk.idproduk, 4, 2) = 'BR' THEN 'Beras'
WHEN substr(produk.idproduk, 4, 2) = 'GR' THEN 'Bumbu'
WHEN substr(produk.idproduk, 4, 2) = 'GL' THEN 'Gula'
WHEN substr(produk.idproduk, 4, 2) = 'MN' THEN 'Minyak'
WHEN substr(produk.idproduk, 4, 2) = 'SY' THEN 'Sayur'
WHEN substr(produk.idproduk, 4, 2) = 'SU' THEN 'Susu'
WHEN substr(produk.idproduk, 4, 2) = 'TL' THEN 'Telur'
WHEN substr(produk.idproduk, 4, 2) = 'TP' THEN 'Tepung'
ELSE 'Belum Terdaftar' 
END AS 'Kategori Produk', harga, jumlah
From Produk
JOIN detailtransaksi ON produk.idproduk = detailtransaksi.idproduk
Where jumlah > 1
Order by namaproduk asc;


-- SINTAKS VIEW:
create view no4 as
Select produk.idproduk, namaproduk, CASE
WHEN substr(produk.idproduk, 4, 2) = 'BR' THEN 'Beras'
WHEN substr(produk.idproduk, 4, 2) = 'GR' THEN 'Bumbu'
WHEN substr(produk.idproduk, 4, 2) = 'GL' THEN 'Gula'
WHEN substr(produk.idproduk, 4, 2) = 'MN' THEN 'Minyak'
WHEN substr(produk.idproduk, 4, 2) = 'SY' THEN 'Sayur'
WHEN substr(produk.idproduk, 4, 2) = 'SU' THEN 'Susu'
WHEN substr(produk.idproduk, 4, 2) = 'TL' THEN 'Telur'
WHEN substr(produk.idproduk, 4, 2) = 'TP' THEN 'Tepung'
ELSE 'Belum Terdaftar' 
END AS 'Kategori Produk', harga, jumlah
From Produk
JOIN detailtransaksi ON produk.idproduk = detailtransaksi.idproduk
Where jumlah > 1
Order by namaproduk asc;
select * from no4;


-- 5) Buatlah View Untuk Menampilkan seluruh data pelanggan yang pernah bertransaksi lalu urutkan berdasarkan Nama Pelanggan secara Menaik-- (20 Point)
Select pelanggan.idpelanggan, nama, alamat, notelp
From pelanggan
LEFT JOIN transaksi ON pelanggan.idpelanggan = transaksi.idpelanggan
order by nama ASC;


-- SINTAKS VIEW:
create view no5 as
Select pelanggan.idpelanggan, nama, alamat, notelp
From pelanggan
LEFT JOIN transaksi ON pelanggan.idpelanggan = transaksi.idpelanggan
order by nama ASC;
select * from no5;


-- 6) Buatlah View Untuk Menampilkan id transaksi dan Total uang yang harus dibayar oleh pelanggan per id transaksinya.
--  Adapun Total uang yang harus dibayar oleh pelanggan didapatkan dengan 
--  menjumlahkan hasil dari harga produk dikali jumlah transaksi (20 Point)

select idtransaksi, (harga*jumlah) 'Total Uang yang harus dibayar Pelanggan'
From Produk
JOIN Detailtransaksi ON Produk.idproduk = Detailtransaksi.idproduk
Group by idtransaksi;

-- SINTAKS VIEW:
create view no6 as
select idtransaksi, SUM(harga*jumlah) 'Total Uang yang harus dibayar Pelanggan'
From Produk
JOIN Detailtransaksi ON Produk.idproduk = Detailtransaksi.idproduk
Group by idtransaksi;
select * from no6;

-- Buatlah View Untuk Menampilkan tanggal transaksi dan nama pelanggan yang pernah transaksi lalu cari yang namanya awalannya S atau akhiran a. (20 Point)
Select pelanggan.nama, transaksi.tanggal
From pelanggan
JOIN transaksi ON pelanggan.idpelanggan = transaksi.idpelanggan
where pelanggan.nama like 's%' or pelanggan.nama like '%a';

-- sintaks view: 
create view test as
Select pelanggan.nama, transaksi.tanggal
From pelanggan
JOIN transaksi ON pelanggan.idpelanggan = transaksi.idpelanggan
where pelanggan.nama like 's%' or pelanggan.nama like '%a';
select * from test;

drop view test;


-- ================================================== BELAJAR PROSEDUR ============================================================
Select * from produk;
Select * from pelanggan;
Select * from transaksi;
Select * from detailtransaksi;

-- ================================================== PROSEDUR TANPA PARAMETER ====================================================

-- Contoh 1. Buat Prosedur untuk memanggil seluruh data Produk yang harganya antara 15000 sampai dengan 30000
DELIMITER //
create procedure DataProduk()
begin
	Select * from produk where harga between 15000 and 30000;
end  // 
DELIMITER ;

call DataProduk();
drop procedure DataProduk;




-- ================================================== PROSEDUR DENGAN PARAMETER ====================================================
-- Buat Prosedur untuk memanggil seluruh data Produk yang harganya antara harga tertentu,
-- harga ini ditentukan ole User secara langsung.



-- ================================================== LATIHAN PROSEDUR ============================================================
-- 1. Buatlah prosedur untuk input Seluruh data produk
DELIMITER //
begin
	 
end  // 
DELIMITER ;
-- 2. Buatlah prosedur untuk input Seluruh data pelanggan
-- 3. Buatlah prosedur untuk input Seluruh data Transaksi
-- 4. Buatlah Prosedur untuk input seluruh data DetailTransaksi
-- 5. Buatlah prosedur untuk delete data produk
-- 6. Buatlah prosedur untuk delete data pelanggan
-- 7. Buatlah prosedur untuk delete data Transaksi
-- 8. Buatlah Prosedur untuk delete data DetailTransaksi
-- 9. Buatlah prosedur untuk Update data produk (Data yang diupdate dapat apa saja selain dari primary key)
-- 10. Buatlah prosedur untuk Update data pelanggan (Data yang diupdate dapat apa saja selain dari primary key)
-- 11. Buatlah prosedur untuk Update data Transaksi (Data yang diupdate dapat apa saja selain dari primary key/ Foreign Key)
-- 12. Buatlah Prosedur untuk Update data DetailTransaksi (Data yang diupdate dapat apa saja selain dari primary key/ Foreign Key)
































-- =================================================BELAJAR FUNGSI================================================================================
-- Buat Prosedur Hitung Diskon untuk menampilkan data transaksi dan TotalBayar 
-- dengan ketentuan: Apabila Total belanja Lebih dari 100000 maka akan didiskon 10%. 
-- Total belanja kurang dari itu, maka diskon hanya diberikan sebesar 5%.
-- Berikan user kebebasan untuk input ID Transaksi yang ingin ia ketahui.













    
    
-- Prosedur ganjil genap




-- ==================================================== BELAJAR FUNGSI ====================================================
-- Fungsi Tanpa Parameter untuk Menghitung Luas Persegi Panjang