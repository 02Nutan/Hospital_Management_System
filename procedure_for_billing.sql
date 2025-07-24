use hospital_management_system;

DELIMITER $$

CREATE PROCEDURE CalculateBill(
    IN visitId INT,
    IN baseFee DECIMAL(10,2),
    IN extraCharges DECIMAL(10,2)
)
BEGIN
    DECLARE totalAmount DECIMAL(10,2);
    DECLARE taxRate DECIMAL(5,2) DEFAULT 0.05;

    SET totalAmount = baseFee + extraCharges + (baseFee * taxRate);

    -- If bill exists, update; else insert
    IF EXISTS (SELECT 1 FROM Bills WHERE visit_id = visitId) THEN
        UPDATE Bills
        SET total_amount = totalAmount,
            payment_status = 'Unpaid',
            bill_date = CURDATE()
        WHERE visit_id = visitId;
    ELSE
        INSERT INTO Bills (visit_id, total_amount, payment_status, bill_date)
        VALUES (visitId, totalAmount, 'Unpaid', CURDATE());
    END IF;

    SELECT b.bill_id, p.name AS patient_name, totalAmount AS calculated_amount, b.payment_status
    FROM Bills b
    JOIN Visits v ON b.visit_id = v.visit_id
    JOIN Patients p ON v.patient_id = p.patient_id
    WHERE b.visit_id = visitId;

END $$

DELIMITER ;


-- output of bill
CALL CalculateBill(5, 2000, 300);




