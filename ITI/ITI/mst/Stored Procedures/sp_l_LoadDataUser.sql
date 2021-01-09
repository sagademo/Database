CREATE proc [mst].[sp_l_LoadDataUser]
@AdminId int
as begin
declare @instituteid int
set @instituteid=(select max(instituteid) from mst.Master_Admin where AdminId=@AdminId)
select mi.InstituteName,mi.InstituteId
 from mst.Master_Institute mi
where InstituteId=@instituteid
 
SELECT distinct Section,SectionId
FROM mst.Master_Createsection mc


select Top 10 TradeId,TradeName from dbo.Master_Trade

select Designation,DesignationId from 
mst.Master_Designation md

select  DivisionName,DivisionId from
mst.Master_Division 

end
