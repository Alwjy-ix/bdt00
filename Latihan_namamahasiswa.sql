-- Membuat Sebuah Basis Data dengan format penamaan: Latihan_namamahasiswa

Create database Latihan_namamahasiswa;
use Latihan_namamahasiswa;
drop database Latihan_namamahasiswa;


show tables;

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
Create View No1UTS As
Select * from produk
Where stok < 100
order by namaproduk ASC;

Select * from No1UTS;

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

DELIMITER //
Create Procedure CariProdukBerdasarkanHarga ()
BEGIN
	Select * From Produk Where Harga Between 15000 and 30000;
END //
DELIMITER ;

CALL CariProdukBerdasarkanHarga();

-- ================================================== PROSEDUR DENGAN PARAMETER ====================================================
-- Buat Prosedur untuk memanggil seluruh data Produk yang harganya antara harga tertentu,
-- harga ini ditentukan ole User secara langsung.

DELIMITER //
Create Procedure CariProdukBerdasarkanHargaTertentu(hargaawal int, hargaakhir int)
BEGIN
	Select * From Produk Where Harga Between hargaawal and hargaakhir;
END //
DELIMITER ;

CALL CariProdukBerdasarkanHargaTertentu(15000, 30000);

-- ================================================== LATIHAN PROSEDUR ============================================================
-- 1. Buatlah prosedur untuk input Seluruh data produk
select * from produk;
Desc produk;
DELIMITER //
Create Procedure InputDataProduk (
	idProdukI Varchar(10),
    NamaProdukI Varchar(100),
    KategoriI Varchar(100),
    SatuanI Varchar(50),
    HargaI Int(11),
    StokI int(11)
)
BEGIN
	Insert Into Produk VALUES(idProdukI, NamaProdukI, KategoriI, SatuanI, HargaI, StokI);
END //
DELIMITER ;

CALL InputDataProduk('BP-MN-003','Minyak Goreng 1L','Minyak','Botol','18000','50');
select * from Produk;


-- 2. Buatlah prosedur untuk input Seluruh data pelanggan
-- 3. Buatlah prosedur untuk input Seluruh data Transaksi
-- 4. Buatlah Prosedur untuk input seluruh data DetailTransaksi
-- 5. Buatlah prosedur untuk delete data produk
-- 6. Buatlah prosedur untuk delete data pelanggan
-- 7. Buatlah prosedur untuk delete data Transaksi
-- 8. Buatlah Prosedur untuk delete data DetailTransaksi
-- 9. Buatlah prosedur untuk Update data produk (Data yang diupdate dapat apa saja selain dari primary key)
select * from produk;
Desc produk;
DELIMITER //
Create Procedure UpdateDataProduk (
	idProdukI Varchar(10),
    NamaProdukI Varchar(100),
    KategoriI Varchar(100),
    SatuanI Varchar(50),
    HargaI Int(11),
    StokI int(11)
)
BEGIN
	IF NamaProdukI is NOT NULL THEN
    Update Produk SET Namaproduk = NamaProdukI where idproduk = idProdukI;
    END IF;
    
	IF KategoriI is NOT NULL THEN
    Update Produk SET kategori = KategoriI  where idproduk = idProdukI;
    END IF;
    
    IF SatuanI is NOT NULL THEN
    Update Produk SET satuan = SatuanI  where idproduk = idProdukI;
    END IF;
    
    IF HargaI is NOT NULL THEN
    Update Produk SET harga = HargaI  where idproduk = idProdukI;
    END IF;
    
    IF StokI is NOT NULL THEN
    Update Produk SET Stok = StokI  where idproduk = idProdukI;
    END IF;
    
END //
DELIMITER ;

drop procedure UpdateDataProduk;

CALL UpdateDataProduk ('BP-GL-004', NULL, NULL, NULL, 20000,250);

select * from produk;



-- 10. Buatlah prosedur untuk Update data pelanggan (Data yang diupdate dapat apa saja selain dari primary key)


-- 11. Buatlah prosedur untuk Update data Transaksi (Data yang diupdate dapat apa saja selain dari primary key/ Foreign Key)
-- 12. Buatlah Prosedur untuk Update data DetailTransaksi (Data yang diupdate dapat apa saja selain dari primary key/ Foreign Key)



-- =================================================LATIHAN PROSEDUR IN ================================================================================
-- Buat Prosedur Hitung Diskon untuk menampilkan data id Transaksi, Total bayar transaksi.
-- dengan ketentuan: Apabila Total belanja Lebih dari 100000 maka total bayar akan didiskon 10%. 
-- Total belanja kurang dari itu, maka diskon total bayar hanya diberikan sebesar 5%.
-- Berikan user kebebasan untuk input ID Transaksi yang ingin ia ketahui.
-- Kolom hasil yang ditampilkan adalah: ID Transaksi, Total Bayar (Jumlah beli * Harga) serta Total Bayar Setelah Diskon

DELIMITER //
create procedure HitungDiskon(
IN IdTransaksiU VARCHAR(8))
BEGIN
	DECLARE TotalBayar int DEFAULT 0;
    
    -- Masukkan Nilai Total Transaksi ke Variabel Total Bayarnya untuk ID Transaksi yang diinputkan user
    Select SUM(jumlah * harga) INTO TotalBayar From Produk 
    JOIN DetailTransaksi ON Produk.IdProduk = DetailTransaksi.IdProduk
	Where IdTransaksi = IdTransaksiU;
    
    -- Lakukan Perbandingan Nilai Total Bayar untuk Menentukan Diskon yang cocok sesuai soal
    IF TotalBayar >= 100000 THEN 
		SET TotalBayar = TotalBayar * 0.9;
    ELSE 
		SET TotalBayar = TotalBayar  * 0.95;
	END IF ;
    
    -- Tampilkan Hasil yang diinginkan
    Select IdTransaksiU, TotalBayar;
    
END //

DELIMITER ;
drop procedure HitungDiskon;
CALL HitungDiskon('TR-01');


DELIMITER //
create procedure HitungDiskon1(
IN IdTransaksiU VARCHAR(8))
BEGIN
	DECLARE TotalBayar int DEFAULT 0;
    DECLARE TotalBayarSetelahDiskon int DEFAULT 0;
    
    -- Masukkan Nilai Total Transaksi ke Variabel Total Bayarnya untuk ID Transaksi yang diinputkan user
    Select SUM(jumlah * harga) INTO TotalBayar From Produk 
    JOIN DetailTransaksi ON Produk.IdProduk = DetailTransaksi.IdProduk
	Where IdTransaksi = IdTransaksiU;
    
    -- Lakukan Perbandingan Nilai Total Bayar untuk Menentukan Diskon yang cocok sesuai soal
    IF TotalBayar >= 100000 THEN 
		SET TotalBayarSetelahDiskon = TotalBayar * 0.9;
    ELSE 
		SET TotalBayarSetelahDiskon = TotalBayar  * 0.95;
	END IF ;
    
    -- Tampilkan Hasil yang diinginkan
    Select IdTransaksiU, TotalBayar, TotalBayarSetelahDiskon;
    
END //

DELIMITER ;
Drop procedure HitungDiskon1;
CALL HitungDiskon1('TR-01');

-- ========================================================================================================
Select * from produk;
Select * from DetailTransaksi;

-- ====================================== LATIHAN Procedure IN OUT ======================================================
-- Buat Procedure untuk Menampilkan ID Transaksi dan hasil perhitungan Total Bayar (jumlah beli * harga)
-- Adapun Parameter yang diinputkan berupa ID Transaksi (Sebagai Parameter IN) dan TotalBayar (Sebagai Parameter OUT)
DELIMITER //
create procedure HitungDiskon2(
IN IdTransaksiU VARCHAR(8), 
OUT TotalBayar int (11))
BEGIN
	Select idTransaksiU, sum(jumlah *  harga) as TotalBayar
    From Produk JOIN DetailTransaksi ON Produk.IdProduk = DetailTransaksi.IdProduk
    Where IdTransaksi = IdTransaksiU
    group by IdTransaksiU;
END //

DELIMITER ;

CALL HitungDiskon2('TR-01', @TotalBayar);
CALL HitungDiskon2('TR-02',@TotalBayar);

	Select idTransaksi, sum(jumlah * harga*0.95) as TotalBayar
    From Produk JOIN DetailTransaksi ON Produk.IdProduk = detailtransaksi.idproduk
    Where IdTransaksi = 'TR-01'
    group by idtransaksi;
    
    Select * from produk;
    Select * from DetailTransaksi;
    
    
-- Latihan Procedure IN
-- Prosedur ganjil genap
DELIMITER //
CREATE PROCEDURE GanjilGenap(x INT)
BEGIN
	DECLARE hasil VARCHAR(255);
    
	IF MOD(x,2) = 0 THEN
		SET hasil = 'Genap';
	ELSE
		SET hasil = 'Ganjil';
	END IF;
SELECT hasil;
END //
DELIMITER ;

CALL GanjilGenap(10);

-- Latihan Procedure IN OUT
DELIMITER //
CREATE PROCEDURE GanjilGenap1(in x INT, out hasil varchar (10))
BEGIN    
	IF MOD(x,2) = 0 THEN
		SET hasil = 'Genap';
	ELSE
		SET hasil = 'Ganjil';
	END IF;
SELECT hasil;
END //
DELIMITER ;

CALL GanjilGenap1(10, @hasil);


-- ==================================================== BELAJAR FUNGSI ====================================================
-- Buatlah Fungsi Untuk Menghitung Luas Persegi Panjang TANPA PARAMETER
DELIMITER //
create function HitungLuasTP()
	returns float
Begin
	Declare panjang float default 5;
    declare lebar float default 10;
    declare luas float;
    
    set luas = panjang * lebar;
    return luas;
End //
DELIMITER ;

Select HitungLuasTP();


-- Buatlah Fungsi Untuk Menghitung Luas Persegi Panjang MENGGUNAKAN PARAMETER
DELIMITER //
create function HitungLuasDP(panjang float, lebar float)
	returns float
Begin
	declare luas float;
    
	set luas = panjang * lebar;
    return luas;
End //
DELIMITER ;
drop function HitungLuasDP;

Select HitungLuasDP(15, 10);

-- Buatkan Fungsi untuk menghitung Total Harga TANPA Parameter (Harga * jumlah)
Select * from produk;
Select * from detailtransaksi;

DELIMITER //
CREATE FUNCTION HitungTotalHargaTP()
RETURNS INT

BEGIN
    RETURN 5000 * 5;
END //

DELIMITER ;
Select HitungTotalHargaTP();


-- Buatkan Fungsi untuk menghitung Total Harga DENGAN Parameter (Harga * jumlah)
Select * from produk;
Select * from detailtransaksi;
desc produk;
desc detailtransaksi;
DELIMITER //
CREATE FUNCTION HitungTotalHargaDP(
	hargaF int,
    jumlahF int
)
RETURNS INT
BEGIN
    RETURN hargaF * jumlahF;
END //

DELIMITER ;

Select HitungTotalHargaDP(70000, 7);

-- Setelah membuat Fungsi untuk menghitung Total Harga DENGAN Parameter (Harga * jumlah),
-- Masukkan Fungsi HitungTotalDP ke dalam pemanggilan data menggunakan tabel yang ada dengan:
-- 1. Menampilkan ID transaksi, ID Produk, Nama Produk, Harga, Jumlah dan HitungTotalHargaDP.
Select * from produk;
Select * from detailtransaksi;

Select IDTransaksi, Produk.IDProduk, NamaProduk, Harga, jumlah, HitungTotalHargaDP(harga, jumlah)
From Produk JOIN DetailTransaksi
ON Produk.idproduk = DetailTransaksi.idproduk;

-- 2. Menampilkan ID transaksi, dan akumulasi dari HitungTotalHargaDP dan kelompokkan per id Transaksinya.
Select IDTransaksi, SUM(HitungTotalHargaDP(harga, jumlah))
From Produk JOIN DetailTransaksi
ON Produk.idproduk = DetailTransaksi.idproduk
group by idtransaksi;


-- ========================================== LATIHAN MEMBUAT FUNGSI =============================================
Select * from produk;
Select * from detailtransaksi;
Select * from pelanggan;
Select * from transaksi;

-- Buatkan Sebuah Fungsi untuk Menghitung Diskon 10% dari IDTransaksi Tertentu
-- Pertimbangkan Juga untuk Mengembalikan Nilai 0 untuk transaksi yang Tidak ada.
DELIMITER //
CREATE FUNCTION HitungDiskon10(idtransaksi VARCHAR(10))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE TotalBayar DECIMAL(12,2);
    -- Ambil total transaksi
    SELECT SUM(jumlah * harga) INTO TotalBayar
    FROM detailtransaksi
    JOIN produk ON Detailtransaksi.idproduk = Produk.idproduk
    WHERE detailtransaksi.idtransaksi = idtransaksi
    group by idtransaksi;

    -- Jika tidak ada transaksi, hindari NULL
    IF TotalBayar IS NULL THEN
        RETURN 0;
    END IF;

    -- Return total setelah diskon 10%
    RETURN TotalBayar * 0.9;
END //
DELIMITER ;

drop function HitungDiskon10;
Select HitungDiskon10('TR-01');

-- Test Sintaks
Select * from produk;
Select * from detailtransaksi;
SELECT detailtransaksi.idtransaksi, detailtransaksi.idproduk, harga, jumlah, SUM(jumlah * harga) AS TotalBayar, 
SUM(jumlah * harga) * 0.9 AS TotalSetelahDiskon
    FROM detailtransaksi
    JOIN produk ON Detailtransaksi.idproduk = Produk.idproduk
    WHERE detailtransaksi.idtransaksi = idtransaksi
    group by idtransaksi;
-- =============================Memasukkan fungsi yang telah dibuat ke sintaks SQL=============================
SELECT detailtransaksi.idtransaksi, detailtransaksi.idproduk, harga, jumlah, SUM(jumlah * harga) AS TotalBayar, 
HitungDiskon10(idtransaksi) AS TotalSetelahDiskon
    FROM detailtransaksi
    JOIN produk ON Detailtransaksi.idproduk = Produk.idproduk
    WHERE detailtransaksi.idtransaksi = idtransaksi
    group by idtransaksi;

-- =======   Buatkan Fungsi untuk Diskon yang dapat ditentukan kemudian oleh User untuk ID Transaksi Tertentu =============

DELIMITER //
CREATE FUNCTION HitungDiskon(idtransaksi VARCHAR(10), Diskon int)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE TotalBayar DECIMAL(12,2);
    
    -- Ambil total transaksi
    SELECT SUM(jumlah * harga) INTO TotalBayar
    FROM detailtransaksi
    JOIN produk ON Detailtransaksi.idproduk = Produk.idproduk
    WHERE detailtransaksi.idtransaksi = idtransaksi
    group by idtransaksi;

    -- Jika tidak ada transaksi, hindari NULL
    IF TotalBayar IS NULL THEN
        RETURN 0;
    END IF;

    -- Return total setelah diskon 
    RETURN TotalBayar * ((100-Diskon)/100);
END //
DELIMITER ;

drop function HitungDiskon;

Select HitungDiskon('TR-01', 20);

-- test Sintaks: 
SELECT detailtransaksi.idtransaksi, detailtransaksi.idproduk, harga, jumlah, SUM(jumlah * harga) AS TotalBayar, 
HitungDiskon(idtransaksi, 50) AS TotalSetelahDiskon
    FROM detailtransaksi
    JOIN produk ON Detailtransaksi.idproduk = Produk.idproduk
    WHERE detailtransaksi.idtransaksi = idtransaksi
    group by idtransaksi;
    
    
-- ========================================================= BELAJAR TRIGGER =============================================================
