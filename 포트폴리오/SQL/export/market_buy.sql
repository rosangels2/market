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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` VALUES (10,'z11111111',3,3,'로지텍g1','블랙',1,30000,'요청 사항 없음','/2019/08/23/5958a72a-148f-4f64-8320-9fde8740cbc9_market.jpg','2019-08-28 15:52:08','배송 완료','I'),(11,'z11111111',3,6,'로지텍g2','레드',2,100000,'요청 사항 없음','/2019/08/23/202b5782-4ffc-41a4-a52f-bec098cde483_market.jpg','2019-08-28 15:52:08','배송 완료','I'),(12,'z11111111',3,8,'로지텍g3','옐로',3,120000,'요청 사항 없음','/2019/08/23/7b15317c-6d35-4e04-a801-17237e4f8ef3_market.jpg','2019-08-28 15:52:08','배송 완료','I'),(13,'z11111111',3,4,'로지텍g1','레드',1,40000,'부재 시, 경비실에 맡겨 주세요','/2019/08/23/7b15317c-6d35-4e04-a801-17237e4f8ef3_market.jpg','2019-08-30 10:17:17','배송 대기','I'),(14,'z11111111',3,7,'로지텍g3','그레이',2,60000,'부재 시, 경비실에 맡겨 주세요','/2019/08/23/7b15317c-6d35-4e04-a801-17237e4f8ef3_market.jpg','2019-08-30 10:17:17','배송 대기','I'),(15,'z11111111',3,7,'로지텍g3','그레이',3,90000,'조심히 가져다 주세요','/2019/08/23/7b15317c-6d35-4e04-a801-17237e4f8ef3_market.jpg','2019-08-30 10:24:12','배송 대기','I');
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

-- Dump completed on 2019-09-05 17:20:49
