-- ============================
-- CREATE FILMS TABLE
-- ============================
CREATE TABLE films (
    film_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    release_year INT,
    country VARCHAR(50),
    duration INT,
    language VARCHAR(50),
    budget BIGINT,
    gross BIGINT,
    certification VARCHAR(10)
);

-- ============================
-- CREATE PEOPLE TABLE
-- ============================
CREATE TABLE people (
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_year INT,
    country VARCHAR(50)
);

-- ============================
-- CREATE ROLES TABLE
-- ============================
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

-- ============================
-- CREATE REVIEWS TABLE
-- ============================
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
-- INSERT DATA INTO FILMS
-- ============================
INSERT INTO films 
(title, release_year, country, duration, language, budget, gross, certification)
VALUES
('Inception', 2010, 'USA', 148, 'English', 160000000, 829000000, 'PG-13'),

('Titanic', 1997, 'USA', 195, 'English', 200000000, 2187000000, 'PG-13'),

('Parasite', 2019, 'South Korea', 132, 'Korean', 11400000, 263000000, 'R'),

('Spirited Away', 2001, 'Japan', 125, 'Japanese', 19000000, 395000000, 'PG'),

('Interstellar', 2014, 'USA', 169, 'English', 165000000, 677000000, 'PG-13'),

('The Dark Knight', 2008, 'USA', 152, 'English', 185000000, 1005000000, 'PG-13'),

('Amelie', 2001, 'France', 122, 'French', 10000000, 174000000, 'R'),

('Roma', 2018, 'Mexico', 135, 'Spanish', 15000000, NULL, 'R'),

('Crouching Tiger Hidden Dragon', 2000, 'China', 120, 'Mandarin', 17000000, 213000000, 'PG-13'),

('Life of Pi', 2012, 'USA', 127, 'English', 120000000, 609000000, 'PG'),

('Unknown Movie', NULL, NULL, NULL, NULL, NULL, NULL, NULL),

('Future Film', 2027, NULL, 120, NULL, 50000000, NULL, NULL);

-- ============================
-- INSERT DATA INTO PEOPLE
-- ============================
INSERT INTO people 
(name, birth_year, country)
VALUES
('Leonardo DiCaprio', 1974, 'USA'),

('Christopher Nolan', 1970, 'UK'),

('Bong Joon-ho', 1969, 'South Korea'),

('Hayao Miyazaki', 1941, 'Japan'),

('Matthew McConaughey', 1969, 'USA'),

('Christian Bale', 1974, 'UK'),

('Audrey Tautou', 1976, 'France'),

('Alfonso Cuaron', 1961, 'Mexico'),

('Ang Lee', 1954, 'Taiwan');

-- ============================
-- INSERT DATA INTO ROLES
-- ============================
INSERT INTO roles 
(film_id, person_id, role, character_name)
VALUES

-- Inception
(1, 2, 'Director', NULL),
(1, 1, 'Actor', 'Cobb'),

-- Titanic
(2, 1, 'Actor', 'Jack Dawson'),

-- Parasite
(3, 3, 'Director', NULL),

-- Spirited Away
(4, 4, 'Director', NULL),

-- Interstellar
(5, 2, 'Director', NULL),
(5, 5, 'Actor', 'Cooper'),

-- Dark Knight
(6, 2, 'Director', NULL),
(6, 6, 'Actor', 'Batman'),

-- Amelie
(7, 7, 'Actor', 'Amelie'),

-- Roma
(8, 8, 'Director', NULL),

-- Life of Pi
(10, 9, 'Director', NULL);

-- ============================
-- INSERT DATA INTO REVIEWS
-- ============================
INSERT INTO reviews 
(film_id, rating, reviewer, review_date)
VALUES

(1, 9.0, 'IMDB', '2010-07-16'),
(1, 8.8, 'Rotten Tomatoes', '2010-07-20'),

(2, 9.5, 'IMDB', '1997-12-19'),

(3, 8.6, 'Metacritic', '2019-05-30'),

(4, 8.5, 'IMDB', '2001-07-20'),

(5, 8.7, 'IMDB', '2014-11-07'),

(6, 9.0, 'IMDB', '2008-07-18'),

(7, 8.3, 'IMDB', '2001-04-25'),

(8, 7.9, 'IMDB', '2018-08-30'),

(10, 7.9, 'IMDB', '2012-11-21');


-- View all films
SELECT * FROM films;


-- ============================================
-- LAB 1: MULTIPLE CONDITIONS
-- ============================================

-- 1. Films released in 1994 OR 2000
SELECT title, release_year
FROM films
WHERE release_year = 1994 OR release_year = 2000;

-- 2. Films released after 1994 AND before 2000
SELECT title, release_year
FROM films
WHERE release_year > 1994
AND release_year < 2000;

-- 3. Films released between 1995 and 1999
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1995 AND 1999;

-- 4. Japanese-language films after 2000
SELECT title, release_year
FROM films
WHERE language = 'Japanese'
AND release_year > 2000;

-- 5. Combine AND + OR
SELECT title
FROM films
WHERE (release_year = 2010 OR release_year = 2018)
AND (certification = 'PG' OR certification = 'R');

-- 6. Films in 1997 or 2010, English or Spanish, gross > 2M
SELECT *
FROM films
WHERE (release_year = 1997 OR release_year = 2010)
AND (language = 'English' OR language = 'Spanish')
AND gross > 2000000;


-- ============================================
-- LAB 2: FILTERING TEXT
-- ============================================

-- View all people
SELECT * FROM people;

-- 7. Names starting with "A"
SELECT name
FROM people
WHERE name LIKE 'A%';

-- 8. Country with 2 letters
SELECT country
FROM people
WHERE country LIKE '_K';

-- 9. Country with 3 letters
SELECT country
FROM people
WHERE country LIKE '___';

-- 10. Country with second letter as 'a' 
SELECT country
FROM people
WHERE country LIKE '_a%';

-- 11. Names NOT starting with C
SELECT name
FROM people
WHERE name NOT LIKE 'C%';

-- 12. Names NOT starting with A or L
SELECT name
FROM people
WHERE name NOT LIKE 'A%' AND name NOT LIKE 'L%';

-- 13. Films from selected countries
SELECT title, country
FROM films
WHERE country IN ('Germany', 'USA', 'France');

-- 14. Films released in selected years
SELECT title, release_year
FROM films
WHERE release_year IN (1997, 2001, 2010);


-- ============================================
-- LAB 3: NULL VALUES
-- ============================================

-- 15. Films without budget
SELECT film_id, title AS no_budget
FROM films
WHERE budget IS NULL;

-- 16. Films with known budget
SELECT film_id, title, budget
FROM films
WHERE budget IS NOT NULL;

-- 17. Count films with known language
SELECT COUNT(language) AS no_null
FROM films;

-- 18. Count all films
SELECT COUNT(*) AS with_null
FROM films;

