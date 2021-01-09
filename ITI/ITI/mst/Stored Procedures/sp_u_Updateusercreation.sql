CREATE proc [mst].[sp_u_Updateusercreation]
@UserName nvarchar(100),@UserId int,@AdminID int,@UnitId int,@DesignationId tinyint,@MobileNo bigint
as
begin
if exists(select UserId from mst.Master_Usercreation where UserId=@UserId and DesignationId=@DesignationId )
begin 
update mst.Master_Usercreation set UserName=@UserName,MobileNo=@MobileNo,UpdatedBy=@AdminID,DesignationId=@DesignationId,UpdatedOn=GETDATE() where UserId=@UserId
insert into mst.Transaction_Usercreation(UserName,UpdatedBy,DesignationId,UpdatedOn,UserId,MobileNo)values(@UserName,@AdminID,@DesignationId,GETDATE(),@UnitId,@MobileNo)
select 'Updated Successfully' as Status
select UserId,UserName,CreatedOn,ma.AdminName as CreatedBy,UpdatedOn,case when UpdatedBy IS NULL then convert(nvarchar(200),UpdatedBy) else maa.AdminName end as UpdatedBy from mst.Master_Usercreation mu
inner join mst.Master_Admin ma on mu.CreatedBy=ma.AdminId
left join mst.Master_Admin maa on mu.CreatedBy=maa.AdminId
 where UserId=ISNULL(@UserId,UserId)
end
else 
begin
select 'Update Failed' as status
end
end
