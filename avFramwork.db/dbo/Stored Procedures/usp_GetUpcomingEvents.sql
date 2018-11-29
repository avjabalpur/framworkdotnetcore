CREATE PROC [dbo].[usp_GetUpcomingEvents]
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
	  FROM [dbo].[Events] where IsSemiFinalistSelected=0 And EventType=1

END