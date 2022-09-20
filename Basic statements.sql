use Recipes
go

-- 1. How many ingredients are in “Kitchen Sink Cookies”?

-- first way
select count(*) as 'Quantity of Ingredients'
from [Recipes].[Recipes].[Ingredients]
where [ID_Recipe] = 1
go
-- second way
select count(*) as 'Quantity of Ingredients'
from [Recipes].[Recipes].[Ingredients] a
join [Recipes].[Recipes].[Information] b
on a.Id_recipe = b.id_recipe
where [RecipeName] like 'Kitchen Sink Cookies' 


-- third way

select count(*) as 'Quantity of Ingredients'
from [Recipes].[Recipes].[Ingredients] a
where a.Id_recipe in 
(select b.id_recipe from [Recipes].[Recipes].[Information] b
where b.[RecipeName] like 'Kitchen Sink Cookies' )

/***********************************************************************************/
--2. What are the names of the three most used ingredients by quantity in all recipes authored by Cara?

-- first way
select top(3) [IngredientName], quantity
from  [Recipes].[Recipes].[Ingredients] a
where [ID_Recipe] = 1
order by quantity desc

-- second way
select top(3) [IngredientName], quantity
from  [Recipes].[Recipes].[Ingredients] a
join [Recipes].[Recipes].[Information] b
on a.Id_recipe = b.id_recipe
where [SubmittedBy] like 'Cara' 
order by quantity desc

-- third way

select top(3) [IngredientName], quantity
from  [Recipes].[Recipes].[Ingredients] a
where a.Id_recipe in 
(select b.id_recipe from [Recipes].[Recipes].[Information] b
where [SubmittedBy] like 'Cara' )
order by quantity desc



/***********************************************************************************/
--3. What is the name of all recipes that do not use egg as an ingredient?

select distinct [RecipeName]
from [Recipes].[Recipes].[Information] a
where a.Id_recipe 
not in(select distinct id_recipe 
from [Recipes].[Recipes].Ingredients b 
where b.[IngredientName]  like '%Eggs%')



/***********************************************************************************/
--4. List all ingredient names in the database sorted by name. Exclude duplicates.

select distinct [IngredientName]
from [Recipes].[Recipes].Ingredients
order by [IngredientName]

/***********************************************************************************/
--5. What are the directions, in order of the steps, for “No Bake Cookies II”?

-- First way
select Step_id, Direction
from [Recipes].[Recipes].[Directions] a
where [ID_Recipe] = 2
order by step_id

-- second way

select Step_id, Direction
from [Recipes].[Recipes].[Directions] a
where [ID_Recipe] in 
(select b.id_recipe from [Recipes].[Recipes].[Information] b
where b.[RecipeName] like 'No Bake Cookies II')
order by step_id 

--third way

select Step_id, Direction
from [Recipes].[Recipes].[Directions] a
join [Recipes].[Recipes].[Information] b
on a.Id_recipe = b.id_recipe
where [RecipeName] like 'No Bake Cookies II' 




/***********************************************************************************/
--6. What is the second word of each recipe title?


select Id_recipe,[RecipeName] ,ltrim(substring([RecipeName],charindex(' ',[RecipeName]), CHARINDEX(' ',ltrim(SUBSTRING([RecipeName],charindex(' ',[RecipeName]),LEN([RecipeName])-charindex(' ',[RecipeName])))) ))
as SecondWord
  from [Recipes].[Recipes].[Information] 

