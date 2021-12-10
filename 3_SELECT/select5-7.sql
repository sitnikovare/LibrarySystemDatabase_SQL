USE LibrarySystem;

/****** 5. ������� � �������������� ������� ���  ������ �� �������� (REPLACE, SUBSTRING, STUFF, STR,UNICODE, LOWER,UPPER � �.�.). ******/

/*�������� �������� ����� ("����� �����" �����), �������� �� "����� �������" - REPLACE*/
SELECT REPLACE(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.'),
	 '����', '������'
) AS 'REPLACE title'

/*���������, ��� �������� � ������� �� ���������� - �������� ������ ����� �� ����� �� �������� - SUBSTRING*/
SELECT SUBSTRING(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.'),
	 7, 7
) AS 'SUBSTRING_title';

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
) AS 'STUFF_title';


/*����� ������ ������� - STR*/
SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = '������ �.�.')
) AS 'STR_request1';


/*����� ������ ������� - �� �� � ���.����������� - STR*/
SELECT STR(
		(SELECT fine.summ
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = '������ �.�.'),
		5, 2
) AS 'STR_request2';

/*UNICODE*/
/*��� ������� ������� ����� ����������� ��������*/
SELECT UNICODE(
(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.')
) AS 'UNICODE_req';

/*�� �� �������� � ������� �������� - LOWER*/
SELECT LOWER(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.')
) AS 'LOWER_title';

/*�� �� �������� � �������� �������� - UPPER*/
SELECT UPPER(
	(SELECT title FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������')
							       AND NOT author.author_name = '�������� �.�.')
) AS 'UPPER_title';


/****** 6. ������� � �������������� ������� ���� � ������� (DATEPART,DATEADD,DATEDIFF,  GETDATE(), SYSDATETIMEOFFSET() � �.�.). ******/

/*����� ����������� ����� - DATEPART*/
SELECT (DATEPART(month,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = '������ � ���������' AND publishing.publishing_name = '������'))) 
		AS 'DATEPART_month_of_receipt';

/*� ����� ���� ������ ������ ��� ���� ������� ����� - DATEADD*/
/*�������� � end-of-fine ��������*/
SELECT (DATEADD(day, 14,
        (SELECT fine.date_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = '������ �.�.'))) 
		AS 'DATEADD_day_end_of_payment',
		(SELECT fine.end_of_fine 
				FROM fine INNER JOIN reader       ON fine.reader_id = reader.reader_id 
	            WHERE reader.reader_name = '������ �.�.')
			AS 'DATEADD_end-of-fine date';

/*������� ���� ����� ��������� ����� - DATEDIFF & GETDATE() */
SELECT (DATEDIFF(day,
        (SELECT book_edition.date_of_arrival 
				FROM book_edition INNER JOIN book       ON book_edition.book_id = book.book_id 
                                  INNER JOIN publishing ON publishing.publishing_id = book_edition.publishing_id
	            WHERE book.title = '������ � ���������' AND publishing.publishing_name = '������'),
		GETDATE())) AS 'DATEDIFF_being_in_lib';

/*SYSDATETIMEOFFSET()*/
SELECT  SYSDATETIMEOFFSET() AS 'SYSDATETIMEOFFSET_current_time',
		DATEPART(weekday, SYSDATETIMEOFFSET()) AS 'day-of-week',
		DATEPART(dayofyear, SYSDATETIMEOFFSET()) AS 'day-of-year';

/****** 7. ������� � �������������� ���������� ������� (MIN, MAX, AVG, SUM   � �.�.), ����������� (GROUP BY) � ���������� ����� (HAVING). ******/

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

SELECT author_name AS 'GROP_BY_author_name', SUM(book_edition.amount) AS 'amount HAVING author �*' FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 GROUP BY author.author_name
							 HAVING author.author_name LIKE '�%';
