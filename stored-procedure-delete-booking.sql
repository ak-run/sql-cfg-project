-- a procedure to delete a booking from DB and all corresponding records with this booking id, 
-- so in rooms booked and activities booked
USE holidays_final;

DELIMITER //
CREATE PROCEDURE delete_booking(bk_id INT)
BEGIN
  -- Delete the room booking associated with the booking ID
  DELETE FROM 
    rooms_booked AS rb
  WHERE 
    bk_id = rb.bk_id;
  -- Delete the activity booking associated with the booking ID
  DELETE FROM 
    activities_booked AS ab
  WHERE 
  bk_id = ab.bk_id;
  -- Finally delete from bookings
  DELETE FROM 
    bookings as b 
  WHERE 
    bk_id = b.bk_id;
END//
DELIMITER ;

SELECT * FROM bookings;
SELECT * FROM rooms_booked;
SELECT * FROM activities_booked;

START TRANSACTION;
CALL delete_booking(1);
SELECT * FROM bookings;
ROLLBACK;