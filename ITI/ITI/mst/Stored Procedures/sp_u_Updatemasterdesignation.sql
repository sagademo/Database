CREATE procedure [mst].[sp_u_Updatemasterdesignation]
@AdminId int,@Designation nvarchar(100),@DesignationId tinyint
as 
begin
if  exists(select DesignationId from mst.Master_Designation where DesignationId=@DesignationId)
begin
if  exists(select DesignationId from mst.Master_Designation where Designation=@Designation)
begin
select 'Update Failed because already this designation is present.' as status
end
else
begin
update mst.Master_Designation set Designation=@Designation,UpdatedBy=@AdminId,UpdatedOn=GETDATE() where DesignationId=@DesignationId ;
insert into mst.Transaction_Master_Designation(UpdatedBy,DesignationId,Designation,UpdatedOn)values(@AdminId,@DesignationId,@Designation,GETDATE());
select 'Updated Successfully' as Status
select DesignationId,Designation,CreatedOn,ma.AdminName as CreatedBy,UpdatedOn,case when UpdatedBy IS NULL then convert(nvarchar(200),UpdatedBy) else maa.AdminName end as UpdatedBy from mst.Master_Designation md
inner join mst.Master_Admin ma on md.CreatedBy=ma.AdminId
left join mst.Master_Admin maa on md.CreatedBy=maa.AdminId
 where DesignationId=ISNULL(@DesignationId,DesignationId)
end
end
else 
begin
select 'Update Failed' as status
end
end
