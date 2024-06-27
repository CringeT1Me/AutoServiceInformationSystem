
CREATE TABLE услуги (
  ID_Услуги int NOT NULL AUTO_INCREMENT,
  ID_Сотрудника` int NOT NULL,
  Наименование` varchar(50) NOT NULL,
  Описание` varchar(255) NOT NULL,
  Стоимость` decimal(10,2) NOT NULL,
  Скидка` decimal(3,2) DEFAULT NULL,
  Продолжительность, мин` int NOT NULL,
  Фото` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_Услуги`),
  KEY `FK_employee_idx` (`ID_Сотрудника`),
  CONSTRAINT `FK_employee` FOREIGN KEY (`ID_Сотрудника`) REFERENCES `сотрудники` (`ID_Сотрудника`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `услуги`
--

LOCK TABLES `услуги` WRITE;
/*!40000 ALTER TABLE `услуги` DISABLE KEYS */;
INSERT INTO `услуги` VALUES (1,1,'Замена масла','Меняют масло в двигателе',1000.00,0.00,20,'');
/*!40000 ALTER TABLE `услуги` ENABLE KEYS */;
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
