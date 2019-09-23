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
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buy` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `item_no` int(11) NOT NULL,
  `seller_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `option_no` int(11) DEFAULT NULL,
  `select` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `detail` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `request` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '배송 대기',
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_buy_member1_idx` (`id`),
  KEY `fk_buy_item1_idx` (`item_no`),
  KEY `fk_buy_option1_idx` (`option_no`),
  CONSTRAINT `fk_buy_item1` FOREIGN KEY (`item_no`) REFERENCES `item` (`no`),
  CONSTRAINT `fk_buy_member1` FOREIGN KEY (`id`) REFERENCES `member` (`ID`),
  CONSTRAINT `fk_buy_option1` FOREIGN KEY (`option_no`) REFERENCES `option` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (28,'z1111111',131,'z11111111',140,'반려동물 점퍼','그린',2,80000,'요청 사항 없음','/2019/09/22/1ede24b8-4f1c-4a26-a00a-91419f35cb00_의류.jpg','2019-09-23 09:56:00','배송중','I'),(29,'z1111111',132,'z11111111',141,'계란모양 장난감','3개',3,30000,'요청 사항 없음','/2019/09/22/de04f540-ea5e-4aef-838a-3861745a3d05_장난감.jpg','2019-09-23 11:35:19','배송 대기','I');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-23 12:06:05
