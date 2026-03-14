CREATE DATABASE Movies_db ;

USE Movies_db   ;

CREATE TABLE netflix (
    show_id VARCHAR(10) PRIMARY KEY,
    type VARCHAR(20),
    title VARCHAR(255),
    director VARCHAR(255),
    cast TEXT,
    country VARCHAR(100),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(50),
    listed_in VARCHAR(255),
    description TEXT
);

SELECT * FROM netflix ;

SELECT COUNT(*) FROM netflix  ;
-- ============================================================================================================================================================================
--                                                                                  SELECT 
-- ============================================================================================================================================================================
-- 1. Show all records
SELECT * FROM netflix ;

-- 2. Show only title column
SELECT title FROM netflix ;

-- 3. Show title and release year
SELECT title , release_year 
FROM netflix ;

-- 4. Show title and country
SELECT title , country 
FROM netflix ;

-- 5. Show title, rating and duration
SELECT title , rating , duration 
FROM netflix ;

-- 6. Show all TV Shows 
SELECT *
FROM netflix 
WHERE type = "TV Show" ;

-- 7. Show all Movies
SELECT * 
FROM netflix 
WHERE type = "Movie" ;

-- 8. Show title and director 
SELECT title , director 
FROM netflix ;

-- 9. Show title and description
SELECT title , description 
FROM netflix ;

-- 10. Show title and listed genre
SELECT title , listed_in
FROM netflix ;

-- ============================================================================================================================================================================
--                                                                          DISTINCT 
-- ==========================================================================================================================================================================

-- 11. Show distinct content types
SELECT DISTINCT TYPE 
FROM netflix ;

-- 12. Show distinct countries
SELECT DISTINCT country
FROM netflix ;

-- 13. Show distinct ratings
SELECT DISTINCT rating 
FROM netflix ;

-- 14. Show distinct directors 
SELECT DISTINCT director
FROM netflix ;

-- 15. Show distinct release years
SELECT DISTINCT release_year
FROM netflix ;

-- 16. Show distinct durations
SELECT DISTINCT duration 
FROM netflix ;

-- 17. Show distinct type and rating combinations
SELECT type , rating 
FROM netflix ;

-- 19. Show distinct countries where movies were produced
SELECT DISTINCT country
FROM netflix 
WHERE type = "movie" ;

-- 20. Show distinct ratings for TV Shows
SELECT DISTINCT rating
FROM netflix 
WHERE type = "TV Show" ; 
-- ===========================================================================================================================================================================
--                                                                    ALL basic SQL topics mixed
-- ===========================================================================================================================================================================

-- 21. Show distinct ratings IN 2018
SELECT DISTINCT rating 
FROM netflix 
WHERE release_year = 2018 ;

-- 22. Show shows released after 2018
SELECT title , release_year 
FROM netflix 
WHERE release_year > 2018 ;

-- 23. Movies from India
SELECT title 
FROM netflix 
WHERE type = "movie"
AND country = "India" ;

-- 24. TV Shows from United States
SELECT title 
FROM netflix 
WHERE type = "TV Show"
AND country = "United States" ;

-- 25. Shows released in 2020
SELECT title 
FROM netflix 
WHERE release_year = 2020 ;

-- 26. Shows released before 2010
SELECT title 
FROM netflix 
WHERE release_year < 2010 ;

-- 27. Movies with rating PG
SELECT title 
FROM netflix 
WHERE type = "movie"
AND rating = "PG" ;

-- 28. Shows from Canada
SELECT title 
FROM netflix 
WHERE country = "Canada" ;

-- 29. Shows from India sorted by title
SELECT  title 
FROM netflix 
WHERE country = "India"
ORDER BY title  ;

-- 30. Movies sorted by newest
SELECT title
FROMnetflix
WHERE type = 'Movie'
ORDER BY release_year DESC;

-- 31. Shows sorted by release year
SELECT title , release_year
FROM netflix 
ORDER BY release_year  ;

-- 32. Shows sorted by rating
SELECT title , rating 
FROM netflix 
ORDER BY rating ;

-- 33. Top 10 newest shows
SELECT title , release_year
FROM netflix 
ORDER BY release_year DESC
LIMIT 10 ;

-- 34. First 5 TV Shows
SELECT title , release_year 
FROM netflix  
ORDER BY  release_year 
LIMIT 5 ;

-- 35. First 8 movies
SELECT title , release_year  
FROM netflix 
ORDER BY release_year 
LIMIT 8  ;

-- 36. Shows released between 2015 and 2020
SELECT title , release_year 
FROM netflix 
WHERE release_year BETWEEN 2015 AND 2020
ORDER BY release_year ;

-- 37. Movies between 2018 and 2022
SELECT title , release_year 
FROM netflix 
WHERE type = "Movie"
AND release_year BETWEEN 2018 AND 2022
ORDER BY release_year ;

-- 38. Shows between 2000 and 2010
SELECT title , release_year 
FROM netflix 
WHERE release_year BETWEEN 2000 AND 2010
ORDER BY release_year ;

-- 39. Shows between 1995 and 2005
SELECT title , release_year 
FROM netflix 
WHERE release_year BETWEEN 1995 AND 2005
ORDER BY release_year ;

-- 40. Shows between 2010 and 2015
SELECT title , release_year 
FROM netflix 
WHERE release_year BETWEEN 2010 AND 2015
ORDER BY release_year ;

-- 41. Titles starting with “The”
SELECT title 
FROM netflix 
WHERE title LIKE  "The%" ;

-- 42. Titles containing “Love”
SELECT title 
FROM netflix 
WHERE title LIKE  "%Love%" ;

-- 43. Titles ending with “Story” 
SELECT title 
FROM netflix 
WHERE title LIKE  "%Story" ;

-- 44. Directors containing “John”
SELECT title , director
FROM netflix 
WHERE director LIKE  "%John%" ;

-- 45. Titles starting with “A”
SELECT title 
FROM netflix 
WHERE title LIKE  "A%" ;

-- 46. Titles containing “King”
SELECT title 
FROM netflix 
WHERE title LIKE  "%King%" ;

-- 47. Titles starting with “S” sorted alphabetically
SELECT title 
FROM netflix 
WHERE title LIKE  "S%"
ORDER BY title ;

-- 48. Titles starting with “M”
SELECT title 
FROM netflix 
WHERE title LIKE  "M%" ;

-- 49. Titles containing “War”
SELECT title 
FROM netflix 
WHERE title LIKE  "%War%" ;

-- 50. Titles containing “Life”
SELECT title 
FROM netflix 
WHERE title LIKE  "%Life%" ;

-- 51. Shows from India or USA
SELECT title
FROM netflix 
WHERE country IN ("India" , "United States") ;

-- 52. Shows with rating PG or TV-PG
SELECT title 
FROM netflix 
WHERE rating IN ("PG" , "TV-PG") ;

-- 53. Shows released in 2018, 2019 or 2020
SELECT title , release_year 
FROM netflix 
WHERE release_year IN (2018 , 2019 , 2020 ) ;

-- 54. Movies from India or UK
SELECT title , type
FROM netflix 
WHERE type = "movie"
AND country IN ("India" , "United Kingdom") ;

-- 55. Shows rated R or PG-13
SELECT title, rating
FROM netflix 
WHERE rating IN ("R" , "PG-13") ;

-- 56. Shows where director is NULL 
SELECT title , director 
FROM netflix 
WHERE director IS NULL ;

-- 57. Shows where country is NULL
SELECT title 
FROM netflix 
WHERE country IS NULL ;

-- 58. Shows where cast is NULL
SELECT title 
FROM netflix 
WHERE cast IS NULL ;

-- 59. Movies where director is NULL
SELECT title , type 
FROM netflix 
WHERE type = "Movie"
AND director IS NULL ;

-- 60. TV Shows where country is NULL
SELECT title , type , country 
FROM netflix 
WHERE type = "TV Show"
AND country IS NULL ;

-- ===========================================================================================================================================================================
--                                                                    Advanced mixing of all clauses 
-- ============================================================================================================================================================================
-- 61. Show 10 newest movies
SELECT title , release_year
FROM netflix 
WHERE type ="Movie"
ORDER BY release_year DESC
LIMIT 10 ;

-- 62. Show 5 oldest TV Shows
SELECT title , release_year
FROM netflix 
WHERE type = "TV Show" 
ORDER BY release_year asc
LIMIT 5 ;

-- 63. Shows from India sorted by newest
SELECT title , release_year
FROM netflix 
WHERE country = "India"
ORDER BY release_year DESC ;

-- 64. Movies released between 2015 and 2020
SELECT title , release_year
FROM netflix 
WHERE type = "Movie" 
AND release_year BETWEEN 2015 and 2020
ORDER BY release_year ;

-- 65. TV Shows released after 2018
SELECT title ,release_year
FROM netflix 
WHERE type = "TV Show"
AND release_year > 2018 
ORDER BY release_year ;

-- 66. Shows with rating PG sorted by title
SELECT title , rating 
FROM netflix 
WHERE rating = "PG" 
ORDER BY title ;

-- 67. Shows from USA released after 2017
SELECT title , country , release_year 
FROM netflix 
WHERE country = "United States"
AND release_year > 2017 
ORDER BY release_year ;

-- 68. Movies from India sorted by newest 
SELECT title , release_year 
FROM netflix 
WHERE type = "Movie"
AND country = "India"
ORDER BY release_year DESC;

-- 69. Show first 10 TV Shows
SELECT title , release_year 
FROM netflix 
WHERE type = "TV Show"
ORDER BY release_year 
LIMIT 10 ;

-- 70. Movies released before 2010 sorted by year
SELECT title , release_year
FROM netflix 
WHERE type = "Movie" 
AND release_year < 2010 
ORDER BY release_year ;

-- 71. Titles starting with “The” sorted by year
SELECT title 
FROM netflix 
WHERE title LIKE "The%" 
ORDER BY release_year ;

-- 72. Titles containing “Love”
SELECT title 
FROM netflix
WHERE title LIKE "%Love%" ;

-- 73. Directors containing “John”
SELECT title , director 
FROM netflix 
WHERE director LIKE "%John%" ;

-- 74. Shows starting with letter “A”
SELECT title 
FROM netflix 
WHERE title LIKE "A%" ;

-- 75. Movies ending with “Story”
SELECT title 
FROM netflix 
WHERE type = "Movie"
AND title LIKE "%Story" ;

-- 76. Shows where director name contains “Lee”
SELECT title , director 
FROM netflix 
WHERE director LIKE "%Lee%" ;

-- 77. Shows containing word “King”
SELECT title 
FROM netflix 
WHERE title LIKE "%King%" ;

-- 78. Titles containing “War” sorted by newest
SELECT title 
FROM netflix 
WHERE title LIKE "%War%" 
ORDER BY release_year DESC ;

-- 79. Titles starting with “The” limit 5
SELECT title 
FROM netflix 
WHERE title LIKE "The%"
LIMIT 5 ;

-- 80. Shows starting with “S” sorted alphabetically
SELECT title 
FROM netflix 
WHERE title LIKE "S%" 
ORDER BY title ;

-- 81. Shows from India or USA
SELECT title 
FROM netflix 
WHERE  country IN ("India" , "United States") ;
-- 82. Shows with rating PG or TV-PG
SELECT title , rating
FROM netflix
WHERE rating IN ('PG' ,'TV-PG') ;

-- 83. Shows released in 2018, 2019, 2020
SELECT title , release_year
FROM netflix
WHERE release_year IN (2018 ,2019 ,2020) ;

-- 84. Movies from India or UK
SELECT title , country
FROM netflix
WHERE country IN ('India' ,'United Kingdom')
AND type='Movie ';

-- 85. Shows rated R or PG-13
SELECT title , rating
FROM netflix
WHERE rating IN ('R' ,'PG-13') 
ORDER BY rating ;

-- 86. Shows from Canada or Australia
SELECT title , country
FROM netflix
WHERE country IN ('Canada' ,'Australia') ;  

-- 87. Movies from USA or India sorted by newest
SELECT title , release_year
FROM netflix
WHERE country IN ('United States' ,'India')
AND type='Movie'
ORDER BY release_year DESC ;

-- 88. Shows released in 2010, 2015 or 2020
SELECT title , release_year
FROM netflix
WHERE release_year IN (2010 ,2015 ,2020) 
ORDER BY release_year ;

-- 89. Shows rated TV-MA or R
SELECT title , rating
FROM netflix 
WHERE rating IN ('TV-MA' ,'R') 
ORDER BY rating ;

-- 90. Movies released in 2018 or 2019
SELECT title , release_year
FROM netflix
WHERE type='Movie'
AND release_year IN (2018 ,2019) ;

-- 91. Shows where director is NULL
SELECT title , director
FROM netflix
WHERE director IS NULL ;

-- 92. Shows where country is NULL
SELECT title
FROM netflix
WHERE country IS NULL ;

-- 93. Shows where cast is NULL 
SELECT title
FROM netflix
WHERE cast IS NULL ;

-- 94. Movies with missing director
SELECT title
FROM netflix
WHERE type='Movie'
AND director IS NULL ;

-- 95. TV Shows with missing country
SELECT title
FROM netflix
WHERE type='TV Show'
AND country IS NULL ;

-- 96. Shows with missing director sorted by year
SELECT title , release_year
FROM netflix
WHERE director IS NULL
ORDER BY release_year DESC ;

-- 97. Shows with missing cast
SELECT title
FROM netflix
WHERE cast IS NULL ;

-- 98. Movies where director is NULL limit 5
SELECT title
FROM netflix
WHERE type='Movie'
AND director IS NULL
LIMIT 5 ;

-- 99. Shows where country is NULL sorted by title
SELECT title
FROM netflix
WHERE country IS NULL
ORDER BY title ;

-- 100. Shows where director or cast is NULL
SELECT title 
FROM netflix 
WHERE director IS NULL 
OR cast IS NULL ;




