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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `kind` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `detail` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `valid` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'I',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'컴퓨터','컴퓨터','I'),(2,'컴퓨터','노트북','I'),(3,'컴퓨터','저장장치','I'),(4,'컴퓨터','모니터','I'),(5,'컴퓨터','주변기기','I'),(6,'가전제품','냉장고','I'),(7,'가전제품','세탁기','I'),(8,'가전제품','계절 가전제품','I'),(9,'가전제품','미용 가전제품','I'),(10,'가전제품','음향 가전제품','I'),(11,'식품','신선식품','I'),(12,'식품','가공식품','I'),(13,'식품','저장식품','I'),(14,'식품','커피/음료','I'),(15,'식품','빵/과자','I'),(16,'스포츠','스포츠의류','I'),(17,'스포츠','휘트니스','I'),(18,'스포츠','레저','I'),(19,'스포츠','자전거','I'),(20,'스포츠','등산','I'),(21,'자동차','자동차 공구','I'),(22,'자동차','자동차 부품','I'),(23,'자동차','자동차 용품','I'),(24,'자동차','자동차 뷰티용품','I'),(25,'도서','국내도서','I'),(26,'도서','해외도서','I'),(27,'도서','만화','I'),(28,'도서','교재','I'),(29,'도서','요리','I'),(30,'도서','어학','I'),(31,'유아동','기저귀','I'),(32,'유아동','분유','I'),(33,'유아동','장난감','I'),(34,'유아동','의류','I'),(35,'의류','신발','I'),(36,'의류','장갑','I'),(37,'의류','남성의류','I'),(38,'의류','여성의류','I'),(39,'의류','가방','I'),(40,'악세사리','시계','I'),(41,'악세사리','쥬얼리','I'),(42,'뷰티','화장품','I'),(43,'뷰티','향수','I'),(44,'뷰티','바디','I'),(45,'뷰티','헤어','I'),(46,'생필품','바디','I'),(47,'생필품','헤어','I'),(48,'생필품','화장지','I'),(49,'생필품','물티슈','I'),(50,'생필품','생리대','I'),(51,'생필품','세제','I'),(52,'반려동물','간식','I'),(53,'반려동물','사료','I'),(54,'반려동물','미용품','I'),(55,'반려동물','의류','I'),(56,'반려동물','장난감','I');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-20 16:49:07
