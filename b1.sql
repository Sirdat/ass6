USE MASTER
GO

IF EXISTS (SELECT * FROM sys.databases WHERE NAME = 'Fresher')
DROP DATABASE Fresher
GO

CREATE DATABASE Fresher
GO

USE Fresher
GO

CREATE TABLE Trainee(
	TraineeID int PRIMARY KEY IDENTITY(1,1),
	Full_name NVARCHAR(20),
	Birth_date DATETIME,
	Gender BIT,
	ET_IQ INT,
	CONSTRAINT CK_IQ CHECK (ET_IQ BETWEEN 0 AND 20),
	ET_Gmath INT,
	CONSTRAINT CK_Gmath CHECK (ET_Gmath BETWEEN 0 AND 20),
	ET_English INT,
	CONSTRAINT CK_English CHECK (ET_English BETWEEN 0 AND 50),
	Training_Class INT,
	Evaluation_Notes NVARCHAR(100)
	)
GO
INSERT INTO Trainee VALUES(N'Quế Ngọc Hải','1992-04-14',1,15,20,46,1,N'Sinh viên năm cuối')
INSERT INTO Trainee VALUES(N'Vũ Văn Thanh','1994-05-15',1,13,18,38,3,N'Sinh viên năm cuối')
INSERT INTO Trainee VALUES(N'Nguyễn Văn Toàn','1992-07-17',0,3,19,39,2,N'Sinh viên năm hai')
INSERT INTO Trainee VALUES(N'Nguyễn Công Phượng','1991-08-19',1,17,17,46,1,N'Sinh viên năm cuối')
INSERT INTO Trainee VALUES(N'Đỗ Duy Mạnh','1993-12-19',1,3,18,47,1,N'Sinh viên năm ba')
INSERT INTO Trainee VALUES(N'Hồ Tuấn Tài','1996-04-12',0,19,17,37,3,N'Sinh viên năm cuối')
INSERT INTO Trainee VALUES(N'Bùi Tiến Dũng','1993-05-17',1,7,18,27,1,N'Sinh viên năm cuối')
INSERT INTO Trainee VALUES(N'Nguyễn Tuấn Anh','1995-02-09',1,15,20,38,2,N' Đã tốt ngiệp')
INSERT INTO Trainee VALUES(N'Lương Xuân Trường','1997-09-13',0,16,19,37,1,N'Du học sinh')
INSERT INTO Trainee VALUES(N'Trần Minh Vương','1992-06-30',1,15,20,43,1,N'Sinh viên năm cuối')
GO
--b
SELECT TraineeID,Full_name,Birth_date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes
FROM Trainee
GO
DELETE  FROM Trainee
GO
ALTER TABLE Trainee ADD Fsoft_Account VARCHAR(10) NOT NULL UNIQUE 
GO
INSERT INTO Trainee VALUES(N'Quế Ngọc Hải','1992-04-14',1,15,20,46,1,N'Sinh viên năm cuối','Fsoft1')
INSERT INTO Trainee VALUES(N'Vũ Văn Thanh','1994-05-15',1,13,18,38,3,N'Sinh viên năm cuối','Fsoft2')
INSERT INTO Trainee VALUES(N'Nguyễn Văn Toàn','1992-07-17',0,3,19,39,2,N'Sinh viên năm hai','Fsoft3')
INSERT INTO Trainee VALUES(N'Nguyễn Công Phượng','1991-08-19',1,17,17,46,1,N'Sinh viên năm cuối','Fsoft4')
INSERT INTO Trainee VALUES(N'Đỗ Duy Mạnh','1993-12-19',1,3,18,47,1,N'Sinh viên năm ba','Fsoft5')
INSERT INTO Trainee VALUES(N'Hồ Tuấn Tài','1996-04-12',0,19,17,37,3,N'Sinh viên năm cuối','Fsoft6')
INSERT INTO Trainee VALUES(N'Bùi Tiến Dũng','1993-05-17',1,7,18,27,1,N'Sinh viên năm cuối','Fsoft7')
INSERT INTO Trainee VALUES(N'Nguyễn Tuấn Anh','1995-02-09',1,15,20,38,2,N' Đã tốt ngiệp','Fsoft8')
INSERT INTO Trainee VALUES(N'Lương Xuân Trường','1997-09-13',0,16,19,37,1,N'Du học sinh','Fsoft9')
INSERT INTO Trainee VALUES(N'Trần Minh Vương','1992-06-30',1,15,20,43,1,N'Sinh viên năm cuối','Fsoft10')
GO
--c
CREATE VIEW cau_c AS
SELECT TraineeID,Full_name,Birth_date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes
FROM Trainee t
WHERE (ET_IQ+ET_Gmath)>20 AND ET_IQ>8 AND ET_Gmath>8 AND ET_English>18
--d
SELECT MONTH(Birth_date), STRING_AGG(Full_name,', ') WITHIN GROUP ( ORDER BY Full_name ASC) AS Full_name 
FROM Trainee where ET_IQ+ET_English>=20 AND ET_IQ>8 AND ET_English>=8 AND ET_English>=18 
GROUP BY MONTH(Birth_date)
--e
SELECT TraineeID,Full_name,Birth_date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes,(YEAR(GETDATE())-YEAR(Birth_date)) AS AGE
FROM Trainee
WHERE LEN(Full_name)=(SELECT MAX(LEN(Full_name)) FROM Trainee)