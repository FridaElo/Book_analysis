SELECT distinct count(authors) AS number_of_authors, categories, count(Title) as number_of_books
FROM `corded-essence-389317.BOOKS_P.data` 
WHERE categories IS NOT NULL
GROUP BY categories
ORDER BY number_of_authors desc
LIMIT 1000
