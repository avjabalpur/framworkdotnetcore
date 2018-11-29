CREATE TABLE [dbo].[CompetitionStatus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CompetitionNo] [bigint] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[EventTypeId] [bigint] NULL,
 CONSTRAINT [PK_CompetitionStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]