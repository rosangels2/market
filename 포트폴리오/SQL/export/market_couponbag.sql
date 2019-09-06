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
-- Table structure for table `couponbag`
--

DROP TABLE IF EXISTS `couponbag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `couponbag` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `coupon_no` int(11) NOT NULL,
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_couponBag_member1_idx` (`id`),
  KEY `fk_couponBag_coupon1_idx` (`coupon_no`),
  CONSTRAINT `fk_couponBag_coupon1` FOREIGN KEY (`coupon_no`) REFERENCES `coupon` (`no`),
  CONSTRAINT `fk_couponBag_member1` FOREIGN KEY (`id`) REFERENCES `member` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `couponbag`
--

LOCK TABLES `couponbag` WRITE;
/*!40000 ALTER TABLE `couponbag` DISABLE KEYS */;
INSERT INTO `couponbag` VALUES (1,'z11111111',1,'D'),(2,'z11111111',2,'I'),(6,'z11111111',3,'I'),(7,'z1111111',6,'I'),(8,'z1111111',5,'I'),(9,'z1111111',4,'I'),(10,'z1111111',3,'I'),(11,'z1111111',2,'I');
/*!40000 ALTER TABLE `couponbag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-06 17:23:17
