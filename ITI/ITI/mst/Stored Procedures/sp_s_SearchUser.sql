-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [mst].[sp_s_SearchUser]
@InstituteId int,
@SectionId int = null,
@TradeId int = null,
@DivisionId int = null,
@DesignationId int = null,
@UserId int = null
AS
BEGIN
select mi.InstituteName,mc.Section,mt.TradeName,mdi.DivisionName,mu.UserId,mu.UserName,mu.MobileNo,ma.AdminName as CreatedBy,mu.CreatedOn
,case when mu.UpdatedBy IS NULL then convert(varchar(100),mu.UpdatedBy) else maa.AdminName end as UpdatedBy,mu.UpdatedOn 
 from mst.Master_Usercreation mu
inner join mst.Master_Institute mi on mu.InstituteId=mi.InstituteId
inner join mst.Master_Createsection mc on mc.SectionId=mu.SectionId
inner join Master_Trade mt on mt.TradeId=mu.TradeId
inner join mst.Master_Designation md on md.DesignationId=mu.DesignationId
inner join mst.Master_Division mdi on mdi.DivisionId=mu.DivisionId
inner join mst.Master_Admin ma on ma.AdminId=mu.CreatedBy
left join mst.Master_Admin maa on mu.CreatedBy=maa.AdminId
	 where
	 mu.InstituteId=@InstituteId and 
	 mu.SectionId=ISNULL(@SectionId,mu.SectionId) and
	 mu.TradeId=ISNULL(@TradeId,mu.TradeId) and
	 mu.DivisionId=ISNULL(@DivisionId,mu.DivisionId) and
	 mu.DesignationId=ISNULL(@DesignationId,mu.DesignationId)and
	 mu.UserId=ISNULL(@UserId,mu.UserId)
	 
END
