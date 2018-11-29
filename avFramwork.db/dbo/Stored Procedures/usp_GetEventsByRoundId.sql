CREATE PROC [dbo].[usp_GetEventsByRoundId]
@EventRoundId bigint
AS
BEGIN

	SELECT id
		  ,[creatorid]
		  ,[eventtitle]
		  ,[eventdesc]
		  ,[eventstartdate]
		  ,[eventImage]
		  ,[eventenddate]
		  ,[createdate]
		  ,[isactive]
		  ,[isdeleted]
	  FROM [dbo].[Events] where EventRoundStatusId = @EventRoundId

END