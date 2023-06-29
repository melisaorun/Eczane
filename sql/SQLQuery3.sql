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
@ÝlacBarkod int,
@ÝlacKullanim varchar(50)
as begin
insert into HastaBilgisi(KimlikBilgisi,AdiSoyadi,SosyalGuvencesi,Adres,Telefon,ÝlacBarkod,ÝlacKullanim)values (@KimlikBilgisi,@AdiSoyadi,@SosyalGuvencesi,@Adres,@Telefon,@ÝlacBarkod,@ÝlacKullanim)
end

execute HEkle @KimlikBilgisi=113,@AdiSoyadi='ayse',@SosyalGuvencesi='sgk',@Adres='istanbul',@Telefon=555,@ÝlacBarkod=9,@ÝlacKullanim='sabah-1'


--guncelleme proc
create procedure HYenile
@HastaBilgiNo int,
@KimlikBilgisi int,
@AdiSoyadi varchar(50),
@SosyalGuvencesi varchar(50),
@Adres varchar(50),
@Telefon int,
@ÝlacBarkod int,
@ÝlacKullanim varchar(50)
as begin
update HastaBilgisi set KimlikBilgisi=@KimlikBilgisi,AdiSoyadi=@AdiSoyadi,SosyalGuvencesi=@SosyalGuvencesi,Adres=@Adres,Telefon=@Telefon,ÝlacBarkod=@ÝlacBarkod,ÝlacKullanim=@ÝlacKullanim
where HastaBilgiNo=@HastaBilgiNo
end

execute HYenile @HastaBilgiNo=4,@KimlikBilgisi=113,@AdiSoyadi='ahmet',@SosyalGuvencesi='emekli',@Adres='ist',@Telefon=55,@ÝlacBarkod=8,@ÝlacKullanim='sabah'


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
select* from ÝlacBilgileri
end

execute HListele1

create procedure HEkle1
@ÝlacBarkod int,
@ÝlacinAdi varchar(50),
@KutuSayisi int,
@Fiyati money,
@KullanimAmaci varchar(50),
@YanEtkileri varchar(50)
as begin
insert into ÝlacBilgileri(ÝlacBarkod,ÝlacinAdi,KutuSayisi,Fiyati,KullanimAmaci,YanEtkileri)values (@ÝlacBarkod,@ÝlacinAdi,@KutuSayisi,@Fiyati,@KullanimAmaci,@YanEtkileri)
end

execute HEkle1 @ÝlacBarkod=4,@ÝlacinAdi='dolte',@KutuSayisi=2,@Fiyati=35,@KullanimAmaci='gözkurulugu',@YanEtkileri='kýzarýklýk'


create procedure HYenile1
@ÝlacNo int,
@ÝlacBarkod int,
@ÝlacinAdi varchar(50),
@KutuSayisi int,
@Fiyati money,
@KullanimAmaci varchar(50),
@YanEtkileri varchar(50)
as begin
update ÝlacBilgileri set ÝlacBarkod=@ÝlacBarkod,ÝlacinAdi=@ÝlacinAdi,KutuSayisi=@KutuSayisi,Fiyati=@Fiyati,KullanimAmaci=@KullanimAmaci,YanEtkileri=@YanEtkileri
where ÝlacNo=@ÝlacNo
end

execute HYenile1 @ÝlacNo=4,@ÝlacBarkod=4,@ÝlacinAdi='vitamin',@KutuSayisi=1,@Fiyati=50,@KullanimAmaci='bagýsýklýk',@YanEtkileri='yok'

create procedure HSil1
@ÝlacNo int
as begin
delete from ÝlacBilgileri where ÝlacNo=@ÝlacNo
end

execute HSil1 4

execute HListele1

create procedure HListele2
as begin
select* from HastaTakip
end

execute HListele2

drop table Kullanýcýlar

create table Kullanýcýlar (
id int primary key identity,
username nvarchar(max),
password nvarchar(max),
mail nvarchar(max),
telefon nvarchar(max)
)


Select * from Kullanýcýlar where username='melisa' and password='123'
insert into Kullanýcýlar (username,password,telefon,mail) values ('test','test','13212421','test@gmail.com')