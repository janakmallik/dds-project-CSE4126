CREATE OR REPLACE PROCEDURE AddFineForUnpaidFees AS
    v_fine_amount INT := 50; -- Fine amount
BEGIN
    -- Update fees
    UPDATE Fee
    SET Amount = Amount + v_fine_amount, status = 'Fined'
    WHERE status = 'Unpaid' AND due_date < SYSDATE;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE;
END;
/


BEGIN
    AddFineForUnpaidFees;
END;
/