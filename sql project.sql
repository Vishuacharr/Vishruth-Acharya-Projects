create database NutritionPlannerApp;
use NutritionPlannerApp;
CREATE TABLE IF NOT EXISTS UserProfile (
    UserID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Gender CHAR(1) NOT NULL,
    Weight DECIMAL(5,2) NOT NULL,
    Height DECIMAL(5,2) NOT NULL,
    DietaryRestrictions VARCHAR(50),
    Allergies TEXT,
    ActivityLevel ENUM('sedentary', 'moderately active', 'highly active') NOT NULL,
    HealthGoals VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS NutritionPlan (
    PlanID INT PRIMARY KEY,
    UserID INT,
    RecommendedCalorieIntake DECIMAL(6,2) NOT NULL,
    MacronutrientTargets VARCHAR(100),
    MealSchedule VARCHAR(100),
    Recipes TEXT,
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID)
);
CREATE TABLE IF NOT EXISTS Recipe (
    RecipeID INT PRIMARY KEY,
    RecipeName VARCHAR(100) NOT NULL,
    Ingredients TEXT NOT NULL,
    PreparationInstructions TEXT NOT NULL,
    NutritionalInformation VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS MealLog (
    LogID INT PRIMARY KEY,
    UserID INT,
    MealDateTime DATETIME NOT NULL,
    ConsumedItems TEXT,
    QuantityConsumed DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID)
);
CREATE TABLE IF NOT EXISTS ExercisePlan (
    PlanID INT PRIMARY KEY,
    UserID INT,
    WorkoutType ENUM('cardio', 'strength training', 'flexibility') NOT NULL,
    WorkoutDuration DECIMAL(5,2) NOT NULL,
    RecommendedFrequency INT NOT NULL,
    DifficultyLevel VARCHAR(50),
    Exercises TEXT,
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID)
);
CREATE TABLE IF NOT EXISTS Exercise (
    ExerciseID INT PRIMARY KEY,
    ExerciseName VARCHAR(100) NOT NULL,
    Description TEXT,
    MusclesTargeted VARCHAR(255),
    EquipmentRequired VARCHAR(100),
    VideoTutorialLink TEXT
);
CREATE TABLE IF NOT EXISTS WorkoutLog (
    LogID INT PRIMARY KEY,
    UserID INT,
    WorkoutDateTime DATETIME NOT NULL,
    ExercisesPerformed TEXT,
    Details TEXT,
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID)
);
CREATE TABLE IF NOT EXISTS FitnessGoals (
    GoalID INT PRIMARY KEY,
    UserID INT,
    GoalType VARCHAR(100) NOT NULL,
    TargetAchievementDate DATE NOT NULL,
    ProgressTracking TEXT,
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID)
);
INSERT INTO UserProfile (UserID, Name, Age, Gender, Weight, Height, DietaryRestrictions, Allergies, ActivityLevel, HealthGoals) VALUES
(1, 'Alice Johnson', 28, 'F', 62.5, 165, 'vegetarian', 'Peanuts', 'moderately active', 'weight loss'),
(2, 'Bob Smith', 32, 'M', 78.2, 180, 'gluten-free', 'Shellfish', 'highly active', 'muscle gain'),
(3, 'Charlie Davis', 29, 'M', 70, 175, 'vegan', 'None', 'sedentary', 'maintenance');
INSERT INTO NutritionPlan (PlanID, UserID, RecommendedCalorieIntake, MacronutrientTargets, MealSchedule, Recipes) VALUES
(1, 1, 2000, 'Carbs: 50%, Protein: 30%, Fats: 20%', 'breakfast, lunch, dinner, snacks', '1,2,3'),
(2, 2, 2500, 'Carbs: 45%, Protein: 35%, Fats: 20%', 'breakfast, lunch, dinner', '4,5,6'),
(3, 3, 2100, 'Carbs: 50%, Protein: 25%, Fats: 25%', 'breakfast, lunch, dinner', '7,8,9');
INSERT INTO Recipe (RecipeID, RecipeName, Ingredients, PreparationInstructions, NutritionalInformation) VALUES
(1, 'Veggie Stir Fry', 'Bell Peppers, Broccoli, Carrots', 'Saute in a pan with olive oil for 10 minutes', 'Calories: 150, Carbs: 20g, Protein: 5g'),
(2, 'Chicken Salad', 'Chicken, Lettuce, Tomatoes', 'Mix ingredients and add dressing of choice', 'Calories: 250, Carbs: 10g, Protein: 30g'),
(3, 'Quinoa Bowl', 'Quinoa, Avocado, Black Beans', 'Cook quinoa and mix with other ingredients', 'Calories: 300, Carbs: 45g, Protein: 15g');
INSERT INTO ExercisePlan (PlanID, UserID, WorkoutType, WorkoutDuration, RecommendedFrequency, DifficultyLevel, Exercises) VALUES
(1, 1, 'cardio', 30, 5, 'Medium', '1,2'),
(2, 2, 'strength training', 45, 4, 'High', '3,4'),
(3, 3, 'flexibility', 20, 7, 'Low', '5,6');
INSERT INTO FitnessGoals (GoalID, UserID, GoalType, TargetAchievementDate, ProgressTracking) VALUES
(1, 1, 'Run a marathon', '2023-12-18', 'Training for 10 kilometers currently'),
(2, 2, 'Bench press 100kg', '2023-11-15', 'Currently benching 80kg'),
(3, 3, 'Daily yoga for a month', '2023-11-01', 'Completed 10 days consecutively');

INSERT INTO UserProfile (UserID, Name, Age, Gender, Weight, Height, DietaryRestrictions, Allergies, ActivityLevel, HealthGoals) VALUES
(4, 'Danielle Evans', 24, 'F', 58.0, 160, 'gluten-free', 'Dairy', 'highly active', 'muscle gain'),
(5, 'Edward Fox', 35, 'M', 85.0, 182, 'pescatarian', 'Wheat', 'sedentary', 'weight loss'),
(6, 'Fiona Green', 27, 'F', 65.0, 168, 'vegetarian', 'None', 'moderately active', 'maintenance'),
(7, 'George Harris', 40, 'M', 72.5, 175, 'keto', 'Eggs', 'sedentary', 'weight loss'),
(8, 'Hannah Irvine', 23, 'F', 54.0, 157, 'vegan', 'Soy', 'highly active', 'muscle gain'),
(9, 'Ian Jasper', 28, 'M', 68.0, 170, 'vegetarian', 'None', 'moderately active', 'maintenance'),
(10, 'Jasmine Knight', 30, 'F', 60.5, 162, 'pescatarian', 'Fish', 'sedentary', 'weight loss');

INSERT INTO NutritionPlan (PlanID, UserID, RecommendedCalorieIntake, MacronutrientTargets, MealSchedule, Recipes) VALUES
(4, 4, 1800, 'Carbs: 40%, Protein: 30%, Fats: 30%', 'breakfast, lunch, dinner, snacks', '10,11,12'),
(5, 5, 2400, 'Carbs: 45%, Protein: 30%, Fats: 25%', 'breakfast, lunch, dinner', '13,14,15'),
(6, 6, 2300, 'Carbs: 50%, Protein: 28%, Fats: 22%', 'breakfast, lunch, dinner, snacks', '16,17,18'),
(7, 7, 2150, 'Carbs: 48%, Protein: 27%, Fats: 25%', 'breakfast, lunch, dinner', '19,20,21'),
(8, 8, 1950, 'Carbs: 42%, Protein: 32%, Fats: 26%', 'breakfast, lunch, dinner, snacks', '22,23,24'),
(9, 9, 2200, 'Carbs: 46%, Protein: 29%, Fats: 25%', 'breakfast, lunch, dinner', '25,26,27'),
(10, 10, 2000, 'Carbs: 43%, Protein: 31%, Fats: 26%', 'breakfast, lunch, dinner, snacks', '28,29,30');

INSERT INTO Recipe (RecipeID, RecipeName, Ingredients, PreparationInstructions, NutritionalInformation) VALUES
(4, 'Spaghetti Carbonara', 'Spaghetti, Eggs, Pancetta, Parmesan Cheese', 'Boil pasta. Mix with egg and cheese. Add cooked pancetta.', 'Calories: 400, Carbs: 55g, Protein: 20g'),
(5, 'Vegan Buddha Bowl', 'Chickpeas, Spinach, Quinoa, Avocado', 'Mix cooked quinoa with roasted chickpeas, fresh spinach, and avocado slices.', 'Calories: 320, Carbs: 50g, Protein: 15g'),
(6, 'Tofu Stir Fry', 'Tofu, Snow Peas, Red Bell Pepper, Soy Sauce', 'Saute tofu until browned. Add veggies and stir-fry with soy sauce.', 'Calories: 280, Carbs: 30g, Protein: 25g'),
(7, 'Beef Steak', 'Beef, Salt, Black Pepper, Olive Oil', 'Season beef with salt and pepper. Sear on a hot pan with olive oil.', 'Calories: 500, Carbs: 0g, Protein: 40g'),
(8, 'Mango Smoothie', 'Mango, Greek Yogurt, Honey', 'Blend mango with Greek yogurt and a spoon of honey.', 'Calories: 210, Carbs: 45g, Protein: 10g'),
(9, 'Caesar Salad', 'Romaine Lettuce, Caesar Dressing, Croutons', 'Mix lettuce with dressing. Top with croutons.', 'Calories: 180, Carbs: 20g, Protein: 5g'),
(10, 'Avocado Toast', 'Bread, Avocado, Salt, Red Pepper Flakes', 'Mash avocado on toasted bread. Season with salt and red pepper flakes.', 'Calories: 250, Carbs: 30g, Protein: 8g');

INSERT INTO ExercisePlan (PlanID, UserID, WorkoutType, WorkoutDuration, RecommendedFrequency, DifficultyLevel, Exercises) VALUES
(4, 4, 'cardio', 40, 3, 'High', '7,8'),
(5, 5, 'strength training', 60, 5, 'Medium', '9,10'),
(6, 6, 'flexibility', 25, 6, 'Low', '11,12'),
(7, 7, 'cardio', 20, 4, 'Low', '13,14'),
(8, 8, 'strength training', 50, 2, 'High', '15,16'),
(9, 9, 'flexibility', 30, 7, 'Medium', '17,18'),
(10, 10, 'cardio', 35, 5, 'Medium', '19,20');


INSERT INTO FitnessGoals (GoalID, UserID, GoalType, TargetAchievementDate, ProgressTracking) VALUES
(4, 4, 'Swim 100 meters in under 1 minute', '2023-12-01', 'Currently at 1 minute 15 seconds'),
(5, 5, 'Achieve a 5-minute plank', '2024-01-10', 'Currently holding for 3 minutes'),
(6, 6, 'Climb a 5.10 difficulty rock wall', '2023-12-20', 'Currently climbing 5.8 routes'),
(7, 7, 'Cycle 50 kilometers non-stop', '2024-02-05', 'Last longest ride was 35 kilometers'),
(8, 8, 'Perform 50 consecutive push-ups', '2023-12-15', 'Currently at 30 push-ups'),
(9, 9, 'Master the crow yoga pose', '2023-11-20', 'Can hold the pose for a few seconds'),
(10, 10, 'Deadlift 150kg', '2024-03-01', 'Currently lifting 120kg');

show tables in NutritionPlannerApp;
# Find names of users who have set fitness goals and also have a nutrition plan.
SELECT UserProfile.Name
FROM UserProfile
INNER JOIN FitnessGoals ON UserProfile.UserID = FitnessGoals.UserID
INNER JOIN NutritionPlan ON UserProfile.UserID = NutritionPlan.UserID;
#List all users and their fitness goals. If a user doesn't have a fitness goal, it should still show the user's name.
SELECT UserProfile.Name, FitnessGoals.GoalType
FROM UserProfile
LEFT JOIN FitnessGoals ON UserProfile.UserID = FitnessGoals.UserID;
#List all exercises that are part of an exercise plan. If an exercise isn't linked to any user, it should still appear in the result.
SELECT UserProfile.Name, ExercisePlan.Exercises
FROM UserProfile
RIGHT JOIN ExercisePlan ON UserProfile.UserID = ExercisePlan.UserID;
#We want to find the names of users who have set fitness goals and also have an exercise plan.
SELECT f.UserID, f.GoalType, e.WorkoutType
FROM FitnessGoals f
INNER JOIN ExercisePlan e ON f.UserID = e.UserID;
#List all users with their fitness goals. If a user has set a fitness goal but doesn't have an exercise plan, they should still be included in the results.
SELECT f.UserID, f.GoalType, e.WorkoutType
FROM FitnessGoals f
LEFT JOIN ExercisePlan e ON f.UserID = e.UserID;
#List all users with their exercise plans. If a user has an exercise plan but hasn't set a specific fitness goal, they should still appear in the result.
SELECT f.UserID, f.GoalType, e.WorkoutType
FROM FitnessGoals f
RIGHT JOIN ExercisePlan e ON f.UserID = e.UserID;

#We want to identify users who have expressed a specific fitness goal and also have a preferred recipe
SELECT f.UserID, f.GoalType, r.RecipeName
FROM FitnessGoals f
INNER JOIN Recipe r ON f.UserID = r.RecipeID;
#Display all users with their fitness goals, and if they have a preferred recipe, show that too
SELECT f.UserID, f.GoalType, r.RecipeName
FROM FitnessGoals f
LEFT JOIN Recipe r ON f.UserID = r.RecipeID;
#List all recipes and if a user has set that as their preferred recipe, show their fitness goal alongside.
SELECT f.UserID, f.GoalType, r.RecipeName
FROM FitnessGoals f
RIGHT JOIN Recipe r ON f.UserID = r.RecipeID;
ALTER TABLE FitnessGoals ADD COLUMN GoalCategories VARCHAR(50);
UPDATE FitnessGoals SET GoalCategories = 'cardio' WHERE UserID IN (1, 4, 7);
UPDATE FitnessGoals SET GoalCategories = 'strength training' WHERE UserID IN (2, 5, 6, 8, 10);
UPDATE FitnessGoals SET GoalCategories = 'flexibility' WHERE UserID IN (3, 9);
select * from FitnessGoals;
#When a user sets a new fitness goal, we might want to automatically suggest and link an exercise plan.
DELIMITER //
ALTER TABLE ExercisePlan ALTER COLUMN WorkoutDuration SET DEFAULT 30;
DELIMITER //
ALTER TABLE ExercisePlan ALTER COLUMN RecommendedFrequency SET DEFAULT 3;
DELIMITER //
CREATE PROCEDURE LinkGoalToExercisePlanner(
    IN p_UserID INT,
    IN p_GoalType VARCHAR(255)
)
BEGIN
    DECLARE v_PlanType VARCHAR(50); -- to store the type of plan
    DECLARE v_DefaultDate DATE;
    DECLARE v_DefaultDuration INT;
    DECLARE v_DefaultFrequency INT;

    -- Set default values
    SET v_DefaultDate = CURDATE();
    SET v_DefaultDuration = 30;  
    SET v_DefaultFrequency = 3; 

    -- Determine the type of plan
    IF p_GoalType IN ('Run a marathon', 'Swim 100 meters in under 1 minute', 'Cycle 50 kilometers non-stop') THEN
        SET v_PlanType = 'cardio';
    ELSEIF p_GoalType IN ('Bench press 100kg', 'Perform 50 consecutive push-ups', 'Climb a 5.10 difficulty rock wall', 'Deadlift 150kg') THEN
        SET v_PlanType = 'strength training';
    ELSE
        SET v_PlanType = 'flexibility';
    END IF;

    INSERT INTO FitnessGoals (UserID, GoalType, TargetAchievementDate) VALUES (p_UserID, p_GoalType, v_DefaultDate);

    -- Insert into ExercisePlan without specifying PlanID since it's auto-incremented
    INSERT INTO ExercisePlan (UserID, WorkoutType, WorkoutDuration, RecommendedFrequency) 
    VALUES (p_UserID, v_PlanType, v_DefaultDuration, v_DefaultFrequency);
END //
DELIMITER ;
DELIMITER //
CREATE PROCEDURE LinkingGoalToExercise(
    IN p_UserID INT,
    IN p_GoalType VARCHAR(255)
)
BEGIN
    DECLARE v_PlanType VARCHAR(50); -- to store the type of plan
    DECLARE v_DefaultDate DATE;
    DECLARE v_DefaultDuration INT;
    DECLARE v_DefaultFrequency INT;

    -- Set default values
    SET v_DefaultDate = CURDATE();
    SET v_DefaultDuration = 30;  
    SET v_DefaultFrequency = 3; 

    -- Determine the type of plan
    IF p_GoalType IN ('Run a marathon', 'Swim 100 meters in under 1 minute', 'Cycle 50 kilometers non-stop') THEN
        SET v_PlanType = 'cardio';
    ELSEIF p_GoalType IN ('Bench press 100kg', 'Perform 50 consecutive push-ups', 'Climb a 5.10 difficulty rock wall', 'Deadlift 150kg') THEN
        SET v_PlanType = 'strength training';
    ELSE
        SET v_PlanType = 'flexibility';
    END IF;

    INSERT INTO FitnessGoals (UserID, GoalType, TargetAchievementDate) VALUES (p_UserID, p_GoalType, v_DefaultDate);

    -- Insert into ExercisePlan without specifying PlanID since it's auto-incremented
    INSERT INTO ExercisePlan (UserID, WorkoutType, WorkoutDuration, RecommendedFrequency) 
    VALUES (p_UserID, v_PlanType, v_DefaultDuration, v_DefaultFrequency);
END //
DELIMITER ;
CALL LinkGoalToExercisePlanner(12, 'Run a marathon');

select * from ExercisePlan;
select * from NutritionPlan;
select * from FitnessGoals;











