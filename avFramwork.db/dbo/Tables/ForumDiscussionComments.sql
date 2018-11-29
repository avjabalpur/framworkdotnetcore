CREATE TABLE [dbo].[ForumDiscussionComments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CommentBy] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
	[DicussionId] [bigint] NOT NULL,
 CONSTRAINT [PK_ForumComments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ForumDiscussionComments]  WITH CHECK ADD  CONSTRAINT [FK_ForumComments_Discussion] FOREIGN KEY([DicussionId])
REFERENCES [dbo].[Discussion] ([Id])
GO

ALTER TABLE [dbo].[ForumDiscussionComments] CHECK CONSTRAINT [FK_ForumComments_Discussion]
GO
ALTER TABLE [dbo].[ForumDiscussionComments]  WITH CHECK ADD  CONSTRAINT [FK_ForumComments_Users] FOREIGN KEY([CommentBy])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[ForumDiscussionComments] CHECK CONSTRAINT [FK_ForumComments_Users]