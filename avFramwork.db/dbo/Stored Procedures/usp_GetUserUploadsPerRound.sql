-- =============================================
-- Author:		Aakash Pawar
-- Create date: 11/25/2015
-- Description:	Get Event Records per Round
-- =============================================
CREATE PROCEDURE  [dbo].[usp_GetUserUploadsPerRound] -- [dbo].[usp_GetUserUploadsPerRound] 13, 40,60
@eventId BIGINT,
@userId BIGINT,
@videoId BIGINT
AS
BEGIN
			SELECT 
			vd.id as videoId,
			usr.id as userId,
			vd.videoPath,
			vd.IsActive,
			vd.videoTitle,
			vd.VideoDesc,
			vd.CreatedDate,
			usr.Username,
			vd.Eventid,
			vd.EventTypeId,
			evnt.ShowVotes,
			COALESCE(usr.profilepic,'') As profilePic,
			(select count(VideoId) from Comment where VideoId=vd.id) as commentCount,
			(select count(VideoId) from Vote where VideoId=vd.id and isvote=1) as voteCount
		   FROM Video vd
		    JOIN Events evnt on evnt.id=vd.EventId
		   JOIN Users usr on usr.id=vd.userid AND usr.IsDeleted = 0
		   WHERE vd.eventid =@eventId AND usr.Id = @userId AND vd.id=@videoId --AND vd.IsActive = 1
END