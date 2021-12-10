USE LibrarySystem;

/***** 1. ������� � �������������� ��������� ����� ���������� ������ (Inner join, Outer join, Cross join, Cross apply, ��������������). ******/

SELECT title AS 'INNER JOIN title', author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id;


SELECT author.author_name AS 'LEFT JOIN author name', book.title 
       FROM author		 LEFT OUTER JOIN book   ON author.author_id = book.author_id;

SELECT author.author_name AS 'RIGHT JOIN author name', book.title 
       FROM author		 RIGHT OUTER JOIN book  ON author.author_id = book.author_id;

SELECT * FROM book_edition	 CROSS JOIN book;

/*��������� book_edition �� ������ �������� �� book*/
SELECT * FROM book_edition	 CROSS APPLY (SELECT * FROM book WHERE book_edition.book_id = book.book_id) AS b;

/*��� ���� ���� ������ ������������*/
SELECT title, book_edition.amount AS 'amount1', book_edition1.amount AS 'amount2', publishing_name FROM book_edition 
												 INNER JOIN book_edition book_edition1 
												 INNER JOIN publishing ON book_edition1.publishing_id = publishing.publishing_id
												 INNER JOIN book ON book.book_id = book_edition1.book_id
													   ON book_edition.publishing_id = book_edition1.publishing_id;


/****** 2. ���������� ������ � �������� � �������������� ���������� (EXISTS, IN, ALL, SOME/ANY, BETWEEN, LIKE). ******/

/*������������� ����� ������� � ��������� ������, �.�. ��� ���� �� ��-�� �����*/
SELECT title AS 'EXIST title', author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE EXISTS (SELECT publishing_name FROM publishing 
															WHERE publishing.publishing_name IN ('�����', '���', '�����������')); /*� ���������� ��-�� ������*/

/*������� ��� �� ���� �����������*/
SELECT title AS 'IN title', author_name, publishing_name FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE publishing.publishing_name IN ('�����', '���', '�����������');

/*�����, ���������� ������� ������, ��� ���� ���-�� ����������� �����*/							 
SELECT title AS 'ALL title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount > ALL (SELECT issued_book.amount FROM issued_book);

/*�����, ���������� ������� ������, ��� ���� ���-�� ������ �����*/	
SELECT title AS 'ANY title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount > ANY (SELECT issued_book.amount FROM issued_book);

/*�����, ���������� ������� ����� 5 � 20*/
SELECT title AS 'BETWEEN title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book_edition.amount BETWEEN 5 AND 20;

/*�����, ������� ���������� �� ����� �*/
SELECT title AS 'LIKE title', author_name, publishing_name, amount FROM book_edition	         
						     INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
							 INNER JOIN book	   ON book_edition.book_id = book.book_id
						     INNER JOIN author	   ON book.author_id = author.author_id
							 WHERE book.title LIKE '�%';
