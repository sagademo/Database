CREATE proc [mst].[sp_i_InsertSection]
@Section nvarchar(200),
@AdminId int
as 
begin

if not exists(select* from mst.Master_Createsection where Section = @Section)
begin
declare @instituteid int
set @instituteid=(select max(instituteid) from mst.Master_Admin where AdminId=@AdminId)
insert into mst.Master_Createsection(Section,AdminId,instituteid)
values(@Section,@AdminId,@instituteid)
select 'Inserted Successfully ' as status
select * from mst.Master_Createsection where Section = @Section
end 
else
begin 
select 'Section already present' as status
end
end

/****** Object:  StoredProcedure [mst].[sp_s_SelectSection]    Script Date: 12/10/2020 15:04:01 ******/
SET ANSI_NULLS ON
