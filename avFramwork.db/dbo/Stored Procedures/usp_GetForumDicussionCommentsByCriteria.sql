-- =============================================
-- Author:		aakash pawar
-- Create date: 2/3/2016
-- Description:	Get Forum comments by forumId
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetForumDicussionCommentsByCriteria]
	@DicussionId bigint
AS
BEGIN
	SELECT frmComments.id,
	frmComments.Comment,
	frmComments.CreatedOn,
	frmComments.IsActive,
	frmComments.CommentBy,
	usr.UserName,
	usr.[Email],
	usr.[ProfilePic],
	usr.[FirstName],
	usr.[LastName]
	from [dbo].[ForumDiscussionComments]  frmComments
	join [dbo].[Users] usr on usr.Id =  frmComments.CommentBy AND usr.IsDeleted = 0
	where frmComments.[DicussionId] = @DicussionId and frmComments.IsDeleted  = 0
	order by frmComments.UpdatedOn
END