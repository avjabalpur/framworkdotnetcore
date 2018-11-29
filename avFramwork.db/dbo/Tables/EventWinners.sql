CREATE TABLE [dbo].[EventWinners](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[VideoId] [bigint] NOT NULL,
	[EventId] [bigint] NULL,
	[EventTypeId] [bigint] NULL,
 CONSTRAINT [PK_EventWinners] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventWinners]  WITH CHECK ADD  CONSTRAINT [FK_EventWinners_Video] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Video] ([Id])
GO

ALTER TABLE [dbo].[EventWinners] CHECK CONSTRAINT [FK_EventWinners_Video]