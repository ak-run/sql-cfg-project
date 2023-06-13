-- stored function to check if a customer has booked an actiivity
-- useful to target customers who didn't with marketing

DELIMITER //
CREATE FUNCTION booked_activity(bk_id INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  DECLARE activity_booked_status VARCHAR(20); 
  IF EXISTS(
    SELECT * 
    FROM activities_booked AS ab
    INNER JOIN bookings AS b ON ab.bk_id = b.bk_id
    WHERE ab.bk_id = bk_id
  ) THEN
    SET activity_booked_status = 'Yes';
  ELSE
    SET activity_booked_status = 'No';
  END IF;
  RETURN activity_booked_status;
END//
DELIMITER ;


SELECT 
  bk_id,
  cust_id,
  total_amount,
  booked_activity(bk_id)
FROM
  bookings;
  
-- create a view to see join of customers and bookings and then add booked_activity column
CREATE VIEW
  customers_and_bookings
AS
  SELECT 
    c.cust_id,
    c.f_name,
    c.l_name,
    c.email,
    c.phone,
    b.bk_id,
    b.total_amount
  FROM 
    customers AS c
  LEFT JOIN
    bookings AS b
    ON c.cust_id = b.cust_id;

-- NOW lets display our view with our function
SELECT 
  *,
  booked_activity(bk_id)
FROM 
  customers_and_bookings;