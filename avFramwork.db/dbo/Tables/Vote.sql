CREATE TABLE [dbo].[Vote](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[VideoId] [bigint] NOT NULL,
	[IsVote] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[VoteEventId] [bigint] NULL,
 CONSTRAINT [PK_tbl_vote] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_tbl_vote_tbl_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_tbl_vote_tbl_users]
GO
ALTER TABLE [dbo].[Vote]  WITH CHECK ADD  CONSTRAINT [FK_Vote_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Video] ([Id])
GO

ALTER TABLE [dbo].[Vote] CHECK CONSTRAINT [FK_Vote_Video]