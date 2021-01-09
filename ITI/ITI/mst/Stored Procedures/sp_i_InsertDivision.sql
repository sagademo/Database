CREATE proc [mst].[sp_i_InsertDivision]
@InstituteId int,@SectionId int,@DivisionName varchar(100),@TradeId int,@AdminId int 
as
begin 
if not exists(select * from mst.Master_Division where DivisionName=@DivisionName and InstituteId=@InstituteId and SectionId=@SectionId and TradeId=@TradeId)
begin 

insert into mst.Master_Division(InstituteId,SectionId,DivisionName,TradeId,CreatedBy,CreatedOn)
values(@InstituteId,@SectionId,@DivisionName,@TradeId,@AdminId,GETDATE())


insert into mst.Transaction_Master_Division(InstituteId,SectionId,TradeId,DivisionId,DivisionName,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn)
select InstituteId,SectionId,TradeId,DivisionId,DivisionName,CreatedBy,CreatedOn,UpdatedBy,UpdateOn from mst.Master_Division where DivisionName=@DivisionName

select 'Inserted Successfully' as status

select mi.InstituteId,mc.SectionId,mt.TradeName,md.DivisionId,md.DivisionName,ma.AdminName as CreatedBy,md.CreatedOn
,case when md.UpdatedBy IS NULL then convert(varchar(100),md.UpdatedBy) else maa.AdminName end as UpdatedBy,md.UpdateOn 
 from mst.Master_Division md
inner join mst.Master_Institute mi on md.InstituteId=mi.InstituteId
inner join mst.Master_Createsection mc on mc.SectionId=md.SectionId
inner join Master_Trade mt on mt.TradeId=md.TradeId
inner join mst.Master_Admin ma on ma.AdminId=md.CreatedBy
left join mst.Master_Admin maa on md.CreatedBy=maa.AdminId
 where md.DivisionName=@DivisionName and md.InstituteId=@InstituteId and md.SectionId=@SectionId and md.TradeId=@TradeId
end
else
begin 
select 'Division already present' as status
end
end
