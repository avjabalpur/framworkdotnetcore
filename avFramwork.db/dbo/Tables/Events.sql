CREATE TABLE [dbo].[Events](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EventTypeId] BIGINT NULL,
	[CreatorId] [bigint] NOT NULL,
	[EventTitle] [nvarchar](50) NOT NULL,
	[EventDesc] [nvarchar](max) NOT NULL,
	[EventStartDate] [datetime] NOT NULL,
	[EventImage] [nvarchar](200) NOT NULL,
	[EventEndDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ShowVotes] [bit] NOT NULL,
	[BackStageCompletionDate] [datetime] NOT NULL,
	[IsSemiFinalistSelected] [bit] NOT NULL,
	[GroupEventId] [bigint] NOT NULL,
	[EventRoundStatusId] [bigint] NOT NULL,
	[CurrentRoundEndDate] [datetime] NOT NULL,
	[EventType] [int] NOT NULL,
 CONSTRAINT [PK_tbl_events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY], 
    CONSTRAINT [FK_Events_EventType] FOREIGN KEY ([EventTypeId]) REFERENCES [EventType]([Id])
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_EventSetting] FOREIGN KEY([EventRoundStatusId])
REFERENCES [dbo].[EventRounds] ([Id])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_EventSetting]
GO

ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_tbl_events_tbl_users] FOREIGN KEY([CreatorId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_tbl_events_tbl_users]