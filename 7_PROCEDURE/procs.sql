USE LibrarySystem;

--GO ---------------- Подсчет всех имеющихся книг в системе -----------------
--CREATE PROCEDURE Count_All_Books AS
--SELECT COUNT(book_edition_id) FROM book_edition


--GO ---------------- Количество различных книг в наличии ---------------------------------------
--CREATE PROCEDURE Count_Available_Books AS
--SELECT COUNT(book_edition_id) FROM book_edition
--WHERE amount > 0


--GO ---------------- Количество заказов ------------------------------------------------
--CREATE PROCEDURE Count_Issued_Books AS
--SELECT COUNT(issued_book_id) FROM issued_book
--WHERE amount > 0

---  КОЛИЧЕСТВО КНИГ КОНКРЕТНОГО ИЗДАТЕЛЬСТВА ----------------------------------------------------------------------
--GO --------------- Наличие издательства в системе, возвращает id ----------------------
--CREATE PROCEDURE Exists_Publishing @Publish_name AS CHAR(50), @id AS INT OUTPUT
--AS
--IF (SELECT COUNT(*) FROM publishing WHERE publishing_name = @Publish_name) > 0
--SET @id = (SELECT publishing_id FROM publishing WHERE publishing_name = @Publish_name)
--ELSE 
--	BEGIN
--		SET @id = -1
--		PRINT ('Данного издательства в системе нет.')
--	END

--GO ---------------- Подсчет книг конкретного издательства -----------------------------
--CREATE PROCEDURE Count_Books_From_Publishing @Publish_name AS CHAR(50), @amount AS INT OUTPUT
--AS
--DECLARE @publ_id AS INT
--EXEC Exists_Publishing @Publish_name, @publ_id OUTPUT;
--IF @publ_id > -1 
--SET @amount =	(SELECT COUNT(book_edition_id) FROM book_edition
--					INNER JOIN publishing ON book_edition.publishing_id = publishing.publishing_id
--					WHERE publishing_name = @Publish_name)
--ELSE SET @amount = -1
--------------------------------------------------------------------------------------------------------------
--DECLARE @out INT
--EXEC dbo.Count_Books_From_Publishing 'Азбуккка', @out OUTPUT
--PRINT @out

--EXEC dbo.Count_Books_From_Publishing 'Эксмо', @out OUTPUT
--PRINT @out
-----------------------------------------------------------------------------------------------------------------


---  КОЛИЧЕСТВО КНИГ КОНКРЕТНОГО АВТОРА ----------------------------------------------------------------------
--GO ---------------- Подсчет книг конкретного издательства -----------------------------
--CREATE PROCEDURE Count_Books_By_Author @Author_name AS CHAR(50), @amount AS INT OUTPUT
--AS
--DECLARE @auth_id AS INT
--BEGIN
--	IF (SELECT COUNT(*) FROM author WHERE author_name = @Author_name) > 0
--	BEGIN
--		SET @amount =	(SELECT COUNT(book_edition_id) FROM book_edition
--							INNER JOIN book ON book_edition.book_id = book.book_id
--							INNER JOIN author ON author.author_id = book.author_id
--							WHERE author_name = @Author_name)
--	END
--	ELSE 
--		BEGIN
--			PRINT ('Данного автора в системе нет.')
--			RETURN -1
--		END
--END
--------------------------------------------------------------------------------------------------------------------4
--DROP PROCEDURE Count_Books_By_Author
----------------------------------------------------------------------------

--DECLARE @out INT
--EXEC Count_Books_By_Author 'Булгаков М.А.', @out OUTPUT
--PRINT @out

--DECLARE @out INT
--EXEC Count_Books_By_Author 'Вася Пупкин', @out OUTPUT
--PRINT @out
-----------------------------------------------------------------------------------------------------------------

--GO --------------- Вывод заказов конкретного читателя -------------------------
--CREATE PROCEDURE Issues_By_Reader @Reader_id AS INT
--AS
--	SELECT book.title AS 'Название', 
--		   author.author_name AS 'Автор', 
--		   book_edition.book_edition_id AS 'ID издания', 
--		   issued_book.date_of_issue AS 'Дата заказа',
--		   issued_book.end_of_issue AS 'Дата возврата'
--	FROM book INNER JOIN author ON book.author_id = author.author_id
--			  INNER JOIN book_edition ON book.book_id = book_edition.book_id
--			  INNER JOIN issued_book ON issued_book.book_edition_id = book_edition.book_edition_id
--			  INNER JOIN reader ON issued_book.reader_id = reader.reader_id
--	WHERE reader.reader_id = @Reader_id
--------------------------------------------------------------------------------
--DROP PROCEDURE Issues_By_Reader
--SELECT reader_id FROM reader WHERE reader_name = 'Иванов И.И.' 
--EXEC Issues_By_Reader 26
-----------------------------------------------------------------------------------

--GO --------------- Вывод даты окончания заказа конкретного заказа -------------------------
--CREATE PROCEDURE End_Of_Issue_By_ID @Iss_id AS INT, @enddate AS DATE OUTPUT
--AS
--	SET @enddate = (SELECT issued_book.end_of_issue
--					FROM issued_book
--					WHERE issued_book.issued_book_id = @Iss_id)

--DROP PROCEDURE End_Of_Issue_By_ID

--DECLARE @end AS DATE
--EXEC End_Of_Issue_By_ID 18, @end OUTPUT
--PRINT @end


--GO --------------- Вывод id заказов конкретного читателя -------------------------
--CREATE PROCEDURE Issues_ID_By_Reader @Reader_id AS INT
--AS
--	SELECT issued_book_id
--	FROM book INNER JOIN author ON book.author_id = author.author_id
--			  INNER JOIN book_edition ON book.book_id = book_edition.book_id
--			  INNER JOIN issued_book ON issued_book.book_edition_id = book_edition.book_edition_id
--			  INNER JOIN reader ON issued_book.reader_id = reader.reader_id
--	WHERE reader.reader_id = @Reader_id

--GO ------------------ Возвращает 1, если заказ просрочен, иначе 0 -------------------
--CREATE PROCEDURE Is_Overdue_Issue @Iss_id AS INT, @res AS INT OUTPUT
--AS
--	IF (SELECT COUNT(expired_book.expired_book_id)
--		FROM expired_book WHERE issued_book_id = @Iss_id) > 0
--			SET @res = 1
--	ELSE
--		SET @res = 0

-------------------------------------------
--SELECT COUNT (issued_book_id)
--						FROM book INNER JOIN author ON book.author_id = author.author_id
--							      INNER JOIN book_edition ON book_edition.book_id = book.book_id
--								  INNER JOIN issued_book ON issued_book.book_edition_id = book_edition.book_edition_id
--								  INNER JOIN reader ON issued_book.reader_id = reader.reader_id
--						WHERE reader.reader_id = 26
--SELECT MIN(issued_book_id) FROM issued_book
--SELECT * FROM issued_book
--SELECT * FROM expired_book
--SELECT COUNT(expired_book_id) FROM expired_book WHERE issued_book_id = 18
--SELECT COUNT(expired_book_id) FROM expired_book WHERE issued_book_id = 52
-------------------

--GO ---------------- Вывести ID просроченных заказов конкретного читателя -------
--CREATE PROCEDURE Overdue_Issues_By_Reader @Reader_id AS INT
--AS
--	DECLARE @countIssues INT
--	SET @countIssues = (SELECT COUNT (issued_book_id)
--						FROM book INNER JOIN author ON book.author_id = author.author_id
--							      INNER JOIN book_edition ON book_edition.book_id = book.book_id
--								  INNER JOIN issued_book ON issued_book.book_edition_id = book_edition.book_edition_id
--								  INNER JOIN reader ON issued_book.reader_id = reader.reader_id
--						WHERE reader.reader_id = @Reader_id)
--	DECLARE @i INT
--	SET @i = (SELECT MIN(issued_book_id) FROM issued_book)

--	DECLARE @cred INT
--	SET @cred = 1
--	WHILE @countIssues >= @cred
--	BEGIN
--		IF (SELECT reader_id FROM issued_book WHERE issued_book_id = @i) 
--			= @Reader_id
--			BEGIN
--				IF (SELECT COUNT(expired_book_id) FROM expired_book WHERE issued_book_id = @i) > 0
--				BEGIN
--					PRINT @i
--				END
--				SET @cred = @cred + 1
--				SET @i = @i + 1
--			END
--		ELSE
--			SET @i = @i + 1
--	END

--EXEC Overdue_Issues_By_Reader 26


--DROP PROCEDURE Overdue_Issues_By_Reader



--GO -------------------- Получение информации о заказах, штрафы на которые удовлетворяют статусу ---------------
--CREATE PROCEDURE Info_About_Expired_Fines @afterDate AS DATE, @statusName AS CHAR(20)
--AS
--	DECLARE @i INT
--	DECLARE idExpFine CURSOR FOR
--		SELECT issued_book.issued_book_id FROM fine 
--				INNER JOIN fine_status ON fine.status_id = fine_status.status_id
--				INNER JOIN expired_book ON expired_book.fine_id = fine.fine_id
--				INNER JOIN issued_book ON issued_book.issued_book_id = expired_book.issued_book_id
--		WHERE status_name = @statusName AND issued_book.date_of_issue > @afterDate

--		OPEN idExpFine
--		FETCH NEXT FROM idExpFine INTO @i
--		WHILE @@FETCH_STATUS = 0
--		BEGIN
--			PRINT @i
--			FETCH NEXT FROM idExpFine INTO @i
--		END
--		CLOSE idExpFine
--		DEALLOCATE idExpFine


--DELETE FROM expired_book WHERE fine_id = 1
--INSERT INTO expired_book (issued_book_id, fine_id) VALUES (18, 20)

--SELECT * FROM issued_book INNER JOIN expired_book ON expired_book.issued_book_id = issued_book.issued_book_id
--						  INNER JOIN fine ON fine.fine_id = expired_book.fine_id

--INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue)
--	VALUES (42, 39, 15, 26, '2021-08-15')
--INSERT INTO issued_book (book_id, book_edition_id, amount, reader_id, date_of_issue)
--	VALUES (42, 39, 15, 26, '2021-08-15')

--INSERT INTO fine (date_of_fine, end_of_fine, summ, reader_id, status_id)
--	VALUES ('2021-10-27', '2021-11-01', 10, 26, 44)
--INSERT INTO fine (date_of_fine, end_of_fine, summ, reader_id, status_id)
--	VALUES ('2021-10-27', '2021-11-01', 10, 26, 45)

--INSERT INTO expired_book (issued_book_id, fine_id)
--	VALUES (74, 30)
--INSERT INTO expired_book (issued_book_id, fine_id)
--	VALUES (75, 31)

--SELECT * FROM expired_book
--SELECT * FROM fine
--SELECT * FROM issued_book
--SELECT * FROM fine_status


--DROP PROCEDURE Info_About_Expired_Fines

--EXEC Info_About_Expired_Fines '2020-08-01', 'Просрочен'

--SELECT * FROM fine INNER JOIN fine_status ON fine.status_id = fine_status.status_id
--				   INNER JOIN expired_book ON expired_book.fine_id = fine.fine_id
--				   INNER JOIN issued_book ON expired_book.issued_book_id = issued_book.issued_book_id