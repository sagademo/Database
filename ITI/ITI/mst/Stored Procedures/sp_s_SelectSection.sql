create proc [mst].[sp_s_SelectSection]
@SectionId int = null
as 
begin
select * from mst.Master_Createsection where SectionId=ISNULL(@sectionid,sectionid)
end
