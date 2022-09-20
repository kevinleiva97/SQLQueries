use Recipes
go
/*-----------------------Schema & Information tbl----------------------------------------*/
create schema Recipes
go
CREATE TABLE [Recipes].[Information](
	[ID_Recipe] [int] NOT NULL,
	[RecipeName] [nvarchar](50) NOT NULL,
	[SubmittedBy] [nvarchar](25) NOT NULL,
	[Reference] [nvarchar](250) NULL,
	[DateOfInsert] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Recipe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/*--------------------Ingredients Table-----------------------------------------------*/
CREATE TABLE [Recipes].[Ingredients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IngredientName] [nvarchar](100) NOT NULL,
	[Quantity] nvarchar(25) not NULL,
	[units] nvarchar(50) not NULL,
	[ID_Recipe] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Recipes].[Ingredients]  WITH CHECK ADD FOREIGN KEY([ID_Recipe])
REFERENCES [Recipes].[Information] ([ID_Recipe])
GO



/*-----------------------------------Directions Table-------------------------------------------------*/
CREATE TABLE [Recipes].[Directions](
	[Step_Id] [int] NOT NULL,
	[Direction] [nvarchar](500) NULL,
	[ID_Recipe] [int] not NULL,
Constraint PK_Directions Primary Key ([Step_Id], [ID_Recipe]))
GO

ALTER TABLE [Recipes].[Directions]  WITH CHECK ADD FOREIGN KEY([ID_Recipe])
REFERENCES [Recipes].[Information] ([ID_Recipe])
GO
