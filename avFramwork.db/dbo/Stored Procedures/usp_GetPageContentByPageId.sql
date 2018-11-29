-- =============================================
-- Author:		Aakash Pawar
-- Description:	Get Page Content By PageId
-- =============================================
create PROCEDURE [dbo].[usp_GetPageContentByPageId]
@PageId  bigint
AS
BEGIN
	select Id,KeyTitle,Value,PageId from [dbo].[PageContent] where PageId= @PageId
END