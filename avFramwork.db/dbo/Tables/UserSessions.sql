CREATE TABLE [dbo].[UserSessions](
	[SessionId] [uniqueidentifier] NOT NULL,
	[SessionToken] [nvarchar](500) NOT NULL,
	[UserName] [varchar](200) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Expires] [datetime] NULL,
	[Timeout] [int] NULL,
	[Locked] [bit] NULL,
	[Flag] [int] NULL,
	[Data] [varchar](max) NULL,
 CONSTRAINT [PK_UserSessions] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]