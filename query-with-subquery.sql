-- Customers who spent more than 500
SELECT 
  c.cust_id,
  c.f_name,
  c.l_name
FROM customers AS c
WHERE
  cust_id IN (
  SELECT 
    b.cust_id
  FROM
    bookings AS b
  WHERE
    b.total_amount > 500
);