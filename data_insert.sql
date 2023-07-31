
INSERT INTO Branch VALUES (1, 'Branch A', 'Address 1', '123-456-7890');
INSERT INTO Branch VALUES (2, 'Branch B', 'Address 2', '987-654-3210');
INSERT INTO Branch VALUES (3, 'Branch C', 'Address 3', '111-222-3333');

INSERT INTO Class VALUES (1, 1);
INSERT INTO Class VALUES (2, 1);
INSERT INTO Class VALUES (3, 2);

INSERT INTO Student VALUES (1, 12345, 1, 'John Doe', DATE '2000-01-01', 'Male', 'Address 2', 'doe@ex.com', '987-654-3210', 'John Doe Sr.', 'Jane Doe', 'Guardian Doe', '111-22-3333', '444-55-6666', '777-88-9999', '111-222-3333', '444-555-6666', '777-888-9999');
INSERT INTO Student VALUES (2, 54321, 2, 'Jane Smith', DATE '1999-05-15', 'Female', 'Address 5', 'smith@ex.com', '555-666-7777', 'Tom Smith', 'Susan Smith', 'Guardian Smith', '555-44-3333', '666-55-4444', '777-66-5555', '555-444-3333', '666-555-4444', '777-666-5555');
INSERT INTO Student VALUES (3, 98765, 2, 'Mike Johnson', DATE '2002-09-30', 'Male', 'Address 8', 'johnson@ex.com', '222-333-4444', 'David Johnson', 'Emily Johnson', 'Guardian Johnson', '222-33-4444', '555-33-4444', '777-33-4444', '222-333-4444', '555-333-4444', '777-333-4444');

INSERT INTO Subject VALUES (1, 'Mathematics', 1);
INSERT INTO Subject VALUES (2, 'English', 1);
INSERT INTO Subject VALUES (3, 'Science', 2);

INSERT INTO Teacher VALUES (1, '999-88-7777', 1, 'Mary Johnson', DATE '1985-08-22', 'Female', 'Address 9', '777-888-9999', 'johnson@ex.com', 55000);
INSERT INTO Teacher VALUES (2, '222-11-3333', 2, 'William Lee', DATE '1978-11-05', 'Male', 'Address 10', '888-999-0000', 'lee@ex.com', 50000);
INSERT INTO Teacher VALUES (3, '777-66-8888', 2, 'Sarah Brown', DATE '1992-04-18', 'Female', 'Address 11', '666-777-8888', 'brown@ex.com', 60000);

INSERT INTO Enroll VALUES (1, 1, 1, 2023, 1, 30);
INSERT INTO Enroll VALUES (2, 2, 1, 2023, 1, 30);
INSERT INTO Enroll VALUES (3, 3, 2, 2023, 2, 25);

INSERT INTO ResultTable VALUES (1, 1, 1, 1, 85, 123, 1);
INSERT INTO ResultTable VALUES (2, 1, 1, 2, 90, 124, 1);
INSERT INTO ResultTable VALUES (3, 2, 2, 3, 78, 125, 2);

INSERT INTO FinalGrade VALUES (1, 1, 1, 'A', 1);
INSERT INTO FinalGrade VALUES (2, 1, 2, 'B', 1);
INSERT INTO FinalGrade VALUES (3, 2, 3, 'C', 2);


INSERT INTO Fee VALUES (1, 1, 100, 7, 2023, DATE '2023-07-31', 'Paid', DATE '2023-08-10', 1);
INSERT INTO Fee VALUES (2, 2, 100, 7, 2023, DATE '2023-07-31', 'Paid', DATE '2023-08-10', 1);
INSERT INTO Fee VALUES (3, 3, 150, 7, 2023, NULL, 'Unpaid', DATE '2023-08-15', 2);

COMMIT;

SELECT * FROM Branch;
SELECT * FROM Class;
SELECT * FROM Student;
SELECT * FROM Subject;
SELECT * FROM Teacher;
SELECT * FROM Enroll;
SELECT * FROM ResultTable;
SELECT * FROM FinalGrade;
SELECT * FROM Fee;

