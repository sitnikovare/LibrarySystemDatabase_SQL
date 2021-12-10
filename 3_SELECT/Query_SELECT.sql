USE LibrarySystem;

/***** 1. Запросы с использованием различных видов соединений таблиц (Inner join, Outer join, Cross join, Cross apply, самосоединение). ******/

/*
SELECT title, author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id;


SELECT * FROM author		 LEFT OUTER JOIN book   ON author.author_id = book.author_id;

SELECT * FROM author		 RIGHT OUTER JOIN book  ON author.author_id = book.author_id;

SELECT * FROM book_edition	 CROSS JOIN book;

SELECT * FROM book_edition	 CROSS APPLY (SELECT * FROM book WHERE book_edition.book_id = book.book_id) AS b;

SELECT book_edition.amount, book_edition1.amount FROM book_edition 
												 INNER JOIN book_edition book_edition1 
													   ON book_edition.publishing_id = book_edition1.publishing_id;
*/


/****** 2. Фильтрация данных в запросах с использованием предикатов (EXISTS, IN, ALL, SOME/ANY, BETWEEN, LIKE). ******/

/*
SELECT title, author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE EXISTS (SELECT publishing_name FROM publishing 
															WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')); /*и существует из-во Азбука*/


SELECT title, author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение');

SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount > ALL (SELECT issued_book.amount FROM issued_book);

SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount > ANY (SELECT issued_book.amount FROM issued_book);


SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount BETWEEN 5 AND 20;

SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book.title LIKE 'Ф%';
*/

/****** 3. Запросы с использованием выражения CASE. ******/

/*
--Simple CASE expression:   
SELECT CASE (SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = 'Булгаков М.А.') 
     WHEN 30 THEN (SELECT '30 книг Булгакова')  
     ELSE (SELECT 'книг Булгакова не 30')   
END 
AS 'simple_case'


--Searched CASE expression:  
SELECT CASE  
     WHEN (SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = 'Пелевин В.О.') > 0 
	 THEN (SELECT 'есть книги Пелевина')   
     ELSE (SELECT 'нет книг Пелевина')
END  
AS 'searched_case'
*/

/****** 4. Использование встроенных функций (функций преобразования типов (CAST, CONVERT), 
функций для проверки значений NULL (ISNULL, NULLIF), COALESCE логических функций (CHOOSE,  IIF) и т.п.). ******/
/*

/*название Стихи детям в XML - CAST*/
SELECT CAST(
(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.')
  AS xml
) AS 'cast_xml';

/*дату конца штрафа в другом виде - CONVERT - не хочет работать*/
SELECT CONVERT(
date,
(SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = 'Мастер и Маргарита' AND publishing.publishing_name = 'Азбука'),
5
) AS 'convert_date',
(SELECT book_edition.date_of_arrival
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = 'Мастер и Маргарита' AND publishing.publishing_name = 'Азбука')
 AS 'date-in-table'
;

/*ISNULL*/
/*авторам без книг графа "нет в библиотеке"*/
SELECT ISNULL(
(SELECT title FROM author  INNER JOIN book  ON author.author_id = book.author_id WHERE author.author_name = 'Пелевин В.О.'),
'нет в библиотеке'
) AS 'isnull_req'

/*NULLIF*/
/*проверим какую книгу Иванов забыл вернуть*/
SELECT NULLIF(
'Мастер и Маргарита',
(SELECT title FROM book INNER JOIN issued_book ON book.book_id = issued_book.book_id
                        INNER JOIN reader      ON reader.reader_id = issued_book.reader_id
						WHERE reader.reader_name = 'Иванов И.И.')
) AS 'Мастер и Маргарита? Иванов'

/*Пупки взял другую книгу*/
SELECT NULLIF(
'Мастер и Маргарита',
(SELECT title FROM book INNER JOIN issued_book ON book.book_id = issued_book.book_id
                        INNER JOIN reader      ON reader.reader_id = issued_book.reader_id
						WHERE reader.reader_name = 'Пупкин В.В.')
) AS 'Мастер и Маргарита? Пупкин'

/*COALESCE*/
   /*CHOOSE*/
SELECT COALESCE(
(SELECT CHOOSE( /*этот choose вернет NULL*/
	1, 
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = 'Пелевин В.О.'), /*этот запрос вернет NULL*/ 
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = 'Булгаков М.А.') /*этот запрос вернет 30*/
)),
(SELECT CHOOSE( /*этот choose вернет 30*/
	2, 
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = 'Пелевин В.О.'), /*этот запрос вернет NULL*/ 
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = 'Булгаков М.А.') /*этот запрос вернет 30*/
))
) AS 'coalesce_choose'

   /*IIF*/
SELECT COALESCE (
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = 'Пелевин В.О.'), /*этот запрос вернет NULL, т.к. книг Пелевина нет*/
    	IIF ( (SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = 'Булгаков М.А.') > 0,/*этот запрос вернет 30*/
						/*true*/ 30,    /*выполнится, т.к. есть книги Булгакова*/
						/*false*/ NULL) /*не выполнится*/
) AS 'coalesce_if'
*/


/****** 5. Запросы с использованием функций для  работы со строками (REPLACE, SUBSTRING, STUFF, STR,UNICODE, LOWER,UPPER и т.п.). ******/

/*
/*выбираем название книги ("Стихи детям" Барто), заменяем на "Стихи ребятам" - REPLACE*/
SELECT REPLACE(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.'),
	 'детя', 'ребята'
) AS 'changed_title'

/*проверяем, что название в таблице не изменилось - забираем второе слово из этого же названия - SUBSTRING*/
SELECT SUBSTRING(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.'),
	 7, 7
) AS 'substring_title';

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
) AS 'stuff_title';


/*вывод штрафа Иванова - STR*/
SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.')
) AS 'str_request1';


/*вывод штрафа Иванова - то же с доп.аргументами - STR*/
SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.'),
		5, 2
) AS 'str_request2';

/*UNICODE*/
/*код первого символа этого несчастного названия*/
SELECT UNICODE(
(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.')
) AS 'unicode_req';

/*то же название к нижнему регистру - LOWER*/
SELECT LOWER(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.')
) AS 'lower_title';

/*то же название к верхнему регистру - UPPER*/
SELECT UPPER(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('Эксмо', 'Аст', 'Просвещение')
							       AND NOT author.author_name = 'Булгаков М.А.')
) AS 'upper_title';
*/


/****** 6. Запросы с использованием функций даты и времени (DATEPART,DATEADD,DATEDIFF,  GETDATE(), SYSDATETIMEOFFSET() и т.п.). ******/
/*

/*месяц поступления книги - DATEPART*/
SELECT (DATEPART(month,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = 'Мастер и Маргарита' AND publishing.publishing_name = 'Азбука'))) 
		AS 'month_of_receipt';

/*в какой день недели должен был быть уплачен штраф - DATEADD*/
/*сравними с end-of-fine столбцом*/
SELECT (DATEADD(day, 14,
        (SELECT fine.date_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.'))) 
		AS 'day_end_of_payment',
		(SELECT fine.end_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = 'Иванов И.И.')
			AS 'end-of-fine date';

/*сколько дней назад поступила книга - DATEDIFF & GETDATE() */
SELECT (DATEDIFF(day,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = 'Мастер и Маргарита' AND publishing.publishing_name = 'Азбука'),
		GETDATE())) AS 'being_in_lib';

/*SYSDATETIMEOFFSET()*/
SELECT  SYSDATETIMEOFFSET() AS 'current_time',
		DATEPART(weekday, SYSDATETIMEOFFSET()) AS 'day-of-week',
		DATEPART(dayofyear, SYSDATETIMEOFFSET()) AS 'day-of-year';
*/

/****** 7. Запросы с использованием агрегатных функций (MIN, MAX, AVG, SUM   и т.д.), группировок (GROUP BY) и фильтрации групп (HAVING). ******/

/*
SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount = (SELECT MIN(book_edition.amount) FROM book_edition);

SELECT title, author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount = (SELECT MAX(book_edition.amount) FROM book_edition);

SELECT AVG(book_edition.amount) AS 'Average amount in library' FROM book_edition; 

SELECT SUM(issued_book.amount) AS 'Sum amount in issues' FROM issued_book;

SELECT author_name, SUM(book_edition.amount) FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 GROUP BY author.author_name
							 HAVING author.author_name LIKE 'Б%';
*/
