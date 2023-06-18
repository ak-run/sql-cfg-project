DELIMITER //

CREATE FUNCTION get_total_rooms_booked(customer_id INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total_rooms INT;
    SELECT COUNT(*) INTO total_rooms
    FROM rooms_booked_details
    WHERE cust_id = customer_id;
    RETURN total_rooms;
END //

DELIMITER ;