-- ============================================== BELAJAR TRIGGER =====================================================
-- ==================== LANGKAH-LANGKAH DALAM MEMBUAT TRIGGER BELAJAR TRIGGER =========================================
-- 1. Buat Database Belajar Trigger
drop database BelajarTrigger;
Create database BelajarTrigger;
use BelajarTrigger;

show tables;
-- =======================================
-- 2. Buat Tabel Akun
create table Akun (
	IDAkun int,
    Jumlah Decimal (10,2)
);
select * from Akun;

-- =======================================
-- 3. Membuat Trigger Input Nilai Total. Variabel Total akan terus bertambah jika terdapat inputan data baru ke Tabel Akun 
-- sampai kapanpun, sejauh Trigger ini Belum Dihapus.
-- Trigger ini akan Mengakumulasi Nilai Total (awal/ lama) dengan nilai Total terbaru.
DELIMITER //
create trigger InputNilaiSUM 
Before Insert  
on Akun               -- Artinya Trigger InputNilaiSUM ini akan dieksekusi sebelum user menginputkan data ke tabel akun
FOR each row 
BEGIN 
	SET @Total = @Total + new.jumlah;
END //
DELIMITER ;
drop trigger InputNilaiSUM;

-- =======================================
-- 4. Menginputkan Nilai awal untuk Total dengan Angka NOL
SET @Total = 0;
select @Total;

-- ==============================================================================
-- 5. Menginputkan Data Pertama ke Tabel Akun, Lalu cek Nilai Total di Tabel Akun
select * from Akun;

Insert into Akun VALUES (137, 14.98);
Select @Total as 'Total Jumlah yang diinput';

-- ======== Menginputkan Data Kedua ke Tabel Akun, Lalu cek Nilai Total di Tabel Akun ========
Insert into Akun VALUES(141, 1937.50);
Select @Total as 'Total Jumlah yang diinput';

-- ======== Menginputkan Data Ketiga ke Tabel Akun, Lalu cek Nilai Total di Tabel Akun ========
Insert into Akun VALUES(97, -100.00);
Select @Total as 'Total Jumlah yang diinput';

-- Cek Nilai Total Terbaru yang merupakan hasil akumulasi dari 3 Nilai Total yang diinputkan ke Tabel Akun
Select @Total;
select * from akun;

-- Trigger Hanya dapat DIHAPUS menggunakan Perintah DROP. Setelah dihapus, Total berhenti Mengakumulasi Nilainya, walaupun Diinputkan data baru. 
Drop Trigger InputNilaiSUM;

Insert into Akun VALUES(97, -100.00);
select * from akun;
Select @Total;

-- ============================== TRIGGER BEFORE INSERT ==============================
Create table Akun2 (
	id int (10) Primary Key Auto_increment,
	amount decimal (10,2),
    created_at timestamp DEFAULT NOW(),
    updated_at timestamp DEFAULT NOW()
);

Show triggers;

drop table Akun2;

-- Buat Trigger untuk perkalian nilai jumlah yang diinputkan user dengan angka 10
Drop trigger PerkalianJumlah;
DELIMITER //
create trigger PerkalianJumlah
Before Insert 
on Akun2
FOR each row 

BEGIN 
	SET new.amount = new.amount*10;
END //
DELIMITER ;

Select * from Akun2;
Insert Into Akun2(Amount) VALUES (0.2);
Insert Into Akun2(Amount) VALUES (25);

-- ============================== TRIGGER BEFORE UPDATE ==============================
DELIMITER //
create trigger AkumulasiTotal
Before UPDATE 
on Akun2
FOR each row 

BEGIN 
	SET NEW.amount = NEW.amount + OLD.amount;
END //
DELIMITER ;

Select * from Akun2;
Update akun2 set amount = 10 where id = 1;
Update akun2 set amount = 10 where id = 2;


-- =================================== Trigger Tabel Mahasiswa dan LogMahasiswa ============================
-- Membuat Tabel Mahasiswa dan Menyimpan Log perubahan Data Mahasiswa Menggunakan Trigger

-- Membuat Tabel Mahasiswa

Create table mahasiswa (
	npm VARCHAR (10) PRIMARY KEY not null,
    nama VARCHAR (50) not null,
    alamat VARCHAR (100) not null
);
desc mahasiswa;

create table LogMahasiswa(
	id_log INT (10) PRIMARY KEY auto_increment not null,
    npm VARCHAR (10) not null,
    nama VARCHAR (50) not null,
    alamat_lama VARCHAR (100) not null,
    alamat_baru VARCHAR (100) not null,
    waktu_perubahan DATE not null
);
desc LogMahasiswa;

-- Isi Tabel Mahasiswa
select * from mahasiswa;
select * from LogMahasiswa;
INSERT INTO MAHASISWA VALUES ('212400100','Lina','Bandung');
INSERT INTO MAHASISWA VALUES ('212400101','Bambang','Jakarta');
INSERT INTO MAHASISWA VALUES ('212400102','Shinta','Semarang');
INSERT INTO MAHASISWA VALUES ('212400103','Lena','Palembang');
INSERT INTO MAHASISWA VALUES ('212400104','Nara','Jakarta');
INSERT INTO MAHASISWA VALUES ('212400105','Ari','Semarang');
INSERT INTO MAHASISWA VALUES ('212400106','Shawn','Manado');

Select * From Mahasiswa;
Select * From LogMahasiswa;


-- Membuat Trigger UpdateAlamat untuk mahasiswa yang telah ada di tabel mahasiswa
DELIMITER //
CREATE Trigger UpdateAlamat
	BEFORE UPDATE
	ON Mahasiswa
	FOR EACH ROW
BEGIN
	INSERT INTO LogMahasiswa
    SET npm = OLD.npm,
    nama = OLD.nama,
    alamat_lama = OLD.alamat,
    alamat_baru = NEW.alamat,
    waktu_perubahan = NOW();
END //
DELIMITER ;

Select * From LogMahasiswa;
select * from mahasiswa;
UPDATE mahasiswa
SET alamat = 'Surabaya'
WHERE npm = '212400100';

-- Membuat Tabel LogPerubahan (untuk mencatat perubahan yang terjadi terhadap data)

Create Table LogPerubahan (
ID INT (10) PRIMARY KEY auto_increment not null,
JenisPerubahan VARCHAR (50) Not null,
WaktuPerubahan Datetime not null
);
desc LogPerubahan;

-- Membuat Trigger Jenis Perubahan (Jika ada yang menambahkan data pada data mahasiswa, maka Log Perubahan Akan mencatat hal tersebut)
-- Setelah Insert data ke Tabel mahasiswa, Maka Tabel LogPerubahan agar terupdate dengan keterangan Jenis Perubahannya "Menambah Data"
DELIMITER //
CREATE Trigger TambahMahasiswa
	AFTER INSERT
	ON Mahasiswa
	FOR EACH ROW
BEGIN
	INSERT INTO LogPerubahan (JenisPerubahan, WaktuPerubahan)
    VALUES ('Menambah Data', NOW());
END //
DELIMITER ;

Select * from logperubahan;

Select * from mahasiswa;

INSERT INTO MAHASISWA VALUES ('212400107','Daniela','Yogyakarta');
Select * From LogPerubahan;

-- =================== LATIHAN =====================
-- 1. Buat Trigger yang jika:
-- Setelah Update data dari Tabel mahasiswa, Maka Tabel LogPerubahan agar terupdate dengan keterangan 
-- Jenis Perubahannya "Mengubah Data"
Delimiter //
Create trigger MengubahDataMahasiswa
	After update
    on mahasiswa
    for each row
	INSERT INTO LogPerubahan (JenisPerubahan, WaktuPerubahan)
    VALUES ('Mengubah Data', NOW());
END //
DELIMITER ;

UPDATE mahasiswa
SET alamat = 'Surabaya'
WHERE npm = '212400100';

-- 2. Buat Trigger yang jika:
-- Setelah Delete data dari Tabel mahasiswa, Maka Tabel LogPerubahan agar terupdate dengan keterangan 
-- Jenis Perubahannya "Menghapus Data"
Delimiter //
Create trigger MenghapusDataMahasiswa
	After delete
    on mahasiswa
    for each row
	INSERT INTO LogPerubahan (JenisPerubahan, WaktuPerubahan)
    VALUES ('Menghapus Data', NOW());
END //
DELIMITER ;
DELETE FROM mahasiswa
WHERE npm = '212400106';


-- ==================================== LATIHAN TRIGGER Update Stok Setelah Transaksi Pembelian Dilakukan ==========================
-- Buat Tabel Barang
create table barang(
kodebarang VARCHAR (10) Primary Key Not null,
namabarang VARCHAR (50) not null,
harga INT (11) not null,
stok int (11) not null
);

Desc Barang;

-- Isi Tabel Barang
Insert into barang VALUES('B001','Tepung Terigu','8500','30');
Insert into barang VALUES('B002','Teh Botol','10000','50');
Insert into barang VALUES('B003','Mentega','9000','40');
Insert into barang VALUES('B004','Buavita','7500','65');
Insert into barang VALUES('B005','Good Day','9500','75');
Select * From Barang;

-- Buat Tabel Pembelian
Create table pembelian(
	id_beli VARCHAR(10) primary key not null,
    kodebarang VARCHAR (10) not null,
    namabarang varchar (50) not null,
    jumlahbeli int (11) not null
);
Desc pembelian;

-- Isi Tabel Pembelian
insert into pembelian VALUES ('PB-001','B002','Teh Botol','15');
insert into pembelian VALUES ('PB-002','B004','Buavita','15');

Select * From pembelian;
Select * From barang;

-- ==== LATIHAN 1: Buatlah Trigger untuk memperbaharui stok pada table barang setelah ada penambahan data pada tabel pembelian. 
DELIMITER //
CREATE Trigger UpdateStok
	AFTER INSERT
	ON pembelian
	FOR EACH ROW
BEGIN
	update barang
    SET stok = stok + new.jumlahbeli
    where kodebarang = new.kodebarang;
END //
DELIMITER ;

Select * From barang;
insert into pembelian VALUES ('PB-003','B005','Good Day','15');
select * from pembelian;



-- ==== LATIHAN 2: Buat pula trigger untuk menghapus data barang pada tabel pembelian 
-- setelah data barang pada tabel master barang dihapus.
DELIMITER //
CREATE Trigger DeleteBarang
	AFTER DELETE
	ON barang
	FOR EACH ROW
BEGIN
	Delete FROM pembelian
    where kodebarang = old.kodebarang;
END //
DELIMITER ;


Select * From barang;
Select * From Pembelian;


-- ==================================================== BELAJAR EVENT ==================================================

Show events;
Show Variables where variable_name = 'Event_Scheduler';

SET Global event_scheduler = ON;


Create table Pesan(
	id int auto_increment primary key,
    message Varchar (50) not null,
    created_at timestamp Default Now()
);


Create event Event1
ON Schedule at '2025-05-14 09:08:00'
DO
Insert Into Pesan (message) VALUES ('Test Event 1');


Create event Event2
ON Schedule at current_timestamp()
DO
Insert Into Pesan (message) VALUES ('Test Event 2');

Create event Event3
ON Schedule at current_timestamp() + Interval 10 second
DO
Insert Into Pesan (message) VALUES ('Test Event 3');

show events;
select * from pesan;