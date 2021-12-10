USE LibrarySystem_NOINDEXES;

--SELECT * FROM author		 LEFT OUTER JOIN book   ON author.author_id = book.author_id;

--SELECT * FROM book_edition	 CROSS APPLY (SELECT * FROM book WHERE book_edition.book_id = book.book_id) AS b;

--SELECT book_edition.amount, book_edition1.amount FROM book_edition 
--												 INNER JOIN book_edition book_edition1 
--													   ON book_edition.publishing_id = book_edition1.publishing_id;

--SELECT title, author_name, publishing_name FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение');

--SELECT title, author_name, publishing_name, amount FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 WHERE book_edition.amount BETWEEN 5 AND 20;

--SELECT title, author_name, publishing_name, amount FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 WHERE book.title LIKE 'Ф%';

--SELECT SUBSTRING(
--	(SELECT title FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
--							       AND NOT author.author_name = 'Булгаков М.А.'),
--	 7, 7
--) AS 'substring_title';

--SELECT STR(
--		(SELECT fine.summ
--				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
--	            WHERE reader.reader_name = 'Иванов И.И.'),
--		5, 2
--) AS 'str_request2';

--SELECT (DATEPART(month,
--        (SELECT book_edition.date_of_arrival 
--				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
--                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
--	            WHERE book.title = 'Мастер и Маргарита' AND publishing.publishing_name = 'Азбука'))) 
--		AS 'month_of_receipt';

--SELECT (DATEADD(day, 14,
--        (SELECT fine.date_of_fine 
--				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
--	            WHERE reader.reader_name = 'Иванов И.И.'))) 
--		AS 'day_end_of_payment',
--		(SELECT fine.end_of_fine 
--				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
--	            WHERE reader.reader_name = 'Иванов И.И.')
--			AS 'end-of-fine date';

--SELECT title, author_name, publishing_name, amount FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 WHERE book_edition.amount = (SELECT MIN(book_edition.amount) FROM book_edition);

--SELECT SUM(issued_book.amount) AS 'Sum amount in issues' FROM issued_book;


--SELECT author_name, SUM(book_edition.amount) FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 GROUP BY author.author_name
--							 HAVING author.author_name LIKE 'Б%';

--SELECT STR(
--		(SELECT fine.summ
--				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
--	            WHERE reader.reader_name = 'Иванов И.И.')
--) AS 'str_request1';

--SELECT title, author_name, publishing_name, amount FROM book_edition	         
--						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--							 INNER JOIN book	   ON book_edition.book_id = book.book_id
--						     INNER JOIN author	   ON book.author_id = author.author_id
--							 WHERE book_edition.amount = (SELECT MIN(book_edition.amount) FROM book_edition);

--SELECT author_id FROM dbo.book
--UNION
--SELECT author_id FROM dbo.author;

--SELECT reader_id FROM reader
--INTERSECT
--SELECT reader_id FROM dbo.issued_book