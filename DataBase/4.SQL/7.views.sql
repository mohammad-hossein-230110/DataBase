-- view 1
CREATE VIEW practical_classes_students AS
SELECT CONCAT(S.FName, ' ', S.LName) Student, CONCAT(T.FName, ' ', T.LName) Teacher, PC.Instrument Instrument
FROM Student S, Teacher T, Practical_Class PC, PParticipate PP
WHERE S.SSN = PP.PSSN AND PP.ClassNo = PC.ClassNo AND PC.TSSN = T.SSN AND dbo.CURRSEM(PC.StartDate, 0) = 1
GO

-- view 2
CREATE VIEW today_classes AS
(SELECT CONCAT(T.FName, ' ', T.LName) Teacher, PC.RoomID Room, Time.Hour Hour
FROM Teacher T, Practical_Class PC, Time
WHERE PC.TSSN = T.SSN AND PC.TimeID = Time.ID AND  dbo.CURRSEM(PC.StartDate, 0) = 1 AND Time.Day = DATEPART(weekday, getdate())%7
UNION
SELECT CONCAT(T.FName, ' ', T.LName) Teacher, TC.RoomID Room, Time.Hour Hour
FROM Teacher T, Theory_Class TC, Time
WHERE TC.TSSN = T.SSN AND TC.TimeID = Time.ID AND  dbo.CURRSEM(TC.StartDate, 1) = 1 AND Time.Day = DATEPART(weekday, getdate())%7)