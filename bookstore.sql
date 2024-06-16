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
  `book_name` varchar(100) NOT NULL CHECK (octet_length(`book_name`) >= 1 and octet_length(`book_name`) <= 100),
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
('9783030869274','Signal Integrityy'),
('9786263280878','Python程式設計：從入門到進階應用'),
('9786269602285','中級會計學：理論與應用'),
('9789574428199','C/C++ 無痛學習教本'),
('9789574998937','電腦軟體應用'),
('9789576099649','貨幣銀行學原理'),
('9789862014790','計算機結構'),
('9789863120544','Java 7 教學手冊'),
('9789869859714','商用微積分');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `bookviewforadmin`
--

DROP TABLE IF EXISTS `bookviewforadmin`;
/*!50001 DROP VIEW IF EXISTS `bookviewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bookviewforadmin` AS SELECT
 1 AS `ins_id`,
  1 AS `ins_name`,
  1 AS `dep_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `bookviewforloginuser`
--

DROP TABLE IF EXISTS `bookviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `bookviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `bookviewforloginuser` AS SELECT
 1 AS `isbn`,
  1 AS `book_name` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `cou_id` varchar(20) NOT NULL,
  `cou_title` varchar(50) NOT NULL CHECK (octet_length(`cou_title`) >= 2 and octet_length(`cou_title`) <= 50),
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
INSERT INTO `course` VALUES
('cge_112_1_0582','邏輯思維',NULL,18,11),
('cge_112_2_0502','科技與生活應用',NULL,21,11),
('cge_112_2_0506','藝術賞析',NULL,20,11),
('cge_112_2_0545','藝術史',NULL,19,11),
('csie_112_1_2028','計算機程式設計實習','9789574428199',1,1),
('csie_112_2_2005','科學計算','9786263280878',3,1),
('csie_112_2_2012','JAVA程式設計','9789863120544',2,1),
('dee_112_1_1830','計算機結構','9789862014790',4,4),
('dee_112_1_1832','電路學(一)','9781266262494',5,4),
('dee_112_1_1842','電磁學','9783030869274',6,4),
('fin_111_1_2057','貨幣銀行學','9789576099649',10,7),
('fin_111_1_2058','中級會計學(一)','9786269602285',9,7),
('im_110_1_1806','微積分','9789869859714',8,6),
('im_110_1_1809','電腦軟體應用','9789574998937',7,6);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `courseviewforadmin`
--

DROP TABLE IF EXISTS `courseviewforadmin`;
/*!50001 DROP VIEW IF EXISTS `courseviewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `courseviewforadmin` AS SELECT
 1 AS `cou_id`,
  1 AS `cou_title`,
  1 AS `isbn`,
  1 AS `ins_id`,
  1 AS `dep_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `courseviewforloginuser`
--

DROP TABLE IF EXISTS `courseviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `courseviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `courseviewforloginuser` AS SELECT
 1 AS `cou_id`,
  1 AS `cou_title`,
  1 AS `isbn`,
  1 AS `ins_id`,
  1 AS `dep_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `courseviewforunloginuser`
--

DROP TABLE IF EXISTS `courseviewforunloginuser`;
/*!50001 DROP VIEW IF EXISTS `courseviewforunloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `courseviewforunloginuser` AS SELECT
 1 AS `cou_id`,
  1 AS `cou_title`,
  1 AS `isbn`,
  1 AS `ins_id`,
  1 AS `dep_id` */;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES
(1,'資訊工程系'),
(2,'電機工程系'),
(3,'光電工程系'),
(4,'電子工程系'),
(5,'工業管理系'),
(6,'資訊管理系'),
(7,'財務金融系'),
(8,'企業管理系'),
(9,'應用外語系'),
(10,'生物科技系'),
(11,'通識教育');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `departmentviewforadmin`
--

DROP TABLE IF EXISTS `departmentviewforadmin`;
/*!50001 DROP VIEW IF EXISTS `departmentviewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `departmentviewforadmin` AS SELECT
 1 AS `dep_id`,
  1 AS `dep_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `departmentviewforloginuser`
--

DROP TABLE IF EXISTS `departmentviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `departmentviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `departmentviewforloginuser` AS SELECT
 1 AS `dep_id`,
  1 AS `dep_name` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `departmentviewforunloginuser`
--

DROP TABLE IF EXISTS `departmentviewforunloginuser`;
/*!50001 DROP VIEW IF EXISTS `departmentviewforunloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `departmentviewforunloginuser` AS SELECT
 1 AS `dep_id`,
  1 AS `dep_name` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` char(13) NOT NULL,
  `goods_name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL DEFAULT '無',
  `user_id` varchar(20) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0 CHECK (`price` >= 0 and `price` <= 10000),
  `number` int(11) NOT NULL DEFAULT 1 CHECK (`number` >= 0 and `number` <= 100),
  PRIMARY KEY (`goods_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES
(1,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好','AaBb@1',240,2),
(2,'9786263280878','Python程式設計：從入門到進階應用','書籍保存完好，內有上課筆記','AaBb@2',100,1),
(3,'9789863120544','Java 7 教學手冊','書籍保存完好','AaBb@3',165,1),
(4,'9789574428199','C/C++ 無痛學習教本','書籍保存完好','AaBb@4',300,1),
(5,'9789869859714','商用微積分','書籍有損','AaBb@5',400,2),
(6,'9789869859714','商用微積分','書籍有損','AaBb@6',250,1),
(7,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','AaBb@7',180,3),
(8,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好','AaBb@8',220,1),
(9,'9781266262494','ISE Engineering Circuit Analysis','書籍保存完好，內有上課筆記','AaBb@9',450,1),
(10,'9786269602285','中級會計學：理論與應用','書籍保存完好，內有上課筆記','AaBb@10',560,2),
(11,'9789576099649','貨幣銀行學原理','書籍有損','AaBb@11',430,4),
(12,'9780929306377','Fundamentals of Data Structures in C++','書籍有損','AaBb@12',120,1),
(13,'9781292025636','Electronic Devices and Circuit Theory','書籍保存完好','AaBb@13',200,3),
(14,'9783030869274','Signal Integrity','書籍保存完好','AaBb@14',400,3),
(15,'9789574998937','電腦軟體應用','書籍保存完好','AaBb@15',160,4),
(16,'9789862014790','計算機結構','書籍保存完好','AaBb@16',350,2);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `goods_insert_viewforloginuser`
--

DROP TABLE IF EXISTS `goods_insert_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `goods_insert_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goods_insert_viewforloginuser` AS SELECT
 1 AS `goods_id`,
  1 AS `isbn`,
  1 AS `goods_name`,
  1 AS `description`,
  1 AS `user_id`,
  1 AS `price`,
  1 AS `number` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goods_name_update_viewforloginuser`
--

DROP TABLE IF EXISTS `goods_name_update_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `goods_name_update_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goods_name_update_viewforloginuser` AS SELECT
 1 AS `goods_id`,
  1 AS `goods_name`,
  1 AS `description`,
  1 AS `price`,
  1 AS `number` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goods_select_viewforloginuser`
--

DROP TABLE IF EXISTS `goods_select_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `goods_select_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goods_select_viewforloginuser` AS SELECT
 1 AS `goods_id`,
  1 AS `isbn`,
  1 AS `goods_name`,
  1 AS `description`,
  1 AS `user_id`,
  1 AS `price`,
  1 AS `number` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goods_update_viewforloginuser`
--

DROP TABLE IF EXISTS `goods_update_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `goods_update_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goods_update_viewforloginuser` AS SELECT
 1 AS `goods_id`,
  1 AS `description`,
  1 AS `price`,
  1 AS `number` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `goodsuploadmessage`
--

DROP TABLE IF EXISTS `goodsuploadmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goodsuploadmessage` (
  `msg_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  KEY `msg_id` (`msg_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `goodsuploadmessage_ibfk_1` FOREIGN KEY (`msg_id`) REFERENCES `mail` (`mail_id`),
  CONSTRAINT `goodsuploadmessage_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsuploadmessage`
--

LOCK TABLES `goodsuploadmessage` WRITE;
/*!40000 ALTER TABLE `goodsuploadmessage` DISABLE KEYS */;
INSERT INTO `goodsuploadmessage` VALUES
(10,6),
(37,2),
(38,4),
(39,7),
(40,10),
(41,15),
(42,1),
(43,16),
(44,5),
(45,5);
/*!40000 ALTER TABLE `goodsuploadmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `goodsuploadmessageviewforloginuser`
--

DROP TABLE IF EXISTS `goodsuploadmessageviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `goodsuploadmessageviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goodsuploadmessageviewforloginuser` AS SELECT
 1 AS `msg_id`,
  1 AS `goods_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goodsviewforadmin`
--

DROP TABLE IF EXISTS `goodsviewforadmin`;
/*!50001 DROP VIEW IF EXISTS `goodsviewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goodsviewforadmin` AS SELECT
 1 AS `goods_id`,
  1 AS `isbn`,
  1 AS `goods_name`,
  1 AS `description`,
  1 AS `user_id`,
  1 AS `price`,
  1 AS `number` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `goodsviewforunloginuser`
--

DROP TABLE IF EXISTS `goodsviewforunloginuser`;
/*!50001 DROP VIEW IF EXISTS `goodsviewforunloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `goodsviewforunloginuser` AS SELECT
 1 AS `goods_id`,
  1 AS `isbn`,
  1 AS `goods_name`,
  1 AS `description`,
  1 AS `user_id`,
  1 AS `price`,
  1 AS `number` */;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES
(1,'許乙清',1),
(2,'林武杰',1),
(3,'游允帥',1),
(4,'王榮爵',4),
(5,'黃俊銘',4),
(6,'沈自',4),
(7,'楊達立',6),
(8,'蕭育如',6),
(9,'賴雅雯',7),
(10,'林秋發',7),
(11,'鄭佳炘',2),
(12,'吳添全',2),
(13,'鄭旭志',2),
(14,'王偉名',3),
(15,'李英聯',5),
(16,'吳淑惠',7),
(17,'林秋發',7),
(18,'陳正彥',11),
(19,'林靜嫺',11),
(20,'詹彩芸',11),
(21,'李燕珠',11);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `instructorviewforadmin`
--

DROP TABLE IF EXISTS `instructorviewforadmin`;
/*!50001 DROP VIEW IF EXISTS `instructorviewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `instructorviewforadmin` AS SELECT
 1 AS `ins_id`,
  1 AS `ins_name`,
  1 AS `dep_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `instructorviewforloginuser`
--

DROP TABLE IF EXISTS `instructorviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `instructorviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `instructorviewforloginuser` AS SELECT
 1 AS `ins_id`,
  1 AS `ins_name`,
  1 AS `dep_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `instructorviewforunloginuser`
--

DROP TABLE IF EXISTS `instructorviewforunloginuser`;
/*!50001 DROP VIEW IF EXISTS `instructorviewforunloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `instructorviewforunloginuser` AS SELECT
 1 AS `ins_id`,
  1 AS `ins_name`,
  1 AS `dep_id` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `sender_id` varchar(20) DEFAULT NULL,
  `mail_type` char(1) NOT NULL CHECK (`mail_type` >= '1' and `mail_type` <= '8'),
  `mail_state` char(1) NOT NULL DEFAULT '0' CHECK (`mail_state` = '0' or `mail_state` = '1'),
  PRIMARY KEY (`mail_id`),
  KEY `user_id` (`user_id`),
  KEY `sender_id` (`sender_id`),
  CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES
(1,'AaBb@1','AaBb@2','5','1'),
(2,'AaBb@2','AaBb@1','6','1'),
(3,'AaBb@2',NULL,'3','1'),
(4,'AaBb@1','AaBb@2','7','0'),
(5,'AaBb@10',NULL,'4','1'),
(6,'AaBb@10',NULL,'4','1'),
(7,'AaBb@8','AaBb@6','7','1'),
(8,'AaBb@5','AaBb@8','7','1'),
(9,'AaBb@11','AaBb@10','1','1'),
(10,'AaBb@3','AaBb@6','8','1'),
(11,'AaBb@13','AaBb@6','7','0'),
(12,'AaBb@12','AaBb@1','7','0'),
(13,'AaBb@9','AaBb@9','7','0'),
(14,'AaBb@4','AaBb@10','2','1'),
(15,'AaBb@6','AaBb@8','5','1'),
(16,'AaBb@11','AaBb@7','5','0'),
(17,'AaBb@11','AaBb@12','5','1'),
(18,'AaBb@16','AaBb@8','6','1'),
(19,'AaBb@7','AaBb@16','5','1'),
(20,'AaBb@6','AaBb@7','6','1'),
(21,'AaBb@14','AaBb@12','5','1'),
(22,'AaBb@12','AaBb@14','6','1'),
(23,'AaBb@16','AaBb@15','5','1'),
(24,'AaBb@15','AaBb@16','6','1'),
(25,'AaBb@8','AaBb@5','5','1'),
(26,'AaBb@4','AaBb@10','5','1'),
(27,'AaBb@7',NULL,'4','1'),
(28,'AaBb@3',NULL,'4','0'),
(29,'AaBb@7','AaBb@16','5','1'),
(30,'AaBb@16','AaBb@7','6','1'),
(31,'AaBb@14','AaBb@2','5','1'),
(32,'AaBb@2','AaBb@14','6','0'),
(33,'AaBb@13','AaBb@6','7','0'),
(34,'AaBb@13','AaBb@6','7','0'),
(35,'AaBb@13','AaBb@6','7','0'),
(36,'AaBb@13','AaBb@6','7','0'),
(37,'AaBb@1','AaBb@2','8','1'),
(38,'AaBb@2','AaBb@4','8','1'),
(39,'AaBb@4','AaBb@7','8','0'),
(40,'AaBb@5','AaBb@10','8','0'),
(41,'AaBb@6','AaBb@15','8','1'),
(42,'AaBb@7','AaBb@1','8','1'),
(43,'AaBb@8','AaBb@16','8','0'),
(44,'AaBb@9','AaBb@5','8','1'),
(45,'AaBb@10','AaBb@5','8','1');
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `mail_insert_viewforadmin`
--

DROP TABLE IF EXISTS `mail_insert_viewforadmin`;
/*!50001 DROP VIEW IF EXISTS `mail_insert_viewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mail_insert_viewforadmin` AS SELECT
 1 AS `mail_id`,
  1 AS `user_id`,
  1 AS `mail_state` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `mail_select_viewforadmin`
--

DROP TABLE IF EXISTS `mail_select_viewforadmin`;
/*!50001 DROP VIEW IF EXISTS `mail_select_viewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mail_select_viewforadmin` AS SELECT
 1 AS `mail_id`,
  1 AS `user_id`,
  1 AS `sender_id`,
  1 AS `mail_type`,
  1 AS `mail_state` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `mailviewforloginuser`
--

DROP TABLE IF EXISTS `mailviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `mailviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mailviewforloginuser` AS SELECT
 1 AS `mail_id`,
  1 AS `user_id`,
  1 AS `sender_id`,
  1 AS `mail_type`,
  1 AS `mail_state` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `nfy_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `nfy_searchsetting` varchar(100) NOT NULL,
  PRIMARY KEY (`nfy_id`),
  UNIQUE KEY `user_id` (`user_id`,`nfy_searchsetting`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES
(1,'AaBb@1','Python程式設計'),
(10,'AaBb@10','微積分'),
(11,'AaBb@11','Java 7 教學手冊'),
(12,'AaBb@12','Signal Integrity'),
(13,'AaBb@13','Java 7'),
(2,'AaBb@2','C/C++'),
(3,'AaBb@3','商用微積分 Python程式'),
(4,'AaBb@4','ISE Engineering'),
(5,'AaBb@5','中級會計學'),
(6,'AaBb@6','電腦軟體應用'),
(7,'AaBb@7','Python'),
(8,'AaBb@8','計算機結構'),
(9,'AaBb@9','商用微積分');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `notification_select_viewforloginuser`
--

DROP TABLE IF EXISTS `notification_select_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `notification_select_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `notification_select_viewforloginuser` AS SELECT
 1 AS `nfy_id`,
  1 AS `user_id`,
  1 AS `nfy_searchsetting` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `notification_update_viewforloginuser`
--

DROP TABLE IF EXISTS `notification_update_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `notification_update_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `notification_update_viewforloginuser` AS SELECT
 1 AS `nfy_id`,
  1 AS `nfy_searchsetting` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `ord_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `ord_quantity` int(11) NOT NULL CHECK (`ord_quantity` >= 0),
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
(1,1,1,'訂購1本Python程式設計：從入門到進階應用'),
(2,2,1,'訂購1本Python程式設計：從入門到進階應用'),
(3,3,1,'訂購1本Java 7 教學手冊'),
(4,4,1,'訂購1本C/C++ 無痛學習教本'),
(5,8,1,'訂購1本ISE Engineering Circuit Analysis'),
(6,10,2,'訂購2本中級會計學：理論與應用'),
(7,5,1,'訂購1本商用微積分'),
(8,13,3,'訂購3本Electronic Devices and Circuit Theory'),
(9,12,1,'訂購1本Fundamentals of Data Structures in C++'),
(10,9,1,'訂購1本ISE Engineering Circuit Analysis'),
(11,6,1,'訂購1本商用微積分'),
(12,11,2,'訂購2本貨幣銀行學原理'),
(13,15,1,'訂購1本電腦軟體應用'),
(14,7,2,'訂購2本ISE Engineering Circuit Analysis'),
(15,14,2,'訂購2本Signal Integrity'),
(16,16,2,'訂購2本計算機結構'),
(17,8,1,'訂購1本ISE Engineering Circuit Analysis'),
(18,4,1,'訂購1本C/C++ 無痛學習教本'),
(19,2,2,'訂購2本Python程式設計：從入門到進階應用'),
(20,7,1,'訂購1本ISE Engineering Circuit Analysis'),
(21,7,1,'訂購1本ISE Engineering Circuit Analysis');
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
  `ord_state` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ord_id`),
  KEY `ord_buyer` (`ord_buyer`),
  KEY `ord_seller` (`ord_seller`),
  CONSTRAINT `order_form_ibfk_1` FOREIGN KEY (`ord_buyer`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION,
  CONSTRAINT `order_form_ibfk_2` FOREIGN KEY (`ord_seller`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_form`
--

LOCK TABLES `order_form` WRITE;
/*!40000 ALTER TABLE `order_form` DISABLE KEYS */;
INSERT INTO `order_form` VALUES
(1,'AaBb@2','AaBb@1','2024-06-02 10:24:13','2024-06-02 10:48:34','3'),
(2,'AaBb@1','AaBb@2','2024-06-02 10:28:41','2024-06-03 18:24:17','3'),
(3,'AaBb@10','AaBb@3','2024-06-02 12:40:29',NULL,'4'),
(4,'AaBb@10','AaBb@4','2024-06-02 16:06:41',NULL,'4'),
(5,'AaBb@5','AaBb@8','2024-06-02 20:33:15','2024-06-02 22:33:15','3'),
(6,'AaBb@11','AaBb@10','2024-06-02 20:35:11',NULL,'4'),
(7,'AaBb@3','AaBb@5','2024-06-02 11:27:09',NULL,'4'),
(8,'AaBb@16','AaBb@13','2024-06-02 11:33:29',NULL,'1'),
(9,'AaBb@1','AaBb@12','2024-06-02 11:47:48',NULL,'1'),
(10,'AaBb@4','AaBb@9','2024-06-03 02:10:15','2024-06-06 00:00:00','2'),
(11,'AaBb@8','AaBb@6','2024-06-03 05:49:13',NULL,'1'),
(12,'AaBb@7','AaBb@11','2024-06-03 05:50:20',NULL,'1'),
(13,'AaBb@16','AaBb@15','2024-06-03 05:59:43','2024-06-03 09:53:07','3'),
(14,'AaBb@6','AaBb@7','2024-06-03 12:10:59','2024-06-03 16:20:30','3'),
(15,'AaBb@12','AaBb@14','2024-06-03 13:16:48','2024-06-03 14:20:41','3'),
(16,'AaBb@15','AaBb@16','2024-06-03 18:00:26','2024-06-03 21:36:10','3'),
(17,'AaBb@16','AaBb@8','2024-06-03 18:34:37',NULL,'1'),
(18,'AaBb@7','AaBb@4','2024-06-03 22:16:26','2024-06-06 00:00:00','2'),
(19,'AaBb@3','AaBb@2','2024-06-03 22:43:19',NULL,'4'),
(20,'AaBb@16','AaBb@7','2024-06-04 16:41:08','2024-06-05 17:30:19','3'),
(21,'AaBb@2','AaBb@7','2024-06-04 17:01:29','2024-06-06 08:30:19','1');
/*!40000 ALTER TABLE `order_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `orderdetailviewforloginuser`
--

DROP TABLE IF EXISTS `orderdetailviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `orderdetailviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderdetailviewforloginuser` AS SELECT
 1 AS `ord_id`,
  1 AS `goods_id`,
  1 AS `ord_quantity`,
  1 AS `description` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `orderform_delete_viewforloginuser`
--

DROP TABLE IF EXISTS `orderform_delete_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `orderform_delete_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderform_delete_viewforloginuser` AS SELECT
 1 AS `ord_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `orderform_fcutst_viewforloginuser`
--

DROP TABLE IF EXISTS `orderform_fcutst_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `orderform_fcutst_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderform_fcutst_viewforloginuser` AS SELECT
 1 AS `ord_id`,
  1 AS `ord_buyer`,
  1 AS `ord_seller`,
  1 AS `ord_ordtime`,
  1 AS `ord_endtime`,
  1 AS `ord_state` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `orderform_insert_viewforloginuser`
--

DROP TABLE IF EXISTS `orderform_insert_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `orderform_insert_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderform_insert_viewforloginuser` AS SELECT
 1 AS `ord_id`,
  1 AS `ord_buyer`,
  1 AS `ord_seller`,
  1 AS `ord_ordtime` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `orderform_select_arscbc_viewforloginuser`
--

DROP TABLE IF EXISTS `orderform_select_arscbc_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `orderform_select_arscbc_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderform_select_arscbc_viewforloginuser` AS SELECT
 1 AS `ord_id`,
  1 AS `ord_buyer`,
  1 AS `ord_seller`,
  1 AS `ord_ordtime`,
  1 AS `ord_state` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `orderform_st_viewforadmin`
--

DROP TABLE IF EXISTS `orderform_st_viewforadmin`;
/*!50001 DROP VIEW IF EXISTS `orderform_st_viewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderform_st_viewforadmin` AS SELECT
 1 AS `ord_id`,
  1 AS `ord_buyer`,
  1 AS `ord_seller`,
  1 AS `ord_ordtime`,
  1 AS `ord_endtime`,
  1 AS `ord_state` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `orderform_update_arscbc_viewforloginuser`
--

DROP TABLE IF EXISTS `orderform_update_arscbc_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `orderform_update_arscbc_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orderform_update_arscbc_viewforloginuser` AS SELECT
 1 AS `ord_id`,
  1 AS `ord_state`,
  1 AS `ord_endtime` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ordermessage`
--

DROP TABLE IF EXISTS `ordermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordermessage` (
  `msg_id` int(11) NOT NULL,
  `ord_id` int(11) NOT NULL,
  KEY `msg_id` (`msg_id`),
  KEY `ord_id` (`ord_id`),
  CONSTRAINT `ordermessage_ibfk_1` FOREIGN KEY (`msg_id`) REFERENCES `mail` (`mail_id`),
  CONSTRAINT `ordermessage_ibfk_2` FOREIGN KEY (`ord_id`) REFERENCES `order_form` (`ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordermessage`
--

LOCK TABLES `ordermessage` WRITE;
/*!40000 ALTER TABLE `ordermessage` DISABLE KEYS */;
INSERT INTO `ordermessage` VALUES
(1,1),
(2,1),
(9,6),
(15,11),
(16,12),
(17,15),
(18,17),
(19,20),
(20,14),
(21,15),
(22,15),
(23,16),
(24,16),
(25,5),
(26,4),
(4,15),
(7,17),
(8,20),
(11,14),
(12,15),
(13,15),
(33,16),
(34,16),
(35,5),
(36,4);
/*!40000 ALTER TABLE `ordermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ordermessageforadmin`
--

DROP TABLE IF EXISTS `ordermessageforadmin`;
/*!50001 DROP VIEW IF EXISTS `ordermessageforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ordermessageforadmin` AS SELECT
 1 AS `msg_id`,
  1 AS `ord_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ordermessageviewforloginuser`
--

DROP TABLE IF EXISTS `ordermessageviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `ordermessageviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ordermessageviewforloginuser` AS SELECT
 1 AS `msg_id`,
  1 AS `ord_id` */;
SET character_set_client = @saved_cs_client;

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
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
('AaBb@1','F_user','1','41043170@gm.nfu.edu.tw'),
('AaBb@10','QQ_noname1111','3','41043179@gm.nfu.edu.tw'),
('AaBb@11','QQ_noname1212','1','41043180@gm.nfu.edu.tw'),
('AaBb@12','koala0123','2','41043117@gm.nfu.edu.tw'),
('AaBb@13','qq','1','41043181@gm.nfu.edu.tw'),
('AaBb@14','test1','2','41043182@gm.nfu.edu.tw'),
('AaBb@15','test2','1','41043183@gm.nfu.edu.tw'),
('AaBb@16','test3','2','41043184@gm.nfu.edu.tw'),
('AaBb@2','張三_123','2','41043171@gm.nfu.edu.tw'),
('AaBb@3','小老_第','3','41043172@gm.nfu.edu.tw'),
('AaBb@4','小天_123aca','1','41043173@gm.nfu.edu.tw'),
('AaBb@5','小王_aabbcc','1','41043174@gm.nfu.edu.tw'),
('AaBb@6','dada_17854','1','41043175@gm.nfu.edu.tw'),
('AaBb@7','smallname_大壯0017','2','41043176@gm.nfu.edu.tw'),
('AaBb@8','smallname_大壯0019','1','41043177@gm.nfu.edu.tw'),
('AaBb@9','李四大爺_99','1','41043178@gm.nfu.edu.tw');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `user_insert_viewforunloginuser`
--

DROP TABLE IF EXISTS `user_insert_viewforunloginuser`;
/*!50001 DROP VIEW IF EXISTS `user_insert_viewforunloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_insert_viewforunloginuser` AS SELECT
 1 AS `user_id`,
  1 AS `user_name`,
  1 AS `user_state`,
  1 AS `user_email` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_select_viewforloginuser`
--

DROP TABLE IF EXISTS `user_select_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `user_select_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_select_viewforloginuser` AS SELECT
 1 AS `user_id`,
  1 AS `user_name`,
  1 AS `user_email` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_select_viewforunloginuser`
--

DROP TABLE IF EXISTS `user_select_viewforunloginuser`;
/*!50001 DROP VIEW IF EXISTS `user_select_viewforunloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_select_viewforunloginuser` AS SELECT
 1 AS `user_id` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `user_update_viewforloginuser`
--

DROP TABLE IF EXISTS `user_update_viewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `user_update_viewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_update_viewforloginuser` AS SELECT
 1 AS `user_name`,
  1 AS `user_email` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usermessage`
--

DROP TABLE IF EXISTS `usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermessage` (
  `msg_id` int(11) NOT NULL,
  `msg_msg` varchar(100) DEFAULT NULL,
  KEY `msg_id` (`msg_id`),
  CONSTRAINT `usermessage_ibfk_1` FOREIGN KEY (`msg_id`) REFERENCES `mail` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermessage`
--

LOCK TABLES `usermessage` WRITE;
/*!40000 ALTER TABLE `usermessage` DISABLE KEYS */;
INSERT INTO `usermessage` VALUES
(4,'我想要Python程式設計：從入門到進階應用這本書'),
(7,'商用微積分還有嗎?'),
(8,'我想要ISE Engineering Circuit Analysis這本書'),
(11,'Electronic Devices and Circuit Theory還有賣嗎?'),
(12,'Fundamentals of Data Structures這本還有嗎?'),
(13,'ISE Engineering Circuit Analysis還有庫存嗎?'),
(33,'請問在嗎?'),
(34,'Electronic Devices and Circuit Theory賣完了嗎? '),
(35,'???'),
(36,'有人嗎???');
/*!40000 ALTER TABLE `usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `usermessageviewforloginuser`
--

DROP TABLE IF EXISTS `usermessageviewforloginuser`;
/*!50001 DROP VIEW IF EXISTS `usermessageviewforloginuser`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usermessageviewforloginuser` AS SELECT
 1 AS `msg_id`,
  1 AS `msg_msg` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `userviewforadmin`
--

DROP TABLE IF EXISTS `userviewforadmin`;
/*!50001 DROP VIEW IF EXISTS `userviewforadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userviewforadmin` AS SELECT
 1 AS `user_id`,
  1 AS `user_name`,
  1 AS `user_email`,
  1 AS `user_state` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `bookviewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `bookviewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookviewforadmin` AS select `instructor`.`ins_id` AS `ins_id`,`instructor`.`ins_name` AS `ins_name`,`instructor`.`dep_id` AS `dep_id` from `instructor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bookviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `bookviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bookviewforloginuser` AS select `book`.`isbn` AS `isbn`,`book`.`book_name` AS `book_name` from `book` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `courseviewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `courseviewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `courseviewforadmin` AS select `course`.`cou_id` AS `cou_id`,`course`.`cou_title` AS `cou_title`,`course`.`isbn` AS `isbn`,`course`.`ins_id` AS `ins_id`,`course`.`dep_id` AS `dep_id` from `course` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `courseviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `courseviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `courseviewforloginuser` AS select `course`.`cou_id` AS `cou_id`,`course`.`cou_title` AS `cou_title`,`course`.`isbn` AS `isbn`,`course`.`ins_id` AS `ins_id`,`course`.`dep_id` AS `dep_id` from `course` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `courseviewforunloginuser`
--

/*!50001 DROP VIEW IF EXISTS `courseviewforunloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `courseviewforunloginuser` AS select `course`.`cou_id` AS `cou_id`,`course`.`cou_title` AS `cou_title`,`course`.`isbn` AS `isbn`,`course`.`ins_id` AS `ins_id`,`course`.`dep_id` AS `dep_id` from `course` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departmentviewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `departmentviewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departmentviewforadmin` AS select `department`.`dep_id` AS `dep_id`,`department`.`dep_name` AS `dep_name` from `department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departmentviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `departmentviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departmentviewforloginuser` AS select `department`.`dep_id` AS `dep_id`,`department`.`dep_name` AS `dep_name` from `department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `departmentviewforunloginuser`
--

/*!50001 DROP VIEW IF EXISTS `departmentviewforunloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `departmentviewforunloginuser` AS select `department`.`dep_id` AS `dep_id`,`department`.`dep_name` AS `dep_name` from `department` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goods_insert_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `goods_insert_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_insert_viewforloginuser` AS select `goods`.`goods_id` AS `goods_id`,`goods`.`isbn` AS `isbn`,`goods`.`goods_name` AS `goods_name`,`goods`.`description` AS `description`,`goods`.`user_id` AS `user_id`,`goods`.`price` AS `price`,`goods`.`number` AS `number` from `goods` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goods_name_update_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `goods_name_update_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_name_update_viewforloginuser` AS select `goods`.`goods_id` AS `goods_id`,`goods`.`goods_name` AS `goods_name`,`goods`.`description` AS `description`,`goods`.`price` AS `price`,`goods`.`number` AS `number` from `goods` where `goods`.`number` >= 0 and !(`goods`.`isbn` in (select `book`.`isbn` from `book`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goods_select_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `goods_select_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_select_viewforloginuser` AS select `goods`.`goods_id` AS `goods_id`,`goods`.`isbn` AS `isbn`,`goods`.`goods_name` AS `goods_name`,`goods`.`description` AS `description`,`goods`.`user_id` AS `user_id`,`goods`.`price` AS `price`,`goods`.`number` AS `number` from `goods` where `goods`.`number` >= 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goods_update_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `goods_update_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goods_update_viewforloginuser` AS select `goods`.`goods_id` AS `goods_id`,`goods`.`description` AS `description`,`goods`.`price` AS `price`,`goods`.`number` AS `number` from `goods` where `goods`.`number` >= 0 and `goods`.`isbn` in (select `book`.`isbn` from `book`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goodsuploadmessageviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `goodsuploadmessageviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goodsuploadmessageviewforloginuser` AS select `goodsuploadmessage`.`msg_id` AS `msg_id`,`goodsuploadmessage`.`goods_id` AS `goods_id` from `goodsuploadmessage` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goodsviewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `goodsviewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goodsviewforadmin` AS select `goods`.`goods_id` AS `goods_id`,`goods`.`isbn` AS `isbn`,`goods`.`goods_name` AS `goods_name`,`goods`.`description` AS `description`,`goods`.`user_id` AS `user_id`,`goods`.`price` AS `price`,`goods`.`number` AS `number` from `goods` where `goods`.`number` >= -1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `goodsviewforunloginuser`
--

/*!50001 DROP VIEW IF EXISTS `goodsviewforunloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `goodsviewforunloginuser` AS select `goods`.`goods_id` AS `goods_id`,`goods`.`isbn` AS `isbn`,`goods`.`goods_name` AS `goods_name`,`goods`.`description` AS `description`,`goods`.`user_id` AS `user_id`,`goods`.`price` AS `price`,`goods`.`number` AS `number` from `goods` where `goods`.`number` > 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `instructorviewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `instructorviewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instructorviewforadmin` AS select `instructor`.`ins_id` AS `ins_id`,`instructor`.`ins_name` AS `ins_name`,`instructor`.`dep_id` AS `dep_id` from `instructor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `instructorviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `instructorviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instructorviewforloginuser` AS select `instructor`.`ins_id` AS `ins_id`,`instructor`.`ins_name` AS `ins_name`,`instructor`.`dep_id` AS `dep_id` from `instructor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `instructorviewforunloginuser`
--

/*!50001 DROP VIEW IF EXISTS `instructorviewforunloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `instructorviewforunloginuser` AS select `instructor`.`ins_id` AS `ins_id`,`instructor`.`ins_name` AS `ins_name`,`instructor`.`dep_id` AS `dep_id` from `instructor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mail_insert_viewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `mail_insert_viewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mail_insert_viewforadmin` AS select `mail`.`mail_id` AS `mail_id`,`mail`.`user_id` AS `user_id`,`mail`.`mail_state` AS `mail_state` from `mail` where `mail`.`mail_type` = '4' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mail_select_viewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `mail_select_viewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mail_select_viewforadmin` AS select `mail`.`mail_id` AS `mail_id`,`mail`.`user_id` AS `user_id`,`mail`.`sender_id` AS `sender_id`,`mail`.`mail_type` AS `mail_type`,`mail`.`mail_state` AS `mail_state` from `mail` where `mail`.`mail_type` = '4' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mailviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `mailviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mailviewforloginuser` AS select `mail`.`mail_id` AS `mail_id`,`mail`.`user_id` AS `user_id`,`mail`.`sender_id` AS `sender_id`,`mail`.`mail_type` AS `mail_type`,`mail`.`mail_state` AS `mail_state` from `mail` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `notification_select_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `notification_select_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `notification_select_viewforloginuser` AS select `notification`.`nfy_id` AS `nfy_id`,`notification`.`user_id` AS `user_id`,`notification`.`nfy_searchsetting` AS `nfy_searchsetting` from `notification` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `notification_update_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `notification_update_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `notification_update_viewforloginuser` AS select `notification`.`nfy_id` AS `nfy_id`,`notification`.`nfy_searchsetting` AS `nfy_searchsetting` from `notification` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderdetailviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `orderdetailviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderdetailviewforloginuser` AS select `order_detail`.`ord_id` AS `ord_id`,`order_detail`.`goods_id` AS `goods_id`,`order_detail`.`ord_quantity` AS `ord_quantity`,`order_detail`.`description` AS `description` from `order_detail` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderform_delete_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `orderform_delete_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderform_delete_viewforloginuser` AS select `order_form`.`ord_id` AS `ord_id` from `order_form` where `order_form`.`ord_state` = '0' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderform_fcutst_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `orderform_fcutst_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderform_fcutst_viewforloginuser` AS select `order_form`.`ord_id` AS `ord_id`,`order_form`.`ord_buyer` AS `ord_buyer`,`order_form`.`ord_seller` AS `ord_seller`,`order_form`.`ord_ordtime` AS `ord_ordtime`,`order_form`.`ord_endtime` AS `ord_endtime`,`order_form`.`ord_state` AS `ord_state` from `order_form` where `order_form`.`ord_state` >= '4' and `order_form`.`ord_state` <= '6' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderform_insert_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `orderform_insert_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderform_insert_viewforloginuser` AS select `order_form`.`ord_id` AS `ord_id`,`order_form`.`ord_buyer` AS `ord_buyer`,`order_form`.`ord_seller` AS `ord_seller`,`order_form`.`ord_ordtime` AS `ord_ordtime` from `order_form` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderform_select_arscbc_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `orderform_select_arscbc_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderform_select_arscbc_viewforloginuser` AS select `order_form`.`ord_id` AS `ord_id`,`order_form`.`ord_buyer` AS `ord_buyer`,`order_form`.`ord_seller` AS `ord_seller`,`order_form`.`ord_ordtime` AS `ord_ordtime`,`order_form`.`ord_state` AS `ord_state` from `order_form` where `order_form`.`ord_state` >= '0' and `order_form`.`ord_state` <= '3' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderform_st_viewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `orderform_st_viewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderform_st_viewforadmin` AS select `order_form`.`ord_id` AS `ord_id`,`order_form`.`ord_buyer` AS `ord_buyer`,`order_form`.`ord_seller` AS `ord_seller`,`order_form`.`ord_ordtime` AS `ord_ordtime`,`order_form`.`ord_endtime` AS `ord_endtime`,`order_form`.`ord_state` AS `ord_state` from `order_form` where `order_form`.`ord_state` = '6' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderform_update_arscbc_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `orderform_update_arscbc_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderform_update_arscbc_viewforloginuser` AS select `order_form`.`ord_id` AS `ord_id`,`order_form`.`ord_state` AS `ord_state`,`order_form`.`ord_endtime` AS `ord_endtime` from `order_form` where `order_form`.`ord_state` >= '0' and `order_form`.`ord_state` <= '3' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordermessageforadmin`
--

/*!50001 DROP VIEW IF EXISTS `ordermessageforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordermessageforadmin` AS select `ordermessage`.`msg_id` AS `msg_id`,`ordermessage`.`ord_id` AS `ord_id` from `ordermessage` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordermessageviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `ordermessageviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordermessageviewforloginuser` AS select `ordermessage`.`msg_id` AS `msg_id`,`ordermessage`.`ord_id` AS `ord_id` from `ordermessage` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_insert_viewforunloginuser`
--

/*!50001 DROP VIEW IF EXISTS `user_insert_viewforunloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_insert_viewforunloginuser` AS select `user`.`user_id` AS `user_id`,`user`.`user_name` AS `user_name`,`user`.`user_state` AS `user_state`,`user`.`user_email` AS `user_email` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_select_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `user_select_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_select_viewforloginuser` AS select `user`.`user_id` AS `user_id`,`user`.`user_name` AS `user_name`,`user`.`user_email` AS `user_email` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_select_viewforunloginuser`
--

/*!50001 DROP VIEW IF EXISTS `user_select_viewforunloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_select_viewforunloginuser` AS select `user`.`user_id` AS `user_id` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_update_viewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `user_update_viewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_update_viewforloginuser` AS select `user`.`user_name` AS `user_name`,`user`.`user_email` AS `user_email` from `user` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usermessageviewforloginuser`
--

/*!50001 DROP VIEW IF EXISTS `usermessageviewforloginuser`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usermessageviewforloginuser` AS select `usermessage`.`msg_id` AS `msg_id`,`usermessage`.`msg_msg` AS `msg_msg` from `usermessage` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userviewforadmin`
--

/*!50001 DROP VIEW IF EXISTS `userviewforadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userviewforadmin` AS select `user`.`user_id` AS `user_id`,`user`.`user_name` AS `user_name`,`user`.`user_email` AS `user_email`,`user`.`user_state` AS `user_state` from `user` */;
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

-- Dump completed on 2024-06-17  2:29:08
