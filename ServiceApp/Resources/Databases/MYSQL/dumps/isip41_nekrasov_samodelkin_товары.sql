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
-- Table structure for table `товары`
--

DROP TABLE IF EXISTS `товары`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `товары` (
  `ID_Товара` int NOT NULL AUTO_INCREMENT,
  `НаименованиеТовара` varchar(500) NOT NULL,
  `Категория` int NOT NULL,
  `Стоимость` int NOT NULL,
  `Характеристики` varchar(255) DEFAULT NULL,
  `Описание` varchar(255) DEFAULT NULL,
  `Вес, г` int DEFAULT NULL,
  `Ширина, мм` int DEFAULT NULL,
  `Высота , мм` int DEFAULT NULL,
  `Длина, мм` int DEFAULT NULL,
  `Производитель` int NOT NULL,
  `ГлавноеИзображение` varchar(150) DEFAULT NULL,
  `Активен?` varchar(3) DEFAULT NULL,
  `ДополнительныеТовары` varchar(50) DEFAULT NULL,
  `ВторичныеИзображения` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Товара`),
  KEY `FK_category_idx` (`Категория`),
  KEY `FK_category_product_idx` (`Категория`),
  KEY `FK_manufacturer_idx` (`Производитель`),
  CONSTRAINT `FK_category_product` FOREIGN KEY (`Категория`) REFERENCES `категории товаров` (`ID_Категории`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_manufacturer` FOREIGN KEY (`Производитель`) REFERENCES `производители` (`ID_Производителя`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товары`
--

LOCK TABLES `товары` WRITE;
/*!40000 ALTER TABLE `товары` DISABLE KEYS */;
INSERT INTO `товары` VALUES (1,'Motor Oil KE900-90042-R',1,2060,'','Легендарное трио',0,0,0,0,12,'Товары автосервиса\\AD00B713.jpg','да','3;5','Товары автосервиса\\6CA0BE73.jpg;Товары автосервиса\\AD00B713.jpg'),(2,'Helix Ultra 550046361',1,2120,'','',0,0,0,0,20,'Товары автосервиса\\F310E078.jpg','да','',''),(3,'Super 3000 X1 152566',1,1820,'','',0,0,0,0,40,'Товары автосервиса\\6CA0BE73.jpg','да','',''),(4,'Turbo SYN Gasoline 05100-00441',1,1870,'','',0,0,0,0,31,'Товары автосервиса\\2B009062.jpg','да','',''),(5,'Dexos 2 95599405',1,1410,'','Описание отсутсвует',0,0,0,0,44,'Товары автосервиса\\AD00B713.jpg','да','4;2',''),(6,'Molygen New Generation 9054',1,2670,'','',0,0,0,0,21,'Товары автосервиса\\0DF0A8A4.jpg','да','',''),(7,'Top Tec 4600 8033',1,2580,'','',0,0,0,0,21,'Товары автосервиса\\B790A6AA.jpg','нет','',''),(8,'ENGINE OIL 08880-80375-GO',1,2710,'','',0,0,0,0,9,'Товары автосервиса\\CC40C869.jpg','нет','',''),(9,'Mobil 1 ESP 154285',1,2890,'','',0,0,0,0,40,'Товары автосервиса\\F490E078.jpg','да','',''),(10,'Dexos 2 93165557',1,1500,'','',0,0,0,0,44,'Товары автосервиса\\45908C52.jpg','да','',''),(11,'Super 3000 X1 Diesel 152572',1,1870,'','',0,0,0,0,40,'Товары автосервиса\\B0A0C186.jpg','да','',''),(12,'ENGINE OIL MZ 320754',1,2140,'','',0,0,0,0,18,'Товары автосервиса\\3B70C57C.jpg','да','',''),(13,'Genesis Armortech 3148675',1,1660,'','',0,0,0,0,50,'Товары автосервиса\\C9C0F036.jpg','нет','',''),(14,'Optimal Synth 3926',1,1880,'','',0,0,0,0,21,'Товары автосервиса\\EFC05011.jpg','да','',''),(15,'Optimal Synth 2293',1,2520,'','',0,0,0,0,21,'Товары автосервиса\\C310B9F3.jpg','да','',''),(16,'Evolution 900 SXR 194878',1,2010,'','',0,0,0,0,48,'Товары автосервиса\\E320BB7C.jpg','да','',''),(17,'Special C G 055 167 M4',1,4720,'','',0,0,0,0,28,'Товары автосервиса\\6730A31C.jpg','да','',''),(18,'Longlife III G 052 195 M2',1,1910,'','',0,0,0,0,28,'Товары автосервиса\\E5507A37.jpg','да','',''),(19,'Special Tec LL 8055',1,2420,'','',0,0,0,0,21,'Товары автосервиса\\B590AA7B.jpg','нет','',''),(20,'Dexos 2 19 42 002',1,1300,'','',0,0,0,0,32,'Товары автосервиса\\23F0848B.jpg','да','',''),(21,'Gasoline Fully- Synthetic 30021326-746',1,1650,'','',0,0,0,0,33,'Товары автосервиса\\27B0C883.jpg','да','',''),(22,'Formula F 15595E',1,1750,'','',0,0,0,0,43,'Товары автосервиса\\5250C855.jpg','нет','',''),(23,'Zepro Euro Spec SN/CF 1849-004',1,2400,'','',0,0,0,0,33,'Товары автосервиса\\90D0B807.jpg','да','',''),(24,'SN 08880-10705',1,2200,'','',0,0,0,0,9,'Товары автосервиса\\43909176.jpg','да','',''),(25,'Motor Oil KE900-90042',1,2020,'','',0,0,0,0,12,'Товары автосервиса\\90505D31.jpg','да','',''),(26,'Evolution 900 SXR 194839',1,2340,'','',0,0,0,0,48,'Товары автосервиса\\F8E0B138.jpg','нет','',''),(27,'SN/GF-5 SN5W30C',1,1550,'','',0,0,0,0,1,'Товары автосервиса\\5A30A7EE.jpg','да','',''),(28,'Evolution 900 SXR 194877',1,2470,'','',0,0,0,0,48,'Товары автосервиса\\E3A0B18A.jpg','да','',''),(29,'Трос буксировочный 12 тонн 54384',2,410,'','',0,0,0,0,34,'Товары автосервиса\\9750DA76.jpg','да','',''),(30,'Molygen New Generation 9042',1,2510,'','',0,0,0,0,21,'Товары автосервиса\\0D60A8A4.jpg','да','',''),(31,'QUARTZ INEO ECS 166252',1,1600,'','',0,0,0,0,26,'Товары автосервиса\\D0D08F32.jpg','да','',''),(32,'Motor Oil KE900-90032-R',1,1450,'','',0,0,0,0,12,'Товары автосервиса\\54B0795D.jpg','да','',''),(33,'Original oil Ultra 8300-77-992',1,2770,'','',0,0,0,0,5,'Товары автосервиса\\EF80D790.jpg','нет','',''),(34,'Longlife III G 052 195 M4',1,4100,'','',0,0,0,0,28,'Товары автосервиса\\D9605006.jpg','да','',''),(35,'8100 X-CESS 102870',1,3190,'','',0,0,0,0,19,'Товары автосервиса\\E9308929.jpg','да','',''),(36,'Magnatec A5 15583D',1,2220,'','',0,0,0,0,30,'Товары автосервиса\\9380C1E7.jpg','да','',''),(37,'Щетка для снега со съемным скребком GY000202',2,350,'','',0,0,0,0,37,'Товары автосервиса\\3760D73F.jpg','да','',''),(38,'Magnatec A3/B4 156E9E',1,2130,'','',0,0,0,0,30,'Товары автосервиса\\92C0C1E7.jpg','да','',''),(39,'Dexos 2 19 42 000',1,1410,'','',0,0,0,0,32,'Товары автосервиса\\2390848B.jpg','да','',''),(40,'QUARTZ 9000 FUTURE NFC 171839',1,1560,'','',0,0,0,0,26,'Товары автосервиса\\D2508F32.jpg','да','',''),(41,'Premium DPF Diesel 05200-00120',1,1460,'','',0,0,0,0,31,'Товары автосервиса\\2D709062.jpg','да','',''),(42,'Special G G 052 502 M2',1,1820,'','',0,0,0,0,28,'Товары автосервиса\\E0D0E079.jpg','да','',''),(43,'Ecstar F9000 99M00-22R02-004',1,2330,'','',0,0,0,0,38,'Товары автосервиса\\21B0E533.jpg','да','',''),(44,'Genesis Armortech 1539424',1,1710,'','',0,0,0,0,50,'Товары автосервиса\\B0F0CB59.jpg','да','',''),(45,'Helix Ultra 550046387',1,2160,'','',0,0,0,0,20,'Товары автосервиса\\F2B0E078.jpg','нет','',''),(46,'Super 3000 X1 152567',1,1550,'','',0,0,0,0,40,'Товары автосервиса\\F200BC2F.jpg','да','',''),(47,'ENGINE OIL MZ 320753',1,1590,'','',0,0,0,0,18,'Товары автосервиса\\5BB0C351.jpg','нет','',''),(48,'Mobil 1 ESP Formula 152621',1,2920,'','',0,0,0,0,40,'Товары автосервиса\\DC70BEC3.jpg','нет','',''),(49,'Genuine A000989790211BIFR',1,1530,'','',0,0,0,0,17,'Товары автосервиса\\2E30E06C.jpg','нет','',''),(50,'ULTRA 152624',1,1940,'','',0,0,0,0,40,'Товары автосервиса\\BA30C186.jpg','да','',''),(51,'Super 3000 X1 Formula FE 152564',1,1890,'','',0,0,0,0,40,'Товары автосервиса\\59B0BE73.jpg','да','',''),(52,'Zepro Euro Spec SN/CF 1849-001',1,1730,'','',0,0,0,0,33,'Товары автосервиса\\90A0B807.jpg','да','',''),(53,'Helix Ultra 550046367',1,1650,'','',0,0,0,0,20,'Товары автосервиса\\F2E0E078.jpg','нет','',''),(54,'QUARTZ 9000 FUTURE NFC 183199',1,2040,'','',0,0,0,0,26,'Товары автосервиса\\6CE0A012.jpg','да','',''),(55,'Dexos 2 93165554',1,1380,'','',0,0,0,0,44,'Товары автосервиса\\45008C52.jpg','да','',''),(56,'Formula F Fuel Economy HC 155D4B',1,1450,'','',0,0,0,0,43,'Товары автосервиса\\39A0C188.jpg','да','',''),(57,'76 08880-803ENGINE OIL-GO',1,1630,'','',0,0,0,0,9,'Товары автосервиса\\0070C563.jpg','да','',''),(58,'QUARTZ 9000 FUTURE NFC 183450',1,1660,'','',0,0,0,0,26,'Товары автосервиса\\FA90B138.jpg','да','',''),(59,'Top Tec 4100 7501',1,2580,'','',0,0,0,0,21,'Товары автосервиса\\022096CB.jpg','да','',''),(60,'Mobil 1 ESP 154279',1,1860,'','',0,0,0,0,40,'Товары автосервиса\\F460E078.jpg','да','',''),(61,'Super 3000 X1 152061',1,2010,'','',0,0,0,0,40,'Товары автосервиса\\40409946.jpg','да','',''),(62,'Super Extra Gasoline 05100-00410',1,1230,'','',0,0,0,0,31,'Товары автосервиса\\2A109062.jpg','да','',''),(63,'Dexos 2 93165556',1,1340,'','',0,0,0,0,44,'Товары автосервиса\\43E08C52.jpg','да','',''),(64,'Leichtlauf Special AA 7516',1,2360,'','',0,0,0,0,21,'Товары автосервиса\\47E07CB5.jpg','да','',''),(65,'Helix HX8 A5/B5 550046777',1,1530,'','',0,0,0,0,20,'Товары автосервиса\\F160E078.jpg','да','',''),(66,'Fuel Economy 08880-80845',1,2560,'','',0,0,0,0,9,'Товары автосервиса\\23106A35.jpg','да','',''),(67,'76 Top Tec 420061',1,3440,'','',0,0,0,0,21,'Товары автосервиса\\03D096CB.jpg','да','',''),(68,'X9 162613',1,1530,'','',0,0,0,0,42,'Товары автосервиса\\30E0C751.jpg','да','',''),(69,'EDGE Professional LL III Titanium FST 157AD6',1,1760,'','',0,0,0,0,30,'Товары автосервиса\\96E0C1E7.jpg','да','',''),(70,'Magnatec A3/B4 156E9D',1,1610,'','',0,0,0,0,30,'Товары автосервиса\\9290C1E7.jpg','да','',''),(71,'Genuine A000989790213BIFR',1,2390,'','',0,0,0,0,17,'Товары автосервиса\\2E60E06C.jpg','да','',''),(72,'Supreme Synthetic MOSYN53C16',1,1910,'','',0,0,0,0,15,'Товары автосервиса\\69C0CD62.jpg','да','',''),(73,'Helix Ultra Pro AM-L 550046353',1,2110,'','',0,0,0,0,20,'Товары автосервиса\\3DF0E4BC.jpg','да','',''),(74,'QUARTZ INEO ECS 151510',1,1920,'','',0,0,0,0,26,'Товары автосервиса\\8F609ED7.jpg','да','',''),(75,'Original oil Ultra 0530-05-TFE',1,2930,'','',0,0,0,0,5,'Товары автосервиса\\85C04040.jpg','да','',''),(76,'QUARTZ 9000 ENERGY HKS 175393',1,2830,'','',0,0,0,0,26,'Товары автосервиса\\6DD0A012.jpg','да','',''),(77,'Ultra LEO-SN 08217-99974',1,2980,'','',0,0,0,0,3,'Товары автосервиса\\97809225.jpg','да','',''),(78,'Special G G 052 502 M4',1,3090,'','',0,0,0,0,28,'Товары автосервиса\\E0A0E079.jpg','да','',''),(79,'Люкс 207465',1,1090,'','',0,0,0,0,50,'Товары автосервиса\\8E20A863.jpg','да','',''),(80,'Жилет светоотражающий взрослый ARW-AV-02',2,150,'','',0,0,0,0,13,'Товары автосервиса\\D4D0CE67.jpg','да','',''),(81,'Premium LF Gasoline 05100-00451',1,1620,'','',0,0,0,0,31,'Товары автосервиса\\2B609062.jpg','да','',''),(82,'Evolution 900 SXR 10160501',1,1750,'','',0,0,0,0,48,'Товары автосервиса\\BD80E8D5.jpg','да','',''),(83,'Zepro Touring 1845-004',1,2380,'','',0,0,0,0,33,'Товары автосервиса\\5180B90E.jpg','да','',''),(84,'76 A000989PKW Motorenol0213BLER',1,2510,'','',0,0,0,0,17,'Товары автосервиса\\2E00E06C.jpg','да','',''),(85,'QUARTZ 9000 ENERGY HKS 175392',1,1530,'','',0,0,0,0,26,'Товары автосервиса\\6DA0A012.jpg','нет','',''),(86,'Formula F 155D3A',1,1830,'','',0,0,0,0,43,'Товары автосервиса\\39D0C188.jpg','да','',''),(87,'Mobil 1 FS 153692',1,3020,'','',0,0,0,0,40,'Товары автосервиса\\6080DCD5.jpg','да','',''),(88,'Zepro Eco Medalist 3583-004',1,2520,'','',0,0,0,0,33,'Товары автосервиса\\3DA0B713.jpg','да','',''),(89,'SN 08880-10706',1,1640,'','',0,0,0,0,9,'Товары автосервиса\\43C09176.jpg','да','',''),(90,'Dexos 2 19 42 003',1,1490,'','',0,0,0,0,32,'Товары автосервиса\\8430842A.jpg','да','',''),(91,'ENGINE OIL 08880-80365-GO',1,3580,'','',0,0,0,0,9,'Товары автосервиса\\CC10C869.jpg','да','',''),(92,'EDGE LL Titanium FST 15669A',1,3000,'','',0,0,0,0,30,'Товары автосервиса\\8BC0C1A9.jpg','да','',''),(93,'QUARTZ 9000 148597',1,1700,'','',0,0,0,0,26,'Товары автосервиса\\8F909ED7.jpg','нет','',''),(94,'ENGINE OIL MZ 320756',1,1600,'','',0,0,0,0,18,'Товары автосервиса\\5BE0C351.jpg','нет','',''),(95,'Кредитница, Кожа B6 6 95 1349',2,6770,'','',0,0,0,0,17,'Товары автосервиса\\63C09E91.jpg','да','',''),(96,'Zepro Touring 1845-001',1,1720,'','',0,0,0,0,33,'Товары автосервиса\\7B70B9C6.jpg','да','',''),(97,'ENGINE OIL MZ 320757',1,2210,'','',0,0,0,0,18,'Товары автосервиса\\0D30C4EE.jpg','да','',''),(98,'Zepro Eco Medalist 3583-001',1,1770,'','',0,0,0,0,33,'Товары автосервиса\\6800BB8A.jpg','да','',''),(99,'Premium DPF Diesel 05200-00620',1,2470,'','',0,0,0,0,31,'Товары автосервиса\\9B3075EB.jpg','да','',''),(100,'QUARTZ 9000 FUTURE NFC 10230501',1,1650,'','',0,0,0,0,26,'Товары автосервиса\\3970E753.jpg','нет','','');
/*!40000 ALTER TABLE `товары` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`student`@`%`*/ /*!50003 TRIGGER `TR_товары_BeforeInsert` BEFORE INSERT ON `товары` FOR EACH ROW BEGIN
	declare rowcount int;
    set rowcount = (Select count(*) From Товары where locate(new.ID_Товара, ДополнительныеТовары) > 0);
	if new.`Активен?` = 'нет' and rowcount > 0
    then
		Signal SQLSTATE '45000' set message_text = "Нельзя добавить неактивный товар";
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`student`@`%`*/ /*!50003 TRIGGER `TR_товары_BeforeUpdate` BEFORE UPDATE ON `товары` FOR EACH ROW BEGIN
	declare rowcount int;
    set rowcount = (Select count(*) From Товары where locate(new.ID_Товара, ДополнительныеТовары) > 0);
	if new.`Активен?` = 'нет' and rowcount > 0
    then
		Signal SQLSTATE '45000' set message_text = "Нельзя добавить неактивный товар";
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24 13:57:05
