use albums_db;
describe albums;

SELECT 
    *
FROM
    albums;
-- a.) how many rows are in the table albums? 
-- 31
SELECT 
    COUNT(DISTINCT artist)
FROM
    albums;
-- b. How many unique artist names are in the albums table?
-- 23
-- c. What is the primary key for the albums table?
-- id
SELECT 
    release_date
FROM
    albums
ORDER BY release_date;

-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?
-- 1967, 2011

SELECT 
    artist, name
FROM
    albums
WHERE
    artist = 'pink floyd';
-- a. The name of all albums by Pink Floyd
-- The Dark Side of the Moon and The Wall

SELECT 
    release_date
FROM
    albums
WHERE
    name = 'Sgt. Pepper\'s Lonely Hearts Club Band';
-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
-- 1967

SELECT 
    genre
FROM
    albums
WHERE
    name = 'Nevermind';
-- c. The genre for the album Nevermind
-- Grunge, Alternative rock

SELECT 
    name, release_date
FROM
    albums
WHERE
    release_date BETWEEN 1990 AND 1999;
-- d. Which albums were released in the 1990s

SELECT 
    name
FROM
    albums
WHERE
    sales < 20;
-- e. Which albums had less than 20 million certified sales

SELECT 
    name
FROM
    albums
WHERE
    genre = 'Rock';
-- f. All the albums with a genre of "Rock". 
-- Why do these query results not include albums 
-- with a genre of "Hard rock" or "Progressive rock"?
-- Because 'Rock' is a specific string


