-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `isbn` char(13) NOT NULL,
  `book_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`isbn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES
('9780929306377','Fundamentals of Data Structures in C++'),
('9781266262494','ISE Engineering Circuit Analysis'),
('9781292025636','Electronic Devices and Circuit Theory'),
('9786263280878','Python程式設計：從入門到進階應用'),
('9786269602285','中級會計學：理論與應用'),
('9789574428199','C/C++ 無痛學習教本'),
('9789576099649','貨幣銀行學原理'),
('9789863120544','Java 7 教學手冊'),
('9789869859714','商用微積分');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cou_id` varchar(20) NOT NULL,
  `cou_title` varchar(20) NOT NULL CHECK (octet_length(`cou_title`) >= 2 and octet_length(`cou_title`) <= 20),
  `isbn` varchar(20) DEFAULT NULL,
  `ins_id` int(11) NOT NULL,
  `dep_id` int(11) NOT NULL,
  PRIMARY KEY (`cou_id`),
  KEY `isbn` (`isbn`),
  KEY `ins_id` (`ins_id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`) ON DELETE NO ACTION,
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`ins_id`) REFERENCES `instructor` (`ins_id`) ON DELETE NO ACTION,
  CONSTRAINT `course_ibfk_3` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `dep_name` varchar(20) NOT NULL CHECK (octet_length(`dep_name`) >= 2 and octet_length(`dep_name`) <= 30),
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES
(1,'資訊工程系');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) NOT NULL,
  `goods_name` varchar(100) DEFAULT NULL,
  `description` varchar(100) NOT NULL DEFAULT '無',
  `user_id` varchar(20) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0 CHECK (`price` >= 0 and `price` <= 10000),
  `number` int(11) NOT NULL DEFAULT 1 CHECK (`number` >= 0 and `number` <= 100),
  PRIMARY KEY (`goods_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES
(1,'9786263280878','測試用','測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試','WU41043117',10000,100),
(2,'9781292025636','測試用測試用測試用測試用測試用測試用測試','測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試測試','WU41043117',10000,99),
(3,'9786263280878','wetwryqwry','122','WU41043117',150,99),
(4,'9781292025636','測試用','','WU41043117',123,14),
(5,'9781292025636','測試用測試用測試用測試用測試用測試用測試','','WU41043117',10000,99),
(6,'9786263280878','Python程式設計：從入門到進階應用','','WU41043117',150,13),
(7,'9781292025636','Electronic Devices and Circuit Theory','aw','WU41043117',155,99),
(8,'9781292025636','Electronic Devices and Circuit Theory','awrawr','WU41043117',155,100),
(9,'9781292025636','Electronic Devices and Circuit Theory','wrawraw','WU41043117',10000,0),
(10,'9781292025636','Electronic Devices and Circuit Theory','','WU41043117',155,100),
(11,'2222222222222','segeg','eryweryweyre','WU41043117',20,99),
(12,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好','WU41043117',240,2),
(13,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好，內有上課筆記','WU41043117',100,1),
(14,'9789863120544','Java 7 教學手冊','書籍保存完好','WU41043117',165,1),
(15,'9789574428199','C/C++ 無痛學習教本','書籍保存完好','WU41043117',300,1),
(16,'9789869859714','商用微積分','書籍有損','WU41043117',400,2),
(17,'9789869859714','商用微積分','書籍有損','WU41043117',250,1),
(18,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','WU41043117',180,3),
(19,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','WU41043117',220,1),
(20,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好，內有上課筆記','WU41043117',450,1),
(21,'9786269602285','中級會計學：理論與應用','書籍保存完好，內有上課筆記','WU41043117',560,2),
(22,'9789576099649','貨幣銀行學原理','書籍有損','WU41043117',430,4),
(23,'9780929306377','Fundamentals of Data Structures in C++','書籍有損','WU41043117',120,1),
(24,'9781292025636','Electronic Devices and Circuit Theory','書籍保存完好','WU41043117',200,3),
(25,'9783030869274','Signal Integrity','書籍保存完好','WU41043117',400,3),
(26,'9789574998937','電腦軟體應用','書籍保存完好','WU41043117',160,4),
(27,'9789862014790','計算機結構','書籍保存完好','WU41043117',350,2),
(28,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好','WU41043117',240,2),
(29,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好，內有上課筆記','WU41043117',100,1),
(30,'9789863120544','Java 7 教學手冊','書籍保存完好','WU41043117',165,1),
(31,'9789574428199','C/C++ 無痛學習教本','書籍保存完好','WU41043117',300,1),
(32,'9789869859714','商用微積分','書籍有損','WU41043117',400,2),
(33,'9789869859714','商用微積分','書籍有損','WU41043117',250,1),
(34,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','WU41043117',180,3),
(35,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','WU41043117',220,1),
(36,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好，內有上課筆記','WU41043117',450,1),
(37,'9786269602285','中級會計學：理論與應用','書籍保存完好，內有上課筆記','WU41043117',560,2),
(38,'9789576099649','貨幣銀行學原理','書籍有損','WU41043117',430,4),
(39,'9780929306377','Fundamentals of Data Structures in C++','書籍有損','WU41043117',120,1),
(40,'9781292025636','Electronic Devices and Circuit Theory','書籍保存完好','WU41043117',200,3),
(41,'9783030869274','Signal Integrity','書籍保存完好','WU41043117',400,3),
(42,'9789574998937','電腦軟體應用','書籍保存完好','WU41043117',160,4),
(43,'9789862014790','計算機結構','書籍保存完好','WU41043117',350,2),
(44,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好','WU41043117',240,2),
(45,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好，內有上課筆記','WU41043117',100,1),
(46,'9789863120544','Java 7 教學手冊','書籍保存完好','WU41043117',165,1),
(47,'9789574428199','C/C++ 無痛學習教本','書籍保存完好','WU41043117',300,1),
(48,'9789869859714','商用微積分','書籍有損','WU41043117',400,2),
(49,'9789869859714','商用微積分','書籍有損','WU41043117',250,1),
(50,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','WU41043117',180,3),
(51,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','WU41043117',220,1),
(52,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好，內有上課筆記','WU41043117',450,1),
(53,'9786269602285','中級會計學：理論與應用','書籍保存完好，內有上課筆記','WU41043117',560,2),
(54,'9789576099649','貨幣銀行學原理','書籍有損','WU41043117',430,4),
(55,'9780929306377','Fundamentals of Data Structures in C++','書籍有損','WU41043117',120,1),
(56,'9781292025636','Electronic Devices and Circuit Theory','書籍保存完好','WU41043117',200,3),
(57,'9783030869274','Signal Integrity','書籍保存完好','WU41043117',400,3),
(58,'9789574998937','電腦軟體應用','書籍保存完好','WU41043117',160,4),
(59,'9789862014790','計算機結構','書籍保存完好','WU41043117',350,2),
(60,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好','WU41043117',240,2),
(61,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好，內有上課筆記','WU41043117',100,1),
(62,'9789863120544','Java 7 教學手冊','書籍保存完好','WU41043117',165,1),
(63,'9789574428199','C/C++ 無痛學習教本','書籍保存完好','WU41043117',300,1),
(64,'9789869859714','商用微積分','書籍有損','WU41043117',400,2),
(65,'9789869859714','商用微積分','書籍有損','WU41043117',250,1),
(66,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','WU41043117',180,3),
(67,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','WU41043117',220,1),
(68,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好，內有上課筆記','WU41043117',450,1),
(69,'9786269602285','中級會計學：理論與應用','書籍保存完好，內有上課筆記','WU41043117',560,2),
(70,'9789576099649','貨幣銀行學原理','書籍有損','WU41043117',430,4),
(71,'9780929306377','Fundamentals of Data Structures in C++','書籍有損','WU41043117',120,1),
(72,'9781292025636','Electronic Devices and Circuit Theory','書籍保存完好','WU41043117',200,2),
(73,'9783030869274','Signal Integrity','書籍保存完好','WU41043117',400,3),
(74,'9789574998937','電腦軟體應用','書籍保存完好','WU41043117',160,3),
(75,'9789862014790','計算機結構','書籍保存完好','WU41043117',350,2),
(76,'9786263280878','Python程式設計：從入門到進階應用','','testing',20,100),
(77,'9786263280878','Python程式設計：從入門到進階應用','','WU41043117',10000,100),
(78,'9786263280878','Python程式設計：從入門到進階應用','測試','WU41043117',123,100);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `ins_id` int(11) NOT NULL AUTO_INCREMENT,
  `ins_name` varchar(20) DEFAULT NULL CHECK (octet_length(`ins_name`) >= 2 and octet_length(`ins_name`) <= 50),
  `dep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ins_id`),
  KEY `dep_id` (`dep_id`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `department` (`dep_id`) ON DELETE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `mail_content` varchar(50) DEFAULT NULL,
  `mail_state` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `nfy_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `nfy_information` varchar(30) NOT NULL,
  `nfy_type` char(1) NOT NULL,
  PRIMARY KEY (`nfy_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_detail`
--

DROP TABLE IF EXISTS `notification_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_detail` (
  `nfy_id` int(11) NOT NULL,
  `descirption` varchar(30) NOT NULL,
  `nfy_detail_type` char(1) NOT NULL,
  `isnot` char(1) NOT NULL,
  KEY `nfy_id` (`nfy_id`),
  CONSTRAINT `notification_detail_ibfk_1` FOREIGN KEY (`nfy_id`) REFERENCES `notification` (`nfy_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_detail`
--

LOCK TABLES `notification_detail` WRITE;
/*!40000 ALTER TABLE `notification_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `ord_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `ord_quantity` int(11) NOT NULL CHECK (`ord_quantity` > 0),
  `description` varchar(100) DEFAULT NULL,
  KEY `ord_id` (`ord_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`ord_id`) REFERENCES `order_form` (`ord_id`) ON DELETE CASCADE,
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES
(1,3,1,''),
(1,2,1,''),
(1,74,1,''),
(1,72,1,''),
(2,7,1,''),
(3,6,1,''),
(4,4,1,''),
(5,9,100,''),
(6,6,1,''),
(7,11,1,''),
(8,5,1,'');
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_form`
--

DROP TABLE IF EXISTS `order_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_form` (
  `ord_id` int(11) NOT NULL AUTO_INCREMENT,
  `ord_buyer` varchar(20) NOT NULL,
  `ord_seller` varchar(20) NOT NULL,
  `ord_ordtime` datetime NOT NULL CHECK (`ord_ordtime` >= '2024-06-01 00:00:00'),
  `ord_endtime` datetime DEFAULT NULL CHECK (`ord_endtime` is null or `ord_endtime` > `ord_ordtime`),
  `ord_state` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ord_id`),
  KEY `ord_buyer` (`ord_buyer`),
  KEY `ord_seller` (`ord_seller`),
  CONSTRAINT `order_form_ibfk_1` FOREIGN KEY (`ord_buyer`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION,
  CONSTRAINT `order_form_ibfk_2` FOREIGN KEY (`ord_seller`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_form`
--

LOCK TABLES `order_form` WRITE;
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` VALUES
(1,'testing','WU41043117','2024-06-11 05:25:24','2024-06-11 06:33:24','2'),
(2,'testing','WU41043117','2024-06-11 05:26:11',NULL,'0'),
(3,'testing','WU41043117','2024-06-11 05:26:15','2024-06-15 06:40:24','3'),
(4,'testing','WU41043117','2024-06-11 05:26:18','2024-06-11 09:33:57','3'),
(5,'testing','WU41043117','2024-06-11 05:26:42','2024-06-15 06:40:24','4'),
(6,'testing','WU41043117','2024-06-11 05:26:54',NULL,'1'),
(7,'testing','WU41043117','2024-06-11 05:26:58',NULL,'0'),
(8,'testing','WU41043117','2024-06-11 05:27:01',NULL,'0');
/*!40000 ALTER TABLE `order_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_state` char(1) NOT NULL DEFAULT '1',
  `user_email` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
('testing','測試','1','41043117@gm.nfu.edu.tw'),
('WU41043117','無尾熊','1','41043117@gm.nfu.edu.tw');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 12:05:37
