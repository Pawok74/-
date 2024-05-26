-- Таблица "Преподаватель"
CREATE TABLE Instructor (
    EmployeeID int not null PRIMARY KEY,
    FullName CHAR(100),
    AcademicTitle NVARCHAR(50)
);

-- Таблица "Курс"
CREATE TABLE Course (
    CourseID int not null PRIMARY KEY,
    Title CHAR(100),
    TotalHours INT
);

-- Таблица "Группа"
CREATE TABLE GroupAll (
    GroupID int not null PRIMARY KEY,
	GroupName char(100) not null
);

-- Таблица "Студент"
CREATE TABLE Student (
    StudentID int not null PRIMARY KEY,
    FullName CHAR(100),
    EnrollmentDate DATE, --Дата зачисления
    DepartureDate DATE, --Дата отчисления
	GraduationDate Date, -- дата окончания
    GroupID INT REFERENCES GroupAll(GroupID)
);

-- Таблица "Ведение дисциплины"
CREATE TABLE Teaching (
	DisciplinaID int not null Primary key,
    EmployeeID INT REFERENCES Instructor,
    CourseID INT REFERENCES Course,
	TotalHours int,
	DiscType char(100) not null,
);

-- Таблица "Слушатели курса"
CREATE TABLE Listening (
	ListenersID int not null Primary key,
    GroupID INT REFERENCES GroupAll,
    CourseID INT REFERENCES Course,
);

-- Внесение данных в таблицу "Преподаватель"
INSERT INTO Instructor (EmployeeID, FullName, AcademicTitle)
VALUES
    (1, 'Иванов Иван Иванович', 'Кандидат наук'),
    (2, 'Петров Петр Петрович', 'Доктор наук'),
	(3, 'Семенов Семен Семенович', 'Доцент'),
	(4, 'Сидоров Олег Алексеевич', 'Лаборант'),
	(5, 'Кривошеева Василина Николаевна', 'Доктор наук'),
	(6, 'Дегтянников Евгений Дмитриевич', 'Старший лаборант'),
	(7, 'Маклюков Сергей Сергеевич', 'Кандидат наук'),
	(8, 'Кравцов Виталий Витальевич', 'Доктор наук'),
	(9, 'Соколова Валерия Николаевна', 'Профессор'),
	(10, 'Боровкова Анастасия Вячеславовна', 'Доктор наук');

-- Внесение данных в таблицу "Курс"
INSERT INTO Course (CourseID, Title, TotalHours)
VALUES
    (101, 'Математика', 40),
    (102, 'Физика', 36),
	(103, 'Программирование', 72),
    (104, 'Экономика', 144),
	(105, 'ОБЖ', 108),
    (106, 'Базы данных', 36),
	(107, 'Физ-ра', 108),
    (108, 'Английский язык', 72),
	(109, 'Философия', 144),
    (110, 'Русский язык', 108);


-- Внесение данных в таблицу "Группа"
INSERT INTO GroupAll (GroupID,GroupName)
VALUES
    (351,'ЦЭиИТ'),
    (352,'Прикладная информатика'),
	(353,'Таможня'),
    (354,'Юрисприденция'),
	(355,'Бизнес информатика'),
    (341,'Дизайн'),
	(370,'Вычислительные технологии'),
    (301,'Автоматизация производства'),
	(360,'Геология'),
    (390,'Пркладная математика');


-- Внесение данных в таблицу "Студент"
INSERT INTO Student (StudentID, FullName, EnrollmentDate, GroupID,DepartureDate,GraduationDate)
VALUES
    (1001, 'Сидоров Сидор Сидорович', '2023-01-01', 351, null,null),
    (1002, 'Андреев Андрей Андреевич', '2023-01-01', 352, null,null),
	(1003, 'Петров Петр Петрович', '2023-01-01', 353, null,null),
    (1004, 'Иванов Иван Иванович', '2023-01-01', 354, null,null),
    (1005, 'Соколов Сокол Соколович', '2023-01-01', 355, '2028-01-02',null),
    (1006, 'Кузнецов Кузьма Кузьмич', '2023-01-01', 341, '2025-01-02',null),
    (1007, 'Попов Поп Попович', '2023-01-01', 370, null,'2027-01-01'),
    (1008, 'Волков Волк Волкович', '2023-01-01', 301, null,null),
    (1009, 'Михайлов Михаил Михайлович', '2023-01-01', 360, null,'2027-01-01'),
    (1010, 'Алексеев Алексей Алексеевич', '2023-01-01', 390, '2023-01-02',null),
	(1011, 'Соловьев Соловей Соловьевич', '2023-01-01', 351, null,'2027-01-01'),
    (1012, 'Терентьев Терентий Терентиевич', '2023-01-01', 355, '2023-01-02',null);

-- Внесение данных в таблицу "Ведение_курса"
INSERT INTO Teaching (DisciplinaID, EmployeeID,CourseID,TotalHours,DiscType)
VALUES
    (2001, 1, 101, 144, 'Практика'),
    (2002, 2, 102, 72, 'Лабораторные занятия'),
	(2003, 3, 103, 144, 'Лабораторные занятия'),
    (2004, 4, 104, 108, 'Лекция'),
	(2005, 5, 105, 144, 'Лекция'),
    (2006, 6, 106, 72, 'Практика'),
	(2007, 7, 107, 144, 'Практика'),
    (2008, 8, 108, 40, 'Практика'),
	(2009, 9, 109, 144, 'Лекция'),
    (2010, 10, 110, 60, 'Практика');

-- Внесение данных в таблицу "Слушание_группой"
INSERT INTO Listening (ListenersID, GroupID,CourseID)
VALUES
    (3001, 351,101),
    (3002, 352,102),
	(3003, 353,103),
    (3004, 354,104),
	(3005, 355,105),
    (3006, 341,106),
	(3007, 370,107),
    (3008, 301,108),
	(3009, 360,109),
    (30010, 390,110);


SELECT * FROM Instructor;
SELECT * FROM Course;
SELECT * FROM GroupAll;
SELECT * FROM Student;
SELECT * FROM Teaching;
SELECT * FROM Listening;

--1
--Сколько часов отводится на преподавание дисциплины Д?
SELECT SUM(TotalHours) AS TotalHours
FROM Teaching
WHERE CourseID = (SELECT CourseID FROM Course WHERE Title = 'Физика');

--2
--Сколько всего студентов учится на факультете в данный момент?
--SELECT COUNT(*) AS TotalStudents
--FROM Student;
SELECT COUNT(StudentID) AS TotalStudents
FROM Student
WHERE DepartureDate IS NULL and GraduationDate IS NULL;

--3
--Сколько лекций читает каждый из преподавателей?
SELECT
    I.FullName AS InstructorName,
    COUNT(T.DisciplinaID) AS TotalLectures
FROM
    Instructor I
    JOIN Teaching T ON I.EmployeeID = T.EmployeeID
WHERE
    T.DiscType = 'Лекция'
GROUP BY
    I.EmployeeID, I.FullName;

--4
--Какие преподаватели читают лекции для группы А?
SELECT
    I.FullName AS InstructorName
FROM
    Instructor I
    JOIN Teaching T ON I.EmployeeID = T.EmployeeID
    JOIN Listening L ON T.CourseID = L.CourseID
    JOIN GroupAll G ON L.GroupID = G.GroupID
WHERE
    G.GroupName = 'Юрисприденция' AND T.DiscType = 'Лекция';

--5
--У каких групп ведет практические и/или лабораторные работы определенный преподаватель?
SELECT
    G.GroupName
FROM
    GroupAll G
    JOIN Listening L ON G.GroupID = L.GroupID
    JOIN Teaching T ON L.CourseID = T.CourseID
    JOIN Instructor I ON T.EmployeeID = I.EmployeeID
WHERE
    I.FullName = 'Кравцов Виталий Витальевич' AND (T.DiscType = 'Практика' OR T.DiscType = 'Лабораторные занятия');

--6
--Какие курсы изучает студент В? Группа С?
-- для студента
SELECT
    S.FullName AS StudentName,
    C.Title AS CourseTitle
FROM
    Student S
    JOIN GroupAll G ON S.GroupID = G.GroupID
    JOIN Listening L ON G.GroupID = L.GroupID
    JOIN Course C ON L.CourseID = C.CourseID
WHERE
    S.FullName = 'Терентьев Терентий Терентиевич';

-- для группы
SELECT
    S.FullName AS StudentName,
    C.Title AS CourseTitle
FROM
    Student S
    JOIN GroupAll G ON S.GroupID = G.GroupID
    JOIN Listening L ON G.GroupID = L.GroupID
    JOIN Course C ON L.CourseID = C.CourseID
WHERE
    G.GroupName = 'Дизайн';

--7
--Какие студенты были отчислены за последние три года с факультета? Вывести информацию, расположив фамилии студентов в алфавитном порядке.
SELECT
    S.FullName AS StudentName,
    S.DepartureDate
FROM
    Student S
WHERE
    S.DepartureDate IS NOT NULL AND S.DepartureDate >= DATEADD(YEAR, -3, GETDATE())
ORDER BY
    S.FullName;
