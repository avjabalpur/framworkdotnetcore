-- =============================================
-- Author:		Aakash Pawar
-- Create date: 25 Nov 2015
-- Description:	Get GroupEvent Status And RoundType
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetGroupEventStatusAndRoundType]-- [dbo].[usp_GetGroupEventStatusAndRoundType]  1
@groupeventId BIGINT
AS
BEGIN
  Declare @eventDiff  decimal(10,1)=(select cast(datediff(SECOND, startDate, getdate()) as float) / 86400  from   [dbo].[GroupEvent] where id=@groupeventId)
  DECLARE  @eventEndDiff INT=(SELECT DATEDIFF(DAY,EndDate,getdate()) FROM [dbo].[GroupEvent] WHERE Id=@groupeventId)
  Declare @IsEventStarted  bit=(select [IsStarted]  from [dbo].[GroupEvent] where id=@groupeventId)
	IF(@IsEventStarted = 0 )
	 BEGIN
	     Select 
         0 as IsEventOver,
		 7 as RoundType,
		  1 as IsRoundActive,
		 [IsStarted] as IsStarted, 
		 startDate as RoundStartDate,
         (select dateAdd(hour,156,StartDate) from [dbo].[GroupEvent] where id=@groupeventId ) as RoundEndDate-- 156 :6.5 days
         from [dbo].[GroupEvent] where id=@groupeventId
     END 
	else
	IF(@eventDiff <= 6.5 )
	 BEGIN
	     Select 
         startDate as RoundStartDate,
         0 as IsEventOver,
		 8 as RoundType,
		 1 as IsRoundActive,
		 [IsStarted] as IsStarted, 
         (select dateAdd(hour,156,StartDate) from [dbo].[GroupEvent] where id=@groupeventId ) as RoundEndDate-- 156 :6.5 days
         from [dbo].[GroupEvent] where id=@groupeventId
     END 
	else
	IF(@eventDiff > 6.5  AND @eventDiff <=7)
	 BEGIN
	     Select 
         startDate as RoundStartDate,
         0 as IsEventOver,
		 8 as RoundType,
		 0 as IsRoundActive,
		 [IsStarted] as IsStarted, 
         (select dateAdd(hour,156,StartDate) from [dbo].[GroupEvent] where id=@groupeventId ) as RoundEndDate-- 156 :6.5 days
         from [dbo].[GroupEvent] where id=@groupeventId
     END 
	 else
	IF(@eventDiff > 7 AND @eventDiff <= 13.5) 
	 BEGIN
		Select 
		 0 as IsEventOver,
		 9 as RoundType,
		  1 as IsRoundActive,
	     [IsStarted] as IsStarted, 
        (select dateAdd(hour,168,StartDate) from [dbo].[GroupEvent] where id=@groupeventId) as RoundStartDate, -- 168: 7 days
        (select dateAdd(hour,324,StartDate) from [dbo].[GroupEvent] where id=@groupeventId) as RoundEndDate --324: 13.5 days
        from [dbo].[GroupEvent] where id=@groupeventId
	 END
	 else
	 IF(@eventDiff > 13.5  AND @eventDiff <=14)
	 BEGIN
	     Select 
         0 as IsEventOver,
		 9 as RoundType,
		 0 as IsRoundActive,
	     [IsStarted] as IsStarted, 
        (select dateAdd(hour,168,StartDate) from [dbo].[GroupEvent] where id=@groupeventId) as RoundStartDate, -- 168: 7 days
        (select dateAdd(hour,324,StartDate) from [dbo].[GroupEvent] where id=@groupeventId) as RoundEndDate --324: 13.5 days
         from [dbo].[GroupEvent] where id=@groupeventId
     END 
	 else
	IF(@eventDiff > 14) 
	 BEGIN
		Select 
		 1 as IsEventOver,
		 10 as RoundType,
		  1 as IsRoundActive,
	     [IsStarted] as IsStarted, 
        (select dateAdd(hour,336,StartDate) from [dbo].[GroupEvent] where id=@groupeventId) as RoundStartDate, -- 14 days
        (select Enddate from [dbo].[GroupEvent] where id=@groupeventId) as RoundEndDate --Event Over
        from [dbo].[GroupEvent] where id=@groupeventId
	 END

END