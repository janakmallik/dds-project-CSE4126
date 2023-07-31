SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER UpdateStatusTrigger
AFTER UPDATE ON Fee
FOR EACH ROW
DECLARE
    v_old_status VARCHAR2(20);
BEGIN
    IF :OLD.status IN ('Unpaid', 'Fined') AND :NEW.status = 'Paid' THEN
        DBMS_OUTPUT.PUT_LINE('Fee with ID ' || :NEW.FeeId || ' has been updated to Paid.');

        -- For example, update the total_fee_amount in the Student table:
        -- UPDATE Student
        -- SET total_fee_amount = total_fee_amount - :OLD.Amount
        -- WHERE StudentId = :NEW.StudentId;
        COMMIT;
    END IF;
END;
/
