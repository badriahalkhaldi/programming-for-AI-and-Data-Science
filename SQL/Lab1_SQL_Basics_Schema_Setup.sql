-- ==========================================
-- DATABASE: library_db
-- Week 1 Lab: MySQL Basics
-- ==========================================

-- ===============================
-- Create Patrons Table
-- ===============================
CREATE TABLE IF NOT EXISTS patrons (
    card_num INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    member_year INT NOT NULL,
    total_fine DECIMAL(5,2) DEFAULT 0
);

-- ===============================
-- Create Books Table
-- ===============================
CREATE TABLE IF NOT EXISTS books (
    id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    pub_year INT
);

-- ===============================
-- Create Checkouts Table
-- ===============================
CREATE TABLE IF NOT EXISTS checkouts (
    id INT PRIMARY KEY,
    start_date DATE NOT NULL,
    due_date DATE NOT NULL,
    card_num INT,
    book_id INT,
    FOREIGN KEY (card_num) REFERENCES patrons(card_num),
    FOREIGN KEY (book_id) REFERENCES books(id)
);

-- ==========================================
-- INSERT DATA
-- ==========================================

-- Patrons
INSERT INTO patrons (card_num, name, member_year, total_fine) VALUES
(54378, 'Izzy', 2012, 9.86),
(94722, 'Maham', 2020, 0.00),
(45783, 'Jasmin', 2022, 2.05),
(90123, 'James', 1989, 0.00);

-- Books
INSERT INTO books (id, title, author, genre, pub_year) VALUES
(638, 'Being Mortal', 'Atul Gawande', 'Non-Fiction', 2015),
(912, 'Educated', 'Tara Westover', 'Non-Fiction', 2018),
(322, 'Night', 'Elie Wiesel', 'Non-Fiction', 1956),
(156, 'Where the Wild Things Are', 'Maurice Sendak', 'Childrens', 1963);

-- Checkouts
INSERT INTO checkouts (id, start_date, due_date, card_num, book_id) VALUES
(567, '2022-05-13', '2022-05-27', 54378, 638),
(568, '2022-06-10', '2022-06-24', 54378, 322),
(569, '2022-06-27', '2022-07-11', 45783, 156),
(570, '2022-08-14', '2022-08-28', 90123, 912);

-- ==========================================
-- VERIFY TABLES
-- ==========================================
SELECT * FROM patrons;
SELECT * FROM books;
SELECT * FROM checkouts;

-- ==========================================
-- LAB QUERIES: MySQL Basics
-- ==========================================

-- 1. Select all fields from patrons
SELECT * FROM patrons;

-- 2. Select specific columns
SELECT name, member_year FROM patrons;

-- 3. Aliasing columns
SELECT name AS patron_name, total_fine AS fine_amount
FROM patrons;

-- 4. Selecting distinct values
SELECT DISTINCT member_year FROM patrons;

-- 5. Distinct multiple columns
SELECT DISTINCT member_year, total_fine FROM patrons;
