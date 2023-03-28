-- Drop the products_dim table if exists
DROP TABLE IF EXISTS products_dim;

-- Create the products_dim table
CREATE TABLE products_dim (
    ProductID INTEGER PRIMARY KEY,
    Product_Name VARCHAR(255),
    SubcategoryID INTEGER,
    Subcategory_Name VARCHAR(255),
    CategoryID INTEGER,
    Category_Name VARCHAR(255)
);

-- Populate the products_dim table with denormalized information from the other three tables
INSERT INTO products_dim (ProductID, Product_Name, SubcategoryID, Subcategory_Name, CategoryID, Category_Name) VALUES
(1, 'Parker', 1, 'Pen', 1, 'Stationery'),
(2, 'Pioneer', 1, 'Pen', 1, 'Stationery'),
(3, 'Lamy', 1, 'Pen', 1, 'Stationery'),
(4, 'Pentel', 2, 'Eraser', 1, 'Stationery'),
(5, 'Staedler', 2, 'Eraser', 1, 'Stationery'),
(6, 'Kokuyo', 2, 'Eraser', 1, 'Stationery'),
(7, 'Acer', 3, 'Monitor', 2, 'Electronic'),
(8, 'Apple', 3, 'Monitor', 2, 'Electronic'),
(9, 'Samsung', 3, 'Monitor', 2, 'Electronic'),
(10, 'Logitech', 4, 'Mouse', 2, 'Electronic'),
(11, 'Asus', 4, 'Mouse', 2, 'Electronic'),
(12, 'Razer', 4, 'Mouse', 2, 'Electronic');

-- Display the products_dim table
SELECT * FROM products_dim;