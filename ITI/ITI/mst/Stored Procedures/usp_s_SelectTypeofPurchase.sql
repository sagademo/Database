
CREATE PROCEDURE [mst].[usp_s_SelectTypeofPurchase] 
	@PurchaseId int = null
AS
BEGIN
select PurchaseId,TypeOfpurchase,CreatedOn,ma.AdminName as CreatedBy,UpdatedOn,case when UpdatedBy IS NULL then convert(nvarchar(200),UpdatedBy) else maa.AdminName end as UpdatedBy from mst.Master_Typeofpurchase md
inner join mst.Master_Admin ma on md.CreatedBy=ma.AdminId
left join mst.Master_Admin maa on md.CreatedBy=maa.AdminId
 where PurchaseId=ISNULL(@PurchaseId,PurchaseId)
END

