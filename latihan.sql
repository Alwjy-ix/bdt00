create database LatihanSQL;
use LatihanSQL;

create table pasien(
kdpasien char(8) primary key not null,
nama varchar(50) not null,
alamat varchar(225) not null,
jeniskelamin varchar(10) not null,
Golongandarah char(2) not null
);

create table obat(
kdobat char(5) primary key not null,
namaobat varchar(70) not null,
harga int(11) not null
);

create table transaksi(
kdpasien char(8) not null,
kdobat char(5) not null,
tanggaltransaksi date not null,
jumlah int(11) not null,
foreign key (kdpasien) references pasien (kdpasien) on update cascade on delete cascade,
foreign key (kdobat) references obat (kdobat) on update cascade on delete cascade
);

insert into pasien (KdPasien, Nama, Alamat, JenisKelamin, GolonganDarah) values
('P01AA001', 'Ferry', 'Jl. Melati No. 1', 'Laki-Laki', 'A'),
('P01AB001', 'Benny', 'Jl. Mercubuana No. 567', 'Laki-Laki', 'AB'),
('P01BB001', 'Juno', 'Jl. Betet No. 172', 'Laki-Laki', 'B'),
('P02AB001', 'Aqila', 'Jl. Mawar No. 4', 'Perempuan', 'AB'),
('P02OO001', 'Bianca', 'Jl. Jendral Sudirman No. 483', 'Perempuan', 'O'),
('P01AA002', 'Aldi w', 'Jl. durian No. 69', 'Laki-Laki', 'A');

insert into obat (KdObat, NamaObat, Harga) values
('B0001', 'Asam Mefenamat', 25000),
('B0002', 'Cetrin', 78000),
('B0003', 'Losartan', 45000),
('B0004', 'Dekongestan', 34000),
('B0005', 'Bisolvon', 97000);

insert into transaksi (kdPasien, KdObat, TanggalTransaksi, Jumlah) values
('P01BB001', 'B0002', '2024-04-04', 3),
('P01BB001', 'B0004', '2024-04-04', 2),
('P02AB001', 'B0005', '2024-04-05', 5),
('P01AA001', 'B0003', '2024-04-06', 2),
('P01AA001', 'B0004', '2024-04-06', 4);

select * from pasien; -- 1

select * from obat; -- 2

select * from transaksi; -- 3

select nama, jeniskelamin from pasien; -- 4

select namaobat, harga from obat; -- 5

select nama, tanggaltransaksi -- 6
from pasien
join transaksi on pasien.Kdpasien = transaksi.kdpasien;

select nama, count(transaksi.Kdobat) as Jumlahjenisobat -- 7
from pasien
join transaksi on pasien.Kdpasien = transaksi.kdpasien 
group by pasien.Kdpasien, nama;

select namaobat, sum(Jumlah) as jumlahterjual -- 8
from obat 
join transaksi on obat.Kdobat = transaksi.kdobat 
group by obat.Kdobat, namaobat;

select namaobat, Jumlah -- 8
from obat 
join transaksi on obat.Kdobat = transaksi.kdobat;

select distinct pasien.* -- 9
from pasien
join transaksi on pasien.kdpasien = transaksi.kdpasien;

select pasien.* -- 10
from pasien 
left join transaksi 
on pasien.kdpasien = transaksi.kdpasien
where transaksi.kdpasien is null;

select pasien.kdpasien, nama, alamat, jeniskelamin, Golongandarah, kdobat, tanggaltransaksi, jumlah -- 11 
from pasien 
left join transaksi 
on pasien.kdpasien = transaksi.kdpasien;

select pasien.* -- 12 
from pasien
left join transaksi on pasien.kdpasien = transaksi.kdpasien
where transaksi.kdpasien is null;

select obat.*, tanggaltransaksi, jumlah -- 13
from obat
left join transaksi on obat.kdobat = transaksi.kdobat;

select obat.* -- 14 
from obat
left join transaksi on obat.kdobat = transaksi.kdobat
where transaksi.kdobat is null;

select pasien.kdpasien, nama, sum(jumlah) as totaljumlahobat -- 15 
from pasien
join transaksi on pasien.kdpasien = transaksi.kdpasien
group by pasien.kdpasien;

select pasien.kdpasien, nama, alamat, jeniskelamin, Golongandarah, sum(jumlah) as totalpembelian -- 16 
from pasien
join transaksi on pasien.kdpasien = transaksi.kdpasien
group by pasien.kdpasien
order by totalpembelian desc
limit 1;

select obat.kdobat, namaobat, harga -- 17 
from obat
join transaksi on obat.kdobat = transaksi.kdobat
group by obat.kdobat
order by count(transaksi.kdobat) desc
limit 1;

select sum(harga * jumlah) as totalpendapatan -- 18 
from transaksi
join obat on transaksi.kdobat = obat.kdobat;

select pasien.kdpasien, nama, avg(jumlah) as rataratapembelian -- 19 
from pasien
join transaksi where pasien.kdpasien = transaksi.kdpasien
group by pasien.kdpasien, nama;

select * from pasien -- 20 
where jeniskelamin = 'Perempuan' or Golongandarah = 'AB'
order by nama;

select * from pasien -- 21 
where Golongandarah in ('A', 'B') or alamat like '%Mawar%'
order by nama asc;

select * from obat -- 22 
where harga > 70000;

select nama, namaobat, harga, tanggaltransaksi -- 23 
from pasien
join transaksi on pasien.kdpasien = transaksi.kdpasien
join obat on transaksi.kdobat = obat.kdobat
where (tanggaltransaksi between '2024-04-01' and '2024-04-05') and jumlah > 2
order by tanggaltransaksi desc;

select nama, tanggaltransaksi -- 24 
from pasien
join transaksi on pasien.kdpasien = transaksi.kdpasien
where tanggaltransaksi between '2024-04-02' and '2024-04-05';

select nama, namaobat, harga, jumlah -- 25 
from pasien
join transaksi on pasien.kdpasien = transaksi.kdpasien
join obat on transaksi.kdobat = obat.kdobat
where nama = 'Juno' or jumlah > 4
order by harga;

select pasien.kdpasien, nama, count(transaksi.kdobat) as jumlahtransaksi -- 26 
from pasien
left join transaksi on pasien.kdpasien = transaksi.kdpasien
group by pasien.kdpasien, nama
order by jumlahtransaksi desc;




drop database latihanSQL;