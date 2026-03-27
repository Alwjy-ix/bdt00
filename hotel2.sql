Create Database HotelAldi;
use HotelAldi;

Create table Tamu(
IDTamu char(6) primary key not null,
NamaLengkap varchar(50) not null,
Alamat varchar(255) not null,
NoTelp varchar(13) not null,
Email varchar(50) not null,
NoKTP varchar(16) not null
);


Create table Pegawai(
IDPegawai char(6)primary key not null,
NamaLengkap varchar(50) not null,
Jabatan varchar(10) not null,
NoTelp varchar(13) not null,
Email varchar(50) not null
);


Create table Reservasi (
IDReservasi char(6) primary key not null,
TanggalCheckin Date not null,
TanggalCheckout date not null,
JumlahMalam int(3) not null,
StatusReservasi varchar(20) not null,
IDTamu char(6) not null,
IDPegawai char(6) not null,
foreign key (IDTamu) references Tamu (IDTamu) on update cascade on delete cascade,
Foreign key (IDPegawai) references Pegawai (IDPegawai) on update cascade on delete cascade
);


Create table Kamar(
IDKamar char(6)  primary key not null,
TipeKamar varchar(10) not null,
TarifPerKamar Decimal(10,2) not null,
StatusKetersediaan varchar(20) not null
);


Create table ReservasiKamar(
IDKamar char(6) not null,
IDReservasi char(6) not null,
foreign key (IDKamar) references Kamar (IDKamar) on update cascade on delete cascade,
foreign key (IDReservasi) references Reservasi (IDReservasi) on update cascade on delete cascade
);


Create table LayananTambahan(
IDLayananTambahan char(6) primary key not null,
NamaLayanan varchar(50) not null,
Deskripsi varchar(255) not null,
Biaya Decimal(10,2) not null,
IDPegawai char(6) not null,
foreign key (IDPegawai) references Pegawai (IDPegawai) on update cascade on delete cascade
);


Create table PemesananLayanan(
IDPemesanan char(6) primary key not null,
WaktuPemesanan datetime not null,
JumlahLayanan int(3) not null,
TotalBiaya Decimal(10,2) not null,
IDTamu char(6) not null,
IDLayananTambahan char(6) not null,
foreign key (IDTamu) references Tamu (IDTamu) on update cascade on delete cascade,
foreign key (IDLayananTambahan) references LayananTambahan (IDLayananTambahan) on update cascade on delete cascade
);
-- alter
ALTER TABLE PemesananLayanan CHANGE TotalBiaya TotalBayar Decimal(10,2) not null;
ALter table kamar change TarifPerKamar HargaKamar Decimal(10,2) not null;
desc pemesananLayanan;
alter table tamu drop NoKTP;
alter table tamu drop Email;



-- menyisipkan data

-- Insert dengan menyisipkan lebih dari 1 data dengan menyebutkan kolom
insert into Tamu (IDTamu, NamaLengkap, Alamat, NoTelp) VALUES
('tamu01','Ani Kartini','Jl. manggis','081234567890'),
('tamu02','budi santoso','Jl. pepaya','081234567891'),
('tamu03','agus','Jl. eskrim','081234567892'),
('tamu04','Dafa','Jl. barat','081234567893'),
('tamu05','Nopal','Jl. timur','081234567894'),
('tamu06','Yudi','Jl. Mineral','081234567895'),
('tamu07','Alex','Jl. Ekonomi','081234567896'),
('tamu08','Vario','Jl. Sunlight','081234567897'),
('tamu09','Honda','Jl. Molto','081234567898'),
('tamu10','Yamaha','Jl. banyuasin','081234567899');


alter table pegawai drop Email;
-- Insert dengan menyisipkan lebih dari 1 data dengan menyebutkan kolom
insert into Pegawai (IDPegawai, NamaLengkap, Jabatan, NoTelp) VALUES
('pega01','dafa','komisaris','081299876650'),
('pega02','arya','manajer','081299876651'),
('pega03','mikel','ceo','081299876652'),
('pega04','panji','kasir','081299876653'),
('pega05','gojek','pegawai','081299876654'),
('pega06','grab','pegawai','081299876655'),
('pega07','maxim','pegawai','081299876656'),
('pega08','alok','satpam','081299876657'),
('pega09','ronaldo','pegawai','081299876658'),
('pega10','messi','pegawai','081299876659');


alter table Reservasi drop JumlahMalam;
-- Insert dengan menyisipkan lebih dari 1 data dengan menyebutkan kolom
insert into Reservasi (IDReservasi, TanggalCheckin, TanggalCheckout, StatusReservasi, IDTamu, IDPegawai) VALUES
('res001','2026-03-10','2026-03-13','aktif','tamu01','pega01'),
('res002','2026-02-01','2026-02-03','aktif','tamu02','pega02'),
('res003','2026-03-04','2026-03-07','aktif','tamu03','pega02'),
('res004','2026-03-05','2026-03-08','aktif','tamu04','pega03'),
('res005','2026-03-06','2026-03-09','aktif','tamu05','pega04'),
('res006','2026-03-05','2026-03-07','aktif','tamu06','pega05'),
('res007','2026-03-07','2026-03-10','aktif','tamu07','pega05'),
('res008','2026-02-06','2026-02-09','aktif','tamu08','pega06'),
('res009','2026-02-10','2026-02-12','aktif','tamu09','pega07'),
('res010','2026-03-08','2026-03-11','aktif','tamu10','pega07');


insert into Kamar (IDKamar, TipeKamar, HargaKamar, StatusKetersediaan) VALUES
('kam001','Standard',300000,'Tersedia'),
('kam002','Standard',300000,'Tersedia'),
('kam003','Standard',300000,'Tersedia'),
('kam004','Deluxe',450000,'Tersedia'),
('kam005','Deluxe',450000,'Tersedia'),
('kam006','Deluxe',450000,'Tersedia'),
('kam007','Family',600000,'Tersedia'),
('kam008','Standard',300000,'Tersedia'),
('kam009','Family',600000,'Tersedia'),
('kam010','Family',600000,'Tersedia');


insert into ReservasiKamar (IDKamar, IDReservasi) VALUES
('kam001','res001'),
('kam002','res002'),
('kam003','res003'),
('kam004','res004'),
('kam005','res005'),
('kam006','res006'),
('kam007','res007'),
('kam008','res008'),
('kam009','res009'),
('kam010','res010');

insert into LayananTambahan (IDLayananTambahan, NamaLayanan, Deskripsi, Biaya, IDPegawai) VALUES
('lay001','RoomService','Pengantaran makanan ke kamar',50000.00,'pega03'),
('lay002','Laundry','Cuci dan setrika pakaian tamu',30000.00,'pega05'),
('lay003','Spa','Layanan spa dan relaksasi',150000.00,'pega06'),
('lay004','Spa','Layanan spa dan relaksasi',150000.00,'pega07'),
('lay005','SewaMobil','Penyewaan mobil hotel',350000.00,'pega02'),
('lay006','Breakfast','Sarapan diantar ke kamar',40000.00,'pega03'),
('lay007','ExtraBed','Penambahan tempat tidur',100000.00,'pega04'),
('lay008','Cleaning','Pembersihan kamar tambahan',25000.00,'pega08'),
('lay009','Minibar','Pengisian minibar kamar',60000.00,'pega09'),
('lay010','TourGuide','Layanan pemandu wisata',250000.00,'pega10');


insert into PemesananLayanan
(IDPemesanan, WaktuPemesanan, JumlahLayanan, TotalBayar, IDTamu, IDLayananTambahan) VALUES
('pes001','2026-03-11 08:30:00',10,50000,'tamu01','lay001'),
('pes002','2026-02-02 09:15:00',2,60000,'tamu02','lay002'),
('pes003','2026-03-10 10:00:00',1,150000,'tamu02','lay003'),
('pes004','2026-03-05 13:20:00',7,200000,'tamu04','lay004'),
('pes005','2026-03-06 14:10:00',5,350000,'tamu05','lay005'),
('pes006','2026-03-07 07:30:00',2,80000,'tamu06','lay006'),
('pes007','2026-03-08 18:00:00',1,100000,'tamu02','lay007'),
('pes008','2026-02-10 09:45:00',4,25000,'tamu03','lay008'),
('pes009','2026-02-12 11:20:00',2,120000,'tamu03','lay009'),
('pes010','2026-03-07 15:00:00',1,250000,'tamu10','lay010');

-- Menambahkan identitas 
UPDATE Tamu
SET NamaLengkap = 'Aldi Wijaya'
WHERE IDTamu = 'tamu10';
Select * from tamu;

desc Tamu;
-- materi SELECT
-- menampilkan seluruh data dari tabel 
Select * from Tamu;
Select * from kamar;

-- order (default asc)
Select * from Tamu order by NamaLengkap;
-- desc
Select * from Tamu order by NamaLengkap desc;

-- menampilkan beberapa kolom tertentu dari sebuah table
select NamaLengkap from Tamu;
Select NamaLengkap from Pegawai;
Select TipeKamar, TarifPerKamar from Kamar;

-- mencari data
select IdKamar, TipeKamar From kamar Where TipeKamar = 'Standard' and StatusKetersediaan = 'Tersedia';
select IdKamar, TipeKamar From kamar Where TipeKamar = 'Standard' or TipeKamar = 'kam001';
select * From kamar Where TipeKamar != 'Standard';
select IDPegawai, NamaLengkap from Pegawai where jabatan ='Pegawai';
Select IDLayananTambahan, NamaLayanan From LayananTambahan Where Biaya <= 150000 and Biaya > 50000;

-- cari data menggunakan beetween pakai and or
Select * from Kamar where Hargakamar between 300000 and 500000;
Select * from LayananTambahan Where biaya between 80000 and 250000 or NamaLayanan = 'RoomService';


-- cari data menggunakan logika in dan not in 
Select * from LayananTambahan where NamaLayanan in ('spa', 'laundry', 'Cleaning');
select * from pegawai where jabatan not in ('pegawai', 'ceo') and NamaLengkap in ('dafa', 'arya');
select * from pegawai where jabatan in ('pegawai', 'komisaris') or NamaLengkap in ('mikel', 'arya');

-- null not null
select * from tamu where IDTamu is null;
select * from tamu where IDTamu is not null;

-- mencari data menggunakan logika like
select * from Tamu where alamat like 'jl%' and IDTamu in ('tamu03', 'tamu06', 'tamu09');
select * from Tamu where alamat like 'jl%' and NamaLengkap like '%a';
select * from Tamu where IDTamu like '%06' or NamaLengkap like '%a';
select * from tamu where NamaLengkap like 'd___';
-- jl% = 'jl+terserah', &06= 'terserah+06', d___ = harus sesuai berapa karakter
select * from tamu where IDTamu not like 'tamu01';

-- REGEXP
-- ^ adalah untuk awal kata, $ akhir kata, [] pilihan karakter
-- nama yang terdapat huruf U
SELECT * FROM Tamu
WHERE NamaLengkap REGEXP 'u';
-- Nama tamu yang diawali huruf A
SELECT * FROM Tamu
WHERE NamaLengkap REGEXP '^A';
-- Nama yang diakhiri huruf “a”
SELECT * FROM Tamu
WHERE NamaLengkap REGEXP 'a$';
-- Nama dengan panjang 4 huruf
SELECT * FROM Tamu
WHERE NamaLengkap REGEXP '^....$';
-- . = 1 karakter jadi .... 4 karakter

-- Nama yang mengandung huruf vokal tertentu
SELECT * FROM Tamu
WHERE NamaLengkap REGEXP '[u]';

-- NamaLengkap mengandung huruf M sampai P
SELECT * FROM Tamu
WHERE NamaLengkap REGEXP '[M-P]';

-- Huruf pertama harus A, B, atau V
SELECT * FROM Tamu
WHERE NamaLengkap REGEXP '^[ABV]';

-- Huruf terakhir harus a atau o
SELECT * FROM Tamu
WHERE NamaLengkap REGEXP '[ao]$';

-- fungsi distinct memfilter data yang berulang
-- contoh select distinct(NamaLengkap) from Tamu;
-- select dengan case
Select * from kamar;
select IDKamar, StatusKetersediaan,
case 
	when HargaKamar <= 450000 then 'murah' else 'mahal'
end as 'Kategori'
from Kamar;

-- select alias(ganti nama)
select NamaLengkap as nama from tamu;
select NamaLengkap AntekAsing from tamu;

-- query limit membatasi data yang ditampilkan dan disarankan dengan order by
Select * from Tamu order by NamaLengkap limit 4;

-- select dengan group by
select * from pemesananLayanan;
select IDPemesanan, count(IDTamu) as jumlahMelayani
from pemesananLayanan
group by IDTamu;
-- menggunakan group_concat
select IDTamu, group_concat(IDPemesanan order by IDPemesanan SEPARATOR ', ') as dilayani
from pemesananLayanan
group by IDTamu;



drop database HotelAldi;