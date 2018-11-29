-- =============================================
-- Author:		Aakash Pawar
-- Description:	Get Vocal And Instrumental Videos
-- =============================================
create PROCEDURE [dbo].[usp_GetVocalAndInstrumentalVideos]
@CategoryId  bigint
AS
BEGIN
	select Id, FileName,VideoTitle, @CategoryId as CategoryId, VideoUrl from [dbo].[VideoGallery] where IsDeleted =0 AND IsActive =1 AND CategoryId = @CategoryId 
END