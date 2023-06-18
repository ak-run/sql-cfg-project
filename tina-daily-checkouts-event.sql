-- Create an event showing which rooms are checking out each day so we know which rooms to clean
CREATE EVENT daily_checkouts
  ON SCHEDULE
    EVERY 1 DAY
    STARTS CURRENT_DATE + INTERVAL 1 DAY
  DO
    SELECT room_bk_id, room_name, check_out
    FROM rooms_booked_details
    WHERE check_out = CURRENT_DATE;