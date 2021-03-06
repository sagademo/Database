﻿CREATE proc [mst].[sp_u_Updateuser]
@UserName nvarchar(100),@UserId int,@InstituteId int,@SectionId int,@TradeId int,@MobileNo bigint,@DesignationId tinyint,@DivisionId int,@AdminId int
as
begin
if  exists(select UserId from mst.Master_Usercreation where UserId=@UserId)
begin
if  exists(select UserId from mst.Master_Usercreation where UserName=@UserName and InstituteId=@InstituteId)
begin
select 'Update Failed because already this User is present.' as status
end
else
begin

update mst.Master_Usercreation set UserName=@UserName,MobileNo=@MobileNo,UpdatedBy=@AdminId,UpdatedOn=GETDATE() where UserId=@UserId
insert into mst.Transaction_Master_Usercreation(UserId,UserName,InstituteId,SectionId,TradeId,MobileNo,DesignationId,DivisionId,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn)
select UserId,UserName,InstituteId,SectionId,TradeId,MobileNo,DesignationId,DivisionId,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn from mst.Master_Usercreation where UserName=@UserName

select 'Updated Successfully' as Status
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
 where UserId=@UserId
end
end
else 
begin
select 'Update Failed' as status
end
end
