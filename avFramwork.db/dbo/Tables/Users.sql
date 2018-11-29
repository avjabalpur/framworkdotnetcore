CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[ProfilePic] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsToken] [bit] NULL,
	[NumberOfToken] [int] NULL,
	[AboutMe] [nvarchar](max) NULL,
	[Info] [nvarchar](max) NULL,
	[FbConnection] [nvarchar](max) NULL,
	[TwitterConnection] [nvarchar](max) NULL,
	[GooglePlusConnection] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[state] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[ZipCode] [nvarchar](max) NULL,
	[Age] [int] NULL,
	[Dbo] [date] NULL,
	[promocode] [nvarchar](50) NULL,
	[refralcode] [nvarchar](200) NULL,
 CONSTRAINT [PK_tbl_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]