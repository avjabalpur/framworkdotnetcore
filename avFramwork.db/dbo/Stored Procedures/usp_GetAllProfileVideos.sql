CREATE PROCEDURE [dbo].[usp_GetAllProfileVideos] --1
	@IsAdmin INT
AS
BEGIN
	if(@IsAdmin = 1)
	BEGIN 
		Select vd.Id,vd.UserId,usr.UserName,usr.Email,vd.VideoPath,vd.VideoDesc,vd.VideoTitle,vd.IsActive 
		from [dbo].[Video] vd
			LEFT OUTER JOIN [dbo].[Users] usr on usr.Id= vd.UserId
		where (vd.EventTypeId IS NULL or vd.EventTypeId=3) AND vd.IsDeleted = 0 
	END
	else
	BEGIN
		Select vd.Id,vd.UserId,usr.UserName,usr.Email,vd.VideoPath,vd.VideoDesc,vd.VideoTitle,vd.IsActive 
		from [dbo].[Video] vd
			LEFT OUTER JOIN [dbo].[Users] usr on usr.Id= vd.UserId
		where (vd.EventTypeId IS NULL or vd.EventTypeId=3) AND vd.IsDeleted = 0 AND vd.IsActive=0
	END
END