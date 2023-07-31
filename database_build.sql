


DROP TABLE Branch CASCADE CONSTRAINTS;
DROP TABLE Class CASCADE CONSTRAINTS;
DROP TABLE Student CASCADE CONSTRAINTS;
DROP TABLE Subject CASCADE CONSTRAINTS;
DROP TABLE Teacher CASCADE CONSTRAINTS;
DROP TABLE Enroll CASCADE CONSTRAINTS;
DROP TABLE ResultTable CASCADE CONSTRAINTS;
DROP TABLE FinalGrade CASCADE CONSTRAINTS;
DROP TABLE Fee CASCADE CONSTRAINTS;



CREATE TABLE Branch (
    BranchId INT PRIMARY KEY,
    Name VARCHAR2(20),
    Address VARCHAR2(30),
    PhoneNo VARCHAR2(20)
);

CREATE TABLE Class (
    ClassId INT PRIMARY KEY,
    BranchId INT,
    CONSTRAINT fk_Branch1 FOREIGN KEY (BranchId)
        REFERENCES Branch(BranchId)
);

CREATE TABLE Student (
    StudentId INT PRIMARY KEY,
    birth_id INT,
    BranchId INT,
    Name VARCHAR2(20),
    DateOfBirth DATE,
    Gender VARCHAR2(10),
    Address VARCHAR2(30),
    Email VARCHAR2(20),
    PhoneNo VARCHAR2(20),
    father_name VARCHAR2(20),
    mother_name VARCHAR2(20),
    guardian_name VARCHAR2(20),
    f_nid VARCHAR2(20),
    m_nid VARCHAR2(20),
    g_nid VARCHAR2(20),
    f_phone VARCHAR2(20),
    m_phone VARCHAR2(20),
    g_phone VARCHAR2(20),
    CONSTRAINT fk_Branch2 FOREIGN KEY (BranchId)
        REFERENCES Branch(BranchId)
);

CREATE TABLE Subject (
    SubjectId INT PRIMARY KEY,
    Name VARCHAR(20),
    ClassId INT,
    FOREIGN KEY (ClassId) REFERENCES Class(ClassId)
);

CREATE TABLE Teacher (
    TeacherId INT PRIMARY KEY,
    nid VARCHAR2(20),
    BranchId INT,
    Name VARCHAR2(20),
    DateOfBirth DATE,
    Gender VARCHAR2(10),
    Address VARCHAR2(30),
    PhoneNo VARCHAR2(20),
    Email VARCHAR2(20),
    Salary INT,
    CONSTRAINT fk_Branch3 FOREIGN KEY (BranchId)
        REFERENCES Branch(BranchId)
);

CREATE TABLE Enroll (
    EnrollId INT PRIMARY KEY,
    StudentId INT,
    ClassId INT,
    Year INT,
    BranchId INT,
    Capacity INT,
    CONSTRAINT fk_Student1 FOREIGN KEY (StudentId)
        REFERENCES Student(StudentId),
    CONSTRAINT fk_Class1 FOREIGN KEY (ClassId)
        REFERENCES Class(ClassId),
    CONSTRAINT fk_Branch4 FOREIGN KEY (BranchId)
        REFERENCES Branch(BranchId)
);

CREATE TABLE ResultTable (
    result_id INT PRIMARY KEY,
    ClassId INT,
    StudentId INT,
    SubjectId INT,
    marks INT,
    paperId INT,
    BranchId INT,
    CONSTRAINT fk_Student2 FOREIGN KEY (StudentId)
        REFERENCES Student(StudentId),
    CONSTRAINT fk_Class2 FOREIGN KEY (ClassId)
        REFERENCES Class(ClassId),
    CONSTRAINT fk_Branch5 FOREIGN KEY (BranchId)
        REFERENCES Branch(BranchId),
    CONSTRAINT fk_Subject1 FOREIGN KEY (SubjectId)
        REFERENCES Subject(SubjectId)
);

CREATE TABLE FinalGrade (
    GradeId INT PRIMARY KEY,
    ClassId INT,
    StudentId INT,
    Grade VARCHAR2(10),
    BranchId INT,
    CONSTRAINT fk_Student3 FOREIGN KEY (StudentId)
        REFERENCES Student(StudentId),
    CONSTRAINT fk_Class3 FOREIGN KEY (ClassId)
        REFERENCES Class(ClassId),
    CONSTRAINT fk_Branch6 FOREIGN KEY (BranchId)
        REFERENCES Branch(BranchId)
);


CREATE TABLE Fee (
    FeeId INT PRIMARY KEY,
    StudentId INT,
    Amount INT,
    month_no INT,
    year INT,
    paid_date DATE,
    status VARCHAR2(20),
    due_date DATE,
    BranchId INT,
    CONSTRAINT fk_Student4 FOREIGN KEY (StudentId)
        REFERENCES Student(StudentId),
    CONSTRAINT fk_Branch7 FOREIGN KEY (BranchId)
        REFERENCES Branch(BranchId)
);






