-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: holidays_final
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `act_id` int NOT NULL AUTO_INCREMENT,
  `act_name` varchar(50) DEFAULT NULL,
  `act_price` float DEFAULT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,'Beach Snorkeling Tour',59.99),(2,'Hiking Adventure',79.99),(3,'City Sightseeing Bus Tour',29.99),(4,'Cultural Cooking Class',49.99),(5,'Waterfall Excursion',69.99),(6,'Wildlife Safari',89.99);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities_booked`
--

DROP TABLE IF EXISTS `activities_booked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities_booked` (
  `act_bk_id` int NOT NULL AUTO_INCREMENT,
  `act_id` int NOT NULL,
  `act_date` date DEFAULT NULL,
  `quantity` int NOT NULL,
  `bk_id` int DEFAULT NULL,
  PRIMARY KEY (`act_bk_id`),
  KEY `act_id` (`act_id`),
  KEY `bk_id` (`bk_id`),
  CONSTRAINT `activities_booked_ibfk_1` FOREIGN KEY (`act_id`) REFERENCES `activities` (`act_id`),
  CONSTRAINT `activities_booked_ibfk_2` FOREIGN KEY (`bk_id`) REFERENCES `bookings` (`bk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities_booked`
--

LOCK TABLES `activities_booked` WRITE;
/*!40000 ALTER TABLE `activities_booked` DISABLE KEYS */;
INSERT INTO `activities_booked` VALUES (1,1,'2023-07-10',2,1),(2,2,'2023-07-15',3,2),(3,3,'2023-08-02',1,3),(4,4,'2023-08-18',4,4),(5,5,'2023-09-05',2,5),(6,6,'2023-09-15',3,6),(7,1,'2023-07-20',2,7),(8,2,'2023-08-08',1,8),(9,3,'2023-08-25',3,9),(10,4,'2023-09-10',4,10);
/*!40000 ALTER TABLE `activities_booked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `activities_booked_details`
--

DROP TABLE IF EXISTS `activities_booked_details`;
/*!50001 DROP VIEW IF EXISTS `activities_booked_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `activities_booked_details` AS SELECT 
 1 AS `activity_booking_id`,
 1 AS `f_name`,
 1 AS `l_name`,
 1 AS `phone`,
 1 AS `act_id`,
 1 AS `activity_name`,
 1 AS `date_of_activity`,
 1 AS `quantity`,
 1 AS `activity_price`,
 1 AS `total_activity_price`,
 1 AS `booking_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `bk_id` int NOT NULL AUTO_INCREMENT,
  `date_booked` date DEFAULT NULL,
  `cust_id` int DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  PRIMARY KEY (`bk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,'2023-01-03',1,500),(2,'2023-01-14',2,700),(3,'2023-02-05',3,350),(4,'2023-02-12',4,800),(5,'2023-03-07',5,400),(6,'2023-03-18',6,1080),(7,'2023-04-01',7,480),(8,'2023-04-09',8,755),(9,'2023-04-23',9,928),(10,'2023-05-02',10,400),(11,'2023-05-11',1,1950),(12,'2023-05-17',2,888),(13,'2023-05-24',3,500),(14,'2023-05-28',4,1700),(15,'2023-05-30',5,650);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_add`
--

DROP TABLE IF EXISTS `cust_add`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_add` (
  `add_id` int NOT NULL AUTO_INCREMENT,
  `house_num` varchar(50) NOT NULL,
  `street` varchar(50) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) NOT NULL,
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_add`
--

LOCK TABLES `cust_add` WRITE;
/*!40000 ALTER TABLE `cust_add` DISABLE KEYS */;
INSERT INTO `cust_add` VALUES (1,'1','High Street','London','Greater London','SW1A 1AA'),(2,'12','Park Road','Manchester','Greater Manchester','M1 1AA'),(3,'24','Church Street','Birmingham','West Midlands','B1 1AA'),(4,'45','Main Street','Glasgow','Glasgow','G1 1AA'),(5,'7','Queens Road','Bristol','Bristol','BS1 1AA'),(6,'31','Mill Lane','Leeds','West Yorkshire','LS1 1AA'),(7,'9','Market Street','Edinburgh','Edinburgh','EH1 1AA'),(8,'18','Victoria Road','Cardiff','Cardiff','CF1 1AA'),(9,'56','King Street','Liverpool','Merseyside','L1 1AA'),(10,'3','Castle Lane','Belfast','Belfast','BT1 1AA');
/*!40000 ALTER TABLE `cust_add` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` int DEFAULT NULL,
  `add_id` int DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `add_id` (`add_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`add_id`) REFERENCES `cust_add` (`add_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','Doe','johndoe@example.co.uk',1234567890,1),(2,'Jane','Smith','janesmith@fakeemail.co.uk',1987654321,2),(3,'Michael','Johnson','michaeljohnson@example.com',1555555555,3),(4,'Emily','Williams','emilywilliams@nomail.co.uk',1111111111,4),(5,'David','Brown','davidbrown@whateveremail.com',1999999999,5),(6,'Sarah','Miller','sarahmiller@example.com',1777777777,6),(7,'Daniel','Taylor','danieltaylor@example.co.uk',1444444444,7),(8,'Olivia','Anderson','oliviaanderson@fakeaddress.com',1222222222,8),(9,'Matthew','Thomas','matthewthomas@example.co.uk',1888888888,9),(10,'Sophia','Martinez','sophiamartinez@nomail.com',1666666666,10);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customers_and_bookings_activity`
--

DROP TABLE IF EXISTS `customers_and_bookings_activity`;
/*!50001 DROP VIEW IF EXISTS `customers_and_bookings_activity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customers_and_bookings_activity` AS SELECT 
 1 AS `cust_id`,
 1 AS `f_name`,
 1 AS `l_name`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `bk_id`,
 1 AS `total_amount`,
 1 AS `booked_activity(bk_id)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `room_details`
--

DROP TABLE IF EXISTS `room_details`;
/*!50001 DROP VIEW IF EXISTS `room_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `room_details` AS SELECT 
 1 AS `room_id`,
 1 AS `room_name`,
 1 AS `rate`,
 1 AS `capacity`,
 1 AS `jacuzzi`,
 1 AS `balcony`,
 1 AS `sea_view`,
 1 AS `mountain_view`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `room_options`
--

DROP TABLE IF EXISTS `room_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_options` (
  `room_id` int NOT NULL,
  `capacity` int DEFAULT NULL,
  `sea_view` tinyint(1) DEFAULT NULL,
  `mountain_view` tinyint(1) DEFAULT NULL,
  `balcony` tinyint(1) DEFAULT NULL,
  `jacuzzi` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`room_id`),
  CONSTRAINT `room_options_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_options`
--

LOCK TABLES `room_options` WRITE;
/*!40000 ALTER TABLE `room_options` DISABLE KEYS */;
INSERT INTO `room_options` VALUES (1,2,1,0,1,0),(2,4,0,1,1,1),(3,3,1,1,0,0),(4,2,0,0,1,0),(5,2,1,0,0,1);
/*!40000 ALTER TABLE `room_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `room_name` varchar(30) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'Deluxe Sea View',199.99),(2,'Luxury Mountain View',249.99),(3,'Standard Room',129.99),(4,'Family Suite',299.99),(5,'Penthouse Suite',499.99);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms_booked`
--

DROP TABLE IF EXISTS `rooms_booked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms_booked` (
  `room_bk_id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `check_in` date DEFAULT NULL,
  `check_out` date DEFAULT NULL,
  `bk_id` int NOT NULL,
  PRIMARY KEY (`room_bk_id`),
  KEY `room_id` (`room_id`),
  KEY `bk_id` (`bk_id`),
  CONSTRAINT `rooms_booked_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`),
  CONSTRAINT `rooms_booked_ibfk_2` FOREIGN KEY (`bk_id`) REFERENCES `bookings` (`bk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms_booked`
--

LOCK TABLES `rooms_booked` WRITE;
/*!40000 ALTER TABLE `rooms_booked` DISABLE KEYS */;
INSERT INTO `rooms_booked` VALUES (1,1,'2023-07-01','2023-07-05',1),(2,2,'2023-07-06','2023-07-11',2),(3,3,'2023-07-12','2023-07-14',3),(4,4,'2023-07-15','2023-07-18',4),(5,5,'2023-07-19','2023-07-25',5),(6,1,'2023-07-26','2023-07-30',6),(7,2,'2023-08-01','2023-08-05',7),(8,3,'2023-08-06','2023-08-10',8),(9,4,'2023-08-11','2023-08-15',9),(10,5,'2023-08-16','2023-08-20',10),(11,1,'2023-08-21','2023-08-26',2),(12,2,'2023-08-27','2023-09-01',3),(13,3,'2023-09-02','2023-09-07',5),(14,4,'2023-09-08','2023-09-13',7),(15,5,'2023-09-14','2023-09-19',8),(16,1,'2023-09-20','2023-09-24',9),(17,2,'2023-09-25','2023-09-29',10),(18,3,'2023-07-01','2023-07-05',12),(19,4,'2023-07-06','2023-07-10',14),(20,5,'2023-07-11','2023-07-15',15);
/*!40000 ALTER TABLE `rooms_booked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `rooms_booked_details`
--

DROP TABLE IF EXISTS `rooms_booked_details`;
/*!50001 DROP VIEW IF EXISTS `rooms_booked_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `rooms_booked_details` AS SELECT 
 1 AS `room_booking_id`,
 1 AS `f_name`,
 1 AS `l_name`,
 1 AS `phone`,
 1 AS `room_id`,
 1 AS `room_name`,
 1 AS `capacity`,
 1 AS `jacuzzi`,
 1 AS `balcony`,
 1 AS `sea_view`,
 1 AS `mountain_view`,
 1 AS `check_in`,
 1 AS `check_out`,
 1 AS `rate`,
 1 AS `bk_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `activities_booked_details`
--

/*!50001 DROP VIEW IF EXISTS `activities_booked_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `activities_booked_details` AS select `act_bk`.`act_bk_id` AS `activity_booking_id`,`c`.`f_name` AS `f_name`,`c`.`l_name` AS `l_name`,`c`.`phone` AS `phone`,`a`.`act_id` AS `act_id`,`a`.`act_name` AS `activity_name`,`act_bk`.`act_date` AS `date_of_activity`,`act_bk`.`quantity` AS `quantity`,`a`.`act_price` AS `activity_price`,(`a`.`act_price` * `act_bk`.`quantity`) AS `total_activity_price`,`act_bk`.`bk_id` AS `booking_id` from (((`activities` `a` join `activities_booked` `act_bk` on((`a`.`act_id` = `act_bk`.`act_id`))) join `bookings` `b` on((`b`.`bk_id` = `act_bk`.`bk_id`))) join `customers` `c` on((`c`.`cust_id` = `b`.`cust_id`))) order by `act_bk`.`act_bk_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customers_and_bookings_activity`
--

/*!50001 DROP VIEW IF EXISTS `customers_and_bookings_activity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customers_and_bookings_activity` AS select `c`.`cust_id` AS `cust_id`,`c`.`f_name` AS `f_name`,`c`.`l_name` AS `l_name`,`c`.`email` AS `email`,`c`.`phone` AS `phone`,`b`.`bk_id` AS `bk_id`,`b`.`total_amount` AS `total_amount`,`booked_activity`(`b`.`bk_id`) AS `booked_activity(bk_id)` from (`customers` `c` left join `bookings` `b` on((`c`.`cust_id` = `b`.`cust_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `room_details`
--

/*!50001 DROP VIEW IF EXISTS `room_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `room_details` AS select `r`.`room_id` AS `room_id`,`r`.`room_name` AS `room_name`,`r`.`rate` AS `rate`,`o`.`capacity` AS `capacity`,`o`.`jacuzzi` AS `jacuzzi`,`o`.`balcony` AS `balcony`,`o`.`sea_view` AS `sea_view`,`o`.`mountain_view` AS `mountain_view` from (`rooms` `r` join `room_options` `o` on((`r`.`room_id` = `o`.`room_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `rooms_booked_details`
--

/*!50001 DROP VIEW IF EXISTS `rooms_booked_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `rooms_booked_details` AS select `rm_bk`.`room_bk_id` AS `room_booking_id`,`c`.`f_name` AS `f_name`,`c`.`l_name` AS `l_name`,`c`.`phone` AS `phone`,`rd`.`room_id` AS `room_id`,`rd`.`room_name` AS `room_name`,`rd`.`capacity` AS `capacity`,`rd`.`jacuzzi` AS `jacuzzi`,`rd`.`balcony` AS `balcony`,`rd`.`sea_view` AS `sea_view`,`rd`.`mountain_view` AS `mountain_view`,`rm_bk`.`check_in` AS `check_in`,`rm_bk`.`check_out` AS `check_out`,`rd`.`rate` AS `rate`,`rm_bk`.`bk_id` AS `bk_id` from (((`rooms_booked` `rm_bk` join `room_details` `rd` on((`rd`.`room_id` = `rm_bk`.`room_id`))) join `bookings` `b` on((`b`.`bk_id` = `rm_bk`.`bk_id`))) join `customers` `c` on((`c`.`cust_id` = `b`.`cust_id`))) order by `rm_bk`.`room_bk_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-20 20:10:31
