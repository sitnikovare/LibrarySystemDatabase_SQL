USE [LibrarySystem];

CREATE TABLE [issued_book] (
  [issued_book_id] INT NOT NULL PRIMARY KEY,
  [book_id] INT NOT NULL,
  [book_edition_id] INT NOT NULL,
  [amount] INT CHECK (amount > 0),
  [reader_id] INT NOT NULL,
  [date_of_issue] DATE,
  [end_of_issue] DATE
  CHECK (date_of_issue <= GETDATE())
);

CREATE TABLE [publishing] (
  [publishing_id] INT NOT NULL PRIMARY KEY,
  [publishing_name] VARCHAR(50) NOT NULL,
  [address] VARCHAR(80) NOT NULL,
);

CREATE TABLE [genre] (
  [genre_id] INT NOT NULL PRIMARY KEY,
  [genre_name] VARCHAR(50) NOT NULL
);

CREATE TABLE [book] (
  [book_id] INT NOT NULL PRIMARY KEY,
  [title] VARCHAR(80) NOT NULL,
  [author_id] INT NOT NULL,
  [genre_id] INT NOT NULL
);

CREATE TABLE [library_shelf] (
  [library_shelf_id] INT NOT NULL PRIMARY KEY,
  [department_id] INT NOT NULL
);

CREATE TABLE [decom_book] (
  [decom_book_id] INT NOT NULL PRIMARY KEY,
  [book_id] INT NOT NULL,
  [book_edition_id] INT NOT NULL,
  [decom_date] DATE NOT NULL
);

CREATE TABLE [author] (
  [author_id] INT NOT NULL PRIMARY KEY,
  [author_name] VARCHAR(50) NOT NULL
);

CREATE TABLE [department] (
  [department_id] INT NOT NULL PRIMARY KEY,
  [department_name] VARCHAR(30) NOT NULL
);

CREATE TABLE [fine] (
  [fine_id] INT NOT NULL PRIMARY KEY,
  [date_of_fine] DATE,
  [end_of_fine] DATE,
  [summ] FLOAT CHECK (summ > 0),
  [reader_id] INT NOT NULL,
  [status_id] INT NOT NULL
  CHECK (date_of_fine <= GETDATE())
);

CREATE TABLE [expired_book] (
  [expired_book_id] INT NOT NULL PRIMARY KEY,
  [issued_book_id] INT NOT NULL,
  [fine_id] INT NOT NULL
);

CREATE TABLE [fine_status] (
  [status_id] INT NOT NULL PRIMARY KEY,
  [status_name] VARCHAR(20) NOT NULL
);

CREATE TABLE [book_edition] (
  [book_edition_id] INT NOT NULL PRIMARY KEY,
  [book_id] INT NOT NULL,
  [publishing_id] INT NOT NULL,
  [edition_number] INT NOT NULL,
  [amount] INT CHECK (amount > 0),
  [date_of_arrival] DATE,
  [shelf_id] INT NOT NULL
  CHECK (date_of_arrival <= GETDATE())
);

CREATE TABLE [reader] (
  [reader_id] INT NOT NULL PRIMARY KEY,
  [reader_name] VARCHAR(50) NOT NULL,
  [reader_phone] VARCHAR(12) NOT NULL,
  [reader_address] VARCHAR(80) NOT NULL,
  [work] VARCHAR(80),
  [position] VARCHAR(50),
  [date_of_birth] DATE 
  CHECK (DATEDIFF(YEAR, GETDATE(), date_of_birth) >= 7 AND date_of_birth <= GETDATE())
);