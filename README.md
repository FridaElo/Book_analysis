# Books analisys

This project was made to analyze metrics of Amazon books reviews dataset regarding the number of reviews, authors by categories, and the average review rate of each. It also includes other relevant metrics. All of them were calculated using SQL in Google Cloud.

<sub> DATA FROM: https://www.kaggle.com/datasets/mohamedbakhet/amazon-books-reviews?select=books_data.csv <sub>

### The cleaning and data processing
_Data info can be found in Kaggle._

_The first table has information on the books and the second table was focused on the review info._

The first query was made to get the number of authors and books in each genre and to order the results in descending order. The results were limited to show the first 1000. 

`SELECT distinct count(authors) AS number_of_authors, categories, count(Title) as number_of_books`

`FROM corded-essence-389317.BOOKS_P.data`

`WHERE categories IS NOT NULL`

`GROUP BY categories`

`ORDER BY number_of_authors desc`

`LIMIT 1000`
 
The second query focused on the popularity and average review score of each category. Popularity was measured by the total number of reviews left on Amazon. It was written as shown, using a join in SQL to pull values from both tables.

`SELECT AVG(review_score) as avg_score, Data.categories, count(review_score) as number_of_reviews`

`FROM corded-essence-389317.BOOKS_P.Rating as Rating`

`INNER JOIN  corded-essence-389317.BOOKS_P.data  as Data`

`ON Rating.Title=Data.Title`

`Where Data.categories is not null`

`group by Data.categories`

`ORDER BY number_of_reviews desc`

`LIMIT 1000`

The results show that Fiction is the genre that has the most number of reviews, and therefore, the most popular.

In the last query, the focus was on the Fiction category, where it was grouped by author, and only the authors who have more than 5000 reviews were shown, along with their average rating.


`SELECT AVG_BY_A, count(Rating.User_id) as numb_of_reviews`

`FROM corded-essence-389317.BOOKS_P.Rating as Rating`

`INNER JOIN  corded-essence-389317.BOOKS_P.data  as Books`

`ON Rating.Title=Books.Title`

`where categories = Fiction`

`group by Books.authors`

`HAVING numb_of_reviews > 5000`

`ORDER BY AVG_BY_A desc`

### CONCLUSIONS

Fiction is the most popular genre for readers as it has the most number of reviews, but it is also a genre that people like to write about, as indicated by the number of authors.

Within that category, any book rated above 4.11, which is the average for that category, could be a good choice to add to any to-read list. The major authors are J. R. R. Tolkien, George Orwell, and Jane Austen, to name a few.
