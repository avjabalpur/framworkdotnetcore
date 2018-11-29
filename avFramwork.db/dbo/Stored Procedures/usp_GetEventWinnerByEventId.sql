-- =============================================
-- Author:  <Aaaksh Pawar>
-- Create date: <12 DEC 2015>
-- Description: <Get EventWinner By EventId>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetEventWinnerByEventId]  
@eventId BIGINT
AS
BEGIN
select 
   eventWinner.Id as EventWinnerId,
   video.Id as VideoId,
   video.VideoPath as VideoPath,
   video.VideoTitle as VideoTitle,
   video.VideoDesc as VideoDesc,
   usr.id as WinnerUserId,
   usr.UserName as WinnerUserName,
   usr.Email as WinnerUserEmail,
    usr.ProfilePic as UserProfilePic,
   (select count(VideoId) from comment where VideoId=video.id) as CommmentCount,
   (select count(VideoId) from vote where VideoId=video.id and isvote=1) as VoteCount
from [dbo].[EventWinners] eventWinner
   join [dbo].[Video] video on video.Id = eventWinner.VideoId
   join [dbo].[Events] evnt on evnt.id =  video.EventId
   join [dbo].[Users] usr on usr.Id = video.UserId AND usr.IsDeleted = 0
where evnt.id = @eventId AND video.IsActive = 1
  END