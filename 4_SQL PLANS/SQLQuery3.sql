USE LibrarySystem_NOINDEXES;

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
--INSERT INTO department (department_name) VALUES ('Архив'), 
--												('Наука'), 
--												('Журналы'), 
--												('Детская литература'), 
--												('Художественная литература'), 
--												('Нон-фикшен'),
--												('Учебная литература'),
--												('Компьютерная литература');

--INSERT INTO fine_status (status_name) VALUES ('Оплачен'), 
--											 ('Не оплачен'), 
--											 ('Просрочен'); 

SELECT COUNT(department_id) AS "dep" FROM department;
SELECT COUNT(author_id) AS "author" FROM author;
SELECT COUNT(genre_id) AS "gen" FROM genre;
SELECT COUNT(publishing_id) AS "publ" FROM publishing;
SELECT COUNT(book_id) AS "book" FROM book;
SELECT COUNT(book_edition_id) AS "book_ed" FROM book_edition; --8
SELECT COUNT(decom_book_id) AS "dec_book" FROM decom_book; --8
SELECT COUNT(reader_id) AS "reader" FROM reader;
SELECT COUNT(issued_book_id) AS "iss_b" FROM issued_book;
SELECT COUNT(expired_book_id) AS "exp_b" FROM expired_book;
SELECT COUNT(status_id) AS "status" FROM fine_status;
SELECT COUNT(fine_id) AS "fine" FROM fine;
