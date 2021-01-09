CREATE proc [mst].[sp_i_InsertUser]
@UserName nvarchar(100),@InstituteId int,@SectionId int,@TradeId int,@MobileNo bigint, @DesignationId tinyint ,@DivisionId int,@AdminId int
as
begin
if not exists (select * from mst.Master_Usercreation where UserName = @UserName and InstituteId=@InstituteId and SectionId=@SectionId and TradeId=@TradeId and DesignationId=@DesignationId and DivisionId=@DivisionId) 
begin 
insert into mst.Master_Usercreation(UserName,InstituteId,SectionId,TradeId,MobileNo,DesignationId,DivisionId,CreatedBy,CreatedOn)
values(@UserName,@InstituteId,@SectionId,@TradeId,@MobileNo,@DesignationId,@DivisionId,@AdminId,GETDATE())

insert into mst.Transaction_Master_Usercreation(UserId,UserName,InstituteId,SectionId,TradeId,MobileNo,DesignationId,DivisionId,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn)

select UserId,UserName,InstituteId,SectionId,TradeId,MobileNo,DesignationId,DivisionId,CreatedBy,CreatedOn,UpdatedBy,UpdatedOn from mst.Master_Usercreation where UserName=@UserName
select 'Inserted Successfully' as status

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
	where mu.UserName=@UserName and mu.InstituteId=@InstituteId and mu.SectionId=@SectionId and mu.TradeId=@TradeId and mu.MobileNo=@MobileNo and mu.DesignationId=@DesignationId and mu.DivisionId=@DivisionId  
end
else
begin 
select 'User already present' as status
end
end
