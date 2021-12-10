USE LibrarySystem;

/***** 1. «апросы с использованием различных видов соединений таблиц (Inner join, Outer join, Cross join, Cross apply, самосоединение). ******/

SELECT title AS 'INNER JOIN title', author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id;


SELECT author.author_name AS 'LEFT JOIN author name', book.title 
       FROM author		 LEFT OUTER JOIN book   ON author.author_id = book.author_id;

SELECT author.author_name AS 'RIGHT JOIN author name', book.title 
       FROM author		 RIGHT OUTER JOIN book  ON author.author_id = book.author_id;

SELECT * FROM book_edition	 CROSS JOIN book;

/*соедин€ем book_edition со своими строками из book*/
SELECT * FROM book_edition	 CROSS APPLY (SELECT * FROM book WHERE book_edition.book_id = book.book_id) AS b;

/*все пары книг одного издательства*/
SELECT title, book_edition.amount AS 'amount1', book_edition1.amount AS 'amount2', publishing_name FROM book_edition 
												 INNER JOIN book_edition book_edition1 
												 INNER JOIN publishing ON book_edition1.publishing_id = publishing.publishing_id
												 INNER JOIN book ON book.book_id = book_edition1.book_id
													   ON book_edition.publishing_id = book_edition1.publishing_id;


/****** 2. ‘ильтраци€ данных в запросах с использованием предикатов (EXISTS, IN, ALL, SOME/ANY, BETWEEN, LIKE). ******/

/*дополнительно вывод ћастера и ћаргариту јзбуки, т.к. ћић есть от из-ва Ёксмо*/
SELECT title AS 'EXIST title', author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE EXISTS (SELECT publishing_name FROM publishing 
															WHERE publishing.publishing_name IN ('Ёксмо', 'јст', 'ѕросвещение')); /*и существует из-во јзбука*/

/*выводит все из этих издательств*/
SELECT title AS 'IN title', author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Ёксмо', 'јст', 'ѕросвещение');

/*книги, количество которых больше, чем было кем-то максимально вз€то*/							 
SELECT title AS 'ALL title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount > ALL (SELECT issued_book.amount FROM issued_book);

/*книги, количество которых больше, чем было кем-то вообще вз€то*/	
SELECT title AS 'ANY title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount > ANY (SELECT issued_book.amount FROM issued_book);

/*книги, количество которых между 5 и 20*/
SELECT title AS 'BETWEEN title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount BETWEEN 5 AND 20;

/*книги, которые начинаютс€ на букву ‘*/
SELECT title AS 'LIKE title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book.title LIKE '‘%';
