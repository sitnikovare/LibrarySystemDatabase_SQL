USE LibrarySystem;

INSERT INTO department (department_name) VALUES ('�����'), 
											('�����'), 
											('�������'), 
											('������� ����������'), 
											('�������������� ����������');

INSERT INTO author (author_name) VALUES ('�������� �.�.'), 
									    ('������� �.�.'), 
									    ('������� �.�.');

INSERT INTO genre (genre_name) VALUES ('�����'), 
								      ('�����-������');

INSERT INTO publishing (publishing_name, address) VALUES ('������', '�. ������, ��. ����������, �. 7.'), 
													     ('�����', '�. ������, ��. �����, �.1, ���.1.');

INSERT INTO book (title, author_id, genre_id) VALUES ('������ � ���������', 
																	   (SELECT author_id FROM author WHERE author_name='�������� �.�.'), 
																	   (SELECT genre_id FROM genre WHERE genre_name='�����')), 
												     ('����� � ���',   (SELECT author_id FROM author WHERE author_name='������� �.�.'), 
																	   (SELECT genre_id FROM genre WHERE genre_name='�����-������'));

INSERT INTO book_edition (book_id, publishing_id, edition_number, amount, date_of_arrival, department_id) VALUES 
								((SELECT book_id FROM book WHERE title = '������ � ���������'), (SELECT publishing_id FROM publishing WHERE publishing_name = '������'), 1, 10, '2021-09-21', (SELECT department_id FROM department WHERE department_name = '�������������� ����������')),
								((SELECT book_id FROM book WHERE title = '������ � ���������'), (SELECT publishing_id FROM publishing WHERE publishing_name = '�����'), 1, 20, '2021-09-11', (SELECT department_id FROM department WHERE department_name = '�������������� ����������'));

INSERT INTO decom_book (book_id, book_edition_id, decom_date) VALUES (
(SELECT book_id FROM book WHERE title = '������ � ���������'), (SELECT book_edition_id FROM book_edition WHERE publishing_id = (SELECT publishing_id FROM publishing WHERE publishing_name = '������')), '2021-09-20');

INSERT INTO reader (reader_name, reader_phone, reader_address, work, position, date_of_birth) VALUES (
																		'������ �.�.', '+78985679252', '��.������ �.50 ��.10', '000 �����������', '��������', '2000-09-21');

INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue, end_of_issue) VALUES (
																		(SELECT book_id FROM book WHERE title = '������ � ���������'), (SELECT book_edition_id FROM book_edition WHERE publishing_id = (SELECT publishing_id FROM publishing WHERE publishing_name = '�����')), 1, (SELECT reader_id FROM reader WHERE reader_name = '������ �.�.'), '2021-08-23', '2021-09-07');

INSERT INTO fine_status (status_name) VALUES ('�������'), 
											 ('�� �������'), 
											 ('���������'); 

INSERT INTO fine (date_of_fine, end_of_fine, summ, reader_id, status_id) VALUES ('2021-09-08', '2021-09-22', 100, (SELECT reader_id FROM reader WHERE reader_name = '������ �.�.'), (SELECT status_id FROM fine_status WHERE status_name = '���������'));

INSERT INTO expired_book (issued_book_id, fine_id) VALUES ((SELECT issued_book_id FROM issued_book WHERE book_id = (SELECT book_id FROM book WHERE title = '������ � ���������')), 1);