-- procedure 1
create procedure select_theory_classes_with_n_student @n int AS
SELECT TC.TClassNo FROM Theory_Class TC, TParticipate TP
WHERE TC.TClassNo = TP.ClassNo
GROUP BY TC.TClassNo HAVING COUNT(TP.PSSN) = @n
GO

-- procedure 2
create procedure select_instrument_with_n_teachers @n int AS
SELECT TI.Instrument FROM Teachs_Instrument TI, Teacher T
WHERE TI.TSSN = T.SSN
GROUP BY TI.Instrument HAVING COUNT(T.SSN) = @n
GO

-- procedure 3
create procedure add_absence @SSN nvarchar(20), @ClassNo int AS
UPDATE TParticipate
SET Absences = (SELECT Absences FROM TParticipate WHERE ClassNo = @ClassNo AND PSSN = @SSN) + 1
WHERE ClassNo = @ClassNo AND PSSN = @SSN
GO