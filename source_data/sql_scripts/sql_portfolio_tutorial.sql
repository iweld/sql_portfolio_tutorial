/*
	SQL Portfolio Tutorial
	Author: Jaime M. Shaker
	Email: jaime.m.shaker@gmail.com or jaime@shaker.dev
	Website: https://www.shaker.dev
	LinkedIn: https://www.linkedin.com/in/jaime-shaker/
	
	File Name: sql_portfolio_tutorial.sql
	
	This SQL file was created for the SQL Portfolio Tutorial as I try to show others how
	they can display their SQL portfolios on GitHub.
	
*/

/***********************************************

	Create schema

***********************************************/

CREATE SCHEMA IF NOT EXISTS stephen_king;

/***********************************************

	Create Table

***********************************************/

DROP TABLE IF EXISTS stephen_king.books;
CREATE TABLE stephen_king.books (
	book_id INT,
	book_title TEXT,
	year_published INT,
	book_type TEXT,
	author TEXT,
	no_of_pages INT,
	goodreads_number_of_ratings INT,
	goodreads_avg_rating NUMERIC,
	PRIMARY KEY (book_id)
);

/***********************************************

	Copy data from CSV

***********************************************/

COPY stephen_king.books (
	book_id,
	book_title,
	year_published,
	book_type,
	author,
	no_of_pages,
	goodreads_number_of_ratings,
	goodreads_avg_rating
)
FROM '/var/lib/postgresql/source_data/csv/stephen_king_books.csv'
WITH DELIMITER ',' HEADER CSV;

/***********************************************

	Simple Queries

***********************************************/

-- 1. How many records are in our table?

SELECT 
	COUNT(*) AS book_count
FROM
	stephen_king.books;

/*

book_count|
----------+
        75|

*/

-- 2. List the book id, capitalized title and number of pages from the top 5 books with greatest number of pages.

SELECT 
	book_id,
	INITCAP(book_title) AS book_title,
	no_of_pages
FROM
	stephen_king.books
ORDER BY 
	no_of_pages DESC
LIMIT 5;

/*

book_id|book_title                        |no_of_pages|
-------+----------------------------------+-----------+
     21|It                                |       1138|
     55|Under The Dome                    |       1074|
     27|Four Past Midnight                |        930|
     57|11/22/1963                        |        849|
     48|The Dark Tower Vii: The Dark Tower|        845|

*/

-- 3. List the amount of time (in years) that have passed since the first published book and the last published book.

SELECT
	MIN(year_published) AS first_published,
	MAX(year_published) AS last_published,
	(MAX(year_published) - MIN(year_published)) AS years_passed
FROM
	stephen_king.books;

/*

first_published|last_published|years_passed|
---------------+--------------+------------+
           1974|          2022|          48|

*/







