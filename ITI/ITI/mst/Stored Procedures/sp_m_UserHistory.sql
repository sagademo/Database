CREATE proc [mst].[sp_m_UserHistory]
@UserId int
as
begin 

select mc.Section,mt.TradeName,mdi.DivisionName,mu.UserId,mu.UserName,ma.AdminName as CreatedBy,mu.CreatedOn
,case when mu.UpdatedBy IS NULL then convert(varchar(100),mu.UpdatedBy) else maa.AdminName end as UpdatedBy,mu.UpdatedOn 
 from mst.Transaction_Master_Usercreation mu

inner join mst.Master_Createsection mc on mc.SectionId=mu.SectionId
inner join mst.Master_Usercreation muc on muc.UserId=mu.UserId
inner join Master_Trade mt on mt.TradeId=mu.TradeId
inner join mst.Master_Division mdi on mdi.DivisionId=mu.DivisionId
inner join mst.Master_Admin ma on ma.AdminId=mu.CreatedBy
left join mst.Master_Admin maa on mu.CreatedBy=maa.AdminId
	 where
	 mu.UserId=@UserId
end
