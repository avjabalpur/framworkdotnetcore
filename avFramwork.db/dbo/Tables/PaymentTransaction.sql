CREATE TABLE [dbo].[PaymentTransaction](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[TransactionNumber] [nvarchar](500) NOT NULL,
	[Amount] [float] NOT NULL,
	[TokenId] [bigint] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tbl_paymenttransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PaymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTransaction_Token] FOREIGN KEY([TokenId])
REFERENCES [dbo].[Token] ([Id])
GO

ALTER TABLE [dbo].[PaymentTransaction] CHECK CONSTRAINT [FK_PaymentTransaction_Token]
GO
ALTER TABLE [dbo].[PaymentTransaction]  WITH CHECK ADD  CONSTRAINT [FK_PaymentTransaction_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[PaymentTransaction] CHECK CONSTRAINT [FK_PaymentTransaction_Users]