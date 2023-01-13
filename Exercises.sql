-- exersises from https://sql-ex.ru/

/*
 Short database description "Computer firm"

The database scheme consists of four tables:
Product(maker, model, type)
PC(code, model, speed, ram, hd, cd, price)
Laptop(code, model, speed, ram, hd, screen, price)
Printer(code, model, color, type, price)
The Product table contains data on the maker, model number, and type of product ('PC', 'Laptop', or 'Printer'). It is assumed that model numbers in the Product table are unique for all makers and product types. Each personal computer in the PC table is unambiguously identified by a unique code, and is additionally characterized by its model (foreign key referring to the Product table), processor speed (in MHz) – speed field, RAM capacity (in Mb) - ram, hard disk drive capacity (in Gb) – hd, CD-ROM speed (e.g, '4x') - cd, and its price. The Laptop table is similar to the PC table, except that instead of the CD-ROM speed, it contains the screen size (in inches) – screen. For each printer model in the Printer table, its output type (‘y’ for color and ‘n’ for monochrome) – color field, printing technology ('Laser', 'Jet', or 'Matrix') – type, and price are specified.
 */
CREATE database Exercises;
CREATE table Exercises.Product (maker varchar(10), model varchar(50) unique, product_type varchar(50));
INSERT INTO Exercises.Product (maker, model, product_type)
VALUES ('a', '1232', 'pc'), ('a', '1233', 'pc'), ('a', '1276', 'printer'), ('a', '1298', 'laptop'), 
('a', '1401', 'printer'), ('a', '1408', 'printer'), ('a', '1752', 'laptop'), ('b', '1121', 'pc'),
('b', '1750', 'laptop'), ('c', '1321', 'laptop'), ('d', '1288', 'printer'), ('d', '1433', 'printer'), 
('e', '1260', 'pc'), ('e', '1434', 'printer'), ('e', '2111', 'pc'), ('e', '2112', 'pc');
SELECT * from Exercises.Product;

CREATE table Exercises.PC (code int, model varchar(50), speed smallint, ram smallint, hd real, cd varchar(10), price float);
INSERT INTO Exercises.PC (code, model, speed, ram, hd, cd, price)
VALUES (10, '1260', 500, 32, 10, '12x', 350.00 ), (11, '1233', 900, 128, 40, '40x', 980.00 ), (12, '1233', 800, 128, 20, '50x', 970.00 ),
(1, '1232', 500, 64, 5, '12x', 600.00 ), (2, '1121', 750, 128, 14, '40x', 850.00 ), (3, '1233', 500, 64, 5, '12x', 600.00 ),
(4, '1121', 600, 128, 14, '40x', 850.00 ), (5, '1121', 600, 128, 8, '40x', 850.00 ), (6, '1233', 750, 128, 20, '50x', 950.00 ),
(7, '1232', 500, 32, 10, '12x', 400.00 ), (8, '1232', 450, 64, 8, '24x', 350.00 ), (9, '1232', 450, 32, 10, '24x', 350.00 );
SELECT * from Exercises.PC;

CREATE table Exercises.Laptop (code int, model varchar(50), speed smallint, ram smallint, hd real, price float, screen int);
INSERT INTO Exercises.Laptop (code, model, speed, ram, hd, price, screen)
VALUES (1, '1298', 350, 32, 4, 700.00, 11), (2, '1321', 500, 64, 8, 970.00, 12), (3, '1750', 750, 128, 12, 1200.00, 14),
(4, '1298', 600, 64, 10, 1050.00, 15), (5, '1752', 750, 128, 10, 1150.00, 14), (6, '1298', 450, 64, 10, 950.00, 12);
SELECT * from Exercises.Laptop;

CREATE table Exercises.Printer (code int, model varchar(50), color char(1), printer_type varchar(10), price float);
INSERT INTO Exercises.Printer (code, model, color, printer_type, price)
VALUES (1, '1276', 'n', 'laser', 400.00), (2, '1433', 'y', 'jet', 270.00), (3, '1434', 'y', 'jet', 290.00), 
(4, '1401', 'n', 'matrix', 150.00), (5, '1408', 'n', 'matrix', 270.00), (6, '1288', 'n', 'laser', 400.00);
SELECT * from Exercises.Printer;

-- Exercise: 1  Find the model number, speed and hard drive capacity for all the PCs with prices below $500. Result set: model, speed, hd.

SELECT model, speed, hd from PC WHERE price < 500;

-- Exercise: 2 List all printer makers. Result set: maker.

SELECT DISTINCT Maker from Product WHERE product_type = 'Printer';

-- Exercise: 3 Find the model number, RAM and screen size of the laptops with prices over $1000.

SELECT model, ram, screen from Laptop WHERE price > 1000;

-- Exercise: 4 Find all records from the Printer table containing data about color printers.

SELECT * from Printer WHERE color = 'y';

-- Exercise: 5 Find the model number, speed and hard drive capacity of PCs cheaper than $600 having a 12x or a 24x CD drive.

SELECT PC.model, speed, PC.hd from PC WHERE PC.price < 600 and PC.cd in(12, 24);