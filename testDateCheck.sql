USE LibrarySystem;

SELECT DATEDIFF(year, GETDATE(), '2000-09-21')

/*
CREATE TABLE [TESTreader] (
  [reader_id] INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [reader_name] VARCHAR(50) NOT NULL,
  [reader_phone] VARCHAR(12) NOT NULL,
  [reader_address] VARCHAR(80) NOT NULL,
  [work] VARCHAR(80),
  [position] VARCHAR(50),
  [date_of_birth] DATE CHECK (DATEDIFF(year, date_of_birth, GETDATE()) >= 7 AND date_of_birth <= GETDATE())
);


INSERT INTO TESTreader (reader_name, 
						reader_phone, 
						reader_address, 
						work, position, 
						date_of_birth) VALUES ('Иванов И.И.', 
											   '+78985679252', 
											   'ул.Гоголя д.50 кв.10', 
											   '000 Макдональдс', 
											   'Продавец', 
											   '2000-09-21');

SELECT * FROM TESTreader;
*/
