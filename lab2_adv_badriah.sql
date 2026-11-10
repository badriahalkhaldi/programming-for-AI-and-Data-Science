-- ==========================================
-- Lab 2: Loading and Querying Data - Exercises
-- ==========================================
INSERT INTO products (sku, product_name, category, brand, unit_price, stock_qty)
VALUES
('ELC002', 'Nova Phone X1 128GB', 'Electronics', 'TechNova', 1899.00, 60),
('ELC003', 'Nova Tablet 10-inch', 'Electronics', 'TechNova', 1099.00, 40),
('ELC004', 'Wireless Earbuds Pro', 'Electronics', 'SoundWave', 249.00, 150),
('ELC005', 'Smart Watch S2', 'Electronics', 'SoundWave', 599.00, 0),
('ELC006', 'Power Bank 20000mAh', 'Electronics', 'ChargeGo', 129.00, 200),
('HMK001', 'Air Fryer 5L', 'Home & Kitchen', 'HomeEase', 349.00, 45),
('HMK002', 'Electric Kettle 1.7L', 'Home & Kitchen', 'HomeEase', 99.00, 120),
('HMK003', 'Arabic Coffee Dallah Set', 'Home & Kitchen', 'Najd Classics', 189.00, 35),
('HMK004', 'Rice Cooker 1.8L', 'Home & Kitchen', 'HomeEase', 215.00, 50),
('HMK005', 'Robot Vacuum Cleaner', 'Home & Kitchen', 'CleanBot', 899.00, 12);

-- =====================================================
-- Lab 2: Inserting Products and Customers (All-in-One)
-- =====================================================

-- 1. Insert grocery products with brands
INSERT INTO products (sku, product_name, category, brand, unit_price, stock_qty)
VALUES
('GRC001', 'Ajwa Dates 1kg', 'Grocery', 'Desert Harvest', 85.00, 300),
('GRC002', 'Sukkari Dates 3kg Box', 'Grocery', 'Desert Harvest', 120.00, 180),
('GRC003', 'Arabic Coffee Beans 500g', 'Grocery', 'Najd Classics', 65.00, 220);

-- 2. Insert products with missing brand (defaults to NULL)
INSERT INTO products (sku, product_name, category, unit_price, stock_qty)
VALUES
('GRC004', 'Sidr Honey 500g', 'Grocery', 14.00, 90),
('GRC005', 'Basmati Rice 5kg', 'Grocery', 52.00, 400);

-- 3. Insert more products (Olive oil, fashion, and beauty items)
INSERT INTO products (sku, product_name, category, brand, unit_price, stock_qty)
VALUES
('GRC006', 'Extra Virgin Olive Oil 1L', 'Grocery', 'Desert Harvest', 58.00, 160),
('FSH001', 'Men Cotton Thobe', 'Fashion', 'Najd Classics', 180.00, 70),
('FSH002', 'Women Everyday Abaya', 'Fashion', 'Najd Classics', 260.00, 55),
('FSH003', 'Running Shoes', 'Fashion', 'StridePro', 329.00, 80),
('FSH004', 'Laptop Backpack', 'Fashion', 'StridePro', 119.00, 130),
('BTY001', 'Oud Perfume 50ml', 'Beauty', 'AromaOud', 450.00, 40),
('BTY002', 'Bakhoor Incense Box', 'Beauty', 'AromaOud', 75.00, 110);

-- 4. Insert the last product (Hand cream with no brand)
INSERT INTO products (sku, product_name, category, unit_price, stock_qty)
VALUES
('BTY003', 'Rose Hand Cream 100ml', 'Beauty', 29.00, 260);

-- Check total products count (should be 24)
SELECT COUNT(*) AS total_products FROM products;

-- 5. Insert all 20 customers
INSERT INTO customers (first_name, last_name, email, phone, city, joined_date)
VALUES
('Fahad', 'Al-Qahtani', 'fahad.qahtani@example.com', '0551000101', 'Riyadh', '2024-01-15'),
('Noura', 'Al-Otaibi', 'noura.otaibi@example.com', '0551000102', 'Riyadh', '2024-02-03'),
('Abdullah', 'Al-Ghamdi', 'abdullah.ghamdi@example.com', NULL, 'Jeddah', '2024-02-20'),
('Reem', 'Al-Harbi', 'reem.harbi@example.com', '0551000104', 'Jeddah', '2024-03-11'),
('Khalid', 'Al-Shehri', 'khalid.shehri@example.com', '0551000105', 'Dammam', '2024-03-29'),
('Sara', 'Al-Zahrani', 'sara.zahrani@example.com', '0551000106', 'Khobar', '2024-04-12'),
('Omar', 'Al-Dosari', 'omar.dosari@example.com', NULL, 'Riyadh', '2024-05-01'),
('Layla', 'Al-Mutairi', 'layla.mutairi@example.com', '0551000108', 'Makkah', '2024-05-18'),
('Yousef', 'Al-Subaie', 'yousef.subaie@example.com', '0551000109', 'Madinah', '2024-06-07'),
('Huda', 'Al-Anazi', 'huda.anazi@example.com', '0551000110', 'Buraidah', '2024-06-25'),
('Mohammed', 'Bakr', 'mohammed.bakr@example.com', '0551000111', 'Jeddah', '2024-07-14'),
('Aisha', 'Hakeem', 'aisha.hakeem@example.com', '0551000112', 'Riyadh', '2024-08-02'),
('Faisal', 'Al-Rashid', 'faisal.rashid@example.com', '0551000113', 'Dammam', '2024-08-30'),
('Maha', 'Al-Salem', 'maha.salem@example.com', NULL, 'Abha', '2024-09-16'),
('Turki', 'Al-Fahad', 'turki.fahad@example.com', '0551000115', 'Tabuk', '2024-10-05'),
('Dalal', 'Al-Juhani', 'dalal.juhani@example.com', '0551000116', 'Madinah', '2024-11-01'),
('Sultan', 'Al-Balawi', 'sultan.balawi@example.com', '0551000117', 'Tabuk', '2024-11-19'),
('Hessa', 'Al-Marri', 'hessa.marri@example.com', '0551000118', 'Khobar', '2025-01-08'),
('Majed', 'Al-Yami', 'majed.yami@example.com', '0551000119', 'Jeddah', '2025-02-14'),
('Rana', 'Al-Khaldi', 'rana.khaldi@example.com', '0551000120', 'Riyadh', '2025-03-02');

-- Verify customers are inserted
SELECT * FROM customers;

-- 1. Try inserting a duplicate SKU (Will cause ERROR 1062 as expected)[cite: 41]
INSERT INTO products (sku, product_name, category, unit_price)
VALUES ('ELC001', 'Duplicate laptop', 'Electronics', 1.00);

-- 2. Add a test row on purpose to practice deleting[cite: 41]
INSERT INTO products (sku, product_name, category, unit_price, stock_qty)
VALUES ('TST001', 'Test item - delete me', 'General', 1.00, 1);

-- 3. Always run SELECT with the WHERE clause first to verify the row before deleting[cite: 41]
SELECT * FROM products WHERE sku = 'TST001';

-- 4. Delete the test row safely using the WHERE clause[cite: 41]
DELETE FROM products WHERE sku = 'TST001';

-- 5. Check the total products count to ensure you are back to 24 products[cite: 41]
SELECT COUNT(*) AS total_products FROM products;

-- 1. Choose specific columns (product_name and unit_price) from products table[cite: 42]
SELECT product_name, unit_price FROM products;

-- 2. Select all columns from customers table (* means all columns)[cite: 42]
SELECT * FROM customers;

-- 3. Display the current date and time on the server without any table[cite: 42]
SELECT NOW();

-- 4. Display several values at once using expressions and friendly column names with AS[cite: 42]
SELECT 5 + 3 AS sum_result, 'Nakheel Market' AS store_name;

-- 1. Expensive products (unit_price > 1000)
SELECT product_name, unit_price 
FROM products 
WHERE unit_price > 1000;

-- 2. Out of stock products (stock_qty = 0)
SELECT product_name, stock_qty 
FROM products 
WHERE stock_qty = 0;

-- 3. Customers living in Riyadh
SELECT first_name, last_name, city 
FROM customers 
WHERE city = 'Riyadh';

-- 4. Non-grocery products costing 100 or less (combining conditions with AND)
SELECT sku, product_name 
FROM products 
WHERE category <> 'Grocery' AND unit_price <= 100;

-- 5. Products containing 'Coffee' in their name
SELECT product_name 
FROM products 
WHERE product_name LIKE '%Coffee%';

-- 6. Products with SKUs starting with 'ELC' (Electronics)
SELECT sku, product_name 
FROM products 
WHERE sku LIKE 'ELC%';

-- 7. Customers whose last name starts with 'Al-S'
SELECT first_name, last_name 
FROM customers 
WHERE last_name LIKE 'Al-S%';

-- 8. Customers whose first name starts with A or F (using REGEXP)
SELECT first_name 
FROM customers 
WHERE first_name REGEXP '^[AF]';

-- 9. Customers whose first name ends with the letter 'a' (using REGEXP)
SELECT first_name 
FROM customers 
WHERE first_name REGEXP 'a$';




-- =====================================================================
-- Lab 2: Exercises Solutions (All-in-One as Comments and Code)
-- =====================================================================

-- Exercise 2.1: List the name and city of every customer who lives in Jeddah.[cite: 32]
SELECT first_name, last_name, city FROM customers WHERE city = 'Jeddah';

-- Exercise 2.2: Show the name and price of all products that cost less than 100 SAR.[cite: 32]
SELECT product_name, unit_price FROM products WHERE unit_price < 100.00;

-- Exercise 2.3: Which customers joined on or after 1 January 2025?[cite: 32]
SELECT first_name, last_name, joined_date FROM customers WHERE joined_date >= '2025-01-01';

-- Exercise 2.4: Find all products whose name contains the word 'Dates'.[cite: 32]
SELECT product_name FROM products WHERE product_name LIKE '%Dates%';

-- Exercise 2.5: Find products whose SKU starts with 'GRC' (grocery).[cite: 32]
SELECT sku, product_name FROM products WHERE sku LIKE 'GRC%';

-- Exercise 2.6: Find customers whose first name has exactly 4 letters (hint: four underscores).[cite: 32]
SELECT first_name, last_name FROM customers WHERE first_name LIKE '____';

-- Exercise 2.7: Using REGEXP, find customers whose first name starts with A, M or S.[cite: 32]
SELECT first_name, last_name FROM customers WHERE first_name REGEXP '^[AMS]';

-- Exercise 2.8: Insert yourself, verify using SELECT first, then delete your row.[cite: 32]
-- 1. Insert your row:
INSERT INTO customers (first_name, last_name, email, phone, city, joined_date)
VALUES ('YourName', 'YourLastName', 'your.email@example.com', '0550000000', 'Riyadh', '2026-11-10');

-- 2. Verify your row appears:
SELECT * FROM customers WHERE email = 'your.email@example.com';

-- 3. Delete only your row:
DELETE FROM customers WHERE email = 'your.email@example.com';