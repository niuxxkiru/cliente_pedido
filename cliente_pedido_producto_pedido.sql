-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cliente_pedido
-- ------------------------------------------------------
-- Server version	8.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `producto_pedido`
--

DROP TABLE IF EXISTS `producto_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_pedido` (
  `nro` int NOT NULL,
  `codigo` varchar(40) NOT NULL,
  `unidades` int DEFAULT NULL,
  PRIMARY KEY (`nro`,`codigo`),
  KEY `codigo` (`codigo`),
  CONSTRAINT `producto_pedido_ibfk_1` FOREIGN KEY (`nro`) REFERENCES `pedido` (`NRO`),
  CONSTRAINT `producto_pedido_ibfk_2` FOREIGN KEY (`codigo`) REFERENCES `producto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_pedido`
--

LOCK TABLES `producto_pedido` WRITE;
/*!40000 ALTER TABLE `producto_pedido` DISABLE KEYS */;
INSERT INTO `producto_pedido` VALUES (1,'AR01',11),(1,'AR04',10),(1,'AR15',4),(1,'AR22',18),(3,'AR02',20),(3,'AR22',3),(5,'AR04',16),(7,'AR06',16),(8,'AR02',6),(8,'AR06',5),(8,'AR07',6),(8,'AR10',2),(8,'AR12',30),(8,'AR15',15),(8,'AR18',20),(8,'AR19',18),(8,'AR25',5),(8,'AR32',15),(8,'AR33',18),(8,'AR34',5),(8,'AR35',24),(9,'AR06',14),(11,'AR08',1),(12,'AR08',12),(13,'AR08',8),(16,'AR10',17),(19,'AR13',4),(21,'AR15',11),(22,'AR17',6),(22,'AR26',4),(22,'AR28',21),(25,'AR19',12),(26,'AR19',12),(27,'AR21',11),(28,'AR21',22),(29,'AR22',12),(30,'AR23',33),(31,'AR24',31),(32,'AR25',11),(34,'AR22',7),(34,'AR27',3),(35,'AR22',9),(35,'AR27',12),(37,'AR27',11),(39,'AR29',22),(40,'AR30',1),(42,'AR31',21),(43,'AR32',3),(44,'AR22',22),(45,'AR36',21),(46,'AR37',8),(47,'AR38',12),(48,'AR38',13),(49,'AR39',13),(50,'AR39',1);
/*!40000 ALTER TABLE `producto_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-30 19:13:32
