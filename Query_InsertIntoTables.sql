USE LibrarySystem;

INSERT department (department_name) VALUES ('Архив', 
											'Наука', 
											'Журналы', 
											'Детская литература', 
											'Художественная литература');

INSERT library_shelf (department_id) VALUES ((SELECT department_id FROM department WHERE department_name='Архив'),
											 (SELECT department_id FROM department WHERE department_name='Наука'),
											 (SELECT department_id FROM department WHERE department_name='Журналы'),
											 (SELECT department_id FROM department WHERE department_name='Детская литература'),
											 (SELECT department_id FROM department WHERE department_name='Художественная литература'));

INSERT author (author_name) VALUES ('Булгаков М.А.', 
									'Пелевин В.О.', 
									'Толстой Л.Н.');

INSERT genre (genre_name) VALUES ('Роман', 
								  'Роман-эпопея');

INSERT publishing (publishing_name, address) VALUES ('Азбука', 'г. Москва, ул. Павловская, д. 7.'), 
													('Эксмо', 'г. Москва, ул. Зорге, д.1, стр.1.');

INSERT book (title, author_id, genre_id) VALUES ('Мастер и Маргарита', (SELECT author_id FROM author WHERE author_name='Булгаков М.А.'), 
																	   (SELECT genre_id FROM genre WHERE genre_name='Роман')), 
												('Война и мир',		   (SELECT author_id FROM author WHERE author_name='Толстой Л.Н.'), 
																	   (SELECT genre_id FROM genre WHERE genre_name='Роман-эпопея'));

INSERT book_edition (book_id, publishing_id, edition_number, amount, date_of_arrival, shelf_id) VALUES (
								((SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), (SELECT publishing_id FROM publishing WHERE publishing_name = 'Азбука'), 1, 10, '2021-09-21', 5)),
								((SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), (SELECT publishing_id FROM publishing WHERE publishing_name = 'Эксмо'), 1, 20, '2021-09-11', 5)));

INSERT decom_book (book_id, book_edition_id, decom_date) VALUES ((SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), (SELECT book_edition_id FROM book_edition WHERE publishing_name = 'Азбука'));

INSERT reader (reader_name, reader_phone, reader_address, work, position, date_of_birth) VALUES (
				'Иванов И.И.', '+78985679252', 'ул.Гоголя д.50 кв.10', '000 Макдональдс', 'Продавец', '2000-05-09');

INSERT issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue, end_of_issue) VALUES (
					(SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), (SELECT book_edition_id FROM book_edition WHERE publishing_name = 'Эксмо'), 1, (SELECT reader_id FROM reader WHERE reader_name = 'Иванов И.И.'), '2021-08-23', '2021-09-07');

INSERT expired_book (issued_book_id, fine_id) VALUES (
						(SELECT issued_book_id FROM book WHERE title = 'Мастер и Маргарита'));

INSERT fine_status (status_name) VALUES ('Оплачен', 'Не оплачен', 'Просрочен'); 

INSERT fine (date_of_fine, end_of_fine, summ, reader_id, status_id) VALUES ('2021-09-08', '2021-09-22', 100, (SELECT reader_id FROM reader WHERE reader_name = 'Иванов И.И.'), (SELECT status_id FROM fine_status WHERE status_name = 'Просрочен'));