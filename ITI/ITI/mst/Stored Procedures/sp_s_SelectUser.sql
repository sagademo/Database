create proc [mst].[sp_s_SelectUser]
@SectionId int=null,
@TradeId int=null,
@DesignationId int=null, 
@DivisionId int=null,
@AdminId int=null,
@UserId int=null
as
begin
declare @instituteid int
set @instituteid=(select max(instituteid) from mst.Master_Admin where AdminId=@AdminId)
select * from mst.Master_Usercreation mu
inner join mst.Master_Institute mi on mu.InstituteId=mi.InstituteId
inner join mst.Master_Createsection mc on mc.SectionId=mu.SectionId
inner join Master_Trade mt on mt.TradeId=mu.TradeId
inner join Master_Designation md on md.DesignationId=mu.DesignationId
inner join Master_Division mv on mv.DivisionId=mu.DivisionId 
where @SectionId=ISNULL(@SectionId,mu.SectionId)
and @TradeId=ISNULL(@TradeId,mu.TradeId)
and @DesignationId=ISNULL(@DesignationId,mu.DesignationId)
and @DivisionId=ISNULL(@DivisionId,mu.DivisionId)
and @UserId=ISNULL(@UserId,mu.UserId)
end
