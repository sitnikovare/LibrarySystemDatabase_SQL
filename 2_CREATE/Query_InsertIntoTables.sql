USE LibrarySystem_NOINDEXES;

--INSERT INTO department (department_name) VALUES ('Архив'), 
--												('Наука'), 
--												('Журналы'), 
--												('Детская литература'), 
--												('Художественная литература'), 
--												('Нон-фикшен'),
--												('Учебная литература'),
--												('Компьютерная литература');

------INSERT INTO author (author_name) VALUES ('Булгаков М.А.'), 
------									    ('Пелевин В.О.'), 
------									    ('Толстой Л.Н.'), 
------										('Демидович Б.П.'),
------										('Сахаров А.Д.'),
------										('Ландау Л.Д.'),
------										('Девис Дженнифер'),
------										('Барто А.Л.');

--INSERT INTO genre (genre_name) VALUES ('Роман'), 
--								      ('Роман-эпопея'),
--									  ('Фэнтези'),
--									  ('Фантастика'),
--									  ('Детективы'),
--									  ('Ужасы'),
--									  ('Приключения'),
--									  ('Психология'),
--									  ('История'),
--									  ('Компьютерная литература'),
--									  ('Стихотворения');

----INSERT INTO publishing (publishing_name, address) VALUES ('Азбука', 'г. Москва, ул. Павловская, д. 7.'), 
----													     ('Эксмо', 'г. Москва, ул. Зорге, д.1, стр.1.'),
----														 ('Аст', 'г. Москва, Пресненская наб., д.6, стр.2'),
----														 ('Просвещение', 'г. Москва, ул. Краснопролетарская, д.16, стр.3'),
----														 ('Питер', 'г. Санкт-Петербург, Б. Самсониевский проезд, д.29а');

----INSERT INTO book (title, author_id, genre_id) VALUES ('Мастер и Маргарита', 
----																	   (SELECT author_id FROM author WHERE author_name='Булгаков М.А.'), 
----																	   (SELECT genre_id FROM genre WHERE genre_name='Роман')), 
----												     ('Война и мир',   
----																	   (SELECT author_id FROM author WHERE author_name='Толстой Л.Н.'), 
----																	   (SELECT genre_id FROM genre WHERE genre_name='Роман-эпопея')),
----													 ('Философия DevOps',
----																	   (SELECT author_id FROM author WHERE author_name='Девис Дженнифер'), 
----																	   (SELECT genre_id FROM genre WHERE genre_name='Компьютерная литература')),
----													 ('Стихи детям',
----																	   (SELECT author_id FROM author WHERE author_name='Барто А.Л.'), 
----																	   (SELECT genre_id FROM genre WHERE genre_name='Стихотворения'));;

----INSERT INTO book_edition (book_id, publishing_id, edition_number, amount, date_of_arrival, department_id) VALUES 
----								((SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), 
----									(SELECT publishing_id FROM publishing WHERE publishing_name = 'Азбука'), 1, 10, '2021-09-21', 
----									(SELECT department_id FROM department WHERE department_name = 'Художественная литература')),
----								((SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), 
----									(SELECT publishing_id FROM publishing WHERE publishing_name = 'Эксмо'), 1, 20, '2021-09-11', 
----									(SELECT department_id FROM department WHERE department_name = 'Художественная литература')),
----								((SELECT book_id FROM book WHERE title = 'Философия DevOps'),   
----									(SELECT publishing_id FROM publishing WHERE publishing_name = 'Питер'), 2, 5, '2021-09-27', 
----									(SELECT department_id FROM department WHERE department_name = 'Компьютерная литература')),
----								((SELECT book_id FROM book WHERE title = 'Стихи детям'),   
----									(SELECT publishing_id FROM publishing WHERE publishing_name = 'Эксмо'), 2, 15, '2021-08-15', 
----									(SELECT department_id FROM department WHERE department_name = 'Детская литература'));;

----INSERT INTO decom_book (book_id, book_edition_id, decom_date) VALUES 
----								((SELECT book_id FROM book WHERE title = 'Мастер и Маргарита'), 
----									(SELECT book_edition_id FROM book_edition WHERE publishing_id = 
----										(SELECT publishing_id FROM publishing WHERE publishing_name = 'Азбука')), '2021-09-20');

----INSERT INTO reader (reader_name, reader_phone, reader_address, work, position, date_of_birth) VALUES 
----											('Иванов И.И.', '+78985679252', 'ул.Гоголя д.50 кв.10', '000 Макдональдс', 'Продавец', '2000-09-21'),
----											('Пупкин В.В.', '+78985645245', 'ул.Лермонтова д.10 кв.1', '000 Батник', 'Программист', '1998-10-05');

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

--INSERT INTO fine_status (status_name) VALUES ('Оплачен'), 
--											 ('Не оплачен'), 
--											 ('Просрочен'); 

INSERT INTO fine (date_of_fine, end_of_fine, summ, reader_id, status_id) VALUES 
									('2021-09-08', '2021-09-22', 100, 
										(SELECT reader_id FROM reader WHERE reader_name = 'Иванов И.И.'), 
										(SELECT status_id FROM fine_status WHERE status_name = 'Просрочен'));

INSERT INTO expired_book (issued_book_id, fine_id) VALUES 
									((SELECT issued_book_id FROM issued_book WHERE book_id = 
										(SELECT book_id FROM book WHERE title = 'Мастер и Маргарита')), 1);

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