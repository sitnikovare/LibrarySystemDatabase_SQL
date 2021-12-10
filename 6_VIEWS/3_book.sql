USE LibrarySystem;

SELECT dbo.author.author_name, dbo.book.title, dbo.book_edition.edition_number, dbo.book_edition.amount, dbo.genre.genre_name, dbo.publishing.publishing_name
FROM     dbo.author INNER JOIN
                  dbo.book ON dbo.author.author_id = dbo.book.author_id INNER JOIN
                  dbo.book_edition ON dbo.book.book_id = dbo.book_edition.book_id INNER JOIN
                  dbo.genre ON dbo.book.genre_id = dbo.genre.genre_id INNER JOIN
                  dbo.publishing ON dbo.book_edition.publishing_id = dbo.publishing.publishing_id

--EXEC sp_helptext 'View3_book'

--SET NUMERIC_ROUNDABORT OFF
--SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, 
--ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
--GO

--GO
--CREATE VIEW dbo.View3_book_INDEX
--WITH SCHEMABINDING
--AS  
--SELECT dbo.book_edition.book_edition_id, dbo.author.author_name, dbo.book.title, dbo.book_edition.edition_number, 
--	   dbo.book_edition.amount, dbo.genre.genre_name, dbo.publishing.publishing_name  
--FROM     dbo.author INNER JOIN  
--                  dbo.book ON dbo.author.author_id = dbo.book.author_id INNER JOIN  
--                  dbo.book_edition ON dbo.book.book_id = dbo.book_edition.book_id INNER JOIN  
--                  dbo.genre ON dbo.book.genre_id = dbo.genre.genre_id INNER JOIN  
--                  dbo.publishing ON dbo.book_edition.publishing_id = dbo.publishing.publishing_id  

--CREATE UNIQUE CLUSTERED INDEX view3index
--ON dbo.View3_book_INDEX (book_edition_id)

SELECT * FROM dbo.View3_book_INDEX WITH(NOEXPAND);

SELECT dbo.book_edition.book_edition_id, dbo.author.author_name, dbo.book.title, dbo.book_edition.edition_number, 
	   dbo.book_edition.amount, dbo.genre.genre_name, dbo.publishing.publishing_name  
FROM     dbo.author INNER JOIN  
                  dbo.book ON dbo.author.author_id = dbo.book.author_id INNER JOIN  
                  dbo.book_edition ON dbo.book.book_id = dbo.book_edition.book_id INNER JOIN  
                  dbo.genre ON dbo.book.genre_id = dbo.genre.genre_id INNER JOIN  
                  dbo.publishing ON dbo.book_edition.publishing_id = dbo.publishing.publishing_id  
