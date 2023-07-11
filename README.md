# Books analisys
This work is made to analyse trends on the amazon book reviews dataset found on kaggle

In this project we will know what category of books has better reviews scores and what are the trends regarding the book reviews.
This will be measured by calculating the average review score of each category (limit 1000), the average time the users gave to the review, how helpfull was the review and how many authors and books are in those categories.

__DATA FROM_: https://www.kaggle.com/datasets/mohamedbakhet/amazon-books-reviews?select=books_data.csv 

### The cleaning and data processing
For this process the tool used was SQL on Google cloud

The first query was mande to get the number of authors and book on each categories and to order the results in descending order, the results were limted to show the first 1000
`SELECT distinct count(authors) AS number_of_authors, categories, count(Title) as number_of_books
FROM corded-essence-389317.BOOKS_P.data
WHERE categories IS NOT NULL
GROUP BY categories
ORDER BY number_of_authors desc
LIMIT 1000`
 
