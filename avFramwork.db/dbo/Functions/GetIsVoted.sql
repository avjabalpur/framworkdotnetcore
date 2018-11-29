CREATE FUNCTION [dbo].[GetIsVoted]
(
	@VideoId int,
	@EventTypeId int,
	@UserId int,
	@RoundNo int
)
RETURNS bit
AS
BEGIN
 -- Declare the return variable here
 DECLARE @IsVote bit;
 Set @IsVote = 0;
 Declare @GetCount int;

 -- Add the T-SQL statements to compute the return value here

 Select @GetCount=count(*) From dbo.Video Where Id=@VideoId and EventTypeId=@EventTypeId
 If(@GetCount>0)
 Begin
  if Exists (Select * From dbo.Vote Where VideoId=@VideoId and VoteEventId=@RoundNo and UserId=@UserId)
   Set @IsVote = 1;
  Else
   Set @IsVote = 0;
 End
 RETURN @IsVote
 -- Return the result of the function
END