CREATE TABLE Student
(
    SSN nvarchar(20) not null,
    FName nvarchar(50),
    LName nvarchar(50),
    gender bit, -- 0 for male, 1 for famale
    BirthDate date,
    FatherName nvarchar(50),
    Phone nvarchar(20),
    FatherPhone nvarchar(20),
    HomePhone nvarchar(20),
    Date_Of_Registration date not null DEFAULT GETDATE(),
    Is_Passed_Theory_Course bit not null DEFAULT 0,
    LMonthScore int, -- 0 for bad, 1 for average, 2 for good
    PRIMARY KEY (SSN)
);

CREATE TABLE Tuition
(
    ID int not null IDENTITY(1,1),
    Date datetime not null DEFAULT GETDATE(),
    Amount int not null,
    SSN nvarchar(20) not null DEFAULT -1, -- -1 means that the student that pay this tuition is unknown
    -- if a student leaves the school we set the ssn foreign key to -1.
    PRIMARY KEY(ID),
    FOREIGN KEY (SSN) REFERENCES Student(SSN)
    ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE Teacher
(
    SSN nvarchar(20) not null,
    FName nvarchar(50),
    LName nvarchar(50),
    gender bit, -- 0 for male, 1 for famale
    BirthDate date,
    Phone nvarchar(20),
    PRIMARY KEY (SSN)
);

CREATE TABLE Salary
(
    ID int not null IDENTITY(1,1),
    Date datetime not null DEFAULT GETDATE(),
    Amount int not null,
    SSN nvarchar(20) not null DEFAULT -1, -- -1 means that the teacher that gives this salary is unknown
    -- if a teacher leaves the school we set the ssn foreign key to -1.
    PRIMARY KEY(ID),
    FOREIGN KEY (SSN) REFERENCES Teacher(SSN)
    ON DELETE SET DEFAULT ON UPDATE CASCADE
);

CREATE TABLE Time
(
    ID int not null IDENTITY(1,1),
    Year int not null,
    Day int not null, -- 0 for saturday, 1 for sunday, 2 for monday, ...
    Hour int not null, -- start time. time units are considered one-hour instervals that start form this hour.
    PRIMARY KEY(ID)
);

CREATE TABLE Attend
(
    TSSN nvarchar(20) not null,
    TimeID int not null,
    PRIMARY KEY (TSSN, TimeID),
    FOREIGN KEY (TSSN) REFERENCES Teacher(SSN)
    ON UPDATE CASCADE,
    FOREIGN KEY (TimeID) REFERENCES Time(ID)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Instrument
(
    Name nvarchar(50),
    Type nvarchar(50),
    PRIMARY KEY (Name)
);

CREATE TABLE Teachs_Instrument
(
    TSSN nvarchar(20) not null,
    Instrument nvarchar(50) not null,
    PRIMARY KEY (TSSN, Instrument),
    FOREIGN KEY (TSSN) REFERENCES Teacher(SSN)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Instrument) REFERENCES Instrument(Name)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Room
(
    RoomID int not null IDENTITY(1,1),
    Capacity int,
    PRIMARY KEY (RoomID)
);

CREATE TABLE Practical_Class
(
    ClassNo int not NULL IDENTITY(1,1),
    StartDate date DEFAULT GETDATE(),
    TSSN nvarchar(20) not NULL,
    TimeID int not NULL,
    RoomID int not NULL,
    Tuition int not NULL,
    Instrument nvarchar(50) not NULL,
    PRIMARY KEY (ClassNo),
    FOREIGN KEY (TSSN) REFERENCES Teacher(SSN)
    ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (TimeID) REFERENCES Time(ID)
    ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
    ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (Instrument) REFERENCES Instrument(Name)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE Theory_Class
(
    TClassNo int not NULL IDENTITY(1,1),
    StartDate date DEFAULT GETDATE(),
    TSSN nvarchar(20) not NULL,
    TimeID int not NULL,
    RoomID int not NULL,
    PRIMARY KEY (TClassNo),
    FOREIGN KEY (TSSN) REFERENCES Teacher(SSN)
    ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (TimeID) REFERENCES Time(ID)
    ON DELETE NO ACTION ON UPDATE CASCADE,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
    ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE PParticipate
(
    PSSN nvarchar(20) not NULL,
    ClassNo int not NULL,
    Score int,
    PRIMARY KEY (PSSN, ClassNo),
    FOREIGN KEY (PSSN) REFERENCES Student(SSN)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ClassNo) REFERENCES Practical_Class(ClassNo)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TParticipate
(
    PSSN nvarchar(20) not NULL,
    ClassNo int not NULL,
    Degree float,
    Absences int Default 0,
    PRIMARY KEY (PSSN, ClassNo),
    FOREIGN KEY (PSSN) REFERENCES Student(SSN)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ClassNo) REFERENCES Theory_Class(TClassNo)
    ON DELETE CASCADE ON UPDATE CASCADE
);