
CREATE procedure [mst].[sp_u_Updatetypeofpurchase]
@AdminId int,@TypeOfpurchase nvarchar(100),@PurchaseId tinyint
as 
begin
if  exists(select PurchaseId from mst.Master_Typeofpurchase where PurchaseId=@PurchaseId)
begin
if  exists(select PurchaseId from mst.Master_Typeofpurchase where TypeOfpurchase=@TypeOfpurchase)
begin
select 'Update Failed because already this purchase is present.' as status
end
else
begin
update mst.Master_Typeofpurchase set TypeOfpurchase=@TypeOfpurchase,UpdatedBy=@AdminId,UpdatedOn=GETDATE() where PurchaseId=@PurchaseId ;
insert into mst.Transaction_Master_TypeOfpurchase(UpdatedBy,PurchaseId,TypeOfpurchase,UpdatedOn)values(@AdminId,@PurchaseId,@TypeOfpurchase,GETDATE());
select 'Updated Successfully' as Status
select PurchaseId,TypeOfpurchase,CreatedOn,ma.AdminName as CreatedBy,UpdatedOn,case when UpdatedBy IS NULL then convert(nvarchar(200),UpdatedBy) else maa.AdminName end as UpdatedBy from mst.Master_Typeofpurchase md
inner join mst.Master_Admin ma on md.CreatedBy=ma.AdminId
left join mst.Master_Admin maa on md.CreatedBy=maa.AdminId
 where PurchaseId=ISNULL(@PurchaseId,PurchaseId)
end
end
else 
begin
select 'Update Failed' as status
end
end

