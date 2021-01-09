create proc [mst].[sp_u_Updatesectionunit]
@AdminId int,@Unit nvarchar(30),@UnitId int,@InstituteId int,@SectionId int
as 
begin
if  exists(select UnitId from mst.Master_Sectionunits where UnitId=@UnitId and InstituteId=@InstituteId and SectionId=@SectionId )
begin
update mst.Master_Sectionunits set Unit=@Unit,UpdatedBy=@AdminId,UpdateOn=GETDATE() where UnitId=@UnitId ;
insert into mst.Transaction_Sectionunits(UpdatedBy,UnitId,Unit,UpdatedOn)values(@AdminId,@UnitId,@Unit,GETDATE());
select 'Updated Successfully' as Status
select * from mst.Master_Sectionunits where UnitId=@UnitId;
end
else 
begin
select 'Update Failed' as status
end
end
