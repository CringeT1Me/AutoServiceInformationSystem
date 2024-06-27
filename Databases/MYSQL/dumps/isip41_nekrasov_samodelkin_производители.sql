-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: C13625814    Database: isip41_nekrasov_samodelkin
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `производители`
--

DROP TABLE IF EXISTS `производители`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `производители` (
  `ID_Производителя` int NOT NULL AUTO_INCREMENT,
  `Наименование` varchar(50) NOT NULL,
  `ДатаНачалаРаботы` datetime NOT NULL,
  PRIMARY KEY (`ID_Производителя`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `производители`
--

LOCK TABLES `производители` WRITE;
/*!40000 ALTER TABLE `производители` DISABLE KEYS */;
INSERT INTO `производители` VALUES (1,'Profix','2017-10-02 00:00:00'),(2,'Pierburg','2017-01-10 00:00:00'),(3,'Honda','2016-06-12 00:00:00'),(4,'Benson','2015-04-09 00:00:00'),(5,'Mazda','2018-01-23 00:00:00'),(6,'Zekkert','2018-03-08 00:00:00'),(7,'Ferodo','2015-08-11 00:00:00'),(8,'Lemforder','2016-11-15 00:00:00'),(9,'Toyota','2016-06-03 00:00:00'),(10,'Automega','2016-07-01 00:00:00'),(11,'Magneti Marelli','2017-05-27 00:00:00'),(12,'Nissan','2015-01-21 00:00:00'),(13,'Airline','2016-03-26 00:00:00'),(14,'BILSTEIN','2018-03-06 00:00:00'),(15,'Petro-Canada','2017-03-22 00:00:00'),(16,'Bendix','2015-04-25 00:00:00'),(17,'Mercedes','2016-03-16 00:00:00'),(18,'Mitsubishi','2017-04-23 00:00:00'),(19,'Motul','2018-01-07 00:00:00'),(20,'Shell','2016-11-14 00:00:00'),(21,'Liqui Moly','2015-03-24 00:00:00'),(22,'Mando','2015-03-24 00:00:00'),(23,'LUK','2015-12-02 00:00:00'),(24,'76','2017-02-03 00:00:00'),(25,'Kayaba','2016-02-08 00:00:00'),(26,'Total','2015-03-05 00:00:00'),(27,'ASHIKA','2018-06-13 00:00:00'),(28,'VAG','2018-05-16 00:00:00'),(29,'King Bearings','2016-09-12 00:00:00'),(30,'Castrol','2015-04-16 00:00:00'),(31,'Hyundai/Kia','2016-01-07 00:00:00'),(32,'Opel','2015-03-04 00:00:00'),(33,'Idemitsu','2018-01-21 00:00:00'),(34,'Stels','2017-05-16 00:00:00'),(35,'BOGE','2016-01-18 00:00:00'),(36,'Glaser','2015-12-29 00:00:00'),(37,'Goodyear','2015-12-05 00:00:00'),(38,'Suzuki','2017-05-18 00:00:00'),(39,'ZIMMERMANN','2017-12-14 00:00:00'),(40,'Mobil','2016-10-24 00:00:00'),(41,'OPTIMAL','2016-08-19 00:00:00'),(42,'ZIC','2015-02-07 00:00:00'),(43,'Ford','2016-10-12 00:00:00'),(44,'General Motors','2016-10-05 00:00:00'),(45,'KASHIYAMA','2015-10-16 00:00:00'),(46,'ALСA','2016-10-01 00:00:00'),(47,'Airtex','2015-10-21 00:00:00'),(48,'Elf','2016-10-16 00:00:00'),(49,'BOSCH','2017-06-21 00:00:00'),(50,'Lukoil','2017-12-19 00:00:00');
/*!40000 ALTER TABLE `производители` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24 13:57:06
