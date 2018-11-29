CREATE TABLE [dbo].[tbl_referral](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[useridfrom] [bigint] NULL,
	[useridto] [bigint] NULL,
	[iscoupongiven] [bit] NULL,
	[isactive] [bit] NULL,
	[isdeleted] [bit] NULL,
	[createdate] [datetime] NULL,
 CONSTRAINT [PK_tbl_referral] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]