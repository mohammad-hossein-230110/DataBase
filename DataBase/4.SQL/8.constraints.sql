-- constraint 1
ALTER TABLE Practical_Class
ADD CONSTRAINT teacher_instrument_class
CHECK (dbo.check_teacher_instrument(Practical_Class.TSSN, Practical_Class.Instrument) = 'True')

-- constraint 2
ALTER TABLE PParticipate
ADD CONSTRAINT prerequisite
CHECK (dbo.check_prerequisite(PParticipate.PSSN) = 'True')

-- constraint 3
ALTER TABLE Theory_Class
ADD CONSTRAINT theory_class_startdate
CHECK (month(Theory_Class.StartDate) % 3 = 1)

---- delete constraint 1
--ALTER TABLE Practical_Class
--DROP CONSTRAINT prerequisite

---- delete constraint 2
--ALTER TABLE Theory_Class
--DROP CONSTRAINT theory_class_startdate