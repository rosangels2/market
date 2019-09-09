CREATE DATABASE  IF NOT EXISTS `market` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `market`;
-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: market
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `file` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `item_no` int(11) NOT NULL,
  `route` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_file_board1_idx` (`item_no`),
  CONSTRAINT `fk_file_itemNo` FOREIGN KEY (`item_no`) REFERENCES `item` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` VALUES (3,1,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I'),(5,2,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I'),(6,3,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I'),(7,4,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I'),(8,5,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I'),(9,3,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I'),(10,3,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I'),(11,3,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I'),(12,3,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','I');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-09 17:14:55
