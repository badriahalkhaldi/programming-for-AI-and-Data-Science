-- ============================
-- CREATE TABLES
-- ============================

-- FILMS TABLE
CREATE TABLE films (
    film_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year INT,
    country VARCHAR(50),
    duration INT,
    language VARCHAR(50),
    budget BIGINT,
    gross BIGINT
);

-- PEOPLE TABLE
CREATE TABLE people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    country VARCHAR(50)
);

-- ROLES TABLE
CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT NOT NULL,
    person_id INT NOT NULL,
    role VARCHAR(50),
    character_name VARCHAR(100),

    FOREIGN KEY (film_id)
        REFERENCES films(film_id)
        ON DELETE CASCADE,

    FOREIGN KEY (person_id)
        REFERENCES people(person_id)
        ON DELETE CASCADE
);

-- REVIEWS TABLE
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT NOT NULL,
    rating DECIMAL(3,1),
    reviewer VARCHAR(100),
    review_date DATE,

    FOREIGN KEY (film_id)
        REFERENCES films(film_id)
        ON DELETE CASCADE
);

-- ============================
-- INSERT SAMPLE DATA
-- ============================

-- Films
INSERT INTO films (title, release_year, country, duration, language, budget, gross)
VALUES
('Inception', 2010, 'USA', 148, 'English', 160000000, 829000000),
('Titanic', 1997, 'USA', 195, 'English', 200000000, 2187000000),
('Parasite', 2019, 'South Korea', 132, 'Korean', 11400000, 263000000),
('Spirited Away', 2001, 'Japan', 125, 'Japanese', 19000000, 395000000),
('Interstellar', 2014, 'USA', 169, 'English', 165000000, 677000000),
('Unknown Movie', NULL, NULL, NULL, NULL, NULL, NULL),
('Future Film', 2027, NULL, 120, NULL, 50000000, NULL);

-- People
INSERT INTO people (name, birth_year, country)
VALUES
('Leonardo DiCaprio', 1974, 'USA'),
('Christopher Nolan', 1970, 'UK'),
('Bong Joon-ho', 1969, 'South Korea'),
('Hayao Miyazaki', 1941, 'Japan'),
('Matthew McConaughey', 1969, 'USA');

-- Roles
INSERT INTO roles (film_id, person_id, role, character_name)
VALUES
(1, 2, 'Director', NULL),
(1, 1, 'Actor', 'Cobb'),
(2, 1, 'Actor', 'Jack Dawson'),
(3, 3, 'Director', NULL),
(4, 4, 'Director', NULL),
(5, 2, 'Director', NULL),
(5, 5, 'Actor', 'Cooper');

-- Reviews
INSERT INTO reviews (film_id, rating, reviewer, review_date)
VALUES
(1, 9.0, 'IMDB', '2010-07-16'),
(1, 8.8, 'Rotten Tomatoes', '2010-07-20'),
(2, 9.5, 'IMDB', '1997-12-19'),
(3, 8.6, 'Metacritic', '2019-05-30'),
(4, 8.5, 'IMDB', '2001-07-20'),
(5, 8.7, 'IMDB', '2014-11-07');

-- Display the films table
SELECT * FROM films;

-- ============================
-- LAB 1: Basic COUNT Queries
-- ============================

-- Count total films
SELECT COUNT(*) AS total_films 
FROM films;

-- Count films with a budget (ignores NULL)
SELECT COUNT(budget) AS films_with_budget
FROM films;

-- Count unique countries
SELECT COUNT(DISTINCT country) AS unique_countries
FROM films;

-- ============================
-- LAB 2: Filtering with WHERE (Comparison Operators)
-- ============================

-- 1. Films released after 2010
SELECT title, release_year
FROM films
WHERE release_year > 2010;

-- 2. Films released before 2005
SELECT title, release_year
FROM films
WHERE release_year < 2005;

-- 3. Films released in 2014
SELECT title, release_year
FROM films
WHERE release_year = 2014;

-- 4. Films not released in 2010
SELECT title, release_year
FROM films
WHERE release_year <> 2010;

-- 5. Films with duration >= 150 minutes
SELECT title, duration
FROM films
WHERE duration >= 150;

-- 6. Films with duration <= 130 minutes
SELECT title, duration
FROM films
WHERE duration <= 130;

-- 7. Films produced in Japan
SELECT title, country
FROM films
WHERE country = 'Japan';

-- 8. Films not produced in USA
SELECT title, country
FROM films
WHERE country <> 'USA';

-- 9. Films with budget > 100,000,000
SELECT title, budget
FROM films
WHERE budget > 100000000
LIMIT 2;

-- 10. Count unique reviewers who gave a rating above 8.5
SELECT COUNT(DISTINCT reviewer) AS high_rating
FROM reviews
WHERE rating > 8.5;