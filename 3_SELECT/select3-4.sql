USE LibrarySystem;

/****** 3. Запросы с использованием выражения CASE. ******/

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


/****** 4. Использование встроенных функций (функций преобразования типов (CAST, CONVERT), 
функций для проверки значений NULL (ISNULL, NULLIF), COALESCE логических функций (CHOOSE,  IIF) и т.п.). ******/


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
/*авторам без книг - графа "нет в библиотеке"*/
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
(SELECT title FROM book INNER JOIN issued_book ON book.book_id = issued_book.book_id
                        INNER JOIN reader      ON reader.reader_id = issued_book.reader_id
						WHERE reader.reader_name = 'Пупкин В.В.'),
'Мастер и Маргарита'
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
