SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE IdentifyStudentsWithUnpaidFees AS
    v_student_id Student.StudentId%TYPE;
    v_student_name Student.Name%TYPE;
    v_fee_id Fee.FeeId%TYPE;
    v_amount Fee.Amount%TYPE;
    v_due_date Fee.due_date%TYPE;
BEGIN
    FOR fee_rec IN (
        SELECT s.StudentId, s.Name, f.FeeId, f.Amount, f.due_date
        FROM Student s
        JOIN Fee f ON s.StudentId = f.StudentId
        WHERE f.status = 'Unpaid'
    ) LOOP
        v_student_id := fee_rec.StudentId;
        v_student_name := fee_rec.Name;
        v_fee_id := fee_rec.FeeId;
        v_amount := fee_rec.Amount;
        v_due_date := fee_rec.due_date;

        DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student_id || ', Name: ' || v_student_name || ', Unpaid Fee ID: ' || v_fee_id || ', Amount: ' || v_amount || ', Due Date: ' || v_due_date);
    END LOOP;
END;
/

BEGIN
    IdentifyStudentsWithUnpaidFees;
END;
/
-- AND f.due_date < SYSDATE