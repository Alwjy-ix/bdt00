drop database mahasiswa;
create database mahasiswa;
use mahasiswa;

create table mahasiswa(
nim varchar(10) primary key,
nama varchar(100),
jurusan varchar(50)
);

create table matakuliah(
kodemk varchar(10) primary key,
namamk varchar(100),
sks int
);

create table krs(
idkrs varchar(10) primary key,
nim varchar(10),
kodemk varchar(10),
foreign key (nim) references mahasiswa (nim),
foreign key (kodemk) references matakuliah (kodemk)
);



INSERT INTO Mahasiswa VALUES
('MTI001','Budi','Teknik Informatika'),
('MSI002','Siti','Sistem Informasi'),
('MTI003','Gibran','Teknik Informatika'),
('MSI004','Wowok','Sistem Informasi'),
('MTK005','Joko','Teknik Komputer');


INSERT INTO MataKuliah VALUES
('MK101','Basis Data',3),
('MK102','Pemrograman Web',3),
('MK103','Struktur Data',3),
('MK104','Jaringan Komputer',3),
('MK105','Kecerdasan Buatan',3);


INSERT INTO KRS VALUES
('KRS001','MTI001', 'MK101'),
('KRS002','MSI002', 'MK102'),
('KRS003','MTI003', 'MK103'),
('KRS004','MSI004', 'MK104'),
('KRS005','MTI001', 'MK104');

-- 1. hapus kolom jurusan dari table mahasiswa
select * from mahasiswa;
alter table mahasiswa drop jurusan;
-- 2. tampilkan nama mahasiswa, program studi,
-- nama mata kuliah dan jumlah sks yang diambil
-- untuk mahasiswa yg mengambil mata kuliah lebih dari 2 sks
-- notes: program studi diambil dari karakter ke-2 dan ke-3 dari nim.
-- jika ti maka teknik informatika
-- jika si maka sistem informasi
-- jika tk maka teknik komputer
-- sekian itu artinya prodi tidak terdaftar.
select nama,
case
	when substring(mahasiswa.nim, 2, 2) ="TI" then "Teknik informatika"
    when substring(mahasiswa.nim, 2, 2) ="SI" then "Sistem informasi"
    when substring(mahasiswa.nim, 2, 2) ="TK" then "Teknik komputer" else "tidak terdaftar"
end as programstudi,
namamk, sks from mahasiswa 
join krs on mahasiswa.nim = krs.nim
join matakuliah on matakuliah.kodemk = krs.kodemk
where sks > 2;


-- tambahkan data anda sebagai mahasiswa 
insert into mahasiswa values ('MSI100','Aldi');

-- 2. tampilkan seluruh data mahasiswa dan krs baik yang mengambil maupun belum mengambil krs
select * from mahasiswa join krs on mahasiswa.nim = krs.nim;

-- 3. tampilkan seluruh data mata kuliah dan krs untuk seluruh mata kuliah
-- baik yang pernah maupun tidak pernah diambil mahasiswa
select * 
from matakuliah 
left join krs on matakuliah.kodemk = krs.kodemk;

-- 4. tampilkan seluruh nama mahasiswa yang belum ambil krs
select nama from mahasiswa
left join krs on mahasiswa.nim = krs.nim
where idkrs is null;


-- INNER JOIN

-- LEFT JOIN

-- RIGHT JOIN