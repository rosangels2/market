CREATE DATABASE  IF NOT EXISTS `market` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `market`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `category_no` int(11) NOT NULL,
  `seller_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `information` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT CURRENT_TIMESTAMP,
  `commend` int(11) NOT NULL DEFAULT '0',
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_item_category1_idx` (`category_no`),
  CONSTRAINT `fk_item_category1` FOREIGN KEY (`category_no`) REFERENCES `category` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,1,'z11111111','1',1,'1','/2019/08/23/7b15317c-6d35-4e04-a801-17237e4f8ef3_market.jpg','2019-08-23 10:35:12',0,'I'),(2,1,'z11111111','로지텍 마우스',30000,NULL,'/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','2019-08-23 10:47:50',0,'I'),(3,1,'z11111111','로지텍 마우스',30000,NULL,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','2019-08-23 10:52:46',0,'I'),(4,1,'z11111111','로지텍 마우스',30000,NULL,'/2019/08/23/620260db-e219-41d6-8ee3-a1b4d914fb6c_market.jpg','2019-08-23 10:56:03',0,'I'),(5,1,'z11111111','로지텍 마우스',30000,NULL,'/2019/08/23/b9436073-c2ad-4428-a4da-52373acfab67_market.jpg','2019-08-23 11:02:08',0,'I');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-01 22:06:25
