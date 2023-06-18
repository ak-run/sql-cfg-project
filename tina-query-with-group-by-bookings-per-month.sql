-- Prepare a query with group by. How many bookings are there each month?
USE holidays;

SELECT EXTRACT(MONTH FROM check_in) AS month,
       COUNT(*) AS count
FROM rooms_booked
GROUP BY EXTRACT(MONTH FROM check_in)
ORDER BY month;