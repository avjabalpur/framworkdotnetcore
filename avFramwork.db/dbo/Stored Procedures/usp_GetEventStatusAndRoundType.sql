-- =============================================
-- Author:		Aakash Pawar
-- Create date: 25 Nov 2015
-- Description:	GetEventStatus And RoundType
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetEventStatusAndRoundType]-- [dbo].[usp_GetEventStatusAndRoundType]  2
@eventId BIGINT
AS
BEGIN
  select  e.id as eventId,
          1 as IsRoundActive,
		  e.[CurrentRoundEndDate] as CurrentRoundEndDate,
          es.[RoundName] as RoundName,
          CASE WHEN EventEndDate> GetDAte() THEN 0 ELSE 1 END as IsEventOver
  
   from Events e
   join EventSetting es on es.Id =e.EventRoundStatusId 
   where e.Id=@eventId 
	
END