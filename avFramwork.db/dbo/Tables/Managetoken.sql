CREATE TABLE [dbo].[Managetoken](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[TokenId] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UniqueTokenId] [nvarchar](50) NOT NULL,
	[WillExpireOn] [datetime] NOT NULL,
	[RemainingUploadCount] [int] NOT NULL,
 CONSTRAINT [PK_tbl_managetoken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Managetoken]  WITH CHECK ADD  CONSTRAINT [FK_Managetoken_Token] FOREIGN KEY([TokenId])
REFERENCES [dbo].[Token] ([Id])
GO

ALTER TABLE [dbo].[Managetoken] CHECK CONSTRAINT [FK_Managetoken_Token]
GO
ALTER TABLE [dbo].[Managetoken]  WITH CHECK ADD  CONSTRAINT [FK_tbl_managetoken_tbl_users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Managetoken] CHECK CONSTRAINT [FK_tbl_managetoken_tbl_users]