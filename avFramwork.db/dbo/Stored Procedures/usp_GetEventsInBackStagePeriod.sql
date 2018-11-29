-- =============================================
-- Author:		<Aakash Pawar>
-- Create date: <23 Nov 2015>
-- Description:	<Get events for video upload which in BS period>
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetEventsInBackStagePeriod] --14
@BackStageDuration int
AS
 

BEGIN
    --declare @eventDiff  decimal(10,1)=(select cast(datediff(SECOND, BackStageCompletionDate, getdate()) as float) / 86400  from  [dbo].[Events] )
	 SELECT * 
	 from dbo.events 
	 where 
	 IsActive = 1 AND 
	 EventEndDate >= GetDate() AND 
	 IsSemiFinalistSelected = 0 AND
	 (cast(datediff(SECOND, (dateAdd(day,@BackStageDuration,EventStartDate)), getdate()) as float) / 86400) < 0 
END