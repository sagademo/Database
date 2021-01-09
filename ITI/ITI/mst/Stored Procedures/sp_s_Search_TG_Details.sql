CREATE proc [mst].[sp_s_Search_TG_Details]
@TrainergrantNo int=null,
@SectionId int = Null,
@TradeId int = Null,
@DivisionId int = Null,
@DesignationId int = Null,
@UserId int = null
as
begin 
	select mtt.InstituteId,mc.SectionId,mc.Section,mt.TradeId,mt.TradeName,mtt.TrainergrantNo,mtt.Year,mtt.Description,
	md.DesignationId,md.Designation,mdi.DivisionId,mdi.DivisionName,mu.UserId,mu.UserName 
	 from mst.Master_TG_Details mtt
	
	inner join mst.Master_Createsection mc on mc.SectionId=mtt.SectionId
	inner join Master_Trade mt			   on mt.TradeId=mtt.TradeId
	inner join mst.Master_Designation md	on md.DesignationId=mtt.DesignationId
	inner join mst.Master_Division mdi		on mdi.DivisionId=mtt.DivisionId
	inner join mst.Master_Usercreation mu	 on mu.UserId=mtt.UserId
	inner join mst.Master_Institute mi		on mi.InstituteId=mtt.InstituteId
	
	where mtt.TrainergrantNo=@TrainergrantNo  and
		 mtt.SectionId=ISNULL(@SectionId,mtt.SectionId) and
		 mtt.TradeId=ISNULL(@TradeId,mtt.TradeId) and
		 mtt.DivisionId=ISNULL(@DivisionId,mtt.DivisionId) and
		 mtt.DesignationId=ISNULL(@DesignationId,mtt.DesignationId)and
		 mtt.UserId=ISNULL(@UserId,mtt.UserId)

	
end