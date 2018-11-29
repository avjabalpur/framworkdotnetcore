-- =============================================
-- Author:		aakash pawar
-- Create date: 2/3/2016
-- Description:	get forum dicussion topics
-- =============================================
CREATE PROCEDURE [dbo].[usp_GetForumDicussionTopics]
AS
BEGIN
	SELECT DiscussionTopics.Id,
	DiscussionTopics.Title,
	DiscussionTopics.CreatedBy,
	DiscussionTopics.IsActive,
	DiscussionTopics.CreatedOn,
	usr.UserName,
	usr.[Email],
	usr.[ProfilePic],
	usr.[FirstName],
	usr.[LastName]
	from [dbo].[Discussion]  DiscussionTopics
	join [dbo].[Users] usr on usr.Id =  DiscussionTopics.CreatedBy AND usr.IsDeleted = 0
	where DiscussionTopics.IsDeleted  = 0 
	order by DiscussionTopics.UpdatedOn
END