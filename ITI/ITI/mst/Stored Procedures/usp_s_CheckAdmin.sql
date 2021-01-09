CREATE PROCEDURE [mst].[usp_s_CheckAdmin]
	@UserId nvarchar(200),
	@Password nvarchar(200)
AS
BEGIN
	select count(*) from mst.master_admin where AdminName=@userid and password=@Password
END
