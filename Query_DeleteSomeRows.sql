USE LibrarySystem;

DELETE FROM department WHERE department_name = '�������';
DELETE FROM book WHERE author_id = (SELECT author_id FROM author WHERE author_name = '�������� �.�.');
DELETE FROM publishing WHERE publishing_name = '������';
DELETE FROM author WHERE author_name = '������� �.�.';
DELETE FROM genre WHERE genre_name = '������������ ����������';
DELETE FROM reader WHERE reader_name = '������ �.�.';
DELETE FROM issued_book WHERE book_id = (SELECT book_id FROM book WHERE title = '���������  DevOps'); 

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