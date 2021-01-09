create proc [mst].[sp_i_Insert_TG_Details]
@tgTable mst.TblVarTg readonly
as
begin
	--declare @Id int
	if  not exists(select * from mst.Master_TG_Details where TrainergrantNo=(select top 1 TrainergrantNo from @tgTable ))
		begin
			insert into mst.Master_TG_Details(TrainergrantNo,DesignationId,DivisionId,SectionId,TradeId,AdminId,UserId,Year,Description,InstituteId)
			select TrainergrantNo,DesignationId,DivisionId,SectionId,TradeId,AdminId,UserId,Year,Description,InstituteId from @tgTable

			insert into mst.Tran_Master_TG_Details(TrainergrantNo,DesignationId,DivisionId,SectionId,TradeId,AdminId,UserId,Year,Description,InstituteId)
			select TrainergrantNo,DesignationId,DivisionId,SectionId,TradeId,AdminId,UserId,Year,Description,InstituteId from Master_TG_Details where TrainergrantNo=(select top 1 TrainergrantNo from @tgTable )
			
			select 'Inserted Successfully' as status
			
			--select * from mst.Master_TG_Details where TrainergrantNo=(select top 1 TrainergrantNo from @tgTable )
		end
	else
		begin
		--delete
		delete from mst.Master_TG_Details where TrainergrantNo=(select top 1 TrainergrantNo from @tgTable )
		
		--save
		insert into mst.Master_TG_Details(TrainergrantNo,DesignationId,DivisionId,SectionId,TradeId,AdminId,UserId,Year,Description,InstituteId)
		select TrainergrantNo,DesignationId,DivisionId,SectionId,TradeId,AdminId,UserId,Year,Description,InstituteId from @tgTable
		
		--save to transaction
		insert into mst.Tran_Master_TG_Details(TrainergrantNo,DesignationId,DivisionId,SectionId,TradeId,AdminId,UserId,Year,Description,InstituteId)
		select TrainergrantNo,DesignationId,DivisionId,SectionId,TradeId,AdminId,UserId,Year,Description,InstituteId from Master_TG_Details where TrainergrantNo=(select top 1 TrainergrantNo from @tgTable )
			
		--pop up	
		select 'Updated Successfully' as status
			
			
		select * from mst.Master_TG_Details where TrainergrantNo=(select top 1 TrainergrantNo from @tgTable )
		
		end	
end