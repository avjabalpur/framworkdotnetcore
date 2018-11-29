CREATE TABLE [dbo].[EventType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NULL,
	[Created] [datetime] NOT NULL,
	[Active] [bit] NULL,
[IsDeleted] BIT NULL DEFAULT ((0)), 
    PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[EventType] ADD  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[EventType] ADD  DEFAULT ((1)) FOR [Active]