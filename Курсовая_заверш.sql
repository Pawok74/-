-- ������� "�������������"
CREATE TABLE Instructor (
    EmployeeID int not null PRIMARY KEY,
    FullName CHAR(100),
    AcademicTitle NVARCHAR(50)
);

-- ������� "����"
CREATE TABLE Course (
    CourseID int not null PRIMARY KEY,
    Title CHAR(100),
    TotalHours INT
);

-- ������� "������"
CREATE TABLE GroupAll (
    GroupID int not null PRIMARY KEY,
	GroupName char(100) not null
);

-- ������� "�������"
CREATE TABLE Student (
    StudentID int not null PRIMARY KEY,
    FullName CHAR(100),
    EnrollmentDate DATE, --���� ����������
    DepartureDate DATE, --���� ����������
	GraduationDate Date, -- ���� ���������
    GroupID INT REFERENCES GroupAll(GroupID)
);

-- ������� "������� ����������"
CREATE TABLE Teaching (
	DisciplinaID int not null Primary key,
    EmployeeID INT REFERENCES Instructor,
    CourseID INT REFERENCES Course,
	TotalHours int,
	DiscType char(100) not null,
);

-- ������� "��������� �����"
CREATE TABLE Listening (
	ListenersID int not null Primary key,
    GroupID INT REFERENCES GroupAll,
    CourseID INT REFERENCES Course,
);

-- �������� ������ � ������� "�������������"
INSERT INTO Instructor (EmployeeID, FullName, AcademicTitle)
VALUES
    (1, '������ ���� ��������', '�������� ����'),
    (2, '������ ���� ��������', '������ ����'),
	(3, '������� ����� ���������', '������'),
	(4, '������� ���� ����������', '��������'),
	(5, '���������� �������� ����������', '������ ����'),
	(6, '����������� ������� ����������', '������� ��������'),
	(7, '�������� ������ ���������', '�������� ����'),
	(8, '������� ������� ����������', '������ ����'),
	(9, '�������� ������� ����������', '���������'),
	(10, '��������� ��������� ������������', '������ ����');

-- �������� ������ � ������� "����"
INSERT INTO Course (CourseID, Title, TotalHours)
VALUES
    (101, '����������', 40),
    (102, '������', 36),
	(103, '����������������', 72),
    (104, '���������', 144),
	(105, '���', 108),
    (106, '���� ������', 36),
	(107, '���-��', 108),
    (108, '���������� ����', 72),
	(109, '���������', 144),
    (110, '������� ����', 108);


-- �������� ������ � ������� "������"
INSERT INTO GroupAll (GroupID,GroupName)
VALUES
    (351,'�����'),
    (352,'���������� �����������'),
	(353,'�������'),
    (354,'�������������'),
	(355,'������ �����������'),
    (341,'������'),
	(370,'�������������� ����������'),
    (301,'������������� ������������'),
	(360,'��������'),
    (390,'��������� ����������');


-- �������� ������ � ������� "�������"
INSERT INTO Student (StudentID, FullName, EnrollmentDate, GroupID,DepartureDate,GraduationDate)
VALUES
    (1001, '������� ����� ���������', '2023-01-01', 351, null,null),
    (1002, '������� ������ ���������', '2023-01-01', 352, null,null),
	(1003, '������ ���� ��������', '2023-01-01', 353, null,null),
    (1004, '������ ���� ��������', '2023-01-01', 354, null,null),
    (1005, '������� ����� ���������', '2023-01-01', 355, '2028-01-02',null),
    (1006, '�������� ������ �������', '2023-01-01', 341, '2025-01-02',null),
    (1007, '����� ��� �������', '2023-01-01', 370, null,'2027-01-01'),
    (1008, '������ ���� ��������', '2023-01-01', 301, null,null),
    (1009, '�������� ������ ����������', '2023-01-01', 360, null,'2027-01-01'),
    (1010, '�������� ������� ����������', '2023-01-01', 390, '2023-01-02',null),
	(1011, '�������� ������� ����������', '2023-01-01', 351, null,'2027-01-01'),
    (1012, '��������� �������� �����������', '2023-01-01', 355, '2023-01-02',null);

-- �������� ������ � ������� "�������_�����"
INSERT INTO Teaching (DisciplinaID, EmployeeID,CourseID,TotalHours,DiscType)
VALUES
    (2001, 1, 101, 144, '��������'),
    (2002, 2, 102, 72, '������������ �������'),
	(2003, 3, 103, 144, '������������ �������'),
    (2004, 4, 104, 108, '������'),
	(2005, 5, 105, 144, '������'),
    (2006, 6, 106, 72, '��������'),
	(2007, 7, 107, 144, '��������'),
    (2008, 8, 108, 40, '��������'),
	(2009, 9, 109, 144, '������'),
    (2010, 10, 110, 60, '��������');

-- �������� ������ � ������� "��������_�������"
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
--������� ����� ��������� �� ������������ ���������� �?
SELECT SUM(TotalHours) AS TotalHours
FROM Teaching
WHERE CourseID = (SELECT CourseID FROM Course WHERE Title = '������');

--2
--������� ����� ��������� ������ �� ���������� � ������ ������?
--SELECT COUNT(*) AS TotalStudents
--FROM Student;
SELECT COUNT(StudentID) AS TotalStudents
FROM Student
WHERE DepartureDate IS NULL and GraduationDate IS NULL;

--3
--������� ������ ������ ������ �� ��������������?
SELECT
    I.FullName AS InstructorName,
    COUNT(T.DisciplinaID) AS TotalLectures
FROM
    Instructor I
    JOIN Teaching T ON I.EmployeeID = T.EmployeeID
WHERE
    T.DiscType = '������'
GROUP BY
    I.EmployeeID, I.FullName;

--4
--����� ������������� ������ ������ ��� ������ �?
SELECT
    I.FullName AS InstructorName
FROM
    Instructor I
    JOIN Teaching T ON I.EmployeeID = T.EmployeeID
    JOIN Listening L ON T.CourseID = L.CourseID
    JOIN GroupAll G ON L.GroupID = G.GroupID
WHERE
    G.GroupName = '�������������' AND T.DiscType = '������';

--5
--� ����� ����� ����� ������������ �/��� ������������ ������ ������������ �������������?
SELECT
    G.GroupName
FROM
    GroupAll G
    JOIN Listening L ON G.GroupID = L.GroupID
    JOIN Teaching T ON L.CourseID = T.CourseID
    JOIN Instructor I ON T.EmployeeID = I.EmployeeID
WHERE
    I.FullName = '������� ������� ����������' AND (T.DiscType = '��������' OR T.DiscType = '������������ �������');

--6
--����� ����� ������� ������� �? ������ �?
-- ��� ��������
SELECT
    S.FullName AS StudentName,
    C.Title AS CourseTitle
FROM
    Student S
    JOIN GroupAll G ON S.GroupID = G.GroupID
    JOIN Listening L ON G.GroupID = L.GroupID
    JOIN Course C ON L.CourseID = C.CourseID
WHERE
    S.FullName = '��������� �������� �����������';

-- ��� ������
SELECT
    S.FullName AS StudentName,
    C.Title AS CourseTitle
FROM
    Student S
    JOIN GroupAll G ON S.GroupID = G.GroupID
    JOIN Listening L ON G.GroupID = L.GroupID
    JOIN Course C ON L.CourseID = C.CourseID
WHERE
    G.GroupName = '������';

--7
--����� �������� ���� ��������� �� ��������� ��� ���� � ����������? ������� ����������, ���������� ������� ��������� � ���������� �������.
SELECT
    S.FullName AS StudentName,
    S.DepartureDate
FROM
    Student S
WHERE
    S.DepartureDate IS NOT NULL AND S.DepartureDate >= DATEADD(YEAR, -3, GETDATE())
ORDER BY
    S.FullName;
