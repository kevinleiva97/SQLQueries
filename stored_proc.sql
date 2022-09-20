use recipes
go

-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kevin Leiva>
-- Create date: <13/09/2022>

-- =============================================

alter PROCEDURE [dbo].NewIngredient(
@RecipeID int,
@IngredientName nvarchar(50),
@Quantity float,
@unit nvarchar(50)
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
			
			
								 
								 IF (SELECT COUNT(*) 
								 FROM [Recipes].[Recipes].[Ingredients] 
								 WHERE [ID_Recipe] = @RecipeID 
							     and [IngredientName] = @IngredientName 
								 and [Quantity] = @Quantity 
								 and [units] = @unit
								 )>0 
BEGIN 
RAISERROR('-1, Duplicate Data', -1, -1)	
END 
ELSE 
BEGIN 
		if (select count(*) from [Recipes].[Recipes].Ingredients 
		where ID in (SELECT ID FROM [Recipes].[Recipes].[Ingredients] 
								 WHERE [ID_Recipe] = @RecipeID 
							     and [IngredientName] = @IngredientName
								 and [units] = @unit))>=1
								 begin
	update [Recipes].[Recipes].Ingredients 
		set [ID_Recipe] = @RecipeID
		,[IngredientName] = @IngredientName
		,[Quantity] = cast(@Quantity as float)
		,[units] = @unit
		where ID in (SELECT ID FROM [Recipes].[Recipes].[Ingredients] 
								 WHERE [ID_Recipe] = @RecipeID 
							     and [IngredientName] = @IngredientName 
								 and [units] = @unit)
		
			Select '0, Data Update Succesully:' as 'Message', concat(@Quantity,'; ',@unit,'; ',@IngredientName) as 'Data Updated'
			end

	if (select count(*) from [Recipes].[Recipes].Ingredients 
		where ID in (SELECT ID FROM [Recipes].[Recipes].[Ingredients] 
								 WHERE [ID_Recipe] = @RecipeID 
							     and [IngredientName] = @IngredientName
								 and [units] = @unit))=0
								 begin
		
			INSERT INTO [Recipes].[Recipes].Ingredients ([ID_Recipe],[IngredientName],[Quantity],[units])
			VALUES(@RecipeID,@IngredientName,@Quantity,@unit)

			
			Select '0, Data Insert Succesully: ' as 'Message',concat(@Quantity,'; ',@unit,'; ',@IngredientName) as 'Data Inserted'
			end
			

END 
END

go


/******************************
*
*
	Using the Procedure:
*
*
*******************************/


-- Dup data errorr:
exec dbo.NewIngredient @RecipeID=1, @ingredientName = 'butter, softened', @Quantity=1, @unit = 'Cups'

-- Update data Behavior 
exec dbo.NewIngredient @RecipeID=1, @ingredientName = 'butter, softened', @Quantity=2, @unit = 'Cups'

--Insert data behavior
exec dbo.NewIngredient @RecipeID=1, @ingredientName = 'cocoa from Colombia', @Quantity=15, @unit = 'Cups'
