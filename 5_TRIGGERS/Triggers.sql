USE LibrarySystem;

-------------------------------------------------AFTER INSERT fine--------------------------------------------
--������� ���� end_of_fine + 14 ����

--GO
--CREATE TRIGGER TGI_fine
--ON fine 
--AFTER INSERT
--AS
--UPDATE dbo.fine
--SET end_of_fine = DATEADD(DAY, 14, (SELECT date_of_fine FROM Inserted))
--WHERE fine_id = (SELECT fine_id FROM Inserted)

--GO
--SELECT * FROM fine;
--INSERT INTO fine (date_of_fine, summ, reader_id, status_id) VALUES ('2021-09-10', 10, 26, 44);
--SELECT * FROM fine;


-------------------------------------------------AFTER INSERT issue_book--------------------------------------------
--������� ���� end_of_issue + 14 ����

--GO
--CREATE TRIGGER TGI_issued
--ON issued_book 
--AFTER INSERT
--AS
--UPDATE dbo.issued_book
--SET end_of_issue = DATEADD(DAY, 14, (SELECT date_of_issue FROM Inserted))
--WHERE issued_book_id = (SELECT issued_book_id FROM Inserted)

--GO
--SELECT * FROM issued_book;
--INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue) 
--			VALUES (42, 38, 7, 26, '2021-10-26');
--SELECT * FROM issued_book;


----------------------------------------------------FOR INSERT book_edition--------------------------------------------
--������ ��������� �� ������, ���� ��������� ���������� ���������� ����

--GO
--CREATE TRIGGER TGU_bookEditionAmount_subRollback
--ON dbo.issued_book
--FOR INSERT
--AS
--BEGIN
--	IF ((SELECT amount FROM dbo.book_edition WHERE book_edition_id = (SELECT book_edition_id FROM inserted)) - (SELECT amount FROM inserted)) < 0
--	BEGIN
--		ROLLBACK TRAN
--		RAISERROR('������: ��������� ���������� ���������� ����',0,1) WITH NOWAIT
--	END
--END

--DROP TRIGGER TGU_bookEditionAmount_subRollback

--SELECT * FROM dbo.book_edition;
--SELECT * FROM dbo.issued_book;
--INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue) 
--			VALUES (45, 41, 5, 26, '2021-10-26');
--INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue) 
--			VALUES (45, 41, 100, 26, '2021-10-26');
--SELECT * FROM dbo.book_edition;
--SELECT * FROM dbo.issued_book;

-------------------------------------------------INSTEAD OF INSERT book_edition ��������������--------------------------------------------
--��������� ���������� ����

--GO
--CREATE TRIGGER TGU_bookEditionAmount
--ON dbo.issued_book
--INSTEAD OF INSERT
--AS
--BEGIN
--	IF ((SELECT amount FROM dbo.book_edition WHERE book_edition_id = (SELECT book_edition_id FROM inserted)) - (SELECT amount FROM inserted)) > 0
--	BEGIN
--		INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue)
--			VALUES ((SELECT book_id FROM inserted), 
--					(SELECT book_edition_id FROM inserted), 
--					(SELECT amount FROM inserted), 
--					(SELECT reader_id FROM inserted), 
--					(SELECT date_of_issue FROM inserted)) 
--		UPDATE dbo.book_edition
--		SET amount = amount - (SELECT amount FROM inserted)
--		WHERE book_edition_id = (SELECT book_edition_id FROM inserted)
--	END
--	ELSE
--		BEGIN
--			INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue)
--			VALUES ((SELECT book_id FROM inserted), 
--					(SELECT book_edition_id FROM inserted), 
--					(SELECT amount FROM dbo.book_edition WHERE book_edition_id = (SELECT book_edition_id FROM inserted)) - 1, 
--					(SELECT reader_id FROM inserted), 
--					(SELECT date_of_issue FROM inserted)) 
--			UPDATE dbo.book_edition
--			SET amount = 1
--			WHERE book_edition_id = (SELECT book_edition_id FROM inserted)
--		END
--END

--DROP TRIGGER TGU_bookEditionAmount_subRollback

--SELECT * FROM dbo.book_edition;
--SELECT * FROM dbo.issued_book;
----INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue) 
----			VALUES (45, 41, 5, 26, '2021-10-26');
--INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue) 
--			VALUES (45, 41, 7, 26, '2021-10-26');
--SELECT * FROM dbo.book_edition;
--SELECT * FROM dbo.issued_book;

-------------------------------------------------AFTER UPDATE fine------------------------------------------------------------
--��������� 20% � ����� ������, ���� ������ ������ ��������� �� "���������"

--GO
--CREATE TRIGGER TGU_fineSum
--ON dbo.fine
--AFTER UPDATE
--AS
--BEGIN
--	IF (SELECT status_name FROM fine_status WHERE status_id = (SELECT status_id FROM inserted)) = '���������'
--	BEGIN
--		UPDATE dbo.fine
--		SET summ = 1.2 * (SELECT summ FROM inserted)
--		WHERE fine_id = (SELECT fine_id FROM inserted)
--	END
--END

--DROP TRIGGER TGU_fineSum

--SELECT * FROM dbo.fine;
--SELECT status_id, status_name FROM dbo.fine_status WHERE status_name = '���������';
--UPDATE dbo.fine SET status_id = (SELECT status_id FROM dbo.fine_status WHERE status_name = '���������')
--						WHERE fine_id = 29;
--SELECT * FROM fine;


-------------------------------------------------INSTEAD OF UPDATE decom book ��������������------------------------------------------------------
--������ ��������� �������� ������� ������� ����� ����������� � �������������� id �� �����

--GO
--CREATE TRIGGER TGU_departmentName
--ON dbo.department
--INSTEAD OF UPDATE
--AS
--BEGIN
--	INSERT INTO dbo.department (department_name) VALUES ((SELECT department_name FROM inserted))
--	UPDATE dbo.book_edition
--	SET department_id = (SELECT department_id FROM dbo.department WHERE department_name = (SELECT department_name FROM inserted))
--	WHERE department_id = (SELECT department_id FROM inserted)
--END

--SELECT * FROM dbo.department;
--SELECT * FROM dbo.book_edition WHERE book_id = (SELECT book_id FROM book WHERE title = '������ � ���������')
--UPDATE dbo.department SET department_name = '����� �����������' WHERE department_id = 119
--SELECT * FROM dbo.department;
--SELECT * FROM dbo.book_edition WHERE book_id = (SELECT book_id FROM book WHERE title = '������ � ���������')


-------------------------------------------------INSTEAD OF delete-------------------------------------------------------
--������ �������� ������������ ������ ������, ���� ���������� �����, ������� ��� �����������

--GO
--CREATE TRIGGER TGU_departmentDelete
--ON dbo.department
--INSTEAD OF DELETE
--AS
--BEGIN
--	IF (SELECT COUNT(book_id) FROM dbo.book_edition WHERE department_id = (SELECT department_id FROM deleted)) > 0
--	BEGIN
--		ROLLBACK TRAN
--		RAISERROR('������: ������� ������� ������, � �������� ����������� �����',0,1) WITH NOWAIT
--	END
--END

--SELECT * FROM dbo.department;
----SELECT * FROM dbo.book_edition WHERE department_id = (SELECT department_id FROM dbo.department WHERE department_name = '������������ ����������')
--DELETE FROM dbo.department WHERE department_id = 119


-------------------------------------------------INSTEAD OF delete-------------------------------------------------------
--������ �������� ����� ������ ������, ���� ���������� �����, ������� ��� �����������

--GO
--CREATE TRIGGER TGU_genreDelete
--ON dbo.genre
--INSTEAD OF DELETE
--AS
--BEGIN
--	IF (SELECT COUNT(book_id) FROM dbo.book WHERE genre_id = (SELECT genre_id FROM deleted)) > 0
--	BEGIN
--		ROLLBACK TRAN
--		RAISERROR('������: ������� ������� ����, � �������� ����������� �����',0,1) WITH NOWAIT
--	END
--END

--SELECT * FROM dbo.genre;
--SELECT * FROM dbo.book WHERE genre_id = (SELECT genre_id FROM dbo.genre WHERE genre_name = '������������ ����������')
--DELETE FROM dbo.genre WHERE genre_name = '������������ ����������'

-----------------------------------------------------FOR delete-------------------------------------------------------
--�������� ���������� ������� ��� ������ � ��� (��������, ��� ��������, ������ ���� �� ������ ��� �����)

--CREATE TABLE [recovered_book] (
--  [recovered_book_id] INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
--  [issued_book_id]	INT NOT NULL FOREIGN KEY REFERENCES issued_book(issued_book_id),
--  [reader_id] INT NOT NULL FOREIGN KEY REFERENCES reader(reader_id)
--);

--INSERT INTO reader (reader_name, reader_phone, reader_address, work, position, date_of_birth) VALUES 
--					('������ �.�.', '+78985695252', '��.������ �.52 ��.10', '000 OOOA', '���.��������', '1970-09-11');
--INSERT INTO dbo.issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue)
--	VALUES (   44, 40, 1, (SELECT reader_id FROM reader WHERE reader_name = '������ �.�.'), '2021-10-25')
--INSERT INTO recovered_book (issued_book_id, reader_id)	
--		VALUES ((SELECT issued_book_id FROM dbo.issued_book 
--					WHERE reader_id = (SELECT reader_id FROM reader WHERE reader_name = '������ �.�.')), 
--										(SELECT reader_id FROM reader WHERE reader_name = '������ �.�.'))

--GO
--CREATE TRIGGER TGD_readerDelete
--ON dbo.reader
--INSTEAD OF DELETE
--AS
--BEGIN
--	IF (SELECT COUNT(issued_book_id) FROM dbo.issued_book WHERE reader_id = (SELECT reader_id FROM deleted))
--		= (SELECT COUNT(issued_book_id) FROM recovered_book WHERE reader_id = (SELECT reader_id FROM deleted))
--	BEGIN
--		DELETE FROM recovered_book WHERE reader_id = (SELECT reader_id FROM deleted)
--		DELETE FROM issued_book WHERE reader_id = (SELECT reader_id FROM deleted)
--		DELETE FROM fine WHERE reader_id = (SELECT reader_id FROM deleted)
--		DELETE FROM reader WHERE reader_id = (SELECT reader_id FROM deleted)
--	END
--	ELSE
--		ROLLBACK TRAN
--		RAISERROR('������: �������� ������ �� ��� �����',0,1) WITH NOWAIT
--END

--DROP TRIGGER TGD_readerDelete

SELECT * FROM reader 
--		INNER JOIN dbo.issued_book ON issued_book.reader_id = reader.reader_id
--		INNER JOIN recovered_book ON recovered_book.reader_id = reader.reader_id
--	WHERE reader_name = '������ �.�.';
----SELECT * FROM reader 
DELETE FROM dbo.reader WHERE reader_name = '������ �.�.'
----SELECT * FROM reader 
----		INNER JOIN dbo.issued_book ON issued_book.reader_id = reader.reader_id
----		INNER JOIN recovered_book ON recovered_book.reader_id = reader.reader_id
------	WHERE reader_name = '������ �.�.';
SELECT * FROM reader;
--SELECT * FROM dbo.issued_book;
--SELECT * FROM recovered_book;