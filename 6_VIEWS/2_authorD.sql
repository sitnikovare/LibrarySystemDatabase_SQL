USE LibrarySystem;
--SELECT author_name, author_id
--FROM     dbo.author
--WHERE  (author_name LIKE '�%')

--EXEC sp_helptext '2_auhorD'
--GO
--CREATE VIEW dbo.[View2_auhorD_CHECK]  
--AS  
--SELECT author_name, author_id  
--FROM     dbo.author  
--WHERE  (author_name LIKE '�%')  
--WITH CHECK OPTION

--EXEC sp_helptext '2_auhorD_CHECK'

--DELETE FROM dbo.author WHERE author_name = '����������� �.�.'

--SELECT * FROM dbo.author
--INSERT INTO View2_auhorD_CHECK (author_name) VALUES ('����������� �.�.')
--SELECT * FROM dbo.author

SELECT * FROM dbo.author
INSERT INTO View2_auhorD_CHECK (author_name) VALUES ('������ �.�.')
SELECT * FROM dbo.author

