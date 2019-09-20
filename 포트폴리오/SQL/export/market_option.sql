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
-- Table structure for table `option`
--

DROP TABLE IF EXISTS `option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `option` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `item_no` int(11) NOT NULL,
  `item_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `select` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_option_item1_idx` (`item_no`),
  CONSTRAINT `fk_option_item1` FOREIGN KEY (`item_no`) REFERENCES `item` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option`
--

LOCK TABLES `option` WRITE;
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` VALUES (18,22,'배틀그라운드 데스크탑','gtx1060 데스크탑','블루',333,880000,'I'),(19,22,'배틀그라운드 데스크탑','gtx1060 데스크탑','화이트',292,900000,'I'),(20,23,'배그 최상옵 데스크탑','gtx1070 데스크탑','화이트',222,1200000,'I'),(21,23,'배그 최상옵 데스크탑','gtx1070 데스크탑','레인보우(+50000)',102,1250000,'I');
/*!40000 ALTER TABLE `option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 17:16:56
