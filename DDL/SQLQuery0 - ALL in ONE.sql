--SQLQuery2-CREATE DATABASE.sql

CREATE DATABASE SPU_411_ALL_IN_ONE
ON
(
NAME		=	SPU_411_ALL_IN_ONE,
FILENAME	=	'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\SPU_411_ALL_IN_ONE.mdf',
SIZE		=	8 MB,
MAXSIZE		=	500 MB,
FILEGROWTH	=	8 MB
)
LOG ON
(
NAME		=	SPU_411_ALL_IN_ONE_log,
FILENAME	=	'D:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\Data\SPU_411_ALL_IN_ONE.ldf',
SIZE		=	8 MB,
MAXSIZE		=	500 MB,
FILEGROWTH	=	5 MB
)
GO

USE SPU_411_ALL_IN_ONE;
CREATE TABLE Directions
(
	direction_id	TINYINT			PRIMARY KEY,
	direction_name	NVARCHAR(256)	NOT NULL
);
--SQLQuery2-CREATE TABLE Directions


CREATE TABLE Groups
(
	group_id		INT				PRIMARY KEY,
	group_name		NVARCHAR(24)	NOT NULL,
	direction		TINYINT			NOT NULL
	CONSTRAINT	FK_Groups_Directions	FOREIGN KEY REFERENCES Directions(direction_id)
);

CREATE TABLE Students
(
	student_id		INT				PRIMARY KEY IDENTITY(1,1),
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50),
	birth_date		DATE			NOT NULL,
	[group]			INT				NOT NULL
	CONSTRAINT	FK_Students_Groups	FOREIGN KEY REFERENCES Groups(group_id)
);

CREATE TABLE Teachers
(
	teacher_id		INT				PRIMARY KEY,
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50),
	birth_date		DATE			NOT NULL,
	rate			MONEY			NOT NULL
);

CREATE TABLE Disciplines
(
	discipline_id		SMALLINT		PRIMARY KEY,
	discipline_name		NVARCHAR(150)	NOT NULL,
	number_of_lessons	TINYINT			NOT NULL
);

CREATE TABLE TeachersDisciplinesRelation
(
	teacher		INT,
	discipline	SMALLINT,
	PRIMARY KEY	(teacher,discipline),
	CONSTRAINT	FK_TDR_Teachers		FOREIGN KEY (teacher)		REFERENCES Teachers(teacher_id),
	CONSTRAINT	FK_TDR_Disciplines	FOREIGN KEY	(discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE DisciplinesDirectionsRelation
(
	discipline	SMALLINT,
	direction	TINYINT,
	PRIMARY KEY	(discipline, direction),
	CONSTRAINT	FK_DDR_Disciplines	FOREIGN KEY	(discipline)	REFERENCES	Disciplines(discipline_id),
	CONSTRAINT	FK_DDR_Directions	FOREIGN KEY	(direction)		REFERENCES	Directions(direction_id)
);

CREATE TABLE DependentDisciplines
(
	discipline				SMALLINT,
	dependent_discipline	SMALLINT,
	PRIMARY KEY	(discipline, dependent_discipline),
	CONSTRAINT	FK_DD_Discipline_2_Disciplines_Relation FOREIGN KEY (discipline)			REFERENCES Disciplines(discipline_id),
	CONSTRAINT	FK_DD_Dependent_2_Discipline_Relation	FOREIGN KEY (dependent_discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE RequiredDisciplines
(
	discipline				SMALLINT,
	required_discipline		SMALLINT,
	PRIMARY KEY	(discipline, required_discipline),
	CONSTRAINT	FK_RD_Discipline_2_Disciplines_Relation	FOREIGN KEY (discipline)			REFERENCES	Disciplines(discipline_id),
	CONSTRAINT	FK_RD_Required_2_Disciplines_Relation	FOREIGN KEY (required_discipline)	REFERENCES	Disciplines(discipline_id)
);
