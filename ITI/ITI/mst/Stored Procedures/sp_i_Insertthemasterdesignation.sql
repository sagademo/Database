CREATE procedure [mst].[sp_i_Insertthemasterdesignation]
@Designation nvarchar(100),@AdminId int
as
begin 
declare @Dates datetime 
select @Dates=GETDATE()
if not exists(select*from mst.Master_Designation
              where Designation = @Designation)
begin
--Insert to master table
insert into
mst.Master_Designation(Designation,CreatedOn,CreatedBy) values(@Designation,@Dates,@AdminId)
--insert Transaction
insert into mst.Transaction_Master_Designation(DesignationId,Designation,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy)
select DesignationId,Designation,CreatedOn,createdby,UpdatedOn,updatedby from mst.Master_Designation where Designation=@designation
--Select the status
select   'Inserted Successfully' as Status
select DesignationId,Designation,CreatedOn,ma.AdminName as CreatedBy,UpdatedOn,
case when UpdatedBy IS NULL then convert(varchar(100),UpdatedBy) else maa.AdminName end as UpdatedBy from mst.Master_Designation md
inner join mst.Master_Admin ma on md.CreatedBy=ma.AdminId
left join mst.Master_Admin maa on md.CreatedBy=maa.AdminId
 where Designation=@Designation
end
else 
 begin
 select 'Designation Present' as Status
 end
end
