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
-- Table structure for table `bag`
--

DROP TABLE IF EXISTS `bag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bag` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `item_no` int(11) NOT NULL,
  `option_no` int(11) DEFAULT NULL,
  `select` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_bag_member1_idx` (`id`),
  KEY `fk_bag_item1_idx` (`item_no`),
  KEY `fk_bag_option1_idx` (`option_no`),
  CONSTRAINT `fk_bag_item1` FOREIGN KEY (`item_no`) REFERENCES `item` (`no`),
  CONSTRAINT `fk_bag_member1` FOREIGN KEY (`id`) REFERENCES `member` (`ID`),
  CONSTRAINT `fk_bag_option1` FOREIGN KEY (`option_no`) REFERENCES `option` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bag`
--

LOCK TABLES `bag` WRITE;
/*!40000 ALTER TABLE `bag` DISABLE KEYS */;
INSERT INTO `bag` VALUES (1,'z11111111',3,6,'로지텍g2','레드+(20000)',1,50000,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','D'),(2,'z11111111',3,16,'로지텍g4','레인보우(+20000)',1,50000,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','D'),(3,'z11111111',3,17,'로지텍g4','화이트(+10000)',2,80000,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','D'),(4,'z11111111',3,8,'로지텍g3','옐로(+10000)',3,120000,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','D'),(5,'z11111111',3,16,'로지텍g4','레인보우(+20000)',1,50000,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','D'),(6,'z11111111',3,5,'로지텍g2','블랙',1,30000,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','I'),(7,'z11111111',3,8,'로지텍g3','옐로(+10000)',2,80000,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','D'),(8,'z11111111',3,16,'로지텍g4','레인보우(+20000)',3,150000,'/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','D');
/*!40000 ALTER TABLE `bag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-17 17:19:52
