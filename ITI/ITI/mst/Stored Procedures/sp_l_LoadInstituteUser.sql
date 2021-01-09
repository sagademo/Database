CREATE proc [mst].[sp_l_LoadInstituteUser]
@InstituteId int
as
begin
select UserId,UserName from mst.Master_Usercreation mu 
inner join mst.Master_Institute mi on mu.InstituteId=mi.InstituteId
end
