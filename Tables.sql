--Create tables Student,Teacher and Notes--
CREATE TABLE [Student] (
	Id INT NOT NULL,
	Email varchar(50) NOT NULL UNIQUE,
	Password varchar(50) NOT NULL,
  CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Teacher] (
	Id INT NOT NULL,
	Email varchar(50) NOT NULL UNIQUE,
	Password varchar(50) NOT NULL,
	Name varchar(50) NOT NULL,
  CONSTRAINT [PK_TEACHER] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Notes] (
	Id INT NOT NULL,
	Title varchar(50) NOT NULL UNIQUE,
	TeacherId INT NOT NULL,
	UploadedBy varchar(50) NOT NULL,
  CONSTRAINT [PK_NOTES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO


ALTER TABLE [Notes] WITH CHECK ADD CONSTRAINT [Notes_fk0] FOREIGN KEY ([TeacherId]) REFERENCES [Teacher]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Notes] CHECK CONSTRAINT [Notes_fk0]
GO
--AddDummyData--
INSERT INTO Student (Id, Email, Password)
VALUES (1, 'john@example.com', 'mypassword');

INSERT INTO Teacher (Id, Email, Password, Name)
VALUES (1, 'jane@example.com', 'mypassword', 'Jane Doe');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (1, 'Introduction to SQL', 1, 'Jane Doe');

INSERT INTO Student (Id, Email, Password)
VALUES (2, 'jane@example.com', 'student123');

INSERT INTO Teacher (Id, Email, Password, Name)
VALUES (2, 'john@example.com', 'teacher456', 'John Smith');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (2, 'Advanced Java', 2, 'John Smith');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (3, 'Database Design', 2, 'Jane Doe');

INSERT INTO Student (Id, Email, Password)
VALUES (3, 'joe@example.com', 'mypassword123');

INSERT INTO Teacher (Id, Email, Password, Name)
VALUES (3, 'susan@example.com', 'teacher789', 'Susan Lee');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (4, 'Data Structures', 2, 'John Smith');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (5, 'Algorithms', 2, 'Jane Doe');

INSERT INTO Student (Id, Email, Password)
VALUES (4, 'judy@example.com', 'mypassword456');

INSERT INTO Teacher (Id, Email, Password, Name)
VALUES (4, 'peter@example.com', 'teacher012', 'Peter Brown');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (6, 'Operating Systems', 4, 'Judy Lee');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (7, 'Computer Networks', 4, 'Peter Brown');

INSERT INTO Student (Id, Email, Password)
VALUES (5, 'maria@example.com', 'mypassword789');

INSERT INTO Teacher (Id, Email, Password, Name)
VALUES (5, 'david@example.com', 'teacher345', 'David Kim');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (8, 'Artificial Intelligence', 5, 'Maria Garcia');

INSERT INTO Notes (Id, Title, TeacherId, UploadedBy)
VALUES (9, 'Machine Learning', 5, 'David Kim');

SELECT * FROM teacher;