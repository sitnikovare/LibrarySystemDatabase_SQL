USE LibrarySystem;

DELETE FROM department WHERE department_name = 'Журналы';
DELETE FROM book WHERE author_id = (SELECT author_id FROM author WHERE author_name = 'Булгаков М.А.');
DELETE FROM publishing WHERE publishing_name = 'Азбука';
DELETE FROM author WHERE author_name = 'Толстой Л.Н.';
DELETE FROM genre WHERE genre_name = 'Компьютерная литература';
DELETE FROM reader WHERE reader_name = 'Иванов И.И.';
DELETE FROM issued_book WHERE book_id = (SELECT book_id FROM book WHERE title = 'Философия  DevOps'); 

SELECT * FROM department;
SELECT * FROM author;
SELECT * FROM genre;
SELECT * FROM publishing;
SELECT * FROM book;
SELECT * FROM book_edition;
SELECT * FROM decom_book;
SELECT * FROM reader;
SELECT * FROM issued_book;
SELECT * FROM expired_book;
SELECT * FROM fine_status;
SELECT * FROM fine;