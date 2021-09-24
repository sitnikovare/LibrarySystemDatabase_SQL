USE LibrarySystem;

INSERT INTO department (department_name) VALUES ('Архив'), 
											('Наука'), 
											('Журналы'), 
											('Детская литература'), 
											('Художественная литература');

INSERT INTO author (author_name) VALUES ('Булгаков М.А.'), 
									    ('Пелевин В.О.'), 
									    ('Толстой Л.Н.');

INSERT INTO genre (genre_name) VALUES ('Роман'), 
								      ('Роман-эпопея');

INSERT INTO publishing (publishing_name, address) VALUES ('Азбука', 'г. Москва, ул. Павловская, д. 7.'), 
													     ('Эксмо', 'г. Москва, ул. Зорге, д.1, стр.1.');

INSERT INTO book (title, author_id, genre_id) VALUES ('Мастер и Маргарита', 
																	   (SELECT author_id FROM author WHERE author_name='Булгаков М.А.'), 
																	   (SELECT genre_id FROM genre WHERE genre_name='Роман')), 
												     ('Война и мир',   (SELECT author_id FROM author WHERE author_name='Толстой Л.Н.'), 
																	   (SELECT genre_id FROM genre WHERE genre_name='Роман-эпопея'));

INSERT INTO book_edition (book_id, publishing_id, edition_number, amount, date_of_arrival, department_id) VALUES 
								((SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), (SELECT publishing_id FROM publishing WHERE publishing_name = 'Азбука'), 1, 10, '2021-09-21', (SELECT department_id FROM department WHERE department_name = 'Художественная литература')),
								((SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), (SELECT publishing_id FROM publishing WHERE publishing_name = 'Эксмо'), 1, 20, '2021-09-11', (SELECT department_id FROM department WHERE department_name = 'Художественная литература'));

INSERT INTO decom_book (book_id, book_edition_id, decom_date) VALUES (
(SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), (SELECT book_edition_id FROM book_edition WHERE publishing_id = (SELECT publishing_id FROM publishing WHERE publishing_name = 'Азбука')), '2021-09-20');

INSERT INTO reader (reader_name, reader_phone, reader_address, work, position, date_of_birth) VALUES (
																		'Иванов И.И.', '+78985679252', 'ул.Гоголя д.50 кв.10', '000 Макдональдс', 'Продавец', '2000-09-21');

INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue, end_of_issue) VALUES (
																		(SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), (SELECT book_edition_id FROM book_edition WHERE publishing_id = (SELECT publishing_id FROM publishing WHERE publishing_name = 'Эксмо')), 1, (SELECT reader_id FROM reader WHERE reader_name = 'Иванов И.И.'), '2021-08-23', '2021-09-07');

INSERT INTO fine_status (status_name) VALUES ('Оплачен'), 
											 ('Не оплачен'), 
											 ('Просрочен'); 

INSERT INTO fine (date_of_fine, end_of_fine, summ, reader_id, status_id) VALUES ('2021-09-08', '2021-09-22', 100, (SELECT reader_id FROM reader WHERE reader_name = 'Иванов И.И.'), (SELECT status_id FROM fine_status WHERE status_name = 'Просрочен'));

INSERT INTO expired_book (issued_book_id, fine_id) VALUES ((SELECT issued_book_id FROM issued_book WHERE book_id = (SELECT book_id FROM book WHERE title = 'Мастер и Маргарита')), 1);