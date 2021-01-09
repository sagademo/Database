CREATE proc [dbo].[sp_l_LoadDivision]
@TradeId nvarchar(100),@InstituteId int,@SectionId int
as
begin
select mi.InstituteName,mc.Section,mt.TradeName,md.DivisionId,md.DivisionName,ma.AdminName as CreatedBy,md.CreatedOn
,case when md.UpdatedBy IS NULL then convert(varchar(100),md.UpdatedBy) else maa.AdminName end as UpdatedBy,md.UpdateOn
 from mst.Master_Division md
inner join mst.Master_Institute mi on md.InstituteId=mi.InstituteId
inner join mst.Master_Createsection mc on mc.SectionId=md.SectionId
inner join Master_Trade mt on mt.TradeId=md.TradeId
inner join mst.Master_Admin ma on ma.AdminId=md.CreatedBy
left join mst.Master_Admin maa on md.CreatedBy=maa.AdminId
where md.InstituteId=@InstituteId and md.SectionId=@SectionId and md.TradeId=@TradeId
end
