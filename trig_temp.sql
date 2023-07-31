CREATE OR REPLACE TRIGGER UpdateStatusTrigger
AFTER UPDATE ON Fee
FOR EACH ROW
DECLARE
    v_old_status VARCHAR2(20);
BEGIN
    -- Check if the status is updated from 'Unpaid' or 'Fined' to 'Paid'
    IF :OLD.status IN ('Unpaid', 'Fined') AND :NEW.status = 'Paid' THEN
        -- Your actions when the fee status is updated to 'Paid' go here.
        -- For example, you might want to log the change or perform some calculations.
        -- You can use :NEW.StudentId and :NEW.Amount to access the updated values.

        DBMS_OUTPUT.PUT_LINE('Fee with ID ' || :NEW.FeeId || ' has been updated to Paid.');

        -- For example, update the total_fee_amount in the Student table:
        UPDATE Student
        SET total_fee_amount = total_fee_amount - :OLD.Amount
        WHERE StudentId = :NEW.StudentId;

        COMMIT;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/
