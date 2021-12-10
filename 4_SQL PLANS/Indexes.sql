USE LibrarySystem_NOINDEXES;

--SELECT * FROM book INNER JOIN genre ON genre.genre_id = book.genre_id

--CREATE CLUSTERED INDEX CL_book
--ON  dbo.book (genre_id)

--CREATE CLUSTERED INDEX CL_genre
--ON  dbo.genre (genre_id)

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_genre
--ON dbo.genre

--CREATE NONCLUSTERED INDEX CL_book
--ON  dbo.book (genre_id)
--INCLUDE (book_id, title, author_id)

--CREATE NONCLUSTERED INDEX CL_genre
--ON  dbo.genre (genre_id)

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_genre
--ON dbo.genre
-------------------------------------------------

--SELECT * FROM author	 LEFT OUTER JOIN book  ON author.author_id = book.author_id ;

--CREATE CLUSTERED INDEX CL_author
--ON dbo.author (author_id)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (author_id)

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_author
--ON dbo.author

--CREATE UNIQUE NONCLUSTERED INDEX NCL_author
--ON dbo.author (author_id)

--CREATE UNIQUE NONCLUSTERED INDEX NCL_book
--ON dbo.book (author_id)
--WHERE author_id IS NOT NULL

--CREATE UNIQUE NONCLUSTERED INDEX NCL_bookid
--ON dbo.book (book_id)

--DROP INDEX NCL_bookid
--ON dbo.book

--DROP INDEX NCL_book
--ON dbo.book

--DROP INDEX NCL_author
--ON dbo.author

---------------------------------

--SELECT * FROM book_edition	 CROSS APPLY (SELECT * FROM book WHERE book_edition.book_id = book.book_id) AS b;

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (book_id)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (book_id)

--DROP INDEX CL_bookEdition
--ON dbo.book_edition

--DROP INDEX CL_book
--ON dbo.book

--CREATE UNIQUE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (book_id)

--CREATE UNIQUE NONCLUSTERED INDEX NCL_book
--ON dbo.book (book_id)

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition

--DROP INDEX NCL_book
--ON dbo.book

------------------------------------------

--SELECT book_edition.amount, book_edition1.amount FROM book_edition 
--												 INNER JOIN book_edition book_edition1 
--													   ON book_edition.publishing_id = book_edition1.publishing_id;

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (publishing_id)

--DROP INDEX CL_bookEdition
--ON dbo.book_edition

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (publishing_id)
--INCLUDE (amount)

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition

---------------------------------

--SELECT title, author_name, publishing_name FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение');

--CREATE NONCLUSTERED INDEX NCL_publishing
--ON dbo.publishing (publishing_id)
--INCLUDE (publishing_name)

--CREATE UNIQUE NONCLUSTERED INDEX NCL_book
--ON dbo.book (book_id, author_id)

--CREATE UNIQUE NONCLUSTERED INDEX NCL_author
--ON dbo.author (author_id)

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (book_id, publishing_id)

--DROP INDEX NCL_publishing
--ON dbo.publishings

--DROP INDEX NCL_book
--ON dbo.book

--DROP INDEX NCL_author
--ON dbo.author

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition

--CREATE CLUSTERED INDEX CL_publishing
--ON dbo.publishing (publishing_name)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (author_id)

--CREATE CLUSTERED INDEX CL_author
--ON dbo.author (author_id)

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (publishing_id)

--DROP INDEX CL_publishing
--ON dbo.publishing

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_author
--ON dbo.author

--DROP INDEX CL_bookEdition
--ON dbo.book_edition

---------------------------------

/*SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount BETWEEN 5 AND 20;*/

--CREATE NONCLUSTERED INDEX NCL_publishing
--ON dbo.publishing (publishing_id, publishing_name)

--CREATE NONCLUSTERED INDEX NCL_book
--ON dbo.book (book_id, author_id)

--CREATE NONCLUSTERED INDEX NCL_author
--ON dbo.author (author_id)

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (amount)

--DROP INDEX NCL_publishing
--ON dbo.publishing

--DROP INDEX NCL_book
--ON dbo.book

--DROP INDEX NCL_author
--ON dbo.author

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (amount)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (author_id)

--CREATE CLUSTERED INDEX CL_author
--ON dbo.author (author_id)

--CREATE CLUSTERED INDEX CL_publishing
--ON dbo.publishing (publishing_id)

--DROP INDEX CL_publishing
--ON dbo.publishing

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_author
--ON dbo.author

--DROP INDEX CL_bookEdition
--ON dbo.book_edition

-------------------------------------

--SELECT title, author_name, publishing_name, amount FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 WHERE book.title LIKE 'Ф%';

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (book_id)
--INCLUDE (publishing_id)

--CREATE NONCLUSTERED INDEX NCL_book
--ON dbo.book (book_id)

--CREATE NONCLUSTERED INDEX NCL_author
--ON dbo.author (author_name)
--WHERE author_name > 'Ф'

--CREATE NONCLUSTERED INDEX NCL_publishing
--ON dbo.publishing (publishing_id)

--DROP INDEX NCL_publishing
--ON dbo.publishing

--DROP INDEX NCL_book
--ON dbo.book

--DROP INDEX NCL_author
--ON dbo.author

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (book_id)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (book_id)

--CREATE CLUSTERED INDEX CL_author
--ON dbo.author (author_name)

--CREATE CLUSTERED INDEX CL_publishing
--ON dbo.publishing (publishing_id)

--DROP INDEX CL_publishing
--ON dbo.publishing

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_author
--ON dbo.author

--DROP INDEX CL_bookEdition
--ON dbo.book_edition

--------------------------------------

/*SELECT SUBSTRING(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.'),
	 7, 7
) AS 'substring_title';*/

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (book_id)
--INCLUDE (book_edition_id)

--CREATE NONCLUSTERED INDEX NCL_book
--ON dbo.book (book_id, author_id)

--CREATE NONCLUSTERED INDEX NCL_author
--ON dbo.author (author_name)
--WHERE author_name > 'Б'

--CREATE NONCLUSTERED INDEX NCL_publishing
--ON dbo.publishing (publishing_name)

--DROP INDEX NCL_publishing
--ON dbo.publishing

--DROP INDEX NCL_book
--ON dbo.book

--DROP INDEX NCL_author
--ON dbo.author

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (book_id)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (book_id)

--CREATE CLUSTERED INDEX CL_author
--ON dbo.author (author_name)

--CREATE CLUSTERED INDEX CL_publishing
--ON dbo.publishing (publishing_name)

--DROP INDEX CL_publishing
--ON dbo.publishing

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_author
--ON dbo.author

--DROP INDEX CL_bookEdition
--ON dbo.book_edition

-----------------------------------
/*SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.'),
		5, 2
) AS 'str_request2';*/

--CREATE NONCLUSTERED INDEX NCL_reader
--ON dbo.reader (reader_name)
--WHERE reader_name > 'И'

--CREATE NONCLUSTERED INDEX NCL_fine
--ON dbo.fine (reader_id)

--DROP INDEX NCL_reader
--ON dbo.reader

--DROP INDEX NCL_fine
--ON dbo.fine

--CREATE CLUSTERED INDEX CL_reader
--ON dbo.reader (reader_name)

--CREATE CLUSTERED INDEX CL_fine
--ON dbo.fine (reader_id)

--DROP INDEX CL_reader
--ON dbo.reader

--DROP INDEX CL_fine
--ON dbo.fine

---------------------------------

/*SELECT (DATEPART(month,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = 'Мастер и Маргарита' AND publishing.publishing_name = 'Азбука'))) 
		AS 'month_of_receipt';*/

--CREATE NONCLUSTERED INDEX NCL_book
--ON dbo.book (title)
--WHERE title > 'М'

--CREATE NONCLUSTERED INDEX NCL_publishing
--ON dbo.publishing (publishing_name)
--WHERE publishing_name > 'А'

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (book_id)

--DROP INDEX NCL_book
--ON dbo.book

--DROP INDEX NCL_publishing
--ON dbo.publishing

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition


--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (title)

--CREATE CLUSTERED INDEX CL_publishing
--ON dbo.publishing (publishing_name)

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (book_id)

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_publishing
--ON dbo.publishing

--DROP INDEX CL_bookEdition
--ON dbo.book_edition


----------------------------------------
/*SELECT (DATEADD(day, 14,
        (SELECT fine.date_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.'))) 
		AS 'day_end_of_payment',
		(SELECT fine.end_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.')
			AS 'end-of-fine date';*/

--CREATE NONCLUSTERED INDEX NCL_reader
--ON dbo.reader (reader_name)
--WHERE reader_name > 'И'

--CREATE NONCLUSTERED INDEX NCL_fine
--ON dbo.fine (reader_id)

--DROP INDEX NCL_reader
--ON dbo.reader

--DROP INDEX NCL_fine
--ON dbo.fine

--CREATE CLUSTERED INDEX CL_reader
--ON dbo.reader (reader_name)

--CREATE CLUSTERED INDEX CL_fine
--ON dbo.fine (reader_id)

--DROP INDEX CL_reader
--ON dbo.reader

--DROP INDEX CL_fine
--ON dbo.fine

-----------------------
/*SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount = (SELECT MIN(book_edition.amount) FROM book_edition);*/

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (amount)
--INCLUDE (book_edition_id)

--CREATE NONCLUSTERED INDEX NCL_book
--ON dbo.book (author_id)
--INCLUDE (book_id)

--CREATE NONCLUSTERED INDEX NCL_author
--ON dbo.author (author_id)

--CREATE NONCLUSTERED INDEX NCL_publishing
--ON dbo.publishing (publishing_id)

--DROP INDEX NCL_publishing
--ON dbo.publishing

--DROP INDEX NCL_book
--ON dbo.book

--DROP INDEX NCL_author
--ON dbo.author

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (amount)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (author_id)

--CREATE CLUSTERED INDEX CL_author
--ON dbo.author (author_id)

--CREATE CLUSTERED INDEX CL_publishing
--ON dbo.publishing (publishing_id)

--DROP INDEX CL_publishing
--ON dbo.publishing

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_author
--ON dbo.author

--DROP INDEX CL_bookEdition
--ON dbo.book_edition

-----------------------------
/*SELECT SUM(issued_book.amount) AS 'Sum amount in issues' FROM issued_book;*/

--CREATE NONCLUSTERED INDEX NCL_issuedBook
--ON dbo.issued_book (amount DESC) 

--DROP INDEX NCL_issuedBook
--ON dbo.issued_book

--CREATE CLUSTERED INDEX CL_issuedBook
--ON dbo.issued_book (amount)

--DROP INDEX CL_issuedBook
--ON dbo.issued_book


--------------------------------
/*SELECT author_name, SUM(book_edition.amount) FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 GROUP BY author.author_name
							 HAVING author.author_name LIKE 'Б%';*/

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (book_id)
--INCLUDE (publishing_id)

--CREATE NONCLUSTERED INDEX NCL_book
--ON dbo.book (author_id)
--INCLUDE (book_id)

--CREATE NONCLUSTERED INDEX NCL_author
--ON dbo.author (author_name)
--WHERE author_name > 'Б'

--CREATE NONCLUSTERED INDEX NCL_publishing
--ON dbo.publishing (publishing_id)

--DROP INDEX NCL_publishing
--ON dbo.publishing

--DROP INDEX NCL_book
--ON dbo.book

--DROP INDEX NCL_author
--ON dbo.author

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition


--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (book_id)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (book_id)

--CREATE CLUSTERED INDEX CL_author
--ON dbo.author (author_name)

--CREATE CLUSTERED INDEX CL_publishing
--ON dbo.publishing (publishing_id)

--DROP INDEX CL_publishing
--ON dbo.publishing

--DROP INDEX CL_book
--ON dbo.book

--DROP INDEX CL_author
--ON dbo.author

--DROP INDEX CL_bookEdition
--ON dbo.book_edition


------------------------------------
/*SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.')
) AS 'str_request1';*/

--CREATE CLUSTERED INDEX CL_reader
--ON dbo.reader (reader_name)

--CREATE CLUSTERED INDEX CL_fine
--ON dbo.fine (reader_id)

--DROP INDEX CL_reader
--ON dbo.reader

--DROP INDEX CL_fine
--ON dbo.fine

------------------------------------
/*SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount = (SELECT MIN(book_edition.amount) FROM book_edition);*/

--CREATE NONCLUSTERED INDEX NCL_bookEdition
--ON dbo.book_edition (amount ASC)

--DROP INDEX NCL_bookEdition
--ON dbo.book_edition 

--CREATE CLUSTERED INDEX CL_bookEdition
--ON dbo.book_edition (amount)

--DROP INDEX CL_bookEdition
--ON dbo.book_edition 

-----------------------------------
/*SELECT author_id FROM dbo.book
UNION
SELECT author_id FROM dbo.author;*/

--CREATE NONCLUSTERED INDEX NCL_author
--ON dbo.author (author_id)

--CREATE NONCLUSTERED INDEX NCL_book
--ON dbo.book (book_id)

--DROP INDEX NCL_author
--ON dbo.author

--DROP INDEX NCL_book
--ON dbo.book

--CREATE CLUSTERED INDEX CL_author
--ON dbo.author (author_id)

--CREATE CLUSTERED INDEX CL_book
--ON dbo.book (book_id)

--DROP INDEX CL_author
--ON dbo.author

--DROP INDEX CL_book
--ON dbo.book
--------------------------------
/*SELECT reader_id FROM reader
INTERSECT
SELECT reader_id FROM dbo.issued_book*/


--CREATE NONCLUSTERED INDEX NCL_reader
--ON dbo.reader (reader_id)

--CREATE NONCLUSTERED INDEX NCL_reader
--ON dbo.issued_book (reader_id)

--DROP INDEX NCL_reader
--ON dbo.author

--DROP INDEX NCL_reader
--ON dbo.book


----------------------------------------drop clustered


/*NON CLUSTERED:*/

--/* Составной индекс */
--CREATE NONCLUSTERED INDEX NCL_PublishSolid 
--ON publishing (publishing_id)

--CREATE NONCLUSTERED INDEX NCL_Book 
--ON book (book_id, author_id, genre_id)

--CREATE NONCLUSTERED INDEX NCL_Author 
--ON author (author_id)

--CREATE NONCLUSTERED INDEX NCL_BookEdition 
--ON dbo.book_edition (book_edition_id)

--CREATE NONCLUSTERED INDEX NCL_ExpBook
--ON dbo.expired_book (expired_book_id, fine_id)


----/* Покрывающий индекс */
----CREATE NONCLUSTERED INDEX NCL_BookEdition 
----ON book_edition (book_id)
----INCLUDE(publishing_id, amount)

--/* Уникальный индекс - нет уникальных значений*/
--/*CREATE UNIQUE INDEX NCL_PublishingUnique 
--ON dbo.publishing (address)*/

--/* C включенными столбцами */
--CREATE NONCLUSTERED INDEX NCL_Issued
--ON dbo.issued_book(issued_book_id)
--INCLUDE(reader_id, book_id, book_edition_id)	

--/* Фильтрованный индекс*/
--CREATE NONCLUSTERED INDEX NCL_BookTitle
--ON book	(title)
--WHERE book.title = 'Ф%' 

--CREATE NONCLUSTERED INDEX NCL_ReaderName
--ON reader (reader_name)
--WHERE reader_name = 'Иванов И.И.'

--CREATE NONCLUSTERED INDEX NCL_AuthorNamePelevin
--ON author (author_id)
--WHERE author_name = 'Пелевин%'

--CREATE NONCLUSTERED INDEX NCL_AuthorNameBulgakov
--ON author (author_id)
--WHERE author_name = 'Булгаков%'

--/* По убыванию для запросов на количество */
--CREATE NONCLUSTERED INDEX NCL_EditAmount 
--ON book_edition (amount DESC) 

--/* По давности даты для запросов на штрафы */
--CREATE NONCLUSTERED INDEX NCL_FineDate 
--ON dbo.fine (end_of_fine ASC, status_id) 

--////////////удаление

--/* Составной индекс */
--DROP INDEX NCL_PublishSolid 
--ON publishing

--DROP INDEX NCL_Book 
--ON book

--DROP INDEX NCL_Author 
--ON author

--DROP INDEX NCL_BookEdition 
--ON dbo.book_edition

--DROP INDEX NCL_ExpBook
--ON dbo.expired_book


----/* Покрывающий индекс */
----CREATE NONCLUSTERED INDEX NCL_BookEdition 
----ON book_edition (book_id)
----INCLUDE(publishing_id, amount)

--/* Уникальный индекс - нет уникальных значений*/
--/*CREATE UNIQUE INDEX NCL_PublishingUnique 
--ON dbo.publishing (address)*/

--/* C включенными столбцами */
--DROP INDEX NCL_Issued
--ON dbo.issued_book	

--/* Фильтрованный индекс*/
--DROP INDEX NCL_BookTitle
--ON book	

--DROP INDEX NCL_ReaderName
--ON reader

--DROP INDEX NCL_AuthorNamePelevin
--ON author 

--DROP INDEX NCL_AuthorNameBulgakov
--ON author 

--/* По убыванию для запросов на количество */
--DROP INDEX NCL_EditAmount 
--ON book_edition

--/* По давности даты для запросов на штрафы */
--DROP INDEX NCL_FineDate 
--ON dbo.fine