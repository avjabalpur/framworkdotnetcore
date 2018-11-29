-- =============================================
-- Author:		Aakash Pawar
-- Description:	Get All active rounds
-- =============================================
create PROCEDURE [dbo].[usp_GetAllActiveEventRounds] 
AS
BEGIN
	select Id,RoundName,ImageName from [dbo].[EventSetting] where IsDeleted =0
END