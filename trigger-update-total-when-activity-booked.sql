-- Create trigger to update total_amount in bookings table when a new row is inserted into activities_booked table
DELIMITER $$
CREATE TRIGGER update_total_amount
AFTER INSERT ON activities_booked
FOR EACH ROW
BEGIN
    UPDATE bookings
    SET total_amount = total_amount + (NEW.quantity * (SELECT act_price FROM activities WHERE act_id = NEW.act_id))
    WHERE bk_id = NEW.bk_id;
END$$
DELIMITER ;

SELECT *
FROM bookings;
-- bk_id 15, total 789.98

START TRANSACTION;
INSERT INTO activities_booked(act_id, act_date, quantity, bk_id)
VALUES
  (1, '2023-09-10', 2, 15);

SELECT* 
FROM bookings;
-- now bk_id 15, total 909.96

ROLLBACK;