CREATE TABLE [dbo].[UserTokensRequests](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[RequestedByUserId] [bigint] NOT NULL,
	[TokenId] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsGranted] [bit] NOT NULL,
	[GrantedTokenId] [bigint] NULL,
	[GrantedOn] [datetime] NULL,
 CONSTRAINT [PK_UserTokensRequests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserTokensRequests]  WITH CHECK ADD  CONSTRAINT [FK_UserTokensRequests_Managetoken] FOREIGN KEY([GrantedTokenId])
REFERENCES [dbo].[Managetoken] ([Id])
GO

ALTER TABLE [dbo].[UserTokensRequests] CHECK CONSTRAINT [FK_UserTokensRequests_Managetoken]
GO
ALTER TABLE [dbo].[UserTokensRequests]  WITH CHECK ADD  CONSTRAINT [FK_UserTokensRequests_Token] FOREIGN KEY([TokenId])
REFERENCES [dbo].[Token] ([Id])
GO

ALTER TABLE [dbo].[UserTokensRequests] CHECK CONSTRAINT [FK_UserTokensRequests_Token]
GO
ALTER TABLE [dbo].[UserTokensRequests]  WITH CHECK ADD  CONSTRAINT [FK_UserTokensRequests_Users] FOREIGN KEY([RequestedByUserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[UserTokensRequests] CHECK CONSTRAINT [FK_UserTokensRequests_Users]