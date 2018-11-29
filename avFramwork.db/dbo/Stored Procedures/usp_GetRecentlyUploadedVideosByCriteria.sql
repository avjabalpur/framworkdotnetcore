CREATE PROCEDURE [dbo].[usp_GetRecentlyUploadedVideosByCriteria] -- [usp_GetRecentlyUploadedVideosByCriteria] 1, 12, 13
	@Type int, 
	@NoOfVideos int,
	@NoOfDaysDifference int
AS
BEGIN
	if(@Type = 1)
         Begin
             SELECT TOP(@NoOfVideos)
                vd.id as videoId,
                usr.id as userId,
                vd.CreatedDate,
                vd.videotitle,
                evt.EventTitle,
                vd.VideoDesc,
                usr.username,
                vd.eventid,
				vd.VideoPath,
                es.RoundName as RoundName,
				cat.[Name] as CategoryName,
                COALESCE(usr.profilepic,'') As profilePic,
                (select count(VideoId) from comment where VideoId=vd.id) as commentCount,
                (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as voteCount
                FROM video vd
                JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
             	LEFT JOIN Events evt on evt.Id=vd.EventId 
				LEFT JOIN Category cat on cat.Id=vd.CategoryId
             	LEFT JOIN EventSetting es on evt.EventRoundStatusId=es.Id 
                WHERE vd.IsActive = 1 AND vd.IsDeleted = 0 AND evt.IsSemiFinalistSelected=0 AND vd.EventId IS NOT NULL
                ORDER BY (select count(VideoId) from vote where VideoId=vd.id and isvote=1) DESC 
         End
     Else
         Begin 
             SELECT  TOP(@NoOfVideos)
                vd.id as videoId,
                usr.id as userId,
                vd.CreatedDate,
                vd.videotitle,
                evt.EventTitle,
                vd.VideoDesc,
                usr.username,
                vd.eventid,
				vd.VideoPath,
                es.RoundName as RoundName,
				cat.[Name] as CategoryName,
                COALESCE(usr.profilepic,'') As profilePic,
                (select count(VideoId) from comment where VideoId=vd.id) as commentCount,
                (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as voteCount
                FROM video vd
                JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
             	LEFT JOIN Events evt on evt.Id=vd.EventId 
				LEFT JOIN Category cat on cat.Id=vd.CategoryId
             	LEFT JOIN EventSetting es on evt.EventRoundStatusId=es.Id 
                WHERE vd.IsActive = 1 AND vd.IsDeleted = 0 AND vd.CreatedDate > DATEADD(day,-@NoOfDaysDifference,getdate())AND vd.EventId IS NOT NULL
                ORDER BY vd.CreatedDate DESC 
         End
     END