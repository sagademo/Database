CREATE proc [mst].[sp_l_Load_User]
@DesignationId int=null,@DivisionId int=null,@InstituteId int =null
as
begin
select mu.UserId,mu.UserName,mu.MobileNo,md.DesignationId,mv.DivisionId,ma.AdminName as CreatedBy,mu.CreatedOn
,case when md.UpdatedBy IS NULL then convert(varchar(100),mu.UpdatedBy) else maa.AdminName end as UpdatedBy,mu.UpdatedOn 
from mst.Master_Usercreation mu

inner join Master_Designation md on md.DesignationId=mu.DesignationId
inner join Master_Division mv on mv.DivisionId=mu.DivisionId 
inner join mst.Master_Admin ma on mu.CreatedBy=ma.AdminId
left join mst.Master_Admin maa on mu.CreatedBy=maa.AdminId
where  mu.DesignationId=isnull(@DesignationId,mu.DesignationId) and mu.DivisionId=isnull(@DivisionId,mu.DivisionId)
and mu.InstituteId=ISNULL(@InstituteId,mu.InstituteId)  
end
