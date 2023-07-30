
--query 1
--SELECT COUNT(S.SSN)
--FROM Theory_Class TC , TParticipate TP , Student S
--WHERE TC.TClassNo = TP.ClassNo AND TP.PSSN = S.SSN AND CURRSEM(TP.StartDate , 1) = 1

---- query 2
--SELECT COUNT(S.SSN) FROM Practical_Class PC, PParticipate PP, Student S
--WHERE PC.ClassNo = PP.ClassNo AND PP.PSSN = S.SSN AND CURRSEM(PP.StartDate , 0) = 1

---- query 3
--select * from Student

---- query 4
--Select i.Instrument , Count(i.TSSN)
--FROM Teachs_Instrument as i
--Group by (i.Instrument)

---- query 5
--SELECT COUNT(S.SSN) FROM Student S
--WHERE S.gender = 1 -- number of famale student

----query 6
--select Concat(t.FName,' ' ,t.LName) as teacher_name , dbo.GetDayOfWeek(tim.Day) as dd , CONCAT(tim.hour, '-' , tim.hour+1) as hh
--from Teacher as t , Practical_Class as pclass , Time as tim
--where pclass.TSSN = t.SSN and pclass.TimeID = tim.ID and MONTH(pclass.StartDate) = MONTH(GETDATE()) and 
--YEAR(pclass.StartDate) = YEAR(GETDATE())


--union

--select Concat(t.FName,' ' ,t.LName) as teacher_name , dbo.GetDayOfWeek(tim.Day) as dd , CONCAT(tim.hour, '-' , tim.hour+1) as hh
--from Teacher as t , Theory_Class as pclass , Time as tim
--where pclass.TSSN = t.SSN and pclass.TimeID = tim.ID and MONTH(pclass.StartDate) <= MONTH(GETDATE()) and
--MONTH(pclass.StartDate) < MONTH(GETDATE())+3 and YEAR(pclass.StartDate) = YEAR(GETDATE(


----query7
--SELECT S.FName+'  '+S.LName AS FULLNAME , S.LMonthScore
--FROM Student S ,  PParticipate PP , Practical_Class PC
--WHERE S.SSN = PP.PSSN AND PP.ClassNo = PC.ClassNo AND S.LMonthScore>=15
--ORDER BY S.LMonthScore DESC;

---- query 8
--SELECT T.Day, T.Hour FROM Practical_Class PC, PParticipate PP, Time T
--WHERE PP.ClassNo = PC.ClassNo AND PC.TimeID = T.ID AND dbo.CURRSEM(PC.StartDate, 0) = 1 AND PP.PSSN = '0395412415'
--UNION
--SELECT T.Day, T.Hour FROM TParticipate TP, Theory_Class TC, Time T
--WHERE TP.ClassNo = TC.TClassNo AND TC.TimeID = T.ID AND dbo.CURRSEM(TC.StartDate, 1) = 1 AND TP.PSSN = '0395412415'

---- query 9
--SELECT dbo.REMAIN(PC.StartDate, T.Day, T.Hour, 0) Remain FROM Practical_Class PC, PParticipate PP, Time T
--WHERE PP.ClassNo = PC.ClassNo AND PC.TimeID = T.ID AND dbo.CURRSEM(PC.StartDate, 0) = 1 AND PP.PSSN = '0395412415'
--UNION
--SELECT dbo.REMAIN(TC.StartDate, T.Day, T.Hour, 1) Remain FROM TParticipate TP, Theory_Class TC, Time T
--WHERE TP.ClassNo = TC.TClassNo AND TC.TimeID = T.ID AND dbo.CURRSEM(TC.StartDate, 1) = 1 AND TP.PSSN = '0395412415'

--select datediff(week, '2023-06-02', getdate())

---- practical class / query10.1
--select * 
--from Practical_Class AS pclass , PParticipate as pp , Student as stu
--where stu.SSN = 0000 and stu.SSN = pp.PSSN and pclass.ClassNo = pp.ClassNo
--and pp.Score <> NULL

---- theorical class / query10.2
--select * 
--from Theory_Class AS tclass , TParticipate as tp , Student as stu
--where stu.SSN = 0000 and stu.SSN = tp.PSSN and tclass.TClassNo = tp.ClassNo
--and tp.Degree <> NULL

--query 11
--SELECT T.FName+'  '+T.LName FULLNAME ,T.FinancialBalance
--FROM Teacher T 

---- query 12
--select * from Instrument

---- query 13
--SELECT CONCAT(S.FName, ' ', S.LName) AS Name FROM Practical_Class PC, PParticipate PP, Student S
--WHERE PC.ClassNo = PP.ClassNo AND PP.PSSN = S.SSN AND dbo.CURRSEM(PC.StartDate, 0) = 1
--UNION
--SELECT CONCAT(S.FName, ' ', S.LName) AS Name FROM Theory_Class TC, TParticipate TP, Student S
--WHERE TC.TClassNo = TP.ClassNo AND TP.PSSN = S.SSN AND dbo.CURRSEM(TC.StartDate, 1) = 1

--query14
--SELECT  R.RoomID , dbo.GetDayOfWeek(T.Day) DAY , CONVERT(varchar, T.Hour)+':00' HOUR , 'Theory' ClassType
--FROM Room R , Theory_Class TC , Time T
--WHERE R.RoomID = TC.RoomID AND TC.TimeID =  T.ID 
--UNION
--SELECT R.RoomID ,  dbo.GetDayOfWeek(T.Day) DAY , CONVERT(varchar, T.Hour)+':00' HOUR  , 'Practical' ClassType
--FROM Room R , Practical_Class PC , Time T , Instrument I 
--WHERE R.RoomID = PC.RoomID AND PC.TimeID = T.ID AND PC.Instrument = I.Name 
--ORDER BY R.RoomID  ;

---- query 15
--SELECT CONCAT(T.Fname, ' ', T.Lname) teacher, 'practical' class_type FROM Teacher T, Student S, PParticipate PP, Practical_Class PC
--WHERE T.SSN = PC.TSSN AND PC.ClassNo = PP.ClassNo AND PP.PSSN = '0395412415'
--UNION
--SELECT CONCAT(T.Fname, ' ', T.Lname) teacher, 'theory' class_type FROM Teacher T, Student S, TParticipate TP, Theory_Class TC
--WHERE T.SSN = TC.TSSN AND TC.TClassNo = TP.ClassNo AND TP.PSSN = '0395412415'

---- query 16
--SELECT ISNULL(
--(SELECT SUM(PC.Tuition) FROM Practical_Class PC, PParticipate PP
--WHERE PC.ClassNo = PP.ClassNo AND PP.PSSN = '0395412415')
--- (SELECT SUM(T.Amount) FROM Tuition T
--WHERE T.SSN = '0395412415'), 0)

--query 17
--SELECT T.SSN , T.FName+' '+T.LName Teacher_Name , COUNT(S.SSN) Students_Count
--FROM Teacher T , Practical_Class PC , PParticipate PP , Student S
--WHERE T.SSN = PC.TSSN AND PC.ClassNo = PP.ClassNo AND PP.PSSN = S.SSN
--GROUP BY T.SSN , T.FName+' '+T.LName;

--query18
--SELECT T.SSN , T.FName+' '+T.LName Teacher_Name , COUNT(I.Name) 
--FROM Teacher T , Instrument I , Teachs_Instrument TI
--WHERE T.SSN = TI.TSSN AND I.Name = TI.Instrument
--GROUP BY T.SSN , T.FName+' '+T.LName ;

----query 19 
-- select * from Room