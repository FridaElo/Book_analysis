# Books analisys
This work is made to analyse trends on the amazon book reviews dataset found on kaggle

This project was made to analyse metrics of amazon books regarding the number of reviews, authors by categories and the average review rate of each. Also includes other relevant metrics. All of them were calculatede using SQL in google cloud.

<sub> DATA FROM: https://www.kaggle.com/datasets/mohamedbakhet/amazon-books-reviews?select=books_data.csv <sub>

### The cleaning and data processing
_Data info can be found in Kaggle.

The first table has information on the books and the second table was focused on the review info._

The first query was mande to get the number of authors and book on each genre and to order the results in descending order, the results were limted to show the first 1000. 

`SELECT distinct count(authors) AS number_of_authors, categories, count(Title) as number_of_books`

`FROM corded-essence-389317.BOOKS_P.data`

`WHERE categories IS NOT NULL`

`GROUP BY categories`

`ORDER BY number_of_authors desc`

`LIMIT 1000`
 
The second query was focused on the popularity and average review score of each category , popularity was measured by the total number of reviews left on amazon.
It was written as shown, using a join on sql to pull values from both tables.

`SELECT AVG(review_score) as avg_score, Data.categories, count(review_score) as number_of_reviews`

`FROM corded-essence-389317.BOOKS_P.Rating as Rating`

`INNER JOIN  corded-essence-389317.BOOKS_P.data  as Data`

`ON Rating.Title=Data.Title`

`Where Data.categories is not null`

`group by Data.categories`

`ORDER BY number_of_reviews desc`

`LIMIT 1000`

The results show that Fiction is the genre that has the most number of reviews therefore the most popular.

In the last query, the focus was the Fiction category, where it was group by author and was asked to shown only the authors who have more than 5000 reviews and give each of them their average rating.


`SELECT AVG_BY_A, count(Rating.User_id) as numb_of_reviews`

`FROM corded-essence-389317.BOOKS_P.Rating as Rating`

`INNER JOIN  corded-essence-389317.BOOKS_P.data  as Books`

`ON Rating.Title=Books.Title`

`where categories = Fiction`

`group by Books.authors`

`HAVING numb_of_reviews > 5000`

`ORDER BY AVG_BY_A desc`

### CONCLUSIONS

Fiction is the most popular genre for readers as it has the most number of reviews, but also it is a genre that people like to write about if the number of authors is an indication.

Within that category any book rated above 4.11 wich is the average for that category, could be a good choice to add to any to-read-list. The mayor authors are J. R. R Tolkien, George Orwell and Jane Austen to name a few.


