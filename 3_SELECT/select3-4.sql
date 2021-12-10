USE LibrarySystem;

/****** 3. ������� � �������������� ��������� CASE. ******/

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


/****** 4. ������������� ���������� ������� (������� �������������� ����� (CAST, CONVERT), 
������� ��� �������� �������� NULL (ISNULL, NULLIF), COALESCE ���������� ������� (CHOOSE,  IIF) � �.�.). ******/


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
/*������� ��� ���� - ����� "��� � ����������"*/
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
(SELECT title FROM book INNER JOIN issued_book ON book.book_id = issued_book.book_id
                        INNER JOIN reader      ON reader.reader_id = issued_book.reader_id
						WHERE reader.reader_name = '������ �.�.'),
'������ � ���������'
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
