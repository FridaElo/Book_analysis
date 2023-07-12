SELECT distinct count(authors) AS number_of_authors, categories, count(Title) as number_of_books
FROM `corded-essence-389317.BOOKS_P.data` 
WHERE categories IS NOT NULL
GROUP BY categories
ORDER BY number_of_authors desc
LIMIT 1000


SELECT AVG(review_score) as avg_score, Data.categories, count(review_score) as number_of_reviews, 
FROM `corded-essence-389317.BOOKS_P.Rating` as Rating
INNER JOIN  `corded-essence-389317.BOOKS_P.data`  as Data
ON Rating.Title=Data.Title
Where Data.categories is not null
group by Data.categories
ORDER BY number_of_reviews desc
LIMIT 1000


SELECT Books.authors, avg(Rating.review_score) as AVG_BY_A, count(Rating.User_id) as numb_of_reviews
 FROM `corded-essence-389317.BOOKS_P.Rating` as Rating
INNER JOIN  `corded-essence-389317.BOOKS_P.data`  as Books
ON Rating.Title=Books.Title
where categories = "['Fiction']"
group by Books.authors
HAVING numb_of_reviews > 5000
ORDER BY AVG_BY_A desc
