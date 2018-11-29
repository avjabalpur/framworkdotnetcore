CREATE TABLE [dbo].[Video](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EventId] [bigint] NULL,
	[UserId] [bigint] NOT NULL,
	[VideoPath] [nvarchar](100) NOT NULL,
	[VideoTitle] [nvarchar](200) NOT NULL,
	[VideoDesc] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[TokenUniqueId] [nvarchar](100) NULL,
	[MaskTypeId] [int] NULL,
	[EventTypeId] [bigint] NULL,
	[CompetitionRound] [int] NULL,
	[IsCompetitionQualified] [bit] NULL,
	[CompetitionQualifiedDate] [datetime] NULL,
	[EventStage] [int] NULL,
	[VideoThumblinePath] NVARCHAR(100) NULL, 
    CONSTRAINT [PK_tbl_vedio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_MaskingType] FOREIGN KEY([MaskTypeId])
REFERENCES [dbo].[MaskingType] ([Id])
GO

ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_MaskingType]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Users]