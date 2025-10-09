CREATE TABLE Users (
  [user_id] INTEGER NOT NULL PRIMARY KEY,
  [age] INTEGER NOT NULL,
  [weight] FLOAT NOT NULL,
  [height] FLOAT NOT NULL,
  [activity_level] VARCHAR(50) NOT NULL,
  [primary_goals] VARCHAR(100) NOT NULL,
  [usual_water_intake] FLOAT NOT NULL,
  [weight_goal] FLOAT NOT NULL,
  [meals_per_day] INTEGER NOT NULL,
  [budget] FLOAT NOT NULL
);


CREATE TABLE User_Nutrition_Targets (
  [target_id] INTEGER NOT NULL PRIMARY KEY,
  [user_id] INTEGER NOT NULL,
  [calorie_target] FLOAT NOT NULL,
  [protein_ratio] FLOAT NOT NULL,
  [carb_ratio] FLOAT NOT NULL,
  [fat_ratio] FLOAT NOT NULL,
  [protein_target] FLOAT NOT NULL,
  [carb_target] FLOAT NOT NULL,
  [fat_target] FLOAT NOT NULL,
  [basal_metabolic_rate] FLOAT NOT NULL,
  [bmi] FLOAT NOT NULL,
  [total_daily_expenditure] FLOAT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Recipes (
  [recipe_id] INTEGER NOT NULL PRIMARY KEY,
  [name] VARCHAR(100) NOT NULL,
  [description] TEXT,
  [price] FLOAT NOT NULL,
  [calories] FLOAT NOT NULL,
  [protein] FLOAT NOT NULL,
  [carbs] FLOAT NOT NULL,
  [fat] FLOAT NOT NULL,
  [fiber] FLOAT NOT NULL
);


CREATE TABLE Ingredients (
  [ingredient_id] INTEGER NOT NULL PRIMARY KEY,
  [name] VARCHAR(100) NOT NULL,
  [price_per_unit] FLOAT NOT NULL,
  [calories_per_unit] FLOAT NOT NULL,
  [protein_per_unit] FLOAT NOT NULL,
  [carbs_per_unit] FLOAT NOT NULL,
  [fat_per_unit] FLOAT NOT NULL,
  [fiber_per_unit] FLOAT NOT NULL
);


CREATE TABLE Recipe_Ingredients (
  [recipe_ingredient_id] INTEGER NOT NULL PRIMARY KEY,
  [recipe_id] INTEGER NOT NULL,
  [ingredient_id] INTEGER NOT NULL,
  [quantity] FLOAT NOT NULL,
  FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
  FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);


CREATE TABLE Printers (
  [printer_id] INTEGER NOT NULL PRIMARY KEY,
  [serial_number] VARCHAR(100) NOT NULL UNIQUE,
  [model] VARCHAR(100) NOT NULL,
  [location] VARCHAR(255),
  [filament_level] FLOAT NOT NULL,
  [status] VARCHAR(50) NOT NULL,
);


CREATE TABLE Print_Jobs (
  [print_job_id] INTEGER NOT NULL PRIMARY KEY,
  [printer_id] INTEGER NOT NULL,
  [recipe_id] INTEGER NOT NULL,
  [user_id] INTEGER NOT NULL,
  [status] VARCHAR(50) NOT NULL,
  FOREIGN KEY (printer_id) REFERENCES Printers(printer_id),
  FOREIGN KEY (recipe_id) REFERENCES Recipes(recipe_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


-- Example inserts for Users
INSERT INTO Users (user_id, age, weight, height, activity_level, primary_goals, usual_water_intake, weight_goal, meals_per_day, budget) VALUES (1, 28, 70.5, 175, 'moderate', 'muscle gain', 2.5, 75, 3, 15.0);
INSERT INTO Users (user_id, age, weight, height, activity_level, primary_goals, usual_water_intake, weight_goal, meals_per_day, budget) VALUES (2, 35, 85.0, 180, 'sedentary', 'weight loss', 1.8, 78, 4, 12.0);
INSERT INTO Users (user_id, age, weight, height, activity_level, primary_goals, usual_water_intake, weight_goal, meals_per_day, budget) VALUES (3, 22, 60.0, 165, 'active', 'maintain weight', 3.0, 60, 3, 10.0);


-- Example inserts for Ingredients
INSERT INTO Ingredients (ingredient_id, name, price_per_unit, calories_per_unit, protein_per_unit, carbs_per_unit, fat_per_unit, fiber_per_unit) VALUES(1, 'Chicken Breast', 0.01, 1.65, 0.31, 0, 0.04, 0);
INSERT INTO Ingredients (ingredient_id, name, price_per_unit, calories_per_unit, protein_per_unit, carbs_per_unit, fat_per_unit, fiber_per_unit) VALUES(2, 'Brown Rice', 0.002, 1.11, 0.026, 0.23, 0.009, 0.018);
INSERT INTO Ingredients (ingredient_id, name, price_per_unit, calories_per_unit, protein_per_unit, carbs_per_unit, fat_per_unit, fiber_per_unit) VALUES(3, 'Broccoli', 0.003, 0.34, 0.028, 0.07, 0.003, 0.025);
INSERT INTO Ingredients (ingredient_id, name, price_per_unit, calories_per_unit, protein_per_unit, carbs_per_unit, fat_per_unit, fiber_per_unit) VALUES(4, 'Olive Oil', 0.02, 8.84, 0, 0, 1, 0);
INSERT INTO Ingredients (ingredient_id, name, price_per_unit, calories_per_unit, protein_per_unit, carbs_per_unit, fat_per_unit, fiber_per_unit) VALUES(5, 'Quinoa', 0.004, 1.2, 0.04, 0.21, 0.02, 0.027);
INSERT INTO Ingredients (ingredient_id, name, price_per_unit, calories_per_unit, protein_per_unit, carbs_per_unit, fat_per_unit, fiber_per_unit) VALUES(6, 'Black Beans', 0.0025, 1.34, 0.09, 0.24, 0.005, 0.06);


-- Example inserts for Recipes
INSERT INTO Recipes (recipe_id, name, description, price, calories, protein, carbs, fat, fiber) VALUES(1, 'Grilled Chicken with Rice', 'Grilled chicken breast served with brown rice and broccoli.', 5.50, 550, 45, 50, 10, 8);
INSERT INTO Recipes (recipe_id, name, description, price, calories, protein, carbs, fat, fiber) VALUES(2, 'Quinoa Salad', 'Quinoa mixed with black beans and broccoli.', 4.00, 400, 20, 60, 8, 12);
INSERT INTO Recipes (recipe_id, name, description, price, calories, protein, carbs, fat, fiber) VALUES(3, 'Chicken Stir Fry', 'Chicken breast stir-fried with broccoli and olive oil.', 6.00, 600, 50, 30, 20, 7);
INSERT INTO Recipes (recipe_id, name, description, price, calories, protein, carbs, fat, fiber) VALUES(4, 'Rice and Beans', 'Brown rice served with black beans.', 3.00, 480, 22, 80, 4, 14);
INSERT INTO Recipes (recipe_id, name, description, price, calories, protein, carbs, fat, fiber) VALUES(5, 'Broccoli and Olive Oil Salad', 'Fresh broccoli salad with olive oil dressing.', 3.00, 300, 10, 20, 25, 9);


-- Example inserts for Recipe_Ingredients
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(1, 1, 1, 150);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(2, 1, 2, 200);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(3, 1, 3, 100);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(4, 2, 5, 150);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(5, 2, 3, 80);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(6, 3, 1, 180);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(7, 3, 3, 120);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(8, 3, 4, 15);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(9, 4, 2, 180);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(10, 4, 6, 130);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(11, 5, 3, 150);
INSERT INTO Recipe_Ingredients (recipe_ingredient_id, recipe_id, ingredient_id, quantity) VALUES(12, 5, 4, 20);


-- Example inserts for Printers
INSERT INTO Printers (printer_id, serial_number, model, location, filament_level, status) VALUES(1, 'SN1001', 'FoodPrinter X1', 'Kitchen A', 75.5, 'idle');
INSERT INTO Printers (printer_id, serial_number, model, location, filament_level, status) VALUES(2, 'SN1002', 'FoodPrinter X2', 'Kitchen B', 50.0, 'printing');


-- Example inserts for Print_Jobs
INSERT INTO Print_Jobs (print_job_id, printer_id, recipe_id, user_id, status) VALUES(1, 1, 1, 1, 'completed');
INSERT INTO Print_Jobs (print_job_id, printer_id, recipe_id, user_id, status) VALUES(2, 2, 3, 2, 'printing');
INSERT INTO Print_Jobs (print_job_id, printer_id, recipe_id, user_id, status) VALUES(3, 1, 5, 3, 'queued');


-- Example inserts for User_Nutrition_Targets
INSERT INTO User_Nutrition_Targets (target_id, user_id, calorie_target, protein_ratio, carb_ratio, fat_ratio, protein_target, carb_target, fat_target, basal_metabolic_rate, bmi,total_daily_expenditure) VALUES (1, 1, 2800, 0.30, 0.40, 0.30, 210, 280, 93, 1700, 23.0, 2500);
INSERT INTO User_Nutrition_Targets (target_id, user_id, calorie_target, protein_ratio, carb_ratio, fat_ratio, protein_target, carb_target, fat_target, basal_metabolic_rate, bmi,total_daily_expenditure) VALUES (2, 2, 2000, 0.25, 0.45, 0.30, 125, 225, 67, 1500, 26.2, 1800);
INSERT INTO User_Nutrition_Targets (target_id, user_id, calorie_target, protein_ratio, carb_ratio, fat_ratio, protein_target, carb_target, fat_target, basal_metabolic_rate, bmi,total_daily_expenditure) VALUES (3, 3, 2200, 0.28, 0.42, 0.30, 154, 232, 73, 1600, 22.0, 2000);




SELECT * FROM Recipes


SELECT * FROM Print_Jobs


SELECT * FROM Printers


SELECT * FROM Users


SELECT * FROM User_Nutrition_Targets


SELECT * FROM Recipes


SELECT * FROM Recipe_Ingredients


