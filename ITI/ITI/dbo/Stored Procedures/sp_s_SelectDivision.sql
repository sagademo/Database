create proc [dbo].[sp_s_SelectDivision]
@DivisionId int = null,
@AdminId int=null,
@TradeId int = null,
@SectionId int=null
as
begin
declare @instituteid int
set @instituteid=(select max(instituteid) from mst.Master_Admin where AdminId=@AdminId)
 select * from mst.master_division md
 inner join mst.Master_Institute mi on mi.InstituteId=md.instituteid
 inner join mst.Master_Createsection mc on mc.SectionId=md.sectionid
 inner join Master_Trade mt on mt.TradeId=md.tradeid
 where @DivisionId=ISNULL(@DivisionId,DivisionId)
 and @instituteid=ISNULL(@instituteid,md.instituteid)
 and @SectionId=ISNULL(@SectionId,md.SectionId)
 and @TradeId=ISNULL(@TradeId,md.TradeId)
 end
