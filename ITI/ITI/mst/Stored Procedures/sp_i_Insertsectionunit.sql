create proc [mst].[sp_i_Insertsectionunit]
@Unit nvarchar(30),@AdminId int,@InstituteId int,@SectionId int
as 
begin
declare @Dates datetime 
select @Dates=GETDATE()
if not exists(select UnitId from mst.Master_Sectionunits
              where Unit = @Unit and InstituteId=@InstituteId  and SectionId=@SectionId)
begin
insert into mst.Master_Sectionunits(InstituteId,SectionId,Unit,CreatedOn,CreatedBy) values(@InstituteId,@SectionId,@Unit,@Dates,@AdminId)       

insert into mst.Transaction_Sectionunits(InstituteId,SectionId,UnitId,Unit,CreatedOn,CreatedBy,UpdatedOn,UpdatedBy)
select InstituteId,SectionId,UnitId,Unit,CreatedOn,createdBy,UpdateOn,UpdatedBy from mst.Master_Sectionunits where Unit=@Unit
select   'Inserted Successfully' as status
select * from mst.Master_Sectionunits where Unit=@Unit
end
else 
 begin
 select 'Section Present' as status
 end
end
