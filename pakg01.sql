CREATE OR REPLACE PACKAGE higPackage AS
    FUNCTION Highestfnc(subId INT) RETURN INT;
    PROCEDURE higDetailed(subId INT);
END;
/

CREATE OR REPLACE PACKAGE BODY higPackage AS
    FUNCTION Highestfnc(subId INT) RETURN INT IS
        highest_mark INT;
    BEGIN
        SELECT MAX(marks)
        INTO highest_mark
        FROM ResultTable
        WHERE subId = Highestfnc.subId;

        RETURN highest_mark;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
    END;

    PROCEDURE higDetailed(subId INT) IS
        v_high INT;
        v_student_id INT;
        v_class_id INT;
        v_student_name VARCHAR2(50);
    BEGIN
        v_high := Highestfnc(subId);

        IF v_high IS NOT NULL THEN
            SELECT StudentId, ClassId, Name
            INTO v_student_id, v_class_id, v_student_name
            FROM ResultTable r
            JOIN Student s ON r.StudentId = s.StudentId
            WHERE SubjectId = subId;
            DBMS_OUTPUT.PUT_LINE('Student ID: ' || v_student_id || ', Class ID: ' || v_class_id || ', Name: ' || v_student_name);
        ELSE
            DBMS_OUTPUT.PUT_LINE('No data found for Subject ID: ' || subId);
        END IF;
    END;
END;
/


DECLARE
    a INT := &x; -- Replace &x with the desired subId
BEGIN
    higPackage.higDetailed(a);
END;
/
