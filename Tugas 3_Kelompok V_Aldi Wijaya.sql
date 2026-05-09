drop database if exists HotelAldi;
Create Database HotelAldi;
use HotelAldi;

Create table Tamu(
IDTamu char(6) primary key,
NamaLengkap varchar(50) ,
Alamat varchar(255) ,
NoTelp varchar(13) ,
Email varchar(50) ,
NoKTP varchar(16)
);


Create table Pegawai(
IDPegawai char(6)primary key,
NamaLengkap varchar(50),
Jabatan varchar(10),
NoTelp varchar(13),
Email varchar(50)
);


Create table Reservasi (
IDReservasi char(6) primary key,
TanggalCheckin Date,
TanggalCheckout date,
JumlahMalam int,
StatusReservasi varchar(20),
IDTamu char(6),
IDPegawai char(6),
foreign key (IDTamu) references Tamu (IDTamu) on update cascade on delete cascade,
Foreign key (IDPegawai) references Pegawai (IDPegawai) on update cascade on delete cascade
);


Create table Kamar(
IDKamar char(6) primary key,
TipeKamar varchar(10),
HargaKamar Decimal(10,2),
StatusKetersediaan varchar(20)
);


Create table ReservasiKamar(
IDKamar char(6),
IDReservasi char(6),
foreign key (IDKamar) references Kamar (IDKamar) on update cascade on delete cascade,
foreign key (IDReservasi) references Reservasi (IDReservasi) on update cascade on delete cascade
);


Create table LayananTambahan(
IDLayananTambahan char(6) primary key,
NamaLayanan varchar(50),
Deskripsi varchar(255),
Biaya Decimal(10,2),
IDPegawai char(6),
foreign key (IDPegawai) references Pegawai (IDPegawai) on update cascade on delete cascade
);


Create table PemesananLayanan(
IDPemesanan char(6) primary key,
WaktuPemesanan datetime,
JumlahLayanan int,
TotalBayar Decimal(10,2),
IDTamu char(6),
IDLayananTambahan char(6),
foreign key (IDTamu) references Tamu (IDTamu) on update cascade on delete cascade,
foreign key (IDLayananTambahan) references LayananTambahan (IDLayananTambahan) on update cascade on delete cascade
);
desc pemesananLayanan;
alter table tamu drop NoKTP;
alter table tamu drop Email;
alter table pegawai drop Email;
alter table Reservasi drop JumlahMalam;
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
('kam002','res004'),
('kam006','res005'),
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
('lay006','Breakfast','Sarapan diantar ke kamar',40000.00,'pega02'),
('lay007','ExtraBed','Penambahan tempat tidur',100000.00,'pega04'),
('lay008','Cleaning','Pembersihan kamar tambahan',25000.00,'pega08'),
('lay009','Minibar','Pengisian minibar kamar',60000.00,'pega09'),
('lay010','TourGuide','Layanan pemandu wisata',250000.00,'pega10');


insert into PemesananLayanan
(IDPemesanan, WaktuPemesanan, JumlahLayanan, TotalBayar, IDTamu, IDLayananTambahan) VALUES
('pes001','2026-03-11 08:30:00',1,50000,'tamu01','lay001'),
('pes002','2026-02-02 09:15:00',2,60000,'tamu02','lay002'),
('pes003','2026-03-10 10:00:00',1,150000,'tamu06','lay003'),
('pes004','2026-03-05 13:20:00',1,200000,'tamu04','lay004'),
('pes005','2026-03-06 14:10:00',1,350000,'tamu05','lay005'),
('pes006','2026-03-07 07:30:00',2,80000,'tamu06','lay006'),
('pes007','2026-03-08 18:00:00',1,100000,'tamu06','lay007'),
('pes008','2026-02-10 09:45:00',1,25000,'tamu08','lay008'),
('pes009','2026-02-12 11:20:00',2,120000,'tamu09','lay009'),
('pes010','2026-03-07 15:00:00',1,250000,'tamu10','lay010');

-- Menambahkan identitas 
UPDATE Tamu
SET NamaLengkap = 'Aldi Wijaya'
WHERE IDTamu = 'tamu10';
Select * from tamu;


-- tugas 3
-- Sub Query 1. menampilkan data kamar yang memiliki harga di atas rata rata
select idKamar, tipeKamar, hargaKmar
from kamar
where hargaKamar > (select avg(hargaKamar) from kamar);

-- Sub Query 2. menampilkan kamar yang belum pernah dipesan sama sekali
select idKamar, tipeKamar
from kamar
where idKamar not in (select idkamar from reservasiKamar);

-- Sintaks view 1. Menampilkan info reservasi kamar lengkap dengan nama tamu dan harga kamarnya
create view view_detailReservasi as
select reservasi.IDReservasi, tamu.NamaLengkap, kamar.TipeKamar, kamar.HargaKamar
from reservasi
join tamu on reservasi.idTamu = tamu.idTamu
join reservasiKamar on reservasi.idReservasi = reservasiKamar.idReservasi
join kamar on reservasiKamar.idKamar = kamar.idKamar;

select * from view_detailReservasi;

-- Sintaks view 2. Menampilkan daftar pemesanan layanan beserta nama tamu dan nama layanannya
create view view_detailPemesananLayanan as
select pemesananLayanan.idPemesanan, tamu.namaLengkap, layananTambahan.namaLayanan, pemesananLayanan.totalBayar
from pemesananLayanan
join tamu on pemesananLayanan.idTamu = tamu.idTamu 
join layananTambahan on pemesananLayanan.idLayananTambahan = layananTambahan.idLayananTambahan;

select * from view_detailPemesananLayanan;

-- Procedure 1. Memasukkan data tamu baru ke dalam tabel tamu secara praktis

-- Procedure 2. menghitung total pendapatan dari layanan tambahan berdasarkan id tamu

-- Function 1. 

-- Function 2. 



