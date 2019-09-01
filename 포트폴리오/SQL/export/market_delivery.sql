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
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `buy_no` int(11) NOT NULL,
  `seller_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `contents` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `request` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `start` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `end` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `company` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `deliverer` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`),
  KEY `fk_delivery_buy1_idx` (`buy_no`),
  CONSTRAINT `fk_delivery_buy1` FOREIGN KEY (`buy_no`) REFERENCES `buy` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (7,10,'로지텍공식판매점','선택 상품 : 로지텍g1 / 선택 옵션 : 블랙 / 수량 : 1','요청 사항 없음','지구 어딘가','서울시 강변대로','현대택배','임꺽정','010-5633-3822','2019-08-29 10:16:14','2019-08-29 10:34:40','I'),(8,11,'로지텍공식판매점','선택 상품 : 로지텍g2 / 선택 옵션 : 레드 / 수량 : 2','요청 사항 없음','지구 어딘가','서울시 강변대로','대한통운','임꺽정','010-5633-3822','2019-08-29 10:57:02','2019-08-29 11:14:24','I'),(9,12,'로지텍공식판매점','선택 상품 : 로지텍g3 / 선택 옵션 : 옐로 / 수량 : 3','요청 사항 없음','지구 어딘가','서울시 강변대로','CJ택배','임꺽정','010-5633-3822','2019-08-29 11:15:15','2019-08-29 11:15:29','I'),(10,13,'로지텍공식판매점','선택 상품 : 로지텍g1 / 선택 옵션 : 레드 / 수량 : 1','부재 시, 경비실에 맡겨 주세요','지구 어딘가','충북 청주시 상당구 신선로 209',NULL,NULL,NULL,NULL,NULL,'I'),(11,14,'로지텍공식판매점','선택 상품 : 로지텍g3 / 선택 옵션 : 그레이 / 수량 : 2','부재 시, 경비실에 맡겨 주세요','지구 어딘가','충북 청주시 상당구 신선로 209',NULL,NULL,NULL,NULL,NULL,'I'),(12,15,'로지텍공식판매점','선택 상품 : 로지텍g3 / 선택 옵션 : 그레이 / 수량 : 3','조심히 가져다 주세요','지구 어딘가','충북 청주시 상당구 신선로 209',NULL,NULL,NULL,NULL,NULL,'I');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
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
