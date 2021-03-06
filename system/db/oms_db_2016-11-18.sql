-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: oms
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `oms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `oms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oms`;

--
-- Table structure for table `Archivist`
--

DROP TABLE IF EXISTS `Archivist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Archivist` (
  `userName` varchar(32) NOT NULL,
  PRIMARY KEY (`userName`),
  CONSTRAINT `Archivist_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `Person` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Archivist`
--

LOCK TABLES `Archivist` WRITE;
/*!40000 ALTER TABLE `Archivist` DISABLE KEYS */;
INSERT INTO `Archivist` VALUES ('chuck'),('john');
/*!40000 ALTER TABLE `Archivist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BelongsTo`
--

DROP TABLE IF EXISTS `BelongsTo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BelongsTo` (
  `orderId` varchar(32) NOT NULL DEFAULT '',
  `refCode` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`orderId`,`refCode`),
  KEY `refCode` (`refCode`),
  CONSTRAINT `BelongsTo_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BelongsTo_ibfk_2` FOREIGN KEY (`refCode`) REFERENCES `OrderItems` (`refCode`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BelongsTo`
--

LOCK TABLES `BelongsTo` WRITE;
/*!40000 ALTER TABLE `BelongsTo` DISABLE KEYS */;
INSERT INTO `BelongsTo` VALUES ('e6534b74840240cb9d51674554f4e78a','090aa6426f7d47d3b0ab0e1425a1fdfc'),('726ae82d137c4a20a3203da5b10e6896','1a30afc249b246fa8086e81483ec2e70'),('726ae82d137c4a20a3203da5b10e6896','1cd33565ba2d4802997ab512bafeaee4'),('47fe5faff4e34ca4b109c23c6ad856d3','3d9fab395f7848dd8f796fc46381dd2c'),('47fe5faff4e34ca4b109c23c6ad856d3','4284d1a0de814634873010dbca64adeb'),('7bf0814442ed4eebba56e9372da107cb','45f2a81cb9d84a8fbc77ccfa626d07e5'),('2a48e52cf7914fc886e8a632abf0826c','4cc37331c7284cbca35de6093c67fdd3'),('e807ea0b5be3413c9197c2917a02b994','58e7907d9b2f461eb433b6800d1653be'),('73e01b045e1042e694e35835e6556ab1','59a9754fa4374fd396c83725439add70'),('5472488a54ea4b6ab380aeb1ba748e42','62c821847ba0456283a08df8ab58446a'),('d1e82d9e43764fdfa6dce3a93c00fa6c','70e79b0561a54ef7aa4af356fa503165'),('8ffe164cb4264488a389262e10e4d206','775c3e8b2b354a9fb5c58bcdc1521e42'),('8ffe164cb4264488a389262e10e4d206','830f48b45e5d4299bc1e65c5e907ae6f'),('2be1d48895ea4b789b332b605890b490','a25952b88de2482d999de6137c1ae54a'),('e807ea0b5be3413c9197c2917a02b994','a6c086a6af9c4dceb1d23fa2bec0e03f'),('2be1d48895ea4b789b332b605890b490','b900660b83374ef5bcfca78653abe1eb'),('73e01b045e1042e694e35835e6556ab1','c45797266ee44d10b77a1f0bbd76c425'),('d1e82d9e43764fdfa6dce3a93c00fa6c','d228820220cf449492da411a5a4e7bc9'),('60e69130145c45b99c67d211e4a1e4a2','d7ec8afc8345473796d122da9152fe19'),('5472488a54ea4b6ab380aeb1ba748e42','d7f0ef380f164d1ca42977bb13e7dbd1'),('726ae82d137c4a20a3203da5b10e6896','de459340d5894fdb9d3528d6653ba818'),('47fe5faff4e34ca4b109c23c6ad856d3','e0d59a38b2ae4c9f80f74b693b8384db'),('2a48e52cf7914fc886e8a632abf0826c','e4a549209e1d4b4bbff51c93cd2cab06'),('e6534b74840240cb9d51674554f4e78a','f16ab541955745f889421394198b3b6b'),('7bf0814442ed4eebba56e9372da107cb','f34a965a37d14478b5fed001fd43b310'),('60e69130145c45b99c67d211e4a1e4a2','f91c890aa4294de6ad9f9b5a1d0dceb6'),('2be1d48895ea4b789b332b605890b490','fd091f1278544253b43706927b834700');
/*!40000 ALTER TABLE `BelongsTo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EndUser`
--

DROP TABLE IF EXISTS `EndUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EndUser` (
  `userName` varchar(32) NOT NULL,
  PRIMARY KEY (`userName`),
  CONSTRAINT `EndUser_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `Person` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EndUser`
--

LOCK TABLES `EndUser` WRITE;
/*!40000 ALTER TABLE `EndUser` DISABLE KEYS */;
INSERT INTO `EndUser` VALUES ('bill'),('bruce'),('chuck'),('clint'),('henry');
/*!40000 ALTER TABLE `EndUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderItems`
--

DROP TABLE IF EXISTS `OrderItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderItems` (
  `refCode` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `aipURI` varchar(255) DEFAULT NULL,
  `aipTitle` varchar(32) DEFAULT NULL,
  `levelOfDescription` text,
  `packageId` varchar(50) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `contentType` varchar(50) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `confidential` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`refCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderItems`
--

LOCK TABLES `OrderItems` WRITE;
/*!40000 ALTER TABLE `OrderItems` DISABLE KEYS */;
INSERT INTO `OrderItems` VALUES ('090aa6426f7d47d3b0ab0e1425a1fdfc','Item2',NULL,'This is the AIP title 2','1234','urn:uuid:adb2b78e-c9c2-a35a-8cfa-f163612b3a09',NULL,'application/pdf',12345,0),('1a30afc249b246fa8086e81483ec2e70','Nuclear Physics',NULL,NULL,'package','urn:uuid:ghi','path/to/Nuclear Physics.pdf','application/pdf',2295020,0),('1cd33565ba2d4802997ab512bafeaee4','Special relativity',NULL,NULL,'package','urn:uuid:def','path/to/Special relativity.pdf','application/pdf',1269951,0),('3d9fab395f7848dd8f796fc46381dd2c','Special relativity',NULL,NULL,'package','def','path/to/Special relativity.pdf','application/pdf',1269951,0),('4284d1a0de814634873010dbca64adeb','General relativity',NULL,NULL,'package','abc','path/to/General relativity.pdf','application/pdf',1265351,1),('45f2a81cb9d84a8fbc77ccfa626d07e5','Item2',NULL,'This is the AIP title 2','1234','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,1),('4cc37331c7284cbca35de6093c67fdd3','Item1',NULL,'This is the AIP title','123','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('58e7907d9b2f461eb433b6800d1653be','Item2','/var/data/earkweb/storage/pairtree_root/69/b8/19/c7/-f/29/d-/45/0b/-a/94/e-/56/88/e5/9c/ef/65/data/00001/69b819c7-f29d-450b-a94e-5688e59cef65.tar','This is the AIP title 2','1234','urn:uuid:adb2b78e-c9c2-a35a-8cfa-f163612b3a08',NULL,'application/pdf',12345,0),('59a9754fa4374fd396c83725439add70','Item2',NULL,'This is the AIP title 2','1234','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,1),('62c821847ba0456283a08df8ab58446a','Item2',NULL,'This is the AIP title 2','1234','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('70e79b0561a54ef7aa4af356fa503165','Item1',NULL,'This is the AIP title','123','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('775c3e8b2b354a9fb5c58bcdc1521e42','Item2',NULL,'This is the AIP title 2','1234','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('830f48b45e5d4299bc1e65c5e907ae6f','Item1',NULL,'This is the AIP title','123','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('a25952b88de2482d999de6137c1ae54a','Special relativity',NULL,NULL,'package','46df0610-bbc4-8893-3e4c-46531ad563d2','path/to/Special relativity.pdf','application/pdf',1269951,0),('a6c086a6af9c4dceb1d23fa2bec0e03f','Item1','/var/data/earkweb/storage/pairtree_root/69/b8/19/c7/-f/29/d-/45/0b/-a/94/e-/56/88/e5/9c/ef/65/data/00001/69b819c7-f29d-450b-a94e-5688e59cef65.tar','This is the AIP title','123','urn:uuid:adb2b78e-c9c2-a35a-8cfa-f163612b3a08',NULL,'application/pdf',12345,1),('b900660b83374ef5bcfca78653abe1eb','Nuclear Physics',NULL,NULL,'package','22de161d-ggyj-2048-9a13-41131ab523d','path/to/Nuclear Physics.pdf','application/pdf',2295020,0),('c45797266ee44d10b77a1f0bbd76c425','Item1',NULL,'This is the AIP title','123','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,1),('d228820220cf449492da411a5a4e7bc9','Item2',NULL,'This is the AIP title 2','1234','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('d7ec8afc8345473796d122da9152fe19','Item2',NULL,'This is the AIP title 2','1234','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('d7f0ef380f164d1ca42977bb13e7dbd1','Item1',NULL,'This is the AIP title','123','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('de459340d5894fdb9d3528d6653ba818','General relativity',NULL,NULL,'package','urn:uuid:abc','path/to/General relativity.pdf','application/pdf',1265351,1),('e0d59a38b2ae4c9f80f74b693b8384db','Nuclear Physics',NULL,NULL,'package','ghi','path/to/Nuclear Physics.pdf','application/pdf',2295020,0),('e4a549209e1d4b4bbff51c93cd2cab06','Item2',NULL,'This is the AIP title 2','1234','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('f16ab541955745f889421394198b3b6b','Item1',NULL,'This is the AIP title','123','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('f34a965a37d14478b5fed001fd43b310','Item1',NULL,'This is the AIP title','123','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('f91c890aa4294de6ad9f9b5a1d0dceb6','Item1',NULL,'This is the AIP title','123','46df0610-bbc4-8893-3e4c-46531ad563d2',NULL,'application/pdf',12345,0),('fd091f1278544253b43706927b834700','General relativity',NULL,NULL,'package','46df0610-bbc4-8893-3e4c-46531ad563d2','path/to/General relativity.pdf','application/pdf',1265351,1);
/*!40000 ALTER TABLE `OrderItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderedBy`
--

DROP TABLE IF EXISTS `OrderedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderedBy` (
  `userName` varchar(32) NOT NULL DEFAULT '',
  `orderId` varchar(32) NOT NULL DEFAULT '',
  `endUserOrderNote` text,
  PRIMARY KEY (`userName`,`orderId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `OrderedBy_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `Person` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `OrderedBy_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderedBy`
--

LOCK TABLES `OrderedBy` WRITE;
/*!40000 ALTER TABLE `OrderedBy` DISABLE KEYS */;
INSERT INTO `OrderedBy` VALUES ('bill','60e69130145c45b99c67d211e4a1e4a2','Please provide this order as fast as possible'),('bill','8ffe164cb4264488a389262e10e4d206','Please provide this order as fast as possible'),('bill','d1e82d9e43764fdfa6dce3a93c00fa6c','Please provide this order as fast as possible'),('bill','e6534b74840240cb9d51674554f4e78a','Please provide this order as fast as possible'),('bruce','73e01b045e1042e694e35835e6556ab1','Please provide this order as fast as possible'),('bruce','e807ea0b5be3413c9197c2917a02b994','Please provide this order as fast as possible'),('chuck','2be1d48895ea4b789b332b605890b490','Please provide this order as fast as possible'),('chuck','47fe5faff4e34ca4b109c23c6ad856d3','Please provide this order as fast as possible'),('chuck','726ae82d137c4a20a3203da5b10e6896','Please provide this order as fast as possible'),('clint','2a48e52cf7914fc886e8a632abf0826c','Please provide this order as fast as possible'),('clint','5472488a54ea4b6ab380aeb1ba748e42','Please provide this order as fast as possible'),('clint','7bf0814442ed4eebba56e9372da107cb','Please provide this order as fast as possible');
/*!40000 ALTER TABLE `OrderedBy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `orderId` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `origin` varchar(12) DEFAULT NULL,
  `orderDate` datetime DEFAULT NULL,
  `validationDate` datetime DEFAULT NULL,
  `plannedDate` datetime DEFAULT NULL,
  `accessDate` datetime DEFAULT NULL,
  `accessDateComments` text,
  `orderStatus` varchar(10) DEFAULT NULL,
  `accessEndDate` datetime DEFAULT NULL,
  `deliveryFormat` varchar(30) DEFAULT NULL,
  `processId` varchar(50) DEFAULT NULL,
  `jobId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES ('2a48e52cf7914fc886e8a632abf0826c','Hydrogen',NULL,'2016-05-19 12:00:00','2016-06-18 12:00:00','2016-06-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','new','2017-07-01 13:40:00',NULL,NULL,NULL),('2be1d48895ea4b789b332b605890b490','XYZ',NULL,'2016-05-18 12:00:00',NULL,'2016-05-18 12:00:00',NULL,NULL,'new',NULL,'pdf',NULL,NULL),('47fe5faff4e34ca4b109c23c6ad856d3','XYZ',NULL,'2016-05-18 12:00:00',NULL,'2016-05-18 12:00:00',NULL,NULL,'new',NULL,'pdf',NULL,NULL),('5472488a54ea4b6ab380aeb1ba748e42','Helium',NULL,'2016-05-20 12:00:00','2016-06-18 12:00:00','2016-07-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','open','2017-07-01 13:40:00',NULL,NULL,NULL),('60e69130145c45b99c67d211e4a1e4a2','Lithium',NULL,'2016-05-21 12:00:00','2016-06-18 12:00:00','2016-08-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','closed','2017-07-01 13:40:00',NULL,NULL,NULL),('726ae82d137c4a20a3203da5b10e6896','XYZ',NULL,'2016-05-18 12:00:00',NULL,'2016-05-18 12:00:00',NULL,NULL,'new',NULL,'pdf',NULL,NULL),('73e01b045e1042e694e35835e6556ab1','Beryllium',NULL,'2016-05-22 12:00:00','2016-06-18 12:00:00','2016-09-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','closed','2017-07-01 13:40:00',NULL,NULL,NULL),('7bf0814442ed4eebba56e9372da107cb','Bor',NULL,'2016-05-23 12:00:00','2016-06-18 12:00:00','2016-10-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','open','2017-07-01 13:40:00',NULL,NULL,NULL),('8ffe164cb4264488a389262e10e4d206','Carbon',NULL,'2016-05-24 12:00:00','2016-06-18 12:00:00','2016-11-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','open','2017-07-01 13:40:00',NULL,'1459cece-a304-4648-9cd5-2ea9bf9f4dbe',NULL),('d1e82d9e43764fdfa6dce3a93c00fa6c','Nitrogen',NULL,'2016-05-25 12:00:00','2016-06-18 12:00:00','2016-12-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','new','2017-07-01 13:40:00',NULL,NULL,NULL),('e6534b74840240cb9d51674554f4e78a','Oxygen',NULL,'2016-05-26 12:00:00','2016-06-18 12:00:00','2017-01-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','new','2017-07-01 13:40:00',NULL,'a09e8d49-014c-45f0-b739-d0dc24f0379e',NULL),('e807ea0b5be3413c9197c2917a02b994','Flour',NULL,'2016-05-27 12:00:00','2016-06-18 12:00:00','2018-02-18 12:00:00','2016-07-01 13:40:00','Your stuff is ready!','submitted','2017-07-01 13:40:00',NULL,'451725df-4899-4b22-a253-59b59426677d','a1a1308b-9b7f-471e-ad28-067ffecfa572');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Person`
--

DROP TABLE IF EXISTS `Person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Person` (
  `userName` varchar(32) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Person`
--

LOCK TABLES `Person` WRITE;
/*!40000 ALTER TABLE `Person` DISABLE KEYS */;
INSERT INTO `Person` VALUES ('bill','Bill','Clinton','bill@whitehouse.gov','eark'),('bruce','Bruce','Lee','bruce@kungfu.org','eark'),('chuck','Chuck','Norris','chuck@karate.org','eark'),('clint','Clint','Eastwood','clint@hollywood.com','eark'),('henry','Henry','Ford',NULL,'eark'),('john','John','T','john@hollywood.biz','eark');
/*!40000 ALTER TABLE `Person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Responsible`
--

DROP TABLE IF EXISTS `Responsible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Responsible` (
  `userName` varchar(32) NOT NULL DEFAULT '',
  `orderId` varchar(32) NOT NULL DEFAULT '',
  `publicNote` text,
  `privateNote` text,
  PRIMARY KEY (`userName`,`orderId`),
  KEY `orderId` (`orderId`),
  CONSTRAINT `Responsible_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `Person` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Responsible_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `Orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Responsible`
--

LOCK TABLES `Responsible` WRITE;
/*!40000 ALTER TABLE `Responsible` DISABLE KEYS */;
INSERT INTO `Responsible` VALUES ('chuck','e807ea0b5be3413c9197c2917a02b994',NULL,NULL),('john','5472488a54ea4b6ab380aeb1ba748e42','Top priority','We have to fix this...'),('john','7bf0814442ed4eebba56e9372da107cb','We will have trouble providing this',NULL),('john','8ffe164cb4264488a389262e10e4d206',NULL,NULL);
/*!40000 ALTER TABLE `Responsible` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-18 14:11:05
