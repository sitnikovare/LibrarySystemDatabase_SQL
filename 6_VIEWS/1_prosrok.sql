--SELECT dbo.fine_status.status_name, dbo.fine.*, dbo.issued_book.issued_book_id AS Expr4, dbo.fine.date_of_fine AS Expr1, 
--	   dbo.book.title, dbo.reader.reader_name, dbo.fine.summ AS Expr2, dbo.issued_book.date_of_issue
--FROM     dbo.fine INNER JOIN
--                  dbo.fine_status ON dbo.fine.status_id = dbo.fine_status.status_id INNER JOIN
--                  dbo.reader ON dbo.fine.reader_id = dbo.reader.reader_id INNER JOIN
--                  dbo.issued_book ON dbo.reader.reader_id = dbo.issued_book.reader_id INNER JOIN
--                  dbo.book ON dbo.issued_book.book_id = dbo.book.book_id
--WHERE  (dbo.fine_status.status_name = 'Просрочен')


--EXEC sp_helptext 'View1_prosrok'
EXEC sp_helptext 'View1_prosrok_ENCP'
--GO

--CREATE VIEW dbo.[1_prosrok_ENCP]
--WITH ENCRYPTION
--AS  
--SELECT dbo.fine_status.status_name, dbo.fine.*, dbo.issued_book.issued_book_id AS Expr4, dbo.fine.date_of_fine AS Expr1, 
--	   dbo.book.title, dbo.reader.reader_name, dbo.fine.summ AS Expr2, dbo.issued_book.date_of_issue  
--FROM     dbo.fine INNER JOIN  
--                  dbo.fine_status ON dbo.fine.status_id = dbo.fine_status.status_id INNER JOIN  
--                  dbo.reader ON dbo.fine.reader_id = dbo.reader.reader_id INNER JOIN  
--                  dbo.issued_book ON dbo.reader.reader_id = dbo.issued_book.reader_id INNER JOIN  
--                  dbo.book ON dbo.issued_book.book_id = dbo.book.book_id  
--WHERE  (dbo.fine_status.status_name = 'Просрочен')  
