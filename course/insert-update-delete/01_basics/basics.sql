-- show all rows from table
SELECT * FROM dish;

-- insert new dish
INSERT INTO dish VALUES
(9, 'main course', 'Cevapcici', 27);

-- insert dish w/o price
INSERT INTO dish (id, type, name) VALUES
(10, 'starter', 'Kosovo Bread');

-- insert null values
INSERT INTO dish (id, type, name, price) VALUES
(10, 'starter', 'Kosovo Bread', NULL);

-- insert multiple rows
INSERT INTO dish (id, type, name, price) VALUES
	(11, 'main course', 'Gulas s knedlikem', 29),
    (12, 'dessert', 'Vosi Hnizda', 14);

-- refresher
INSERT INTO dish (id, type, name, price) VALUES
	(13, 'main course', 'filet mignon', 50);

-- update single value
UPDATE dish
SET name = 'Spring Rolls'
WHERE name = 'Spring Scrolls';

-- update multiple values
UPDATE dish
SET
  name = 'Green Sea Dragon',
  price = 10
WHERE name = 'Prawn Salad';

-- modify multiple rows
UPDATE dish
SET price = 20
WHERE type = 'main course';

-- arithmetic
UPDATE dish
SET price = 2 * price
WHERE type = 'starter';

-- delete rows
DELETE FROM dish
WHERE type = 'dessert';

-- remove all rows within table
DELETE FROM dish;

-- * review
-- create
INSERT INTO dish (id, type, name, price) VALUES
	(4, 'main course', 'Rice and Gravy', 28);
-- update
UPDATE dish
SET price = 10
WHERE name = 'Doberge Cake';
-- delete
DELETE FROM dish
WHERE id = 1;
