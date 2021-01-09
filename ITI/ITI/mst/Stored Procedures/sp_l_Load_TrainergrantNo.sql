CREATE proc [mst].[sp_l_Load_TrainergrantNo]
@TrainergrantId int=Null,
@InstituteId int
as
begin
 select distinct TrainergrantNo
 from mst.Master_TG_Details 
 where TrainergrantId=ISNULL(@TrainergrantId,TrainergrantId) and
  InstituteId=@InstituteId
end