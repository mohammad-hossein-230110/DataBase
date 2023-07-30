-- trigger 1
create trigger pass_theory_class on TParticipate AFTER UPDATE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE Student
	SET Is_Passed_Theory_Course = 1
	WHERE Student.SSN IN (select I.PSSN from inserted I WHERE I.Degree > 10 and I.Absences < 6)
END
GO

-- trigger 2 *
create trigger lmonth_score on PParticipate AFTER UPDATE AS
BEGIN
	SET NOCOUNT ON;
	declare @StartDate Date, @SSN nvarchar(20), @LMonthScore int, @ClassNo int
	set @SSN = (SELECT PSSN FROM inserted)
	set @ClassNo = (SELECT ClassNo FROM inserted)
	set @LMonthScore = (SELECT Score FROM inserted)
	set @StartDate = (SELECT PC.StartDate FROM Practical_Class PC WHERE PC.ClassNo = @ClassNo)
	IF dbo.CURRSEM(@StartDate, 0) = 1
		UPDATE Student
		SET LMonthScore = @LMonthScore
		WHERE SSN = @SSN
END
GO

-- trigger 3 *
create trigger discount on PParticipate AFTER INSERT AS
BEGIN
	SET NOCOUNT ON
	declare @ClassNo int, @SSN nvarchar(20), @LMonthScore int, @Tiuition int
	set @SSN = (SELECT PSSN FROM inserted)
	set @ClassNo = (SELECT ClassNo FROM inserted)
	set @Tiuition = (SELECT PC.Tuition FROM Practical_Class PC WHERE PC.ClassNo = @ClassNo)
	set @LMonthScore = (SELECT S.LMonthScore FROM Student S WHERE S.SSN = @SSN)
	IF @LMonthScore = 1
		UPDATE Practical_Class
		SET Tuition = @Tiuition * 0.9
		WHERE ClassNo = @ClassNo
	IF @LMonthScore = 2
		UPDATE Practical_Class
		SET Tuition = @Tiuition * 0.8
		WHERE ClassNo = @ClassNo
END
GO

--trigger 4 *
create trigger TeacherFinancialBalance2 on Practical_Class AFTER INSERT AS
BEGIN
	SET NOCOUNT ON
	declare @SSN int , @Tuition int , @TSSN int
	set @SSN = (SELECT TSSN FROM inserted)
	set @Tuition = (SELECT Tuition FROM inserted)
	set @TSSN = (SELECT T.SSN FROM Teacher T  WHERE T.SSN = @SSN )

	UPDATE Teacher
	SET FinancialBalance  = FinancialBalance + @Tuition*0.6
	WHERE @TSSN = Teacher.SSN
END
GO

--trigger 5 *
create trigger Pay on Salary AFTER INSERT AS
BEGIN
	SET NOCOUNT ON
	declare @SSN int , @Amount int , @TSSN int
	set @SSN = (SELECT SSN FROM inserted)
	set @Amount = (SELECT Amount FROM inserted)
	set @TSSN = (SELECT T.SSN FROM Teacher T WHERE T.SSN = @SSN)
		UPDATE Teacher
	SET FinancialBalance  = FinancialBalance - @Amount
	WHERE @TSSN = Teacher.SSN

END
GO

