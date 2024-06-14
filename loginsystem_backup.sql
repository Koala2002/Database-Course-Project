-- MariaDB dump 10.19  Distrib 10.11.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: loginsystem
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
-- Table structure for table `login_inf`
--

DROP TABLE IF EXISTS `login_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_inf` (
  `user_id` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `last_ip` varchar(50) DEFAULT NULL,
  `status` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `last_ip` (`last_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_inf`
--

LOCK TABLES `login_inf` WRITE;
/*!40000 ALTER TABLE `login_inf` DISABLE KEYS */;
INSERT INTO `login_inf` VALUES
('AaBb@1','AaBb@1',NULL,'0'),
('AaBb@10','AaBb@10',NULL,'0'),
('AaBb@11','AaBb@11',NULL,'0'),
('AaBb@12','AaBb@12',NULL,'0'),
('AaBb@13','AaBb@13',NULL,'0'),
('AaBb@14','AaBb@14',NULL,'0'),
('AaBb@15','AaBb@15',NULL,'0'),
('AaBb@16','AaBb@16',NULL,'0'),
('AaBb@2','AaBb@2',NULL,'0'),
('AaBb@3','AaBb@3',NULL,'0'),
('AaBb@4','AaBb@4',NULL,'0'),
('AaBb@5','AaBb@5',NULL,'0'),
('AaBb@6','AaBb@6',NULL,'0'),
('AaBb@7','AaBb@7',NULL,'0'),
('AaBb@8','AaBb@8',NULL,'0'),
('AaBb@9','AaBb@9',NULL,'0');
/*!40000 ALTER TABLE `login_inf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-14 23:56:36
