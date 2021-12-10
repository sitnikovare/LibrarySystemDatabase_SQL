USE LibrarySystem;

/****** 5. Запросы с использованием функций для  работы со строками (REPLACE, SUBSTRING, STUFF, STR,UNICODE, LOWER,UPPER и т.п.). ******/

/*выбираем название книги ("Стихи детям" Барто), заменяем на "Стихи ребятам" - REPLACE*/
SELECT REPLACE(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.'),
	 'детя', 'ребята'
) AS 'REPLACE title'

/*проверяем, что название в таблице не изменилось - забираем второе слово из этого же названия - SUBSTRING*/
SELECT SUBSTRING(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.'),
	 7, 7
) AS 'SUBSTRING_title';

/*к тому же названию добавляем "и ребятам" - STUFF*/
/*М в конце осталось из прошлой строки*/
SELECT STUFF(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.'),
	 11, 0, ' и ребята'
) AS 'STUFF_title';


/*вывод штрафа Иванова - STR*/
SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.')
) AS 'STR_request1';


/*вывод штрафа Иванова - то же с доп.аргументами - STR*/
SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.'),
		5, 2
) AS 'STR_request2';

/*UNICODE*/
/*код первого символа этого несчастного названия*/
SELECT UNICODE(
(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.')
) AS 'UNICODE_req';

/*то же название к нижнему регистру - LOWER*/
SELECT LOWER(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.')
) AS 'LOWER_title';

/*то же название к верхнему регистру - UPPER*/
SELECT UPPER(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.')
) AS 'UPPER_title';


/****** 6. Запросы с использованием функций даты и времени (DATEPART,DATEADD,DATEDIFF,  GETDATE(), SYSDATETIMEOFFSET() и т.п.). ******/

/*месяц поступления книги - DATEPART*/
SELECT (DATEPART(month,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = 'Мастер и Маргарита' AND publishing.publishing_name = 'Азбука'))) 
		AS 'DATEPART_month_of_receipt';

/*в какой день недели должен был быть уплачен штраф - DATEADD*/
/*сравними с end-of-fine столбцом*/
SELECT (DATEADD(day, 14,
        (SELECT fine.date_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.'))) 
		AS 'DATEADD_day_end_of_payment',
		(SELECT fine.end_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.')
			AS 'DATEADD_end-of-fine date';

/*сколько дней назад поступила книга - DATEDIFF & GETDATE() */
SELECT (DATEDIFF(day,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = 'Мастер и Маргарита' AND publishing.publishing_name = 'Азбука'),
		GETDATE())) AS 'DATEDIFF_being_in_lib';

/*SYSDATETIMEOFFSET()*/
SELECT  SYSDATETIMEOFFSET() AS 'SYSDATETIMEOFFSET_current_time',
		DATEPART(weekday, SYSDATETIMEOFFSET()) AS 'day-of-week',
		DATEPART(dayofyear, SYSDATETIMEOFFSET()) AS 'day-of-year';

/****** 7. Запросы с использованием агрегатных функций (MIN, MAX, AVG, SUM   и т.д.), группировок (GROUP BY) и фильтрации групп (HAVING). ******/

SELECT title AS 'MIN_title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount = (SELECT MIN(book_edition.amount) FROM book_edition);

SELECT title AS 'MAX_title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount = (SELECT MAX(book_edition.amount) FROM book_edition);

SELECT AVG(book_edition.amount) AS 'AVG amount in library' FROM book_edition; 

SELECT SUM(issued_book.amount) AS 'SUM amount in issues' FROM issued_book;

SELECT author_name AS 'GROP_BY_author_name', SUM(book_edition.amount) AS 'amount HAVING author Б*' FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 GROUP BY author.author_name
							 HAVING author.author_name LIKE 'Б%';
