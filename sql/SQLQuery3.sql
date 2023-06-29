create procedure HListele
as begin
select* from HastaBilgisi
end

execute HListele

--create (yani veri ekleme(insert) procedure)
create procedure HEkle
@KimlikBilgisi int,
@AdiSoyadi varchar(50),
@SosyalGuvencesi varchar(50),
@Adres varchar(50),
@Telefon int,
@�lacBarkod int,
@�lacKullanim varchar(50)
as begin
insert into HastaBilgisi(KimlikBilgisi,AdiSoyadi,SosyalGuvencesi,Adres,Telefon,�lacBarkod,�lacKullanim)values (@KimlikBilgisi,@AdiSoyadi,@SosyalGuvencesi,@Adres,@Telefon,@�lacBarkod,@�lacKullanim)
end

execute HEkle @KimlikBilgisi=113,@AdiSoyadi='ayse',@SosyalGuvencesi='sgk',@Adres='istanbul',@Telefon=555,@�lacBarkod=9,@�lacKullanim='sabah-1'


--guncelleme proc
create procedure HYenile
@HastaBilgiNo int,
@KimlikBilgisi int,
@AdiSoyadi varchar(50),
@SosyalGuvencesi varchar(50),
@Adres varchar(50),
@Telefon int,
@�lacBarkod int,
@�lacKullanim varchar(50)
as begin
update HastaBilgisi set KimlikBilgisi=@KimlikBilgisi,AdiSoyadi=@AdiSoyadi,SosyalGuvencesi=@SosyalGuvencesi,Adres=@Adres,Telefon=@Telefon,�lacBarkod=@�lacBarkod,�lacKullanim=@�lacKullanim
where HastaBilgiNo=@HastaBilgiNo
end

execute HYenile @HastaBilgiNo=4,@KimlikBilgisi=113,@AdiSoyadi='ahmet',@SosyalGuvencesi='emekli',@Adres='ist',@Telefon=55,@�lacBarkod=8,@�lacKullanim='sabah'


--silme proc
create procedure HSil
@HastaBilgiNo int
as begin
delete from HastaBilgisi where HastaBilgiNo=@HastaBilgiNo
end

execute HSil 3

execute HListele



create procedure HListele1
as begin
select* from �lacBilgileri
end

execute HListele1

create procedure HEkle1
@�lacBarkod int,
@�lacinAdi varchar(50),
@KutuSayisi int,
@Fiyati money,
@KullanimAmaci varchar(50),
@YanEtkileri varchar(50)
as begin
insert into �lacBilgileri(�lacBarkod,�lacinAdi,KutuSayisi,Fiyati,KullanimAmaci,YanEtkileri)values (@�lacBarkod,@�lacinAdi,@KutuSayisi,@Fiyati,@KullanimAmaci,@YanEtkileri)
end

execute HEkle1 @�lacBarkod=4,@�lacinAdi='dolte',@KutuSayisi=2,@Fiyati=35,@KullanimAmaci='g�zkurulugu',@YanEtkileri='k�zar�kl�k'


create procedure HYenile1
@�lacNo int,
@�lacBarkod int,
@�lacinAdi varchar(50),
@KutuSayisi int,
@Fiyati money,
@KullanimAmaci varchar(50),
@YanEtkileri varchar(50)
as begin
update �lacBilgileri set �lacBarkod=@�lacBarkod,�lacinAdi=@�lacinAdi,KutuSayisi=@KutuSayisi,Fiyati=@Fiyati,KullanimAmaci=@KullanimAmaci,YanEtkileri=@YanEtkileri
where �lacNo=@�lacNo
end

execute HYenile1 @�lacNo=4,@�lacBarkod=4,@�lacinAdi='vitamin',@KutuSayisi=1,@Fiyati=50,@KullanimAmaci='bag�s�kl�k',@YanEtkileri='yok'

create procedure HSil1
@�lacNo int
as begin
delete from �lacBilgileri where �lacNo=@�lacNo
end

execute HSil1 4

execute HListele1

create procedure HListele2
as begin
select* from HastaTakip
end

execute HListele2

drop table Kullan�c�lar

create table Kullan�c�lar (
id int primary key identity,
username nvarchar(max),
password nvarchar(max),
mail nvarchar(max),
telefon nvarchar(max)
)


Select * from Kullan�c�lar where username='melisa' and password='123'
insert into Kullan�c�lar (username,password,telefon,mail) values ('test','test','13212421','test@gmail.com')