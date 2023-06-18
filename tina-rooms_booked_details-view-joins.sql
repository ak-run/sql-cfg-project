CREATE VIEW room_details AS
	SELECT
		r.room_id AS room_id,
        r.room_name AS room_name,
        r.rate AS rate,
        op.capacity AS capacity,
        op.jacuzzi AS jacuzzi,
        op.balcony AS balcony,
        op.sea_view AS sea_view,
        op.mountain_view AS mountain_view
	FROM rooms AS r
    INNER JOIN
		room_options AS op
        ON r.room_id = op.room_id;
SELECT *
FROM room_details;
-- Combine room details and room bookings
CREATE VIEW rooms_booked_details AS
SELECT
		rm_bk.room_bk_id AS room_booking_id,
		c.f_name AS f_name,
		c.l_name AS l_name,
		c.phone AS phone,
		rd.room_id AS room_id,
        rd.room_name AS room_name,
        rd.capacity AS capacity,
        rd.jacuzzi AS jacuzzi,
        rd.balcony AS balcony,
        rd.sea_view AS sea_view,
        rd.mountain_view AS mountain_view,
        rm_bk.check_in AS check_in,
        rm_bk.check_out AS check_out,
        rd.rate AS rate,
        rm_bk.bk_id
FROM rooms_booked AS rm_bk
INNER JOIN
		room_details AS rd
        ON rd.room_id = rm_bk.room_id
INNER JOIN
		bookings AS b
        ON b.bk_id = rm_bk.bk_id
INNER JOIN
		customers AS c
        ON c.cust_id = b.cust_id
ORDER BY
		room_bk_id;
        
SELECT *
FROM rooms_booked_details;

-- activities booked details view

CREATE VIEW activities_booked_details AS
    SELECT
        act_bk.act_bk_id AS activity_booking_id,
        c.f_name AS f_name,
        c.l_name AS l_name,
        c.phone AS phone,
        a.act_id AS act_id,
        a.act_name AS activity_name,
        act_bk.act_date AS date_of_activity,
        act_bk.quantity AS quantity,
        a.act_price AS activity_price,
        a.act_price * act_bk.quantity AS total_activity_price,
        act_bk.bk_id AS booking_id
    FROM activities AS a
    INNER JOIN
        activities_booked AS act_bk
        ON a.act_id = act_bk.act_id
    INNER JOIN
        bookings AS b
        ON b.bk_id = act_bk.bk_id
    INNER JOIN
        customers AS c
        ON c.cust_id = b.cust_id
    ORDER BY activity_booking_id;
    
-- Prepare and demonstrate a query that uses the view. Storms are forecast for
-- a week starting on 9th July. Who needs to be contacted to cancel the
-- snorkelling tour?
SELECT f_name, l_name, phone
FROM activities_booked_details
WHERE act_id = 1
  AND date_of_activity BETWEEN '2023-07-09' AND '2023-07-16';
