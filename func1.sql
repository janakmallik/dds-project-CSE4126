CREATE OR REPLACE FUNCTION GetTotalUnpaidFee(StudentId INT) RETURN INT AS
    total_unpaid_fee int := 0;
BEGIN
    SELECT SUM(Amount)
    INTO total_unpaid_fee
    FROM Fee
    WHERE StudentId = GetTotalUnpaidFee.StudentId AND (status = 'Unpaid' OR status = 'Fined');
    
    RETURN total_unpaid_fee;
END;
/



SELECT StudentId, Name, GetTotalUnpaidFee(StudentId) AS TotalUnpaidFee
FROM Student;

DECLARE
    v_student_id INT := &x;
    v_total_unpaid_fee INT;
BEGIN
    v_total_unpaid_fee := GetTotalUnpaidFee(v_student_id);
    DBMS_OUTPUT.PUT_LINE('Total Unpaid Fee for Student ID ' || v_student_id || ': ' || v_total_unpaid_fee);
END;
/
