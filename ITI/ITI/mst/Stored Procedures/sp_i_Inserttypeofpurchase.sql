
CREATE procedure [mst].[sp_i_Inserttypeofpurchase]
@TypeOfpurchase nvarchar(100),@AdminId int
as
begin 
declare @Dates datetime 
select @Dates=GETDATE()
if not exists(select*from mst.Master_Typeofpurchase
              where TypeOfpurchase = @TypeOfpurchase)
begin
--Insert to master table
insert into
mst.Master_Typeofpurchase(TypeOfpurchase,CreatedOn,CreatedBy) values(@TypeOfpurchase,@Dates,@AdminId)
--insert Transaction
insert into mst.Transaction_Master_TypeOfpurchase(PurchaseId,TypeOfpurchase,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy)
select PurchaseID,TypeOfpurchase,CreatedOn,createdby,UpdatedOn,updatedby from mst.Master_Typeofpurchase where TypeOfpurchase=@TypeOfpurchase
--Select the status
select   'Inserted Successfully' as Status
select PurchaseId,TypeOfpurchase,CreatedOn,ma.AdminName as CreatedBy,UpdatedOn,
case when UpdatedBy IS NULL then convert(varchar(100),UpdatedBy) else maa.AdminName end as UpdatedBy from mst.Master_TypeOfpurchase md
inner join mst.Master_Admin ma on md.CreatedBy=ma.AdminId
left join mst.Master_Admin maa on md.CreatedBy=maa.AdminId
 where TypeOfpurchase=@TypeOfpurchase
end
else 
 begin
 select 'Type Of Purchase Present' as Status
 end
end

