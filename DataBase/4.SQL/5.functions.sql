-- function 1
create function CURRSEM(@StartDate Date, @ClassType bit /*0 for practical, 1 for theory*/)
returns bit
As
Begin
declare @year int, @month int, @result bit
set @year = year(getdate())
set @month = month(getdate())
if @ClassType = 1
	set @month = (3 * ((@month-1)/3)) + 1
if @year = year(@startdate) and @month = month(@startdate)
	set @result = 1
else
	set @result = 0
return @result;
end
GO

-- function 2
create function REMAIN(@StartDate Date, @Day int, @Hour int, @ClassType bit /* 0 for practical, 1 for theory */)
returns int as
begin
declare @WeekDiff int, @result int
set @WeekDiff = DATEDIFF(week, @StartDate, GETDATE())
if @ClassType = 0
	set @result = 4 - @WeekDiff
else
	set @result = 12 - @WeekDiff

if (day(getdate()) < @day or (day(getdate()) = @day and datepart(hour,getdate()) < @hour))
	set @result = @result + 1
return @result
end
GO
-- function 3
create function check_teacher_instrument (@SSN nvarchar(20), @Instrument nvarchar(50))
returns bit as
begin
IF (@Instrument IN (SELECT TI.Instrument FROM Teachs_Instrument TI WHERE TI.TSSN = @SSN))
	return 'True'
return 'False'
end
GO
-- function 4
create function check_prerequisite (@ssn int)
returns bit as
begin
IF ((SELECT Is_Passed_Theory_Course FROM Student WHERE SSN = @ssn) = 'True')
	return 'True'
return 'False'
end
GO

-- function 5
CREATE FUNCTION dbo.GetDayOfWeek (@dayNumber INT)
RETURNS VARCHAR(9)
AS
BEGIN
    DECLARE @dayOfWeek VARCHAR(9)
    SELECT @dayOfWeek = 
        CASE @dayNumber
            WHEN 0 THEN 'shanbe'
            WHEN 1 THEN '1shanbe'
            WHEN 2 THEN '2shanbe'
            WHEN 3 THEN '3shanbe'
            WHEN 4 THEN '4shanbe'
            WHEN 5 THEN '5shanbe'
            WHEN 6 THEN 'jome'
            ELSE 'Invalid day number'
        END
    RETURN @dayOfWeek
END
GO