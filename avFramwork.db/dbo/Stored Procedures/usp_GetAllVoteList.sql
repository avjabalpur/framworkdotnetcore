CREATE PROCEDURE [dbo].[usp_GetAllVoteList]--  [dbo].[usp_GetAllVoteList] 3,1,1
(
	@EventId int,
	@CompetitionRound int,
	@EventTypeId int
)
AS
BEGIN

IF(@CompetitionRound !=0)
BEGIN
	Select  d.VideoId,count(isvote) as vote From dbo.Video v 
	inner join dbo.Vote d on v.Id =d.VideoId
	Where v.IsDeleted =0  and d.VoteEventId = @EventId and v.CompetitionRound = @CompetitionRound and v.EventTypeId=@EventTypeId
	Group by d.VideoId Order by vote Desc
	END

	IF(@CompetitionRound =0)
BEGIN
	Select  d.VideoId,count(isvote) as vote From dbo.Video v 
	inner join dbo.Vote d on v.Id =d.VideoId
	inner join dbo.EventWinners e on v.Id=e.VideoId
	Where d.VoteEventId = @EventId and e.EventTypeId=@EventTypeId
	Group by d.VideoId Order by vote Desc
	END
END