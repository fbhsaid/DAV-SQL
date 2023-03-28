-- Drop tables before creating
DROP TABLE IF EXISTS Product CASCADE;
DROP TABLE IF EXISTS ProductSubcategory CASCADE;
DROP TABLE IF EXISTS ProductCategory CASCADE;

-- Create product category table and set category id as primary key
CREATE TABLE ProductCategory (
    CategoryID SERIAL PRIMARY KEY,
    Category_Name VARCHAR(255) UNIQUE
);

-- Create product subcategory table and set subcategory id as primary key, while incorporating a category id as foreign key to link to category table
CREATE TABLE ProductSubcategory (
    SubcategoryID SERIAL PRIMARY KEY,
    Subcategory_Name VARCHAR(255) UNIQUE,
    CategoryID INTEGER NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES ProductCategory(CategoryID)
);

-- Create product table and set product id as primary key, while incorporating a subcategory id as foreign key to link to subcategory table
CREATE TABLE Product (
    ProductID SERIAL PRIMARY KEY,
    Product_Name VARCHAR(255),
    SubcategoryID INTEGER NOT NULL,
    FOREIGN KEY (SubcategoryID) REFERENCES ProductSubcategory(SubcategoryID)
);

BEGIN;

-- Insert categories 'Stationery' and 'Electronic'
INSERT INTO ProductCategory (Category_Name) VALUES ('Stationery');
INSERT INTO ProductCategory (Category_Name) VALUES ('Electronic');

-- Insert subcategories 'Pen', 'Eraser', 'Monitor', 'Mouse'
INSERT INTO ProductSubcategory (Subcategory_Name, CategoryID) VALUES ('Pen', 1);
INSERT INTO ProductSubcategory (Subcategory_Name, CategoryID) VALUES ('Eraser', 1);
INSERT INTO ProductSubcategory (Subcategory_Name, CategoryID) VALUES ('Monitor', 2);
INSERT INTO ProductSubcategory (Subcategory_Name, CategoryID) VALUES ('Mouse', 2);

-- Insert various products for subcategory 'Pen'
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Parker', 1);
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Pioneer', 1);
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Lamy', 1);

-- Insert various products for subcategory 'Eraser'
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Pentel', 2);
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Staedler', 2);
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Kokuyo', 2);

-- Insert various products for subcategory 'Monitor'
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Acer', 3);
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Apple', 3);
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Samsung', 3);

-- Insert various products for subcategory 'Mouse'
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Logitech', 4);
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Asus', 4);
INSERT INTO Product (Product_Name, SubcategoryID) VALUES ('Razer', 4);

COMMIT;