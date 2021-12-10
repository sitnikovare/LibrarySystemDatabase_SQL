USE LibrarySystem;

/***** 1. ������� � �������������� ��������� ����� ���������� ������ (Inner join, Outer join, Cross join, Cross apply, ��������������). ******/

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


/****** 2. ���������� ������ � �������� � �������������� ���������� (EXISTS, IN, ALL, SOME/ANY, BETWEEN, LIKE). ******/

/*
SELECT title, author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE EXISTS (SELECT publishing_name FROM publishing 
															WHERE publishing.publishing_name IN ('�����', '���', '�����������')); /*� ���������� ��-�� ������*/


SELECT title, author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������');

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
							 WHERE book.title LIKE '�%';
*/

/****** 3. ������� � �������������� ��������� CASE. ******/

/*
--Simple CASE expression:   
SELECT CASE (SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = '�������� �.�.') 
     WHEN 30 THEN (SELECT '30 ���� ���������')  
     ELSE (SELECT '���� ��������� �� 30')   
END 
AS 'simple_case'


--Searched CASE expression:  
SELECT CASE  
     WHEN (SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = '������� �.�.') > 0 
	 THEN (SELECT '���� ����� ��������')   
     ELSE (SELECT '��� ���� ��������')
END  
AS 'searched_case'
*/

/****** 4. ������������� ���������� ������� (������� �������������� ����� (CAST, CONVERT), 
������� ��� �������� �������� NULL (ISNULL, NULLIF), COALESCE ���������� ������� (CHOOSE,  IIF) � �.�.). ******/
/*

/*�������� ����� ����� � XML - CAST*/
SELECT CAST(
(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.')
  AS xml
) AS 'cast_xml';

/*���� ����� ������ � ������ ���� - CONVERT - �� ����� ��������*/
SELECT CONVERT(
date,
(SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = '������ � ���������' AND publishing.publishing_name = '������'),
5
) AS 'convert_date',
(SELECT book_edition.date_of_arrival
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = '������ � ���������' AND publishing.publishing_name = '������')
 AS 'date-in-table'
;

/*ISNULL*/
/*������� ��� ���� ����� "��� � ����������"*/
SELECT ISNULL(
(SELECT title FROM author  INNER JOIN book  ON author.author_id = book.author_id WHERE author.author_name = '������� �.�.'),
'��� � ����������'
) AS 'isnull_req'

/*NULLIF*/
/*�������� ����� ����� ������ ����� �������*/
SELECT NULLIF(
'������ � ���������',
(SELECT title FROM book INNER JOIN issued_book ON book.book_id = issued_book.book_id
                        INNER JOIN reader      ON reader.reader_id = issued_book.reader_id
						WHERE reader.reader_name = '������ �.�.')
) AS '������ � ���������? ������'

/*����� ���� ������ �����*/
SELECT NULLIF(
'������ � ���������',
(SELECT title FROM book INNER JOIN issued_book ON book.book_id = issued_book.book_id
                        INNER JOIN reader      ON reader.reader_id = issued_book.reader_id
						WHERE reader.reader_name = '������ �.�.')
) AS '������ � ���������? ������'

/*COALESCE*/
   /*CHOOSE*/
SELECT COALESCE(
(SELECT CHOOSE( /*���� choose ������ NULL*/
	1, 
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = '������� �.�.'), /*���� ������ ������ NULL*/ 
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = '�������� �.�.') /*���� ������ ������ 30*/
)),
(SELECT CHOOSE( /*���� choose ������ 30*/
	2, 
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = '������� �.�.'), /*���� ������ ������ NULL*/ 
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = '�������� �.�.') /*���� ������ ������ 30*/
))
) AS 'coalesce_choose'

   /*IIF*/
SELECT COALESCE (
	(SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = '������� �.�.'), /*���� ������ ������ NULL, �.�. ���� �������� ���*/
    	IIF ( (SELECT SUM(book_edition.amount) FROM author  INNER JOIN book  ON author.author_id = book.author_id 
												  INNER JOIN book_edition ON book.book_id = book_edition.book_id
                                           WHERE author.author_name = '�������� �.�.') > 0,/*���� ������ ������ 30*/
						/*true*/ 30,    /*����������, �.�. ���� ����� ���������*/
						/*false*/ NULL) /*�� ����������*/
) AS 'coalesce_if'
*/


/****** 5. ������� � �������������� ������� ���  ������ �� �������� (REPLACE, SUBSTRING, STUFF, STR,UNICODE, LOWER,UPPER � �.�.). ******/

/*
/*�������� �������� ����� ("����� �����" �����), �������� �� "����� �������" - REPLACE*/
SELECT REPLACE(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.'),
	 '����', '������'
) AS 'changed_title'

/*���������, ��� �������� � ������� �� ���������� - �������� ������ ����� �� ����� �� �������� - SUBSTRING*/
SELECT SUBSTRING(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.'),
	 7, 7
) AS 'substring_title';

/*� ���� �� �������� ��������� "� �������" - STUFF*/
/*� � ����� �������� �� ������� ������*/
SELECT STUFF(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.'),
	 11, 0, ' � ������'
) AS 'stuff_title';


/*����� ������ ������� - STR*/
SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = '������ �.�.')
) AS 'str_request1';


/*����� ������ ������� - �� �� � ���.����������� - STR*/
SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = '������ �.�.'),
		5, 2
) AS 'str_request2';

/*UNICODE*/
/*��� ������� ������� ����� ����������� ��������*/
SELECT UNICODE(
(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.')
) AS 'unicode_req';

/*�� �� �������� � ������� �������� - LOWER*/
SELECT LOWER(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.')
) AS 'lower_title';

/*�� �� �������� � �������� �������� - UPPER*/
SELECT UPPER(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.')
) AS 'upper_title';
*/


/****** 6. ������� � �������������� ������� ���� � ������� (DATEPART,DATEADD,DATEDIFF,  GETDATE(), SYSDATETIMEOFFSET() � �.�.). ******/
/*

/*����� ����������� ����� - DATEPART*/
SELECT (DATEPART(month,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = '������ � ���������' AND publishing.publishing_name = '������'))) 
		AS 'month_of_receipt';

/*� ����� ���� ������ ������ ��� ���� ������� ����� - DATEADD*/
/*�������� � end-of-fine ��������*/
SELECT (DATEADD(day, 14,
        (SELECT fine.date_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = '������ �.�.'))) 
		AS 'day_end_of_payment',
		(SELECT fine.end_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = '������ �.�.')
			AS 'end-of-fine date';

/*������� ���� ����� ��������� ����� - DATEDIFF & GETDATE() */
SELECT (DATEDIFF(day,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = '������ � ���������' AND publishing.publishing_name = '������'),
		GETDATE())) AS 'being_in_lib';

/*SYSDATETIMEOFFSET()*/
SELECT  SYSDATETIMEOFFSET() AS 'current_time',
		DATEPART(weekday, SYSDATETIMEOFFSET()) AS 'day-of-week',
		DATEPART(dayofyear, SYSDATETIMEOFFSET()) AS 'day-of-year';
*/

/****** 7. ������� � �������������� ���������� ������� (MIN, MAX, AVG, SUM   � �.�.), ����������� (GROUP BY) � ���������� ����� (HAVING). ******/

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
							 HAVING author.author_name LIKE '�%';
*/
