SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION CalculateStudentAge(DateOfBirth DATE) RETURN NUMBER IS
    age_in_years NUMBER;
BEGIN
    age_in_years := FLOOR(MONTHS_BETWEEN(SYSDATE, DateOfBirth) / 12);
    RETURN age_in_years;
END;
/

DECLARE
    v_student_id INT := &x;
    v_date_of_birth DATE;
    v_age NUMBER;
BEGIN
    SELECT DateOfBirth INTO v_date_of_birth
    FROM Student
    WHERE StudentId = v_student_id;

    v_age := CalculateStudentAge(v_date_of_birth);
    DBMS_OUTPUT.PUT_LINE('Age of Student ' || v_student_id || ': ' || v_age);
END;
/
