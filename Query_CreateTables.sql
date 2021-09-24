USE [LibrarySystem];

CREATE TABLE [publishing] (
  [publishing_id]	INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [publishing_name] VARCHAR(50) NOT NULL,
  [address]			VARCHAR(80) NOT NULL,
);

CREATE TABLE [genre] (
  [genre_id]		INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [genre_name]		VARCHAR(50) NOT NULL
);

CREATE TABLE [department] (
  [department_id]	INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [department_name] VARCHAR(30) NOT NULL
);

CREATE TABLE [author] (
  [author_id]		INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [author_name]		VARCHAR(50) NOT NULL
);

CREATE TABLE [book] (
  [book_id]			INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [title]			VARCHAR(80) NOT NULL,
  [author_id]		INT NOT NULL FOREIGN KEY REFERENCES author(author_id)		  ON UPDATE CASCADE ON DELETE CASCADE,
  [genre_id]		INT NOT NULL FOREIGN KEY REFERENCES genre(genre_id)			  ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE [book_edition] (
  [book_edition_id] INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [book_id]			INT NOT NULL FOREIGN KEY REFERENCES book(book_id)			  ON UPDATE CASCADE ON DELETE CASCADE,
  [publishing_id]	INT NOT NULL FOREIGN KEY REFERENCES publishing(publishing_id) ON UPDATE CASCADE ON DELETE CASCADE,
  [edition_number]	INT NOT NULL,
  [amount]			INT			 CHECK (amount > 0),
  [date_of_arrival] DATE		 CHECK (date_of_arrival <= GETDATE()),
  [department_id]	INT NOT NULL FOREIGN KEY REFERENCES department(department_id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE [reader] (
  [reader_id]		INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [reader_name]		VARCHAR(50) NOT NULL,
  [reader_phone]	VARCHAR(12) NOT NULL,
  [reader_address]	VARCHAR(80) NOT NULL,
  [work]			VARCHAR(80),
  [position]		VARCHAR(50),
  [date_of_birth]	DATE CHECK (DATEDIFF(YEAR, date_of_birth, GETDATE()) >= 7 AND date_of_birth <= GETDATE())
);


CREATE TABLE [issued_book] (
  [issued_book_id]	INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [book_id]			INT NOT NULL FOREIGN KEY REFERENCES book(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
  [book_edition_id] INT NOT NULL FOREIGN KEY REFERENCES book_edition(book_edition_id) ON UPDATE NO ACTION ON DELETE NO ACTION,
  [amount]			INT CHECK (amount > 0),
  [reader_id]		INT NOT NULL FOREIGN KEY REFERENCES reader(reader_id) ON UPDATE CASCADE ON DELETE CASCADE,
  [date_of_issue]	DATE CHECK (date_of_issue <= GETDATE()),
  [end_of_issue]	DATE
);

CREATE TABLE [expired_book] (
  [expired_book_id] INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [issued_book_id]	INT NOT NULL FOREIGN KEY REFERENCES issued_book(issued_book_id) ON UPDATE CASCADE ON DELETE CASCADE,
  [fine_id]			INT NOT NULL
);


CREATE TABLE [fine_status] (
  [status_id]		INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [status_name]		VARCHAR(20) NOT NULL
);


CREATE TABLE [decom_book] (
  [decom_book_id]	INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [book_id]			INT NOT NULL,
  [book_edition_id] INT NOT NULL FOREIGN KEY REFERENCES book_edition(book_edition_id) ON UPDATE CASCADE ON DELETE CASCADE,
  [decom_date]		DATE NOT NULL
);

CREATE TABLE [fine] (
  [fine_id]			INT iDENTITY (1, 1) NOT NULL PRIMARY KEY,
  [date_of_fine]	DATE CHECK (date_of_fine <= GETDATE()),
  [end_of_fine]		DATE,
  [summ]			FLOAT CHECK (summ > 0),
  [reader_id]		INT NOT NULL FOREIGN KEY REFERENCES reader(reader_id) ON UPDATE CASCADE ON DELETE CASCADE,
  [status_id]		INT NOT NULL FOREIGN KEY REFERENCES fine_status(status_id) ON UPDATE CASCADE ON DELETE CASCADE
);