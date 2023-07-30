INSERT INTO Student (SSN, FName, LName,gender, BirthDate, FatherName, Phone, FatherPhone, HomePhone) VALUES 
('0395412415', 'hamid', 'montazer', 0, '2003-06-13', 'mohammad', '09193549929', '09121012141', '02537500303'),
('0311245785', 'reza', 'naseri', 0, '2001-02-14', 'abbas', '09612541245', '09321454785', '02145125891'),
('0342145874', 'sadegh', 'rezai', 0, '2002-09-05', 'bagher', '09214512145', '09524152145', '02534517845'),
('0312541245', 'zahra', 'mohammadi', 1, '2002-11-03', 'mahammad', '09214521245', '09614587896', '09541254785'),
('0375412547', 'sara', 'samadi', 1, '2002-12-28', 'majid', '09547841269', '09745210278', '09314785470'),
('0311247987', 'hamid', 'montazer', 0, '2003-06-13', 'mohammad', '09193549922', '09121012142', '02537500304'),
('0342145879', 'hamidreza', 'montazer', 0, '2003-06-13', 'mohammad', '09193876929', '09121122141', '02537599303'),
('0342145865', 'ali', 'naseri', 0, '2001-02-14', 'abbas', '09612541245', '09398454785', '02145265891'),
('0342145823', 'mohammassadegh', 'rezai', 0, '2002-09-05', 'bagher', '09219812145', '09524157645', '02534599845'),
('0342145812', 'fatemeh', 'mohammadi', 1, '2002-11-03', 'mahammad', '09214421245', '09614588896', '09541256685')


INSERT INTO Instrument (Name, Type) VALUES
('gitar', 'zehi'),
('ney', 'badi'),
('santoor', 'zehi'),
('tonbak', 'koobei'),
('tar', 'zehi'),
('daf', 'koobei')

INSERT INTO Teacher (SSN, FName, LName, gender, BirthDate, Phone) VALUES
('0365474154', 'abbas', 'abbasi', 0, null, '09457521457'),
('0352415458', 'jamshid', 'khosravi', 0, null, '09214512541'),
('0322587412', 'ghasem', 'zahedi', 0, null, '09741250347'),
('0387124850', 'homa', 'amjadi', 1, null, '09214781204'),
('0314765714', 'abbas', 'abbasi', 0, null, '09491524457')

INSERT INTO Room (Capacity) Values
(10),
(12),
(15),
(18),
(25)

INSERT INTO Time (year, day, hour) VALUES
(1402, 0, 9),
(1402, 0, 10),
(1402, 0, 11),
(1402, 0, 15),
(1402, 0, 16),
(1402, 0, 17),
(1402, 1, 9),
(1402, 1, 10),
(1402, 1, 11),
(1402, 1, 15),
(1402, 1, 16),
(1402, 1, 17),
(1402, 2, 9),
(1402, 2, 10),
(1402, 2, 11),
(1402, 2, 15),
(1402, 2, 16),
(1402, 2, 17),
(1402, 3, 9),
(1402, 3, 10),
(1402, 3, 11),
(1402, 3, 15),
(1402, 3, 16),
(1402, 3, 17)

insert into Teachs_Instrument(TSSN, Instrument) VALUES
('0352415458', 'ney'),
('0352415458', 'santoor'),
('0365474154', 'tonbak'),
('0365474154', 'gitar'),
('0365474154', 'ney'),
('0322587412', 'tar'),
('0387124850', 'santoor'),
('0314765714', 'ney'),
('0314765714', 'daf'),
('0314765714', 'tonbak')

insert into Theory_Class(TSSN, TimeID, RoomID) VALUES
('0365474154', 3, 1),
('0387124850', 7, 3)

insert into TParticipate(PSSN, ClassNo) VALUES
('0395412415', 1),
('0311245785', 1),
('0342145874', 1),
('0312541245', 2),
('0375412547', 2),
('0311247987', 2)

INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0352415458', 1, 1, 420000, 'ney')
INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0352415458', 6, 2, 420000, 'santoor')
INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0314765714', 4, 2, 420000, 'ney')
INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0314765714', 18, 3, 420000, 'tonbak')
INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0314765714', 20, 3, 420000, 'tonbak')
INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0352415458', 2, 1, 420000, 'ney')
INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0352415458', 5, 2, 420000, 'santoor')
INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0314765714', 13, 2, 420000, 'ney')
INSERT INTO Practical_Class (TSSN, TimeID, RoomID, Tuition, Instrument) VALUES
('0314765714', 19, 3, 420000, 'tonbak')

INSERT INTO PParticipate (PSSN, ClassNo) VALUES
('0395412415', 1)
INSERT INTO PParticipate (PSSN, ClassNo) VALUES
('0342145874', 2)
INSERT INTO PParticipate (PSSN, ClassNo) VALUES
('0312541245', 3)
INSERT INTO PParticipate (PSSN, ClassNo) VALUES
('0375412547', 4)
INSERT INTO PParticipate (PSSN, ClassNo) VALUES
('0311247987', 5)

INSERT INTO Salary (SSN, Amount) VALUES
('0314765714', 500000)