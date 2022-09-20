use Recipes
go

insert into [Recipes].[Recipes].[Information]	([ID_Recipe],[RecipeName],[SubmittedBy],[Reference],[DateOfInsert])
values
(1,'Kitchen Sink Cookies', 'Cara','allrecipes.com (http://allrecipes.com/Recipe/Kitchen-Sink-Cookies/Detail.aspx)',getdate()),
(2,'No Bake Cookies II','Sandy','allrecipes.com (http://allrecipes.com/Recipe/No-Bake-Cookies-II/Detail.aspx)',getdate())

go

insert into [Recipes].[Recipes].Ingredients ([IngredientName],[Quantity],[units],[ID_Recipe])
values
('butter, softened', 1,'Cups',1),
('packed brown sugar',2,'Cups',1),
('Eggs',2,'units',1),
('vanilla extract ',2,'teaspoons',1),
('all-purpose flour ',2.33,'Cups',1),
('baking soda ',1,'teaspoon',1),
('Salt',1,'teaspoon',1),
('rolled oats ',2,'Cups',1),
('semisweet chocolate chips ',1,'Cups',1),
('vanilla baking chips',1,'Cup',1),
('butterscotch chips',0.5,'Cups',1),
('chopped pecans',1,'Cup',1),
('white sugar ',2,'cups',2),
('butter',0.5,'Cups',2),
('milk',0.5,'Cups',2),
('cocoa powder',3,'tablespoons',2),
('quick cooking oats',3,'Cups',2),
('vanilla extract',1,'teaspoon',2)

go

insert into [Recipes].[Recipes].[Directions] ([Step_Id],[Direction],[ID_Recipe])
values
(1,'Preheat the oven to 375 degrees F (190 degrees C). ',1),

(2,'In a large bowl, cream together the butter and brown sugar until smooth. 
Beat in the eggs one at a time, then stir in the vanilla. Combine the flour, 
baking soda and salt; stir into the creamed mixture. Mix in the oats, chocolate chips, 
vanilla chips, butterscotch chips and chopped pecans. Drop by tablespoonfuls onto ungreased cookie sheets.
Cookies should be at least 2 inches apart',1),

(3,'Bake for 8 to 10 minutes in the preheated oven. Allow cookies to cool
on baking sheet for 5 minutes before removing to a wire rack to cool completely. ',1),

(1,'Mix together sugar, butter or margarine, and milk in a saucepan. Bring to a boil and boil for one minute, 
stirring constantly',2),

(2,'Remove from heat and mix in cocoa, quick oatmeal and vanilla. Drop by spoonfuls on waxed paper. 
',2)
