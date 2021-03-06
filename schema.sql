DROP DATABASE IF EXISTS dishDashboard;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS favorites;
DROP TABLE IF EXISTS groceryLists;

CREATE DATABASE dishDashboard;

CREATE TABLE users (
  id serial primary key,
  username varchar(26)
);

CREATE TABLE recipes (
  id serial primary key,
  title varchar(100),
  meal varchar(10),
  cookTime varchar(20),
  ingredients text[],
  intro text,
  instructions text[],
  closer text,
  keto boolean,
  lowCarb boolean,
  vegetarian boolean,
  creatorId int REFERENCES users (id)
);

CREATE TABLE items (
  id serial primary key,
  item varchar(40),
  details text
);

CREATE TABLE ingredients (
  id serial primary key,
  recipeId int REFERENCES recipes (id),
  itemId int REFERENCES items (id)
);

CREATE TABLE favorites (
  id serial primary key,
  userId int REFERENCES users (id),
  recipeId int REFERENCES recipes (id)
);

CREATE TABLE groceryLists (
  id serial primary key,
  title varchar(40),
  userId int REFERENCES users (id),
  itemId int REFERENCES items (id)
);

CREATE INDEX recipes_creator_index ON recipes (creatorId);
CREATE INDEX recipes_keto_index ON recipes (keto);
CREATE INDEX recipes_lowCarb_index ON recipes (lowCarb);
CREATE INDEX recipes_vegetarian_index ON recipes (vegetarian);
CREATE INDEX recipes_meal_index ON recipes (meal);

CREATE INDEX ingredients_item_index ON ingredients (itemId);
CREATE INDEX ingredients_recipe_index ON ingredients (recipeId);

CREATE INDEX favorites_user_index ON favorites (userId);

CREATE INDEX groceryLists_user_index ON groceryLists (userId);
CREATE INDEX groceryLists_title_index ON groceryLists (title);
