


CREATE OR REPLACE FUNCTION GetStudentsWithUnpaidFees RETURN SYS_REFCURSOR AS
    cur SYS_REFCURSOR;
BEGIN
    OPEN cur FOR
        SELECT s.StudentId, s.Name, f.FeeId, f.Amount, f.due_date
        FROM Student s
        JOIN Fee f ON s.StudentId = f.StudentId
        WHERE f.status = 'Unpaid' AND f.due_date < SYSDATE;
        
    RETURN cur;
END;
/


DECLARE
    result_cur SYS_REFCURSOR;
    student_id INT;
    student_name VARCHAR2(50);
    fee_id INT;
    amount DECIMAL(10, 2);
    due_date DATE;
BEGIN
    result_cur := GetStudentsWithUnpaidFees;
    LOOP
        FETCH result_cur INTO student_id, student_name, fee_id, amount, due_date;
        EXIT WHEN result_cur%NOTFOUND;
        -- Here you can process the results as needed, e.g., display them or perform other operations.
        DBMS_OUTPUT.PUT_LINE('Student ID: ' || student_id || ', Name: ' || student_name || ', Unpaid Fee ID: ' || fee_id || ', Amount: ' || amount || ', Due Date: ' || due_date);
    END LOOP;
    CLOSE result_cur;
END;
/