USE holidays;
-- sample data into customer addresses table
INSERT INTO cust_add (house_num, street, town, county, postcode)
VALUES
  ('1', 'High Street', 'London', 'Greater London', 'SW1A 1AA'),
  ('12', 'Park Road', 'Manchester', 'Greater Manchester', 'M1 1AA'),
  ('24', 'Church Street', 'Birmingham', 'West Midlands', 'B1 1AA'),
  ('45', 'Main Street', 'Glasgow', 'Glasgow', 'G1 1AA'),
  ('7', 'Queens Road', 'Bristol', 'Bristol', 'BS1 1AA'),
  ('31', 'Mill Lane', 'Leeds', 'West Yorkshire', 'LS1 1AA'),
  ('9', 'Market Street', 'Edinburgh', 'Edinburgh', 'EH1 1AA'),
  ('18', 'Victoria Road', 'Cardiff', 'Cardiff', 'CF1 1AA'),
  ('56', 'King Street', 'Liverpool', 'Merseyside', 'L1 1AA'),
  ('3', 'Castle Lane', 'Belfast', 'Belfast', 'BT1 1AA');
  
SELECT *
FROM cust_add;

-- sample data into customers table
INSERT INTO customers (f_name, l_name, email, phone, add_id)
VALUES
  ('John', 'Doe', 'johndoe@example.co.uk', 1234567890, 1),
  ('Jane', 'Smith', 'janesmith@fakeemail.co.uk', 1987654321, 2),
  ('Michael', 'Johnson', 'michaeljohnson@example.com', 1555555555, 3),
  ('Emily', 'Williams', 'emilywilliams@nomail.co.uk', 1111111111, 4),
  ('David', 'Brown', 'davidbrown@whateveremail.com', 1999999999, 5),
  ('Sarah', 'Miller', 'sarahmiller@example.com', 1777777777, 6),
  ('Daniel', 'Taylor', 'danieltaylor@example.co.uk', 1444444444, 7),
  ('Olivia', 'Anderson', 'oliviaanderson@fakeaddress.com', 1222222222, 8),
  ('Matthew', 'Thomas', 'matthewthomas@example.co.uk', 1888888888, 9),
  ('Sophia', 'Martinez', 'sophiamartinez@nomail.com', 1666666666, 10);
  
SELECT *
FROM customers;

-- adding data into bookings table
INSERT INTO bookings (date_booked, cust_id)
VALUES
  ('2023-01-03', 21),
  ('2023-01-14', 23),
  ('2023-02-05', 22),
  ('2023-02-12', 24),
  ('2023-03-07', 25),
  ('2023-03-18', 27),
  ('2023-04-01', 26),
  ('2023-04-09', 28),
  ('2023-04-23', 29),
  ('2023-05-02', 30),
  ('2023-05-11', 23),
  ('2023-05-17', 25),
  ('2023-05-24', 24),
  ('2023-05-28', 26),
  ('2023-05-30', 29);
  
SELECT *
FROM bookings;

-- adding data into activities
INSERT INTO activities (act_name, act_price)
VALUES
  ('Beach Snorkeling Tour', 59.99),
  ('Hiking Adventure', 79.99),
  ('City Sightseeing Bus Tour', 29.99),
  ('Cultural Cooking Class', 49.99),
  ('Waterfall Excursion', 69.99),
  ('Wildlife Safari', 89.99);
  
SELECT *
FROM activities;

-- adding data to activities_boked table
INSERT INTO activities_booked (act_id, act_date, quantity, bk_id)
VALUES 
  (1, '2023-07-10', 2, 1),
  (2, '2023-07-15', 3, 2),
  (3, '2023-08-02', 1, 3),
  (4, '2023-08-18', 4, 4),
  (5, '2023-09-05', 2, 5),
  (6, '2023-09-15', 3, 6),
  (1, '2023-07-20', 2, 7),
  (2, '2023-08-08', 1, 8),
  (3, '2023-08-25', 3, 9),
  (4, '2023-09-10', 4, 10);
  
SELECT *
FROM activities_booked;

-- adding booking value to bookings table
SET SQL_SAFE_UPDATES = 0;

UPDATE bookings
SET total_amount = CASE
    WHEN bk_id = 1 THEN 500
    WHEN bk_id = 2 THEN 700
    WHEN bk_id = 3 THEN 350
    WHEN bk_id = 4 THEN 800
    WHEN bk_id = 5 THEN 400
    WHEN bk_id = 6 THEN 1080
    WHEN bk_id = 7 THEN 480
    WHEN bk_id = 8 THEN 755
    WHEN bk_id = 9 THEN 928
    WHEN bk_id = 10 THEN 400
    WHEN bk_id = 11 THEN 1950
    WHEN bk_id = 12 THEN 888
    WHEN bk_id = 13 THEN 500
    WHEN bk_id = 14 THEN 1700
    WHEN bk_id = 15 THEN 650
END;

SELECT *
FROM bookings;

-- Adding data to rooms
INSERT INTO rooms (room_name, rate)
VALUES 
  ('Deluxe Sea View', 199.99),
  ('Luxury Mountain View', 249.99),
  ('Standard Room', 129.99),
  ('Family Suite', 299.99),
  ('Penthouse Suite', 499.99);
  
SELECT * 
FROM rooms;

-- Adding data to room_options
INSERT INTO room_options (room_id, capacity, sea_view, mountain_view, balcony, jacuzzi)
VALUES 
  (1, 2, 1, 0, 1, 0),
  (2, 4, 0, 1, 1, 1),
  (3, 3, 1, 1, 0, 0),
  (4, 2, 0, 0, 1, 0),
  (5, 2, 1, 0, 0, 1);
  
SELECT * 
FROM room_options;

-- Adding data to rooms_booked

INSERT INTO rooms_booked (room_id, check_in, check_out, bk_id)
VALUES 
  (1, '2023-07-01', '2023-07-05', 1),
  (2, '2023-07-06', '2023-07-11', 2),
  (3, '2023-07-12', '2023-07-14', 3),
  (4, '2023-07-15', '2023-07-18', 4),
  (5, '2023-07-19', '2023-07-25', 5),
  (1, '2023-07-26', '2023-07-30', 6),
  (2, '2023-08-01', '2023-08-05', 7),
  (3, '2023-08-06', '2023-08-10', 8),
  (4, '2023-08-11', '2023-08-15', 9),
  (5, '2023-08-16', '2023-08-20', 10),
  (1, '2023-08-21', '2023-08-26', 2),
  (2, '2023-08-27', '2023-09-01', 3),
  (3, '2023-09-02', '2023-09-07', 5),
  (4, '2023-09-08', '2023-09-13', 7),
  (5, '2023-09-14', '2023-09-19', 8),
  (1, '2023-09-20', '2023-09-24', 9),
  (2, '2023-09-25', '2023-09-29', 10),
  (3, '2023-07-01', '2023-07-05', 12),
  (4, '2023-07-06', '2023-07-10', 14),
  (5, '2023-07-11', '2023-07-15', 15);

SELECT*
FROM rooms_booked;