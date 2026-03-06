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
StatusReservasi varchar(10) not null,
IDTamu char(6) not null,
IDPegawai char(6) not null,
foreign key (IDTamu) references Tamu (IDTamu) on update cascade on delete cascade,
Foreign key (IDPegawai) references Pegawai (IDPegawai) on update cascade on delete cascade
);


Create table Kamar(
IDKamar char(6)  primary key not null,
TipeKamar varchar(10) not null,
TarifPerKamar Decimal(10,2) not null,
StatusKetersediaan varchar(10) not null
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

desc tamu;
alter table tamu drop NoKTP;
alter table tamu drop Email;

-- menyisipkan data
desc Tamu;
Select * from Tamu;
-- Insert dengan menyisipkan 1 data dengan menyebutkan kolom
insert into Tamu (IDTamu, NamaLengkap, Alamat, NoTelp) values
('tamu01','Ani Kartini','Jl. manggis','081234567890');

-- Insert dengan menyisipkan lebih dari 1 data dengan menyebutkan kolom
insert into Tamu (IDTamu, NamaLengkap, Alamat, NoTelp) VALUES
('tamu02','budi santoso','Jl. pepaya','081234567891'),
('tamu03','agus','Jl. eskrim','081234567892');

desc pegawai;
alter table pegawai drop Email;
Select * from Pegawai;
-- Insert dengan menyisipkan lebih dari 1 data dengan menyebutkan kolom
insert into Pegawai (IDPegawai, NamaLengkap, Jabatan, NoTelp) VALUES
('pega01','dafa','komisaris','081234567891'),
('pega02','arya','manajer','081234567892');



drop database HotelAldi;