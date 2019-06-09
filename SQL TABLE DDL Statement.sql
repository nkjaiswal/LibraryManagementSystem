USE [LMS]
GO
/****** Object:  Table [dbo].[Book_Cat]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book_Cat](
	[Cat_id] [int] IDENTITY(1,1) NOT NULL,
	[Cat_Name] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
 CONSTRAINT [PK_Book_Cat] PRIMARY KEY CLUSTERED 
(
	[Cat_id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bookCopy]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bookCopy](
	[id] [int] NOT NULL,
	[copyid] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[available] [int] NOT NULL,
	[borrowedby] [varchar](150) COLLATE Latin1_General_CI_AI NULL,
	[lastBorrowed] [datetime] NULL,
	[lastSubmited] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Books]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Books](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Book_ISDN13] [varchar](13) COLLATE Latin1_General_CI_AI NOT NULL,
	[BooK_ISDN10] [varchar](10) COLLATE Latin1_General_CI_AI NULL,
	[Book_Title] [varchar](150) COLLATE Latin1_General_CI_AI NOT NULL,
	[Book_Author] [varchar](150) COLLATE Latin1_General_CI_AI NULL,
	[Publication] [varchar](150) COLLATE Latin1_General_CI_AI NULL,
	[img] [varchar](900) COLLATE Latin1_General_CI_AI NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Book_ISDN13] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fine]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fine](
	[FineAmt] [int] NOT NULL,
	[PaidAmt] [int] NOT NULL,
	[Bookid] [int] NOT NULL,
	[Borrower] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[ReceivedBy] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[DateRec] [datetime] NOT NULL,
	[Remarks] [varchar](1000) COLLATE Latin1_General_CI_AI NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[msg]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[msg](
	[userid] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[subject] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[body] [varchar](999) COLLATE Latin1_General_CI_AI NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_msg] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subject](
	[Sub_ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[Sub_ID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionLog]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionLog](
	[bookid] [int] NOT NULL,
	[copyid] [int] NOT NULL,
	[issuedby] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[issuedto] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[issuedate] [datetime] NOT NULL,
	[recvby] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[recvdate] [datetime] NULL,
	[fineamt] [int] NULL,
	[finePaid] [int] NULL,
	[remarks] [varchar](50) COLLATE Latin1_General_CI_AI NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserName] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[FullName] [varchar](500) COLLATE Latin1_General_CI_AI NOT NULL,
	[Address] [varchar](500) COLLATE Latin1_General_CI_AI NULL,
	[Mobile] [varchar](50) COLLATE Latin1_General_CI_AI NULL,
	[Email] [varchar](500) COLLATE Latin1_General_CI_AI NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 05/21/2015 19:39:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[username] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[password] [varchar](50) COLLATE Latin1_General_CI_AI NOT NULL,
	[type] [char](1) COLLATE Latin1_General_CI_AI NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO users VALUES('admin','admin','A');
