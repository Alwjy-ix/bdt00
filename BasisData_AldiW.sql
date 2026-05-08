-- Membuat Sebuah Basis Data dengan format penamaan: BasisData_NamaMahasiswa
drop database BasisData_NamaMahasiswa2;
Create database BasisData_NamaMahasiswa2;
use BasisData_NamaMahasiswa2;

repair table mysql.proc;

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


-- 2.	Buatlah View Untuk Menampilkan  tanggal dan Jumlah id transaksi yang bertransaksi di tanggal tersebut (jumlah transaksi Per Hari), 
-- kemudian kelompokkan dan urutkan berdasarkan tanggal secara menaik. — (10 Point)
Select * from transaksi;

select tanggal, COUNT(idtransaksi) as 'Jumlah Transaksi Per Hari'
From transaksi
Group By tanggal
ORDER By tanggal ASC;

-- SINTAKS VIEW:




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



-- 5) Buatlah View Untuk Menampilkan seluruh data pelanggan yang pernah bertransaksi lalu urutkan berdasarkan Nama Pelanggan secara Menaik-- (20 Point)
Select pelanggan.idpelanggan, nama, alamat, notelp
From pelanggan
LEFT JOIN transaksi ON pelanggan.idpelanggan = transaksi.idpelanggan
order by nama ASC;


-- SINTAKS VIEW:



-- 6) Buatlah View Untuk Menampilkan id transaksi dan Total uang yang harus dibayar oleh pelanggan per id transaksinya.
--  Adapun Total uang yang harus dibayar oleh pelanggan didapatkan dengan 
--  menjumlahkan hasil dari harga produk dikali jumlah transaksi (20 Point)

select idtransaksi, SUM(harga*jumlah) 'Total Uang yang harus dibayar Pelanggan'
From Produk
JOIN Detailtransaksi ON Produk.idproduk = Detailtransaksi.idproduk
Group by idtransaksi;

-- SINTAKS VIEW:



-- ================================================== BELAJAR PROSEDUR ============================================================
Select * from produk;
Select * from pelanggan;
Select * from transaksi;
Select * from detailtransaksi;

-- ================================================== PROSEDUR TANPA PARAMETER ====================================================

-- Contoh 1. Buat Prosedur untuk memanggil seluruh data Produk yang harganya antara 15000 sampai dengan 30000




-- ================================================== PROSEDUR DENGAN PARAMETER ====================================================
-- Buat Prosedur untuk memanggil seluruh data Produk yang harganya antara harga tertentu,
-- harga ini ditentukan ole User secara langsung.



-- ================================================== LATIHAN PROSEDUR ============================================================
-- 1. Buatlah prosedur untuk input Seluruh data produk
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



-- =================================================LATIHAN PROSEDUR IN ================================================================================
-- Buat Prosedur Hitung Diskon untuk menampilkan data id Transaksi, Total bayar transaksi.
-- dengan ketentuan: Apabila Total belanja Lebih dari 100000 maka total bayar akan didiskon 10%. 
-- Total belanja kurang dari itu, maka diskon total bayar hanya diberikan sebesar 5%.
-- Berikan user kebebasan untuk input ID Transaksi yang ingin ia ketahui.
-- Kolom hasil yang ditampilkan adalah: ID Transaksi, Total Bayar (Jumlah beli * Harga) serta Total Bayar Setelah Diskon
Delimiter //
Create procedure HitungDiskonTransaksi(in IdInput varchar(10))
begin
	declare totalBelanja int;
    declare totalAkhir int;
    -- menhitung total bayar lalu masukkan ke totalBelanja
    select sum(produk.harga * DetailTransaksi.jumlah) into totalBelanja
    from DetailTransaksi
    join produk on DetailTransaksi.idproduk = produk.idproduk
    where DetailTransaksi.idtransaksi = idinput;
    
    if totalBelanja > 100000 then
		set totalAkhir = totalBelanja * 0.9;
	else 
		set totalAkhir = totalBelanja * 0.95;
	end if;
    -- tampilkan hasil
    select idInput as 'id transaksi', totalBelanja as 'Total Bayar', totalAkhir as 'total bayar setelah diskon';

end //
Delimiter ;
-- panggil
call hitungDiskonTransaksi('TR-01');
call hitungDiskonTransaksi('TR-02');

select * from detailtransaksi;
select * from produk;

-- ====================================== LATIHAN Procedure IN OUT ======================================================
-- Buat Procedure untuk Menampilkan ID Transaksi dan hasil perhitungan Total Bayar (jumlah beli * harga)
-- Adapun Parameter yang diinputkan berupa ID Transaksi (Sebagai Parameter IN) dan TotalBayar (Sebagai Parameter OUT)
Delimiter //
create procedure totalBayarInOut(in inputId varchar(10), out totalBelanja int)
begin
select inputId,sum(produk.harga * detailtransaksi.jumlah) as totalBelanja
from detailTransaksi
join produk on detailtransaksi.idproduk = produk.idproduk
where detailtransaksi.idtransaksi = inputId;

end //
Delimiter ;
drop procedure totalBayarInOut;
-- panggil procedure
call totalBayarInOut('TR-02', @bayar);






-- ==================================================== BELAJAR FUNGSI ====================================================
-- Buatlah Fungsi Untuk Menghitung Luas Persegi Panjang TANPA PARAMETER
DELIMITER //
create function hitungLuasPP()
returns INT
DETERMINISTIC
begin
	declare panjang int default 10;
    declare lebar int default 5;
    return panjang * lebar;
end //
DELIMITER ;

select hitungLuasPP(); -- panggil fungsi
-- Buatlah Fungsi Untuk Menghitung Luas Persegi Panjang MENGGUNAKAN PARAMETER
drop function luasPP;
DELIMITER //
create function luasPP(panjang int, lebar int)
returns int
deterministic
begin
	return panjang * lebar;
end //
DELIMITER ;
select luasPP(10, 3) as 'luasPersegiPanjang';

-- Buatkan Fungsi untuk menghitung Total Harga TANPA Parameter (Harga * jumlah)
Delimiter //
create function totalHarga()
returns int
deterministic
begin
	declare harga int default 20000;
    declare jumlah int default 3;
    return harga*jumlah;
end //
Delimiter ;
select totalHarga();


-- Buatkan Fungsi untuk menghitung Total Harga DENGAN Parameter (Harga * jumlah)
drop function HitungTotalHarga;
DELIMITER //
create function HitungTotalHarga(harga int, jumlah int)
returns int
deterministic
begin
	return harga * jumlah;
end //
DELIMITER ;
select HitungTotalHarga(20000, 4) as 'TotalHarga';

-- Setelah membuat Fungsi untuk menghitung Total Harga DENGAN Parameter (Harga * jumlah),
-- Masukkan Fungsi HitungTotalDP ke dalam pemanggilan data menggunakan tabel yang ada dengan:
-- 1. Menampilkan ID transaksi, ID Produk, Nama Produk, Harga, Jumlah dan HitungTotalHargaDP.


-- 2. Menampilkan ID transaksi, dan akumulasi dari HitungTotalHargaDP dan kelompokkan per id Transaksinya.




-- ========================================== LATIHAN MEMBUAT FUNGSI =============================================
Select * from produk;
Select * from pelanggan;
Select * from transaksi;
Select * from detailtransaksi;
-- Buatkan Sebuah Fungsi untuk Menghitung Diskon 10% dari IDTransaksi Tertentu
-- Pertimbangkan Juga untuk Mengembalikan Nilai 0 untuk transaksi yang Tidak ada.
-- Sintaks SQL yang dapat mengjitung Function SUM(jumlah * harga) * 0.9:
SELECT detailtransaksi.idtransaksi, detailtransaksi.idproduk, harga, jumlah, SUM(jumlah * harga) AS TotalBayar, SUM(jumlah * harga) * 0.9 AS TotalSetelahDiskon
    FROM detailtransaksi
    JOIN produk ON Detailtransaksi.idproduk = Produk.idproduk
    WHERE detailtransaksi.idtransaksi = idtransaksi
    group by idtransaksi;



-- Buatkan Fungsi untuk Diskon yang dapat ditentukan kemudian oleh User untuk ID Transaksi Tertentu