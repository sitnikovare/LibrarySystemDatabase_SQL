USE LibrarySystem;

DELETE FROM book;
DELETE FROM department;
DELETE FROM author;
DELETE FROM genre;
DELETE FROM publishing;
DELETE FROM book_edition;
DELETE FROM decom_book;
DELETE FROM reader;
DELETE FROM issued_book;
DELETE FROM expired_book;
DELETE FROM fine;
DELETE FROM fine_status;

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
