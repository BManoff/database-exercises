use albums_db;
describe albums;
select * from albums;
-- a.) how many rows are in the table albums? 
-- 31
select count(distinct artist) from albums;
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

select artist, name from albums where artist = 'pink floyd';
-- a. The name of all albums by Pink Floyd
-- The Dark Side of the Moon and The Wall

select release_date from albums where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released
-- 1967

select genre from albums where name = 'Nevermind';
-- c. The genre for the album Nevermind
-- Grunge, Alternative rock

select name, release_date from albums where release_date between 1990 and 1999;
-- d. Which albums were released in the 1990s

select name from albums where sales < 20;
-- e. Which albums had less than 20 million certified sales

select name from albums where genre = 'Rock';
-- f. All the albums with a genre of "Rock". 
-- Why do these query results not include albums 
-- with a genre of "Hard rock" or "Progressive rock"?
-- Because 'Rock' is a specific string


