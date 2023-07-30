-- update row 1
update TParticipate
set Degree = 20
WHERE PSSN = '0395412415' AND ClassNo = 1

-- update row 2
update TParticipate
set Degree = 6
WHERE PSSN = '0311245785' AND ClassNo = 1

-- update row 3
update TParticipate
set Degree = 15
WHERE PSSN = '0342145874' AND ClassNo = 1

-- update row 4
update TParticipate
set Degree = 18
WHERE PSSN = '0312541245' AND ClassNo = 2

-- update row 5
update TParticipate
set Degree = 12
WHERE PSSN = '0375412547' AND ClassNo = 2

-- update row 6
update TParticipate
set Degree = 19
WHERE PSSN = '0311247987' AND ClassNo = 2

-- update row 7
update PParticipate
set Score = 1
WHERE PSSN = '0395412415' AND ClassNo = 1

-- update row 8
update PParticipate
set Score = 2
WHERE PSSN = '0342145874' AND ClassNo = 2

-- update row 9
update PParticipate
set Score = 0
WHERE PSSN = '0312541245' AND ClassNo = 3

-- update row 10
update PParticipate
set Score = 1
WHERE PSSN = '0375412547' AND ClassNo = 4

-- update row 11
update PParticipate
set Score = 1
WHERE PSSN = '0311247987' AND ClassNo = 5

-- update tabel 1
ALTER TABLE Student
ADD temp int

-- update table 2
ALTER TABLE Student
DROP COLUMN temp

-- delete row 1
DELETE FROM Student
WHERE YEAR(BirthDate) > 2010

-- delet row 2
DELETE FROM Teacher
WHERE gender = 0