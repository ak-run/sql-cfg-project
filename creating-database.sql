CREATE DATABASE holidays;
USE holidays;
-- Table 1: Bookings - Booking id, Customer id, Date of booking
CREATE TABLE bookings
  (bk_id INT NOT NULL AUTO_INCREMENT,
  date_booked DATE,
  cust_id INT,
  CONSTRAINT pk_bookings PRIMARY KEY (bk_id)
  );
  
-- Table 2: Rooms - Room id, Room name, Nightly rate
CREATE TABLE rooms
  (room_id INT NOT NULL AUTO_INCREMENT,
  room_name VARCHAR(30),
  rate FLOAT(2),
  CONSTRAINT pk_rooms PRIMARY KEY (room_id)
  );
  
-- Table 3: Facilities - Room id, Capacity, Sea View, Mountain View, Jacuzzi, Balcony?
CREATE TABLE room_options
  (room_id INT NOT NULL,
  capacity INT,
  sea_view BOOL,
  mountain_view BOOL,
  balcony BOOL,
  jacuzzi BOOL,
  CONSTRAINT pk_room_options PRIMARY KEY (room_id),
  FOREIGN KEY (room_id) REFERENCES rooms (room_id)
  );
  
-- Table 4: Room Booked - Room Booking id, Room id, Check in/out date, No of Nights, Booking id
CREATE TABLE rooms_booked
  (room_bk_id INT NOT NULL AUTO_INCREMENT,
  room_id INT NOT NULL,
  check_in DATE,
  check_out DATE,
  bk_id INT NOT NULL,
  CONSTRAINT pk_rooms_booked PRIMARY KEY (room_bk_id),
  FOREIGN KEY (room_id) REFERENCES rooms (room_id),
  FOREIGN KEY (bk_id) REFERENCES bookings (bk_id)
);

-- Table 5: Customer addresses - Address id, House number, Street name, Town, County, Postcode
CREATE TABLE cust_add
  (add_id INT NOT NULL AUTO_INCREMENT,
  house_num VARCHAR(50) NOT NULL,
  street VARCHAR(50),
  town VARCHAR(50),
  county VARCHAR(50),
  postcode VARCHAR(10) NOT NULL,
  CONSTRAINT pk_add_id PRIMARY KEY (add_id)
);

-- Table 6: Customers - Customer id, First Name, Last Name, Email, Phone, address id
CREATE TABLE customers
  (cust_id INT NOT NULL AUTO_INCREMENT,
  f_name VARCHAR(50),
  l_name VARCHAR(50),
  email VARCHAR(100),
  phone INT,
  add_id INT,
  CONSTRAINT pk_cust_id PRIMARY KEY (cust_id),
  FOREIGN KEY (add_id) REFERENCES cust_add (add_id)
);

-- Table 7: Activity price - Activity id, activity name, activity price
CREATE TABLE activities
  (act_id INT NOT NULL AUTO_INCREMENT,
  act_name VARCHAR(50),
  act_price FLOAT(2),
  CONSTRAINT pk_activities PRIMARY KEY (act_id)
);

-- Table 8: Holiday activities - Activity Booking id, activity id, date of activity, number of people
CREATE TABLE activities_booked
  (act_bk_id INT NOT NULL AUTO_INCREMENT,
  act_id INT NOT NULL,
  act_date DATE,
  quantity INT NOT NULL,
  bk_id INT,
  CONSTRAINT pk_act_bk_id PRIMARY KEY (act_bk_id),
  FOREIGN KEY (act_id) REFERENCES activities (act_id),
  FOREIGN KEY (bk_id) REFERENCES bookings (bk_id)
  );
  
-- adding foreign key to bookings
ALTER TABLE bookings
ADD CONSTRAINT fk_cust_id
FOREIGN KEY (cust_id)
REFERENCES customers(cust_id);
