USE [LibrarySystem]
GO
/****** Object:  Trigger [dbo].[TGU_genreDelete]    Script Date: 10.12.2021 9:30:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[TGU_genreDelete]
ON [dbo].[genre]
INSTEAD OF DELETE
AS
BEGIN
	IF (SELECT COUNT(book_id) FROM dbo.book WHERE genre_id = (SELECT genre_id FROM deleted)) > 0
	BEGIN
		ROLLBACK TRAN
		RAISERROR('Ошибка: попытка удалить жанр, к которому принадлежат книги',0,1) WITH NOWAIT
	END
END

--SELECT * FROM dbo.department;
--SELECT * FROM dbo.book_edition WHERE department_id = (SELECT department_id FROM dbo.department WHERE department_name = 'Компьютерная литература')
--DELETE FROM dbo.department WHERE department_name = 'Компьютерная литература'