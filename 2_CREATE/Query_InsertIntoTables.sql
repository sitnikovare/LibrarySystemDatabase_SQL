USE LibrarySystem_NOINDEXES;

--INSERT INTO department (department_name) VALUES ('�����'), 
--												('�����'), 
--												('�������'), 
--												('������� ����������'), 
--												('�������������� ����������'), 
--												('���-������'),
--												('������� ����������'),
--												('������������ ����������');

------INSERT INTO author (author_name) VALUES ('�������� �.�.'), 
------									    ('������� �.�.'), 
------									    ('������� �.�.'), 
------										('��������� �.�.'),
------										('������� �.�.'),
------										('������ �.�.'),
------										('����� ���������'),
------										('����� �.�.');

--INSERT INTO genre (genre_name) VALUES ('�����'), 
--								      ('�����-������'),
--									  ('�������'),
--									  ('����������'),
--									  ('���������'),
--									  ('�����'),
--									  ('�����������'),
--									  ('����������'),
--									  ('�������'),
--									  ('������������ ����������'),
--									  ('�������������');

----INSERT INTO publishing (publishing_name, address) VALUES ('������', '�. ������, ��. ����������, �. 7.'), 
----													     ('�����', '�. ������, ��. �����, �.1, ���.1.'),
----														 ('���', '�. ������, ����������� ���., �.6, ���.2'),
----														 ('�����������', '�. ������, ��. ������������������, �.16, ���.3'),
----														 ('�����', '�. �����-���������, �. ������������� ������, �.29�');

----INSERT INTO book (title, author_id, genre_id) VALUES ('������ � ���������', 
----																	   (SELECT author_id FROM author WHERE author_name='�������� �.�.'), 
----																	   (SELECT genre_id FROM genre WHERE genre_name='�����')), 
----												     ('����� � ���',   
----																	   (SELECT author_id FROM author WHERE author_name='������� �.�.'), 
----																	   (SELECT genre_id FROM genre WHERE genre_name='�����-������')),
----													 ('��������� DevOps',
----																	   (SELECT author_id FROM author WHERE author_name='����� ���������'), 
----																	   (SELECT genre_id FROM genre WHERE genre_name='������������ ����������')),
----													 ('����� �����',
----																	   (SELECT author_id FROM author WHERE author_name='����� �.�.'), 
----																	   (SELECT genre_id FROM genre WHERE genre_name='�������������'));;

----INSERT INTO book_edition (book_id, publishing_id, edition_number, amount, date_of_arrival, department_id) VALUES 
----								((SELECT book_id FROM book WHERE title = '������ � ���������'), 
----									(SELECT publishing_id FROM publishing WHERE publishing_name = '������'), 1, 10, '2021-09-21', 
----									(SELECT department_id FROM department WHERE department_name = '�������������� ����������')),
----								((SELECT book_id FROM book WHERE title = '������ � ���������'), 
----									(SELECT publishing_id FROM publishing WHERE publishing_name = '�����'), 1, 20, '2021-09-11', 
----									(SELECT department_id FROM department WHERE department_name = '�������������� ����������')),
----								((SELECT book_id FROM book WHERE title = '��������� DevOps'),   
----									(SELECT publishing_id FROM publishing WHERE publishing_name = '�����'), 2, 5, '2021-09-27', 
----									(SELECT department_id FROM department WHERE department_name = '������������ ����������')),
----								((SELECT book_id FROM book WHERE title = '����� �����'),   
----									(SELECT publishing_id FROM publishing WHERE publishing_name = '�����'), 2, 15, '2021-08-15', 
----									(SELECT department_id FROM department WHERE department_name = '������� ����������'));;

----INSERT INTO decom_book (book_id, book_edition_id, decom_date) VALUES 
----								((SELECT book_id FROM book WHERE title = '������ � ���������'), 
----									(SELECT book_edition_id FROM book_edition WHERE publishing_id = 
----										(SELECT publishing_id FROM publishing WHERE publishing_name = '������')), '2021-09-20');

----INSERT INTO reader (reader_name, reader_phone, reader_address, work, position, date_of_birth) VALUES 
----											('������ �.�.', '+78985679252', '��.������ �.50 ��.10', '000 �����������', '��������', '2000-09-21'),
----											('������ �.�.', '+78985645245', '��.���������� �.10 ��.1', '000 ������', '�����������', '1998-10-05');

INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue, end_of_issue) VALUES 
											(100001, 
												(SELECT book_edition_id FROM book_edition WHERE publishing_id = 
													(SELECT publishing_id FROM publishing WHERE 
															publishing_id = 100002 AND book_id = 100001)), 15, 
														100001, '2021-08-23', '2021-09-07'),
											(100003, 
												(SELECT book_edition_id FROM book_edition WHERE publishing_id = 
													100005), 1, 
														100002, '2021-09-17', '2021-10-01');

--INSERT INTO fine_status (status_name) VALUES ('�������'), 
--											 ('�� �������'), 
--											 ('���������'); 

INSERT INTO fine (date_of_fine, end_of_fine, summ, reader_id, status_id) VALUES 
									('2021-09-08', '2021-09-22', 100, 
										(SELECT reader_id FROM reader WHERE reader_name = '������ �.�.'), 
										(SELECT status_id FROM fine_status WHERE status_name = '���������'));

INSERT INTO expired_book (issued_book_id, fine_id) VALUES 
									((SELECT issued_book_id FROM issued_book WHERE book_id = 
										(SELECT book_id FROM book WHERE title = '������ � ���������')), 1);

--SELECT * FROM department;
--SELECT * FROM author;
--SELECT * FROM genre;
--SELECT * FROM publishing;
--SELECT * FROM book;
--SELECT * FROM book_edition;
--SELECT * FROM decom_book;
--SELECT * FROM reader;
--SELECT * FROM issued_book;
--SELECT * FROM expired_book;
--SELECT * FROM fine_status;
--SELECT * FROM fine;