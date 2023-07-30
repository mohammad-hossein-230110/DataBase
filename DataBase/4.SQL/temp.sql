--update TParticipate
--set Degree = 12
--WHERE PSSN = '0395412415'

--update PParticipate
--set Score = 2
--where ClassNo = 2

--delete from Practical_Class
--where ClassNo in (6, 2, 3, 4)



--update Theory_Class
--set StartDate = '2023-04-17'
--where TClassNo = 1

--update Theory_Class
--set TimeID = 24
--where TClassNo = 1

--UPDATE TParticipate
--SET Degree = 18
--WHERE ClassNo = 1 And PSSN = '0311245785'

--Insert Into Practical_Class(TSSN, TimeID, RoomID, Tuition, Instrument) Values
--('0365474154', 1, 1, 420000, 'gitar')

--select dbo.check_prerequisite(10)
--update Student
--set is_passed_theory_course = 1

--delete from Student
--delete from Teacher
--delete from Theory_Class
--delete from TParticipate
--delete from Practical_Class
--delete from PParticipate
--delete from Instrument
--delete from Teachs_Instrument

select * from Student
select * from Teacher
select * from Theory_Class
select * from TParticipate
select * from Practical_Class
select * from PParticipate
select * from Instrument
select * from Teachs_Instrument
select * from Salary
--select * from Tuition
--select * from Time

--select * from today_classes

--SELECT CONCAT(T.FName, ' ', T.LName) Teacher, TC.RoomID Room, Time.Hour Hour
--FROM Teacher T, Theory_Class TC, Time
--WHERE TC.TSSN = T.SSN AND TC.TimeID = Time.ID AND  dbo.CURRSEM(TC.StartDate, 1) = 1 AND Time.Day = DATEPART(weekday, getdate())%7

--select * from Theory_Class
--where dbo.CURRSEM(Theory_Class.StartDate, 1) = 1


--exec dbo.select_theory_classes_with_n_student @n = 2
--exec dbo.select_instrument_with_n_teachers @n = 2

