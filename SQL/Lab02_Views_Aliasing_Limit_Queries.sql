-- ==========================================
-- DATABASE: OFFICE
-- Tables and Sample Data
-- ==========================================

-- ================================
-- Create Departments Table
-- ================================
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- ================================
-- Create Job Levels Table
-- ================================
CREATE TABLE job_levels (
    job_level_id INT PRIMARY KEY,
    job_title VARCHAR(50)
);

-- ================================
-- Create Employees Table
-- ================================
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    job_level_id INT,
    year_hired INT,

    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (job_level_id) REFERENCES job_levels(job_level_id)
);

-- ================================
-- Insert Data into Departments
-- ================================
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

-- ================================
-- Insert Data into Job Levels
-- ================================
INSERT INTO job_levels VALUES
(1, 'Junior'),
(2, 'Mid-Level'),
(3, 'Senior');

-- ================================
-- Insert Data into Employees
-- ================================
INSERT INTO employees VALUES
(54378, 'Darius', 1, 3, 2020),
(94722, 'Raven', 2, 3, 2017),
(45783, 'Eduardo', 2, 1, 2022),
(90123, 'Maggie', 3, 2, 2011),
(67284, 'Amy', 2, 2, 2009),
(26148, 'Meehir', 3, 3, 2021);

-- ==========================================
-- LAB 1: Writing Queries
-- ==========================================

-- ------------------------------
-- 1. Aliasing
-- ------------------------------
SELECT name AS first_name, year_hired AS hire_year
FROM employees;

SELECT id AS employee_id, name AS first_name, dept_id AS department
FROM employees;

-- ------------------------------
-- 2. Selecting Distinct Records
-- ------------------------------
-- All hire years (may include duplicates)
SELECT year_hired
FROM employees;

-- Unique hire years
SELECT DISTINCT year_hired
FROM employees;

-- Unique combinations of department and hire year
SELECT DISTINCT dept_id, year_hired
FROM employees;

-- ------------------------------
-- 3. Views
-- ------------------------------
-- Create a view for employee names and hire years
CREATE VIEW employee_hire_years AS
SELECT id, name, year_hired
FROM employees;

-- Query the view
SELECT id, name, year_hired
FROM employee_hire_years;

-- ==========================================
-- LAB 2: Limiting Results (SQL Flavors)
-- ==========================================

-- PostgreSQL style: limit results to first 2 employees
SELECT name, year_hired
FROM employees
LIMIT 2;


-- ==========================================
-- LAB 2: Practice Exercises
-- ==========================================

-- 1. Return a single column of unique employee names with alias
SELECT DISTINCT name AS unique_name
FROM employees;

-- 2. Save the query results as a view named 'name_employee'
CREATE VIEW name_employee AS
SELECT DISTINCT name AS unique_name
FROM employees;

-- 3. Select first 10 employee names (limit results)
SELECT name
FROM employees
LIMIT 10;

