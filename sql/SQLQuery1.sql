create proc HAra
@KimlikBilgisi int
as begin 
select*from HastaBilgisi where KimlikBilgisi=@KimlikBilgisi
end
 
 execute HAra 111

create proc HAra1
@�lacBarkod int
as begin 
select*from �lacBilgileri where �lacBarkod=@�lacBarkod
end

execute HAra1 4



