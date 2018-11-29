CREATE TABLE [dbo].[GrantedTokens](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UniqueToken] [nvarchar](500) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_GrantedTokens] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GrantedTokens]  WITH CHECK ADD  CONSTRAINT [FK_GrantedTokens_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[GrantedTokens] CHECK CONSTRAINT [FK_GrantedTokens_Users]