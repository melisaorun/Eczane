create proc HAra
@KimlikBilgisi int
as begin 
select*from HastaBilgisi where KimlikBilgisi=@KimlikBilgisi
end
 
 execute HAra 111

create proc HAra1
@ÝlacBarkod int
as begin 
select*from ÝlacBilgileri where ÝlacBarkod=@ÝlacBarkod
end

execute HAra1 4



