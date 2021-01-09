CREATE procedure [mst].[sp_u_Updatedivision]
@DivisionId int,@InstituteId int,@SectionId int,@TradeId int,@DivisionName nvarchar(100),@AdminId int
as 
begin
if  exists(select DivisionId from mst.Master_Division where DivisionId=@DivisionId)
begin
if  exists(select DivisionId from mst.Master_Division where DivisionName=@DivisionName and InstituteId=@InstituteId and SectionId=@SectionId and TradeId=@TradeId)
begin
select 'Update Failed because already this division is present.' as status
end
else
begin
update mst.Master_Division set DivisionName=@DivisionName,UpdatedBy=@AdminId,UpdateOn=GETDATE() where DivisionId=@DivisionId;
insert into mst.Transaction_Master_Division(instituteid,sectionid,tradeid,DivisionId,DivisionName,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn)
select instituteid,sectionid,tradeid,DivisionId,DivisionName,CreatedBy,CreatedOn,UpdatedBy,UpdateOn from mst.Master_Division where DivisionId=@DivisionId
select 'Updated Successfully' as Status
select mi.InstituteName,mc.Section,mt.TradeName,md.DivisionId,md.DivisionName,ma.AdminName as CreatedBy,md.CreatedOn
,case when md.UpdatedBy IS NULL then convert(varchar(100),md.UpdatedBy) else maa.AdminName end as UpdatedBy,md.UpdateOn 
 from mst.Master_Division md
inner join mst.Master_Institute mi on md.InstituteId=mi.InstituteId
inner join mst.Master_Createsection mc on mc.SectionId=md.SectionId
inner join Master_Trade mt on mt.TradeId=md.TradeId
inner join mst.Master_Admin ma on ma.AdminId=md.CreatedBy
left join mst.Master_Admin maa on md.CreatedBy=maa.AdminId
 where DivisionId=@DivisionId
end
end
else 
begin
select 'Update Failed' as status
end
end
