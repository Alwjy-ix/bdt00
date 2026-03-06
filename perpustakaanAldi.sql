Create database PerpustakaanAldi;
use PerpustakaanAldi;

Create table Anggota(
IDAnggota char(6) Primary key NOT NULL,
Nama Varchar(50) NOT NULL,
Alamat VARCHAR (255) NOT NULL,
NoTelp VARCHar(13) not null
);


Create table Pustakawan(
IDPustakawan char(6) primary key not null,
Nama Varchar(50) not null,
Alamat varchar(255) not null,
NoTelp varchar(13) not null
);


Create table Peminjaman(
IDPeminjaman char(6) Primary key not null,
TanggalPinjam Date not null,
LamaPinjam int(3) not null,
TanggalKembali Date not null,
IDAnggota char(6) not null,
IDPustakawan char(6) not null,
Foreign key (IDAnggota) references Anggota (IDAnggota) on update cascade ON delete cascade,
Foreign key (IDPustakawan) references Pustakawan (IDPustakawan) on update cascade ON delete cascade
);


Create table Penerbit(
IDPenerbit char(6) primary key not null,
NamaPenerbit varchar(75) not null,
Alamat varchar(255) not null,
NoTelp varchar(13) not null
);


Create table Buku(
IDBuku char(6) primary key not null,
Judul varchar(255) not null,
TahunTerbit year not null,
IDPenerbit char(6) not null,
Foreign key (IDPenerbit) references Penerbit (IDPenerbit) on update cascade on delete cascade
);


Create table Penulis(
IDPenulis char(6) primary key not null,
Nama varchar(50) not null,
Alamat varchar(255) not null,
BidangIlmu varchar(30) not null
);


Create table DetailPeminjaman(
IDPeminjaman char(6) not null,
IDBuku char(6) not null,
foreign key (IDPeminjaman) references Peminjaman (IDPeminjaman) on update cascade on delete cascade,
foreign key (IDBuku) references Buku (IDBuku) on update cascade on delete cascade
);


Create table DetailPenulis(
IDPenulis char(6) not null,
IDBuku char(6) not null,
foreign key (IDPenulis) references Penulis (IDPenulis) on update cascade on delete cascade,
foreign key (IDBuku) references Buku (IDBuku) on update cascade on delete cascade
);

-- alter
show tables;
alter table peminjaman drop LamaPinjam;
desc Peminjaman;
alter table anggota change nama NamaAnggota char (55) not null;
desc buku;
alter table buku add Jumlah int(3) not null after judul;
alter table buku drop jumlah;


-- Insert dengan menyisipkan 1 data dengan menyebutkan kolom
show Tables;
desc anggota;
Select * from anggota;
insert into Anggota (IDAnggota, Nama, Alamat, NoTelp) VALUES
('ANG001','Ani Kartini','Jl. pemuda','081234567890');

-- Insert dengan menyisipkan lebih dari 1 data dengan menyebutkan kolom
insert into Anggota (IDAnggota, Nama, Alamat, NoTelp) VALUES
('ANG002','budi santoso','Jl. manggis','081234567890'),
('ANG003','agus','Jl. eskrim','081234567890');
delete from anggota where IDAnggota = 'ang003';

-- Insert dengan menyebutkan 1 data tanpa menyebutkan kolom
insert into Anggota VALUES
('ANG005','nopal','Jl. jeruk','081234567890');
-- Insert dengan menyisipakn lebih dari 1 data TANPA menyebutkan kolom
insert into Anggota VALUES
('ANG006','albert','Jl. mangga','081234567890'),
('ANG007','david','Jl. sirsak','081234567890');

-- menyisipkan data tertentu ke dalam suatu table
insert into Anggota (IDAnggota, Nama) VALUES
('ANG004','arya');

-- update
select * from anggota;
Update anggota set alamat = 'Jl. jagung' 
where idanggota = 'ang006';

-- delete 
delete from anggota  where idanggota = 'ang007';



drop database PerpustakaanAldi;