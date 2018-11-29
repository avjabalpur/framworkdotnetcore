-- =============================================
-- Author:		Aakash Pawar
-- Create date: 11/25/2015
-- Description:	Get Users participated in each round
-- =============================================
CREATE PROCEDURE  [dbo].[usp_GetUsersParticipatedInEachRound] -- [usp_GetUsersParticipatedInEachRound] 19,0,1,0
@eventId BIGINT,
@NoOfVideos INT,
@userId bigint,
@roundId bigint
AS


DECLARE  @eventEndDiff INT=(SELECT DATEDIFF(DAY,EventEndDate,getdate()) FROM Events WHERE Id=@eventId)
  print @eventEndDiff

if(@NoOfVideos <> 0)
begin
if(@NoOfVideos  = 1)
begin 
SELECT  TOP(@NoOfVideos)
   vd.id as videoId,
   usr.id as userId,
   vd.videopath,
    vd.IsActive,
   vd.CreatedDate,
   vd.videotitle,
   evt.ShowVotes,
   vd.VideoDesc,
   usr.username,
   vd.eventid,
   MaskingType.Id as MaskingTypeId,
   MaskingType.Name as MaskingTypeName,
    (select RoundName from [dbo].[EventSetting] where Id= @roundId) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
   case when @eventEndDiff < 0 then 1 else 0  end As IsEventActive,
  -- 0 as RoundType,
   (select count(VideoId) from comment where VideoId=vd.id) as commentCount,
   (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as voteCount,
   CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS isVote
     FROM video vd
     JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
     LEFT JOIN vote vt on vt.userid=@UserId and vt.videoId=vd.id and isvote=1
	 LEFT JOIN Events evt on evt.Id=vd.EventId 
	 -- LEFT JOIN EventSetting es on evt.EventRoundStatusId = es.Id 
     WHERE vd.eventid=@EventId AND vd.IsDeleted = 0
     ORDER BY (select count(VideoId) from vote where VideoId=vd.id and isvote=1) DESC 
end 
else begin 
SELECT  TOP(@NoOfVideos)
   vd.id as videoId,
   usr.id as userId,
   vd.videopath,
    vd.IsActive,
   vd.CreatedDate,
   vd.videotitle,
   evt.ShowVotes,
   vd.VideoDesc,
   usr.username,
   vd.eventid,
      MaskingType.Id as MaskingTypeId,
   MaskingType.Name as MaskingTypeName,
  (select RoundName from [dbo].[EventSetting] where Id= @roundId) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
   case when @eventEndDiff < 0 then 1 else 0  end As IsEventActive,
  -- 0 as RoundType,
   (select count(VideoId) from comment where VideoId=vd.id) as commentCount,
   (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as voteCount,
   CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS isVote
     FROM video vd
     JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
     LEFT JOIN vote vt on vt.userid=@UserId and vt.videoId=vd.id and isvote=1
	 LEFT JOIN Events evt on evt.Id=vd.EventId 
	 --  LEFT JOIN EventSetting es on evt.EventRoundStatusId=es.Id 
     WHERE vd.eventid=@EventId AND vd.IsDeleted = 0 AND IsSemiFinalistSelected = 0
     ORDER BY (select count(VideoId) from vote where VideoId=vd.id and isvote=1) DESC 
end
end
else
begin
SELECT 
   vd.id as videoId,
   usr.id as userId,
   vd.videopath,
    vd.IsActive,
   vd.CreatedDate,
   vd.videotitle,
   evt.ShowVotes,
   vd.VideoDesc,
   usr.username,
   vd.eventid,
      MaskingType.Id as MaskingTypeId,
   MaskingType.Name as MaskingTypeName,
     (select RoundName from [dbo].[EventSetting] where Id= @roundId) as RoundName,
   COALESCE(usr.profilepic,'') As profilePic,
   case when @eventEndDiff < 0 then 1 else 0  end As IsEventActive,
  -- 0 as RoundType,-- BackStagePeriod
   (select count(VideoId) from comment where VideoId=vd.id) as commentCount,
   (select count(VideoId) from vote where VideoId=vd.id and isvote=1) as voteCount,
   CASE WHEN vt.id IS NOT NULL THEN 'True' ELSE 'False' END AS isVote
     FROM video vd
     JOIN users usr on usr.id=vd.userid AND usr.IsDeleted = 0
	 LEFT JOIN MaskingType MaskingType on MaskingType.id=vd.MaskTypeId
     LEFT JOIN vote vt on vt.userid=@UserId and vt.videoId=vd.id and isvote=1
	 LEFT JOIN Events evt on evt.Id=vd.EventId 
	  -- LEFT JOIN EventSetting es on evt.EventRoundStatusId=es.Id 
     WHERE vd.eventid=@EventId AND vd.IsDeleted = 0 AND IsSemiFinalistSelected = 0
     ORDER BY (select count(VideoId) from vote where VideoId=vd.id and isvote=1) DESC 
end