use hospital_management_system;

ALTER TABLE Visits ADD COLUMN status ENUM('Admitted','Discharged') DEFAULT 'Admitted';


-- for patient discharge
DELIMITER $$

CREATE TRIGGER trg_auto_discharge
AFTER UPDATE ON Visits
FOR EACH ROW
BEGIN
    -- If discharge reason or status is set, update to 'Discharged'
    IF NEW.reason = 'Discharge' OR NEW.status = 'Discharged' THEN
        UPDATE Visits
        SET status = 'Discharged'
        WHERE visit_id = NEW.visit_id;
    END IF;
END $$

DELIMITER ;

-- for bill payment status update
DELIMITER $$

CREATE TRIGGER trg_payment_status_update
BEFORE UPDATE ON Bills
FOR EACH ROW
BEGIN
    -- If total_amount becomes 0, mark as Paid
    IF NEW.total_amount = 0 THEN
        SET NEW.payment_status = 'Paid';
    END IF;
END $$

DELIMITER ;





