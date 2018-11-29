CREATE PROCEDURE [dbo].[usp_CheckEventStatus]  
@eventId BIGINT,
@userId BIGINT,
@BackStageDuration int
AS
BEGIN
declare @eventDiff  decimal(10,1)=(select cast(datediff(SECOND, Dateadd(day,@BackStageDuration,EventStartDate), getdate()) as float) / 86400 
                                  from  [dbo].[Events] where id=@eventId and IsSemiFinalistSelected = 0)
  --DECLARE  @eventDiff INT=(SELECT DATEDIFF(DAY,eventstartdate,getdate()) FROM Events WHERE id=@eventId)
  SELECT CASE WHEN @eventDiff>=0 THEN 0 ELSE 1 END isUploading --isUploading 1: Event is in BackStage Period 
														         --isUploading 0: Event is Ready to vote
END