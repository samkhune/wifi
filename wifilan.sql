-- MariaDB dump 10.19  Distrib 10.4.21-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: wifilan
-- ------------------------------------------------------
-- Server version	10.4.21-MariaDB-1:10.4.21+maria~focal-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `accounting`
--

DROP TABLE IF EXISTS `accounting`;
/*!50001 DROP VIEW IF EXISTS `accounting`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `accounting` (
  `id` tinyint NOT NULL,
  `client_macaddress` tinyint NOT NULL,
  `client_ipv4address` tinyint NOT NULL,
  `controller_macaddress` tinyint NOT NULL,
  `controller_ipv4address` tinyint NOT NULL,
  `sessionid` tinyint NOT NULL,
  `multisessionid` tinyint NOT NULL,
  `uniqueid` tinyint NOT NULL,
  `starttime` tinyint NOT NULL,
  `endtime` tinyint NOT NULL,
  `updatetime` tinyint NOT NULL,
  `sessiontime` tinyint NOT NULL,
  `downloadbytes` tinyint NOT NULL,
  `uploadbytes` tinyint NOT NULL,
  `terminatecause` tinyint NOT NULL,
  `customer_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `activeusersummary`
--

DROP TABLE IF EXISTS `activeusersummary`;
/*!50001 DROP VIEW IF EXISTS `activeusersummary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `activeusersummary` (
  `id` tinyint NOT NULL,
  `client_macaddress` tinyint NOT NULL,
  `online` tinyint NOT NULL,
  `downloadbytes` tinyint NOT NULL,
  `uploadbytes` tinyint NOT NULL,
  `sessiontime` tinyint NOT NULL,
  `sessioncount` tinyint NOT NULL,
  `logout` tinyint NOT NULL,
  `customer_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ad_campaign`
--

DROP TABLE IF EXISTS `ad_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_campaign` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AdWeight` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  CONSTRAINT `ad_campaign_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_campaign`
--

LOCK TABLES `ad_campaign` WRITE;
/*!40000 ALTER TABLE `ad_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_campaigngroup`
--

DROP TABLE IF EXISTS `ad_campaigngroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_campaigngroup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AdCampaignId` int(10) DEFAULT NULL,
  `AdGroupId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  CONSTRAINT `ad_campaigngroup_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_campaigngroup`
--

LOCK TABLES `ad_campaigngroup` WRITE;
/*!40000 ALTER TABLE `ad_campaigngroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_campaigngroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_campaignlocation`
--

DROP TABLE IF EXISTS `ad_campaignlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_campaignlocation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AdCampaignId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`),
  CONSTRAINT `ad_campaignlocation_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_campaignlocation`
--

LOCK TABLES `ad_campaignlocation` WRITE;
/*!40000 ALTER TABLE `ad_campaignlocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_campaignlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_campaignlocation_post`
--

DROP TABLE IF EXISTS `ad_campaignlocation_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_campaignlocation_post` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AdCampaignId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_campaignlocation_post`
--

LOCK TABLES `ad_campaignlocation_post` WRITE;
/*!40000 ALTER TABLE `ad_campaignlocation_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_campaignlocation_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_category`
--

DROP TABLE IF EXISTS `ad_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(30) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_category`
--

LOCK TABLES `ad_category` WRITE;
/*!40000 ALTER TABLE `ad_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_config`
--

DROP TABLE IF EXISTS `ad_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CampaignId` int(10) DEFAULT NULL,
  `FullScreenPre` int(10) DEFAULT NULL,
  `OverlayPre` varchar(10) DEFAULT NULL,
  `ImagePre` varchar(15) DEFAULT NULL,
  `VideoPre` varchar(15) DEFAULT NULL,
  `FixedSinglePre` varchar(15) DEFAULT NULL,
  `FixedMultiplePre` varchar(15) DEFAULT NULL,
  `FullScreenPost` varchar(20) DEFAULT NULL,
  `OverlayPost` varchar(20) DEFAULT NULL,
  `ImagePost` varchar(20) DEFAULT NULL,
  `VideoPost` varchar(20) DEFAULT NULL,
  `FixedSinglePost` varchar(20) DEFAULT NULL,
  `FixedMultiplePost` varchar(20) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationAll` int(10) DEFAULT NULL,
  `CountryAll` int(10) DEFAULT NULL,
  `StateAll` int(10) DEFAULT NULL,
  `VenueAll` int(10) DEFAULT NULL,
  `CityAll` int(10) DEFAULT NULL,
  `ConfigChanged` int(10) DEFAULT NULL,
  `ExclusiveConfig` int(10) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_config_ibfk_1` (`CustomerId`),
  CONSTRAINT `ad_config_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_config`
--

LOCK TABLES `ad_config` WRITE;
/*!40000 ALTER TABLE `ad_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_configcity`
--

DROP TABLE IF EXISTS `ad_configcity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_configcity` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `City` varchar(50) DEFAULT NULL,
  `AdCampaignId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_configcity_ibfk_1` (`CustomerId`),
  CONSTRAINT `ad_configcity_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_configcity`
--

LOCK TABLES `ad_configcity` WRITE;
/*!40000 ALTER TABLE `ad_configcity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_configcity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_configcountry`
--

DROP TABLE IF EXISTS `ad_configcountry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_configcountry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Country` varchar(50) DEFAULT NULL,
  `AdCampaignId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_configcountry_ibfk_1` (`CustomerId`),
  CONSTRAINT `ad_configcountry_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_configcountry`
--

LOCK TABLES `ad_configcountry` WRITE;
/*!40000 ALTER TABLE `ad_configcountry` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_configcountry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_configlocation`
--

DROP TABLE IF EXISTS `ad_configlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_configlocation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AdCampaignId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_configlocation_ibfk_1` (`CustomerId`),
  CONSTRAINT `ad_configlocation_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_configlocation`
--

LOCK TABLES `ad_configlocation` WRITE;
/*!40000 ALTER TABLE `ad_configlocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_configlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_configstate`
--

DROP TABLE IF EXISTS `ad_configstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_configstate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `State` varchar(50) DEFAULT NULL,
  `AdCampaignId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_configstate_ibfk_1` (`CustomerId`),
  CONSTRAINT `ad_configstate_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_configstate`
--

LOCK TABLES `ad_configstate` WRITE;
/*!40000 ALTER TABLE `ad_configstate` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_configstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_configvenue`
--

DROP TABLE IF EXISTS `ad_configvenue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_configvenue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Venue` varchar(50) DEFAULT NULL,
  `AdCampaignId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_configvenue_ibfk_1` (`CustomerId`),
  CONSTRAINT `ad_configvenue_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_configvenue`
--

LOCK TABLES `ad_configvenue` WRITE;
/*!40000 ALTER TABLE `ad_configvenue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_configvenue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_entry`
--

DROP TABLE IF EXISTS `ad_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_entry` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AdName` varchar(30) DEFAULT NULL,
  `AdMediaId` int(10) DEFAULT NULL,
  `CategoryId` int(10) DEFAULT NULL,
  `DisplayLink` varchar(100) DEFAULT NULL,
  `DestinationLink` varchar(200) DEFAULT NULL,
  `Weight` tinyint(2) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AdLocation` varchar(50) DEFAULT NULL,
  `AdVideo` varchar(50) DEFAULT NULL,
  `TotalImpressions` int(10) DEFAULT NULL,
  `AdImpressionType` tinyint(1) DEFAULT NULL,
  `AdminUpload` tinyint(1) DEFAULT 0,
  `DisplayDays` varchar(50) DEFAULT NULL,
  `Cpc` float DEFAULT NULL,
  `Cpm` float DEFAULT NULL,
  `Status` tinyint(1) DEFAULT NULL,
  `AdType` varchar(10) DEFAULT NULL,
  `DisplayHours` varchar(150) DEFAULT NULL,
  `FromAge` int(10) DEFAULT NULL,
  `ToAge` int(10) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `AdDisplayTime` int(10) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  CONSTRAINT `ad_entry_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_entry`
--

LOCK TABLES `ad_entry` WRITE;
/*!40000 ALTER TABLE `ad_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_group`
--

DROP TABLE IF EXISTS `ad_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_group` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AdGroupName` varchar(30) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  CONSTRAINT `ad_group_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_group`
--

LOCK TABLES `ad_group` WRITE;
/*!40000 ALTER TABLE `ad_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_groupmap`
--

DROP TABLE IF EXISTS `ad_groupmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_groupmap` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `GroupId` int(10) DEFAULT NULL,
  `AdId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  CONSTRAINT `ad_groupmap_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_groupmap`
--

LOCK TABLES `ad_groupmap` WRITE;
/*!40000 ALTER TABLE `ad_groupmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_groupmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_locationmap`
--

DROP TABLE IF EXISTS `ad_locationmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_locationmap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LocationId` int(11) NOT NULL,
  `AdId` int(10) DEFAULT NULL,
  `AdType` varchar(10) DEFAULT NULL,
  `MultipleAllowed` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `ad_locationmap_ibfk_1` (`AdId`),
  CONSTRAINT `ad_locationmap_ibfk_1` FOREIGN KEY (`AdId`) REFERENCES `ad_entry` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_locationmap`
--

LOCK TABLES `ad_locationmap` WRITE;
/*!40000 ALTER TABLE `ad_locationmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_locationmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_locationmap_post`
--

DROP TABLE IF EXISTS `ad_locationmap_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_locationmap_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LocationId` int(11) NOT NULL,
  `AdId` int(11) NOT NULL,
  `AdType` varchar(10) DEFAULT NULL,
  `MultipleAllowed` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_locationmap_post`
--

LOCK TABLES `ad_locationmap_post` WRITE;
/*!40000 ALTER TABLE `ad_locationmap_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_locationmap_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_media`
--

DROP TABLE IF EXISTS `ad_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Image1` varchar(254) DEFAULT NULL,
  `ImageSize1` int(10) DEFAULT NULL,
  `ImageDimension1` varchar(100) DEFAULT NULL,
  `ImageType1` varchar(150) DEFAULT NULL,
  `Image2` varchar(254) DEFAULT NULL,
  `ImageSize2` int(10) DEFAULT NULL,
  `ImageDimension2` varchar(100) DEFAULT NULL,
  `ImageType2` varchar(150) DEFAULT NULL,
  `Image3` varchar(254) DEFAULT NULL,
  `ImageSize3` int(10) DEFAULT NULL,
  `ImageDimension3` varchar(100) DEFAULT NULL,
  `ImageType3` varchar(150) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `VideoName` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ad_media_ibfk_1` (`CustomerId`),
  CONSTRAINT `ad_media_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_media`
--

LOCK TABLES `ad_media` WRITE;
/*!40000 ALTER TABLE `ad_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_statistics`
--

DROP TABLE IF EXISTS `ad_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AdMediaId` int(11) DEFAULT NULL,
  `AdStatsId` varchar(32) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CampaignId` int(11) DEFAULT NULL,
  `DeviceType` varchar(100) DEFAULT NULL,
  `MobileApp` tinyint(1) DEFAULT 0,
  `BrowserName` varchar(100) DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  `Type` enum('C','I') DEFAULT NULL,
  `ImpressionId` int(11) DEFAULT NULL,
  `AdCloseClicked` varchar(1) DEFAULT 'N',
  `AdCloseTime` timestamp NULL DEFAULT current_timestamp(),
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UserName` varchar(50) DEFAULT NULL,
  `AdPage` varchar(5) DEFAULT 'PRE',
  `CalledStationId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_statistics`
--

LOCK TABLES `ad_statistics` WRITE;
/*!40000 ALTER TABLE `ad_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_statuschanged`
--

DROP TABLE IF EXISTS `ad_statuschanged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_statuschanged` (
  `CustomerId` int(10) NOT NULL DEFAULT 0,
  `ForceRecompute` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CustomerId`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_statuschanged`
--

LOCK TABLES `ad_statuschanged` WRITE;
/*!40000 ALTER TABLE `ad_statuschanged` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_statuschanged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ad_temptable`
--

DROP TABLE IF EXISTS `ad_temptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_temptable` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CampaignId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `DurationId` varchar(10) DEFAULT NULL,
  `AdId` int(10) DEFAULT NULL,
  `RelativeWeight` float DEFAULT NULL,
  `DisplayCount` int(10) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_temptable`
--

LOCK TABLES `ad_temptable` WRITE;
/*!40000 ALTER TABLE `ad_temptable` DISABLE KEYS */;
/*!40000 ALTER TABLE `ad_temptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_account`
--

DROP TABLE IF EXISTS `adm_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `AccountName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `ShowPassword` tinyint(1) DEFAULT NULL,
  `DateCreate` datetime DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `IsAdmin` tinyint(1) DEFAULT NULL,
  `AccessProfileId` int(10) DEFAULT NULL,
  `VoucherScope` enum('GLOBAL','LOCAL') DEFAULT 'GLOBAL',
  `CreditConversionRate` float DEFAULT NULL,
  `CustomerType` tinyint(4) DEFAULT NULL,
  `OperatorId` int(11) NOT NULL,
  `IsBlocked` tinyint(1) DEFAULT 0,
  `EnableTwoWayAuth` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UserName` (`UserName`),
  KEY `customerid` (`CustomerId`),
  CONSTRAINT `adm_account_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_account`
--

/*!40000 ALTER TABLE `adm_account` DISABLE KEYS */;
INSERT INTO `adm_account` VALUES
(1,'superadmin','8f3cfc779d2c4a5ffdf80414b6d903ed','444444444444444444444444444444444444444444444','SUPERADMIN','support@wifi-soft.com','9284780902',1,1,'2018-09-24 13:00:37','2019-03-09 12:47:59',NULL,NULL,'GLOBAL',NULL,1,0,0,0),
(2,'portal-account','da4eb1bd7097d87419345b29783a0d5c','444444444444444444444444444444444444444444444','portal-account','support@wifi-soft.com','9284780902',1,1,'2018-09-24 13:00:37','2019-03-09 12:47:59',NULL,NULL,'GLOBAL',NULL,1,0,0,0),

(237,'inaccounts','546f383955ddf147288f466240e290fa','444444444444444444444444444444444444444444444','Finance Admin','accounts@indionetworks.com','9284780902',1,1,'2021-07-16 10:22:20','2021-07-16 10:22:20',NULL,NULL,'GLOBAL',NULL,1,0,0,0);
/*!40000 ALTER TABLE `adm_account` ENABLE KEYS */;

/*!40000 ALTER TABLE `adm_account` DISABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `adm_account_group`
--
DROP TABLE IF EXISTS `adm_account_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `adm_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GroupName` varchar(200) DEFAULT NULL,
  `Adm_accountid` text DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `UpdatedDate` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40000 ALTER TABLE `adm_account_group` ENABLE KEYS */;

LOCK TABLES `adm_account_group` WRITE;
/*!40000 ALTER TABLE `adm_account_group` DISABLE KEYS */;

UNLOCK TABLES;


--
-- Table structure for table `adm_customer`
--

DROP TABLE IF EXISTS `adm_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `WorkPhone` varchar(20) DEFAULT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `SignupDate` datetime DEFAULT NULL,
  `Prefix` varchar(20) DEFAULT NULL,
  `CustomerCode` varchar(10) DEFAULT NULL,
  `AccessToken` varchar(100) DEFAULT NULL,
  `Realm` varchar(50) DEFAULT NULL,
  `LogoUrl` varchar(100) DEFAULT NULL,
  `HomePage` varchar(50) DEFAULT NULL,
  `VoucherPassword` varchar(20) DEFAULT NULL,
  `TimeZoneId` int(10) DEFAULT NULL,
  `TimezoneName` varchar(50) DEFAULT NULL,
  `HasRestrictions` tinyint(1) DEFAULT NULL,
  `FeatureAccess` varchar(50) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Zipcode` varchar(15) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL,
  `DateFormatId` int(10) DEFAULT 1,
  `Status` varchar(10) DEFAULT NULL,
  `EditSpecialRadius` tinyint(1) DEFAULT NULL,
  `EnableBilling` tinyint(1) DEFAULT NULL,
  `AutoLoginPassword` varchar(20) DEFAULT NULL,
  `FreeLoginPassword` varchar(20) DEFAULT NULL,
  `SaveCvv` tinyint(1) DEFAULT NULL,
  `SaveBilling` tinyint(1) DEFAULT NULL,
  `HasLanding` tinyint(1) DEFAULT NULL,
  `DefaultVendor` varchar(100) DEFAULT NULL,
  `PortalVersion` tinyint(1) DEFAULT NULL,
  `EnableBYOD` tinyint(1) DEFAULT NULL,
  `EnableAds` tinyint(1) DEFAULT NULL,
  `EnableSurvey` tinyint(1) DEFAULT NULL,
  `EnableNMS` tinyint(1) DEFAULT NULL,
  `EnableSocial` tinyint(1) DEFAULT NULL,
  `EnableMails` tinyint(1) DEFAULT NULL,
  `EnableSMS` tinyint(1) DEFAULT NULL,
  `EnableAPManagement` tinyint(1) DEFAULT 0,
  `EnableRoaming` tinyint(1) DEFAULT 0,
  `EnableResellerCredit` tinyint(1) DEFAULT 0,
  `EnableSmartWifiPartner` tinyint(1) DEFAULT 0,
  `SmartwifiHierarchyManagedBy` tinyint(1) DEFAULT 0,
  `EnableDistributorManagement` tinyint(1) DEFAULT NULL,
  `EnableZeroValuePlan` tinyint(1) DEFAULT 0,
  `EnableResellerBilling` tinyint(1) DEFAULT 0,
  `EnableResellerPlan` tinyint(1) DEFAULT 0,
  `EnableTwoWayAuth` tinyint(1) DEFAULT 0,
  `CustomerInvoice` tinyint(1) DEFAULT 0,
  `EnableUpi` tinyint(1) DEFAULT 0,
  `BillingEmail` varchar(200) DEFAULT NULL,
  `BillingPerson` varchar(100) DEFAULT NULL,
  `BillingFrequency` varchar(20) DEFAULT NULL,
  `DateSuspended` datetime DEFAULT NULL,
  `SuspendReason` varchar(100) DEFAULT NULL,
  `EnableLDAP` tinyint(1) DEFAULT NULL,
  `ParentCustomerId` int(11) DEFAULT NULL,
  `CustomerType` tinyint(4) DEFAULT NULL,
  `Category` enum('demo','nms','prepaid','postpaid') NOT NULL DEFAULT 'demo',
  `CaptiveSupportNo` varchar(15) DEFAULT NULL,
  `LogoPath` varchar(150) DEFAULT NULL,
  `GoogleMapKey` varchar(250) DEFAULT NULL,
  `UploadLogo` tinyint(1) DEFAULT 1,
  `ExpiryDate` datetime DEFAULT NULL,
  `SDWanMaxNo` int(11) DEFAULT NULL,
  `IsDelete` tinyint(4) DEFAULT 0,
  `Language` varchar(5) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `AccessToken` (`AccessToken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
UNLOCK TABLES;
--
-- Dumping data for table `adm_customer`
--

LOCK TABLES `adm_customer` WRITE;
/*!40000 ALTER TABLE `adm_customer` DISABLE KEYS */;
INSERT INTO `adm_customer`  VALUES (1,'SUPERADMIN',' C 410, Teerth TechnoPark Behind Mercedes-Benz Sho','020 4675 3161','','support@wifi-soft.com','2019-08-01 00:00:00',NULL,NULL,NULL,'','','http://wifi-soft2.com',NULL,49,'Asia/Kolkata',NULL,NULL,'Pune','Maharastra','4110211','India','INR',1,'active',NULL,NULL,'123456','12345678',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,NULL,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo',"","",NULL,1,NULL,2,0,'en');

/*!40000 ALTER TABLE `adm_customer` ENABLE KEYS */;
UNLOCK TABLES;




--
-- Table structure for table `adm_superadmin`
--

DROP TABLE IF EXISTS `adm_superadmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_superadmin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AccountId` int(10) unsigned NOT NULL,
  `CustomerId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adm_superadmin`
--

LOCK TABLES `adm_superadmin` WRITE;
/*!40000 ALTER TABLE `adm_superadmin` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_superadmin` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `adm_customer_invoice`
--

DROP TABLE IF EXISTS `adm_customer_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_customer_invoice` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `InvoiceName` varchar(50) DEFAULT NULL,
  `InvoiceDescription` varchar(200) DEFAULT NULL,
  `InvoiceDate` datetime DEFAULT NULL,
  `PayByDate` datetime DEFAULT NULL,
  `InvoiceAmount` float DEFAULT 0,
  `InvoiceCurrency` varchar(3) DEFAULT NULL,
  `InvoiceStatus` varchar(10) DEFAULT NULL,
  `GraceDays` int(10) DEFAULT 0,
  `PaymentMethod` varchar(20) DEFAULT NULL,
  `PaidDate` datetime DEFAULT NULL,
  `PaidMethod` varchar(20) DEFAULT NULL,
  `PaidAmount` float DEFAULT 0,
  `PaidTransactionId` varchar(25) DEFAULT NULL,
  `PaidChequeNumber` varchar(10) DEFAULT NULL,
  `PaidChequeBankName` varchar(50) DEFAULT NULL,
  `InvoiceFileName` varchar(100) DEFAULT NULL,
  `InvoiceFilePath` varchar(100) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_customer_invoice`
--

LOCK TABLES `adm_customer_invoice` WRITE;
/*!40000 ALTER TABLE `adm_customer_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_customer_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_dbchangehistory`
--

DROP TABLE IF EXISTS `adm_dbchangehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_dbchangehistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ChangeDate` datetime DEFAULT NULL,
  `IpAddress` varchar(128) NOT NULL,
  `Action` varchar(15) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) NOT NULL,
  `AccountId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_dbchangehistory`
--

LOCK TABLES `adm_dbchangehistory` WRITE;
/*!40000 ALTER TABLE `adm_dbchangehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_dbchangehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_featureaccess`
--

DROP TABLE IF EXISTS `adm_featureaccess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_featureaccess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AuthUsers` tinyint(1) DEFAULT 0,
  `AuthGroups` tinyint(1) DEFAULT 0,
  `AuthHotspots` tinyint(1) DEFAULT 0,
  `AuthPolicy` tinyint(1) DEFAULT NULL,
  `AuthCaptivePortal` tinyint(1) DEFAULT 0,
  `AppProvider` tinyint(1) DEFAULT 0,
  `Pdoa` tinyint(1) DEFAULT 0,
  `WhiteLabel` tinyint(1) DEFAULT 0,
  `ResellerPaymentGateway` tinyint(1) DEFAULT 0,
  `GlobalConfiguration` tinyint(1) DEFAULT NULL,
  `ManageAp` tinyint(1) DEFAULT 0,
  `ManageUnibox` tinyint(1) DEFAULT NULL,
  `ManageSwitches` tinyint(1) DEFAULT NULL,
  `BillingPlans` tinyint(1) DEFAULT 0,
  `BillingConfig` tinyint(1) DEFAULT 0,
  `BillingRevenueShare` tinyint(1) DEFAULT 0,
  `BillingVouchers` tinyint(1) DEFAULT 0,
  `BillingVoucherDesign` tinyint(1) DEFAULT 0,
  `CRMTickets` tinyint(1) DEFAULT 0,
  `CRMEmailTemplates` tinyint(1) DEFAULT 0,
  `Advertisement` tinyint(1) DEFAULT 0,
  `AdminAccounts` tinyint(1) unsigned DEFAULT 0,
  `CFilter` tinyint(1) DEFAULT 0,
  `CustomerType` tinyint(1) unsigned DEFAULT NULL,
  `OperatorId` int(11) NOT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AuthAutoLogin` tinyint(1) DEFAULT 0,
  `AuthSms` tinyint(1) DEFAULT 0,
  `Proximity` int(3) DEFAULT 0,
  `Survey` tinyint(1) DEFAULT 0,
  `AutomatedRep` tinyint(1) DEFAULT 0,
  `SelfCareLogin` tinyint(1) DEFAULT NULL,
  `Reviews` tinyint(1) DEFAULT NULL,
  `NetworkProfiles` tinyint(1) DEFAULT NULL,
  `SMSTemplates` tinyint(1) DEFAULT NULL,
  `ManageReseller` tinyint(1) DEFAULT NULL,
  `AccountId` int(11) DEFAULT NULL,
  `RogueAp` tinyint(1) DEFAULT NULL,
  `WacController` tinyint(1) DEFAULT 0,
  `802_1x` tinyint(1) DEFAULT NULL,
  `LDAP` tinyint(1) DEFAULT NULL,
  `NotificationManagement` tinyint(1) DEFAULT NULL,
  `FaqManagement` tinyint(1) DEFAULT 3,
  `SMTPConfiguration` tinyint(1) DEFAULT 0,

  PRIMARY KEY (`id`),
  KEY `adm_featureaccess_ibfk_1` (`CustomerId`),
  CONSTRAINT `adm_featureaccess_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_featureaccess`
--

LOCK TABLES `adm_featureaccess` WRITE;
/*!40000 ALTER TABLE `adm_featureaccess` DISABLE KEYS */;
INSERT INTO `adm_featureaccess` VALUES (1,3,0,3,NULL,3,0,0,0,0,3,3,NULL,3,3,3,3,3,3,3,3,3,3,0,0,0,1,0,0,3,0,NULL,3,3,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `adm_featureaccess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_hotspot_plantype`
--

DROP TABLE IF EXISTS `adm_hotspot_plantype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_hotspot_plantype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `PlanName` varchar(30) DEFAULT NULL,
  `PlanUsers` int(10) DEFAULT NULL,
  `DefaultFee` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_hotspot_plantype`
--

LOCK TABLES `adm_hotspot_plantype` WRITE;
/*!40000 ALTER TABLE `adm_hotspot_plantype` DISABLE KEYS */;
INSERT INTO `adm_hotspot_plantype` VALUES (1,'10 concurrent user plan',10,10),(2,'20 concurrent user plan',20,15),(3,'50 concurrent user plan',50,25),(4,'100 concurrent user plan',100,35),(5,'200 concurrent user plan',200,50),(6,'500 concurrent user plan',500,75),(7,'1000 concurrent user plan',1000,100),(8,'2000 concurrent user plan',2000,200),(9,'5000 concurrent user plan',5000,1000),(10,'10000 concurrent user plan',10000,2000);
/*!40000 ALTER TABLE `adm_hotspot_plantype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_loginhistory`
--

DROP TABLE IF EXISTS `adm_loginhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_loginhistory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AccountName` varchar(50) DEFAULT NULL,
  `LoginDate` datetime DEFAULT NULL,
  `LogoutDate` datetime DEFAULT NULL,
  `IpAddress` varchar(20) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  `UserAgent` text DEFAULT NULL,
  `RetailerDistributorId` int(11) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `Type` enum('retailer','distributor','subscriber','patner') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_loginhistory`
--

LOCK TABLES `adm_loginhistory` WRITE;
/*!40000 ALTER TABLE `adm_loginhistory` DISABLE KEYS */;
INSERT INTO `adm_loginhistory` VALUES (19997,'SUPERADMIN','2021-10-26 08:21:07','2021-10-26 08:22:29','172.31.254.53',1,NULL,NULL,NULL,NULL,NULL),(19998,'SUPERADMIN','2021-10-26 08:22:38',NULL,'172.31.254.53',1,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `adm_loginhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_mail_config`
--

DROP TABLE IF EXISTS `adm_mail_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_mail_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  `ScriptCode` varchar(64) DEFAULT NULL,
  `OpCode` varchar(64) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `adm_accountgroupid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_mail_config`
--

LOCK TABLES `adm_mail_config` WRITE;
/*!40000 ALTER TABLE `adm_mail_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_mail_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adm_timediff`
--

DROP TABLE IF EXISTS `adm_timediff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_timediff` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Operator` varchar(5) DEFAULT NULL,
  `Difference` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_timediff`
--

LOCK TABLES `adm_timediff` WRITE;
/*!40000 ALTER TABLE `adm_timediff` DISABLE KEYS */;
INSERT INTO `adm_timediff` VALUES (5,'-','25200'),(11,'-','18000'),(32,'+','3600'),(49,'+','19800');
/*!40000 ALTER TABLE `adm_timediff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap`
--

DROP TABLE IF EXISTS `ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApName` varchar(40) NOT NULL,
  `MacAddress` varchar(100) NOT NULL,
  `Description` varchar(200) DEFAULT 'RADIUS Client',
  `APModel` varchar(30) NOT NULL,
  `APTag` varchar(30) DEFAULT NULL,
  `ApTemplateId` int(11) NOT NULL,
  `WLanProfileId` int(11) DEFAULT NULL,
  `LocationId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `ConfigChangeDate` datetime NOT NULL DEFAULT current_timestamp(),
  `RSysLogEnable` tinyint(4) DEFAULT 0,
  `RSysLogServer` varchar(20) DEFAULT NULL,
  `RSysLogPort` varchar(5) DEFAULT NULL,
  `RSysLogPrefix` varchar(5) DEFAULT NULL,
  `RSysLogDuration` varchar(20) DEFAULT NULL,
  `RSysLogDate` datetime DEFAULT NULL,
  `TipAPId` int(11) DEFAULT NULL,
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `MacAddress` (`MacAddress`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`),
  KEY `customerid_locationid` (`CustomerId`,`LocationId`),
  KEY `customerid_locationid_id` (`CustomerId`,`LocationId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap`
--

LOCK TABLES `ap` WRITE;
/*!40000 ALTER TABLE `ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_cmd`
--

DROP TABLE IF EXISTS `ap_cmd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_cmd` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) DEFAULT NULL,
  `ApId` int(10) DEFAULT NULL,
  `LocationId` int(10) DEFAULT NULL,
  `TestName` varchar(255) DEFAULT NULL,
  `Command` varchar(100) DEFAULT NULL,
  `Reply` varchar(500) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT 0,
  `AddedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `ResponseTime` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_cmd`
--

LOCK TABLES `ap_cmd` WRITE;
/*!40000 ALTER TABLE `ap_cmd` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_cmd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_country_channel_info`
--

DROP TABLE IF EXISTS `ap_country_channel_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_country_channel_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ChannelNo` smallint(4) DEFAULT NULL,
  `CountryCode` varchar(3) DEFAULT NULL,
  `CentralFrequency` varchar(5) DEFAULT NULL,
  `MaxTxPower` int(2) DEFAULT NULL,
  `20MHz` tinyint(1) DEFAULT NULL,
  `40MHz` tinyint(1) DEFAULT NULL,
  `80MHz` tinyint(1) DEFAULT NULL,
  `160MHz` tinyint(1) DEFAULT NULL,
  `IsLegal` tinyint(1) DEFAULT NULL,
  `IsHide` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_country_channel_info`
--

LOCK TABLES `ap_country_channel_info` WRITE;
/*!40000 ALTER TABLE `ap_country_channel_info` DISABLE KEYS */;
INSERT INTO `ap_country_channel_info` (`id`,`ChannelNo`,`CountryCode`,`CentralFrequency`,`MaxTxPower`,`20MHz`,`40MHz`,`80MHz`,`160MHz`,`IsLegal`)  VALUES (79,1,'IN','2412',30,1,1,0,0,1),(80,2,'IN','2417',30,1,1,0,0,1),(81,3,'IN','2422',30,1,1,0,0,1),(82,4,'IN','2427',30,1,1,0,0,1),(83,5,'IN','2432',30,1,1,0,0,1),(84,6,'IN','2437',30,1,1,0,0,1),(85,7,'IN','2442',30,1,1,0,0,1),(86,8,'IN','2447',30,1,1,0,0,1),(87,9,'IN','2452',30,1,1,0,0,1),(88,10,'IN','2457',30,1,1,0,0,1),(89,11,'IN','2462',30,1,1,0,0,1),(90,12,'IN','2467',30,1,1,0,0,1),(91,13,'IN','2472',30,1,1,0,0,1),(92,14,'IN','2484',30,1,1,0,0,1),(93,36,'IN','5180',23,1,1,1,0,1),(94,40,'IN','5200',23,1,1,1,0,1),(95,44,'IN','5220',23,1,1,1,0,1),(96,48,'IN','5240',23,1,1,1,0,1),(97,52,'IN','5260',23,1,1,1,0,1),(98,56,'IN','5280',23,1,1,1,0,1),(99,60,'IN','5300',23,1,1,1,0,1),(100,64,'IN','5320',23,1,1,1,0,1),(101,100,'IN','5500',23,1,1,1,1,1),(102,104,'IN','5520',23,1,1,1,1,1),(103,108,'IN','5540',23,1,1,1,1,1),(104,112,'IN','5560',23,1,1,1,1,1),(105,116,'IN','5580',23,1,1,1,1,1),(106,120,'IN','5600',23,1,1,1,1,1),(107,124,'IN','5620',23,1,1,1,1,1),(108,128,'IN','5640',23,1,1,1,1,1),(109,132,'IN','5660',23,1,1,1,1,1),(110,136,'IN','5680',23,1,1,1,1,1),(111,140,'IN','5700',23,1,1,1,1,1),(112,144,'IN','5720',23,1,1,1,1,1),(113,149,'IN','5745',30,1,1,1,0,1),(114,153,'IN','5765',30,1,1,1,0,1),(115,157,'IN','5785',30,1,1,1,0,1),(116,161,'IN','5805',30,1,1,1,0,1),(117,165,'IN','5825',30,1,1,1,0,1),(118,1,'US','2412',30,1,1,0,0,1),(119,2,'US','2417',30,1,1,0,0,1),(120,3,'US','2422',30,1,1,0,0,1),(121,4,'US','2427',30,1,1,0,0,1),(122,5,'US','2432',30,1,1,0,0,1),(123,6,'US','2437',30,1,1,0,0,1),(124,7,'US','2442',30,1,1,0,0,1),(125,8,'US','2447',30,1,1,0,0,1),(126,9,'US','2452',30,1,1,0,0,1),(127,10,'US','2457',30,1,1,0,0,1),(128,11,'US','2462',30,1,1,0,0,1),(129,12,'US','2467',30,1,1,0,0,1),(130,13,'US','2472',30,1,1,0,0,1),(131,14,'US','2484',30,1,1,0,0,1),(132,36,'US','5180',23,1,1,1,0,1),(133,40,'US','5200',23,1,1,1,0,1),(134,44,'US','5220',23,1,1,1,0,1),(135,48,'US','5240',23,1,1,1,0,1),(136,52,'US','5260',23,1,1,1,0,1),(137,56,'US','5280',23,1,1,1,0,1),(138,60,'US','5300',23,1,1,1,0,1),(139,64,'US','5320',23,1,1,1,0,1),(140,100,'US','5500',23,1,1,1,1,1),(141,104,'US','5520',23,1,1,1,1,1),(142,108,'US','5540',23,1,1,1,1,1),(143,112,'US','5560',23,1,1,1,1,1),(144,116,'US','5580',23,1,1,1,1,1),(145,120,'US','5600',23,1,1,1,1,1),(146,124,'US','5620',23,1,1,1,1,1),(147,128,'US','5640',23,1,1,1,1,1),(148,132,'US','5660',23,1,1,1,1,1),(149,136,'US','5680',23,1,1,1,1,1),(150,140,'US','5700',23,1,1,1,1,1),(151,144,'US','5720',23,1,1,1,1,1),(152,149,'US','5745',30,1,1,1,0,1),(153,153,'US','5765',30,1,1,1,0,1),(154,157,'US','5785',30,1,1,1,0,1),(155,161,'US','5805',30,1,1,1,0,1),(156,165,'US','5825',30,1,1,1,0,1),(157,1,'PK','2412',30,1,1,0,0,1),(158,2,'PK','2417',30,1,1,0,0,1),(159,3,'PK','2422',30,1,1,0,0,1),(160,4,'PK','2427',30,1,1,0,0,1),(161,5,'PK','2432',30,1,1,0,0,1),(162,6,'PK','2437',30,1,1,0,0,1),(163,7,'PK','2442',30,1,1,0,0,1),(164,8,'PK','2447',30,1,1,0,0,1),(165,9,'PK','2452',30,1,1,0,0,1),(166,10,'PK','2457',30,1,1,0,0,1),(167,11,'PK','2462',30,1,1,0,0,1),(168,12,'PK','2467',30,1,1,0,0,1),(169,13,'PK','2472',30,1,1,0,0,1),(170,14,'PK','2484',30,1,1,0,0,1),(171,36,'PK','5180',23,1,1,1,0,1),(172,40,'PK','5200',23,1,1,1,0,1),(173,44,'PK','5220',23,1,1,1,0,1),(174,48,'PK','5240',23,1,1,1,0,1),(175,52,'PK','5260',23,1,1,1,0,1),(176,56,'PK','5280',23,1,1,1,0,1),(177,60,'PK','5300',23,1,1,1,0,1),(178,64,'PK','5320',23,1,1,1,0,1),(179,100,'PK','5500',23,1,1,1,1,1),(180,104,'PK','5520',23,1,1,1,1,1),(181,108,'PK','5540',23,1,1,1,1,1),(182,112,'PK','5560',23,1,1,1,1,1),(183,116,'PK','5580',23,1,1,1,1,1),(184,120,'PK','5600',23,1,1,1,1,1),(185,124,'PK','5620',23,1,1,1,1,1),(186,128,'PK','5640',23,1,1,1,1,1),(187,132,'PK','5660',23,1,1,1,1,1),(188,136,'PK','5680',23,1,1,1,1,1),(189,140,'PK','5700',23,1,1,1,1,1),(190,144,'PK','5720',23,1,1,1,1,1),(191,149,'PK','5745',30,1,1,1,0,1),(192,153,'PK','5765',30,1,1,1,0,1),(193,157,'PK','5785',30,1,1,1,0,1),(194,161,'PK','5805',30,1,1,1,0,1),(195,165,'PK','5825',30,1,1,1,0,1),(196,1,'AF','2412',30,1,1,0,0,1),(197,2,'AF','2417',30,1,1,0,0,1),(198,3,'AF','2422',30,1,1,0,0,1),(199,4,'AF','2427',30,1,1,0,0,1),(200,5,'AF','2432',30,1,1,0,0,1),(201,6,'AF','2437',30,1,1,0,0,1),(202,7,'AF','2442',30,1,1,0,0,1),(203,8,'AF','2447',30,1,1,0,0,1),(204,9,'AF','2452',30,1,1,0,0,1),(205,10,'AF','2457',30,1,1,0,0,1),(206,11,'AF','2462',30,1,1,0,0,1),(207,12,'AF','2467',30,1,1,0,0,1),(208,13,'AF','2472',30,1,1,0,0,1),(209,14,'AF','2484',30,1,1,0,0,1),(210,36,'AF','5180',23,1,1,1,0,1),(211,40,'AF','5200',23,1,1,1,0,1),(212,44,'AF','5220',23,1,1,1,0,1),(213,48,'AF','5240',23,1,1,1,0,1),(214,52,'AF','5260',23,1,1,1,0,1),(215,56,'AF','5280',23,1,1,1,0,1),(216,60,'AF','5300',23,1,1,1,0,1),(217,64,'AF','5320',23,1,1,1,0,1),(218,100,'AF','5500',23,1,1,1,1,1),(219,104,'AF','5520',23,1,1,1,1,1),(220,108,'AF','5540',23,1,1,1,1,1),(221,112,'AF','5560',23,1,1,1,1,1),(222,116,'AF','5580',23,1,1,1,1,1),(223,120,'AF','5600',23,1,1,1,1,1),(224,124,'AF','5620',23,1,1,1,1,1),(225,128,'AF','5640',23,1,1,1,1,1),(226,132,'AF','5660',23,1,1,1,1,1),(227,136,'AF','5680',23,1,1,1,1,1),(228,140,'AF','5700',23,1,1,1,1,1),(229,144,'AF','5720',23,1,1,1,1,1),(230,149,'AF','5745',30,1,1,1,0,1),(231,153,'AF','5765',30,1,1,1,0,1),(232,157,'AF','5785',30,1,1,1,0,1),(233,161,'AF','5805',30,1,1,1,0,1),(234,165,'AF','5825',30,1,1,1,0,1),(235,1,'NG','2412',30,1,1,0,0,1),(236,2,'NG','2417',30,1,1,0,0,1),(237,3,'NG','2422',30,1,1,0,0,1),(238,4,'NG','2427',30,1,1,0,0,1),(239,5,'NG','2432',30,1,1,0,0,1),(240,6,'NG','2437',30,1,1,0,0,1),(241,7,'NG','2442',30,1,1,0,0,1),(242,8,'NG','2447',30,1,1,0,0,1),(243,9,'NG','2452',30,1,1,0,0,1),(244,10,'NG','2457',30,1,1,0,0,1),(245,11,'NG','2462',30,1,1,0,0,1),(246,12,'NG','2467',30,1,1,0,0,1),(247,13,'NG','2472',30,1,1,0,0,1),(248,14,'NG','2484',30,1,1,0,0,1),(249,36,'NG','5180',23,1,1,1,0,1),(250,40,'NG','5200',23,1,1,1,0,1),(251,44,'NG','5220',23,1,1,1,0,1),(252,48,'NG','5240',23,1,1,1,0,1),(253,52,'NG','5260',23,1,1,1,0,1),(254,56,'NG','5280',23,1,1,1,0,1),(255,60,'NG','5300',23,1,1,1,0,1),(256,64,'NG','5320',23,1,1,1,0,1),(257,100,'NG','5500',23,1,1,1,1,1),(258,104,'NG','5520',23,1,1,1,1,1),(259,108,'NG','5540',23,1,1,1,1,1),(260,112,'NG','5560',23,1,1,1,1,1),(261,116,'NG','5580',23,1,1,1,1,1),(262,120,'NG','5600',23,1,1,1,1,1),(263,124,'NG','5620',23,1,1,1,1,1),(264,128,'NG','5640',23,1,1,1,1,1),(265,132,'NG','5660',23,1,1,1,1,1),(266,136,'NG','5680',23,1,1,1,1,1),(267,140,'NG','5700',23,1,1,1,1,1),(268,144,'NG','5720',23,1,1,1,1,1),(269,149,'NG','5745',30,1,1,1,0,1),(270,153,'NG','5765',30,1,1,1,0,1),(271,157,'NG','5785',30,1,1,1,0,1),(272,161,'NG','5805',30,1,1,1,0,1),(273,165,'NG','5825',30,1,1,1,0,1);
/*!40000 ALTER TABLE `ap_country_channel_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_email_alert`
--

DROP TABLE IF EXISTS `ap_email_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_email_alert` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` varchar(64) DEFAULT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp(),
  `CustomerId` int(10) NOT NULL,
  `LastCheckInTime` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_email_alert`
--

LOCK TABLES `ap_email_alert` WRITE;
/*!40000 ALTER TABLE `ap_email_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_email_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_floormap`
--

DROP TABLE IF EXISTS `ap_floormap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_floormap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Apid` int(11) DEFAULT NULL,
  `Floorid` int(11) DEFAULT NULL,
  `Xcord` double DEFAULT NULL,
  `Ycord` double DEFAULT NULL,
  `applacedate` timestamp NOT NULL DEFAULT current_timestamp(),
  `applaceupdateddate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `floorimgheight` double DEFAULT NULL,
  `floorimgwidth` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apid_unique` (`Apid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_floormap`
--

LOCK TABLES `ap_floormap` WRITE;
/*!40000 ALTER TABLE `ap_floormap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_floormap` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ap_import_history`
--

DROP TABLE IF EXISTS `ap_import_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_import_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MacAddress` varchar(150) NOT NULL,
  `Status` varchar(250) DEFAULT NULL,
  `GeoDiscoveryFlag` tinyint(1) DEFAULT 0,
  `LastKnowIpAddress` varchar(150) DEFAULT NULL,
  `ApImportDate` datetime DEFAULT current_timestamp(),
  `LastModifiedDate` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `ApId` int(10) unsigned DEFAULT NULL,
  `CustomerId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ApId` (`ApId`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `ap_import_history_ibfk_1` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ap_import_history_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ap_floormap`
--

LOCK TABLES `ap_import_history` WRITE;
/*!40000 ALTER TABLE `ap_import_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_import_history` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ap_life_cycle`
--

DROP TABLE IF EXISTS `ap_life_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_life_cycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned NOT NULL,
  `LocationId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `ApLife` text NOT NULL,
  `Date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ApId` (`ApId`),
  KEY `LocationId` (`LocationId`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `network_life_cycle_1id` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE,
  CONSTRAINT `network_life_cycle_2loc` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `network_life_cycle_3cust` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_life_cycle`
--

LOCK TABLES `ap_life_cycle` WRITE;
/*!40000 ALTER TABLE `ap_life_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_life_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_mac_policies_devicelist`
--

DROP TABLE IF EXISTS `ap_mac_policies_devicelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_mac_policies_devicelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Autogenerated',
  `MacAddress` char(17) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  `PolicyId` int(11) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `CustomerId` int(11) NOT NULL,
  `OperatorId` int(11) NOT NULL DEFAULT 0,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastModifiedTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ap_mac_policies_devicelist_ibfk_1` (`PolicyId`),
  KEY `ap_mac_policies_devicelist_ibfk_2` (`CustomerId`),
  CONSTRAINT `ap_mac_policies_devicelist_ibfk_1` FOREIGN KEY (`PolicyId`) REFERENCES `ap_mac_policy_profile` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ap_mac_policies_devicelist_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAC Device List';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_mac_policies_devicelist`
--

LOCK TABLES `ap_mac_policies_devicelist` WRITE;
/*!40000 ALTER TABLE `ap_mac_policies_devicelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_mac_policies_devicelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_mac_policy_profile`
--

DROP TABLE IF EXISTS `ap_mac_policy_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_mac_policy_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileName` varchar(30) DEFAULT NULL,
  `ActionType` enum('allow','deny') DEFAULT NULL,
  `CustomerId` int(11) NOT NULL COMMENT 'CustomerId',
  `OperatorId` int(11) NOT NULL COMMENT 'OperatorId',
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastModifiedTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ap_mac_policy_profile_ibfk_1` (`CustomerId`),
  CONSTRAINT `ap_mac_policy_profile_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='MAC Policy Informations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_mac_policy_profile`
--

LOCK TABLES `ap_mac_policy_profile` WRITE;
/*!40000 ALTER TABLE `ap_mac_policy_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_mac_policy_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_mobility_domain`
--

DROP TABLE IF EXISTS `ap_mobility_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_mobility_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MobilityDomainName` varchar(20) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ap_mobility_domain` (`CustomerId`),
  CONSTRAINT `ap_mobility_domain` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_mobility_domain`
--

LOCK TABLES `ap_mobility_domain` WRITE;
/*!40000 ALTER TABLE `ap_mobility_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_mobility_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_models`
--

DROP TABLE IF EXISTS `ap_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `DisplayName` varchar(60) NOT NULL DEFAULT 'Unknown',
  `APModel` varchar(30) DEFAULT NULL,
  `MAC` varchar(255) DEFAULT NULL,
  `ApBoardName` varchar(20) DEFAULT NULL COMMENT 'Access Point Board Name',
  `Radio1` tinyint(1) DEFAULT 1,
  `Radio2` tinyint(1) DEFAULT 0,
  `Radio3` tinyint(1) DEFAULT 0,
  `MaxSSID` tinyint(2) DEFAULT 4,
  `MultiWAN` tinyint(1) DEFAULT 1,
  `3G` tinyint(1) DEFAULT 0,
  `4G` tinyint(1) DEFAULT 0,
  `WebFiltering` tinyint(1) DEFAULT 1,
  `Presence` tinyint(1) DEFAULT 1,
  `Description` varchar(255) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_models`
--

LOCK TABLES `ap_models` WRITE;
/*!40000 ALTER TABLE `ap_models` DISABLE KEYS */;
INSERT INTO `ap_models` VALUES (1,'UM210N','WiFi-Soft 210N','70:6D:EC:00:','ws-210n-v2',1,0,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(2,'UM-230N','WiFi-Soft 230N-v2','70:6D:EC:01:','ws-230n-v2',1,0,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(3,'UM-310N','WiFi-Soft 310N-v2','70:6D:EC:02:','ws-310n-v2',1,0,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(4,'UM-310AC','WiFi-Soft 310AC','70:6D:EC:03:','ws-310ac',1,1,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(5,'UM-510N','WiFi-Soft 510N-v2','70:6D:EC:04:','ws-510n-v2',1,0,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(6,'UM-530N','WiFi-Soft 530N-v2','70:6D:EC:05:','ws-530n-v2',1,0,0,1,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(7,'UM-530AC','WiFi-Soft 530AC','70:6D:EC:06:','ws-530ac',1,1,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(8,'UM-510AC','WiFi-Soft 510AC','70:6D:EC:07:','ws-510ac',1,1,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(9,'UM-230AC','WiFi-Soft 230AC','70:6D:EC:08:','ws-230ac-v3',1,0,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(10,'UM-530N-SAT','WiFi-Soft 530N-SAT','70:6D:EC:09:','ws-530n-sat-v2',1,0,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(11,'UM-320N','WiFi-Soft 320N','70:6D:EC:0A:','ws-320n',1,1,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(12,'UM-720AC','WiFi-Soft 720AC','70:6D:EC:0B:','ws-720ac-v1',1,1,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(13,'UM-705N','WiFi-Soft 705N','70:6D:EC:0D:','ws-705n',1,0,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(14,'UM-220N','WiFi-Soft 220N','70:6D:EC:0E:','ws-220n',1,0,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(15,'UM-330AC','Wifi-Soft 330AC','70:6D:EC:0F:','en-330ac',1,1,0,4,0,0,0,1,1,'AP','2020-01-17 10:58:37'),(16,'UM-305AC','WiFi-Soft 305AC','70:6D:EC:0A','ws-305ac',1,1,0,4,1,0,0,1,1,'305AC','2020-06-16 09:56:43'),(17,'UM-550AC','WiFi-Soft 550AC','70:6D:EC:11:','um-550ac',1,1,0,4,1,0,0,1,1,'AP','2021-01-27 07:24:19'),(18,'UM-325AC','WiFi-Soft 325AC','70:6D:EC:10:','um-325ac',1,1,0,4,1,0,0,1,1,'AP','2021-01-28 06:35:44'),(19,'UM-710N','WiFi-Soft 710N','70:6D:EC:0F','ws-710n',1,0,0,4,1,1,1,1,1,'Testing','2021-03-11 06:13:52'),(20,'UM310AX-V1','INDIO UM310AX-V1','00:03:7F:BA:','um-310ax-v1',1,1,1,4,1,1,1,1,1,'Access Point','2021-04-30 14:38:42'),(21,'UM-510ac-v3','INDIO UM-510AC-V3','70:6D:EC:12:','um-510ac-v3',1,1,0,4,1,0,0,1,1,'Testing','2021-09-03 12:01:08');
/*!40000 ALTER TABLE `ap_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_profiles`
--

DROP TABLE IF EXISTS `ap_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileName` varchar(200) DEFAULT NULL,
  `DeviceTypeId` int(10) unsigned DEFAULT NULL,
  `EnableNat` tinyint(1)  DEFAULT 0,
  `EnableMultiWan` tinyint(4) DEFAULT NULL,
  `EnableQos` tinyint(1) DEFAULT NULL,
  `EnableMesh` tinyint(1) DEFAULT 0,
  `MeshRadioBand` tinyint(1) DEFAULT 0,
  `MeshMode` tinyint(1) DEFAULT 0,
  `MeshType` tinyint(1) DEFAULT 0,
  `DnsMonitor` tinyint(1) DEFAULT 0,
  `FailureLoss` int(10) DEFAULT NULL,
  `RecoveryLoss` int(10) DEFAULT NULL,
  `RecoveryLatency` int(10) DEFAULT NULL,
  `FailureLatency` int(10) DEFAULT NULL,
  `MultiwanMethod` enum('loadBalancing','failover') DEFAULT NULL,
  `PrimaryLoad` int(10) DEFAULT NULL,
  `SecondaryLoad` int(10) DEFAULT NULL,
  `TertinaryLoad` int(10) DEFAULT NULL,
  `QuadrilateralLoad` int(10) DEFAULT NULL,
  `OverrideHotspotEnable` tinyint(1) DEFAULT NULL,
  `HotspotPlan` int(10) DEFAULT NULL,
  `RadiusServer1` varchar(50) DEFAULT NULL,
  `RadiusServer2` varchar(50) DEFAULT NULL,
  `RadiusSecret` varchar(20) DEFAULT NULL,
  `RadiusNasId` varchar(100) DEFAULT NULL,
  `UamServer` varchar(100) DEFAULT NULL,
  `PassthroughUrl` varchar(500) DEFAULT NULL,
  `MacPassword` varchar(20) DEFAULT NULL,
  `AutologinEnable` tinyint(1) DEFAULT NULL,
  `AutoLoginValidity` int(10) DEFAULT NULL,
  `AutoLoginValidityUnit` int(10) DEFAULT NULL,
  `AutoMacEnable` tinyint(1) DEFAULT NULL,
  `HotspotIpAddress` varchar(20) DEFAULT NULL,
  `InterimInterval` int(5) DEFAULT 600,
  `RadioCountryCode` varchar(2) DEFAULT 'US',
  `Radio12400Enable` tinyint(1) DEFAULT 1,
  `Radio12400Channel` int(2) DEFAULT 0,
  `Radio12400TxPower` int(2) DEFAULT 26,
  `Radio12400Bandwidth` int(3) DEFAULT 20,
  `Radio12400BackgrounScan` tinyint(1) DEFAULT 1,
  `Radio12400ScanTime` int(10) DEFAULT 360,
  `Radio12400MaxClients` int(3) DEFAULT NULL,
  `Radio12400BeaconInterval` int(11) DEFAULT 100,
  `Radio12400FragmentThreshold` int(11) DEFAULT 2346,
  `Radio12400RtsCtsThreshold` int(11) DEFAULT 2347,
  `Radio12400EnableLeagcyRates` tinyint(1) DEFAULT 0,
  `Radio12400BeaconRate` int(11) DEFAULT 6000,
  `Radio12400MulticastRate` int(11) DEFAULT 24000,
  `Radio12400EnableForceMode` tinyint(1) DEFAULT 0,
  `Radio12400IsEnable` tinyint(1) DEFAULT 1,
  `Radio12400BasicRate` varchar(100) DEFAULT NULL,
  `Radio12400SupportedRate` varchar(100) DEFAULT NULL,
  `Radio12400Airtime` tinyint(1) DEFAULT 1,
  `Radio25000Enable` tinyint(1) DEFAULT 1,
  `Radio25000Channel` int(2) DEFAULT 0,
  `Radio25000TxPower` int(2) DEFAULT 30,
  `Radio25000Bandwidth` int(3) DEFAULT 80,
  `Radio25000BackgrounScan` tinyint(1) DEFAULT 1,
  `Radio25000ScanTime` int(10) DEFAULT 360,
  `Radio25000MaxClients` int(3) DEFAULT NULL,
  `Radio25000BeaconInterval` int(11) DEFAULT 100,
  `Radio25000FragmentThreshold` int(11) DEFAULT 2346,
  `Radio25000RtsCtsThreshold` int(11) DEFAULT 2347,
  `Radio25000EnableForceMode` tinyint(1) DEFAULT 0,
  `Radio25000BeaconRate` int(11) DEFAULT 6000,
  `Radio25000MulticastRate` int(11) DEFAULT 24000,
  `Radio25000IsEnable` tinyint(1) DEFAULT 1,
  `Radio25000BasicRate` varchar(100) DEFAULT NULL,
  `Radio25000SupportedRate` varchar(100) DEFAULT NULL,
  `Radio25000Airtime` tinyint(1) DEFAULT 1,
  `Radio35000Enable` tinyint(1) DEFAULT 1,
  `Radio35000Channel` int(2) DEFAULT 0,
  `Radio35000TxPower` int(2) DEFAULT 30,
  `Radio35000Bandwidth` int(3) DEFAULT 80,
  `Radio35000BackgrounScan` tinyint(1) DEFAULT 1,
  `Radio35000MaxClients` int(3) DEFAULT NULL,
  `Radio35000ScanTime` int(10) DEFAULT 360,
  `Radio35000BeaconInterval` int(11) DEFAULT 100,
  `Radio35000FragmentThreshold` int(11) DEFAULT 2346,
  `Radio35000RtsCtsThreshold` int(10) DEFAULT 2347,
  `Radio35000EnableForceMode` tinyint(1) DEFAULT 0,
  `Radio35000BeaconRate` int(11) DEFAULT 6000,
  `Radio35000MulticastRate` int(11) DEFAULT 24000,
  `Radio35000IsEnable` tinyint(1) DEFAULT 1,
  `Radio35000BasicRate` varchar(100) DEFAULT NULL,
  `Radio35000SupportedRate` varchar(100) DEFAULT NULL,
  `Radio35000Airtime` tinyint(1) DEFAULT 1,
  `ConfigChangeDate` datetime DEFAULT current_timestamp(),
  `CustomDNSEnable` tinyint(1) unsigned DEFAULT NULL,
  `PrimaryDNS` varchar(20) DEFAULT NULL,
  `SecondaryDNS` varchar(20) DEFAULT NULL,
  `PresenceAnalyticsEnable` tinyint(1) unsigned DEFAULT NULL,
  `RfCutoffThreshold` int(4) DEFAULT NULL,
  `DataUploadInterval` int(10) DEFAULT NULL,
  `DataFormat` char(4) DEFAULT NULL,
  `DataServer` varchar(100) DEFAULT NULL,
  `DataServerAuthKey` varchar(50) DEFAULT NULL,
  `LanPortMode` enum('privatelan','hotspot','daisychain') DEFAULT 'privatelan',
  `EnableManagementFrameProtection` tinyint(4) NOT NULL DEFAULT 1,
  `EnableDFS` tinyint(4) NOT NULL DEFAULT 1,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `CustomerId` int(11) DEFAULT NULL,
  `ModifySubnet` tinyint(1) DEFAULT NULL,
  `GatewayIPAddress` varchar(16) DEFAULT '10.0.21.1',
  `LanSubnet` varchar(16) DEFAULT '255.255.255.0',
  `DhcpService` tinyint(1) DEFAULT 1,
  `DhcpStart` int(11) DEFAULT 10,
  `DhcpPoolLimit` int(11) DEFAULT 200,
  `DhcpLease` int(11) DEFAULT 10,
  `DhcpOverride` tinyint(1) DEFAULT 0,
  `DhcpPrimaryDNS` varchar(16) DEFAULT NULL,
  `DhcpSecondaryDNS` varchar(16) DEFAULT NULL,
  `EnableSdwan` tinyint(1) DEFAULT 0,
  `SdwanProfiles` varchar(20) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ap_profiles` (`CustomerId`),
  CONSTRAINT `ap_profiles` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_profiles`
--

LOCK TABLES `ap_profiles` WRITE;
/*!40000 ALTER TABLE `ap_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_radius_profile`
--

DROP TABLE IF EXISTS `ap_radius_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_radius_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Autogenerated Index value',
  `ProfileName` varchar(30) DEFAULT NULL COMMENT 'Name of Profile ',
  `DedicatedAuthAndAcceServer` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Common Authentication and Accounting Server or Separate Authentication and Accounting Server',
  `PrimaryAuthenticationServer` varchar(20) DEFAULT NULL COMMENT 'WiOS pre-configured IP',
  `PrimaryAuthenticationServerPort` int(4) DEFAULT NULL COMMENT 'WiOS pre-configured Port (1812)',
  `PrimaryAuthenticationServerSecret` varchar(15) DEFAULT NULL COMMENT 'WiOS pre-configured (customer creation)',
  `PrimaryAccountingServer` varchar(20) DEFAULT NULL COMMENT 'WiOS pre-configured IP',
  `PrimaryAccountingServerPort` int(4) DEFAULT NULL COMMENT 'WiOS pre-configured Port (1813)',
  `PrimaryAccountingServerSecret` varchar(15) DEFAULT NULL COMMENT 'WiOS pre-configured (customer creation)',
  `EnableRadiusFailover` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Disabled',
  `SecondaryAuthenticationServer` varchar(20) DEFAULT NULL COMMENT 'WiOS pre-configured IP',
  `SecondaryAuthenticationServerPort` int(4) DEFAULT NULL COMMENT 'WiOS pre-configured Port (1812)',
  `SecondaryAuthenticationServerSecret` varchar(15) DEFAULT NULL COMMENT 'WiOS pre-configured (customer creation)',
  `SecondaryRadiusAccountingServer` varchar(20) DEFAULT NULL COMMENT 'Secondary Radius Accounting Server',
  `SecondaryRadiusAccountingPort` int(4) DEFAULT NULL COMMENT 'WiOS pre-configured Port (1813)',
  `SecondaryRadiusAccountingSecret` varchar(15) DEFAULT NULL COMMENT 'WiOS pre-configured (customer creation)',
  `RadiusRetryPrimaryInterval` int(4) DEFAULT 30 COMMENT 'In seconds 30',
  `InterimAccountingUpdateInterval` int(4) DEFAULT 300 COMMENT 'n seconds, must be >=60 <=600   300',
  `CustomerId` int(11) NOT NULL COMMENT 'CustomerId',
  `OperatorId` int(11) NOT NULL COMMENT 'OperatorId',
  `DateCreated` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ap_radius_profile_ibfk_1` (`CustomerId`),
  CONSTRAINT `ap_radius_profile_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Radius Profile Configuration';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_radius_profile`
--

LOCK TABLES `ap_radius_profile` WRITE;
/*!40000 ALTER TABLE `ap_radius_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_radius_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_regulatory_compliance`
--

DROP TABLE IF EXISTS `ap_regulatory_compliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_regulatory_compliance` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Country` varchar(30) NOT NULL,
  `Code` varchar(3) NOT NULL,
  `24GHz` tinyint(1) DEFAULT 1,
  `5GHz` tinyint(1) DEFAULT 0,
  `6GHz` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_regulatory_compliance`
--

LOCK TABLES `ap_regulatory_compliance` WRITE;
/*!40000 ALTER TABLE `ap_regulatory_compliance` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_regulatory_compliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_sdwan`
--

DROP TABLE IF EXISTS `ap_sdwan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_sdwan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SDWanProfileName` varchar(50) DEFAULT NULL,
  `SDWanProfileNameAuto` varchar(20) DEFAULT NULL,
  `SDWanType` tinyint(1) DEFAULT NULL,
  `SDWanTrafficFlowType` tinyint(1) DEFAULT NULL,
  `SDWanVlanEnable` int(1) unsigned DEFAULT 0,
  `SDWanVlanId` int(5) unsigned DEFAULT 0,
  `SDWanVPNCertificate` text DEFAULT NULL,
  `SDWanVPNType` tinyint(1) DEFAULT NULL,
  `SDWanVPNCertificateMD5Sum` text DEFAULT NULL,
  `SDWanGreConcentratorIp` varchar(15) DEFAULT NULL,
  `SDWanGreKey` varchar(20) DEFAULT NULL,
  `EnableMultiWan` tinyint(1) DEFAULT NULL,
  `MultiwanMethod` enum('loadBalancing','failover') DEFAULT NULL,
  `PrimaryLoad` int(10) DEFAULT NULL,
  `SecondaryLoad` int(10) DEFAULT NULL,
  `TertinaryLoad` int(10) DEFAULT NULL,
  `QuadrilateralLoad` int(10) DEFAULT NULL,
  `SDWanVPNIp` varchar(15) DEFAULT NULL,
  `SDWanVPNNetmask` varchar(15) DEFAULT NULL,
  `SDWanVPNDhcpStart` varchar(15) DEFAULT NULL,
  `SDWanVPNDhcpEnd` varchar(15) DEFAULT NULL,
  `SDWanVPNLeaseInterval` varchar(15) DEFAULT NULL,
  `SDWanVPNDomainName` varchar(20) DEFAULT NULL,
  `SDWanVPNDnsPrimary` varchar(15) DEFAULT NULL,
  `SDWanVPNDnsSecondary` varchar(15) DEFAULT NULL,
  `SDWanGREIp` varchar(15) DEFAULT NULL,
  `SDWanGRENetmask` varchar(15) DEFAULT NULL,
  `SDWanGREDhcpStart` varchar(15) DEFAULT NULL,
  `SDWanGREDhcpEnd` varchar(15) DEFAULT NULL,
  `SDWanGRELeaseInterval` varchar(15) DEFAULT NULL,
  `SDWanGREDomainName` varchar(20) DEFAULT NULL,
  `SDWanGREDnsPrimary` varchar(15) DEFAULT NULL,
  `SDWanGREDnsSecondary` varchar(15) DEFAULT NULL,
  `SDWanGREFailover` tinyint(4) DEFAULT 0,
  `SDWanGREConcentratorFailoverIp` varchar(15) DEFAULT '0.0.0.0',
  `SDWanGREType` varchar(10) DEFAULT NULL,
  `SDWANOVSControllerIp` varchar(15) DEFAULT NULL,
  `SDWANOVSControllerPort` varchar(15) DEFAULT NULL,
  `SDWANOVSControllerDispatchDesc` varchar(225) DEFAULT NULL,
  `SDWANOVSControllerSecurity` tinyint(1) DEFAULT NULL,
  `SDOVSWanIp` varchar(15) DEFAULT NULL,
  `SDWanOVSNetmask` varchar(15) DEFAULT NULL,
  `SDWanOVSDhcpStart` varchar(15) DEFAULT NULL,
  `SDWanOVSDhcpEnd` varchar(15) DEFAULT NULL,
  `SDWanOVSLeaseInterval` varchar(15) DEFAULT NULL,
  `SDWanOVSDomainName` varchar(15) DEFAULT NULL,
  `SDWanOVSDnsPrimary` varchar(15) DEFAULT NULL,
  `SDWanOVSDnsSecondary` varchar(15) DEFAULT NULL,
  `SDWanOVSCertificatekey` text DEFAULT NULL,
  `SDWanOVSControllerCertificate` text DEFAULT NULL,
  `SDWanOVSCaCertificate` text DEFAULT NULL,
  `SDWanOVSCertificatekeyMD5Sum` text DEFAULT NULL,
  `SDWanOVSControllerCertificateMD5Sum` text DEFAULT NULL,
  `SDWanOVSCaCertificateMD5Sum` text DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `ap_sdwan` (`CustomerId`),
  CONSTRAINT `ap_sdwan` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_sdwan`
--

LOCK TABLES `ap_sdwan` WRITE;
/*!40000 ALTER TABLE `ap_sdwan` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_sdwan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_send_email_count`
--

DROP TABLE IF EXISTS `ap_send_email_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_send_email_count` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ApId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_send_email_count`
--

LOCK TABLES `ap_send_email_count` WRITE;
/*!40000 ALTER TABLE `ap_send_email_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_send_email_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_ssid`
--

DROP TABLE IF EXISTS `ap_ssid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_ssid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SSIDEnable` int(1) unsigned DEFAULT 0,
  `SSIDName` varchar(50) DEFAULT NULL,
  `SSIDSecurityType` tinyint(1) DEFAULT NULL,
  `SSIDHide` int(1) unsigned DEFAULT 0,
  `SSIDSecuredByKey` int(1) unsigned DEFAULT 0,
  `SSIDWpaKey` varchar(20) DEFAULT NULL,
  `NASId` varchar(20) DEFAULT NULL,
  `CipherType` varchar(20) DEFAULT NULL,
  `FTProtocol` varchar(20) DEFAULT NULL,
  `MobilityDomain` varchar(20) DEFAULT NULL,
  `MACFilterPolicy` varchar(20) DEFAULT NULL,
  `SSIDEnterpriseIp` varchar(15) DEFAULT NULL,
  `SSIDEnterprisePort` varchar(10) DEFAULT NULL,
  `SSIDEnterpriseSecret` varchar(50) DEFAULT NULL,
  `SSIDSDWan` int(11) DEFAULT NULL,
  `SSIDBroadcastingBand` tinyint(2) DEFAULT NULL,
  `WLanProfileId` int(11) NOT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `HotspotEnable` int(1) unsigned DEFAULT 0,
  `ExternalDHCPEnable` tinyint(1) DEFAULT 0,
  `NetworkName` varchar(30) DEFAULT NULL,
  `Days` varchar(7) DEFAULT NULL,
  `Hours` varchar(24) DEFAULT NULL,
  `AssociationRetryDelay` int(2) DEFAULT 10,
  `FastBSSTransition` tinyint(1) DEFAULT 1,
  `OpportunisticKeyCaching_okc` tinyint(1) DEFAULT 1,
  `OptimizedConnectivityExperience_OCE` tinyint(1) DEFAULT 1,
  `PreAuthentication` tinyint(1) DEFAULT 1,
  `DynamicVlan` tinyint(1) DEFAULT 0,
  `SpeedRestriction` tinyint(1) DEFAULT NULL,
  `DownloadRate` bigint(10) DEFAULT NULL,
  `DownloadRateUnit` tinyint(4) DEFAULT NULL,
  `UploadRate` bigint(10) DEFAULT NULL,
  `UploadRateUnit` tinyint(4) DEFAULT NULL,
  `ClientIsolation` tinyint(1) DEFAULT 0,
  `ManagementFrameProtection` tinyint(1) DEFAULT 1,
  `KRACKCounterMeasures` tinyint(1) DEFAULT 0,
  `SchedulingEnable` tinyint(1) DEFAULT 0,
  `RestrictAtSSID` tinyint(1) DEFAULT 0,
  `RestrictAtAAA` tinyint(1) DEFAULT 0,
  `ClientAssociationThreshold_RF` int(2) DEFAULT NULL,
  `VlanEnabled` tinyint(11) DEFAULT 0,
  `RadiusProfile` int(11) DEFAULT NULL,
  `MaxClient` int(11) DEFAULT NULL,
  `NetworkAuthProfileId` int(11) DEFAULT NULL,
  `NetworkType` tinyint(1) DEFAULT NULL,
  `PrivateNw` tinyint(1) DEFAULT NULL,
  `WanSubnetAccess` tinyint(1) DEFAULT NULL,
  `Radio1HexNumber` varchar(32) DEFAULT NULL,
  `Radio2HexNumber` varchar(32) DEFAULT NULL,
  `Radio3HexNumber` varchar(32) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `network_ssid_ibfk_1` (`WLanProfileId`),
  KEY `ap_ssid` (`CustomerId`),
  CONSTRAINT `ap_ssid` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ap_ssid_ibfk_1` FOREIGN KEY (`WLanProfileId`) REFERENCES `ap_wlan_profile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_ssid`
--

LOCK TABLES `ap_ssid` WRITE;
/*!40000 ALTER TABLE `ap_ssid` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_ssid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_wips`
--

DROP TABLE IF EXISTS `ap_wips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_wips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `WIPSEnable` tinyint(4) DEFAULT 0,
  `RogueRFCutoffThreshold` int(11) NOT NULL,
  `ReportedByNoAps` int(10) DEFAULT 0,
  `AdvertisesUnsecuredSSIDs` tinyint(4) DEFAULT 0,
  `AdvertisesAuthorizedSSIDs` varchar(50) NOT NULL,
  `AdvertisesFollowingSSIDs` varchar(50) NOT NULL,
  `EnableRogueAPDetection` tinyint(4) DEFAULT 0,
  `EnableHoneypotEvilTwinDetection` tinyint(4) DEFAULT 0,
  `EnableMisconfiguredAPDetection` tinyint(4) DEFAULT 0,
  `CustomerId` int(11) NOT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_wips`
--

LOCK TABLES `ap_wips` WRITE;
/*!40000 ALTER TABLE `ap_wips` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_wips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_wlan_profile`
--

DROP TABLE IF EXISTS `ap_wlan_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_wlan_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WLanProfileName` varchar(40) NOT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `NetworkAuthGroup` int(11) DEFAULT NULL,
  `RandomHexNumber` varchar(32) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `OperatorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ap_wlan_profile` (`CustomerId`),
  CONSTRAINT `ap_wlan_profile` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ap_wlan_profile`
--

LOCK TABLES `ap_wlan_profile` WRITE;
/*!40000 ALTER TABLE `ap_wlan_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_wlan_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_token`
--

DROP TABLE IF EXISTS `auth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AuthToken` varchar(200) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `TokenCreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `CustomerId` int(11) DEFAULT NULL,
  `AccountId` int(10) NOT NULL,
  `OperatorId` int(11) NOT NULL,
  `CustomerType` tinyint(4) DEFAULT NULL,
  `IpAddress` char(39) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_token`
--

LOCK TABLES `auth_token` WRITE;
/*!40000 ALTER TABLE `auth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `autologin`
--

DROP TABLE IF EXISTS `autologin`;
/*!50001 DROP VIEW IF EXISTS `autologin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `autologin` (
  `id` tinyint NOT NULL,
  `macaddress` tinyint NOT NULL,
  `created` tinyint NOT NULL,
  `description` tinyint NOT NULL,
  `expirydate` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `autologintype` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bill_2checkout_temp`
--

DROP TABLE IF EXISTS `bill_2checkout_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_2checkout_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_2checkout_temp`
--

LOCK TABLES `bill_2checkout_temp` WRITE;
/*!40000 ALTER TABLE `bill_2checkout_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_2checkout_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_2checkout_transaction`
--

DROP TABLE IF EXISTS `bill_2checkout_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_2checkout_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OrderNumber` varchar(100) DEFAULT NULL,
  `InvoiceId` varchar(100) DEFAULT NULL,
  `pay_method` varchar(10) DEFAULT NULL,
  `credit_card_processed` varchar(10) DEFAULT NULL,
  `HashKey` varchar(150) DEFAULT NULL,
  `Amount` varchar(10) DEFAULT NULL,
  `Status` varchar(30) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `Currency` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_2checkout_transaction`
--

LOCK TABLES `bill_2checkout_transaction` WRITE;
/*!40000 ALTER TABLE `bill_2checkout_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_2checkout_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_all_transaction`
--

DROP TABLE IF EXISTS `bill_all_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_all_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `GatewayTypeId` int(11) NOT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `ResponseCode` varchar(10) DEFAULT NULL,
  `TransactionId` varchar(25) DEFAULT NULL,
  `Amount` double(10,2) DEFAULT NULL,
  `TransactionType` varchar(20) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `ErrorCode` varchar(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DeviceId` int(10) DEFAULT NULL,
  `PendingReason` varchar(50) DEFAULT NULL,
  `FullName` varchar(50) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_all_transaction`
--

LOCK TABLES `bill_all_transaction` WRITE;
/*!40000 ALTER TABLE `bill_all_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_all_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_appliedpromotion`
--

DROP TABLE IF EXISTS `bill_appliedpromotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_appliedpromotion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PromotionId` int(10) unsigned DEFAULT NULL,
  `AppliedDate` datetime DEFAULT NULL,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `AppliedAmount` varchar(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_appliedpromotion`
--

LOCK TABLES `bill_appliedpromotion` WRITE;
/*!40000 ALTER TABLE `bill_appliedpromotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_appliedpromotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_atom_temp`
--

DROP TABLE IF EXISTS `bill_atom_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_atom_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `BillingState` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `ItemDescription` varchar(50) DEFAULT NULL,
  `TransAmount` varchar(10) DEFAULT NULL,
  `SuccessUrl` varchar(100) DEFAULT NULL,
  `FailUrl` varchar(100) DEFAULT NULL,
  `BillDataRequired` tinyint(1) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AtomPaymentId` varchar(20) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_atom_temp`
--

LOCK TABLES `bill_atom_temp` WRITE;
/*!40000 ALTER TABLE `bill_atom_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_atom_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_atom_transaction`
--

DROP TABLE IF EXISTS `bill_atom_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_atom_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `BillingEmail` varchar(100) DEFAULT NULL,
  `AM_PaymentId` varchar(100) DEFAULT NULL,
  `AM_TransactionId` varchar(100) DEFAULT NULL,
  `AM_BankTransactionId` varchar(100) DEFAULT NULL,
  `TransactionStatus` varchar(100) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TransactionType` varchar(100) DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  `Surcharge` int(20) unsigned DEFAULT NULL,
  `ProductID` int(10) DEFAULT NULL,
  `ClientCode` int(20) DEFAULT NULL,
  `BankName` varchar(50) DEFAULT NULL,
  `Descriminator` varchar(10) DEFAULT NULL,
  `CardNumber` int(20) unsigned DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `CustomerEmailId` varchar(50) DEFAULT NULL,
  `CustomerMobileNumber` varchar(20) DEFAULT NULL,
  `BillingAddress` varchar(150) DEFAULT NULL,
  `MerchantData` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_atom_transaction`
--

LOCK TABLES `bill_atom_transaction` WRITE;
/*!40000 ALTER TABLE `bill_atom_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_atom_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_authnet_backup`
--

DROP TABLE IF EXISTS `bill_authnet_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_authnet_backup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `BillingName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Auth_ResponseCode` char(3) DEFAULT NULL,
  `Auth_ResponseSubcode` char(3) DEFAULT NULL,
  `Auth_ReasonCode` char(3) DEFAULT NULL,
  `Auth_ReasonCodeText` varchar(150) DEFAULT NULL,
  `Auth_ApprovalCode` varchar(10) DEFAULT NULL,
  `Auth_AVSResultCode` char(3) DEFAULT NULL,
  `Auth_TransactionID` varchar(10) DEFAULT NULL,
  `Auth_CVVResponseCode` char(3) DEFAULT NULL,
  `Auth_InvoiceNumber` varchar(10) DEFAULT NULL,
  `Auth_Method` varchar(10) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_authnet_backup`
--

LOCK TABLES `bill_authnet_backup` WRITE;
/*!40000 ALTER TABLE `bill_authnet_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_authnet_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_authnet_paymentinfo`
--

DROP TABLE IF EXISTS `bill_authnet_paymentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_authnet_paymentinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `CardType` varchar(20) DEFAULT NULL,
  `CardExpiryDate` date DEFAULT NULL,
  `CvvNumber` varchar(20) DEFAULT NULL,
  `NextBillingDate` datetime DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_authnet_paymentinfo`
--

LOCK TABLES `bill_authnet_paymentinfo` WRITE;
/*!40000 ALTER TABLE `bill_authnet_paymentinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_authnet_paymentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_authnet_transaction`
--

DROP TABLE IF EXISTS `bill_authnet_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_authnet_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `FullName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Auth_ResponseCode` char(3) DEFAULT NULL,
  `Auth_ResponseSubcode` char(3) DEFAULT NULL,
  `Auth_ReasonCode` char(3) DEFAULT NULL,
  `Auth_ReasonCodeText` varchar(150) DEFAULT NULL,
  `Auth_ApprovalCode` varchar(10) DEFAULT NULL,
  `Auth_AVSResultCode` char(3) DEFAULT NULL,
  `Auth_TransactionID` varchar(16) DEFAULT NULL,
  `Auth_CVVResponseCode` char(3) DEFAULT NULL,
  `Auth_InvoiceNumber` varchar(10) DEFAULT NULL,
  `Auth_Method` varchar(10) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_authnet_transaction`
--

LOCK TABLES `bill_authnet_transaction` WRITE;
/*!40000 ALTER TABLE `bill_authnet_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_authnet_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_billdesk_temp`
--

DROP TABLE IF EXISTS `bill_billdesk_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_billdesk_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  `Action` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_billdesk_temp`
--

LOCK TABLES `bill_billdesk_temp` WRITE;
/*!40000 ALTER TABLE `bill_billdesk_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_billdesk_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_Bkash_temp`
--

DROP TABLE IF EXISTS `bill_Bkash_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `bill_Bkash_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `MerchantInvoiceNo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_Bkash_temp`
--

LOCK TABLES `bill_Bkash_temp` WRITE;
/*!40000 ALTER TABLE `bill_Bkash_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_Bkash_temp` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `bill_Bkash_transaction`
--

DROP TABLE IF EXISTS `bill_Bkash_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_Bkash_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Bkash_Responsemessage` varchar(100) DEFAULT NULL,
  `Bkash_ResponseCode` varchar(100) DEFAULT NULL,
  `Bkash_TransactionID` varchar(100) DEFAULT NULL,
  `MerchantInvoiceNo` varchar(100) DEFAULT NULL,
  `TransactionStatus` varchar(100) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `Bkash_PaymentMode` varchar(20) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOCK TABLES `bill_Bkash_transaction` WRITE;
/*!40000 ALTER TABLE `bill_Bkash_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_Bkash_transaction` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `bill_billdesk_transaction`
--

DROP TABLE IF EXISTS `bill_billdesk_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_billdesk_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Bd_PaymentId` varchar(20) DEFAULT NULL,
  `Bd_TxnRefNo` varchar(15) DEFAULT NULL,
  `Bd_BankRefNo` varchar(15) DEFAULT NULL,
  `Bd_BankId` varchar(20) DEFAULT NULL,
  `Bd_BankMerchantId` varchar(10) DEFAULT NULL,
  `Bd_Currency` varchar(5) DEFAULT NULL,
  `Bd_ErrorCode` varchar(5) DEFAULT NULL,
  `Bd_ErrorDesc` varchar(100) DEFAULT NULL,
  `MPaymentId` varchar(20) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranStatus` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `AmountFee` varchar(10) DEFAULT NULL,
  `AmountNet` varchar(10) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Bd_ResponseCode` varchar(6) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `Tempid` varchar(10) DEFAULT NULL,
  `Action` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LocationId` (`LocationId`),
  KEY `CustomerId` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_billdesk_transaction`
--

LOCK TABLES `bill_billdesk_transaction` WRITE;
/*!40000 ALTER TABLE `bill_billdesk_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_billdesk_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_ccavenue_temp`
--

DROP TABLE IF EXISTS `bill_ccavenue_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_ccavenue_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `BillingState` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `ItemDescription` varchar(50) DEFAULT NULL,
  `TransAmount` varchar(10) DEFAULT NULL,
  `SuccessUrl` varchar(100) DEFAULT NULL,
  `FailUrl` varchar(100) DEFAULT NULL,
  `BillDataRequired` tinyint(1) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CC_OrderId` varchar(20) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_ccavenue_temp`
--

LOCK TABLES `bill_ccavenue_temp` WRITE;
/*!40000 ALTER TABLE `bill_ccavenue_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_ccavenue_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_ccavenue_transaction`
--

DROP TABLE IF EXISTS `bill_ccavenue_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_ccavenue_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BillingName` varchar(40) DEFAULT NULL,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `CC_OrderId` varchar(30) DEFAULT NULL,
  `CC_TrackingId` varchar(12) DEFAULT NULL,
  `CC_BankRefNo` varchar(150) DEFAULT NULL,
  `CC_OrderStatus` varchar(20) DEFAULT NULL,
  `CC_FailureMessage` varchar(150) DEFAULT NULL,
  `CC_PaymentMode` varchar(30) DEFAULT NULL,
  `CC_StatusCode` varchar(5) DEFAULT NULL,
  `CC_StatusMessage` varchar(150) DEFAULT NULL,
  `CC_Vault` varchar(30) DEFAULT NULL,
  `CC_OfferType` varchar(30) DEFAULT NULL,
  `CC_OfferCode` varchar(30) DEFAULT NULL,
  `CardNumber` varchar(50) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_ccavenue_transaction`
--

LOCK TABLES `bill_ccavenue_transaction` WRITE;
/*!40000 ALTER TABLE `bill_ccavenue_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_ccavenue_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_config`
--

DROP TABLE IF EXISTS `bill_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CycleTime` tinyint(3) DEFAULT NULL,
  `CycleFrequency` tinyint(2) DEFAULT NULL,
  `NextBillingDate` datetime DEFAULT NULL,
  `LastBillingDate` datetime DEFAULT NULL,
  `BillingEmailAddress` varchar(50) DEFAULT NULL,
  `MaxFailedAttempts` tinyint(1) DEFAULT NULL,
  `NotifyRegistration` tinyint(1) DEFAULT NULL,
  `RegistrationEmails` varchar(200) DEFAULT NULL,
  `SummaryEmails` varchar(200) DEFAULT NULL,
  `ConfirmTemplateId` int(10) unsigned DEFAULT NULL,
  `ReceiptTemplateId` int(10) unsigned DEFAULT NULL,
  `CardDeclineTemplateId` int(10) unsigned DEFAULT NULL,
  `CardExpiringTemplateId` int(10) unsigned DEFAULT NULL,
  `ReleaseOnSuccess` tinyint(1) DEFAULT NULL,
  `VerifyCardUpdate` tinyint(1) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OnFailAction` tinyint(1) DEFAULT NULL,
  `RestrictedGroup` varchar(30) DEFAULT NULL,
  `RenewTemplateId` int(10) DEFAULT NULL,
  `ExpiredTemplateId` int(10) DEFAULT NULL,
  `DailySignupEmails` varchar(200) DEFAULT NULL,
  `SmsTemplateId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_config`
--

LOCK TABLES `bill_config` WRITE;
/*!40000 ALTER TABLE `bill_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_echo_transaction`
--

DROP TABLE IF EXISTS `bill_echo_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_echo_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `BillingName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Echo_AuthCode` varchar(10) DEFAULT NULL,
  `Echo_AVSResult` char(3) DEFAULT NULL,
  `Echo_DeclineCode` varchar(5) DEFAULT NULL,
  `Echo_Reference` varchar(10) DEFAULT NULL,
  `Echo_Mac` char(2) DEFAULT NULL,
  `Echo_MerchantName` varchar(20) DEFAULT NULL,
  `Echo_MerchantTraceNbr` varchar(10) DEFAULT NULL,
  `Echo_SecurityResult` char(3) DEFAULT NULL,
  `Echo_Status` char(1) DEFAULT NULL,
  `Echo_TermCode` varchar(5) DEFAULT NULL,
  `Echo_OrderNumber` varchar(15) DEFAULT NULL,
  `Echo_Version` varchar(10) DEFAULT NULL,
  `TranAmount` varchar(8) DEFAULT NULL,
  `TranDate` varchar(15) DEFAULT NULL,
  `TranType` varchar(10) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `Version` varchar(5) DEFAULT NULL,
  `CurrencyCode` char(3) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_echo_transaction`
--

LOCK TABLES `bill_echo_transaction` WRITE;
/*!40000 ALTER TABLE `bill_echo_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_echo_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_enkap_temp`
--

DROP TABLE IF EXISTS `bill_enkap_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_enkap_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `FullName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Address` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `City` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `State` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `Zipcode` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `Country` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Gender` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `HomePhone` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `CellPhone` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `WorkPhone` varchar(12) CHARACTER SET utf8 DEFAULT NULL,
  `SecretQuestion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `SecretAnswer` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `FailUrl` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `orderTransactionId` varchar(50) NOT NULL,
  `MerchantReferenceId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `LocationId` (`LocationId`),
  KEY `LocationId_2` (`LocationId`),
  KEY `CustomerId_2` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_enkap_temp`
--

LOCK TABLES `bill_enkap_temp` WRITE;
/*!40000 ALTER TABLE `bill_enkap_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_enkap_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_enkap_transaction`
--

DROP TABLE IF EXISTS `bill_enkap_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_enkap_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `orderTransactionId` varchar(50) NOT NULL,
  `MerchantReferenceId` varchar(50) NOT NULL,
  `paymentStatus` varchar(50) NOT NULL,
  `paymentProviderName` varchar(50) NOT NULL,
  `paymentProviderId` varchar(150) NOT NULL,
  `totalAmount` varchar(50) NOT NULL,
  `currency` varchar(50) NOT NULL,
  `paymentDate` datetime DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `EnakapTempId` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LocationId` (`LocationId`),
  KEY `CustomerId` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_enkap_transaction`
--

LOCK TABLES `bill_enkap_transaction` WRITE;
/*!40000 ALTER TABLE `bill_enkap_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_enkap_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_epay_transaction`
--

DROP TABLE IF EXISTS `bill_epay_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_epay_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `BillingName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `EPay_Status` varchar(10) DEFAULT NULL,
  `EPay_Result` varchar(5) DEFAULT NULL,
  `EPay_ResultCode` varchar(2) DEFAULT NULL,
  `EPay_AuthCode` varchar(10) DEFAULT NULL,
  `EPay_RefNum` varchar(10) DEFAULT NULL,
  `EPay_Error` varchar(100) DEFAULT NULL,
  `EPay_ErrorCode` varchar(5) DEFAULT NULL,
  `EPay_AVSResultCode` varchar(10) DEFAULT NULL,
  `EPay_CVVResultCode` varchar(10) DEFAULT NULL,
  `Auth_Method` varchar(10) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bLocationId` (`LocationId`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_epay_transaction`
--

LOCK TABLES `bill_epay_transaction` WRITE;
/*!40000 ALTER TABLE `bill_epay_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_epay_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_flutterstd_transaction`
--

DROP TABLE IF EXISTS `bill_flutterstd_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_flutterstd_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `txid` varchar(50) DEFAULT NULL,
  `txref` varchar(50) DEFAULT NULL,
  `devicefingerprint` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `chargecode` int(11) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `paymenttype` varchar(40) DEFAULT NULL,
  `paymentid` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `expirymonth` int(11) DEFAULT NULL,
  `expiryyear` int(11) DEFAULT NULL,
  `cardBIN` int(11) DEFAULT NULL,
  `last4digits` int(11) DEFAULT NULL,
  `brand` varchar(40) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `flutterTempId` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_flutterstd_transaction`
--

LOCK TABLES `bill_flutterstd_transaction` WRITE;
/*!40000 ALTER TABLE `bill_flutterstd_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_flutterstd_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_flutterwave_temp`
--

DROP TABLE IF EXISTS `bill_flutterwave_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_flutterwave_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `SecretKey` varchar(100) DEFAULT NULL,
  `TxRef` varchar(100) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_flutterwave_temp`
--

LOCK TABLES `bill_flutterwave_temp` WRITE;
/*!40000 ALTER TABLE `bill_flutterwave_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_flutterwave_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_gateway`
--

DROP TABLE IF EXISTS `bill_gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_gateway` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `GatewayTypeId` int(10) unsigned DEFAULT NULL,
  `MerchantId` varchar(50) DEFAULT NULL,
  `PublicKey` varchar(200) DEFAULT NULL,
  `SecretKey` varchar(200) DEFAULT NULL,
  `SecretHash` varchar(200) DEFAULT NULL,
  `PinCode` varchar(50) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `TestMode` tinyint(1) DEFAULT NULL,
  `PaypalUserName` varchar(60) DEFAULT NULL,
  `CurrencyCode` varchar(10) DEFAULT NULL,
  `Partner` varchar(30) DEFAULT NULL,
  `User` varchar(30) DEFAULT NULL,
  `RedirectServerIp` varchar(100) DEFAULT NULL,
  `EncryptionKey` varchar(100) DEFAULT NULL,
  `UsageType` tinyint(4) DEFAULT 1,
  `IsEnabledUpi` tinyint(1) DEFAULT 0,
  `UpiId` varchar(20) DEFAULT NULL,
  `EnabledFor` enum('Par','Res','Loc') DEFAULT NULL,
  `EnabledForId` int(10) DEFAULT NULL,
  `IsEnabled` tinyint(1) DEFAULT NULL,
  `AdminFlag` tinyint(1) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_gateway`
--

LOCK TABLES `bill_gateway` WRITE;
/*!40000 ALTER TABLE `bill_gateway` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_gateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_gatewaytype`
--

DROP TABLE IF EXISTS `bill_gatewaytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_gatewaytype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `GatewayName` varchar(50) DEFAULT NULL,
  `VendorName` varchar(30) DEFAULT NULL,
  `GatewayUrl` varchar(100) DEFAULT NULL,
  `TestMode` tinyint(1) DEFAULT NULL,
  `TestGatewayUrl` varchar(100) DEFAULT NULL,
  `Version` char(3) DEFAULT NULL,
  `AdapterSupport` tinyint(1) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Debug` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_gatewaytype`
--

LOCK TABLES `bill_gatewaytype` WRITE;
/*!40000 ALTER TABLE `bill_gatewaytype` DISABLE KEYS */;
INSERT INTO `bill_gatewaytype` VALUES (1,'Authorize.Net','Authorize.Net','https://secure.authorize.net/gateway/transact.dll',1,'https://test.authorize.net/gateway/transact.dll','3.1',1,'USA',NULL),(2,'PayPal.Std','PayPal.Std','https://www.paypal.com/cgi-bin/webscr',0,'https://www.sandbox.paypal.com/cgi-bin/webscr','1.0',0,'Worldwide',NULL),(3,'Flutterwave_Rave','Flutterwave_Rave','https://api.ravepay.co',1,'https://ravesandboxapi.flutterwave.com','2.0',0,'Nigeria',NULL),(4,'Enkap','Enkap','https://api.enkap.cm/',1,'https://api.enkap.cm/','v1',0,'Cameroon',NULL),(5,'2Checkout','2Checkout','https://www.2checkout.com/checkout/purchase',1,'https://sandbox.2checkout.com/checkout/purchase','v1',0,'USA',NULL),(6,'PayUMoney','PayUMoney','https://secure.payu.in',1,'https://sandboxsecure.payu.in',NULL,0,'India',NULL),(7,'Stripe','Stripe','https://stripe.com',1,'https://stripe.com',NULL,0,'',NULL),(8,'BillDesk','BillDesk','https://pgi.billdesk.com/pgidsk/PGIMerchantPaymen\nt',1,'https://www.billdesk.com/pgidsk/pgijsp/MerchantPaymentoption.jsp',NULL,0,NULL,NULL),(9,'Razorpay','Razorpay','https://api.razorpay.com/v1',1,'https://api.razorpay.com/v1','2.5',0,NULL,NULL),(10,'Monetbil','Monetbil','https://api.monetbil.com/widget/',1,'https://api.monetbil.com/widget/','2.1',0,'CAMEROON',NULL),(11,'Monetbil','Monetbil','https://api.monetbil.com/widget/',1,'https://api.monetbil.com/widget/','2.1',0,'CAMEROON',NULL),(12,'Paytm','Paytm','https://securegw.paytm.in/theia/processTransaction',1,'https://securegw-stage.paytm.in/theia/processTransaction',NULL,NULL,NULL,NULL),(13,'Kkiapay','Kkiapay','https://api.kkiapay.me',1,'https://api-sandbox.kkiapay.me','1.0',0,'Worldwide',0);
/*!40000 ALTER TABLE `bill_gatewaytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_instamojo_temp`
--

DROP TABLE IF EXISTS `bill_instamojo_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_instamojo_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(20) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `BillingState` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `WorkPhone` varchar(20) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(128) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `ItemDescription` varchar(50) DEFAULT NULL,
  `TransAmount` varchar(10) DEFAULT NULL,
  `SuccessUrl` varchar(100) DEFAULT NULL,
  `FailUrl` varchar(100) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  `MAC` varchar(50) DEFAULT NULL,
  `UserAction` varchar(200) DEFAULT NULL,
  `PaymentRequestId` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `Purpose` varchar(100) DEFAULT NULL,
  `redirect_url` varchar(100) DEFAULT NULL,
  `webhook` varchar(100) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `MPaymentId` varchar(20) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `IsRenew` varchar(5) DEFAULT NULL,
  `AptNumber` varchar(10) DEFAULT NULL,
  `CountryCode` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `LocationId` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_instamojo_temp`
--

LOCK TABLES `bill_instamojo_temp` WRITE;
/*!40000 ALTER TABLE `bill_instamojo_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_instamojo_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_instamojo_transaction`
--

DROP TABLE IF EXISTS `bill_instamojo_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_instamojo_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `CustomerEmailId` varchar(100) DEFAULT NULL,
  `CustomerMobileNumber` varchar(20) DEFAULT NULL,
  `BillingAddress` varchar(20) DEFAULT NULL,
  `PaymentId` varchar(100) DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  `PaymentRequestId` varchar(50) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(50) DEFAULT NULL,
  `Currency` varchar(5) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `Fees` varchar(10) DEFAULT NULL,
  `TxnDate` datetime DEFAULT NULL,
  `MAC` varchar(50) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `UserAction` varchar(200) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `ClientMAC` varchar(20) DEFAULT NULL,
  `UnitPrice` varchar(10) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `OfferSlug` varchar(20) DEFAULT NULL,
  `OfferTitle` varchar(50) DEFAULT NULL,
  `CustomerId` varchar(20) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `TempId` varchar(10) DEFAULT NULL,
  `TransactionStatus` varchar(20) DEFAULT NULL,
  `TransactionType` varchar(100) DEFAULT NULL,
  `BillingInstrument` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `LocationId` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_instamojo_transaction`
--

LOCK TABLES `bill_instamojo_transaction` WRITE;
/*!40000 ALTER TABLE `bill_instamojo_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_instamojo_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_kkiapay_temp`
--

DROP TABLE IF EXISTS `bill_kkiapay_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_kkiapay_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_kkiapay_temp`
--

LOCK TABLES `bill_kkiapay_temp` WRITE;
/*!40000 ALTER TABLE `bill_kkiapay_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_kkiapay_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_kkiapay_transaction`
--

DROP TABLE IF EXISTS `bill_kkiapay_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_kkiapay_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `CustomerEmailId` varchar(100) DEFAULT NULL,
  `CustomerMobileNumber` varchar(20) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `SOURCE` varchar(30) DEFAULT NULL,
  `source_common_name` varchar(30) DEFAULT NULL,
  `fees` varchar(30) DEFAULT NULL,
  `net` varchar(30) DEFAULT NULL,
  `paymentlink` varchar(30) DEFAULT NULL,
  `country` varchar(10) DEFAULT NULL,
  `reason` varchar(30) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `clientFullName` varchar(30) DEFAULT NULL,
  `clientCountry` varchar(10) DEFAULT NULL,
  `clientPhone` varchar(30) DEFAULT NULL,
  `clientEmail` varchar(30) DEFAULT NULL,
  `clientAccount` varchar(30) DEFAULT NULL,
  `clientPerson` varchar(30) DEFAULT NULL,
  `session` varchar(30) DEFAULT NULL,
  `performedAt` varchar(30) DEFAULT NULL,
  `performed_at` varchar(30) DEFAULT NULL,
  `received_at` varchar(30) DEFAULT NULL,
  `CURRENCY` varchar(15) DEFAULT NULL,
  `ORDERID` varchar(20) DEFAULT NULL,
  `TXNTRANSACTIONID` varchar(20) DEFAULT NULL,
  `TXNAMOUNT` varchar(15) DEFAULT NULL,
  `STATUS` varchar(15) DEFAULT NULL,
  `TXNDATE` datetime DEFAULT NULL,
  `MAC` varchar(20) DEFAULT NULL,
  `RestrictLocation` int(11) DEFAULT NULL,
  `TempId` int(11) DEFAULT NULL,
  `TransactionStatus` varchar(20) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `Action` varchar(20) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `LocationId` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_kkiapay_transaction`
--

LOCK TABLES `bill_kkiapay_transaction` WRITE;
/*!40000 ALTER TABLE `bill_kkiapay_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_kkiapay_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_monetbil_temp`
--

DROP TABLE IF EXISTS `bill_monetbil_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_monetbil_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `PaymentRef` varchar(100) DEFAULT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `Amount` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_monetbil_temp`
--

LOCK TABLES `bill_monetbil_temp` WRITE;
/*!40000 ALTER TABLE `bill_monetbil_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_monetbil_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_monetbil_transaction`
--

DROP TABLE IF EXISTS `bill_monetbil_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_monetbil_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `PaymentRef` varchar(50) DEFAULT NULL,
  `MonetbilSign` varchar(50) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `Amount` varchar(10) DEFAULT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `TempId` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_monetbil_transaction`
--

LOCK TABLES `bill_monetbil_transaction` WRITE;
/*!40000 ALTER TABLE `bill_monetbil_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_monetbil_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payfast_temp`
--

DROP TABLE IF EXISTS `bill_payfast_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payfast_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `BillingState` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `ItemDescription` varchar(50) DEFAULT NULL,
  `TransAmount` varchar(10) DEFAULT NULL,
  `SuccessUrl` varchar(100) DEFAULT NULL,
  `FailUrl` varchar(100) DEFAULT NULL,
  `BillDataRequired` tinyint(1) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `MPaymentId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payfast_temp`
--

LOCK TABLES `bill_payfast_temp` WRITE;
/*!40000 ALTER TABLE `bill_payfast_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payfast_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payfaststd_transaction`
--

DROP TABLE IF EXISTS `bill_payfaststd_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payfaststd_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PfPaymentId` varchar(20) DEFAULT NULL,
  `MPaymentId` varchar(20) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranStatus` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `AmountFee` varchar(10) DEFAULT NULL,
  `AmountNet` varchar(10) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payfaststd_transaction`
--

LOCK TABLES `bill_payfaststd_transaction` WRITE;
/*!40000 ALTER TABLE `bill_payfaststd_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payfaststd_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payflow_transaction`
--

DROP TABLE IF EXISTS `bill_payflow_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payflow_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `RESULT` int(5) DEFAULT NULL,
  `PNREF` varchar(20) DEFAULT NULL,
  `CVV2MATCH` tinyint(1) DEFAULT NULL,
  `RESPMSG` varchar(50) DEFAULT NULL,
  `AUTHCODE` varchar(10) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payflow_transaction`
--

LOCK TABLES `bill_payflow_transaction` WRITE;
/*!40000 ALTER TABLE `bill_payflow_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payflow_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_paymentinfo`
--

DROP TABLE IF EXISTS `bill_paymentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_paymentinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BusinessName` varchar(40) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `City` varchar(40) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  `CardName` varchar(50) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `CardType` varchar(15) DEFAULT NULL,
  `CardExpiryDate` date DEFAULT NULL,
  `CardZipcode` varchar(15) DEFAULT NULL,
  `CvvNumber` varchar(5) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_paymentinfo`
--

LOCK TABLES `bill_paymentinfo` WRITE;
/*!40000 ALTER TABLE `bill_paymentinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_paymentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_paypal_backup`
--

DROP TABLE IF EXISTS `bill_paypal_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_paypal_backup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `BillingName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Paypal_Ack` varchar(10) DEFAULT NULL,
  `Paypal_ErrorCode` varchar(10) DEFAULT NULL,
  `Paypal_LongMessage` varchar(150) DEFAULT NULL,
  `Paypal_ShortMessage` varchar(100) DEFAULT NULL,
  `Paypal_AVSCode` char(3) DEFAULT NULL,
  `Paypal_CVV2Code` char(3) DEFAULT NULL,
  `Paypal_TransactionID` varchar(20) DEFAULT NULL,
  `Paypal_CorrelationID` varchar(20) DEFAULT NULL,
  `Paypal_Timestamp` varchar(25) DEFAULT NULL,
  `Paypal_Version` varchar(10) DEFAULT NULL,
  `Paypal_Build` varchar(10) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_paypal_backup`
--

LOCK TABLES `bill_paypal_backup` WRITE;
/*!40000 ALTER TABLE `bill_paypal_backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_paypal_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_paypal_temp`
--

DROP TABLE IF EXISTS `bill_paypal_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_paypal_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_paypal_temp`
--

LOCK TABLES `bill_paypal_temp` WRITE;
/*!40000 ALTER TABLE `bill_paypal_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_paypal_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_paypal_transaction`
--

DROP TABLE IF EXISTS `bill_paypal_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_paypal_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `FullName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Paypal_Ack` varchar(25) DEFAULT NULL,
  `Paypal_ErrorCode` varchar(10) DEFAULT NULL,
  `Paypal_LongMessage` varchar(150) DEFAULT NULL,
  `Paypal_ShortMessage` varchar(100) DEFAULT NULL,
  `Paypal_AVSCode` char(3) DEFAULT NULL,
  `Paypal_CVV2Code` char(3) DEFAULT NULL,
  `Paypal_TransactionID` varchar(20) DEFAULT NULL,
  `Paypal_CorrelationID` varchar(20) DEFAULT NULL,
  `Paypal_Timestamp` varchar(25) DEFAULT NULL,
  `Paypal_Version` varchar(10) DEFAULT NULL,
  `Paypal_Build` varchar(10) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_paypal_transaction`
--

LOCK TABLES `bill_paypal_transaction` WRITE;
/*!40000 ALTER TABLE `bill_paypal_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_paypal_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_paypalstd_transaction`
--

DROP TABLE IF EXISTS `bill_paypalstd_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_paypalstd_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Paypal_ResponseMessage` varchar(20) DEFAULT NULL,
  `Paypal_ErrorCode` varchar(10) DEFAULT NULL,
  `Paypal_TransactionID` varchar(25) DEFAULT NULL,
  `PayPal_ResponseCode` varchar(6) DEFAULT NULL,
  `Paypal_PendingReason` varchar(50) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT 0,
  `DateCreated` datetime DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `PayPalTempId` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_paypalstd_transaction`
--

LOCK TABLES `bill_paypalstd_transaction` WRITE;
/*!40000 ALTER TABLE `bill_paypalstd_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_paypalstd_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payprin_axis_temp`
--

DROP TABLE IF EXISTS `bill_payprin_axis_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payprin_axis_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `InvoiceNumber` varchar(30) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payprin_axis_temp`
--

LOCK TABLES `bill_payprin_axis_temp` WRITE;
/*!40000 ALTER TABLE `bill_payprin_axis_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payprin_axis_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payprin_axis_transaction`
--

DROP TABLE IF EXISTS `bill_payprin_axis_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payprin_axis_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `BillingName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Payprin_Axis_Invoice` varchar(30) DEFAULT NULL,
  `Payprin_Axis_TransactionID` varchar(30) DEFAULT NULL,
  `Payprin_Axis_AuthCode` varchar(30) DEFAULT NULL,
  `Payprin_Axis_AVSCode` varchar(5) DEFAULT NULL,
  `Payprin_Axis_CVV2Code` varchar(5) DEFAULT NULL,
  `Payprin_Axis_ErrorCode` varchar(10) DEFAULT NULL,
  `Payprin_Axis_ResponseCode` varchar(10) DEFAULT NULL,
  `Payprin_Axis_TransStatus` varchar(20) DEFAULT NULL,
  `Payprin_Axis_TranAmount` varchar(10) DEFAULT NULL,
  `Payprin_Axis_TranType` varchar(20) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payprin_axis_transaction`
--

LOCK TABLES `bill_payprin_axis_transaction` WRITE;
/*!40000 ALTER TABLE `bill_payprin_axis_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payprin_axis_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_paytm_temp`
--

DROP TABLE IF EXISTS `bill_paytm_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_paytm_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `CheckSum` varchar(250) DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_paytm_temp`
--

LOCK TABLES `bill_paytm_temp` WRITE;
/*!40000 ALTER TABLE `bill_paytm_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_paytm_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_paytmstd_transaction`
--

DROP TABLE IF EXISTS `bill_paytmstd_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_paytmstd_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(40) DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Paytm_Responsemessage` varchar(100) DEFAULT NULL,
  `Paytm_ResponseCode` varchar(100) DEFAULT NULL,
  `Paytm_TransactionID` varchar(100) DEFAULT NULL,
  `OrderID` varchar(100) DEFAULT NULL,
  `TranStatus` varchar(100) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `Paytm_PaymentMode` varchar(20) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_paytmstd_transaction`
--

LOCK TABLES `bill_paytmstd_transaction` WRITE;
/*!40000 ALTER TABLE `bill_paytmstd_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_paytmstd_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payu_temp`
--

DROP TABLE IF EXISTS `bill_payu_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payu_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `BillingState` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `ItemDescription` varchar(50) DEFAULT NULL,
  `TransAmount` varchar(10) DEFAULT NULL,
  `SuccessUrl` varchar(100) DEFAULT NULL,
  `FailUrl` varchar(100) DEFAULT NULL,
  `BillDataRequired` tinyint(1) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `PayUPaymentId` varchar(20) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payu_temp`
--

LOCK TABLES `bill_payu_temp` WRITE;
/*!40000 ALTER TABLE `bill_payu_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payu_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payu_transaction`
--

DROP TABLE IF EXISTS `bill_payu_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payu_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `UserId` int(10) unsigned DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PU_PayUTransactionId` varchar(100) DEFAULT NULL,
  `PU_TransactionId` varchar(100) DEFAULT NULL,
  `PU_TransactionStatus` varchar(100) DEFAULT NULL,
  `PU_ReturnCode` varchar(100) DEFAULT NULL,
  `PU_TransactionType` varchar(100) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranStatus` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `AmountFee` varchar(10) DEFAULT NULL,
  `AmountNet` varchar(10) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payu_transaction`
--

LOCK TABLES `bill_payu_transaction` WRITE;
/*!40000 ALTER TABLE `bill_payu_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payu_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payumoney_temp`
--

DROP TABLE IF EXISTS `bill_payumoney_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payumoney_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `HashString` varchar(300) DEFAULT NULL,
  `SecureKey` varchar(30) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `PaymentId` varchar(25) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `IsRenew` int(5) DEFAULT NULL,
  `RestrictLocation` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payumoney_temp`
--

LOCK TABLES `bill_payumoney_temp` WRITE;
/*!40000 ALTER TABLE `bill_payumoney_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payumoney_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payzen_temp`
--

DROP TABLE IF EXISTS `bill_payzen_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payzen_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `BillingState` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `ItemDescription` varchar(50) DEFAULT NULL,
  `TransAmount` varchar(10) DEFAULT NULL,
  `SuccessUrl` varchar(100) DEFAULT NULL,
  `FailUrl` varchar(100) DEFAULT NULL,
  `BillDataRequired` tinyint(1) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `PayzenPaymentId` varchar(20) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payzen_temp`
--

LOCK TABLES `bill_payzen_temp` WRITE;
/*!40000 ALTER TABLE `bill_payzen_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payzen_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_payzen_transaction`
--

DROP TABLE IF EXISTS `bill_payzen_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_payzen_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BillingName` varchar(40) DEFAULT NULL,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Vads_Auth_Number` varchar(6) DEFAULT NULL,
  `Vads_Auth_Result` int(2) DEFAULT NULL,
  `Vads_Site_Id` int(8) DEFAULT NULL,
  `Vads_Trans_Id` int(6) DEFAULT NULL,
  `Vads_Warranty_Result` varchar(100) DEFAULT NULL,
  `Vads_Payment_Src` varchar(100) DEFAULT NULL,
  `Vads_Bank_Product` varchar(3) DEFAULT NULL,
  `Vads_Operation_Type` varchar(100) DEFAULT NULL,
  `Vads_Threeds_Status` varchar(1) DEFAULT NULL,
  `Vads_Result` int(2) DEFAULT NULL,
  `Vads_Card_Country` varchar(3) DEFAULT NULL,
  `Vads_Language` varchar(2) DEFAULT NULL,
  `Vads_Page_Action` varchar(100) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `Currency` varchar(3) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_payzen_transaction`
--

LOCK TABLES `bill_payzen_transaction` WRITE;
/*!40000 ALTER TABLE `bill_payzen_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_payzen_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_plan`
--

DROP TABLE IF EXISTS `bill_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PlanName` varchar(100) DEFAULT NULL,
  `LoginPolicyId` int(10) NOT NULL,
  `SetupFee` varchar(50) DEFAULT NULL,
  `RecurringFee` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT 1,
  `DateCreated` datetime DEFAULT NULL,
  `BillingCycle` tinyint(1) DEFAULT NULL,
  `BillingInterval` tinyint(1) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  `TotalClients` int(10) DEFAULT NULL,
  `PlanType` tinyint(1) DEFAULT NULL,
  `PlanGroupId` int(10) DEFAULT NULL,
  `UserGroupId` int(10) DEFAULT NULL,
  `Discount` varchar(50) DEFAULT NULL,
  `ConcurrencyLimit` smallint(6) unsigned DEFAULT NULL,
  `DownloadRate` smallint(6) unsigned DEFAULT NULL,
  `DownloadRateUnit` smallint(6) unsigned DEFAULT NULL,
  `UploadRate` smallint(6) unsigned DEFAULT NULL,
  `UploadRateUnit` smallint(6) unsigned DEFAULT NULL,
  `FupDataRate` int(10) DEFAULT NULL,
  `FupDataRateUnit` tinyint(1) DEFAULT NULL,
  `FupDownloadRate` int(10) DEFAULT NULL,
  `FupDownloadRateUnit` tinyint(1) DEFAULT NULL,
  `FupUploadRate` int(10) DEFAULT NULL,
  `FupUploadRateUnit` tinyint(1) DEFAULT NULL,
  `PlanRestriction` tinyint(1) DEFAULT NULL,
  `SMSCountPerUserPerDevice` tinyint(2) DEFAULT NULL,
  `PlanAccessType` tinyint(1) NOT NULL,
  `PlanStartDate` datetime DEFAULT NULL,
  `PlanEndDate` datetime DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_plan`
--

LOCK TABLES `bill_plan` WRITE;
/*!40000 ALTER TABLE `bill_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_plangroup`
--

DROP TABLE IF EXISTS `bill_plangroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_plangroup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PlanGroupName` varchar(100) DEFAULT NULL,
  `IsDefault` tinyint(1) DEFAULT 0,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT 0,
  `CustomerId` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_plangroup`
--

LOCK TABLES `bill_plangroup` WRITE;
/*!40000 ALTER TABLE `bill_plangroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_plangroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_planmap`
--

DROP TABLE IF EXISTS `bill_planmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_planmap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_planmap`
--

LOCK TABLES `bill_planmap` WRITE;
/*!40000 ALTER TABLE `bill_planmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_planmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_prosa_temp`
--

DROP TABLE IF EXISTS `bill_prosa_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_prosa_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `BillingState` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `ItemName` varchar(50) DEFAULT NULL,
  `ItemDescription` varchar(50) DEFAULT NULL,
  `TransAmount` varchar(10) DEFAULT NULL,
  `SuccessUrl` varchar(100) DEFAULT NULL,
  `FailUrl` varchar(100) DEFAULT NULL,
  `BillDataRequired` tinyint(1) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `ProsaOrderId` varchar(20) DEFAULT NULL,
  `ProsaDigest` varchar(100) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_prosa_temp`
--

LOCK TABLES `bill_prosa_temp` WRITE;
/*!40000 ALTER TABLE `bill_prosa_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_prosa_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_prosa_transaction`
--

DROP TABLE IF EXISTS `bill_prosa_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_prosa_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BillingName` varchar(40) DEFAULT NULL,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Prosa_Response` varchar(50) DEFAULT NULL,
  `Prosa_OrderId` varchar(30) DEFAULT NULL,
  `Prosa_Merchant` varchar(30) DEFAULT NULL,
  `Prosa_Store` varchar(20) DEFAULT NULL,
  `Prosa_Term` varchar(20) DEFAULT NULL,
  `Prosa_RefNum` varchar(50) DEFAULT NULL,
  `Prosa_Auth` int(20) DEFAULT NULL,
  `Prosa_Digest` varchar(100) DEFAULT NULL,
  `CardNumber` varchar(50) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `TranStatus` varchar(20) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_prosa_transaction`
--

LOCK TABLES `bill_prosa_transaction` WRITE;
/*!40000 ALTER TABLE `bill_prosa_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_prosa_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_razorpay_temp`
--

DROP TABLE IF EXISTS `bill_razorpay_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_razorpay_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `BillingState` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `WorkPhone` varchar(20) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` char(128) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `TransAmount` varchar(10) DEFAULT NULL,
  `SuccessUrl` varchar(100) DEFAULT NULL,
  `FailUrl` varchar(100) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  `ControllerProfileId` int(11) NOT NULL,
  `MAC` varchar(50) DEFAULT NULL,
  `RazorpayOrderId` varchar(50) DEFAULT NULL,
  `Entity` varchar(20) DEFAULT NULL,
  `amount_paid` varchar(20) DEFAULT NULL,
  `amount_due` varchar(20) DEFAULT NULL,
  `Receipt` varchar(20) DEFAULT NULL,
  `offer_id` varchar(20) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Attempts` varchar(20) DEFAULT NULL,
  `CURRENCY` varchar(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `LocationId` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_razorpay_temp`
--

LOCK TABLES `bill_razorpay_temp` WRITE;
/*!40000 ALTER TABLE `bill_razorpay_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_razorpay_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_razorpay_transaction`
--

DROP TABLE IF EXISTS `bill_razorpay_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_razorpay_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `CustomerEmailId` varchar(100) DEFAULT NULL,
  `CustomerMobileNumber` varchar(20) DEFAULT NULL,
  `BillingAddress` varchar(20) DEFAULT NULL,
  `razorpay_payment_id` varchar(100) DEFAULT NULL,
  `razorpay_order_id` varchar(100) DEFAULT NULL,
  `razorpay_signature` varchar(100) DEFAULT NULL,
  `CURRENCY` varchar(15) DEFAULT NULL,
  `ORDERID` varchar(20) DEFAULT NULL,
  `TXNAMOUNT` varchar(15) DEFAULT NULL,
  `STATUS` varchar(15) DEFAULT NULL,
  `TXNDATE` datetime DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `ControllerProfileId` int(11) DEFAULT NULL,
  `MAC` varchar(50) DEFAULT NULL,
  `Action` varchar(20) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `TempId` varchar(10) DEFAULT NULL,
  `TransactionStatus` varchar(20) DEFAULT NULL,
  `TransactionType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `LocationId` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_razorpay_transaction`
--

LOCK TABLES `bill_razorpay_transaction` WRITE;
/*!40000 ALTER TABLE `bill_razorpay_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_razorpay_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_stripe_temp`
--

DROP TABLE IF EXISTS `bill_stripe_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_stripe_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(12) DEFAULT NULL,
  `CellPhone` varchar(12) DEFAULT NULL,
  `WorkPhone` varchar(12) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AptNumber` varchar(8) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `SuccessUrl` varchar(200) DEFAULT NULL,
  `FailUrl` varchar(200) DEFAULT NULL,
  `DateAdded` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `DeviceId` int(10) unsigned DEFAULT NULL,
  `OrderId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_stripe_temp`
--

LOCK TABLES `bill_stripe_temp` WRITE;
/*!40000 ALTER TABLE `bill_stripe_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_stripe_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_stripe_transaction`
--

DROP TABLE IF EXISTS `bill_stripe_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_stripe_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `CustomerEmailId` varchar(100) DEFAULT NULL,
  `CustomerMobileNumber` varchar(20) DEFAULT NULL,
  `BillingAddress` varchar(20) DEFAULT NULL,
  `StripeToken` varchar(100) DEFAULT NULL,
  `StripeEmail` varchar(100) DEFAULT NULL,
  `CURRENCY` varchar(15) DEFAULT NULL,
  `ORDERID` varchar(20) DEFAULT NULL,
  `TXNAMOUNT` varchar(15) DEFAULT NULL,
  `STATUS` varchar(15) DEFAULT NULL,
  `TXNDATE` datetime DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `Action` varchar(20) DEFAULT NULL,
  `StripeId` varchar(100) DEFAULT NULL,
  `StripeObject` varchar(100) DEFAULT NULL,
  `StripeAmount` varchar(100) DEFAULT NULL,
  `amount_refunded` varchar(100) DEFAULT NULL,
  `balance_transaction` varchar(100) DEFAULT NULL,
  `captured` varchar(20) DEFAULT NULL,
  `created` varchar(20) DEFAULT NULL,
  `StripeCurrency` varchar(20) DEFAULT NULL,
  `StripeCustomer` varchar(20) DEFAULT NULL,
  `StripeDescription` varchar(20) DEFAULT NULL,
  `failure_code` varchar(50) DEFAULT NULL,
  `failure_message` varchar(50) DEFAULT NULL,
  `order` varchar(50) DEFAULT NULL,
  `seller_message` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `paid` varchar(50) DEFAULT NULL,
  `refunded` varchar(50) DEFAULT NULL,
  `total_count` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `sourceId` varchar(50) DEFAULT NULL,
  `sourceObject` varchar(50) DEFAULT NULL,
  `address_city` varchar(50) DEFAULT NULL,
  `address_country` varchar(50) DEFAULT NULL,
  `address_line1` varchar(50) DEFAULT NULL,
  `address_line1_check` varchar(50) DEFAULT NULL,
  `address_line2` varchar(50) DEFAULT NULL,
  `address_state` varchar(50) DEFAULT NULL,
  `address_zip` varchar(50) DEFAULT NULL,
  `address_zip_check` varchar(50) DEFAULT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `customer` varchar(50) DEFAULT NULL,
  `cvc_check` varchar(50) DEFAULT NULL,
  `exp_month` varchar(50) DEFAULT NULL,
  `exp_year` varchar(50) DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  `funding` varchar(50) DEFAULT NULL,
  `last4` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `source_transfer` varchar(50) DEFAULT NULL,
  `statement_descriptor` varchar(50) DEFAULT NULL,
  `StripeStatus` varchar(50) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `LocationId` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_stripe_transaction`
--

LOCK TABLES `bill_stripe_transaction` WRITE;
/*!40000 ALTER TABLE `bill_stripe_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_stripe_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_ugmart_transaction`
--

DROP TABLE IF EXISTS `bill_ugmart_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_ugmart_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned DEFAULT NULL,
  `FullName` varchar(40) DEFAULT NULL,
  `MobileNumber` varchar(20) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `UG_ResponseCode` char(3) DEFAULT NULL,
  `UG_Status` varchar(20) DEFAULT NULL,
  `UG_Message` varchar(150) DEFAULT NULL,
  `UG_TransactionID` varchar(10) DEFAULT NULL,
  `UG_Method` varchar(20) DEFAULT NULL,
  `UG_ChargedAmount` varchar(10) DEFAULT NULL,
  `UG_Commission` varchar(10) DEFAULT NULL,
  `UG_Provider` varchar(15) DEFAULT NULL,
  `Auth_Method` varchar(10) DEFAULT NULL,
  `CardNumber` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_ugmart_transaction`
--

LOCK TABLES `bill_ugmart_transaction` WRITE;
/*!40000 ALTER TABLE `bill_ugmart_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_ugmart_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_user`
--

DROP TABLE IF EXISTS `bill_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `RadiusUserId` int(10) unsigned DEFAULT NULL,
  `BillingName` varchar(100) DEFAULT NULL,
  `BillingAddress` varchar(150) DEFAULT NULL,
  `BillingCity` varchar(40) DEFAULT NULL,
  `BillingState` varchar(30) DEFAULT NULL,
  `BillingZipcode` varchar(10) DEFAULT NULL,
  `BillingCountry` varchar(40) DEFAULT NULL,
  `BillingPhone` varchar(20) DEFAULT NULL,
  `BillingEmail` varchar(40) DEFAULT NULL,
  `CardNumber` varchar(40) DEFAULT NULL,
  `CardType` varchar(20) DEFAULT NULL,
  `CardExpiryDate` date DEFAULT NULL,
  `CvvNumber` varchar(10) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `SignupDate` datetime DEFAULT NULL,
  `IsVerified` tinyint(1) DEFAULT 0,
  `Status` varchar(10) DEFAULT NULL,
  `NextBillingDate` datetime DEFAULT '0000-00-00 00:00:00',
  `LastBillingSuccessDate` datetime DEFAULT NULL,
  `FailedAttempts` tinyint(1) DEFAULT 0,
  `CardUpdated` tinyint(1) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `LastRechargeDate` datetime DEFAULT '0000-00-00 00:00:00',
  `TotalTimeLimit` int(10) unsigned DEFAULT NULL,
  `TotalBandwidthLimit` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `RadiusUserId` (`RadiusUserId`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_user`
--

LOCK TABLES `bill_user` WRITE;
/*!40000 ALTER TABLE `bill_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_voucher`
--

DROP TABLE IF EXISTS `bill_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_voucher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `VoucherBatchId` int(10) DEFAULT NULL,
  `Amount` float DEFAULT NULL,
  `VoucherCode` varchar(12) DEFAULT NULL,
  `MobileNumber` varchar(25) DEFAULT NULL,
  `SerialNumber` int(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `PlanId` int(11) NOT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `ActivationDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `UsedLocationId` int(10) DEFAULT NULL,
  `DateUsed` datetime DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `TransId` varchar(50) DEFAULT NULL,
  `RetailerDistributorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `VoucherCode` (`CustomerId`,`VoucherCode`),
  KEY `bill_voucher_ibfk_1` (`VoucherBatchId`),
  CONSTRAINT `bill_voucher_ibfk_1` FOREIGN KEY (`VoucherBatchId`) REFERENCES `bill_voucher_batch` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_voucher`
--

LOCK TABLES `bill_voucher` WRITE;
/*!40000 ALTER TABLE `bill_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_voucher_batch`
--

DROP TABLE IF EXISTS `bill_voucher_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_voucher_batch` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `VoucherBatchName` varchar(200) DEFAULT NULL,
  `VoucherTemplateId` int(10) DEFAULT NULL,
  `PolicyId` int(10) DEFAULT NULL,
  `TotalAmount` float DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `CreatedBy` int(10) DEFAULT 0,
  `TotalCount` int(10) DEFAULT 0,
  `TotalUsedCount` int(10) DEFAULT 0,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_voucher_batch`
--

LOCK TABLES `bill_voucher_batch` WRITE;
/*!40000 ALTER TABLE `bill_voucher_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_voucher_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_voucher_design`
--

DROP TABLE IF EXISTS `bill_voucher_design`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_voucher_design` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `DesignName` varchar(40) NOT NULL,
  `HeaderString` varchar(64) DEFAULT NULL,
  `FooterString` varchar(64) DEFAULT NULL,
  `LogoFileName` varchar(40) DEFAULT NULL,
  `BgFileName` varchar(50) DEFAULT NULL,
  `PolicyRestrictions` int(4) unsigned zerofill DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_voucher_design`
--

LOCK TABLES `bill_voucher_design` WRITE;
/*!40000 ALTER TABLE `bill_voucher_design` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_voucher_design` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_voucher_locations`
--

DROP TABLE IF EXISTS `bill_voucher_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_voucher_locations` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `VoucherBatchId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_voucher_locations`
--

LOCK TABLES `bill_voucher_locations` WRITE;
/*!40000 ALTER TABLE `bill_voucher_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_voucher_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_voucher_template`
--

DROP TABLE IF EXISTS `bill_voucher_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_voucher_template` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `VoucherTemplateName` varchar(200) DEFAULT NULL,
  `PolicyId` int(10) DEFAULT NULL,
  `TotalAmount` float DEFAULT NULL,
  `VoucherType` tinyint(1) DEFAULT NULL,
  `VoucherLength` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_voucher_template`
--

LOCK TABLES `bill_voucher_template` WRITE;
/*!40000 ALTER TABLE `bill_voucher_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_voucher_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_worldpay_temp_user`
--

DROP TABLE IF EXISTS `bill_worldpay_temp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_worldpay_temp_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `Password` varchar(30) DEFAULT NULL,
  `FirstName` varchar(100) DEFAULT NULL,
  `LastName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zip` varchar(10) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `HomePhone` varchar(15) DEFAULT NULL,
  `CellPhone` varchar(15) DEFAULT NULL,
  `WorkPhone` varchar(15) DEFAULT NULL,
  `SecretQuestion` varchar(100) DEFAULT NULL,
  `SecretAnswer` varchar(30) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `IsRenew` tinyint(1) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_worldpay_temp_user`
--

LOCK TABLES `bill_worldpay_temp_user` WRITE;
/*!40000 ALTER TABLE `bill_worldpay_temp_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_worldpay_temp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_worldpay_transaction`
--

DROP TABLE IF EXISTS `bill_worldpay_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bill_worldpay_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `BillUserId` int(10) unsigned DEFAULT NULL,
  `BillingName` varchar(40) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `Worldpay_Response` varchar(20) DEFAULT NULL,
  `Worldpay_TransactionID` varchar(20) DEFAULT NULL,
  `TranAmount` varchar(10) DEFAULT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `TranStatus` tinyint(1) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_worldpay_transaction`
--

LOCK TABLES `bill_worldpay_transaction` WRITE;
/*!40000 ALTER TABLE `bill_worldpay_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `bill_worldpay_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaign_ad_survey`
--

DROP TABLE IF EXISTS `campaign_ad_survey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaign_ad_survey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LocationId` int(11) NOT NULL,
  `AdCampaignId` int(11) NOT NULL,
  `SurveyCampaignId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaign_ad_survey`
--

LOCK TABLES `campaign_ad_survey` WRITE;
/*!40000 ALTER TABLE `campaign_ad_survey` DISABLE KEYS */;
/*!40000 ALTER TABLE `campaign_ad_survey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_notification`
--

DROP TABLE IF EXISTS `config_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_notification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `SMSEnable` tinyint(1) DEFAULT NULL,
  `EmailEnable` tinyint(1) DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_notification`
--

LOCK TABLES `config_notification` WRITE;
/*!40000 ALTER TABLE `config_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect_ap`
--

DROP TABLE IF EXISTS `connect_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `connect_ap` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `apname` varchar(100) DEFAULT NULL,
  `apmac` varchar(20) DEFAULT NULL,
  `apmodel` varchar(20) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `firmware` varchar(50) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `lastseen` datetime DEFAULT NULL, 
  `status` varchar(15) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `state` varchar(25) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `zone` int(10) DEFAULT NULL,
  `venue` int(10) DEFAULT NULL,
  `apcontroller` varchar(100) DEFAULT NULL,
  `LocationId` int(11) NOT NULL,
  `RetailerId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac_address` (`apmac`),
  KEY `index_CustomerId` (`CustomerId`),
  KEY `index_RetailerId` (`RetailerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect_ap`
--

LOCK TABLES `connect_ap` WRITE;
/*!40000 ALTER TABLE `connect_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `connect_ap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect_ap_stats`
--

DROP TABLE IF EXISTS `connect_ap_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connect_ap_stats` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `apid` int(10) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `rx_bps_2g` bigint(20) DEFAULT NULL,
  `tx_bps_2g` bigint(20) DEFAULT NULL,
  `rx_bps_5g` bigint(20) DEFAULT NULL,
  `tx_bps_5g` bigint(20) DEFAULT NULL,
  `client_2g` int(10) DEFAULT NULL,
  `client_5g` int(10) DEFAULT NULL,
  `clients` int(10) DEFAULT NULL,
  `throughput_2g` bigint(20) DEFAULT NULL,
  `throughput_5g` bigint(20) DEFAULT NULL,
  `rx_bytes_2g` bigint(20) DEFAULT NULL,
  `tx_bytes_2g` bigint(20) DEFAULT NULL,
  `rx_bytes_5g` bigint(20) DEFAULT NULL,
  `tx_bytes_5g` bigint(20) DEFAULT NULL,
  `rx_bytes` bigint(20) DEFAULT NULL,
  `tx_bytes` bigint(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `macaddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lookup_by_macaddress` (`macaddress`),
  KEY `lookup_by_starttime` (`start_time`),
  KEY `lookup_by_apid` (`apid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect_ap_stats`
--

LOCK TABLES `connect_ap_stats` WRITE;
/*!40000 ALTER TABLE `connect_ap_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `connect_ap_stats` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `crm_category`
--


--
-- Table structure for table `crm_category`
--

DROP TABLE IF EXISTS `crm_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(30) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `IsVisible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_category`
--

LOCK TABLES `crm_category` WRITE;
/*!40000 ALTER TABLE `crm_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_description`
--

DROP TABLE IF EXISTS `crm_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_description` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Description` text DEFAULT NULL,
  `Resolution` text DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_description`
--

LOCK TABLES `crm_description` WRITE;
/*!40000 ALTER TABLE `crm_description` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_emailtemplate`
--

DROP TABLE IF EXISTS `crm_emailtemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_emailtemplate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TemplateName` varchar(100) DEFAULT NULL,
  `Template` text DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `CreatedBy` int(10) unsigned DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `TemplateSubject` varchar(200) DEFAULT NULL,
  `CategoryId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_emailtemplate`
--

LOCK TABLES `crm_emailtemplate` WRITE;
/*!40000 ALTER TABLE `crm_emailtemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_emailtemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_extattr`
--

DROP TABLE IF EXISTS `crm_extattr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_extattr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AttributeName` varchar(255) DEFAULT NULL,
  `IsVisible` tinyint(1) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_extattr`
--

LOCK TABLES `crm_extattr` WRITE;
/*!40000 ALTER TABLE `crm_extattr` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_extattr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_extvalue`
--

DROP TABLE IF EXISTS `crm_extvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_extvalue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AttributeId` int(10) DEFAULT NULL,
  `AttributeValue` varchar(255) DEFAULT NULL,
  `CallNo` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_extvalue`
--

LOCK TABLES `crm_extvalue` WRITE;
/*!40000 ALTER TABLE `crm_extvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_extvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_notes`
--

DROP TABLE IF EXISTS `crm_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;


CREATE TABLE `crm_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TicketId` int(10) unsigned DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `AccountId` int(10) unsigned DEFAULT NULL,
  `Note` text DEFAULT NULL,
  `IsReply` tinyint(1) DEFAULT NULL,
  `CreatedBy` int(10) unsigned DEFAULT NULL,
  `UserType` tinyint(1) DEFAULT 0 COMMENT '0:customer,1:retailer-distributor,2:subscriber',
  `IsTechnical` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `ticket_id` (`TicketId`),
  KEY `created_date` (`DateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_notes`
--

LOCK TABLES `crm_notes` WRITE;
/*!40000 ALTER TABLE `crm_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_problemtype`
--

DROP TABLE IF EXISTS `crm_problemtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_problemtype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ProblemGroupId` int(11) DEFAULT NULL,
  `ProblemTypeName` varchar(30) DEFAULT NULL,
  `ProblemDescription` text DEFAULT NULL,
  `Language` varchar(5) DEFAULT NULL,
  `Subscriber` tinyint(1) DEFAULT 0,
  `Retailer` tinyint(1) DEFAULT 0,
  `Distributor` tinyint(1) DEFAULT 0,
  `Customer` tinyint(1) DEFAULT 0,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `group_index` (`ProblemGroupId`),
  KEY `language_index` (`Language`),
  CONSTRAINT `crm_problemtype_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_problemtype`
--

LOCK TABLES `crm_problemtype` WRITE;
/*!40000 ALTER TABLE `crm_problemtype` DISABLE KEYS */;
INSERT INTO `crm_problemtype` (id,ProblemTypeName,ProblemDescription,CustomerId) VALUES (1,'Other','Default Problem',1),(2,'Login Problem','Default Problem',1),(3,'Network Issue','Default Problem',1),(4,'Slow Speed','Default Problem',1),(5,'Login Page Issues','Default Problem',1),(6,'Default Problem 5','Default Problem',1);
/*!40000 ALTER TABLE `crm_problemtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_resolution`
--

DROP TABLE IF EXISTS `crm_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_resolution` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Resolution` varchar(40) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  FULLTEXT KEY `Resolution` (`Resolution`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_resolution`
--

LOCK TABLES `crm_resolution` WRITE;
/*!40000 ALTER TABLE `crm_resolution` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_resolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_smstemplate`
--

DROP TABLE IF EXISTS `crm_smstemplate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_smstemplate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TemplateName` varchar(100) DEFAULT NULL,
  `Template` text DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateUpdated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CategoryId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_smstemplate`
--

LOCK TABLES `crm_smstemplate` WRITE;
/*!40000 ALTER TABLE `crm_smstemplate` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_smstemplate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_templatecategory`
--

DROP TABLE IF EXISTS `crm_templatecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_templatecategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(40) DEFAULT NULL,
  `IsVisible` tinyint(1) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_templatecategory`
--

LOCK TABLES `crm_templatecategory` WRITE;
/*!40000 ALTER TABLE `crm_templatecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_templatecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_ticket`
--

DROP TABLE IF EXISTS `crm_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_ticket` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TicketNumber` varchar(20) DEFAULT NULL,
  `ProblemGrpId` int(10) DEFAULT NULL,
  `Summary` varchar(255) DEFAULT NULL,
  `FromEmail` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `AssignedTo` int(10) unsigned DEFAULT NULL,
  `AssignedBy` int(10) unsigned DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `DateClosed` datetime DEFAULT NULL,
  `LastUpdated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `FixByDate` datetime DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DateResolved` datetime DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `ProblemTypeId` int(10) DEFAULT NULL,
  `SeverityId` tinyint(1) DEFAULT 3,
  `TicketTypeId` tinyint(1) DEFAULT 3,
  `IsEscalated` tinyint(1) DEFAULT NULL,
  `StatusReason` tinyint(4) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `AccountId` int(10) unsigned DEFAULT NULL,
  `UserId` int(10) DEFAULT NULL,
  `RetailerDistributorId` int(10) DEFAULT NULL,
  `Resolution` text DEFAULT NULL,
  `Deferred` text DEFAULT NULL,
  `EscalationNote` text DEFAULT NULL,
  `ScreenshotPath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`),
  KEY `problem_grp_index` (`ProblemGrpId`),
  CONSTRAINT `crm_ticket_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `crm_ticket_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_ticket`
--

LOCK TABLES `crm_ticket` WRITE;
/*!40000 ALTER TABLE `crm_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_ticketconfig`
--

DROP TABLE IF EXISTS `crm_ticketconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crm_ticketconfig` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SmtpServer` varchar(200) DEFAULT NULL,
  `ToAddress` varchar(200) DEFAULT NULL,
  `FromAddress` varchar(200) DEFAULT NULL,
  `CcAddress` varchar(200) DEFAULT NULL,
  `SendConfirmation` tinyint(1) DEFAULT NULL,
  `TemplateId` int(10) unsigned DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LastTicketId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_ticketconfig`
--

LOCK TABLES `crm_ticketconfig` WRITE;
/*!40000 ALTER TABLE `crm_ticketconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `crm_ticketconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cron_reports`
--

DROP TABLE IF EXISTS `cron_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ReportIdentifier` varchar(45) NOT NULL,
  `LastTimestampScanned` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cron_reports`
--

LOCK TABLES `cron_reports` WRITE;
/*!40000 ALTER TABLE `cron_reports` DISABLE KEYS */;
INSERT INTO `cron_reports` VALUES (1,'bandwidth_summary','2021-10-26 08:10:01'),(2,'cf_stats','2021-10-26 06:40:01'),(3,'devicemacdata','2021-10-26 08:10:01');
/*!40000 ALTER TABLE `cron_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_billing_plan`
--

DROP TABLE IF EXISTS `customer_billing_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_billing_plan` (
  `PlanType` varchar(20) DEFAULT NULL,
  `PlanId` int(11) NOT NULL AUTO_INCREMENT,
  `PlanName` varchar(50) DEFAULT NULL,
  `PlanCurrency` varchar(5) DEFAULT NULL,
  `PlanPrice` float DEFAULT NULL,
  `PlanCategory` varchar(20) DEFAULT NULL,
  `PerApPrice` float DEFAULT NULL,
  `GracePeriod` int(11) DEFAULT NULL,
  `ValidityUnit` varchar(20) DEFAULT NULL,
  `PerDayPlanPrice` int(11) DEFAULT NULL,
  `PlanNoOfDays` int(11) DEFAULT NULL,
  `FeaturesList` text NOT NULL,
  `CustomerId` int(11) DEFAULT 1,
  PRIMARY KEY (`PlanId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_billing_plan`
--

LOCK TABLES `customer_billing_plan` WRITE;
/*!40000 ALTER TABLE `customer_billing_plan` DISABLE KEYS */;
INSERT INTO `customer_billing_plan` 
    VALUES  ( 'Basic', 1, 'Basic-US-Monthly', 'USD',  10, NULL, NULL, 7, 'Monthly', 1, 30,  '{"Login Policies":"1","Users":"1","Captive Portal":"1","Plans":"1","Networks":0,"Sms Gateway":0,"Autologin":0,"Access Point":0,"Vouchers":0,"Transactions":0,"Tickets":0,"Advertisement":0,"Content Filter":0,"Proximity":0,"Survey":0,"Automated Reports":0,"Email Templates":0,"Self Care Login":0,"Accounts":0,"SMS Templates":0,"Reviews":0,"Resellers":0,"Payment Gateways":0,"Network Profiles":0,"WIPS":0}', 1 ),
            ( 'NMS', 2, 'NMS-US-Monthly', 'USD',  3, NULL, NULL, 7, 'Monthly', 1, 30, '{"Networks":"1","Network Profiles":"1","Access Point":"1","Login Policies":"1","Users":"1","Captive Portal":"1","Plans":"1","Content Filter":"1","Resellers":"1","Tickets":"1","Accounts":"1","Reseller Payment Gateway":"1","Global Configuration":"1","Notification Management":"1","FAQ Management":"1","Sms Gateway":0,"Autologin":0,"Vouchers":0,"Transactions":0,"Advertisement":0,"Proximity":0,"Survey":0,"Automated Reports":0,"Email Templates":0,"Self Care Login":0,"SMS Templates":0,"Reviews":0,"Payment Gateways":0,"WIPS":0}', 1 ),
            ( 'Advanced', 3,'Advanced-US-Monthly','USD', 15, NULL, NULL, 7, 'Monthly', 1, 30, '{"Networks":"1","Network Profiles":"1","Access Point":"1","WIPS":"1","Login Policies":"1","Users":"1","Autologin":"1","Captive Portal":"1","Plans":"1","Vouchers":"1","Advertisement":"1","Survey":"1","Proximity":"1","Reviews":"1","Content Filter":"1","Resellers":"1","Tickets":"1","Accounts":"1","Payment Gateways":"1","Sms Gateway":"1","SMS Templates":"1","Email Templates":"1","App Provider":"1","Pdoa":"1","White Label":"1","Reseller Payment Gateway":"1","Global Configuration":"1","Notification Management":"1","FAQ Management":"1","Automated Reports":"1","Self Care Login":"1","Transactions":0}',1),
            ( 'Custom', 5, 'Custom Check', 'INR', 15, NULL, NULL, 7, 'Monthly', 1, 30, '{"Networks":"1","Network Profiles":"1","Access Point":"1","WIPS":"1","Login Policies":"1","Users":"1","Autologin":"1","Captive Portal":"1","Plans":"1","Vouchers":"1","Advertisement":"1","Survey":"1","Proximity":"1","Reviews":"1","Content Filter":"1","Resellers":"1","Tickets":"1","Accounts":"1","Payment Gateways":"1","Sms Gateway":"1","SMS Templates":"1","Email Templates":"1","Automated Reports":"1","Self Care Login":"1","Transactions":0}',4 ), 
            ( 'Basic', 8, 'Basic-INR-Monthly', 'INR', 750, NULL, NULL, 7, 'Monthly', 25, 30,  '{"Login Policies":"1","Users":"1","Captive Portal":"1","Plans":"1","Networks":0,"Sms Gateway":0,"Autologin":0,"Access Point":0,"Vouchers":0,"Transactions":0,"Tickets":0,"Advertisement":0,"Content Filter":0,"Proximity":0,"Survey":0,"Automated Reports":0,"Email Templates":0,"Self Care Login":0,"Accounts":0,"SMS Templates":0,"Reviews":0,"Resellers":0,"Payment Gateways":0,"Network Profiles":0,"WIPS":0}', 1 ),
            ( 'NMS', 9, 'NMS-INR-Monthly', 'INR', 225, NULL, NULL, 7, 'Monthly', 8, 30,'{"Networks":"1","Network Profiles":"1","Access Point":"1","Login Policies":"1","Users":"1","Captive Portal":"1","Plans":"1","Content Filter":"1","Resellers":"1","Tickets":"1","Accounts":"1","Reseller Payment Gateway":"1","Global Configuration":"1","Notification Management":"1","FAQ Management":"1","Sms Gateway":0,"Autologin":0,"Vouchers":0,"Transactions":0,"Advertisement":0,"Proximity":0,"Survey":0,"Automated Reports":0,"Email Templates":0,"Self Care Login":0,"SMS Templates":0,"Reviews":0,"Payment Gateways":0,"WIPS":0}', 1 ),
            ( 'Advanced', 10, 'Advanced-INR-Monthly',  'INR', 1125, NULL, NULL, 7, 'Monthly',  38, 30, '{"Networks":"1","Network Profiles":"1","Access Point":"1","WIPS":"1","Login Policies":"1","Users":"1","Autologin":"1","Captive Portal":"1","Plans":"1","Vouchers":"1","Advertisement":"1","Survey":"1","Proximity":"1","Reviews":"1","Content Filter":"1","Resellers":"1","Tickets":"1","Accounts":"1","Payment Gateways":"1","Sms Gateway":"1","SMS Templates":"1","Email Templates":"1","App Provider":"1","Pdoa":"1","White Label":"1","Automated Reports":"1","Self Care Login":"1","Transactions":0}', 1 ),
            ( 'Advanced', 11, 'Advanced-US-Yearly',  'USD', 100, NULL, NULL, 7, 'Yearly',  1, 360, '{"Networks":"1","Network Profiles":"1","Access Point":"1","Login Policies":"1","Users":"1","Autologin":"1","Captive Portal":"1","Plans":"1","Vouchers":"1","Advertisement":"1","Survey":"1","Proximity":"1","Reviews":"1","Content Filter":"1","Resellers":"1","Tickets":"1","Accounts":"1","Payment Gateways":"1","Sms Gateway":"1","SMS Templates":"1","Email Templates":"1","Reseller Payment Gateway":"1","Global Configuration":"1","Notification Management":"1","FAQ Management":"1","Automated Reports":"1","Self Care Login":"1","Transactions":0,"WIPS":0,"App Provider":0,"Pdoa":0,"White Label":0}', 1 ),
            ( 'Advanced', 12, 'Advanved-INR-Yearly',  'INR', 10, NULL, NULL, 7, 'Yearly',  1, 360, '{"Networks":"1","Network Profiles":"1","Access Point":"1","Login Policies":"1","Users":"1","Autologin":"1","Captive Portal":"1","Plans":"1","Vouchers":"1","Advertisement":"1","Survey":"1","Proximity":"1","Reviews":"1","Content Filter":"1","Resellers":"1","Tickets":"1","Accounts":"1","Payment Gateways":"1","Sms Gateway":"1","SMS Templates":"1","Email Templates":"1","Reseller Payment Gateway":"1","Global Configuration":"1","Notification Management":"1","FAQ Management":"1","Automated Reports":"1","Self Care Login":"1","Transactions":0,"WIPS":0,"App Provider":0,"Pdoa":0,"White Label":0}', 1 ),
            ( 'Advanced', 13, 'Check Plan 1', 'AOA',  0, 'hotspot', 0, 10, 'Monthly', NULL,  30, '{"Access Point":"1","Accounts":"1","Advertisement":"1","App Provider":"1","Autologin":"1","Automated Reports":"1","Captive Portal":"1","Content Filter":"1","Email Templates":"1","Login Policies":"1","Network Profiles":"1","Networks":"1","Payment Gateways":"1","Plans":"1","Proximity":"1","Resellers":"1","Reviews":"1","SMS Templates":"1","Self Care Login":"1","Sms Gateway":"1","Survey":"1","Tickets":"1","Transactions":0,"Users":"1","Vouchers":"1","WIPS":0}', 1 );
/*!40000 ALTER TABLE `customer_billing_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_daily_billing_cycle`
--

DROP TABLE IF EXISTS `customer_daily_billing_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_daily_billing_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ApCount` int(10) DEFAULT 0,
  `LocationCount` int(10) DEFAULT 0,
  `Location10Count` int(10) DEFAULT 0,
  `Location10Amount` int(10) DEFAULT 0,
  `Location20Count` int(10) DEFAULT 0,
  `Location20Amount` int(10) DEFAULT 0,
  `Location50Count` int(10) DEFAULT 0,
  `Location50Amount` int(10) DEFAULT 0,
  `Location100Count` int(10) DEFAULT 0,
  `Location100Amount` int(10) DEFAULT 0,
  `Location200Count` int(10) DEFAULT 0,
  `Location200Amount` int(10) DEFAULT 0,
  `Location500Count` int(10) DEFAULT 0,
  `Location500Amount` int(10) DEFAULT 0,
  `Location1000Count` int(10) DEFAULT 0,
  `Location1000Amount` int(10) DEFAULT 0,
  `Location2000Count` int(10) DEFAULT 0,
  `Location2000Amount` int(10) DEFAULT 0,
  `FinalAmount` int(10) NOT NULL DEFAULT 0,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `CustomerId` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `daily_bill` (`CustomerId`),
  CONSTRAINT `daily_bill` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_daily_billing_cycle`
--

LOCK TABLES `customer_daily_billing_cycle` WRITE;
/*!40000 ALTER TABLE `customer_daily_billing_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_daily_billing_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_hotspot_plan`
--

DROP TABLE IF EXISTS `customer_hotspot_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_hotspot_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HotspotPlanId` int(10) DEFAULT NULL,
  `PlanPrice` float DEFAULT NULL,
  `CustomerPlanId` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `plan` (`HotspotPlanId`),
  KEY `hotspot_plan` (`CustomerPlanId`),
  CONSTRAINT `hotspot_plan` FOREIGN KEY (`CustomerPlanId`) REFERENCES `customer_billing_plan` (`PlanId`) ON DELETE CASCADE,
  CONSTRAINT `plan` FOREIGN KEY (`HotspotPlanId`) REFERENCES `adm_hotspot_plantype` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_hotspot_plan`
--

LOCK TABLES `customer_hotspot_plan` WRITE;
/*!40000 ALTER TABLE `customer_hotspot_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_hotspot_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_pdoa_cert`
--

DROP TABLE IF EXISTS `customer_pdoa_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `customer_pdoa_cert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cert` text CHARACTER SET latin1 DEFAULT NULL,
  `KeyExp` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `PrivateKey` text CHARACTER SET latin1 DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CustomerPdoaId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `CustomerPdoaId` (`CustomerPdoaId`),
  CONSTRAINT `customer_pdoa_cert_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`),
  CONSTRAINT `customer_pdoa_cert_ibfk_2` FOREIGN KEY (`CustomerPdoaId`) REFERENCES `customer_pdoa_info` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_pdoa_cert`
--

LOCK TABLES `customer_pdoa_cert` WRITE;
/*!40000 ALTER TABLE `customer_pdoa_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_pdoa_cert` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `customer_pdoa_info`
--

DROP TABLE IF EXISTS `customer_pdoa_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_pdoa_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cert` text CHARACTER SET latin1 DEFAULT NULL,
  `KeyExp` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `PrivateKey` text CHARACTER SET latin1 DEFAULT NULL,
  `DomainName` varchar(400) CHARACTER SET latin1 DEFAULT NULL,
  `PortalDomainName` varchar(400) DEFAULT NULL,
  `PdoaId` varchar(400) CHARACTER SET latin1 DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `customer_pdoa_info_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_pdoa_info`
--

LOCK TABLES `customer_pdoa_info` WRITE;
/*!40000 ALTER TABLE `customer_pdoa_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_pdoa_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `device`
--

DROP TABLE IF EXISTS `device`;
/*!50001 DROP VIEW IF EXISTS `device`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `device` (
  `id` tinyint NOT NULL,
  `ipv4address` tinyint NOT NULL,
  `devicetype_id` tinyint NOT NULL,
  `secret` tinyint NOT NULL,
  `macaddress` tinyint NOT NULL,
  `nasid` tinyint NOT NULL,
  `customer_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `devicemaster`
--

DROP TABLE IF EXISTS `devicemaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicemaster` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `friendlyname` varchar(150) DEFAULT NULL,
  `hostname` varchar(150) DEFAULT NULL,
  `hotspot_username` varchar(150) DEFAULT NULL,
  `macid` varchar(17) DEFAULT NULL,
  `vendorname` varchar(150) DEFAULT NULL,
  `Cretedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updatedon` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_mac_customer` (`macid`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicemaster`
--

LOCK TABLES `devicemaster` WRITE;
/*!40000 ALTER TABLE `devicemaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `devicemaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devicetype`
--

DROP TABLE IF EXISTS `devicetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devicetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(100) DEFAULT NULL,
  `Vendor` varchar(100) DEFAULT NULL,
  `Category` varchar(15) DEFAULT NULL,
  `SnmpEnabled` tinyint(1) DEFAULT NULL,
  `ShortName` varchar(5) DEFAULT NULL,
  `DeviceOwner` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devicetype`
--

LOCK TABLES `devicetype` WRITE;
/*!40000 ALTER TABLE `devicetype` DISABLE KEYS */;
INSERT INTO `devicetype` VALUES (1,'Wifi-soft AP','Chillispot','device',0,'cs','Wifi-Soft'),(305,'Ruckus SCG','Ruckus','device',NULL,'scg',NULL),(306,'UniBox Controller','Wifi-soft','device',NULL,'ub3','Wifi-Soft'),(307,'Aruba Controller','Aruba','device',NULL,'ar','Wifi-Soft'),(308,'Mikrotik','Mikrotik','device',NULL,'mk',NULL),(309,'Ruckus Zoneflex AP','Ruckus','device',NULL,'cs',NULL),(310,'Ruckus Zone Director','RuckusZD','device',0,'zd',NULL),(311,'Cisco Controller','Cisco','device',NULL,'cisco',NULL),(312,'Nomadix','Nomadix','device',NULL,'nm',NULL),(313,'Cradlepoint Router','Cradlepoint','device',NULL,'cs','Wifi-Soft'),(314,'Meraki','Meraki','device',0,'mr',NULL),(315,'Cambium','Cambium','device',NULL,'cm',NULL);
/*!40000 ALTER TABLE `devicetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `eapconfig`
--

DROP TABLE IF EXISTS `eapconfig`;
/*!50001 DROP VIEW IF EXISTS `eapconfig`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `eapconfig` (
  `id` tinyint NOT NULL,
  `cacert` tinyint NOT NULL,
  `cert` tinyint NOT NULL,
  `key` tinyint NOT NULL,
  `customer_id` tinyint NOT NULL,
  `name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ecco_userdata`
--

DROP TABLE IF EXISTS `ecco_userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecco_userdata` (
  `UserName` varchar(100) DEFAULT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Address` varchar(150) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `HomePhone` varchar(20) DEFAULT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT NULL,
  `LocationId` int(10) DEFAULT NULL,
  `CustomerId` int(10) DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `CardNumber` varchar(40) DEFAULT NULL,
  `CardType` varchar(20) DEFAULT NULL,
  `CardExpiryDate` date DEFAULT NULL,
  `CvvNumber` varchar(10) DEFAULT NULL,
  `PlanId` int(10) unsigned DEFAULT NULL,
  `NextBillingDate` datetime DEFAULT '0000-00-00 00:00:00',
  `LastBillingSuccessDate` datetime DEFAULT NULL,
  `Value` varchar(255) DEFAULT NULL,
  KEY `UserName` (`UserName`),
  KEY `UserName_2` (`UserName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecco_userdata`
--

LOCK TABLES `ecco_userdata` WRITE;
/*!40000 ALTER TABLE `ecco_userdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecco_userdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_temp_customer`
--

DROP TABLE IF EXISTS `email_temp_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `email_temp_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `UserName` varchar(40) DEFAULT NULL,
  `Token` varchar(50) DEFAULT NULL,
  `Used` tinyint(1) DEFAULT 0,
  `TokenExpiry` datetime DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_temp_customer`
--

LOCK TABLES `email_temp_customer` WRITE;
/*!40000 ALTER TABLE `email_temp_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `email_temp_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_logs`
--

DROP TABLE IF EXISTS `event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Autogenerated',
  `EventId` varchar(10) NOT NULL COMMENT 'foreign key of event Metadata table',
  `Description` varchar(300) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `UserMacAddress` varchar(20) DEFAULT NULL,
  `ApMacAddress` varchar(20) DEFAULT NULL,
  `Counter` int(11) DEFAULT 1 COMMENT 'No events occurs',
  `EventTime` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CreatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `LocationId` int(11) DEFAULT NULL,
  `APId` int(11) DEFAULT NULL,
  `CustomerId` int(11) NOT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_logs`
--

LOCK TABLES `event_logs` WRITE;
/*!40000 ALTER TABLE `event_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `eventlogsradius`
--

DROP TABLE IF EXISTS `eventlogsradius`;
/*!50001 DROP VIEW IF EXISTS `eventlogsradius`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `eventlogsradius` (
  `id` tinyint NOT NULL,
  `EventTime` tinyint NOT NULL,
  `EventID` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `client_macaddress` tinyint NOT NULL,
  `client_ipv4address` tinyint NOT NULL,
  `CustomerId` tinyint NOT NULL,
  `LocationId` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `UserName` tinyint NOT NULL,
  `UserType` tinyint NOT NULL,
  `userstatus` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `eventlogsradius1`
--

DROP TABLE IF EXISTS `eventlogsradius1`;
/*!50001 DROP VIEW IF EXISTS `eventlogsradius1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `eventlogsradius1` (
  `id` tinyint NOT NULL,
  `EventTime` tinyint NOT NULL,
  `EventID` tinyint NOT NULL,
  `Description` tinyint NOT NULL,
  `client_macaddress` tinyint NOT NULL,
  `client_ipv4address` tinyint NOT NULL,
  `CustomerId` tinyint NOT NULL,
  `LocationId` tinyint NOT NULL,
  `UserId` tinyint NOT NULL,
  `UserName` tinyint NOT NULL,
  `UserType` tinyint NOT NULL,
  `UserStatus` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` varchar(10) NOT NULL COMMENT 'Not Autogenerated',
  `Name` varchar(200) NOT NULL COMMENT 'Event Name',
  `Severity` enum('CRITICAL','HIGH','MEDIUM','LOW','INFO','DEBUG','ERROR') NOT NULL COMMENT 'CRITICAL,HIGH,MEDIUM,LOW,INFO,DEBUG,ERROR',
  `Type` enum('AAA','AP','NETWORK','CLIENT','USER','PROFILE') NOT NULL COMMENT 'AAA,AP,NETWORK,CLIENT,USER,PROFILE',
  `Sign` enum('-1','1','0','') NOT NULL COMMENT '1,-1,0',
  `RunningEvent` enum('1','0','','') NOT NULL COMMENT '1/0',
  `OppositeEventId` varchar(200) DEFAULT NULL,
  `UserRelated` enum('1','0','','') NOT NULL COMMENT '1/0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;


INSERT INTO `events` VALUES ('AP101','Firmware upgrade enabled on [MAC=XXX] AP.','INFO','AP','1','1','AP110','0'),('AP102','Firmware upgrade started on [MAC=XXX] AP.','INFO','AP','1','1','0','0'),('AP103','Firmware upgrade successfully completed on [MAC=XXX] AP.','INFO','AP','1','1','0','0'),('AP104','AP reboot enabled on [MAC=XXX] AP.','INFO','AP','1','1','0','0'),('AP105','AP [MAC=XXX] is rebooting','DEBUG','AP','1','1','0','0'),('AP106','AP [MAC=XXX] is rebooted.','DEBUG','AP','1','1','0','0'),('AP107','AP [MAC=XXX] is re-connected to the cloud.','DEBUG','AP','-1','1','0',''),('AP108','Scheduled firmware upgrade started on the AP [MAC=XXX].','INFO','AP','1','1','0','0'),('AP109','Scheduled firmware upgrade successfully completed on the AP [MAC=XXX].','INFO','AP','1','1','0','0'),('AP110','Firmware upgrade disable on [MAC=XXX] AP','INFO','AP','1','0','AP101',''),('AP111','Firmware upgradation failed  on [MAC=XXX] AP','INFO','AP','-1','0','',''),('NET001','Autologin plan changed on the network \'XXX\'','INFO','NETWORK','1','1','0','0'),('NET002','Edit the xxx network','INFO','NETWORK','1','1','0','0'),('NET011','Network updated under that network all access point configuration script updating.','MEDIUM','NETWORK','1','1','0','1'),('NET012','Acess point configuration script updated due to Ap Operations','DEBUG','NETWORK','1','1','0',''),('NET013','Acess point configuration script updated due to SDWAN','DEBUG','NETWORK','1','1','0',''),('NET014','Acess point configuration script updated due to device profile','DEBUG','NETWORK','1','1','0',''),('NET015','Acess point configuration script updated due to SSID','DEBUG','NETWORK','1','1','0',''),('RAD005','UserName[MAC=xxxx] login','INFO','AAA','1','1','0','1'),('RAD006','UserName[MAC=xxxx] login fail','INFO','AAA','-1','1','0','1'),('RAD007','UserName[MAC=xxxx] accounting start','INFO','AAA','1','1','0','1'),('RAD008','UserName[MAC=xxxx] accounting stop','INFO','AAA','-1','1','0','1'),('RAD009','UserName[MAC=xxxx] accounting fail','INFO','AAA','-1','1','0','1'),("NET051","Speed test start on [MAC=xxxx] AP","DEBUG","NETWORK",2,1,0,""),("NET021","Added new access point","DEBUG","NETWORK",2,1,0,""),("NET026","Reboot Ap","DEBUG","NETWORK",2,1,0,"");
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_userdata`
--

DROP TABLE IF EXISTS `external_userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_userdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UniqueId` varchar(20) NOT NULL,
  `Fullname` varchar(100) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `CellPhone` varchar(20) DEFAULT NULL,
  `Department` varchar(100) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_customer` (`UniqueId`,`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_userdata`
--

LOCK TABLES `external_userdata` WRITE;
/*!40000 ALTER TABLE `external_userdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_userdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_wireless_controller`
--

DROP TABLE IF EXISTS `external_wireless_controller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_wireless_controller` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Autogenerated',
  `Type` tinyint(1) DEFAULT 1,
  `TipVersion` tinyint(1) DEFAULT NULL,
  `TIPUrl` varchar(100) DEFAULT NULL,
  `TIPPort` int(4) DEFAULT NULL,
  `TIPCustomerId` int(11) DEFAULT NULL,
  `UserId` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `external_wireless_controller_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_wireless_controller`
--

LOCK TABLES `external_wireless_controller` WRITE;
/*!40000 ALTER TABLE `external_wireless_controller` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_wireless_controller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extport_url`
--

DROP TABLE IF EXISTS `extport_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extport_url` (
  `id` int(10) NOT NULL DEFAULT 0,
  `PortalUrl` varchar(100) DEFAULT NULL,
  `OldPortalUrl` varchar(100) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DeviceId` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extport_url`
--

LOCK TABLES `extport_url` WRITE;
/*!40000 ALTER TABLE `extport_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `extport_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook_like`
--

DROP TABLE IF EXISTS `facebook_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `Gender` varchar(6) DEFAULT NULL,
  `SchoolName` varchar(100) DEFAULT NULL,
  `Degree` varchar(20) DEFAULT NULL,
  `Degreeyear` varchar(10) DEFAULT NULL,
  `HomeTown` varchar(50) DEFAULT NULL,
  `UserFbId` varchar(20) DEFAULT NULL,
  `Link` varchar(50) DEFAULT NULL,
  `Locale` varchar(10) DEFAULT NULL,
  `WorkName` varchar(50) DEFAULT NULL,
  `LocationName` varchar(50) DEFAULT NULL,
  `TimeZone` varchar(10) DEFAULT NULL,
  `UpdatedTime` varchar(50) DEFAULT NULL,
  `Verified` varchar(20) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `Birthdate` datetime DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `RadiusUserId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_like`
--

LOCK TABLES `facebook_like` WRITE;
/*!40000 ALTER TABLE `facebook_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook_page_user`
--

DROP TABLE IF EXISTS `facebook_page_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_page_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PageUrl` varchar(100) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LikeDate` datetime DEFAULT NULL,
  `UserFbId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_page_user`
--

LOCK TABLES `facebook_page_user` WRITE;
/*!40000 ALTER TABLE `facebook_page_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook_page_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook_userinfo`
--

DROP TABLE IF EXISTS `facebook_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_userinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `FbId` varchar(50) DEFAULT NULL,
  `FbName` varchar(100) DEFAULT NULL,
  `FbUserName` varchar(100) DEFAULT NULL,
  `FbGender` varchar(10) DEFAULT NULL,
  `FbEmail` varchar(100) DEFAULT NULL,
  `FbTimezone` varchar(10) DEFAULT NULL,
  `FbLocale` varchar(10) DEFAULT NULL,
  `FbUpdatedTime` varchar(50) DEFAULT NULL,
  `FbMinAge` int(3) DEFAULT NULL,
  `FbMaxAge` int(3) DEFAULT NULL,
  `FbFriendsCount` int(10) DEFAULT NULL,
  `Fbbirthday` varchar(50) DEFAULT NULL,
  `FbWebsite` varchar(50) DEFAULT NULL,
  `FbCollege` varchar(50) DEFAULT NULL,
  `FbEmployer` varchar(50) DEFAULT NULL,
  `FbPosition` varchar(50) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_userinfo`
--

LOCK TABLES `facebook_userinfo` WRITE;
/*!40000 ALTER TABLE `facebook_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebook_userlogin`
--

DROP TABLE IF EXISTS `facebook_userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebook_userlogin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FbId` (`UserId`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebook_userlogin`
--

LOCK TABLES `facebook_userlogin` WRITE;
/*!40000 ALTER TABLE `facebook_userlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook_userlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firmware_version`
--

LOCK TABLES `facebook_userlogin` WRITE;
/*!40000 ALTER TABLE `facebook_userlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebook_userlogin` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `firmware_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firmware_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `firmwareType` varchar(20) DEFAULT NULL,
  `releaseNotes` text DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmware_version`
--

LOCK TABLES `firmware_version` WRITE;
/*!40000 ALTER TABLE `firmware_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `firmware_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `firmwares`
--

DROP TABLE IF EXISTS `firmwares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firmwares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `md5sum` char(32) NOT NULL,
  `board` varchar(50) NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `filename` text NOT NULL,
  `modelNo` int(10) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `firmwareType` varchar(20) DEFAULT NULL,
  `releaseNotes` text DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `filesize` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hardware` (`board`),
  KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `firmwares`
--

LOCK TABLES `firmwares` WRITE;
/*!40000 ALTER TABLE `firmwares` DISABLE KEYS */;
/*!40000 ALTER TABLE `firmwares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floormap_config`
--

DROP TABLE IF EXISTS `floormap_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floormap_config` (
  `Floorid` int(11) NOT NULL AUTO_INCREMENT,
  `Floorname` varchar(50) DEFAULT NULL,
  `Floorimagepath` varchar(100) DEFAULT NULL,
  `Cretedon` timestamp NOT NULL DEFAULT current_timestamp(),
  `Floorimagewidth` float DEFAULT NULL,
  `Floorimageheight` float DEFAULT NULL,
  `Updatedon` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Floorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floormap_config`
--

LOCK TABLES `floormap_config` WRITE;
/*!40000 ALTER TABLE `floormap_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `floormap_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_userinfo`
--

DROP TABLE IF EXISTS `google_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_userinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `GId` varchar(50) DEFAULT NULL,
  `GName` varchar(100) DEFAULT NULL,
  `GUserName` varchar(400) DEFAULT NULL,
  `GPictureURL` varchar(400) DEFAULT NULL,
  `GEmailAddress` varchar(100) DEFAULT NULL,
  `GGender` varchar(10) DEFAULT NULL,
  `GLocale` varchar(10) DEFAULT NULL,
  `GMinAge` int(3) DEFAULT NULL,
  `GMaxAge` int(3) DEFAULT NULL,
  `GBirthDay` varchar(30) DEFAULT NULL,
  `GCircledCount` int(10) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_userinfo`
--

LOCK TABLES `google_userinfo` WRITE;
/*!40000 ALTER TABLE `google_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_userlogin`
--

DROP TABLE IF EXISTS `google_userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `google_userlogin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `GId` (`UserId`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_userlogin`
--

LOCK TABLES `google_userlogin` WRITE;
/*!40000 ALTER TABLE `google_userlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_userlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotspot_defaults`
--

DROP TABLE IF EXISTS `hotspot_defaults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotspot_defaults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `HotspotName` varchar(45) DEFAULT 'SmartWiFi',
  `HotspotDisplayName` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Zipcode` varchar(10) DEFAULT NULL,
  `Latitude` varchar(10) DEFAULT NULL,
  `Longitude` varchar(10) DEFAULT NULL,
  `LocationTypeId` int(10) unsigned DEFAULT NULL,
  `HotspotStatus` varchar(20) DEFAULT NULL,
  `AutoMacRegister` tinyint(1) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Url` varchar(50) DEFAULT NULL,
  `WorkingHours` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `UpdateLocation` tinyint(1) DEFAULT 0,
  `IsBYOD` tinyint(1) DEFAULT NULL,
  `BYODCount` tinyint(1) DEFAULT NULL,
  `BYODExpiry` int(10) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `HotspotPlanId` int(10) DEFAULT NULL,
  `HotspotPlanChangeDate` datetime DEFAULT NULL,
  `PlanGroupId` int(10) unsigned NOT NULL,
  `EnableHotspot` tinyint(1) DEFAULT 1,
  `SplashPage` varchar(100) DEFAULT NULL,
  `EnableSSID` tinyint(1) DEFAULT 1,
  `VisibleSSID` tinyint(1) DEFAULT 1,
  `SSIDName` varchar(100) DEFAULT NULL,
  `SSIDKey` varchar(45) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CustomerId_UNIQUE` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotspot_defaults`
--

LOCK TABLES `hotspot_defaults` WRITE;
/*!40000 ALTER TABLE `hotspot_defaults` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotspot_defaults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instagram_userinfo`
--

DROP TABLE IF EXISTS `instagram_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instagram_userinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `IId` varchar(50) DEFAULT NULL,
  `IName` varchar(100) DEFAULT NULL,
  `IUserName` varchar(100) DEFAULT NULL,
  `IFollowersCount` varchar(100) DEFAULT NULL,
  `IFollowingCount` varchar(100) DEFAULT NULL,
  `IMediaCount` varchar(100) DEFAULT NULL,
  `IPictureURL` varchar(400) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instagram_userinfo`
--

LOCK TABLES `instagram_userinfo` WRITE;
/*!40000 ALTER TABLE `instagram_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `instagram_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instagram_userlogin`
--

DROP TABLE IF EXISTS `instagram_userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instagram_userlogin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IId` (`UserId`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instagram_userlogin`
--

LOCK TABLES `instagram_userlogin` WRITE;
/*!40000 ALTER TABLE `instagram_userlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `instagram_userlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ldap_config`
--

DROP TABLE IF EXISTS `ldap_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ldap_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `HostAddress` varchar(50) DEFAULT NULL,
  `AuthMethod` varchar(100) DEFAULT NULL,
  `SearchCriteria` varchar(100) DEFAULT NULL,
  `AdminUsername` varchar(100) DEFAULT NULL,
  `AdminPassword` varchar(100) DEFAULT NULL,
  `Port` int(10) DEFAULT NULL,
  `Version` int(10) DEFAULT NULL,
  `Basedn` varchar(200) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT 1,
  `CreatedDate` datetime DEFAULT NULL,
  `ServerName` varchar(100) DEFAULT NULL,
  `Realm` varchar(16) DEFAULT NULL,
  `LdapFilter` varchar(500) DEFAULT NULL,
  `AdminDN` varchar(200) DEFAULT NULL,
  `Workgroup` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ldap_config_ibfk_1` (`CustomerId`),
  CONSTRAINT `ldap_config_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ldap_config`
--

LOCK TABLES `ldap_config` WRITE;
/*!40000 ALTER TABLE `ldap_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `ldap_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linkedin_userinfo`
--

DROP TABLE IF EXISTS `linkedin_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linkedin_userinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `LId` varchar(50) DEFAULT NULL,
  `LName` varchar(100) DEFAULT NULL,
  `LUserName` varchar(400) DEFAULT NULL,
  `LEmailAddress` varchar(100) DEFAULT NULL,
  `LLocation` varchar(100) DEFAULT NULL,
  `LHeadline` varchar(250) DEFAULT NULL,
  `LSummary` varchar(100) DEFAULT NULL,
  `LBirthday` date DEFAULT NULL,
  `LIndustry` varchar(250) DEFAULT NULL,
  `LConnections` varchar(250) DEFAULT NULL,
  `LPositions` int(50) DEFAULT NULL,
  `LPositiontitle` varchar(250) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LPictureURL` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkedin_userinfo`
--

LOCK TABLES `linkedin_userinfo` WRITE;
/*!40000 ALTER TABLE `linkedin_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `linkedin_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linkedin_userlogin`
--

DROP TABLE IF EXISTS `linkedin_userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linkedin_userlogin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LId` (`UserId`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linkedin_userlogin`
--

LOCK TABLES `linkedin_userlogin` WRITE;
/*!40000 ALTER TABLE `linkedin_userlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `linkedin_userlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(100) DEFAULT NULL,
  `DeviceTypeId` int(10) unsigned DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Latitude` varchar(10) DEFAULT NULL,
  `Longitude` varchar(10) DEFAULT NULL,
  `VenueTypeId` int(10) unsigned DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Timezone` varchar(50) DEFAULT 'America/New_York',
  `HotspotEnable` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `HotspotPlanId` int(10) DEFAULT 3,
  `RadiusServer1` varchar(50) DEFAULT NULL,
  `RadiusServer2` varchar(50) DEFAULT NULL,
  `RadiusRequestPassword` varchar(20) DEFAULT NULL,
  `RadiusSecret` varchar(20) DEFAULT NULL,
  `RadiusNasId` varchar(100) DEFAULT NULL,
  `UamServer` varchar(100) DEFAULT NULL,
  `PassthroughUrl` varchar(500) DEFAULT NULL,
  `MacPassword` varchar(20) DEFAULT NULL,
  `AutologinEnable` tinyint(1) DEFAULT NULL,
  `AutoMacLoginProfileId` int(11) DEFAULT NULL,		
  `AutoMacRegister` tinyint(1) DEFAULT NULL,
  `AutoLoginValidity` int(10) DEFAULT NULL,
  `AutoLoginValidityUnit` int(10) DEFAULT NULL,
  `HotspotIpAddress` varchar(20) DEFAULT NULL,
  `InterimInterval` int(5) DEFAULT 600,
  `IsDelete` tinyint(4) DEFAULT 0,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `WipsPolicyId` int(11) DEFAULT NULL,
  `tipLocationId` int(11) DEFAULT NULL,
  `DedicatedAuthAndAcceServer` tinyint(1) NOT NULL DEFAULT 1,
  `PrimaryAuthenticationServer` varchar(20) DEFAULT NULL,
  `PrimaryAuthenticationServerPort` int(4) NOT NULL DEFAULT 1812,
  `PrimaryAuthenticationServerSecret` varchar(15) DEFAULT NULL,
  `PrimaryAccountingServer` varchar(20) DEFAULT NULL,
  `PrimaryAccountingServerPort` int(4) NOT NULL DEFAULT 1813,
  `PrimaryAccountingServerSecret` varchar(15) DEFAULT NULL,
  `EnableRadiusFailover` tinyint(1) NOT NULL DEFAULT 0,
  `SecondaryAuthenticationServer` varchar(20) DEFAULT NULL,
  `SecondaryAuthenticationServerPort` int(4) NOT NULL DEFAULT 1812,
  `SecondaryAuthenticationServerSecret` varchar(15) DEFAULT NULL,
  `SecondaryAccountingServer` varchar(20) DEFAULT NULL,
  `SecondaryAccountingServerPort` int(4) NOT NULL DEFAULT 1813,
  `SecondaryAccountingServerSecret` varchar(15) DEFAULT NULL,
  `RadiusRetryPrimaryInterval` int(4) NOT NULL DEFAULT 30,
  `VenueId` int(11) DEFAULT NULL,
  `NetworkAuthProfileId` int(11) DEFAULT NULL,
  `IsDefault` tinyint(1) NOT NULL DEFAULT 0,
  `RetainLocalConfiguration` tinyint(1) NOT NULL DEFAULT 0,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `CFKey` bigint(100) DEFAULT NULL,
  `8021xEnable` tinyint(1) DEFAULT NULL,
  `EapConfigId` int(11) DEFAULT NULL,
  `LDAPEnable` tinyint(1) DEFAULT NULL,
  `LDAPProfile` int(11) DEFAULT NULL,
  `LocationDisName` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locationname` (`LocationName`),
  KEY `location` (`CustomerId`),
  KEY `AutoMacLoginProfileId` (`AutoMacLoginProfileId`), 
  CONSTRAINT `location` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`AutoMacLoginProfileId`) REFERENCES `mac_autologin_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_accounting_summary`
--

DROP TABLE IF EXISTS `location_accounting_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location_accounting_summary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `downloadbytes` bigint(20) DEFAULT NULL,
  `uploadbytes` bigint(20) DEFAULT NULL,
  `sessiontime` bigint(20) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sessioncount` int(11) DEFAULT NULL,
  `summary_date` datetime DEFAULT NULL,
  `unique_user_login` int(11) DEFAULT NULL,
  `device_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_id` (`location_id`,`summary_date`,`customer_id`),
  KEY `summary_date_idx` (`summary_date`),
  KEY `customer_id_idx` (`customer_id`),
  KEY `location_accounting_summary_lookup_by_customer_summary` (`customer_id`,`summary_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_accounting_summary`
--

LOCK TABLES `location_accounting_summary` WRITE;
/*!40000 ALTER TABLE `location_accounting_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `location_accounting_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locationtype`
--

DROP TABLE IF EXISTS `locationtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locationtype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LocationType` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locationtype`
--

LOCK TABLES `locationtype` WRITE;
/*!40000 ALTER TABLE `locationtype` DISABLE KEYS */;
INSERT INTO `locationtype` VALUES (1,'Apartment'),(2,'Airport'),(3,'Bar'),(4,'Bus Stop'),(5,'Coffee Shop'),(6,'Condominium'),(7,'Hotel'),(8,'Marina'),(9,'Museum'),(10,'Restaurant'),(11,'Train Stop'),(12,'Park'),(13,'FastFood Joint'),(14,'Office'),(15,'Other'),(16,'RV Park'),(17,'Rest Area'),(18,'Truck Stop'),(19,'Rental Homes'),(20,'Residential Home'),(21,'Bed n Breakfast'),(22,'Campground'),(23,'Beach'),(24,'Bookstore'),(25,'Convention Center'),(26,'Downtown Area'),(27,'WiFiZone'),(28,'Gas Station'),(29,'Golf Course'),(30,'Hospital'),(31,'Shopping Mall'),(32,'Municipal Network'),(33,'Outdoor Area'),(34,'School/University'),(35,'Tourist Place'),(36,'Retail Outlet'),(37,'Auto Rental'),(38,'Casino'),(39,'Convenience Store'),(40,'Car Wash Area'),(41,'Cinema/Theater'),(42,'Bank'),(43,'Health Club'),(44,'Residence'),(45,'Resort'),(46,'Oil Rig'),(47,'Govt Building'),(48,'SuperMarket'),(49,'Bus');
/*!40000 ALTER TABLE `locationtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_userinfo_temp`
--

DROP TABLE IF EXISTS `login_userinfo_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_userinfo_temp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `AttemptCount` int(10) DEFAULT NULL,
  `LastAttemptTime` datetime DEFAULT NULL,
  `AndroidId` varchar(50) DEFAULT NULL,
  `UserName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_userinfo_temp`
--

LOCK TABLES `login_userinfo_temp` WRITE;
/*!40000 ALTER TABLE `login_userinfo_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_userinfo_temp` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `mac_autologin_profile`
--

DROP TABLE IF EXISTS `mac_autologin_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_autologin_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProfileName` varchar(100) DEFAULT NULL,
  `AutoLoginValidity` int(10) DEFAULT NULL,
  `AutoLoginValidityUnit` int(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_autologin_profile`
--

LOCK TABLES `mac_autologin_profile` WRITE;
/*!40000 ALTER TABLE `mac_autologin_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_autologin_profile` ENABLE KEYS */;
UNLOCK TABLES;









--
-- Table structure for table `member_details`
--

DROP TABLE IF EXISTS `member_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_details` (
  `MemberId` varchar(50) NOT NULL,
  `MemberName` varchar(100) DEFAULT NULL,
  UNIQUE KEY `MemberId` (`MemberId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_details`
--

LOCK TABLES `member_details` WRITE;
/*!40000 ALTER TABLE `member_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesh_network_info`
--

DROP TABLE IF EXISTS `mesh_network_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesh_network_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MeshName` varchar(33) DEFAULT NULL,
  `MeshKey` varchar(16) DEFAULT NULL,
  `Customerid` int(11) DEFAULT NULL,
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesh_network_info`
--

LOCK TABLES `mesh_network_info` WRITE;
/*!40000 ALTER TABLE `mesh_network_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesh_network_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mnc_network_data`
--

DROP TABLE IF EXISTS `mnc_network_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `mnc_network_data` (
  `MCC` int(10) DEFAULT NULL,
  `MCC_int` int(10) DEFAULT NULL,
  `MNC` int(10) DEFAULT NULL,
  `MNC_int` int(10) DEFAULT NULL,
  `ISO` varchar(5) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `CountryCode` int(10) DEFAULT NULL,
  `Network` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mnc_network_data`
--

LOCK TABLES `mnc_network_data` WRITE;
/*!40000 ALTER TABLE `mnc_network_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mnc_network_data` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `model_range`
--


DROP TABLE IF EXISTS `model_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_range` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modelName` varchar(50) DEFAULT NULL,
  `txpower` float DEFAULT NULL,
  `d1` float DEFAULT NULL,
  `d2` float DEFAULT NULL,
  `d3` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_range`
--

LOCK TABLES `model_range` WRITE;
/*!40000 ALTER TABLE `model_range` DISABLE KEYS */;
INSERT INTO `model_range` VALUES (1,'WiFi-Soft 310AC',26,100,120,160),(2,'UM-210-N',30,20,30,45),(3,'UM-310-N',30,45,55,75),(4,'UM-320-AC',30,45,55,65),(5,'UM-510-AC',30,70,100,150),(6,'UM-510-N',30,42,52,62),(7,'default',29,30,40,50),(8,'WiFi-Soft 310N V2',30,45,55,75),(9,'WiFi-Soft 210N V2',30,20,30,45),(10,'UM-530-N',30,70,100,150),(11,'WiFi-Soft 530AC',26,140,160,180),(12,'WiFi-Soft 510N V2',30,60,70,80),(13,'WiFi-Soft 510AC',26,140,200,300),(14,'WiFi-Soft 530N',30,70,80,90),(19,'WiFi-Soft 230N-v2',30,20,30,45),(20,'WiFi-Soft 210N',30,20,30,45),(21,'WiFi-Soft 510N-v2',26,120,140,160);
/*!40000 ALTER TABLE `model_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_auth_group`
--

DROP TABLE IF EXISTS `network_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `IsDefault` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `network_auth_group` (`CustomerId`),
  CONSTRAINT `network_auth_group` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_auth_group`
--

LOCK TABLES `network_auth_group` WRITE;
/*!40000 ALTER TABLE `network_auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_auth_profile`
--

DROP TABLE IF EXISTS `network_auth_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_auth_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `HotspotEnable` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `HotspotPlanId` int(10) DEFAULT 3,
  `RadiusServer1` varchar(50) DEFAULT NULL,
  `RadiusServer2` varchar(50) DEFAULT NULL,
  `UamServer` varchar(100) DEFAULT NULL,
  `PassthroughUrl` varchar(500) DEFAULT NULL,
  `MacPassword` varchar(20) DEFAULT NULL,
  `AutologinEnable` tinyint(1) DEFAULT NULL,
  `AutoMacLoginProfileId` int(11) DEFAULT 0,
  `AutoMacRegister` tinyint(1) DEFAULT NULL,
  `AutoLoginValidity` int(10) DEFAULT NULL,
  `AutoLoginValidityUnit` int(10) DEFAULT NULL,
  `HotspotIpAddress` varchar(20) DEFAULT NULL,
  `InterimInterval` int(5) DEFAULT 600,
  `8021xEnable` tinyint(1) DEFAULT NULL,
  `EapConfigId` int(11) DEFAULT NULL,
  `DedicatedAuthAndAcceServer` tinyint(1) NOT NULL DEFAULT 1,
  `PrimaryAuthenticationServer` varchar(20) DEFAULT NULL,
  `PrimaryAuthenticationServerPort` int(4) NOT NULL DEFAULT 1812,
  `PrimaryAuthenticationServerSecret` varchar(15) DEFAULT NULL,
  `PrimaryAccountingServer` varchar(20) DEFAULT NULL,
  `PrimaryAccountingServerPort` int(4) NOT NULL DEFAULT 1813,
  `PrimaryAccountingServerSecret` varchar(15) DEFAULT NULL,
  `EnableRadiusFailover` tinyint(1) NOT NULL DEFAULT 0,
  `SecondaryAuthenticationServer` varchar(20) DEFAULT NULL,
  `SecondaryAuthenticationServerPort` int(4) NOT NULL DEFAULT 1812,
  `SecondaryAuthenticationServerSecret` varchar(15) DEFAULT NULL,
  `SecondaryAccountingServer` varchar(20) DEFAULT NULL,
  `SecondaryAccountingServerPort` int(4) NOT NULL DEFAULT 1813,
  `SecondaryAccountingServerSecret` varchar(15) DEFAULT NULL,
  `RadiusRetryPrimaryInterval` int(4) NOT NULL DEFAULT 30,
  `LDAPEnable` tinyint(1) DEFAULT NULL,
  `LDAPProfile` int(11) DEFAULT NULL,
  `IsDefault` tinyint(1) NOT NULL DEFAULT 0,
  `NetworkAuthGroupId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `network_auth_profile` (`CustomerId`),
  KEY `network_auth_profile_group` (`NetworkAuthGroupId`),
  CONSTRAINT `network_auth_profile` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `network_auth_profile_group` FOREIGN KEY (`NetworkAuthGroupId`) REFERENCES `network_auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_auth_profile`
--

LOCK TABLES `network_auth_profile` WRITE;
/*!40000 ALTER TABLE `network_auth_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_auth_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_life_cycle`
--

DROP TABLE IF EXISTS `network_life_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `network_life_cycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LocationId` int(11) NOT NULL,
  `CustomerId` int(11) NOT NULL,
  `TotalAP` int(11) DEFAULT 0,
  `UpAP` int(11) DEFAULT 0,
  `NetworkUpPercentage` int(11) DEFAULT 0,
  `DateTime` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `LocationId` (`LocationId`),
  CONSTRAINT `network_life_cycle_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `network_life_cycle_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_life_cycle`
--

LOCK TABLES `network_life_cycle` WRITE;
/*!40000 ALTER TABLE `network_life_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `network_life_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oui_db`
--

DROP TABLE IF EXISTS `oui_db`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oui_db` (
  `MacPrefix` char(8) NOT NULL,
  `MacVendor` varchar(100) NOT NULL,
  PRIMARY KEY (`MacPrefix`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oui_db`
--

LOCK TABLES `oui_db` WRITE;
/*!40000 ALTER TABLE `oui_db` DISABLE KEYS */;
/*!40000 ALTER TABLE `oui_db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pmwani_authentication_log`
--

DROP TABLE IF EXISTS `pmwani_authentication_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pmwani_authentication_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AppUserName` varchar(200) DEFAULT '',
  `AppProviderId` varchar(200) DEFAULT '',
  `AppProviderName` varchar(200) DEFAULT NULL,
  `WaniAppToken` text DEFAULT NULL,
  `ApMacId` varchar(100) DEFAULT NULL,
  `DeviceMacId` varchar(100) DEFAULT NULL,
  `UserPaymentAddress` varchar(300) DEFAULT NULL,
  `PdoaId` varchar(200) DEFAULT NULL,
  `AuthDateTimeStamp` datetime DEFAULT '0000-00-00 00:00:00',
  `Reason` varchar(200) DEFAULT NULL,
  `Status` varchar(30) DEFAULT NULL,
  `CustomerId` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pmwani_authentication_log`
--

LOCK TABLES `pmwani_authentication_log` WRITE;
/*!40000 ALTER TABLE `pmwani_authentication_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pmwani_authentication_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PolicyName` varchar(100) DEFAULT NULL,
  `ValidityInterval` int(10) DEFAULT NULL,
  `ValidityUnit` tinyint(1) DEFAULT 3,
  `DailyTimeQuota` bigint(20) DEFAULT NULL,
  `DailyTimeQuotaUnit` tinyint(4) NOT NULL DEFAULT 1,
  `TotalTimeQuota` bigint(20) DEFAULT NULL,
  `TotalTimeQuotaUnit` tinyint(4) NOT NULL DEFAULT 1,
  `DailyBandwidthQuota` bigint(20) DEFAULT NULL,
  `DailyBandwidthQuotaUnit` tinyint(4) NOT NULL DEFAULT 1,
  `TotalBandwidthQuota` bigint(20) DEFAULT NULL,
  `TotalBandwidthQuotaUnit` tinyint(4) NOT NULL DEFAULT 1,
  `DailySessionCount` int(11) DEFAULT NULL,
  `SessionTimeout` bigint(10) DEFAULT NULL,
  `SessionTimeoutUnit` tinyint(4) NOT NULL DEFAULT 1,
  `IdleTimeout` bigint(10) DEFAULT NULL,
  `IdleTimeoutUnit` tinyint(4) NOT NULL DEFAULT 1,
  `DownloadRate` bigint(10) DEFAULT NULL,
  `DownloadRateUnit` tinyint(4) NOT NULL DEFAULT 1,
  `UploadRate` bigint(10) DEFAULT NULL,
  `UploadRateUnit` tinyint(4) NOT NULL DEFAULT 1,
  `ConcurrencyLimit` int(10) DEFAULT NULL,
  `MaxDeviceLimit` int(11) DEFAULT NULL,
  `AutoRenewal` tinyint(1) DEFAULT 0,
  `EnableFup` tinyint(1) DEFAULT 0,
  `FupDailyBandwidthQuota` bigint(20) DEFAULT NULL,
  `FupDailyBandwidthUnit` tinyint(4) NOT NULL DEFAULT 1,
  `FupDownloadRate` bigint(10) DEFAULT NULL,
  `FupDownloadRateUnit` tinyint(4) NOT NULL DEFAULT 1,
  `FupUploadRate` bigint(10) DEFAULT NULL,
  `FupUploadrateUnit` tinyint(4) NOT NULL DEFAULT 1,
  `IsDefault` tinyint(1) NOT NULL DEFAULT 0,
  `FilterId` varchar(100) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `LastModifiedTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_ibfk_1` (`CustomerId`),
  CONSTRAINT `policy_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_url`
--

DROP TABLE IF EXISTS `port_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `port_url` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `PortalUrl` varchar(250) DEFAULT NULL,
  `OldPortalUrl` varchar(250) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DeviceId` int(10) DEFAULT NULL,
  `portal_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`),
  KEY `fk_portalconfig` (`portal_config_id`),
  CONSTRAINT `port_url_ibfk_1` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `port_url_ibfk_2` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `port_url_ibfk_3` FOREIGN KEY (`portal_config_id`) REFERENCES `portal_config` (`id`) ON DELETE CASCADE,
  CONSTRAINT `portal_config_id_fkey` FOREIGN KEY (`portal_config_id`) REFERENCES `portal_config` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_url`
--

LOCK TABLES `port_url` WRITE;
/*!40000 ALTER TABLE `port_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `port_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portal_config`
--

DROP TABLE IF EXISTS `portal_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portal_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IsDefaultConfig` tinyint(1) NOT NULL,
  `ApiHost` varchar(255) NOT NULL,
  `ApiPath` varchar(255) NOT NULL,
  `Customercode` int(10) NOT NULL,
  `Realm` varchar(50) NOT NULL,
  `Currency` varchar(10) NOT NULL,
  `Language` varchar(10) NOT NULL,
  `OptionalLanguage` varchar(150) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `Locationname` varchar(50) DEFAULT NULL,
  `LocationDisName` varchar(100) DEFAULT NULL,
  `EnableUnamePasswd` tinyint(1) DEFAULT NULL,
  `UnamePasswordTitle` varchar(25) DEFAULT NULL,
  `PaidEnableTnc` tinyint(1) DEFAULT NULL,
  `TempLogin` tinyint(1) DEFAULT NULL,
  `PaidSmsLink` tinyint(1) DEFAULT NULL,
  `PaidEnableOtpVerification` tinyint(1) DEFAULT NULL,
  `PaidInstructionText` varchar(350) DEFAULT NULL,
  `PaidPlanGroupId` int(15) DEFAULT NULL,
  `PaidUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqLastname` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqAddress` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqCity` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqState` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqZipcode` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqCountry` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `EnablePmwani` tinyint(1) DEFAULT NULL,
  `PmwaniTitle` varchar(25) DEFAULT NULL,
  `PmwaniInstructionText` varchar(350) DEFAULT NULL,
  `PmwaniPaidPlanGroupId` int(15) DEFAULT NULL,
  `PmwaniSmsLink` tinyint(1) DEFAULT NULL,
  `PmwaniUpi` tinyint(1) DEFAULT NULL,
  `PmwaniEnableTnc` tinyint(1) DEFAULT NULL,
  `PmwaniVoucher` tinyint(1) DEFAULT NULL,
  `EnablePmwaniWeb` tinyint(1) DEFAULT NULL,
  `PmwaniWebTitle` varchar(25) DEFAULT NULL,
  `PmwaniWebInstructionText` varchar(350) DEFAULT NULL,
  `PmwaniWebEnableTnc` tinyint(1) DEFAULT NULL,
  `EnableVoucher` tinyint(1) DEFAULT NULL,
  `VoucherTitle` varchar(25) DEFAULT NULL,
  `VoucherEnableTnc` tinyint(1) DEFAULT NULL,
  `VoucherInstructionText` varchar(350) DEFAULT NULL,
  `VoucherUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `VoucherUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `VoucherUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `VoucherUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `VoucherUserInfoReqAge` tinyint(1) DEFAULT NULL,
  `EnableVoucherWithOtp` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpTitle` varchar(25) DEFAULT NULL,
  `VoucherWithOtpEnableTnc` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpInstructionText` varchar(350) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqLastname` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqAddress` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqCity` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqState` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqZipcode` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqCountry` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqAge` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqBirthdate` tinyint(1) DEFAULT NULL,
  `EnableLdap` tinyint(1) DEFAULT NULL,
  `LdapTitle` varchar(25) DEFAULT NULL,
  `LdapEnableTnc` tinyint(1) DEFAULT NULL,
  `LdapInstructionText` varchar(350) DEFAULT NULL,
  `EnableFreeOnClick` tinyint(1) DEFAULT NULL,
  `FreeOnClickTitle` varchar(25) DEFAULT NULL,
  `FreeOnClickEnableTnc` tinyint(1) DEFAULT NULL,
  `FreeOnClickInstructionText` varchar(350) DEFAULT NULL,
  `EnableFreeWithUserInfoCapture` tinyint(1) DEFAULT NULL,
  `FreeUserInfoTitle` varchar(25) DEFAULT NULL,
  `FreeUserInfoEnableTnc` tinyint(1) DEFAULT NULL,
  `FreeUserInfoInstructionText` varchar(350) DEFAULT NULL,
  `FreeUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqLastname` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqAddress` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqCity` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqState` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqZipcode` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqCountry` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqAge` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqGetUnamePasswd` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqNoSignup` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqOccuption` tinyint(1) DEFAULT NULL,
  `EnableFreeWithExternalUserInfoCapture` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoTitle` varchar(25) DEFAULT NULL,
  `FreeExternalUserInfoEnableTnc` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoInstructionText` varchar(350) DEFAULT NULL,
  `FreeExternalUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoReqDepartment` tinyint(1) DEFAULT NULL,
  `EnableFreeWithPassword` tinyint(1) DEFAULT NULL,
  `FreeWithPasswordTitle` varchar(25) DEFAULT NULL,
  `FreeWithPasswordEnableTnc` tinyint(1) DEFAULT NULL,
  `FreeWithPasswordInstructionText` varchar(350) DEFAULT NULL,
  `FreePasswordReqFirstname` tinyint(1) DEFAULT NULL,
  `FreePasswordReqLastname` tinyint(1) DEFAULT NULL,
  `FreePasswordReqEmail` tinyint(1) DEFAULT NULL,
  `FreePasswordReqHomephone` tinyint(1) DEFAULT NULL,
  `FreePasswordReqAddress` tinyint(1) DEFAULT NULL,
  `FreePasswordReqCity` tinyint(1) DEFAULT NULL,
  `FreePasswordReqState` tinyint(1) DEFAULT NULL,
  `FreePasswordReqZipcode` tinyint(1) DEFAULT NULL,
  `FreePasswordReqCountry` tinyint(1) DEFAULT NULL,
  `FreePasswordReqGender` tinyint(1) DEFAULT NULL,
  `FreeAccessPassword` varchar(100) DEFAULT NULL,
  `LdapPolicyId` int(10) DEFAULT NULL,
  `FreePolicyId` int(10) DEFAULT NULL,
  `FreeDataCapturePolicyId` int(10) DEFAULT NULL,
  `FreeExternalUserPolicyId` int(10) DEFAULT NULL,
  `SmsPolicyId` int(10) DEFAULT NULL,
  `VoucherWithOtpPolicyId` int(10) DEFAULT NULL,
  `SocialPolicyId` int(10) DEFAULT NULL,
  `FreePasswordPolicyId` int(10) DEFAULT NULL,
  `EnableSms` tinyint(1) DEFAULT NULL,
  `SmsTitle` varchar(25) DEFAULT NULL,
  `SmsEnableTnc` tinyint(1) DEFAULT NULL,
  `SmsInstructionText` varchar(350) DEFAULT NULL,
  `SmsUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqLastname` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqAddress` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqCity` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqState` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqZipcode` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqCountry` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqAge` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqBirthdate` tinyint(1) DEFAULT NULL,
  `EnableSocialMedia` tinyint(1) DEFAULT NULL,
  `SocialMediaTitle` varchar(25) DEFAULT NULL,
  `SocialMediaEnableTnc` tinyint(1) DEFAULT NULL,
  `SocialMediaInstructionText` varchar(350) DEFAULT NULL,
  `EnableSmFb` tinyint(1) DEFAULT NULL,
  `FbAppId` varchar(200) DEFAULT NULL,
  `FbAppSecret` varchar(200) DEFAULT NULL,
  `FbLikeUrl` varchar(100) DEFAULT NULL,
  `FbShareUrl` varchar(100) DEFAULT NULL,
  `EnableSmLi` tinyint(1) DEFAULT NULL,
  `LiAppId` varchar(200) DEFAULT NULL,
  `LiAppSecret` varchar(200) DEFAULT NULL,
  `LiLikeUrl` varchar(100) DEFAULT NULL,
  `LiShareUrl` varchar(100) DEFAULT NULL,
  `EnableSmTt` tinyint(1) DEFAULT NULL,
  `TtAppId` varchar(200) DEFAULT NULL,
  `TtAppSecret` varchar(200) DEFAULT NULL,
  `TtLikeUrl` varchar(100) DEFAULT NULL,
  `TtShareUrl` varchar(100) DEFAULT NULL,
  `EnableSmGg` tinyint(1) DEFAULT NULL,
  `GgAppId` varchar(200) DEFAULT NULL,
  `GgAppSecret` varchar(200) DEFAULT NULL,
  `GgLikeUrl` varchar(100) DEFAULT NULL,
  `GgShareUrl` varchar(100) DEFAULT NULL,
  `EnableSmIg` tinyint(1) DEFAULT NULL,
  `IgAppId` varchar(200) DEFAULT NULL,
  `IgAppSecret` varchar(200) DEFAULT NULL,
  `IgFollowUrl` varchar(100) DEFAULT NULL,
  `parameterpassing` varchar(10) NOT NULL,
  `EnableLoginCookies` tinyint(1) NOT NULL,
  `Devicetype` varchar(50) DEFAULT NULL,
  `Deviceid` int(10) DEFAULT NULL,
  `RequestPassword` varchar(100) DEFAULT NULL,
  `ReqPaidUnamePasswd` varchar(150) DEFAULT NULL,
  `SocialPlan` varchar(150) DEFAULT NULL,
  `EnableProximityMarketing` tinyint(1) DEFAULT NULL,
  `EnableSelfCare` tinyint(1) DEFAULT NULL,
  `EnableAds` tinyint(1) DEFAULT NULL,
  `AdsCheckDeviceMac` tinyint(1) DEFAULT NULL,
  `AdsSkipPaidUsers` tinyint(1) DEFAULT NULL,
  `Adonclick` varchar(10) DEFAULT NULL,
  `EnableReview` tinyint(1) DEFAULT NULL,
  `EnableReviewQuestion` varchar(255) DEFAULT NULL,
  `EnableSurvey` tinyint(1) DEFAULT NULL,
  `VoucherPassword` varchar(255) DEFAULT NULL,
  `Logo` varchar(150) DEFAULT NULL,
  `PortalLogo` varchar(150) DEFAULT NULL,
  `LogoAnchorLink` varchar(150) DEFAULT NULL,
  `ApplyPartnerLogo` varchar(150) DEFAULT NULL,
  `PartnerLogo` varchar(150) DEFAULT NULL,
  `PortalPartnerLogo` varchar(150) DEFAULT NULL,
  `PartnerLogoAnchorLink` varchar(150) DEFAULT NULL,
  `PortalFrameBackgroundColor` varchar(100) DEFAULT NULL,
  `PortalFontColor` varchar(100) DEFAULT NULL,
  `ApplySiteImage` varchar(100) DEFAULT NULL,
  `SiteImagetheme` varchar(100) DEFAULT NULL,
  `SiteImage` varchar(150) DEFAULT NULL,
  `PortalSiteImage` varchar(150) DEFAULT NULL,
  `WelcomeUrl` varchar(150) DEFAULT NULL,
  `Footer` varchar(100) DEFAULT NULL,
  `ShowSupportNumber` varchar(10) DEFAULT NULL,
  `SupportNumber` varchar(25) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AllowTemplateToChangeConfig` tinyint(1) DEFAULT NULL,
  `IsTemplate` tinyint(1) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT 0,
  `EnableEndUserTicket` tinyint(1) DEFAULT NULL,
  `EnableCaptivePortalBypass` tinyint(1) DEFAULT 0,
  `TemplateId` int(11) DEFAULT NULL,
  `TNCText` varchar(350) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SmsUserInfoReqLandlineno` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_config_ibfk_1` (`CustomerId`),
  KEY `portal_config_ibfk_3` (`LocationId`),
  KEY `portal_config_ibfk_4` (`TemplateId`),
  CONSTRAINT `portal_config_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `portal_config_ibfk_3` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `portal_config_ibfk_4` FOREIGN KEY (`TemplateId`) REFERENCES `template_portal_config` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portal_config`
--

LOCK TABLES `portal_config` WRITE;
/*!40000 ALTER TABLE `portal_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `portal_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_announcement`
--

DROP TABLE IF EXISTS `proxmark_announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `Message` varchar(200) DEFAULT NULL,
  `LogoFile` varchar(100) DEFAULT NULL,
  `ClickCount` int(10) DEFAULT 0,
  `DateCreated` datetime DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DestinationLink` varchar(100) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  `NotificationId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_announcement_ibfk_1` (`CustomerId`),
  CONSTRAINT `proxmark_announcement_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_announcement`
--

LOCK TABLES `proxmark_announcement` WRITE;
/*!40000 ALTER TABLE `proxmark_announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_announcement_location`
--

DROP TABLE IF EXISTS `proxmark_announcement_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_announcement_location` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AnnouncementId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_announcement_location_ibfk_1` (`CustomerId`),
  CONSTRAINT `proxmark_announcement_location_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_announcement_location`
--

LOCK TABLES `proxmark_announcement_location` WRITE;
/*!40000 ALTER TABLE `proxmark_announcement_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_announcement_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_config`
--

DROP TABLE IF EXISTS `proxmark_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CredentialType` tinyint(2) DEFAULT 1,
  `WebAPIKey` varchar(100) DEFAULT NULL,
  `SenderId` varchar(100) DEFAULT NULL,
  `WelcomeLogo` varchar(100) DEFAULT NULL,
  `WelcomeTitle` varchar(200) DEFAULT NULL,
  `WelcomeMessage` varchar(300) DEFAULT NULL,
  `OnlineTotalCount` int(10) DEFAULT NULL,
  `OnlineInterNotificationInterVal` int(10) DEFAULT NULL,
  `OfflineTotalCount` int(10) DEFAULT NULL,
  `OfflineInterNotificationInterVal` int(10) DEFAULT NULL,
  `OfflineTotalRepeatCount` int(10) DEFAULT NULL,
  `OfflineNotificationRepeatInterVal` int(10) DEFAULT NULL,
  `OnlineTotalRepeatCount` int(10) DEFAULT NULL,
  `OnlineNotificationRepeatInterVal` int(10) DEFAULT NULL,
  `ProximityNotificationFlag` tinyint(4) DEFAULT 0,
  `OfflineNotificationFlag` tinyint(4) DEFAULT 0,
  `CustomerId` int(11) DEFAULT NULL,
  `ProximityNotificationUrl` varchar(256) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_config_ibfk_1` (`CustomerId`),
  CONSTRAINT `proxmark_config_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_config`
--

LOCK TABLES `proxmark_config` WRITE;
/*!40000 ALTER TABLE `proxmark_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_feature_status`
--

DROP TABLE IF EXISTS `proxmark_feature_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_feature_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `MACAddress` varchar(20) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `ReqDateTime` datetime DEFAULT NULL,
  `Status` tinyint(1) DEFAULT 1,
  `RadUserId` int(10) DEFAULT NULL,
  `ZoneId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_feature_status_ibfk_1` (`CustomerId`),
  KEY `proxmark_feature_status_ibfk_2` (`LocationId`),
  CONSTRAINT `proxmark_feature_status_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `proxmark_feature_status_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_feature_status`
--

LOCK TABLES `proxmark_feature_status` WRITE;
/*!40000 ALTER TABLE `proxmark_feature_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_feature_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_notification_click_history`
--

DROP TABLE IF EXISTS `proxmark_notification_click_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_notification_click_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `NotificationId` int(10) unsigned DEFAULT NULL,
  `SubscriberId` int(10) unsigned DEFAULT NULL,
  `ClickDateTime` datetime DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `ZoneId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `SentId` int(10) DEFAULT NULL,
  `SchedulerId` int(10) DEFAULT NULL,
  `IsOnline` tinyint(1) DEFAULT 0,
  `SentDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_notification_click_history_ibfk_1` (`CustomerId`),
  KEY `proxmark_notification_click_history_ibfk_2` (`LocationId`),
  CONSTRAINT `proxmark_notification_click_history_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_notification_click_history`
--

LOCK TABLES `proxmark_notification_click_history` WRITE;
/*!40000 ALTER TABLE `proxmark_notification_click_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_notification_click_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_notification_reqtrack`
--

DROP TABLE IF EXISTS `proxmark_notification_reqtrack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_notification_reqtrack` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ReqId` varchar(16) DEFAULT NULL,
  `SchedulerId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `ZoneId` int(10) DEFAULT NULL,
  `NotificationId` int(10) DEFAULT NULL,
  `SubscriberId` int(10) unsigned DEFAULT NULL,
  `RequestTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_notification_reqtrack_ibfk_1` (`CustomerId`),
  KEY `proxmark_notification_reqtrack_ibfk_2` (`LocationId`),
  CONSTRAINT `proxmark_notification_reqtrack_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `proxmark_notification_reqtrack_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_notification_reqtrack`
--

LOCK TABLES `proxmark_notification_reqtrack` WRITE;
/*!40000 ALTER TABLE `proxmark_notification_reqtrack` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_notification_reqtrack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_notification_sent_history`
--

DROP TABLE IF EXISTS `proxmark_notification_sent_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_notification_sent_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `NotificationId` int(10) unsigned DEFAULT NULL,
  `SubscriberId` int(10) unsigned DEFAULT NULL,
  `SentDateTime` datetime DEFAULT NULL,
  `StatusMessage` varchar(100) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `ZoneId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `ReqId` varchar(16) DEFAULT NULL,
  `SchedulerId` int(11) DEFAULT NULL,
  `IsOnline` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `notification_history_lookup` (`id`,`NotificationId`),
  KEY `notification_history_lookup2` (`SubscriberId`,`StatusMessage`,`CustomerId`,`SentDateTime`),
  KEY `proxmark_notification_sent_history_ibfk_1` (`CustomerId`),
  KEY `proxmark_notification_sent_history_ibfk_2` (`LocationId`),
  CONSTRAINT `proxmark_notification_sent_history_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `proxmark_notification_sent_history_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_notification_sent_history`
--

LOCK TABLES `proxmark_notification_sent_history` WRITE;
/*!40000 ALTER TABLE `proxmark_notification_sent_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_notification_sent_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_proximity_config_notification`
--

DROP TABLE IF EXISTS `proxmark_proximity_config_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_proximity_config_notification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `NotificationId` int(10) unsigned DEFAULT NULL,
  `ProximitySchedulerId` int(10) unsigned DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_proximity_config_notification_ibfk_1` (`CustomerId`),
  CONSTRAINT `proxmark_proximity_config_notification_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_proximity_config_notification`
--

LOCK TABLES `proxmark_proximity_config_notification` WRITE;
/*!40000 ALTER TABLE `proxmark_proximity_config_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_proximity_config_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_proximity_scheduler`
--

DROP TABLE IF EXISTS `proxmark_proximity_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_proximity_scheduler` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `SchedulerName` varchar(70) DEFAULT NULL,
  `EnableProximity` tinyint(1) DEFAULT 1,
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `Status` tinyint(1) DEFAULT 1,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_proximity_scheduler_ibfk_1` (`CustomerId`),
  CONSTRAINT `proxmark_proximity_scheduler_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_proximity_scheduler`
--

LOCK TABLES `proxmark_proximity_scheduler` WRITE;
/*!40000 ALTER TABLE `proxmark_proximity_scheduler` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_proximity_scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_proximity_zone`
--

DROP TABLE IF EXISTS `proxmark_proximity_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_proximity_zone` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ZoneName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `AccessPointMac` varchar(20) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_proximity_zone_ibfk_1` (`CustomerId`),
  KEY `proxmark_proximity_zone_ibfk_2` (`LocationId`),
  CONSTRAINT `proxmark_proximity_zone_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `proxmark_proximity_zone_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_proximity_zone`
--

LOCK TABLES `proxmark_proximity_zone` WRITE;
/*!40000 ALTER TABLE `proxmark_proximity_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_proximity_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_push_notification`
--

DROP TABLE IF EXISTS `proxmark_push_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_push_notification` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `Message` varchar(200) DEFAULT NULL,
  `DestinationLink` varchar(100) DEFAULT NULL,
  `LogoFile` varchar(100) DEFAULT NULL,
  `Status` tinyint(1) DEFAULT 1,
  `Gender` tinyint(1) DEFAULT NULL,
  `SentCount` int(10) DEFAULT NULL,
  `ClickCount` int(10) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `SendDays` varchar(10) DEFAULT NULL,
  `SendHours` varchar(25) DEFAULT NULL,
  `EnableOffline` tinyint(1) DEFAULT 1,
  `TimeIntervalPeriod` varchar(10) DEFAULT NULL,
  `TimeIntervalUnit` varchar(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `OfflineSendHour` varchar(100) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_push_notification_ibfk_1` (`CustomerId`),
  CONSTRAINT `proxmark_push_notification_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_push_notification`
--

LOCK TABLES `proxmark_push_notification` WRITE;
/*!40000 ALTER TABLE `proxmark_push_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_push_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_scheduler_hotspot`
--

DROP TABLE IF EXISTS `proxmark_scheduler_hotspot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_scheduler_hotspot` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ProximitySchedulerId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `HasZone` tinyint(2) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_scheduler_hotspot_ibfk_1` (`CustomerId`),
  KEY `proxmark_scheduler_hotspot_ibfk_2` (`LocationId`),
  CONSTRAINT `proxmark_scheduler_hotspot_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `proxmark_scheduler_hotspot_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_scheduler_hotspot`
--

LOCK TABLES `proxmark_scheduler_hotspot` WRITE;
/*!40000 ALTER TABLE `proxmark_scheduler_hotspot` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_scheduler_hotspot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_scheduler_zone`
--

DROP TABLE IF EXISTS `proxmark_scheduler_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_scheduler_zone` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ProximitySchedulerId` int(10) unsigned DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `ZoneId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_scheduler_zone_ibfk_1` (`CustomerId`),
  CONSTRAINT `proxmark_scheduler_zone_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_scheduler_zone`
--

LOCK TABLES `proxmark_scheduler_zone` WRITE;
/*!40000 ALTER TABLE `proxmark_scheduler_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_scheduler_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_subscribers`
--

DROP TABLE IF EXISTS `proxmark_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_subscribers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Token` varchar(250) DEFAULT NULL,
  `MACAddress` varchar(20) DEFAULT NULL,
  `ClickCount` int(10) DEFAULT 0,
  `DeviceType` varchar(20) DEFAULT NULL,
  `RadUserId` int(10) DEFAULT NULL,
  `ZoneId` int(10) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `SubscribeDateTime` datetime NOT NULL DEFAULT current_timestamp(),
  `OnlineSentCount` tinyint(1) DEFAULT 0,
  `OfflineSentCount` tinyint(1) DEFAULT 0,
  `SentCount` tinyint(10) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `proxmark_subscribers_ibfk_1` (`CustomerId`),
  KEY `proxmark_subscribers_ibfk_2` (`LocationId`),
  CONSTRAINT `proxmark_subscribers_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `proxmark_subscribers_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_subscribers`
--

LOCK TABLES `proxmark_subscribers` WRITE;
/*!40000 ALTER TABLE `proxmark_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxmark_zone_mac`
--

DROP TABLE IF EXISTS `proxmark_zone_mac`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proxmark_zone_mac` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `ZoneId` int(10) DEFAULT NULL,
  `MacAddress` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proxmark_zone_mac_ibfk_1` (`ZoneId`),
  CONSTRAINT `proxmark_zone_mac_ibfk_1` FOREIGN KEY (`ZoneId`) REFERENCES `proxmark_proximity_zone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxmark_zone_mac`
--

LOCK TABLES `proxmark_zone_mac` WRITE;
/*!40000 ALTER TABLE `proxmark_zone_mac` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxmark_zone_mac` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rad_question`
--

DROP TABLE IF EXISTS `rad_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rad_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `SecretQuestion` varchar(150) DEFAULT NULL,
  `SecretAnswer` varchar(100) DEFAULT NULL,
  `CustomerId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rad_question`
--

LOCK TABLES `rad_question` WRITE;
/*!40000 ALTER TABLE `rad_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `rad_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseller_credit_consumption`
--

DROP TABLE IF EXISTS `reseller_credit_consumption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reseller_credit_consumption` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ResellerWalletId` int(10) DEFAULT NULL,
  `ResellerId` int(10) DEFAULT NULL,
  `VoucherBatchId` int(10) DEFAULT NULL,
  `UsedAmount` float DEFAULT NULL,
  `RemainingAmount` float DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_credit_consumption`
--

LOCK TABLES `reseller_credit_consumption` WRITE;
/*!40000 ALTER TABLE `reseller_credit_consumption` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_credit_consumption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseller_transactions`
--

DROP TABLE IF EXISTS `reseller_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reseller_transactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ResellerWalletId` int(10) DEFAULT NULL,
  `ResellerId` int(10) DEFAULT NULL,
  `WalletAmount` float DEFAULT NULL,
  `ResellerCredits` float DEFAULT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `PaymentMode` tinyint(1) DEFAULT NULL COMMENT '1=CASH,2=CHEQUE,3=ONLINE',
  `PaymentStatus` tinyint(1) DEFAULT 0,
  `ChequeNumber` varchar(250) DEFAULT NULL,
  `BankName` text DEFAULT NULL,
  `TransactionId` varchar(25) DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_transactions`
--

LOCK TABLES `reseller_transactions` WRITE;
/*!40000 ALTER TABLE `reseller_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseller_wallet`
--

DROP TABLE IF EXISTS `reseller_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reseller_wallet` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) DEFAULT NULL,
  `ResellerId` int(10) DEFAULT NULL,
  `WalletAmount` float DEFAULT NULL,
  `ResellerCredits` float DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseller_wallet`
--

LOCK TABLES `reseller_wallet` WRITE;
/*!40000 ALTER TABLE `reseller_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseller_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rogue_ap_classification`
--

DROP TABLE IF EXISTS `rogue_ap_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rogue_ap_classification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` int(11) DEFAULT 0,
  `NApMacAddress` varchar(20) NOT NULL,
  `LastCheckinTime` datetime DEFAULT NULL,
  `Uptime` varchar(10) DEFAULT NULL,
  `SSID` varchar(33) NOT NULL,
  `Frequency` smallint(6) DEFAULT 0,
  `Rssi` tinyint(4) DEFAULT NULL,
  `PrimaryChannel` tinyint(4) DEFAULT 0,
  `SecondaryChannel` tinyint(4) DEFAULT 0,
  `ChannelWidth` varchar(8) DEFAULT NULL,
  `StaChannelWidth` varchar(8) DEFAULT NULL,
  `FirstCenterFrequency` varchar(8) DEFAULT NULL,
  `SecondCenterFrequency` varchar(8) DEFAULT NULL,
  `Authentication` varchar(20) DEFAULT NULL,
  `Security` varchar(20) DEFAULT 'None',
  `Description` varchar(150) DEFAULT NULL,
  `Category` varchar(20) DEFAULT NULL,
  `EnableRogue` varchar(10) DEFAULT NULL,
  `AcknowledgeFlag` tinyint(1) DEFAULT 0,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`NApMacAddress`),
  UNIQUE KEY `NApMacAddress_unique` (`NApMacAddress`),
  KEY `neighbor_apid` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rogue_ap_classification`
--

LOCK TABLES `rogue_ap_classification` WRITE;
/*!40000 ALTER TABLE `rogue_ap_classification` DISABLE KEYS */;
/*!40000 ALTER TABLE `rogue_ap_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rogue_ap_status`
--

DROP TABLE IF EXISTS `rogue_ap_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rogue_ap_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ClassificationId` int(10) unsigned DEFAULT NULL,
  `ApId` int(10) DEFAULT NULL,
  `NApMacAddress` varchar(20) NOT NULL,
  `Rssi` int(11) DEFAULT 0,
  `LastSeen` datetime DEFAULT NULL,
  `DateCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `classification_id` (`ClassificationId`),
  CONSTRAINT `rogue_ap_status_ibfk_1` FOREIGN KEY (`ClassificationId`) REFERENCES `rogue_ap_classification` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rogue_ap_status`
--

LOCK TABLES `rogue_ap_status` WRITE;
/*!40000 ALTER TABLE `rogue_ap_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `rogue_ap_status` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `sbi_employee_data`
--

DROP TABLE IF EXISTS `sbi_employee_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sbi_employee_data` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `EmployeeId` varchar(12) DEFAULT NULL,
  `FullName` varchar(50) NOT NULL,
  `MobileNumber` varchar(30) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MobileNumber` (`MobileNumber`),
  UNIQUE KEY `EmployeeId` (`EmployeeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sbi_employee_data`
--

LOCK TABLES `sbi_employee_data` WRITE;
/*!40000 ALTER TABLE `sbi_employee_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sbi_employee_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_email_alerts_notifications`
--

DROP TABLE IF EXISTS `send_email_alerts_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send_email_alerts_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CategoryId` int(10) unsigned DEFAULT NULL,
  `UserName` varchar(80) NOT NULL DEFAULT '',
  `Status` varchar(15) DEFAULT NULL,
  `isUsed` tinyint(1) DEFAULT 0,
  `Verificationcode` varchar(50) NOT NULL,
  `FromEmailId` varchar(20) NOT NULL DEFAULT '',
  `ToEmailId` varchar(20) DEFAULT NULL,
  `TemplateSubject` varchar(200) DEFAULT NULL,
  `TemplateBody` text DEFAULT NULL,
  `CallingStationId` varchar(30) NOT NULL DEFAULT '',
  `AuthDateTimeStamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_email_alerts_notifications`
--

LOCK TABLES `send_email_alerts_notifications` WRITE;
/*!40000 ALTER TABLE `send_email_alerts_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_email_alerts_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `send_sms_alerts_notifications`
--

DROP TABLE IF EXISTS `send_sms_alerts_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `send_sms_alerts_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CategoryId` int(10) unsigned DEFAULT NULL,
  `UserName` varchar(100) NOT NULL DEFAULT '',
  `Status` varchar(15) DEFAULT NULL,
  `SMSContent` varchar(200) NOT NULL DEFAULT '',
  `Message_entry` varchar(200) DEFAULT NULL,
  `MobileNumber` varchar(15) DEFAULT NULL,
  `CallingStationId` varchar(30) NOT NULL DEFAULT '',
  `AuthDateTimeStamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `send_sms_alerts_notifications`
--

LOCK TABLES `send_sms_alerts_notifications` WRITE;
/*!40000 ALTER TABLE `send_sms_alerts_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `send_sms_alerts_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_temp_customer`
--

DROP TABLE IF EXISTS `signup_temp_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signup_temp_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `PhoneNumber` varchar(30) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `UserName` varchar(40) DEFAULT NULL,
  `Token` varchar(50) DEFAULT NULL,
  `Used` tinyint(1) DEFAULT 0,
  `TokenExpiry` datetime DEFAULT NULL,
  `CreatedDate` datetime DEFAULT current_timestamp(),
  `Country` varchar(30) DEFAULT NULL,
  `CountryId` varchar(20) DEFAULT NULL,
  `TimezoneName` varchar(150) DEFAULT NULL,
  `Currency` varchar(50) DEFAULT NULL,
  `CompanyName` varchar(40) DEFAULT NULL,
  `CompanyShortName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_temp_customer`
--

LOCK TABLES `signup_temp_customer` WRITE;
/*!40000 ALTER TABLE `signup_temp_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `signup_temp_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smart_content`
--

DROP TABLE IF EXISTS `smart_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smart_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Path` varchar(250) DEFAULT NULL,
  `IsDeleted` tinyint(4) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  `ContentType` int(11) DEFAULT NULL,
  `ContentSize` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smart_content`
--

LOCK TABLES `smart_content` WRITE;
/*!40000 ALTER TABLE `smart_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `smart_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_details`
--

DROP TABLE IF EXISTS `sms_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL DEFAULT '',
  `AuthDateTimeStamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `CallingStationId` varchar(30) NOT NULL DEFAULT '',
  `SMSContent` text DEFAULT NULL,
  `VerificationCode` varchar(50) NOT NULL DEFAULT '',
  `Message_entry` varchar(200) DEFAULT NULL,
  `IsUsed` tinyint(1) DEFAULT 0,
  `isEmail` tinyint(1) DEFAULT 0,
  `isSms` tinyint(1) DEFAULT 0,
  `SMSAttemptCount` tinyint(2) DEFAULT NULL,
  `MobileNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `OTPExpiryDate` datetime DEFAULT NULL,
  `LocationId` int(10) unsigned DEFAULT NULL,
  `CustomerId` int(10) unsigned DEFAULT NULL,
  `RetailerDistributorId` int(11) DEFAULT 0,
  `UserId` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_details`
--

LOCK TABLES `sms_details` WRITE;
/*!40000 ALTER TABLE `sms_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_details` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `smtp_configurations`
--

DROP TABLE IF EXISTS `smtp_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `smtp_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EnableSmtp` tinyint(1) DEFAULT 0,
  `Port` varchar(50) NOT NULL,
  `UserName` varchar(250) NOT NULL,
  `PassWord` varchar(150) NOT NULL,
  `HostName` varchar(250) DEFAULT NULL,
  `Ssltype` tinyint(1) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smtp_configurations`
--

LOCK TABLES `smtp_configurations` WRITE;
/*!40000 ALTER TABLE `smtp_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `smtp_configurations` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `sms_gateway`
--

DROP TABLE IF EXISTS `sms_gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_gateway` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `GatewayTypeId` int(10) unsigned DEFAULT NULL,
  `APIUserName` varchar(100) DEFAULT NULL,
  `APIPassword` varchar(100) DEFAULT NULL,
  `TwilioNumber` varchar(30) DEFAULT NULL,
  `SenderName` varchar(30) DEFAULT NULL,
  `PostUrl` varchar(100) DEFAULT NULL,
  `ApiId` varchar(255) DEFAULT NULL,
  `SourceAddress` varchar(30) DEFAULT NULL,
  `TotalAttemptsToSendSMS` tinyint(1) DEFAULT NULL,
  `SMSTemplate` varchar(300) DEFAULT NULL,
  `ValidityInterval` int(10) DEFAULT NULL,
  `ValidityUnit` tinyint(1) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `CurrentBalance` int(50) unsigned DEFAULT NULL,
  `Route` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_gateway`
--

LOCK TABLES `sms_gateway` WRITE;
/*!40000 ALTER TABLE `sms_gateway` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_gateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_gatewaytype`
--

DROP TABLE IF EXISTS `sms_gatewaytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_gatewaytype` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `GatewayName` varchar(40) DEFAULT NULL,
  `GatewayUrl` varchar(256) DEFAULT NULL,
  `SMSBalanceURL` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_gatewaytype`
--

LOCK TABLES `sms_gatewaytype` WRITE;
/*!40000 ALTER TABLE `sms_gatewaytype` DISABLE KEYS */;
INSERT INTO `sms_gatewaytype` VALUES (1,'Gupshup Enterprise','http://enterprise.smsgupshup.com/GatewayAPI/rest?','http://enterprise.smsgupshup.com/apps/apis/accInfo?'),(2,'SMSGatewayHub Version 2','https://www.smsgatewayhub.com/api/mt/SendSMS?','http://www.smsgatewayhub.com/api/mt/GetBalance?'),(3,'My SMS Mantra','http://bulksms.mysmsmantra.com:8080/WebSMS/SMSAPI.jsp?','http://bulksms.mysmsmantra.com:8080/WebSMS/balance.jsp?'),(4,'Clickatell','http://api.clickatell.com/http/sendmsg?','https://platform.clickatell.com/public-client/balance'),(5,'Twilio',NULL,NULL),(6,'UtopiaGroup','http://newsms.utopiagroup.in/api/sendhttp.php?','http://newsms.utopiagroup.in/api/balance.php?'),(7,'MSDP','http://msdgweb.mgov.gov.in/esms/sendsmsrequest?',NULL),(8,'SMS Country','https://api.smscountry.com/SMSCwebservice_bulk.aspx?','http://api.smscountry.com/SMSCwebservice_User_GetBal.asp?'),(9,'SMSWave','http://www.smswave.in/panel/sendsms.php?',''),(10,'Text Nation','http://textnation.textnation.in/api/v3/index.php?',''),(11,'BulkSMSCochin','http://bulksmscochin.com/sendsms?',''),(12,'SMSProdigy','http://smsprodigy.in/Developer/api/SendSms/SingleSMS?',''),(13,'Bulk SMS','https://cpsolutions.dialog.lk/index.php/cbs/sms/send?',''),(14,'Weereach','https://api.weereach.com/sms/v1/send?',''),(15,'M2MTech','http://bulksms.m2mbd.net/smsapi?',''),(16,'DNSTEL','http://primarysmsapi.dnstel.com/api/v3/sendsms/plain',''),(18,'SMSGatewayHub Version 1','http://login.smsgatewayhub.com/smsapi/pushsms.aspx?','https://api.smsgatewayhub.com/smsapi/CheckBalance.aspx?'),(19,'Variform','https://alerts.variforrm.in/api/v2/sms/send?','https://alerts.variforrm.in/api/v2/account/balance?'),(20,'Isocel','http://41.222.192.6:8080/api/',NULL);
/*!40000 ALTER TABLE `sms_gatewaytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_template`
--

DROP TABLE IF EXISTS `sms_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_template` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `TemplateBody` text DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  `DateUpdated` datetime DEFAULT current_timestamp(),
  `CategoryId` int(10) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_template`
--

LOCK TABLES `sms_template` WRITE;
/*!40000 ALTER TABLE `sms_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snapshot_online_user`
--

DROP TABLE IF EXISTS `snapshot_online_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `snapshot_online_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `online` bigint(20) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locid` (`location_id`),
  KEY `fk_customerid` (`customer_id`),
  CONSTRAINT `fk_customerid` FOREIGN KEY (`customer_id`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_locid` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `snapshot_online_user`
--

LOCK TABLES `snapshot_online_user` WRITE;
/*!40000 ALTER TABLE `snapshot_online_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `snapshot_online_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_media_user_actions`
--

DROP TABLE IF EXISTS `social_media_user_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_media_user_actions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `LoginType` varchar(50) DEFAULT NULL,
  `UserAction` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `ModifiedOn` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_media_user_actions`
--

LOCK TABLES `social_media_user_actions` WRITE;
/*!40000 ALTER TABLE `social_media_user_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_media_user_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_gateway`
--

DROP TABLE IF EXISTS `subscription_gateway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_gateway` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `GatewayTypeId` int(10) unsigned DEFAULT NULL,
  `MerchantId` varchar(50) DEFAULT NULL,
  `PinCode` varchar(50) DEFAULT NULL,
  `TestMode` tinyint(1) DEFAULT NULL,
  `PaypalUserName` varchar(60) DEFAULT NULL,
  `CurrencyCode` varchar(10) DEFAULT NULL,
  `RedirectServerIp` varchar(100) DEFAULT NULL,
  `EncryptionKey` varchar(100) DEFAULT NULL,
  `IsEnabled` tinyint(1) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_gateway`
--

LOCK TABLES `subscription_gateway` WRITE;
/*!40000 ALTER TABLE `subscription_gateway` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_gateway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_information`
--

DROP TABLE IF EXISTS `subscription_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_information` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `PlanPrice` int(11) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `GracePeriodExpiryDate` datetime DEFAULT NULL,
  `GracePeriod` int(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `PlanType` varchar(20) DEFAULT NULL,
  `ActivePlanFlag` tinyint(1) DEFAULT NULL,
  `LastRechargeAddedDaysInCurrentPlan` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_information`
--

LOCK TABLES `subscription_information` WRITE;
/*!40000 ALTER TABLE `subscription_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_information_temp`
--

DROP TABLE IF EXISTS `subscription_information_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_information_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `PlanName` varchar(50) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `ExpiryDate` datetime DEFAULT NULL,
  `GracePeriodExpiryDate` datetime DEFAULT NULL,
  `GracePeriod` int(10) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `PlanType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_information_temp`
--

LOCK TABLES `subscription_information_temp` WRITE;
/*!40000 ALTER TABLE `subscription_information_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_information_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_payment_gateway_temp`
--

DROP TABLE IF EXISTS `subscription_payment_gateway_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_payment_gateway_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `PlanName` varchar(50) DEFAULT NULL,
  `PlanPrice` varchar(50) DEFAULT NULL,
  `PlanStartDate` datetime DEFAULT NULL,
  `PlanExpiryDate` datetime DEFAULT NULL,
  `GracePeriodExpiryDate` datetime DEFAULT NULL,
  `GracePeriod` int(10) DEFAULT NULL,
  `LastRechargeDaysRemains` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `InvoiceNumber` varchar(100) DEFAULT NULL,
  `PaymentGatewayTypeId` int(10) DEFAULT NULL,
  `PaymentGatewayName` varchar(50) DEFAULT NULL,
  `PaymentGatewayCurrencyCode` varchar(50) DEFAULT NULL,
  `PlanType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_payment_gateway_temp`
--

LOCK TABLES `subscription_payment_gateway_temp` WRITE;
/*!40000 ALTER TABLE `subscription_payment_gateway_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_payment_gateway_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_payment_gateway_transaction`
--

DROP TABLE IF EXISTS `subscription_payment_gateway_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_payment_gateway_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `PlanId` int(10) DEFAULT NULL,
  `PlanName` varchar(50) DEFAULT NULL,
  `PlanPrice` varchar(50) DEFAULT NULL,
  `PlanStartDate` datetime DEFAULT NULL,
  `PlanExpiryDate` datetime DEFAULT NULL,
  `GracePeriodExpiryDate` datetime DEFAULT NULL,
  `GracePeriod` int(10) DEFAULT NULL,
  `LastRechargeDaysRemains` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `InvoiceNumber` varchar(100) DEFAULT NULL,
  `PaymentGatewayTypeId` int(10) DEFAULT NULL,
  `PaymentGatewayName` varchar(50) DEFAULT NULL,
  `PaymentGatewayCurrencyCode` varchar(50) DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `TransactionStatus` varchar(50) DEFAULT NULL,
  `TransactionReturnCode` varchar(50) DEFAULT NULL,
  `TransactionReturnMessage` varchar(100) DEFAULT NULL,
  `TransactionAmount` varchar(50) NOT NULL DEFAULT '0',
  `TransactionDate` datetime DEFAULT NULL,
  `PlanType` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_payment_gateway_transaction`
--

LOCK TABLES `subscription_payment_gateway_transaction` WRITE;
/*!40000 ALTER TABLE `subscription_payment_gateway_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription_payment_gateway_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_campaign`
--

DROP TABLE IF EXISTS `survey_campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CampaignName` varchar(100) DEFAULT NULL,
  `StartDate` datetime DEFAULT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Active` tinyint(1) DEFAULT NULL,
  `EnableAllLocation` tinyint(1) DEFAULT NULL,
  `DisplayHours` varchar(24) DEFAULT NULL,
  `DisplayDays` varchar(7) DEFAULT NULL,
  `CustomerId` int(4) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_campaign`
--

LOCK TABLES `survey_campaign` WRITE;
/*!40000 ALTER TABLE `survey_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_campaign_location`
--

DROP TABLE IF EXISTS `survey_campaign_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_campaign_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LocationId` int(5) DEFAULT NULL,
  `CampaignId` int(5) DEFAULT NULL,
  `CustomerId` int(4) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `CampaignId` (`CampaignId`),
  CONSTRAINT `survey_campaign_location_ibfk_1` FOREIGN KEY (`CampaignId`) REFERENCES `survey_campaign` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_campaign_location`
--

LOCK TABLES `survey_campaign_location` WRITE;
/*!40000 ALTER TABLE `survey_campaign_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_campaign_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_campaign_surveygroup`
--

DROP TABLE IF EXISTS `survey_campaign_surveygroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_campaign_surveygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SurveyId` int(5) DEFAULT NULL,
  `CampaignId` int(5) DEFAULT NULL,
  `CustomerId` int(5) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `CampaignId` (`CampaignId`),
  CONSTRAINT `survey_campaign_surveygroup_ibfk_1` FOREIGN KEY (`CampaignId`) REFERENCES `survey_campaign` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_campaign_surveygroup`
--

LOCK TABLES `survey_campaign_surveygroup` WRITE;
/*!40000 ALTER TABLE `survey_campaign_surveygroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_campaign_surveygroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_category`
--

DROP TABLE IF EXISTS `survey_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `CustomerId` int(4) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_category`
--

LOCK TABLES `survey_category` WRITE;
/*!40000 ALTER TABLE `survey_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_group`
--

DROP TABLE IF EXISTS `survey_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SurveyName` varchar(100) DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT NULL,
  `CategoryId` int(5) DEFAULT NULL,
  `CustomerId` int(5) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IsRepeatableNetwork` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_group`
--

LOCK TABLES `survey_group` WRITE;
/*!40000 ALTER TABLE `survey_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_group_question_mapping`
--

DROP TABLE IF EXISTS `survey_group_question_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_group_question_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SurveyId` int(5) DEFAULT NULL,
  `QuestionId` int(5) DEFAULT NULL,
  `CustomerId` int(5) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `QuestionId` (`QuestionId`),
  KEY `SurveyId` (`SurveyId`),
  CONSTRAINT `survey_group_question_mapping_ibfk_1` FOREIGN KEY (`QuestionId`) REFERENCES `survey_questionnaire` (`id`) ON DELETE CASCADE,
  CONSTRAINT `survey_group_question_mapping_ibfk_2` FOREIGN KEY (`SurveyId`) REFERENCES `survey_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_group_question_mapping`
--

LOCK TABLES `survey_group_question_mapping` WRITE;
/*!40000 ALTER TABLE `survey_group_question_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_group_question_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_option`
--

DROP TABLE IF EXISTS `survey_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(4) NOT NULL,
  `Options` varchar(400) DEFAULT NULL,
  `CustomerId` int(4) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `qid` (`qid`),
  CONSTRAINT `survey_option_ibfk_1` FOREIGN KEY (`qid`) REFERENCES `survey_questionnaire` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_option`
--

LOCK TABLES `survey_option` WRITE;
/*!40000 ALTER TABLE `survey_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_question_answer`
--

DROP TABLE IF EXISTS `survey_question_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_question_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserMac` varchar(30) DEFAULT NULL,
  `UserName` varchar(100) DEFAULT NULL,
  `CampaignId` int(5) DEFAULT NULL,
  `SurveyId` int(5) DEFAULT NULL,
  `QuestionId` int(5) DEFAULT NULL,
  `Option` varchar(500) DEFAULT NULL,
  `CustomerId` int(5) DEFAULT NULL,
  `LocationId` int(5) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IsSkip` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_question_answer`
--

LOCK TABLES `survey_question_answer` WRITE;
/*!40000 ALTER TABLE `survey_question_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_question_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_questionnaire`
--

DROP TABLE IF EXISTS `survey_questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `CategoryId` int(5) DEFAULT NULL,
  `Question` varchar(300) DEFAULT NULL,
  `OptionType` varchar(20) DEFAULT NULL,
  `CustomerId` int(4) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_questionnaire`
--

LOCK TABLES `survey_questionnaire` WRITE;
/*!40000 ALTER TABLE `survey_questionnaire` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_sms_link`
--

DROP TABLE IF EXISTS `temp_sms_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_sms_link` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `OrderId` varchar(50) DEFAULT NULL,
  `GatewayName` varchar(50) DEFAULT NULL,
  `PaymentLink` text DEFAULT NULL,
  `IsUsed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_sms_link`
--

LOCK TABLES `temp_sms_link` WRITE;
/*!40000 ALTER TABLE `temp_sms_link` DISABLE KEYS */;
INSERT INTO `temp_sms_link` VALUES (1,'MyWifiPayU10122309',NULL,'https://secure.payu.in/_payment?&phone=9581581600&key=FFbdll&txnid=MyWifiPayU10122309&amount=5&productinfo=5rs&firstname=Dcr&email=Abc@gmail.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=206510c911f9903695b4c7444a47e0e34ecb67e77b56d2eb4884146903f43bdf12b6f2bb05efda192a4b447723961062031d08825696f6b88e9e17342f799f36&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',0),(2,'MyWifiPayU10123450',NULL,'https://secure.payu.in/_payment?&phone=8087444563&key=FFbdll&txnid=MyWifiPayU10123450&amount=5&productinfo=5rs&firstname=Varad&email=abcd@pqrs.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=ab19d2d9487656b76701336761ad9d1f3e2637438cfec875cd468e269a186434526d769a244b0c15600848ef21f642a4079acbfb5aee281a9be6a8f0c0952b1c&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',0),(3,'MyWifiPayU10123732',NULL,'https://secure.payu.in/_payment?&phone=8087764361&key=FFbdll&txnid=MyWifiPayU10123732&amount=5&productinfo=5rs&firstname=ashhhuu&email=abcd@adsd.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=e5aae5ae1dd036f9a1bd66800df547a647cceb7e35fb813103d76ce879e008f8340cbbe0df31022c1cd954b2c7dde8d090f578119a59e5abcc00c3a60299fc2c&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',1),(4,'MyWifiPayU10124928',NULL,'https://secure.payu.in/_payment?&phone=8087444563&key=FFbdll&txnid=MyWifiPayU10124928&amount=5&productinfo=5rs&firstname=Varad&email=abcd@pqrs.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=2bab02cd31e4d5767dc71ccd68dc33884bbe4b3fa7bd2df5015a641465f62a1d9737fdae9d1106cec1b7e6444b56d9828dcc32df7b8960deb5607865041c4269&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',0),(5,'MyWifiPayU10124942',NULL,'https://secure.payu.in/_payment?&phone=8087444563&key=FFbdll&txnid=MyWifiPayU10124942&amount=5&productinfo=5rs&firstname=Varad&email=abcd@pqrs.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=9f10b5cd1c33c031ad89177fbd626347b4298b9baf2845a2eeb35626ff459ba5b2493337fd7417d7c1e937f145adf23007ef80612df8693df7bf589761d33252&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',0),(6,'MyWifiPayU10125323',NULL,'https://secure.payu.in/_payment?&phone=7020828335&key=FFbdll&txnid=MyWifiPayU10125323&amount=5&productinfo=5rs&firstname=Hello&email=abcd@1234.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=e79f158e70382b18cbd63d6568be5d7b2bd24955b7348cc03643762c6b80445d55158957f055e90a14bd45eea691475330d0084ab0f38b3521efd11ef8574801&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',1),(7,'MyWifiPayU10010737',NULL,'https://secure.payu.in/_payment?&phone=7020828335&key=FFbdll&txnid=MyWifiPayU10010737&amount=5&productinfo=5rs&firstname=Hello&email=abcd@1234.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=581614459f6c49c99c80365bcf7d775262f691bba877fab81f416e1fe82ab4fc5665ca90e29e3927345df65ab1a28b25d0a92d761d67f129fb2954475527b5ba&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',0),(8,'MyWifiPayU10011043',NULL,'https://secure.payu.in/_payment?&phone=8087444563&key=FFbdll&txnid=MyWifiPayU10011043&amount=5&productinfo=5rs&firstname=Hello&email=abcd@1234.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=017b225e4bae4f1c51832a6fc99a6519e4b41d5ebe9dd1350da5f9504a29a431d5454059737cb4ed5f438e2a25644f612037bb1738aa4e5e1104ce60b4ac7594&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',0),(9,'MyWifiPayU10012138',NULL,'https://secure.payu.in/_payment?&phone=9765918841&key=FFbdll&txnid=MyWifiPayU10012138&amount=5&productinfo=5rs&firstname=Hello&email=abcd@1234.com&surl=https://wios.wifi-soft.com//api/postpayumoney.php&furl=https://portal.wios.wifi-soft.com/portal/default/signup_type3.php&hash=f6e699c2011c839cef4409914ba9681b368d6b652d297a569cda176350a7cfff5a3fcc825f42fbe591620d1d5c6456ea49dcae9f179435d71136aa21e9345f49&req_sendsmslink=1&realm=Routers&service_provider=payu_paisa&',0),(10,'201039105883',NULL,'c=4&l=595&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=595&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=201039105883&req_restrictlocation=0&req_planid=180&req_firstname=Bob&req_email=Abcd@pqrs.com&req_cellphone=8087444563&req_username=test111@wifisoftoffice&req_password=1111&req_repassword=1111&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=3&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(11,'201039532796',NULL,'c=4&l=595&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=595&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=201039532796&req_restrictlocation=0&req_planid=180&req_firstname=Varad Chiney&req_email=cvarad96@gmail.com&req_cellphone=7020828335&req_username=Varadc10@wifisoftoffice&req_password=1234&req_repassword=1234&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=3&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(12,'201049554663',NULL,'c=4&l=595&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=595&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=201049554663&req_restrictlocation=0&req_planid=180&req_firstname=Varad&req_email=cvarad96@gmail.com&req_cellphone=8087444563&req_username=cvarad777@wifisoftoffice&req_password=1111&req_repassword=1111&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',1),(13,'201053295052',NULL,'c=4&l=595&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=595&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=201053295052&req_restrictlocation=0&req_planid=180&req_firstname=Varad&req_email=cvarad96@gmail.com&req_cellphone=8087444563&req_username=cvarad778@wifisoftoffice&req_password=1111&req_repassword=1111&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',1),(14,'201058189082',NULL,'c=4&l=595&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=595&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=201058189082&req_restrictlocation=0&req_planid=180&req_firstname=Varad Chiney&req_email=cvarad96@gmail.com&req_cellphone=8087444563&req_username=cvarad20@wifisoftoffice&req_password=1111&req_repassword=1111&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(15,'201100487690',NULL,'c=4&l=595&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=595&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=201100487690&req_restrictlocation=0&req_planid=180&req_firstname=Varad&req_email=cvarad96@gmail.com&req_cellphone=8087444563&req_username=cvarad999@wifisoftoffice&req_password=1111&req_repassword=1111&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',1),(16,'210749468121',NULL,'c=4&l=595&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=595&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=210749468121&req_restrictlocation=0&req_planid=180&req_email=cvarad@gmail.com&req_homephone=8087444563&req_cellphone=8087444563&req_username=abcdpqrs@wifisoftoffice&req_password=1234&req_repassword=1234&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(17,'21075322253',NULL,'c=4&l=595&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=595&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=21075322253&req_restrictlocation=0&req_planid=180&req_email=varad.chiney@indionetworks.com&req_homephone=7020828335&req_cellphone=7020828335&req_username=abcdpppp@wifisoftoffice&req_password=1111&req_repassword=1111&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(18,'210854252212',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=210854252212&req_restrictlocation=0&req_planid=249&req_firstname=Varad&req_lastname=Chiney&req_email=cvarad96@gmail.com&req_cellphone=8087444563&req_username=varadindio@psndigital&req_password=1111&req_repassword=1111&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(19,'210858244628',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=210858244628&req_restrictlocation=0&req_planid=249&req_firstname=Varad&req_lastname=Chiney&req_email=varad.chiney@indionetworks.com&req_cellphone=8087444563&req_username=cvarad11@psndigital&req_password=1111&req_repassword=1111&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(20,'210946299269',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=210946299269&req_restrictlocation=0&req_planid=252&req_firstname=Pravin&req_lastname=M&req_email=pravin@indionetwork.com&req_cellphone=8446713187&req_username=pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(21,'211004599929',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211004599929&req_restrictlocation=0&req_planid=252&req_firstname=Pravin&req_lastname=More&req_email=Pravin@indio.com&req_cellphone=8446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(22,'211008151943',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211008151943&req_restrictlocation=0&req_planid=252&req_firstname=Pravin&req_lastname=More&req_email=Pravin@indio.com&req_cellphone=8446713188&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(23,'211200028771',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211200028771&req_restrictlocation=0&req_planid=252&req_firstname=Pravin&req_lastname=More&req_email=Pravin@indio.com&req_cellphone=8446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(24,'211205004150',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211205004150&req_restrictlocation=0&req_planid=251&req_firstname=Pravin&req_lastname=More&req_email=pravin@indio.com&req_cellphone=08446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(25,'211208253005',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211208253005&req_restrictlocation=0&req_planid=249&req_firstname=Soh&req_lastname=Ahm&req_email=sohail@indionetworks.com&req_cellphone=9975789575&req_username=sohail123@psndigital&req_password=sohail123&req_repassword=sohail123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(26,'2112124894',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=2112124894&req_restrictlocation=0&req_planid=249&req_firstname=P:ravin&req_lastname=More&req_email=pravin@indio.com&req_cellphone=84446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(27,'211212516861',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211212516861&req_restrictlocation=0&req_planid=249&req_firstname=Sohail&req_lastname=Ahmad&req_email=sohail_alig@yahoo.com&req_cellphone=09975789574&req_username=sohail123@psndigital&req_password=sohail123&req_repassword=sohail123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(28,'211216529430',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211216529430&req_restrictlocation=0&req_planid=249&req_firstname=Pravin&req_lastname=More&req_email=pravin@indio.com&req_cellphone=8446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(29,'21122108435',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=21122108435&req_restrictlocation=0&req_planid=249&req_firstname=Pravin&req_lastname=More&req_email=Pravin@indio.com&req_cellphone=8446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(30,'21124403883',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=21124403883&req_restrictlocation=0&req_planid=249&req_firstname=Pravin&req_lastname=More&req_email=pravin@indio.com&req_cellphone=8446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(31,'211246308770',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211246308770&req_restrictlocation=0&req_planid=249&req_firstname=Pravin&req_lastname=More&req_email=pravin@indio.com&req_cellphone=8446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(32,'211251175733',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211251175733&req_restrictlocation=0&req_planid=250&req_firstname=Dk&req_lastname=Test&req_email=dhanashrikolapkar6@gmail.com&req_cellphone=919765918841&req_username=Dk123@psndigital&req_password=123123&req_repassword=123123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(33,'21125642635',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=21125642635&req_restrictlocation=0&req_planid=249&req_firstname=Prashant&req_lastname=K&req_email=prashant@indionetworks.com&req_cellphone=8530700148&req_username=Prashant123@psndigital&req_password=123prashant&req_repassword=123prashant&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(34,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(35,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(36,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(37,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(38,'220705449119',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=220705449119&req_restrictlocation=0&req_firstname=Psn&req_lastname=Network&req_email=Peter.psn18@Gmail.Com&req_cellphone=8888763055&req_username=12345678@psndigital&req_password=12345678&req_repassword=12345678&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(39,'220715159781',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=220715159781&req_restrictlocation=0&req_firstname=Psn&req_lastname=Digital&req_email=Peter.psn18@gmail.com&req_cellphone=8888763055&req_username=1234@psndigital&req_password=1234&req_repassword=1234&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(40,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(41,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=249&req_username=oliveirawilson1995@psndigital&req_password=New@123&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7218717782&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(42,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=249&req_username=oliveirawilson1995@psndigital&req_password=New@123&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7218717782&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(43,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(44,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=249&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(45,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(46,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(47,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(48,'220957546595',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=220957546595&req_restrictlocation=0&req_planid=249&req_firstname=psn&req_lastname=digital&req_email=peter.psn18@gmail.com&req_cellphone=9604592620&req_username=psn@psndigital&req_password=1234&req_repassword=1234&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(49,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(50,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(51,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(52,'230728265949',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=230728265949&req_restrictlocation=0&req_planid=252&req_firstname=Psn&req_lastname=Digital&req_email=Peter.psn18@gmail.com&req_cellphone=8888673055&req_username=PSN@psndigital&req_password=123&',0),(53,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(54,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(55,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(56,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(57,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(58,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(59,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(60,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(61,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(62,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(63,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(64,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(65,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(66,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(67,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(68,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(69,'250711053756',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250711053756&req_restrictlocation=0&req_planid=253&req_firstname=Peterstar&req_lastname=Communication&req_email=peter.psn18@gmail.com&req_cellphone=8888673055&req_username=peterstar@psndigital&req_password=12345678&req_repassword=12345678&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(70,'250718171888',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250718171888&req_restrictlocation=0&req_planid=254&req_firstname=&req_lastname=&req_email=&req_cellphone=&req_username=peterstar@psndigital&req_password=12345678&req_repassword=&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(71,'250719287485',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250719287485&req_restrictlocation=0&req_planid=254&req_firstname=psn&req_lastname=digital&req_email=peter.psn18@gmail.com&req_cellphone=8888673055&req_username=psn@psndigital&req_password=12345678&req_repassword=12345678&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(72,'250721135322',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250721135322&req_restrictlocation=0&req_firstname=Domingos&req_lastname=Rodrigues&req_email=peter.psn18@gmail.com&req_cellphone=8888673055&req_username=psndigital@psndigital&req_password=start@123&req_repassword=&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(73,'250721133760',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250721133760&req_restrictlocation=0&req_planid=254&req_firstname=PEter&req_lastname=D souza&req_email=peterco999@yahoo.co.in&req_cellphone=7385603055&req_username=Psn@psndigital&req_password=123@123&req_repassword=123@123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(74,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(75,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(76,'270730302981',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=270730302981&req_restrictlocation=0&req_firstname=Kavita&req_lastname=Nhavi&req_email=kavitanhavi@gmail.com&req_cellphone=91 74980 34362&req_username=Kavita nhavi@psndigital&req_password=Qwerty&req_repassword=Qwerty&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(77,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(78,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(79,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(80,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(81,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(82,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(83,'271228559403',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=271228559403&req_restrictlocation=0&req_planid=254&req_firstname=Joe&req_lastname=Birges&req_email=joeborges07@gmail.com&req_cellphone=7083072637&req_username=Joeorges@psndigital&req_password=12345678&req_repassword=12345678&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(84,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(85,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(86,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(87,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(88,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(89,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(90,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(91,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(92,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(93,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(94,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(95,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(96,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(97,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(98,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(99,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(100,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(101,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(102,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(103,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(104,'280941112977',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=280941112977&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_cellphone=&req_city=Pune&req_state=CA&req_username=varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(105,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(106,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(107,'281005341057',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281005341057&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_state=AR&req_username=varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(108,'281008042269',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281008042269&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_state=AR&req_username=varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(109,'281017039943',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281017039943&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_state=AR&req_username=varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(110,'281018376139',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281018376139&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8097444563&req_cellphone=&req_city=Pune&req_state=AS&req_username=varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(111,'28102159985',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=28102159985&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_state=AZ&req_username=varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(112,'281038227564',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281038227564&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_state=CO&req_username=varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(113,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(114,'281053331262',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281053331262&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_username=Varad@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(115,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(116,'2811250398',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=2811250398&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_username=varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(117,'281128061316',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281128061316&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_username=Varad@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(118,'281127431880',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281127431880&req_restrictlocation=0&req_planid=255&req_firstname=Prashant&req_lastname=Koli&req_email=&req_homephone=7410040043&req_cellphone=&req_city=pune&req_username=prashant@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(119,'281131191647',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281131191647&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_username=varadc@Gonet&req_password=1234&req_repassword=1234&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(120,'281139028092',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281139028092&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8888888888&req_cellphone=&req_city=Pune&req_username=Varad@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(121,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(122,'281144067930',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281144067930&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8888888888&req_cellphone=&req_city=Pune&req_username=Varadc@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(123,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(124,'281205392712',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=281205392712&req_restrictlocation=0&req_planid=255&req_firstname=Varad&req_lastname=Chiney&req_email=&req_homephone=8087444563&req_cellphone=&req_city=Pune&req_username=Varad@Gonet&req_password=1111&req_repassword=1111&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(125,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(126,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(127,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(128,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(129,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(130,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(131,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(132,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(133,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(134,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(135,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(136,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(137,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(138,'290906492007',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=290906492007&req_restrictlocation=0&req_planid=249&req_firstname=Pravin&req_lastname=More&req_email=pravin.more@indionetworks.com&req_cellphone=8446713187&req_username=pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(139,'290909438865',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=290909438865&req_restrictlocation=0&req_planid=249&req_firstname=Pravin&req_lastname=More&req_email=pravin.more@indionetwrks.com&req_cellphone=8446713187&req_username=pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(140,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(141,'291054303391',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=291054303391&req_restrictlocation=0&req_planid=249&req_firstname=Pravin&req_lastname=More&req_email=pravin@indio.com&req_cellphone=8446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(142,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(143,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(144,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(145,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(146,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(147,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(148,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(149,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=249&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(150,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=254&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(151,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(152,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=254&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(153,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(154,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(155,'300451027068',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=300451027068&req_restrictlocation=0&req_planid=251&req_firstname=Fatima&req_lastname=Fernandes&req_email=Fatimafernandes@gmail.com&req_cellphone=9764260495&req_username=Fatimafernandes @psndigital&req_password=1234567890&req_repassword=1234567890&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(156,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(157,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(158,'021122232427',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=021122232427&req_restrictlocation=0&req_firstname=psn&req_lastname=digital&req_email=peter.psn18@gmail.com&req_cellphone=8888673055&req_username=psndigital@psndigital&req_password=1234&req_repassword=1234&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(159,'030610209501',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=030610209501&req_restrictlocation=0&req_planid=254&req_firstname=veronica&req_lastname=fernandes&req_email=&req_cellphone=9604592620&req_username=&req_password=&req_repassword=&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(160,'030518007222',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=030518007222&req_restrictlocation=0&req_firstname=Satish&req_lastname=Muneshwar&req_email=&req_homephone=8379825724&req_cellphone=&req_city=Amgaon&req_username=Satish@Gonet&req_password=satish1122&req_repassword=satish1122&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(161,'040536314610',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=040536314610&req_restrictlocation=0&req_firstname=Pranav&req_lastname=Meshram&req_email=&req_homephone=9922333559&req_cellphone=&req_city=Amgaon&req_username=Pranav@Gonet&req_password=Doshable!1&req_repassword=Doshable!1&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(162,'040538526595',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=040538526595&req_restrictlocation=0&req_planid=255&req_firstname=Mayur&req_lastname=Bindal&req_email=&req_homephone=917389426644&req_cellphone=&req_city=Dongargarh&req_username=mmbindal.234@Gonet&req_password=7389426644&req_repassword=7389426644&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(163,'040540319899',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=040540319899&req_restrictlocation=0&req_planid=255&req_firstname=Rakesh&req_lastname=Meshram&req_email=&req_homephone=9765325523&req_cellphone=&req_city=Deori&req_username=Rakesh@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(164,'040542443169',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=040542443169&req_restrictlocation=0&req_planid=255&req_firstname=Rakesh&req_lastname=Meshram&req_email=&req_homephone=9765325523&req_cellphone=&req_city=Deori&req_username=Rakesh@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(165,'04062343481',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=04062343481&req_restrictlocation=0&req_firstname=Pranav&req_lastname=Meshram&req_email=&req_homephone=9922333559&req_cellphone=&req_city=Amgaon&req_username=pranav@Gonet&req_password=pranav&req_repassword=pranav&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(166,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(167,'050826569677',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=050826569677&req_restrictlocation=0&req_planid=252&req_firstname=julietta&req_lastname=moniz&req_email=&req_cellphone=9604592620&req_username=julietta@psndigital&req_password=flower&req_repassword=flower&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(168,'080120112362',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=080120112362&req_restrictlocation=0&req_planid=254&req_firstname=julietta&req_lastname=moniz&req_email=&req_cellphone=9604592620&req_username=&req_password=&req_repassword=&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(169,'100139176765',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=100139176765&req_restrictlocation=0&req_planid=250&req_firstname=Cashel&req_lastname=Duarte&req_email=cashelduarte@gmail.com&req_cellphone=7517429359&req_username=Cashelduarte@psndigital&req_password=admin123&req_repassword=admin123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(170,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=cashelduarte@psndigital&req_password=admin123&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=75174293&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(171,'100144139751',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=100144139751&req_restrictlocation=0&req_planid=250&req_firstname=Cashel&req_lastname=Duarte&req_email=cashelduarte@gmail.com&req_cellphone=7517429359&req_username=Cashel123@psndigital&req_password=admin123&req_repassword=admin123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(172,'10014716470',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=10014716470&req_restrictlocation=0&req_planid=254&req_firstname=Cashel&req_lastname=Duarte&req_email=cashelduarte@gmail.com&req_cellphone=7517429359&req_username=Cashel123@psndigital&req_password=admin&req_repassword=admin&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(173,'110541328274',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=110541328274&req_restrictlocation=0&req_planid=249&req_firstname=umesh&req_lastname=mane&req_email=umesh@gmail.com&req_cellphone=8600300801&req_username=umeshm@psndigital&req_password=umeshm&req_repassword=umeshm&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(174,'110559092928',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=110559092928&req_restrictlocation=0&req_planid=249&req_firstname=umeshm&req_lastname=mane&req_email=umesh@gmail.com&req_cellphone=860030080&req_username=umeshm@psndigital&req_password=mane7&req_repassword=mane7&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(175,'110712046680',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=110712046680&req_restrictlocation=0&req_planid=250&req_firstname=Rexon&req_lastname=Oliveira&req_email=Rexon oliveira 27@gmail.com&req_cellphone=7620697513&req_username=Rex27oliveira@psndigital&req_password=2716&req_repassword=2716&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(176,'111022283778',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=111022283778&req_restrictlocation=0&req_planid=249&req_firstname=Pravin&req_lastname=Pravin&req_email=Pravin@indio.com&req_cellphone=08446713187&req_username=Pravin@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(177,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(178,'110138066283',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=110138066283&req_restrictlocation=0&req_planid=250&req_firstname=PETER&req_lastname=D SOUZA&req_email=peterco999@yahoo.co.in&req_cellphone=7887933055&req_username=peterco999@psndigital&req_password=sfx3999&req_repassword=sfx3999&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(179,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(180,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=peterco999@psndigital&req_password=sfx3999&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7887933055&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(181,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429357&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(182,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(183,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(184,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(185,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(186,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(187,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429459&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(188,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(189,'121205038509',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=121205038509&req_restrictlocation=0&req_planid=250&req_firstname=Natty&req_lastname=Fernandes&req_email=fnatty27@yahoo.com&req_cellphone=9850540181&req_username=Fnatty@psndigital&req_password=admin123&req_repassword=admin123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(190,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(191,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(192,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(193,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(194,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(195,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(196,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(197,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(198,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(199,'140741185837',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=qcMBuJy7unTY lKug3RVHQ==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=140741185837&req_restrictlocation=0&req_planid=138&req_firstname=Piyush&req_email=piyushchopde.2014@gmail.com&req_cellphone=&req_username=Piyush@wifisoftoffice&req_password=Piyush@2111&req_repassword=Piyush@2111&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(200,'14074450681',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=14074450681&req_restrictlocation=0&req_planid=74&req_firstname=Dhanooo&req_email=dhanashrikolapkar6@gmail.com&req_cellphone=&req_username=Dhannoo@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(201,'',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&register=1&req_customercode=25517695&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=75&req_username=Dhannoo@wifisoftoffice&req_password=123123&req_repassword=&gtid=2&rechargeAcc=1&req_paymntGtType=13&req_cellphone=&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(202,'140929273548',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=140929273548&req_restrictlocation=0&req_planid=75&req_firstname=Dhani&req_email=Dhani@hdggd.in&req_cellphone=&req_username=Dhani@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(203,'141144266892',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141144266892&req_restrictlocation=0&req_planid=75&req_firstname=Shrutika&req_email=Shrutikahd@hdhhd.in&req_cellphone=&req_username=Shru@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(204,'141205102875',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141205102875&req_restrictlocation=0&req_firstname=Harita&req_email=Hfhhk@jgig.hich&req_cellphone=&req_username=Harita@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(205,'141210402987',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=/tV2Qtwkpf7fYWrN4f4R3g==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141210402987&req_restrictlocation=0&req_planid=75&req_firstname=Aditya&req_email=jagtapaditya886@gmail.com&req_cellphone=&req_username=Aditya@wifisoftoffice&req_password=12345677&req_repassword=12345677&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',1),(206,'',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&register=1&req_customercode=25517695&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=75&req_username=Aditya@wifisoftoffice&req_password=12345677&req_repassword=&gtid=2&rechargeAcc=1&req_paymntGtType=13&req_cellphone=&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(207,'141221147506',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141221147506&req_restrictlocation=0&req_planid=75&req_firstname=Gshsh&req_email=Hshhs@hdhhd.ij&req_cellphone=&req_username=Shri@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(208,'141223165231',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141223165231&req_restrictlocation=0&req_planid=75&req_firstname=Hshjjd&req_email=Hdhhhdh@hdhjd.jdh&req_cellphone=&req_username=Hari@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(209,'141225485616',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141225485616&req_restrictlocation=0&req_planid=75&req_firstname=Hfsguut&req_email=Hshhs@hdhhd.ij&req_cellphone=&req_username=Shruti@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(210,'141232369428',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141232369428&req_restrictlocation=0&req_planid=75&req_firstname=Jgiyxoyoy&req_email=Hdhhhdh@hdhjd.jdh&req_cellphone=&req_username=Riya@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(211,'141239133043',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=GBmGtwcMcQ0HlBqNwdL0MQ==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141239133043&req_restrictlocation=0&req_planid=75&req_firstname=Ankush&req_email=adijagtap1112@gmail.com&req_cellphone=&req_username=Ankush@wifisoftoffice&req_password=123123123&req_repassword=123123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',1),(212,'141245159994',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=HQ1wbdHs4v4MgSTWz2aX6Q==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=141245159994&req_restrictlocation=0&req_planid=75&req_firstname=Jfzugiy&req_email=Hfhhk@jgig.hich&req_cellphone=&req_username=Shreee@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(213,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(214,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(215,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(216,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(217,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(218,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(219,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(220,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(221,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(222,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(223,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(224,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(225,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(226,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(227,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(228,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(229,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(230,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(231,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(232,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(233,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(234,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(235,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(236,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(237,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(238,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=249&req_username=Fatima@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=9764260495&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(239,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(240,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(241,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(242,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(243,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(244,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(245,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(246,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(247,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(248,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(249,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(250,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(251,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(252,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(253,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(254,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(255,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=252&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(256,'180411579931',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=180411579931&req_restrictlocation=0&req_planid=252&req_firstname=Sylvester&req_lastname=Coutinho&req_email=sylysgoa@gmail.com&req_cellphone=9765056005&req_username=Susegad County @psndigital&req_password=sydelle123&req_repassword=sydelle123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(257,'180902322912',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=180902322912&req_restrictlocation=0&req_planid=251&req_firstname=Rahul&req_lastname=Juvekar&req_email=Rahul13mec16@gmail.com&req_cellphone=9011420588&req_username=RJ1234@psndigital&req_password=qwerty2468&req_repassword=qwerty2468&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(258,'18091437919',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=18091437919&req_restrictlocation=0&req_planid=251&req_firstname=rahul&req_lastname=juvekar&req_email=rahul13mec16@gmail.com&req_cellphone=9011420588&req_username=RJ18@psndigital&req_password=qwerty2468&req_repassword=qwerty2468&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=0&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(259,'18093237976',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=18093237976&req_restrictlocation=0&req_planid=251&req_firstname=Rahul&req_lastname=Juvekar&req_email=Rahul13mec16@gmail.com&req_cellphone=9011420588&req_username=RJ18@psndigital&req_password=qwerty2468&req_repassword=qwerty2468&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(260,'181109011152',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=181109011152&req_restrictlocation=0&req_planid=252&req_firstname=Peter&req_lastname=D souza&req_email=peterco999@yahoo.co.in&req_cellphone=788 793 3055&req_username=peterco999@psndigital&req_password=sfx3@999&req_repassword=sfx3@999&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(261,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=RJ18@psndigital&req_password=qwerty2468&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=9011420588&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(262,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(263,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(264,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=RJ18@psndigital&req_password=qwerty2468&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=9011420588&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(265,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567899&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(266,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(267,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(268,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarye @psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(269,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(270,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429358&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(271,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7618429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(272,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7518429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(273,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(274,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(275,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(276,'190258284690',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=190258284690&req_restrictlocation=0&req_planid=250&req_firstname=Peter&req_lastname=D souza&req_email=peterco999@yahoo.co.in&req_cellphone=785603055&req_username=Peterco@psndigital&req_password=sfx3&req_repassword=sfx3&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(277,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(278,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(279,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(280,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(281,'210757234814',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=210757234814&req_restrictlocation=0&req_planid=298&req_firstname=sumeet&req_lastname=hannurkar&req_email=Sumeethannurkar39@gmail.com&req_cellphone=8495073002&req_username=Sumeet @psndigital&req_password=123456789&req_repassword=123456789&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(282,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=298&req_username=Sumeet @psndigital&req_password=123456789&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=8495073002&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(283,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=298&req_username=Sumit@psndigital&req_password=123456789&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=8495073002&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(284,'210801018011',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=210801018011&req_restrictlocation=0&req_planid=298&req_firstname=sumeet&req_lastname=hannurkar&req_email=Sumeethannurkar39@gmail.com&req_cellphone=8495073002&req_username=Sumit @psndigital&req_password=123456789&req_repassword=123456789&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(285,'210809348821',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=210809348821&req_restrictlocation=0&req_planid=298&req_firstname=Avadhut&req_lastname=Ghodake&req_email=avadhut.ghodake@indionetworks.com&req_cellphone=9535475473&req_username=avadhut@psndigital&req_password=123456789&req_repassword=123456789&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(286,'211134103509',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211134103509&req_restrictlocation=0&req_planid=249&req_firstname=sumeet&req_lastname=hannurkar&req_email=Sumeethannurkar39@gmail.com&req_cellphone=8495073002&req_username=&req_password=123456789&req_repassword=123456789&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(287,'211147481290',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211147481290&req_restrictlocation=0&req_firstname=Avadhut&req_lastname=G&req_email=avadhut.ghodake@indionetworks.com&req_cellphone=9535475473&req_username=Avadhut@psndigital&req_password=123456&req_repassword=123456&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(288,'211154353400',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=211154353400&req_restrictlocation=0&req_planid=251&req_firstname=Sumeet&req_lastname=Hannurkar&req_email=Sumeethannurkar39@gamil.com&req_cellphone=8495073002&req_username=Sumeet@psndigital&req_password=1234&req_repassword=1234&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(289,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=peterco999@psndigital&req_password=sfx3@999&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=788 793 3055&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(290,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=250&req_username=peterco999@psndigital&req_password=sfx3@999&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7887933055&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(291,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Cashelduarte@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7517429359&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(292,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Meldonsoares@psndigital&req_password=1243578900&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=8999873935&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(293,'230143549949',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=230143549949&req_restrictlocation=0&req_planid=250&req_firstname=FRENZIO&req_lastname=FERNANDES&req_email=frenziofernandes@gmail.com&req_cellphone=9029356777&req_username=Frenzy@psndigital&req_password=frenyonna&req_repassword=frenyonna&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(294,'240743155662',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=240743155662&req_restrictlocation=0&req_firstname=Francis&req_lastname=Dsouza&req_email=&req_cellphone=9604717844&req_username=Francis 63@psndigital&req_password=francis63&req_repassword=francis63&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(295,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=249&req_username=Sylvester Coutinho @psndigital&req_password=sydelle123&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=9765056005&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(296,'',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&register=1&req_customercode=33452322&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=251&req_username=Granxafernandes@psndigital&req_password=1234567890&req_repassword=&gtid=14&rechargeAcc=1&req_paymntGtType=6&req_cellphone=7499443259&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(297,'250610534917',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250610534917&req_restrictlocation=0&req_planid=249&req_firstname=Ghuran&req_lastname=Orna&req_email=&req_cellphone=9637124534&req_username=ghuran@psndigital&req_password=ghuran&req_repassword=ghuran&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(298,'250643048337',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250643048337&req_restrictlocation=0&req_planid=249&req_firstname=psn&req_lastname=digital&req_email=peter.psn18@gmail.com&req_cellphone=8888673055&req_username=psndigital@psndigital&req_password=start@123&req_repassword=start@123&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(299,'250646046064',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250646046064&req_restrictlocation=0&req_planid=249&req_firstname=Peter star&req_lastname=network&req_email=peter.psn18@gmail.com&req_cellphone=8888673055&req_username=psndigital@psndigital&req_password=12345678&req_repassword=12345678&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(300,'25080947744',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=25080947744&req_restrictlocation=0&req_firstname=Ajay&req_lastname=Jain&req_email=ajayjain046@gmail.com&req_cellphone=9284509755&req_username=Ajay1122@psndigital&req_password=28408ajay&req_repassword=28408ajay&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(301,'250927051253',NULL,'c=4&l=612&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=25517695&encmob=GbsfKyf7PBRpfeGss5VoqA==&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=612&realm=wifisoftoffice&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250927051253&req_restrictlocation=0&req_planid=224&req_firstname=test123&req_email=test@hfjdfh.com&req_cellphone=&req_username=test123123@wifisoftoffice&req_password=123123&req_repassword=123123&gtid=2&isSmsGatewayConfigured=1&req_paymntGtType=13&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(302,'250927153024',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250927153024&req_restrictlocation=0&req_planid=255&req_firstname=Rakesh&req_lastname=Meshram&req_email=&req_homephone=9765325523&req_cellphone=&req_city=Deori&req_username=gonet@Gonet&req_password=scartrtz&req_repassword=scartrtz&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(303,'250933343613',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250933343613&req_restrictlocation=0&req_planid=255&req_firstname=Rakesh&req_lastname=Meshram&req_email=&req_homephone=9765325523&req_cellphone=&req_city=Deori&req_username=rakesh@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(304,'250944413915',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250944413915&req_restrictlocation=0&req_planid=255&req_firstname=Abc&req_lastname=Abc&req_email=&req_homephone=9765325523&req_cellphone=&req_city=Deori&req_username=abc1@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(305,'250948242397',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250948242397&req_restrictlocation=0&req_planid=255&req_firstname=Aaa&req_lastname=Aaa&req_email=&req_homephone=9765325523&req_cellphone=&req_city=Deori&req_username=Abc@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(306,'251008207494',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=251008207494&req_restrictlocation=0&req_planid=255&req_firstname=Rtz&req_lastname=Abc&req_email=&req_homephone=9765325523&req_cellphone=&req_city=Deori&req_username=Abc@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(307,'251015179210',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=251015179210&req_restrictlocation=0&req_planid=255&req_firstname=Prashant&req_lastname=Koli&req_email=&req_homephone=8530700148&req_cellphone=&req_city=Pune&req_username=demo@Gonet&req_password=demo123&req_repassword=demo123&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(308,'',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&register=1&req_customercode=76168512&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=255&req_username=demo@Gonet&req_password=demo123&req_repassword=&gtid=16&rechargeAcc=1&req_paymntGtType=12&req_cellphone=&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(309,'',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&register=1&req_customercode=76168512&req_action=recharge&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_restrictlocation=0&temploginurl=http://portal.wios.indionetworks.com/portal/default/payment.php&req_planid=255&req_username=demo@Gonet&req_password=demo123&req_repassword=&gtid=16&rechargeAcc=1&req_paymntGtType=12&req_cellphone=&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&',0),(310,'251211101923',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=251211101923&req_restrictlocation=0&req_planid=255&req_firstname=Prashant&req_lastname=Koli&req_email=&req_homephone=8530700148&req_cellphone=&req_city=Pune&req_username=demo@Gonet&req_password=demo123&req_repassword=demo123&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(311,'251214282996',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=251214282996&req_restrictlocation=0&req_planid=255&req_firstname=Prshant&req_lastname=Koli&req_email=&req_homephone=8530700148&req_cellphone=&req_city=Pune&req_username=demo@Gonet&req_password=demo123&req_repassword=demo123&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(312,'251219511887',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=251219511887&req_restrictlocation=0&req_planid=255&req_firstname=Prashant&req_lastname=Koli&req_email=&req_homephone=8530700148&req_cellphone=&req_city=Pune&req_username=demo@Gonet&req_password=demo123&req_repassword=demo123&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(313,'250113517775',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250113517775&req_restrictlocation=0&req_planid=255&req_firstname=Rutuja&req_lastname=Nikam&req_email=&req_homephone=8421059829&req_cellphone=&req_city=Pune&req_username=rutuja@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(314,'250124403371',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=250124403371&req_restrictlocation=0&req_planid=255&req_firstname=Rutuja&req_lastname=Nikam&req_email=&req_homephone=8421059829&req_cellphone=&req_city=Pune&req_username=rutuja@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0),(315,'260640208494',NULL,'c=216&l=600&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=76168512&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=600&realm=Gonet&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=260640208494&req_restrictlocation=0&req_planid=255&req_firstname=Rakesh&req_lastname=Meshram&req_email=&req_homephone=9765325523&req_cellphone=&req_city=Deori&req_username=Rakesh@Gonet&req_password=123456&req_repassword=123456&gtid=16&isSmsGatewayConfigured=1&req_paymntGtType=12&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',1),(316,'260802512600',NULL,'c=185&l=495&host=https://portal.wios.indionetworks.com&test=0&register=1&req_customercode=33452322&encmob=&req_action=create&req_billdatarequired=1&req_verifyemail=0&req_locationid=495&realm=psndigital&req_successurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&req_failurl=https://portal.wios.indionetworks.com/portal/default/postpayment.php&oid=260802512600&req_restrictlocation=0&req_planid=249&req_firstname=sumit&req_lastname=sdfgh&req_email=sumit74448@gmail.com&req_cellphone=8495073003&req_username=sumeet@psndigital&req_password=12345678&req_repassword=12345678&gtid=14&isSmsGatewayConfigured=1&req_paymntGtType=6&req_sendsmslink=1&req_cardnumber=&req_cardtype=&req_cardexpirymonth=&req_cardexpiryyear=&req_cvvnumber=&tncsignuppaid=1&',0);
/*!40000 ALTER TABLE `temp_sms_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_portal_config`
--

DROP TABLE IF EXISTS `template_portal_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_portal_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TemplateName` varchar(50) DEFAULT NULL,
  `IsDefaultConfig` tinyint(1) NOT NULL,
  `ApiHost` varchar(255) NOT NULL,
  `ApiPath` varchar(255) NOT NULL,
  `Customercode` int(10) NOT NULL,
  `Realm` varchar(50) NOT NULL,
  `Currency` varchar(10) NOT NULL,
  `Language` varchar(10) NOT NULL,
  `OptionalLanguage` varchar(150) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `Locationname` varchar(50) DEFAULT NULL,
  `LocationDisName` varchar(100) DEFAULT NULL,
  `EnableUnamePasswd` tinyint(1) DEFAULT NULL,
  `UnamePasswordTitle` varchar(25) DEFAULT NULL,
  `PaidEnableTnc` tinyint(1) DEFAULT NULL,
  `TempLogin` tinyint(1) default NULL,
  `PaidSmsLink` tinyint(1) DEFAULT NULL,
  `PaidEnableOtpVerification` tinyint(1) DEFAULT NULL,
  `PaidInstructionText` varchar(350) DEFAULT NULL,
  `PaidPlanGroupId` int(15) DEFAULT NULL,
  `PaidUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqLastname` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqAddress` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqCity` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqState` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqZipcode` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqCountry` tinyint(1) DEFAULT NULL,
  `PaidUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `EnablePmwani` tinyint(1) DEFAULT NULL,
  `PmwaniTitle` varchar(25) DEFAULT NULL,
  `PmwaniInstructionText` varchar(350) DEFAULT NULL,
  `PmwaniPaidPlanGroupId` int(15) DEFAULT NULL,
  `PmwaniSmsLink` tinyint(1) DEFAULT NULL,
  `PmwaniUpi` tinyint(1) DEFAULT NULL,
  `PmwaniEnableTnc` tinyint(1) DEFAULT NULL,
  `PmwaniVoucher` tinyint(1) DEFAULT NULL,
  `EnablePmwaniWeb` tinyint(1) DEFAULT NULL,
  `PmwaniWebTitle` varchar(25) DEFAULT NULL,
  `PmwaniWebInstructionText` varchar(350) DEFAULT NULL,
  `PmwaniWebEnableTnc` tinyint(1) DEFAULT NULL,
  `EnableVoucher` tinyint(1) DEFAULT NULL,
  `VoucherTitle` varchar(25) DEFAULT NULL,
  `VoucherEnableTnc` tinyint(1) DEFAULT NULL,
  `VoucherInstructionText` varchar(350) DEFAULT NULL,
  `VoucherUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `VoucherUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `VoucherUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `VoucherUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `VoucherUserInfoReqAge` tinyint(1) DEFAULT NULL,
  `EnableVoucherWithOtp` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpTitle` varchar(25) DEFAULT NULL,
  `VoucherWithOtpEnableTnc` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpInstructionText` varchar(350) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqLastname` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqAddress` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqCity` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqState` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqZipcode` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqCountry` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqAge` tinyint(1) DEFAULT NULL,
  `VoucherWithOtpUserInfoReqBirthdate` tinyint(1) DEFAULT NULL,
  `EnableLdap` tinyint(1) DEFAULT NULL,
  `LdapTitle` varchar(25) DEFAULT NULL,
  `LdapEnableTnc` tinyint(1) DEFAULT NULL,
  `LdapInstructionText` varchar(350) DEFAULT NULL,
  `EnableFreeOnClick` tinyint(1) DEFAULT NULL,
  `FreeOnClickTitle` varchar(25) DEFAULT NULL,
  `FreeOnClickEnableTnc` tinyint(1) DEFAULT NULL,
  `FreeOnClickInstructionText` varchar(350) DEFAULT NULL,
  `EnableFreeWithUserInfoCapture` tinyint(1) DEFAULT NULL,
  `FreeUserInfoTitle` varchar(25) DEFAULT NULL,
  `FreeUserInfoEnableTnc` tinyint(1) DEFAULT NULL,
  `FreeUserInfoInstructionText` varchar(350) DEFAULT NULL,
  `FreeUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqLastname` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqAddress` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqCity` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqState` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqZipcode` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqCountry` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqAge` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqGetUnamePasswd` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqNoSignup` tinyint(1) DEFAULT NULL,
  `FreeUserInfoReqOccuption` tinyint(1) DEFAULT NULL,
  `EnableFreeWithExternalUserInfoCapture` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoTitle` varchar(25) DEFAULT NULL,
  `FreeExternalUserInfoEnableTnc` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoInstructionText` varchar(350) DEFAULT NULL,
  `FreeExternalUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `FreeExternalUserInfoReqDepartment` tinyint(1) DEFAULT NULL,
  `EnableFreeWithPassword` tinyint(1) DEFAULT NULL,
  `FreeWithPasswordTitle` varchar(25) DEFAULT NULL,
  `FreeWithPasswordEnableTnc` tinyint(1) DEFAULT NULL,
  `FreeWithPasswordInstructionText` varchar(350) DEFAULT NULL,
  `FreePasswordReqFirstname` tinyint(1) DEFAULT NULL,
  `FreePasswordReqLastname` tinyint(1) DEFAULT NULL,
  `FreePasswordReqEmail` tinyint(1) DEFAULT NULL,
  `FreePasswordReqHomephone` tinyint(1) DEFAULT NULL,
  `FreePasswordReqAddress` tinyint(1) DEFAULT NULL,
  `FreePasswordReqCity` tinyint(1) DEFAULT NULL,
  `FreePasswordReqState` tinyint(1) DEFAULT NULL,
  `FreePasswordReqZipcode` tinyint(1) DEFAULT NULL,
  `FreePasswordReqCountry` tinyint(1) DEFAULT NULL,
  `FreePasswordReqGender` tinyint(1) DEFAULT NULL,
  `FreeAccessPassword` varchar(100) DEFAULT NULL,
  `LdapPolicyId` int(10) DEFAULT NULL,
  `FreePolicyId` int(10) DEFAULT NULL,
  `FreeDataCapturePolicyId` int(10) DEFAULT NULL,
  `FreeExternalUserPolicyId` int(10) DEFAULT NULL,
  `SmsPolicyId` int(10) DEFAULT NULL,
  `VoucherWithOtpPolicyId` int(10) DEFAULT NULL,
  `SocialPolicyId` int(10) DEFAULT NULL,
  `FreePasswordPolicyId` int(10) DEFAULT NULL,
  `EnableSms` tinyint(1) DEFAULT NULL,
  `SmsTitle` varchar(25) DEFAULT NULL,
  `SmsEnableTnc` tinyint(1) DEFAULT NULL,
  `SmsInstructionText` varchar(350) DEFAULT NULL,
  `SmsUserInfoReqFirstname` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqLastname` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqEmail` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqHomephone` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqAddress` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqCity` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqState` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqZipcode` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqCountry` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqGender` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqAge` tinyint(1) DEFAULT NULL,
  `SmsUserInfoReqBirthdate` tinyint(1) DEFAULT NULL,
  `EnableSocialMedia` tinyint(1) DEFAULT NULL,
  `SocialMediaTitle` varchar(25) DEFAULT NULL,
  `SocialMediaEnableTnc` tinyint(1) DEFAULT NULL,
  `SocialMediaInstructionText` varchar(350) DEFAULT NULL,
  `EnableSmFb` tinyint(1) DEFAULT NULL,
  `FbAppId` varchar(200) DEFAULT NULL,
  `FbAppSecret` varchar(200) DEFAULT NULL,
  `FbLikeUrl` varchar(100) DEFAULT NULL,
  `FbShareUrl` varchar(100) DEFAULT NULL,
  `EnableSmLi` tinyint(1) DEFAULT NULL,
  `LiAppId` varchar(200) DEFAULT NULL,
  `LiAppSecret` varchar(200) DEFAULT NULL,
  `LiLikeUrl` varchar(100) DEFAULT NULL,
  `LiShareUrl` varchar(100) DEFAULT NULL,
  `EnableSmTt` tinyint(1) DEFAULT NULL,
  `TtAppId` varchar(200) DEFAULT NULL,
  `TtAppSecret` varchar(200) DEFAULT NULL,
  `TtLikeUrl` varchar(100) DEFAULT NULL,
  `TtShareUrl` varchar(100) DEFAULT NULL,
  `EnableSmGg` tinyint(1) DEFAULT NULL,
  `GgAppId` varchar(200) DEFAULT NULL,
  `GgAppSecret` varchar(200) DEFAULT NULL,
  `GgLikeUrl` varchar(100) DEFAULT NULL,
  `GgShareUrl` varchar(100) DEFAULT NULL,
  `EnableSmIg` tinyint(1) DEFAULT NULL,
  `IgAppId` varchar(200) DEFAULT NULL,
  `IgAppSecret` varchar(200) DEFAULT NULL,
  `IgFollowUrl` varchar(100) DEFAULT NULL,
  `parameterpassing` varchar(10) NOT NULL,
  `EnableLoginCookies` tinyint(1) NOT NULL,
  `Devicetype` varchar(50) DEFAULT NULL,
  `Deviceid` int(10) DEFAULT NULL,
  `RequestPassword` varchar(100) DEFAULT NULL,
  `ReqPaidUnamePasswd` varchar(150) DEFAULT NULL,
  `SocialPlan` varchar(150) DEFAULT NULL,
  `EnableProximityMarketing` tinyint(1) DEFAULT NULL,
  `EnableSelfCare` tinyint(1) DEFAULT NULL,
  `EnableAds` tinyint(1) DEFAULT NULL,
  `AdsCheckDeviceMac` tinyint(1) DEFAULT NULL,
  `AdsSkipPaidUsers` tinyint(1) DEFAULT NULL,
  `Adonclick` varchar(10) DEFAULT NULL,
  `EnableReview` tinyint(1) DEFAULT NULL,
  `EnableReviewQuestion` varchar(255) DEFAULT NULL,
  `EnableSurvey` tinyint(1) DEFAULT NULL,
  `VoucherPassword` varchar(255) DEFAULT NULL,
  `Logo` varchar(150) DEFAULT NULL,
  `PortalLogo` varchar(150) DEFAULT NULL,
  `LogoAnchorLink` varchar(150) DEFAULT NULL,
  `ApplyPartnerLogo` varchar(150) DEFAULT NULL,
  `PartnerLogo` varchar(150) DEFAULT NULL,
  `PortalPartnerLogo` varchar(150) DEFAULT NULL,
  `PartnerLogoAnchorLink` varchar(150) DEFAULT NULL,
  `PortalFrameBackgroundColor` varchar(100) DEFAULT NULL,
  `PortalFontColor` varchar(100) DEFAULT NULL,
  `ApplySiteImage` varchar(100) DEFAULT NULL,
  `SiteImagetheme` varchar(100) DEFAULT NULL,
  `SiteImage` varchar(150) DEFAULT NULL,
  `PortalSiteImage` varchar(150) DEFAULT NULL,
  `WelcomeUrl` varchar(150) DEFAULT NULL,
  `Footer` varchar(100) DEFAULT NULL,
  `ShowSupportNumber` varchar(10) DEFAULT NULL,
  `SupportNumber` varchar(25) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `RestrictLocation` tinyint(1) DEFAULT NULL,
  `EnableEndUserTicket` tinyint(1) DEFAULT NULL,
  `EnableCaptivePortalBypass` tinyint(1) DEFAULT 0,
  `TNCText` varchar(350) DEFAULT NULL,
  `CreatedOn` datetime DEFAULT current_timestamp(),
  `ModifiedOn` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `template_portal_config_ibfk_1` (`CustomerId`),
  CONSTRAINT `template_portal_config_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_portal_config`
--

LOCK TABLES `template_portal_config` WRITE;
/*!40000 ALTER TABLE `template_portal_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_portal_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_userinfo`
--

DROP TABLE IF EXISTS `twitter_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_userinfo` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `TId` varchar(50) DEFAULT NULL,
  `TName` varchar(100) DEFAULT NULL,
  `TScreenName` varchar(100) DEFAULT NULL,
  `TFollowersCount` varchar(100) DEFAULT NULL,
  `TFollowingCount` varchar(100) DEFAULT NULL,
  `TFavouritesCount` varchar(100) DEFAULT NULL,
  `TStatusesCount` varchar(100) DEFAULT NULL,
  `TPictureURL` varchar(400) DEFAULT NULL,
  `TLocation` varchar(100) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_userinfo`
--

LOCK TABLES `twitter_userinfo` WRITE;
/*!40000 ALTER TABLE `twitter_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `twitter_userlogin`
--

DROP TABLE IF EXISTS `twitter_userlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `twitter_userlogin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `LoginTime` datetime DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TId` (`UserId`),
  KEY `customerid` (`CustomerId`),
  KEY `locationid` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `twitter_userlogin`
--

LOCK TABLES `twitter_userlogin` WRITE;
/*!40000 ALTER TABLE `twitter_userlogin` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_userlogin` ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table `two_factor_authentication_details`
--

DROP TABLE IF EXISTS `two_factor_authentication_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `two_factor_authentication_details` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `MobileNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `OTPSendDate` datetime DEFAULT NULL,
  `CustomerId` int(10) unsigned NOT NULL,
  `VerificationCode` varchar(50) NOT NULL,
  `OTPExpiryDate` datetime DEFAULT NULL,
  `IsUsed` tinyint(1) DEFAULT 0,
  `isEmail` tinyint(1) DEFAULT 0,
  `isSms` tinyint(1) DEFAULT 0,
  `subscriberId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOCK TABLES `two_factor_authentication_details` WRITE;
/*!40000 ALTER TABLE `two_factor_authentication_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `two_factor_authentication_details` ENABLE KEYS */;
UNLOCK TABLES;





--
-- Table structure for table `url_logging_deviceinfo_51_102`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_102` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_102`
--

LOCK TABLES `url_logging_deviceinfo_51_102` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_102` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_102` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_104`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_104`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_104` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_104`
--

LOCK TABLES `url_logging_deviceinfo_51_104` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_104` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_104` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_106`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_106`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_106` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_106`
--

LOCK TABLES `url_logging_deviceinfo_51_106` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_106` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_106` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_107`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_107` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_107`
--

LOCK TABLES `url_logging_deviceinfo_51_107` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_107` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_107` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_108`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_108` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_108`
--

LOCK TABLES `url_logging_deviceinfo_51_108` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_108` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_109`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_109`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_109` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_109`
--

LOCK TABLES `url_logging_deviceinfo_51_109` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_109` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_109` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_110`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_110` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_110`
--

LOCK TABLES `url_logging_deviceinfo_51_110` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_110` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_110` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_111`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_111`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_111` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_111`
--

LOCK TABLES `url_logging_deviceinfo_51_111` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_111` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_111` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_112`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_112`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_112` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_112`
--

LOCK TABLES `url_logging_deviceinfo_51_112` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_112` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_112` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_114`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_114` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_114`
--

LOCK TABLES `url_logging_deviceinfo_51_114` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_114` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_114` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_120`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_120`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_120` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_120`
--

LOCK TABLES `url_logging_deviceinfo_51_120` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_120` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_120` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_121`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_121`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_121` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_121`
--

LOCK TABLES `url_logging_deviceinfo_51_121` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_121` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_121` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_124`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_124`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_124` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_124`
--

LOCK TABLES `url_logging_deviceinfo_51_124` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_124` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_124` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_125`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_125`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_125` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_125`
--

LOCK TABLES `url_logging_deviceinfo_51_125` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_125` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_125` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_127`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_127`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_127` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_127`
--

LOCK TABLES `url_logging_deviceinfo_51_127` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_127` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_127` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_130`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_130`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_130` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_130`
--

LOCK TABLES `url_logging_deviceinfo_51_130` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_130` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_130` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_135`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_135`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_135` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_135`
--

LOCK TABLES `url_logging_deviceinfo_51_135` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_135` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_135` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_136`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_136`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_136` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_136`
--

LOCK TABLES `url_logging_deviceinfo_51_136` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_136` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_136` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_137`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_137`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_137` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_137`
--

LOCK TABLES `url_logging_deviceinfo_51_137` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_137` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_137` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_138`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_138`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_138` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_138`
--

LOCK TABLES `url_logging_deviceinfo_51_138` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_138` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_138` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_140`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_140`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_140` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_140`
--

LOCK TABLES `url_logging_deviceinfo_51_140` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_140` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_140` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_141`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_141`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_141` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_141`
--

LOCK TABLES `url_logging_deviceinfo_51_141` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_141` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_141` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_142`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_142`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_142` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_142`
--

LOCK TABLES `url_logging_deviceinfo_51_142` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_142` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_142` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_145`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_145`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_145` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_145`
--

LOCK TABLES `url_logging_deviceinfo_51_145` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_145` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_145` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_146`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_146`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_146` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_146`
--

LOCK TABLES `url_logging_deviceinfo_51_146` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_146` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_146` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_149`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_149`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_149` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_149`
--

LOCK TABLES `url_logging_deviceinfo_51_149` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_149` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_149` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_151`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_151`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_151` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_151`
--

LOCK TABLES `url_logging_deviceinfo_51_151` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_151` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_151` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_152`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_152`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_152` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_152`
--

LOCK TABLES `url_logging_deviceinfo_51_152` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_152` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_152` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_153`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_153`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_153` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_153`
--

LOCK TABLES `url_logging_deviceinfo_51_153` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_153` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_153` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_154`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_154`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_154` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_154`
--

LOCK TABLES `url_logging_deviceinfo_51_154` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_154` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_154` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_158`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_158`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_158` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_158`
--

LOCK TABLES `url_logging_deviceinfo_51_158` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_158` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_158` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_160`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_160`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_160` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_160`
--

LOCK TABLES `url_logging_deviceinfo_51_160` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_160` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_160` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_162`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_162`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_162` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_162`
--

LOCK TABLES `url_logging_deviceinfo_51_162` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_162` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_162` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_163`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_163`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_163` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_163`
--

LOCK TABLES `url_logging_deviceinfo_51_163` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_163` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_163` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_164`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_164`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_164` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_164`
--

LOCK TABLES `url_logging_deviceinfo_51_164` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_164` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_164` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_165`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_165`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_165` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_165`
--

LOCK TABLES `url_logging_deviceinfo_51_165` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_165` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_165` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_167`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_167`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_167` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_167`
--

LOCK TABLES `url_logging_deviceinfo_51_167` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_167` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_167` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_168`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_168`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_168` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_168`
--

LOCK TABLES `url_logging_deviceinfo_51_168` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_168` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_168` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_169`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_169`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_169` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_169`
--

LOCK TABLES `url_logging_deviceinfo_51_169` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_169` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_169` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_170`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_170`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_170` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_170`
--

LOCK TABLES `url_logging_deviceinfo_51_170` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_170` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_170` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_172`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_172`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_172` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_172`
--

LOCK TABLES `url_logging_deviceinfo_51_172` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_172` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_172` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_173`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_173`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_173` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_173`
--

LOCK TABLES `url_logging_deviceinfo_51_173` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_173` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_173` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_175`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_175`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_175` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_175`
--

LOCK TABLES `url_logging_deviceinfo_51_175` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_175` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_175` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_177`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_177`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_177` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_177`
--

LOCK TABLES `url_logging_deviceinfo_51_177` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_177` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_177` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_178`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_178`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_178` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_178`
--

LOCK TABLES `url_logging_deviceinfo_51_178` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_178` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_178` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_179`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_179`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_179` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_179`
--

LOCK TABLES `url_logging_deviceinfo_51_179` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_179` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_179` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_180`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_180`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_180` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_180`
--

LOCK TABLES `url_logging_deviceinfo_51_180` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_180` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_180` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_181`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_181`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_181` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_181`
--

LOCK TABLES `url_logging_deviceinfo_51_181` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_181` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_181` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_184`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_184`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_184` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_184`
--

LOCK TABLES `url_logging_deviceinfo_51_184` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_184` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_184` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_185`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_185`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_185` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_185`
--

LOCK TABLES `url_logging_deviceinfo_51_185` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_185` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_185` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_186`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_186`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_186` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_186`
--

LOCK TABLES `url_logging_deviceinfo_51_186` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_186` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_186` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_187`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_187`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_187` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_187`
--

LOCK TABLES `url_logging_deviceinfo_51_187` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_187` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_187` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_188`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_188`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_188` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_188`
--

LOCK TABLES `url_logging_deviceinfo_51_188` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_188` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_188` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_189`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_189`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_189` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_189`
--

LOCK TABLES `url_logging_deviceinfo_51_189` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_189` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_189` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_191`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_191`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_191` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_191`
--

LOCK TABLES `url_logging_deviceinfo_51_191` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_191` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_191` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_192`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_192`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_192` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_192`
--

LOCK TABLES `url_logging_deviceinfo_51_192` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_192` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_192` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_193`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_193`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_193` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_193`
--

LOCK TABLES `url_logging_deviceinfo_51_193` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_193` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_193` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_194`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_194`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_194` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_194`
--

LOCK TABLES `url_logging_deviceinfo_51_194` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_194` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_194` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_195`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_195`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_195` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_195`
--

LOCK TABLES `url_logging_deviceinfo_51_195` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_195` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_195` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_196`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_196`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_196` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_196`
--

LOCK TABLES `url_logging_deviceinfo_51_196` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_196` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_196` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_197`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_197`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_197` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_197`
--

LOCK TABLES `url_logging_deviceinfo_51_197` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_197` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_197` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_198`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_198`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_198` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_198`
--

LOCK TABLES `url_logging_deviceinfo_51_198` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_198` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_198` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_199`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_199`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_199` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_199`
--

LOCK TABLES `url_logging_deviceinfo_51_199` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_199` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_199` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_200`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_200`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_200` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_200`
--

LOCK TABLES `url_logging_deviceinfo_51_200` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_200` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_200` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_203`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_203`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_203` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_203`
--

LOCK TABLES `url_logging_deviceinfo_51_203` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_203` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_203` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_204`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_204` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_204`
--

LOCK TABLES `url_logging_deviceinfo_51_204` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_204` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_205`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_205` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_205`
--

LOCK TABLES `url_logging_deviceinfo_51_205` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_205` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_206`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_206`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_206` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_206`
--

LOCK TABLES `url_logging_deviceinfo_51_206` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_206` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_206` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_207`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_207` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_207`
--

LOCK TABLES `url_logging_deviceinfo_51_207` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_207` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_208`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_208`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_208` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_208`
--

LOCK TABLES `url_logging_deviceinfo_51_208` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_208` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_208` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_209`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_209`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_209` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_209`
--

LOCK TABLES `url_logging_deviceinfo_51_209` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_209` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_209` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_211`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_211`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_211` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_211`
--

LOCK TABLES `url_logging_deviceinfo_51_211` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_211` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_211` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_212`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_212`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_212` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_212`
--

LOCK TABLES `url_logging_deviceinfo_51_212` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_212` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_212` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_213`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_213`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_213` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_213`
--

LOCK TABLES `url_logging_deviceinfo_51_213` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_213` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_213` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_214`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_214`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_214` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_214`
--

LOCK TABLES `url_logging_deviceinfo_51_214` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_214` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_214` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_215`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_215` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_215`
--

LOCK TABLES `url_logging_deviceinfo_51_215` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_215` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_215` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_216`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_216`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_216` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_216`
--

LOCK TABLES `url_logging_deviceinfo_51_216` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_216` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_216` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_219`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_219`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_219` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_219`
--

LOCK TABLES `url_logging_deviceinfo_51_219` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_219` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_219` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_221`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_221`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_221` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_221`
--

LOCK TABLES `url_logging_deviceinfo_51_221` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_221` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_221` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_222`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_222`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_222` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_222`
--

LOCK TABLES `url_logging_deviceinfo_51_222` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_222` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_222` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_225`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_225`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_225` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_225`
--

LOCK TABLES `url_logging_deviceinfo_51_225` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_225` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_225` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_226`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_226`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_226` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_226`
--

LOCK TABLES `url_logging_deviceinfo_51_226` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_226` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_226` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_4`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_4` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_4`
--

LOCK TABLES `url_logging_deviceinfo_51_4` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_46`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_46`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_46` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_46`
--

LOCK TABLES `url_logging_deviceinfo_51_46` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_46` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_46` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_57`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_57`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_57` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_57`
--

LOCK TABLES `url_logging_deviceinfo_51_57` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_57` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_57` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_58`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_58`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_58` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_58`
--

LOCK TABLES `url_logging_deviceinfo_51_58` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_58` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_58` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_59`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_59`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_59` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_59`
--

LOCK TABLES `url_logging_deviceinfo_51_59` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_59` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_59` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_68`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_68`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_68` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_68`
--

LOCK TABLES `url_logging_deviceinfo_51_68` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_68` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_68` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_69`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_69`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_69` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_69`
--

LOCK TABLES `url_logging_deviceinfo_51_69` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_69` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_69` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_73`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_73`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_73` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_73`
--

LOCK TABLES `url_logging_deviceinfo_51_73` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_73` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_73` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_74`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_74`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_74` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_74`
--

LOCK TABLES `url_logging_deviceinfo_51_74` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_74` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_74` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_75`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_75`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_75` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_75`
--

LOCK TABLES `url_logging_deviceinfo_51_75` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_75` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_75` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_76`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_76`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_76` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_76`
--

LOCK TABLES `url_logging_deviceinfo_51_76` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_76` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_76` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_83`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_83`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_83` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_83`
--

LOCK TABLES `url_logging_deviceinfo_51_83` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_83` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_83` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_84`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_84`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_84` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_84`
--

LOCK TABLES `url_logging_deviceinfo_51_84` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_84` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_84` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_94`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_94`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_94` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_94`
--

LOCK TABLES `url_logging_deviceinfo_51_94` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_94` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_94` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_deviceinfo_51_95`
--

DROP TABLE IF EXISTS `url_logging_deviceinfo_51_95`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_deviceinfo_51_95` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_deviceinfo_51_95`
--

LOCK TABLES `url_logging_deviceinfo_51_95` WRITE;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_95` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_deviceinfo_51_95` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_102`
--

DROP TABLE IF EXISTS `url_logging_info_51_102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_102` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_102`
--

LOCK TABLES `url_logging_info_51_102` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_102` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_102` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_104`
--

DROP TABLE IF EXISTS `url_logging_info_51_104`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_104` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_104`
--

LOCK TABLES `url_logging_info_51_104` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_104` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_104` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_106`
--

DROP TABLE IF EXISTS `url_logging_info_51_106`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_106` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_106`
--

LOCK TABLES `url_logging_info_51_106` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_106` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_106` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_107`
--

DROP TABLE IF EXISTS `url_logging_info_51_107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_107` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_107`
--

LOCK TABLES `url_logging_info_51_107` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_107` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_107` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_108`
--

DROP TABLE IF EXISTS `url_logging_info_51_108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_108` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_108`
--

LOCK TABLES `url_logging_info_51_108` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_108` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_108` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_109`
--

DROP TABLE IF EXISTS `url_logging_info_51_109`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_109` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_109`
--

LOCK TABLES `url_logging_info_51_109` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_109` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_109` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_110`
--

DROP TABLE IF EXISTS `url_logging_info_51_110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_110` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_110`
--

LOCK TABLES `url_logging_info_51_110` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_110` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_110` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_111`
--

DROP TABLE IF EXISTS `url_logging_info_51_111`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_111` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_111`
--

LOCK TABLES `url_logging_info_51_111` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_111` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_111` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_112`
--

DROP TABLE IF EXISTS `url_logging_info_51_112`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_112` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_112`
--

LOCK TABLES `url_logging_info_51_112` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_112` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_112` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_114`
--

DROP TABLE IF EXISTS `url_logging_info_51_114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_114` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_114`
--

LOCK TABLES `url_logging_info_51_114` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_114` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_114` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_120`
--

DROP TABLE IF EXISTS `url_logging_info_51_120`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_120` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_120`
--

LOCK TABLES `url_logging_info_51_120` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_120` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_120` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_121`
--

DROP TABLE IF EXISTS `url_logging_info_51_121`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_121` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_121`
--

LOCK TABLES `url_logging_info_51_121` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_121` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_121` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_124`
--

DROP TABLE IF EXISTS `url_logging_info_51_124`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_124` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_124`
--

LOCK TABLES `url_logging_info_51_124` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_124` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_124` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_125`
--

DROP TABLE IF EXISTS `url_logging_info_51_125`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_125` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_125`
--

LOCK TABLES `url_logging_info_51_125` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_125` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_125` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_127`
--

DROP TABLE IF EXISTS `url_logging_info_51_127`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_127` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_127`
--

LOCK TABLES `url_logging_info_51_127` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_127` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_127` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_130`
--

DROP TABLE IF EXISTS `url_logging_info_51_130`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_130` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_130`
--

LOCK TABLES `url_logging_info_51_130` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_130` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_130` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_135`
--

DROP TABLE IF EXISTS `url_logging_info_51_135`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_135` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_135`
--

LOCK TABLES `url_logging_info_51_135` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_135` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_135` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_136`
--

DROP TABLE IF EXISTS `url_logging_info_51_136`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_136` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_136`
--

LOCK TABLES `url_logging_info_51_136` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_136` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_136` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_137`
--

DROP TABLE IF EXISTS `url_logging_info_51_137`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_137` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_137`
--

LOCK TABLES `url_logging_info_51_137` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_137` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_137` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_138`
--

DROP TABLE IF EXISTS `url_logging_info_51_138`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_138` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_138`
--

LOCK TABLES `url_logging_info_51_138` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_138` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_138` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_140`
--

DROP TABLE IF EXISTS `url_logging_info_51_140`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_140` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_140`
--

LOCK TABLES `url_logging_info_51_140` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_140` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_140` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_141`
--

DROP TABLE IF EXISTS `url_logging_info_51_141`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_141` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_141`
--

LOCK TABLES `url_logging_info_51_141` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_141` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_141` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_142`
--

DROP TABLE IF EXISTS `url_logging_info_51_142`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_142` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_142`
--

LOCK TABLES `url_logging_info_51_142` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_142` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_142` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_145`
--

DROP TABLE IF EXISTS `url_logging_info_51_145`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_145` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_145`
--

LOCK TABLES `url_logging_info_51_145` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_145` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_145` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_146`
--

DROP TABLE IF EXISTS `url_logging_info_51_146`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_146` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_146`
--

LOCK TABLES `url_logging_info_51_146` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_146` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_146` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_149`
--

DROP TABLE IF EXISTS `url_logging_info_51_149`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_149` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_149`
--

LOCK TABLES `url_logging_info_51_149` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_149` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_149` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_151`
--

DROP TABLE IF EXISTS `url_logging_info_51_151`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_151` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_151`
--

LOCK TABLES `url_logging_info_51_151` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_151` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_151` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_152`
--

DROP TABLE IF EXISTS `url_logging_info_51_152`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_152` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_152`
--

LOCK TABLES `url_logging_info_51_152` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_152` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_152` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_153`
--

DROP TABLE IF EXISTS `url_logging_info_51_153`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_153` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_153`
--

LOCK TABLES `url_logging_info_51_153` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_153` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_153` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_154`
--

DROP TABLE IF EXISTS `url_logging_info_51_154`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_154` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_154`
--

LOCK TABLES `url_logging_info_51_154` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_154` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_154` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_158`
--

DROP TABLE IF EXISTS `url_logging_info_51_158`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_158` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_158`
--

LOCK TABLES `url_logging_info_51_158` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_158` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_158` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_160`
--

DROP TABLE IF EXISTS `url_logging_info_51_160`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_160` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_160`
--

LOCK TABLES `url_logging_info_51_160` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_160` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_160` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_162`
--

DROP TABLE IF EXISTS `url_logging_info_51_162`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_162` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_162`
--

LOCK TABLES `url_logging_info_51_162` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_162` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_162` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_163`
--

DROP TABLE IF EXISTS `url_logging_info_51_163`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_163` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_163`
--

LOCK TABLES `url_logging_info_51_163` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_163` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_163` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_164`
--

DROP TABLE IF EXISTS `url_logging_info_51_164`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_164` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_164`
--

LOCK TABLES `url_logging_info_51_164` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_164` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_164` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_165`
--

DROP TABLE IF EXISTS `url_logging_info_51_165`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_165` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_165`
--

LOCK TABLES `url_logging_info_51_165` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_165` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_165` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_167`
--

DROP TABLE IF EXISTS `url_logging_info_51_167`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_167` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_167`
--

LOCK TABLES `url_logging_info_51_167` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_167` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_167` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_168`
--

DROP TABLE IF EXISTS `url_logging_info_51_168`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_168` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_168`
--

LOCK TABLES `url_logging_info_51_168` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_168` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_168` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_169`
--

DROP TABLE IF EXISTS `url_logging_info_51_169`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_169` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_169`
--

LOCK TABLES `url_logging_info_51_169` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_169` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_169` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_170`
--

DROP TABLE IF EXISTS `url_logging_info_51_170`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_170` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_170`
--

LOCK TABLES `url_logging_info_51_170` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_170` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_170` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_172`
--

DROP TABLE IF EXISTS `url_logging_info_51_172`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_172` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_172`
--

LOCK TABLES `url_logging_info_51_172` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_172` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_172` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_173`
--

DROP TABLE IF EXISTS `url_logging_info_51_173`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_173` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_173`
--

LOCK TABLES `url_logging_info_51_173` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_173` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_173` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_175`
--

DROP TABLE IF EXISTS `url_logging_info_51_175`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_175` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_175`
--

LOCK TABLES `url_logging_info_51_175` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_175` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_175` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_177`
--

DROP TABLE IF EXISTS `url_logging_info_51_177`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_177` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_177`
--

LOCK TABLES `url_logging_info_51_177` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_177` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_177` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_178`
--

DROP TABLE IF EXISTS `url_logging_info_51_178`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_178` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_178`
--

LOCK TABLES `url_logging_info_51_178` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_178` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_178` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_179`
--

DROP TABLE IF EXISTS `url_logging_info_51_179`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_179` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_179`
--

LOCK TABLES `url_logging_info_51_179` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_179` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_179` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_180`
--

DROP TABLE IF EXISTS `url_logging_info_51_180`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_180` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_180`
--

LOCK TABLES `url_logging_info_51_180` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_180` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_180` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_181`
--

DROP TABLE IF EXISTS `url_logging_info_51_181`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_181` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_181`
--

LOCK TABLES `url_logging_info_51_181` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_181` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_181` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_184`
--

DROP TABLE IF EXISTS `url_logging_info_51_184`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_184` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_184`
--

LOCK TABLES `url_logging_info_51_184` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_184` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_184` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_185`
--

DROP TABLE IF EXISTS `url_logging_info_51_185`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_185` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_185`
--

LOCK TABLES `url_logging_info_51_185` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_185` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_185` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_186`
--

DROP TABLE IF EXISTS `url_logging_info_51_186`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_186` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_186`
--

LOCK TABLES `url_logging_info_51_186` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_186` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_186` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_187`
--

DROP TABLE IF EXISTS `url_logging_info_51_187`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_187` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_187`
--

LOCK TABLES `url_logging_info_51_187` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_187` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_187` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_188`
--

DROP TABLE IF EXISTS `url_logging_info_51_188`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_188` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_188`
--

LOCK TABLES `url_logging_info_51_188` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_188` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_188` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_189`
--

DROP TABLE IF EXISTS `url_logging_info_51_189`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_189` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_189`
--

LOCK TABLES `url_logging_info_51_189` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_189` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_189` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_191`
--

DROP TABLE IF EXISTS `url_logging_info_51_191`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_191` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_191`
--

LOCK TABLES `url_logging_info_51_191` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_191` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_191` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_192`
--

DROP TABLE IF EXISTS `url_logging_info_51_192`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_192` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_192`
--

LOCK TABLES `url_logging_info_51_192` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_192` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_192` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_193`
--

DROP TABLE IF EXISTS `url_logging_info_51_193`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_193` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_193`
--

LOCK TABLES `url_logging_info_51_193` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_193` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_193` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_194`
--

DROP TABLE IF EXISTS `url_logging_info_51_194`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_194` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_194`
--

LOCK TABLES `url_logging_info_51_194` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_194` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_194` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_195`
--

DROP TABLE IF EXISTS `url_logging_info_51_195`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_195` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_195`
--

LOCK TABLES `url_logging_info_51_195` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_195` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_195` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_196`
--

DROP TABLE IF EXISTS `url_logging_info_51_196`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_196` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_196`
--

LOCK TABLES `url_logging_info_51_196` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_196` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_196` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_197`
--

DROP TABLE IF EXISTS `url_logging_info_51_197`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_197` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_197`
--

LOCK TABLES `url_logging_info_51_197` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_197` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_197` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_198`
--

DROP TABLE IF EXISTS `url_logging_info_51_198`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_198` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_198`
--

LOCK TABLES `url_logging_info_51_198` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_198` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_198` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_199`
--

DROP TABLE IF EXISTS `url_logging_info_51_199`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_199` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_199`
--

LOCK TABLES `url_logging_info_51_199` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_199` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_199` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_200`
--

DROP TABLE IF EXISTS `url_logging_info_51_200`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_200` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_200`
--

LOCK TABLES `url_logging_info_51_200` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_200` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_200` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_203`
--

DROP TABLE IF EXISTS `url_logging_info_51_203`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_203` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_203`
--

LOCK TABLES `url_logging_info_51_203` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_203` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_203` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_204`
--

DROP TABLE IF EXISTS `url_logging_info_51_204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_204` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_204`
--

LOCK TABLES `url_logging_info_51_204` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_204` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_205`
--

DROP TABLE IF EXISTS `url_logging_info_51_205`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_205` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_205`
--

LOCK TABLES `url_logging_info_51_205` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_205` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_205` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_206`
--

DROP TABLE IF EXISTS `url_logging_info_51_206`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_206` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_206`
--

LOCK TABLES `url_logging_info_51_206` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_206` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_206` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_207`
--

DROP TABLE IF EXISTS `url_logging_info_51_207`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_207` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_207`
--

LOCK TABLES `url_logging_info_51_207` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_207` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_207` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_208`
--

DROP TABLE IF EXISTS `url_logging_info_51_208`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_208` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_208`
--

LOCK TABLES `url_logging_info_51_208` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_208` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_208` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_209`
--

DROP TABLE IF EXISTS `url_logging_info_51_209`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_209` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_209`
--

LOCK TABLES `url_logging_info_51_209` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_209` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_209` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_211`
--

DROP TABLE IF EXISTS `url_logging_info_51_211`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_211` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_211`
--

LOCK TABLES `url_logging_info_51_211` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_211` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_211` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_212`
--

DROP TABLE IF EXISTS `url_logging_info_51_212`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_212` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_212`
--

LOCK TABLES `url_logging_info_51_212` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_212` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_212` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_213`
--

DROP TABLE IF EXISTS `url_logging_info_51_213`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_213` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_213`
--

LOCK TABLES `url_logging_info_51_213` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_213` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_213` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_214`
--

DROP TABLE IF EXISTS `url_logging_info_51_214`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_214` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_214`
--

LOCK TABLES `url_logging_info_51_214` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_214` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_214` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_215`
--

DROP TABLE IF EXISTS `url_logging_info_51_215`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_215` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_215`
--

LOCK TABLES `url_logging_info_51_215` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_215` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_215` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_216`
--

DROP TABLE IF EXISTS `url_logging_info_51_216`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_216` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_216`
--

LOCK TABLES `url_logging_info_51_216` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_216` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_216` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_219`
--

DROP TABLE IF EXISTS `url_logging_info_51_219`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_219` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_219`
--

LOCK TABLES `url_logging_info_51_219` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_219` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_219` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_221`
--

DROP TABLE IF EXISTS `url_logging_info_51_221`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_221` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_221`
--

LOCK TABLES `url_logging_info_51_221` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_221` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_221` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_222`
--

DROP TABLE IF EXISTS `url_logging_info_51_222`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_222` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_222`
--

LOCK TABLES `url_logging_info_51_222` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_222` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_222` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_225`
--

DROP TABLE IF EXISTS `url_logging_info_51_225`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_225` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_225`
--

LOCK TABLES `url_logging_info_51_225` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_225` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_225` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_226`
--

DROP TABLE IF EXISTS `url_logging_info_51_226`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_226` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_226`
--

LOCK TABLES `url_logging_info_51_226` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_226` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_226` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_4`
--

DROP TABLE IF EXISTS `url_logging_info_51_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_4` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_4`
--

LOCK TABLES `url_logging_info_51_4` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_46`
--

DROP TABLE IF EXISTS `url_logging_info_51_46`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_46` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_46`
--

LOCK TABLES `url_logging_info_51_46` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_46` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_46` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_57`
--

DROP TABLE IF EXISTS `url_logging_info_51_57`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_57` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_57`
--

LOCK TABLES `url_logging_info_51_57` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_57` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_57` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_58`
--

DROP TABLE IF EXISTS `url_logging_info_51_58`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_58` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_58`
--

LOCK TABLES `url_logging_info_51_58` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_58` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_58` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_59`
--

DROP TABLE IF EXISTS `url_logging_info_51_59`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_59` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_59`
--

LOCK TABLES `url_logging_info_51_59` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_59` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_59` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_68`
--

DROP TABLE IF EXISTS `url_logging_info_51_68`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_68` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_68`
--

LOCK TABLES `url_logging_info_51_68` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_68` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_68` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_69`
--

DROP TABLE IF EXISTS `url_logging_info_51_69`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_69` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_69`
--

LOCK TABLES `url_logging_info_51_69` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_69` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_69` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_73`
--

DROP TABLE IF EXISTS `url_logging_info_51_73`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_73` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_73`
--

LOCK TABLES `url_logging_info_51_73` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_73` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_73` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_74`
--

DROP TABLE IF EXISTS `url_logging_info_51_74`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_74` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_74`
--

LOCK TABLES `url_logging_info_51_74` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_74` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_74` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_75`
--

DROP TABLE IF EXISTS `url_logging_info_51_75`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_75` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_75`
--

LOCK TABLES `url_logging_info_51_75` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_75` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_75` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_76`
--

DROP TABLE IF EXISTS `url_logging_info_51_76`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_76` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_76`
--

LOCK TABLES `url_logging_info_51_76` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_76` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_76` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_83`
--

DROP TABLE IF EXISTS `url_logging_info_51_83`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_83` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_83`
--

LOCK TABLES `url_logging_info_51_83` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_83` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_83` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_84`
--

DROP TABLE IF EXISTS `url_logging_info_51_84`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_84` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_84`
--

LOCK TABLES `url_logging_info_51_84` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_84` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_84` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_94`
--

DROP TABLE IF EXISTS `url_logging_info_51_94`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_94` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_94`
--

LOCK TABLES `url_logging_info_51_94` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_94` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_94` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url_logging_info_51_95`
--

DROP TABLE IF EXISTS `url_logging_info_51_95`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_logging_info_51_95` (
  `ServerID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `HotspotID` int(11) NOT NULL,
  `URL` varchar(400) NOT NULL,
  `Status` int(11) NOT NULL,
  `Date` datetime NOT NULL,
  `MAC` varchar(20) NOT NULL DEFAULT '00:00:00:00:00:00',
  PRIMARY KEY (`ServerID`,`CustomerID`,`HotspotID`,`URL`,`Date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url_logging_info_51_95`
--

LOCK TABLES `url_logging_info_51_95` WRITE;
/*!40000 ALTER TABLE `url_logging_info_51_95` DISABLE KEYS */;
/*!40000 ALTER TABLE `url_logging_info_51_95` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `user`
--

DROP TABLE IF EXISTS `user`;
/*!50001 DROP VIEW IF EXISTS `user`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `user` (
  `id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `usertype` tinyint NOT NULL,
  `userstatus` tinyint NOT NULL,
  `restrictlocation` tinyint NOT NULL,
  `createddate` tinyint NOT NULL,
  `lastrechargedate` tinyint NOT NULL,
  `expirydate` tinyint NOT NULL,
  `statuschangedate` tinyint NOT NULL,
  `statuschangereason` tinyint NOT NULL,
  `lastmodified` tinyint NOT NULL,
  `customer_id` tinyint NOT NULL,
  `location_id` tinyint NOT NULL,
  `plan_id` tinyint NOT NULL,
  `policy_id` tinyint NOT NULL,
  `prepaidgroup_id` tinyint NOT NULL,
  `fullname` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `age` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `country` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `aptnumber` tinyint NOT NULL,
  `zipcode` tinyint NOT NULL,
  `dob` tinyint NOT NULL,
  `gender` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_extra_info`
--

DROP TABLE IF EXISTS `user_extra_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_extra_info` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) DEFAULT NULL,
  `CardNumber` varchar(40) DEFAULT NULL,
  `CardType` varchar(20) DEFAULT NULL,
  `CardExpiryDate` date DEFAULT NULL,
  `CvvNumber` varchar(10) DEFAULT NULL,
  `SecretQuestion` varchar(150) DEFAULT NULL,
  `SecretAnswer` varchar(100) DEFAULT NULL,
  `CustomerId` int(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `UserId` (`UserId`),
  CONSTRAINT `radius_user_id` FOREIGN KEY (`UserId`) REFERENCES `radius`.`radius_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_extra_info`
--

LOCK TABLES `user_extra_info` WRITE;
/*!40000 ALTER TABLE `user_extra_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_extra_info` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `user_portal_review`
--

DROP TABLE IF EXISTS `user_portal_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_portal_review` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `Rating` int(10) DEFAULT NULL,
  `Question` varchar(255) DEFAULT NULL,
  `Review` varchar(255) DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `MacAddress` (`MacAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_portal_review`
--

LOCK TABLES `user_portal_review` WRITE;
/*!40000 ALTER TABLE `user_portal_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_portal_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_transactions`
--

DROP TABLE IF EXISTS `user_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_transactions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `VoucherCode` varchar(12) DEFAULT NULL,
  `VoucherBatchId` int(10) DEFAULT NULL,
  `TransactionAmount` varchar(10) DEFAULT NULL,
  `Currency` varchar(10) DEFAULT NULL,
  `PlanId` int(11) DEFAULT NULL,
  `UserType` varchar(50) DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  `PaymentGatewayName` varchar(100) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `TransactionId` varchar(25) DEFAULT NULL,
  `RetailerDistributorsId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_transactions_ibfk_1` (`CustomerId`),
  KEY `user_transactions_ibfk_2` (`LocationId`),
  CONSTRAINT `user_transactions_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_transactions_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_transactions`
--

LOCK TABLES `user_transactions` WRITE;
/*!40000 ALTER TABLE `user_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useragent`
--

DROP TABLE IF EXISTS `useragent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useragent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) DEFAULT NULL,
  `UserIpAddress` varchar(40) DEFAULT NULL,
  `UserMacAddress` varchar(17) DEFAULT NULL,
  `UserAgent` varchar(255) DEFAULT NULL,
  `BrowserMajor` varchar(100) DEFAULT NULL,
  `BrowserName` varchar(100) DEFAULT NULL,
  `BrowserVersion` varchar(100) DEFAULT NULL,
  `EngineName` varchar(100) DEFAULT NULL,
  `EngineVersion` varchar(100) DEFAULT NULL,
  `OSName` varchar(100) DEFAULT NULL,
  `OSVersion` varchar(100) DEFAULT NULL,
  `DeviceModel` varchar(100) DEFAULT NULL,
  `DeviceType` varchar(100) DEFAULT NULL,
  `DeviceVendor` varchar(100) DEFAULT NULL,
  `CPUArchitecture` varchar(100) DEFAULT NULL,
  `LoginStatus` tinyint(1) DEFAULT NULL,
  `LocationId` int(11) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `LogDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logdate` (`LogDate`),
  KEY `devicevendor` (`DeviceVendor`),
  KEY `useragent_ibfk_1` (`CustomerId`),
  KEY `useragent_ibfk_2` (`LocationId`),
  CONSTRAINT `useragent_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `useragent_ibfk_2` FOREIGN KEY (`LocationId`) REFERENCES `location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useragent`
--

LOCK TABLES `useragent` WRITE;
/*!40000 ALTER TABLE `useragent` DISABLE KEYS */;
/*!40000 ALTER TABLE `useragent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `userdevice`
--

DROP TABLE IF EXISTS `userdevice`;
/*!50001 DROP VIEW IF EXISTS `userdevice`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `userdevice` (
  `id` tinyint NOT NULL,
  `macaddress` tinyint NOT NULL,
  `created` tinyint NOT NULL,
  `user_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `userrestrictions`
--

DROP TABLE IF EXISTS `userrestrictions`;
/*!50001 DROP VIEW IF EXISTS `userrestrictions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `userrestrictions` (
  `user_id` tinyint NOT NULL,
  `lastmodified` tinyint NOT NULL,
  `validity` tinyint NOT NULL,
  `validity_unit` tinyint NOT NULL,
  `concurrency_limit` tinyint NOT NULL,
  `daily_session_limit` tinyint NOT NULL,
  `max_device_limit` tinyint NOT NULL,
  `uploadrate` tinyint NOT NULL,
  `uploadrate_unit` tinyint NOT NULL,
  `downloadrate` tinyint NOT NULL,
  `downloadrate_unit` tinyint NOT NULL,
  `total_bw_quota` tinyint NOT NULL,
  `total_bw_quota_unit` tinyint NOT NULL,
  `daily_bw_quota` tinyint NOT NULL,
  `daily_bw_quota_unit` tinyint NOT NULL,
  `total_time_quota` tinyint NOT NULL,
  `total_time_quota_unit` tinyint NOT NULL,
  `daily_time_quota` tinyint NOT NULL,
  `daily_time_quota_unit` tinyint NOT NULL,
  `session_timeout` tinyint NOT NULL,
  `session_timeout_unit` tinyint NOT NULL,
  `idle_timeout` tinyint NOT NULL,
  `idle_timeout_unit` tinyint NOT NULL,
  `fup` tinyint NOT NULL,
  `fup_downloadrate` tinyint NOT NULL,
  `fup_downloadrate_unit` tinyint NOT NULL,
  `fup_trigger_quota` tinyint NOT NULL,
  `fup_trigger_unit` tinyint NOT NULL,
  `fup_uploadrate` tinyint NOT NULL,
  `fup_uploadrate_unit` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `VenueName` varchar(100) DEFAULT NULL,
  `DeviceTypeId` int(10) unsigned DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Latitude` varchar(10) DEFAULT NULL,
  `Longitude` varchar(10) DEFAULT NULL,
  `ZoneId` int(11) DEFAULT NULL,
  `SiteTypeId` int(10) unsigned DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `NetworkAuthGroupId` int(11) DEFAULT NULL,
  `IsReserved` tinyint(1) DEFAULT 1,
  `CustomerId` int(11) DEFAULT NULL,
  `OperatorId` int(11) DEFAULT NULL,
  `DateCreated` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `venuename` (`VenueName`),
  KEY `venu` (`CustomerId`),
  KEY `venue_group` (`NetworkAuthGroupId`),
  CONSTRAINT `venue` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `venue_group` FOREIGN KEY (`NetworkAuthGroupId`) REFERENCES `network_auth_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_ad_campaignmap`
--

DROP TABLE IF EXISTS `vw_ad_campaignmap`;
/*!50001 DROP VIEW IF EXISTS `vw_ad_campaignmap`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_ad_campaignmap` (
  `campaignid` tinyint NOT NULL,
  `campaignweight` tinyint NOT NULL,
  `adid` tinyint NOT NULL,
  `admediaid` tinyint NOT NULL,
  `destinationlink` tinyint NOT NULL,
  `weight` tinyint NOT NULL,
  `totalimpressions` tinyint NOT NULL,
  `displaydays` tinyint NOT NULL,
  `displayhours` tinyint NOT NULL,
  `displaytime` tinyint NOT NULL,
  `adtype` tinyint NOT NULL,
  `gender` tinyint NOT NULL,
  `FromAge` tinyint NOT NULL,
  `ToAge` tinyint NOT NULL,
  `adscore` tinyint NOT NULL,
  `impressions` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ad_media`
--

DROP TABLE IF EXISTS `vw_ad_media`;
/*!50001 DROP VIEW IF EXISTS `vw_ad_media`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_ad_media` (
  `id` tinyint NOT NULL,
  `Image1` tinyint NOT NULL,
  `ImageSize1` tinyint NOT NULL,
  `ImageDimension1` tinyint NOT NULL,
  `ImageType1` tinyint NOT NULL,
  `Image2` tinyint NOT NULL,
  `ImageSize2` tinyint NOT NULL,
  `ImageDimension2` tinyint NOT NULL,
  `ImageType2` tinyint NOT NULL,
  `Image3` tinyint NOT NULL,
  `ImageSize3` tinyint NOT NULL,
  `ImageDimension3` tinyint NOT NULL,
  `ImageType3` tinyint NOT NULL,
  `CustomerId` tinyint NOT NULL,
  `VideoName` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_ad_statistics`
--

DROP TABLE IF EXISTS `vw_ad_statistics`;
/*!50001 DROP VIEW IF EXISTS `vw_ad_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `vw_ad_statistics` (
  `AdMediaId` tinyint NOT NULL,
  `Impressions` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `uc_syslog_configurations`
--

DROP TABLE IF EXISTS `uc_syslog_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uc_syslog_configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(11) DEFAULT NULL,
  `Server` text DEFAULT NULL,
  `Port` int(11) DEFAULT NULL,
  `UserName` varchar(150) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `DatabaseName` varchar(255) DEFAULT NULL,
  `IsEnable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `wallet_payment_temp`
--

DROP TABLE IF EXISTS `wallet_payment_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_payment_temp` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) NOT NULL,
  `OperatorId` int(10) NOT NULL,
  `ResellerTransactionsId` int(10) DEFAULT NULL,
  `OperatorName` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `CreditAmount` float DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `InvoiceNumber` varchar(100) DEFAULT NULL,
  `PaymentGatewayTypeId` int(10) DEFAULT NULL,
  `PaymentGatewayName` varchar(50) NOT NULL,
  `PaymentGatewayCurrencyCode` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_payment_temp`
--

LOCK TABLES `wallet_payment_temp` WRITE;
/*!40000 ALTER TABLE `wallet_payment_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_payment_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_payment_transaction`
--

DROP TABLE IF EXISTS `wallet_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_payment_transaction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CustomerId` int(10) DEFAULT NULL,
  `OperatorId` int(10) DEFAULT NULL,
  `ResellerTransactionsId` int(10) DEFAULT NULL,
  `OperatorName` varchar(50) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `InvoiceNumber` varchar(100) DEFAULT NULL,
  `PaymentGatewayTypeId` int(10) DEFAULT NULL,
  `PaymentGatewayName` varchar(50) DEFAULT NULL,
  `PaymentGatewayCurrencyCode` varchar(50) DEFAULT NULL,
  `TransactionID` varchar(50) DEFAULT NULL,
  `TransactionStatus` varchar(50) DEFAULT NULL,
  `TransactionReturnCode` varchar(50) DEFAULT NULL,
  `TransactionReturnMessage` varchar(100) DEFAULT NULL,
  `TransactionAmount` varchar(50) DEFAULT NULL,
  `TransactionDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_payment_transaction`
--

LOCK TABLES `wallet_payment_transaction` WRITE;
/*!40000 ALTER TABLE `wallet_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wani_app_certificate`
--

DROP TABLE IF EXISTS `wani_app_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wani_app_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expiry_time` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `app_id` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `certficate_key` text CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wani_app_certificate`
--

LOCK TABLES `wani_app_certificate` WRITE;
/*!40000 ALTER TABLE `wani_app_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wani_app_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wani_app_provider`
--

DROP TABLE IF EXISTS `wani_app_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wani_app_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `auth_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `rating` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `last_updated` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `is_blocked` int(10) NOT NULL DEFAULT 0,
  `is_local` tinyint(1) DEFAULT 0,
  `certificate` text DEFAULT NULL,
  `expiry_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `appid_keyexp` (`app_id`,`expiry_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wani_app_provider`
--

LOCK TABLES `wani_app_provider` WRITE;
/*!40000 ALTER TABLE `wani_app_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `wani_app_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wani_customer_appblock`
--

DROP TABLE IF EXISTS `wani_customer_appblock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wani_customer_appblock` (
  `customerid` int(11) DEFAULT NULL,
  `appid` varchar(50) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wani_customer_appblock`
--

LOCK TABLES `wani_customer_appblock` WRITE;
/*!40000 ALTER TABLE `wani_customer_appblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `wani_customer_appblock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wani_customer_mapping`
--

DROP TABLE IF EXISTS `wani_customer_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wani_customer_mapping` (
  `customerid` int(11) DEFAULT NULL,
  `appid` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `isblocked` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `customerid` (`customerid`,`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wani_customer_mapping`
--

LOCK TABLES `wani_customer_mapping` WRITE;
/*!40000 ALTER TABLE `wani_customer_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `wani_customer_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wani_pdoa`
--

DROP TABLE IF EXISTS `wani_pdoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wani_pdoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pdoa_id` varchar(50) CHARACTER SET latin1 NOT NULL,
  `email` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `rating` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `ap_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `last_updated` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `expiry_time` varchar(50) DEFAULT NULL,
  `certificate_key` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wani_pdoa_index` (`pdoa_id`),
  KEY `pdoa_id` (`pdoa_id`),
  KEY `pdoa_id_2` (`pdoa_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wani_pdoa`
--

LOCK TABLES `wani_pdoa` WRITE;
/*!40000 ALTER TABLE `wani_pdoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `wani_pdoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wani_pdoa_certificate`
--

DROP TABLE IF EXISTS `wani_pdoa_certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wani_pdoa_certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expiry_time` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `pdoa_id` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `certificate_key` text CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wani_pdoa_certificate`
--

LOCK TABLES `wani_pdoa_certificate` WRITE;
/*!40000 ALTER TABLE `wani_pdoa_certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wani_pdoa_certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `white_label_certs`
--

DROP TABLE IF EXISTS `white_label_certs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `white_label_certs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Cert` text DEFAULT NULL,
  `PrivateKey` text DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  CONSTRAINT `white_label_info_ibfk` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `white_label_certs`
--

LOCK TABLES `white_label_certs` WRITE;
/*!40000 ALTER TABLE `white_label_certs` DISABLE KEYS */;
/*!40000 ALTER TABLE `white_label_certs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `white_label_info`
--

DROP TABLE IF EXISTS `white_label_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `white_label_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `IsEnabled` TINYINT (1),
  `DashboardDomain` varchar(400) DEFAULT NULL,
  `DashboardCertId` int(11) DEFAULT NULL,
  `PortalDomain` varchar(400) DEFAULT NULL,
  `PortalCertId` int(11) DEFAULT NULL,
  `Logo` varchar(200) DEFAULT NULL,
  `LogoUrl` varchar(200) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `DomainType` varchar(50) DEFAULT NULL,
  `LogoIndex` varchar(200) DEFAULT NULL,
  `CustomerName` varchar(200) DEFAULT NULL,
  `PolicyDomain` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`),
  KEY `white_label_cert_id_1` (`DashboardCertId`),
  KEY `white_label_cert_id_2` (`PortalCertId`),
  CONSTRAINT `white_label_info_ibfk_3` FOREIGN KEY (`CustomerId`) REFERENCES `adm_customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `white_label_info`
--

LOCK TABLES `white_label_info` WRITE;
/*!40000 ALTER TABLE `white_label_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `white_label_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wifi_countrywise_frequency`
--

DROP TABLE IF EXISTS `wifi_countrywise_frequency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wifi_countrywise_frequency` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `Country` varchar(50) NOT NULL,
  `CountryCode` varchar(3) NOT NULL,
  `ChannelId` int(5) unsigned NOT NULL,
  `TxPower` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ChannelId` (`ChannelId`),
  KEY `CountryCodeIndex` (`CountryCode`),
  CONSTRAINT `wifi_countrywise_frequency_ibfk_1` FOREIGN KEY (`ChannelId`) REFERENCES `wifi_frequency_bands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wifi_countrywise_frequency`
--

LOCK TABLES `wifi_countrywise_frequency` WRITE;
/*!40000 ALTER TABLE `wifi_countrywise_frequency` DISABLE KEYS */;
INSERT INTO `wifi_countrywise_frequency` VALUES (1,'Albania','AL',1,26),(2,'Albania','AL',2,26),(3,'Albania','AL',3,26),(4,'Albania','AL',4,26),(5,'Albania','AL',5,26),(6,'Albania','AL',6,26),(7,'Albania','AL',7,26),(8,'Albania','AL',8,26),(9,'Albania','AL',9,26),(10,'Albania','AL',10,26),(11,'Albania','AL',11,26),(12,'Albania','AL',12,26),(13,'Albania','AL',13,26),(14,'Algeria','DZ',1,26),(15,'Algeria','DZ',2,26),(16,'Algeria','DZ',3,26),(17,'Algeria','DZ',4,26),(18,'Algeria','DZ',5,26),(19,'Algeria','DZ',6,26),(20,'Algeria','DZ',7,26),(21,'Algeria','DZ',8,26),(22,'Algeria','DZ',9,26),(23,'Algeria','DZ',10,26),(24,'Algeria','DZ',11,26),(25,'Algeria','DZ',12,26),(26,'Algeria','DZ',13,26),(27,'Argentina','AR',1,26),(28,'Argentina','AR',2,26),(29,'Argentina','AR',3,26),(30,'Argentina','AR',4,26),(31,'Argentina','AR',5,26),(32,'Argentina','AR',6,26),(33,'Argentina','AR',7,26),(34,'Argentina','AR',8,26),(35,'Argentina','AR',9,26),(36,'Argentina','AR',10,26),(37,'Argentina','AR',11,26),(38,'Argentina','AR',12,26),(39,'Argentina','AR',13,26),(40,'Argentina','AR',32,30),(41,'Argentina','AR',34,30),(42,'Argentina','AR',36,30),(43,'Argentina','AR',59,30),(44,'Argentina','AR',61,30),(45,'Argentina','AR',63,30),(46,'Argentina','AR',65,30),(47,'Armenia','AM',1,26),(48,'Armenia','AM',2,26),(49,'Armenia','AM',3,26),(50,'Armenia','AM',4,26),(51,'Armenia','AM',5,26),(52,'Armenia','AM',6,26),(53,'Armenia','AM',7,26),(54,'Armenia','AM',8,26),(55,'Armenia','AM',9,26),(56,'Armenia','AM',10,26),(57,'Armenia','AM',11,26),(58,'Armenia','AM',12,26),(59,'Armenia','AM',13,26),(60,'Armenia','AM',22,30),(61,'Armenia','AM',24,30),(62,'Armenia','AM',26,30),(63,'Armenia','AM',28,30),(64,'Armenia','AM',30,30),(65,'Armenia','AM',32,30),(66,'Armenia','AM',34,30),(67,'Armenia','AM',36,30),(68,'Australia','AU',1,26),(69,'Australia','AU',2,26),(70,'Australia','AU',3,26),(71,'Australia','AU',4,26),(72,'Australia','AU',5,26),(73,'Australia','AU',6,26),(74,'Australia','AU',7,26),(75,'Australia','AU',8,26),(76,'Australia','AU',9,26),(77,'Australia','AU',10,26),(78,'Australia','AU',11,26),(79,'Australia','AU',12,26),(80,'Australia','AU',13,26),(81,'Australia','AU',22,30),(82,'Australia','AU',24,30),(83,'Australia','AU',26,30),(84,'Australia','AU',28,30),(85,'Australia','AU',30,30),(86,'Australia','AU',32,30),(87,'Australia','AU',34,30),(88,'Australia','AU',36,30),(89,'Australia','AU',59,30),(90,'Australia','AU',61,30),(91,'Australia','AU',63,30),(92,'Australia','AU',65,30),(93,'Australia','AU',66,30),(94,'Austria','AT',1,26),(95,'Austria','AT',2,26),(96,'Austria','AT',3,26),(97,'Austria','AT',4,26),(98,'Austria','AT',5,26),(99,'Austria','AT',6,26),(100,'Austria','AT',7,26),(101,'Austria','AT',8,26),(102,'Austria','AT',9,26),(103,'Austria','AT',10,26),(104,'Austria','AT',11,26),(105,'Austria','AT',12,26),(106,'Austria','AT',13,26),(107,'Austria','AT',22,30),(108,'Austria','AT',24,30),(109,'Austria','AT',26,30),(110,'Austria','AT',28,30),(111,'Azerbaijan','AZ',1,26),(112,'Azerbaijan','AZ',2,26),(113,'Azerbaijan','AZ',3,26),(114,'Azerbaijan','AZ',4,26),(115,'Azerbaijan','AZ',5,26),(116,'Azerbaijan','AZ',6,26),(117,'Azerbaijan','AZ',7,26),(118,'Azerbaijan','AZ',8,26),(119,'Azerbaijan','AZ',9,26),(120,'Azerbaijan','AZ',10,26),(121,'Azerbaijan','AZ',11,26),(122,'Azerbaijan','AZ',12,26),(123,'Azerbaijan','AZ',13,26),(124,'Azerbaijan','AZ',22,30),(125,'Azerbaijan','AZ',24,30),(126,'Azerbaijan','AZ',26,30),(127,'Azerbaijan','AZ',28,30),(128,'Azerbaijan','AZ',30,30),(129,'Azerbaijan','AZ',32,30),(130,'Azerbaijan','AZ',34,30),(131,'Azerbaijan','AZ',36,30),(132,'Bahrain','BH',1,26),(133,'Bahrain','BH',2,26),(134,'Bahrain','BH',3,26),(135,'Bahrain','BH',4,26),(136,'Bahrain','BH',5,26),(137,'Bahrain','BH',6,26),(138,'Bahrain','BH',7,26),(139,'Bahrain','BH',8,26),(140,'Bahrain','BH',9,26),(141,'Bahrain','BH',10,26),(142,'Bahrain','BH',11,26),(143,'Bahrain','BH',12,26),(144,'Bahrain','BH',13,26),(145,'Belarus','BY',1,26),(146,'Belarus','BY',2,26),(147,'Belarus','BY',3,26),(148,'Belarus','BY',4,26),(149,'Belarus','BY',5,26),(150,'Belarus','BY',6,26),(151,'Belarus','BY',7,26),(152,'Belarus','BY',8,26),(153,'Belarus','BY',9,26),(154,'Belarus','BY',10,26),(155,'Belarus','BY',11,26),(156,'Belarus','BY',12,26),(157,'Belarus','BY',13,26),(158,'Belgium','BE',1,26),(159,'Belgium','BE',2,26),(160,'Belgium','BE',3,26),(161,'Belgium','BE',4,26),(162,'Belgium','BE',5,26),(163,'Belgium','BE',6,26),(164,'Belgium','BE',7,26),(165,'Belgium','BE',8,26),(166,'Belgium','BE',9,26),(167,'Belgium','BE',10,26),(168,'Belgium','BE',11,26),(169,'Belgium','BE',12,26),(170,'Belgium','BE',13,26),(171,'Belgium','BE',22,30),(172,'Belgium','BE',24,30),(173,'Belgium','BE',26,30),(174,'Belgium','BE',28,30),(175,'Belgium','BE',30,30),(176,'Belgium','BE',32,30),(177,'Belgium','BE',34,30),(178,'Belgium','BE',36,30),(179,'Belize','BZ',1,26),(180,'Belize','BZ',2,26),(181,'Belize','BZ',3,26),(182,'Belize','BZ',4,26),(183,'Belize','BZ',5,26),(184,'Belize','BZ',6,26),(185,'Belize','BZ',7,26),(186,'Belize','BZ',8,26),(187,'Belize','BZ',9,26),(188,'Belize','BZ',10,26),(189,'Belize','BZ',11,26),(190,'Belize','BZ',12,26),(191,'Belize','BZ',13,26),(192,'Belize','BZ',59,30),(193,'Belize','BZ',61,30),(194,'Belize','BZ',63,30),(195,'Belize','BZ',65,30),(196,'Belize','BZ',66,30),(197,'Bolivia','BO',1,26),(198,'Bolivia','BO',2,26),(199,'Bolivia','BO',3,26),(200,'Bolivia','BO',4,26),(201,'Bolivia','BO',5,26),(202,'Bolivia','BO',6,26),(203,'Bolivia','BO',7,26),(204,'Bolivia','BO',8,26),(205,'Bolivia','BO',9,26),(206,'Bolivia','BO',10,26),(207,'Bolivia','BO',11,26),(208,'Bolivia','BO',12,26),(209,'Bolivia','BO',13,26),(210,'Bolivia','BO',59,30),(211,'Bolivia','BO',61,30),(212,'Bolivia','BO',63,30),(213,'Bolivia','BO',65,30),(214,'Bolivia','BO',66,30),(215,'Brazil','BR',1,26),(216,'Brazil','BR',2,26),(217,'Brazil','BR',3,26),(218,'Brazil','BR',4,26),(219,'Brazil','BR',5,26),(220,'Brazil','BR',6,26),(221,'Brazil','BR',7,26),(222,'Brazil','BR',8,26),(223,'Brazil','BR',9,26),(224,'Brazil','BR',10,26),(225,'Brazil','BR',11,26),(226,'Brazil','BR',12,26),(227,'Brazil','BR',13,26),(228,'Brunei Darussalam','BN',1,26),(229,'Brunei Darussalam','BN',2,26),(230,'Brunei Darussalam','BN',3,26),(231,'Brunei Darussalam','BN',4,26),(232,'Brunei Darussalam','BN',5,26),(233,'Brunei Darussalam','BN',6,26),(234,'Brunei Darussalam','BN',7,26),(235,'Brunei Darussalam','BN',8,26),(236,'Brunei Darussalam','BN',9,26),(237,'Brunei Darussalam','BN',10,26),(238,'Brunei Darussalam','BN',11,26),(239,'Brunei Darussalam','BN',12,26),(240,'Brunei Darussalam','BN',13,26),(241,'Brunei Darussalam','BN',59,30),(242,'Brunei Darussalam','BN',61,30),(243,'Brunei Darussalam','BN',63,30),(244,'Brunei Darussalam','BN',65,30),(245,'Brunei Darussalam','BN',66,30),(246,'Bulgaria','BG',1,26),(247,'Bulgaria','BG',2,26),(248,'Bulgaria','BG',3,26),(249,'Bulgaria','BG',4,26),(250,'Bulgaria','BG',5,26),(251,'Bulgaria','BG',6,26),(252,'Bulgaria','BG',7,26),(253,'Bulgaria','BG',8,26),(254,'Bulgaria','BG',9,26),(255,'Bulgaria','BG',10,26),(256,'Bulgaria','BG',11,26),(257,'Bulgaria','BG',12,26),(258,'Bulgaria','BG',13,26),(259,'Bulgaria','BG',22,30),(260,'Bulgaria','BG',24,30),(261,'Bulgaria','BG',26,30),(262,'Bulgaria','BG',28,30),(263,'Bulgaria','BG',30,30),(264,'Bulgaria','BG',32,30),(265,'Bulgaria','BG',37,30),(266,'Bulgaria','BG',39,30),(267,'Bulgaria','BG',41,30),(268,'Bulgaria','BG',43,30),(269,'Bulgaria','BG',45,30),(270,'Bulgaria','BG',47,30),(271,'Bulgaria','BG',49,30),(272,'Bulgaria','BG',51,30),(273,'Bulgaria','BG',52,30),(274,'Bulgaria','BG',54,30),(275,'Bulgaria','BG',56,30),(276,'Canada','CA',1,26),(277,'Canada','CA',2,26),(278,'Canada','CA',3,26),(279,'Canada','CA',4,26),(280,'Canada','CA',5,26),(281,'Canada','CA',6,26),(282,'Canada','CA',7,26),(283,'Canada','CA',8,26),(284,'Canada','CA',9,26),(285,'Canada','CA',10,26),(286,'Canada','CA',11,26),(287,'Canada','CA',22,30),(288,'Canada','CA',24,30),(289,'Canada','CA',26,30),(290,'Canada','CA',28,30),(291,'Canada','CA',30,30),(292,'Canada','CA',32,30),(293,'Canada','CA',34,30),(294,'Canada','CA',36,30),(295,'Canada','CA',59,30),(296,'Canada','CA',61,30),(297,'Canada','CA',63,30),(298,'Canada','CA',65,30),(299,'Canada','CA',66,30),(300,'Chile','CL',1,26),(301,'Chile','CL',2,26),(302,'Chile','CL',3,26),(303,'Chile','CL',4,26),(304,'Chile','CL',5,26),(305,'Chile','CL',6,26),(306,'Chile','CL',7,26),(307,'Chile','CL',8,26),(308,'Chile','CL',9,26),(309,'Chile','CL',10,26),(310,'Chile','CL',11,26),(311,'Chile','CL',12,26),(312,'Chile','CL',13,26),(313,'Chile','CL',59,30),(314,'Chile','CL',61,30),(315,'Chile','CL',63,30),(316,'Chile','CL',65,30),(317,'Chile','CL',66,30),(318,'China','CN',1,26),(319,'China','CN',2,26),(320,'China','CN',3,26),(321,'China','CN',4,26),(322,'China','CN',5,26),(323,'China','CN',6,26),(324,'China','CN',7,26),(325,'China','CN',8,26),(326,'China','CN',9,26),(327,'China','CN',10,26),(328,'China','CN',11,26),(329,'China','CN',12,26),(330,'China','CN',13,26),(331,'China','CN',59,30),(332,'China','CN',61,30),(333,'China','CN',63,30),(334,'China','CN',65,30),(335,'China','CN',66,30),(336,'Colombia','CO',1,26),(337,'Colombia','CO',2,26),(338,'Colombia','CO',3,26),(339,'Colombia','CO',4,26),(340,'Colombia','CO',5,26),(341,'Colombia','CO',6,26),(342,'Colombia','CO',7,26),(343,'Colombia','CO',8,26),(344,'Colombia','CO',9,26),(345,'Colombia','CO',10,26),(346,'Colombia','CO',11,26),(347,'Colombia','CO',22,30),(348,'Colombia','CO',24,30),(349,'Colombia','CO',26,30),(350,'Colombia','CO',28,30),(351,'Colombia','CO',30,30),(352,'Colombia','CO',32,30),(353,'Colombia','CO',34,30),(354,'Colombia','CO',36,30),(355,'Colombia','CO',59,30),(356,'Colombia','CO',61,30),(357,'Colombia','CO',63,30),(358,'Colombia','CO',65,30),(359,'Colombia','CO',66,30),(360,'Costa Rica','CR',1,26),(361,'Costa Rica','CR',2,26),(362,'Costa Rica','CR',3,26),(363,'Costa Rica','CR',4,26),(364,'Costa Rica','CR',5,26),(365,'Costa Rica','CR',6,26),(366,'Costa Rica','CR',7,26),(367,'Costa Rica','CR',8,26),(368,'Costa Rica','CR',9,26),(369,'Costa Rica','CR',10,26),(370,'Costa Rica','CR',11,26),(371,'Costa Rica','CR',12,26),(372,'Costa Rica','CR',13,26),(373,'Croatia (Hrvatska)','HR',1,26),(374,'Croatia (Hrvatska)','HR',2,26),(375,'Croatia (Hrvatska)','HR',3,26),(376,'Croatia (Hrvatska)','HR',4,26),(377,'Croatia (Hrvatska)','HR',5,26),(378,'Croatia (Hrvatska)','HR',6,26),(379,'Croatia (Hrvatska)','HR',7,26),(380,'Croatia (Hrvatska)','HR',8,26),(381,'Croatia (Hrvatska)','HR',9,26),(382,'Croatia (Hrvatska)','HR',10,26),(383,'Croatia (Hrvatska)','HR',11,26),(384,'Croatia (Hrvatska)','HR',12,26),(385,'Croatia (Hrvatska)','HR',13,26),(386,'Croatia (Hrvatska)','HR',22,30),(387,'Croatia (Hrvatska)','HR',24,30),(388,'Croatia (Hrvatska)','HR',26,30),(389,'Croatia (Hrvatska)','HR',28,30),(390,'Croatia (Hrvatska)','HR',30,30),(391,'Croatia (Hrvatska)','HR',32,30),(392,'Croatia (Hrvatska)','HR',34,30),(393,'Croatia (Hrvatska)','HR',36,30),(394,'Cyprus','CY',1,26),(395,'Cyprus','CY',2,26),(396,'Cyprus','CY',3,26),(397,'Cyprus','CY',4,26),(398,'Cyprus','CY',5,26),(399,'Cyprus','CY',6,26),(400,'Cyprus','CY',7,26),(401,'Cyprus','CY',8,26),(402,'Cyprus','CY',9,26),(403,'Cyprus','CY',10,26),(404,'Cyprus','CY',11,26),(405,'Cyprus','CY',12,26),(406,'Cyprus','CY',13,26),(407,'Cyprus','CY',22,30),(408,'Cyprus','CY',24,30),(409,'Cyprus','CY',26,30),(410,'Cyprus','CY',28,30),(411,'Cyprus','CY',30,30),(412,'Cyprus','CY',32,30),(413,'Cyprus','CY',34,30),(414,'Cyprus','CY',36,30),(415,'Cyprus','CY',37,30),(416,'Cyprus','CY',39,30),(417,'Cyprus','CY',41,30),(418,'Cyprus','CY',43,30),(419,'Cyprus','CY',45,30),(420,'Cyprus','CY',47,30),(421,'Cyprus','CY',49,30),(422,'Cyprus','CY',51,30),(423,'Cyprus','CY',52,30),(424,'Cyprus','CY',54,30),(425,'Cyprus','CY',56,30),(426,'Czech Republic','CZ',1,26),(427,'Czech Republic','CZ',2,26),(428,'Czech Republic','CZ',3,26),(429,'Czech Republic','CZ',4,26),(430,'Czech Republic','CZ',5,26),(431,'Czech Republic','CZ',6,26),(432,'Czech Republic','CZ',7,26),(433,'Czech Republic','CZ',8,26),(434,'Czech Republic','CZ',9,26),(435,'Czech Republic','CZ',10,26),(436,'Czech Republic','CZ',11,26),(437,'Czech Republic','CZ',12,26),(438,'Czech Republic','CZ',13,26),(439,'Czech Republic','CZ',22,30),(440,'Czech Republic','CZ',24,30),(441,'Czech Republic','CZ',26,30),(442,'Czech Republic','CZ',28,30),(443,'Czech Republic','CZ',30,30),(444,'Czech Republic','CZ',32,30),(445,'Czech Republic','CZ',34,30),(446,'Czech Republic','CZ',36,30),(447,'Denmark','DK',1,26),(448,'Denmark','DK',2,26),(449,'Denmark','DK',3,26),(450,'Denmark','DK',4,26),(451,'Denmark','DK',5,26),(452,'Denmark','DK',6,26),(453,'Denmark','DK',7,26),(454,'Denmark','DK',8,26),(455,'Denmark','DK',9,26),(456,'Denmark','DK',10,26),(457,'Denmark','DK',11,26),(458,'Denmark','DK',12,26),(459,'Denmark','DK',13,26),(460,'Denmark','DK',22,30),(461,'Denmark','DK',24,30),(462,'Denmark','DK',26,30),(463,'Denmark','DK',28,30),(464,'Denmark','DK',30,30),(465,'Denmark','DK',32,30),(466,'Denmark','DK',34,30),(467,'Denmark','DK',36,30),(468,'Denmark','DK',37,30),(469,'Denmark','DK',39,30),(470,'Denmark','DK',41,30),(471,'Denmark','DK',43,30),(472,'Denmark','DK',45,30),(473,'Denmark','DK',47,30),(474,'Denmark','DK',49,30),(475,'Denmark','DK',51,30),(476,'Denmark','DK',52,30),(477,'Denmark','DK',54,30),(478,'Denmark','DK',56,30),(479,'Dominican Republic','DO',1,26),(480,'Dominican Republic','DO',2,26),(481,'Dominican Republic','DO',3,26),(482,'Dominican Republic','DO',4,26),(483,'Dominican Republic','DO',5,26),(484,'Dominican Republic','DO',6,26),(485,'Dominican Republic','DO',7,26),(486,'Dominican Republic','DO',8,26),(487,'Dominican Republic','DO',9,26),(488,'Dominican Republic','DO',10,26),(489,'Dominican Republic','DO',11,26),(490,'Dominican Republic','DO',22,30),(491,'Dominican Republic','DO',24,30),(492,'Dominican Republic','DO',26,30),(493,'Dominican Republic','DO',28,30),(494,'Dominican Republic','DO',30,30),(495,'Dominican Republic','DO',32,30),(496,'Dominican Republic','DO',34,30),(497,'Dominican Republic','DO',36,30),(498,'Dominican Republic','DO',59,30),(499,'Dominican Republic','DO',61,30),(500,'Dominican Republic','DO',63,30),(501,'Dominican Republic','DO',65,30),(502,'Dominican Republic','DO',66,30),(508,'Ecuador','EC',1,26),(509,'Ecuador','EC',2,26),(510,'Ecuador','EC',3,26),(511,'Ecuador','EC',4,26),(512,'Ecuador','EC',5,26),(513,'Ecuador','EC',6,26),(514,'Ecuador','EC',7,26),(515,'Ecuador','EC',8,26),(516,'Ecuador','EC',9,26),(517,'Ecuador','EC',10,26),(518,'Ecuador','EC',11,26),(519,'Ecuador','EC',12,26),(520,'Ecuador','EC',13,26),(521,'Egypt','EG',1,26),(522,'Egypt','EG',2,26),(523,'Egypt','EG',3,26),(524,'Egypt','EG',4,26),(525,'Egypt','EG',5,26),(526,'Egypt','EG',6,26),(527,'Egypt','EG',7,26),(528,'Egypt','EG',8,26),(529,'Egypt','EG',9,26),(530,'Egypt','EG',10,26),(531,'Egypt','EG',11,26),(532,'Egypt','EG',12,26),(533,'Egypt','EG',13,26),(534,'El Salvador','SV',1,26),(535,'El Salvador','SV',2,26),(536,'El Salvador','SV',3,26),(537,'El Salvador','SV',4,26),(538,'El Salvador','SV',5,26),(539,'El Salvador','SV',6,26),(540,'El Salvador','SV',7,26),(541,'El Salvador','SV',8,26),(542,'El Salvador','SV',9,26),(543,'El Salvador','SV',10,26),(544,'El Salvador','SV',11,26),(545,'El Salvador','SV',12,26),(546,'El Salvador','SV',13,26),(547,'Estonia','EE',1,26),(548,'Estonia','EE',2,26),(549,'Estonia','EE',3,26),(550,'Estonia','EE',4,26),(551,'Estonia','EE',5,26),(552,'Estonia','EE',6,26),(553,'Estonia','EE',7,26),(554,'Estonia','EE',8,26),(555,'Estonia','EE',9,26),(556,'Estonia','EE',10,26),(557,'Estonia','EE',11,26),(558,'Estonia','EE',12,26),(559,'Estonia','EE',13,26),(560,'Estonia','EE',22,30),(561,'Estonia','EE',24,30),(562,'Estonia','EE',26,30),(563,'Estonia','EE',28,30),(564,'Estonia','EE',30,30),(565,'Estonia','EE',32,30),(566,'Estonia','EE',34,30),(567,'Estonia','EE',36,30),(568,'Estonia','EE',37,30),(569,'Estonia','EE',39,30),(570,'Estonia','EE',41,30),(571,'Estonia','EE',43,30),(572,'Estonia','EE',45,30),(573,'Estonia','EE',47,30),(574,'Estonia','EE',49,30),(575,'Estonia','EE',51,30),(576,'Estonia','EE',52,30),(577,'Estonia','EE',54,30),(578,'Estonia','EE',56,30),(579,'Finland','FI',1,26),(580,'Finland','FI',2,26),(581,'Finland','FI',3,26),(582,'Finland','FI',4,26),(583,'Finland','FI',5,26),(584,'Finland','FI',6,26),(585,'Finland','FI',7,26),(586,'Finland','FI',8,26),(587,'Finland','FI',9,26),(588,'Finland','FI',10,26),(589,'Finland','FI',11,26),(590,'Finland','FI',12,26),(591,'Finland','FI',13,26),(592,'Finland','FI',22,30),(593,'Finland','FI',24,30),(594,'Finland','FI',26,30),(595,'Finland','FI',28,30),(596,'Finland','FI',30,30),(597,'Finland','FI',32,30),(598,'Finland','FI',34,30),(599,'Finland','FI',36,30),(600,'Finland','FI',37,30),(601,'Finland','FI',39,30),(602,'Finland','FI',41,30),(603,'Finland','FI',43,30),(604,'Finland','FI',45,30),(605,'Finland','FI',47,30),(606,'Finland','FI',49,30),(607,'Finland','FI',51,30),(608,'Finland','FI',52,30),(609,'Finland','FI',54,30),(610,'Finland','FI',56,30),(611,'France','FR',1,26),(612,'France','FR',2,26),(613,'France','FR',3,26),(614,'France','FR',4,26),(615,'France','FR',5,26),(616,'France','FR',6,26),(617,'France','FR',7,26),(618,'France','FR',8,26),(619,'France','FR',9,26),(620,'France','FR',10,26),(621,'France','FR',11,26),(622,'France','FR',12,26),(623,'France','FR',13,26),(624,'France','FR',22,30),(625,'France','FR',24,30),(626,'France','FR',26,30),(627,'France','FR',28,30),(628,'France','FR',30,30),(629,'France','FR',32,30),(630,'France','FR',34,30),(631,'France','FR',36,30),(632,'Georgia','GE',1,26),(633,'Georgia','GE',2,26),(634,'Georgia','GE',3,26),(635,'Georgia','GE',4,26),(636,'Georgia','GE',5,26),(637,'Georgia','GE',6,26),(638,'Georgia','GE',7,26),(639,'Georgia','GE',8,26),(640,'Georgia','GE',9,26),(641,'Georgia','GE',10,26),(642,'Georgia','GE',11,26),(643,'Georgia','GE',12,26),(644,'Georgia','GE',13,26),(645,'Georgia','GE',22,30),(646,'Georgia','GE',24,30),(647,'Georgia','GE',26,30),(648,'Georgia','GE',28,30),(649,'Georgia','GE',30,30),(650,'Georgia','GE',32,30),(651,'Georgia','GE',34,30),(652,'Georgia','GE',36,30),(653,'Germany','DE',1,26),(654,'Germany','DE',2,26),(655,'Germany','DE',3,26),(656,'Germany','DE',4,26),(657,'Germany','DE',5,26),(658,'Germany','DE',6,26),(659,'Germany','DE',7,26),(660,'Germany','DE',8,26),(661,'Germany','DE',9,26),(662,'Germany','DE',10,26),(663,'Germany','DE',11,26),(664,'Germany','DE',12,26),(665,'Germany','DE',13,26),(666,'Germany','DE',22,30),(667,'Germany','DE',24,30),(668,'Germany','DE',26,30),(669,'Germany','DE',28,30),(670,'Germany','DE',30,30),(671,'Germany','DE',32,30),(672,'Germany','DE',34,30),(673,'Germany','DE',36,30),(674,'Germany','DE',37,30),(675,'Germany','DE',39,30),(676,'Germany','DE',41,30),(677,'Germany','DE',43,30),(678,'Germany','DE',45,30),(679,'Germany','DE',47,30),(680,'Germany','DE',49,30),(681,'Germany','DE',51,30),(682,'Germany','DE',52,30),(683,'Germany','DE',54,30),(684,'Germany','DE',56,30),(685,'Greece','GR',1,26),(686,'Greece','GR',2,26),(687,'Greece','GR',3,26),(688,'Greece','GR',4,26),(689,'Greece','GR',5,26),(690,'Greece','GR',6,26),(691,'Greece','GR',7,26),(692,'Greece','GR',8,26),(693,'Greece','GR',9,26),(694,'Greece','GR',10,26),(695,'Greece','GR',11,26),(696,'Greece','GR',12,26),(697,'Greece','GR',13,26),(698,'Guatemala','GT',1,26),(699,'Guatemala','GT',2,26),(700,'Guatemala','GT',3,26),(701,'Guatemala','GT',4,26),(702,'Guatemala','GT',5,26),(703,'Guatemala','GT',6,26),(704,'Guatemala','GT',7,26),(705,'Guatemala','GT',8,26),(706,'Guatemala','GT',9,26),(707,'Guatemala','GT',10,26),(708,'Guatemala','GT',11,26),(709,'Guatemala','GT',22,30),(710,'Guatemala','GT',24,30),(711,'Guatemala','GT',26,30),(712,'Guatemala','GT',28,30),(713,'Guatemala','GT',30,30),(714,'Guatemala','GT',32,30),(715,'Guatemala','GT',34,30),(716,'Guatemala','GT',36,30),(717,'Guatemala','GT',59,30),(718,'Guatemala','GT',61,30),(719,'Guatemala','GT',63,30),(720,'Guatemala','GT',65,30),(721,'Guatemala','GT',66,30),(727,'Honduras','HN',1,26),(728,'Honduras','HN',2,26),(729,'Honduras','HN',3,26),(730,'Honduras','HN',4,26),(731,'Honduras','HN',5,26),(732,'Honduras','HN',6,26),(733,'Honduras','HN',7,26),(734,'Honduras','HN',8,26),(735,'Honduras','HN',9,26),(736,'Honduras','HN',10,26),(737,'Honduras','HN',11,26),(738,'Honduras','HN',12,26),(739,'Honduras','HN',13,26),(740,'Hong Kong','HK',1,26),(741,'Hong Kong','HK',2,26),(742,'Hong Kong','HK',3,26),(743,'Hong Kong','HK',4,26),(744,'Hong Kong','HK',5,26),(745,'Hong Kong','HK',6,26),(746,'Hong Kong','HK',7,26),(747,'Hong Kong','HK',8,26),(748,'Hong Kong','HK',9,26),(749,'Hong Kong','HK',10,26),(750,'Hong Kong','HK',11,26),(751,'Hong Kong','HK',12,26),(752,'Hong Kong','HK',13,26),(753,'Hong Kong','HK',22,30),(754,'Hong Kong','HK',24,30),(755,'Hong Kong','HK',26,30),(756,'Hong Kong','HK',28,30),(757,'Hong Kong','HK',30,30),(758,'Hong Kong','HK',32,30),(759,'Hong Kong','HK',34,30),(760,'Hong Kong','HK',36,30),(761,'Hong Kong','HK',59,30),(762,'Hong Kong','HK',61,30),(763,'Hong Kong','HK',63,30),(764,'Hong Kong','HK',65,30),(765,'Hong Kong','HK',66,30),(766,'Hungary','HU',1,26),(767,'Hungary','HU',2,26),(768,'Hungary','HU',3,26),(769,'Hungary','HU',4,26),(770,'Hungary','HU',5,26),(771,'Hungary','HU',6,26),(772,'Hungary','HU',7,26),(773,'Hungary','HU',8,26),(774,'Hungary','HU',9,26),(775,'Hungary','HU',10,26),(776,'Hungary','HU',11,26),(777,'Hungary','HU',12,26),(778,'Hungary','HU',13,26),(779,'Hungary','HU',22,30),(780,'Hungary','HU',24,30),(781,'Hungary','HU',26,30),(782,'Hungary','HU',28,30),(783,'Iceland','IS',1,26),(784,'Iceland','IS',2,26),(785,'Iceland','IS',3,26),(786,'Iceland','IS',4,26),(787,'Iceland','IS',5,26),(788,'Iceland','IS',6,26),(789,'Iceland','IS',7,26),(790,'Iceland','IS',8,26),(791,'Iceland','IS',9,26),(792,'Iceland','IS',10,26),(793,'Iceland','IS',11,26),(794,'Iceland','IS',12,26),(795,'Iceland','IS',13,26),(796,'Iceland','IS',22,30),(797,'Iceland','IS',24,30),(798,'Iceland','IS',26,30),(799,'Iceland','IS',28,30),(800,'Iceland','IS',30,30),(801,'Iceland','IS',32,30),(802,'Iceland','IS',34,30),(803,'Iceland','IS',36,30),(804,'Iceland','IS',37,30),(805,'Iceland','IS',39,30),(806,'Iceland','IS',41,30),(807,'Iceland','IS',43,30),(808,'Iceland','IS',45,30),(809,'Iceland','IS',47,30),(810,'Iceland','IS',49,30),(811,'Iceland','IS',51,30),(812,'Iceland','IS',52,30),(813,'Iceland','IS',54,30),(814,'Iceland','IS',56,30),(815,'India','IN',1,30),(816,'India','IN',2,30),(817,'India','IN',3,30),(818,'India','IN',4,30),(819,'India','IN',5,30),(820,'India','IN',6,30),(821,'India','IN',7,30),(822,'India','IN',8,30),(823,'India','IN',9,30),(824,'India','IN',10,30),(825,'India','IN',11,30),(826,'India','IN',12,30),(827,'India','IN',13,30),(828,'Indonesia','ID',1,26),(829,'Indonesia','ID',2,26),(830,'Indonesia','ID',3,26),(831,'Indonesia','ID',4,26),(832,'Indonesia','ID',5,26),(833,'Indonesia','ID',6,26),(834,'Indonesia','ID',7,26),(835,'Indonesia','ID',8,26),(836,'Indonesia','ID',9,26),(837,'Indonesia','ID',10,26),(838,'Indonesia','ID',11,26),(839,'Indonesia','ID',12,26),(840,'Indonesia','ID',13,26),(841,'Iran (Islamic Republic of)','IR',1,26),(842,'Iran (Islamic Republic of)','IR',2,26),(843,'Iran (Islamic Republic of)','IR',3,26),(844,'Iran (Islamic Republic of)','IR',4,26),(845,'Iran (Islamic Republic of)','IR',5,26),(846,'Iran (Islamic Republic of)','IR',6,26),(847,'Iran (Islamic Republic of)','IR',7,26),(848,'Iran (Islamic Republic of)','IR',8,26),(849,'Iran (Islamic Republic of)','IR',9,26),(850,'Iran (Islamic Republic of)','IR',10,26),(851,'Iran (Islamic Republic of)','IR',11,26),(852,'Iran (Islamic Republic of)','IR',12,26),(853,'Iran (Islamic Republic of)','IR',13,26),(854,'Iran (Islamic Republic of)','IR',59,30),(855,'Iran (Islamic Republic of)','IR',61,30),(856,'Iran (Islamic Republic of)','IR',63,30),(857,'Iran (Islamic Republic of)','IR',65,30),(858,'Iran (Islamic Republic of)','IR',66,30),(859,'Ireland','IE',1,26),(860,'Ireland','IE',2,26),(861,'Ireland','IE',3,26),(862,'Ireland','IE',4,26),(863,'Ireland','IE',5,26),(864,'Ireland','IE',6,26),(865,'Ireland','IE',7,26),(866,'Ireland','IE',8,26),(867,'Ireland','IE',9,26),(868,'Ireland','IE',10,26),(869,'Ireland','IE',11,26),(870,'Ireland','IE',12,26),(871,'Ireland','IE',13,26),(872,'Ireland','IE',22,30),(873,'Ireland','IE',24,30),(874,'Ireland','IE',26,30),(875,'Ireland','IE',28,30),(876,'Ireland','IE',30,30),(877,'Ireland','IE',32,30),(878,'Ireland','IE',34,30),(879,'Ireland','IE',36,30),(880,'Ireland','IE',37,30),(881,'Ireland','IE',39,30),(882,'Ireland','IE',41,30),(883,'Ireland','IE',43,30),(884,'Ireland','IE',45,30),(885,'Ireland','IE',47,30),(886,'Ireland','IE',49,30),(887,'Ireland','IE',51,30),(888,'Ireland','IE',52,30),(889,'Ireland','IE',54,30),(890,'Ireland','IE',56,30),(891,'Israel','IL',1,26),(892,'Israel','IL',2,26),(893,'Israel','IL',3,26),(894,'Israel','IL',4,26),(895,'Israel','IL',5,26),(896,'Israel','IL',6,26),(897,'Israel','IL',7,26),(898,'Israel','IL',8,26),(899,'Israel','IL',9,26),(900,'Israel','IL',10,26),(901,'Israel','IL',11,26),(902,'Israel','IL',12,26),(903,'Israel','IL',13,26),(904,'Italy','IT',1,26),(905,'Italy','IT',2,26),(906,'Italy','IT',3,26),(907,'Italy','IT',4,26),(908,'Italy','IT',5,26),(909,'Italy','IT',6,26),(910,'Italy','IT',7,26),(911,'Italy','IT',8,26),(912,'Italy','IT',9,26),(913,'Italy','IT',10,26),(914,'Italy','IT',11,26),(915,'Italy','IT',12,26),(916,'Italy','IT',13,26),(917,'Italy','IT',22,30),(918,'Italy','IT',24,30),(919,'Italy','IT',26,30),(920,'Italy','IT',28,30),(921,'Italy','IT',30,30),(922,'Italy','IT',32,30),(923,'Italy','IT',34,30),(924,'Italy','IT',36,30),(925,'Italy','IT',37,30),(926,'Italy','IT',39,30),(927,'Italy','IT',41,30),(928,'Italy','IT',43,30),(929,'Italy','IT',45,30),(930,'Italy','IT',47,30),(931,'Italy','IT',49,30),(932,'Italy','IT',51,30),(933,'Italy','IT',52,30),(934,'Italy','IT',54,30),(935,'Italy','IT',56,30),(936,'Japan','JP',1,26),(937,'Japan','JP',2,26),(938,'Japan','JP',3,26),(939,'Japan','JP',4,26),(940,'Japan','JP',5,26),(941,'Japan','JP',6,26),(942,'Japan','JP',7,26),(943,'Japan','JP',8,26),(944,'Japan','JP',9,26),(945,'Japan','JP',10,26),(946,'Japan','JP',11,26),(947,'Japan','JP',12,26),(948,'Japan','JP',13,26),(949,'Japan','JP',14,26),(950,'Japan','JP',21,30),(951,'Japan','JP',23,30),(954,'','J1',1,26),(955,'','J1',2,26),(956,'','J1',3,26),(957,'','J1',4,26),(958,'','J1',5,26),(959,'','J1',6,26),(960,'','J1',7,26),(961,'','J1',8,26),(962,'','J1',9,26),(963,'','J1',10,26),(964,'','J1',11,26),(965,'','J1',12,26),(966,'','J1',13,26),(967,'','J1',14,26),(968,'','J1',21,30),(969,'','J1',23,30),(972,'','J2',1,26),(973,'','J2',2,26),(974,'','J2',3,26),(975,'','J2',4,26),(976,'','J2',5,26),(977,'','J2',6,26),(978,'','J2',7,26),(979,'','J2',8,26),(980,'','J2',9,26),(981,'','J2',10,26),(982,'','J2',11,26),(983,'','J2',21,30),(984,'','J2',23,30),(987,'','J3',1,26),(988,'','J3',2,26),(989,'','J3',3,26),(990,'','J3',4,26),(991,'','J3',5,26),(992,'','J3',6,26),(993,'','J3',7,26),(994,'','J3',8,26),(995,'','J3',9,26),(996,'','J3',10,26),(997,'','J3',11,26),(998,'','J3',12,26),(999,'','J3',13,26),(1000,'','J3',14,26),(1005,'','J3',16,30),(1006,'','J3',19,30),(1007,'','J3',20,30),(1008,'','J3',21,30),(1009,'','J3',23,30),(1012,'','J4',1,26),(1013,'','J4',2,26),(1014,'','J4',3,26),(1015,'','J4',4,26),(1016,'','J4',5,26),(1017,'','J4',6,26),(1018,'','J4',7,26),(1019,'','J4',8,26),(1020,'','J4',9,26),(1021,'','J4',10,26),(1022,'','J4',11,26),(1023,'','J4',12,26),(1024,'','J4',13,26),(1025,'','J4',14,26),(1026,'','J4',21,30),(1027,'','J4',23,30),(1030,'','J5',1,26),(1031,'','J5',2,26),(1032,'','J5',3,26),(1033,'','J5',4,26),(1034,'','J5',5,26),(1035,'','J5',6,26),(1036,'','J5',7,26),(1037,'','J5',8,26),(1038,'','J5',9,26),(1039,'','J5',10,26),(1040,'','J5',11,26),(1041,'','J5',12,26),(1042,'','J5',13,26),(1043,'','J5',14,26),(1044,'','J5',21,30),(1045,'','J5',23,30),(1048,'Jordan','JO',1,26),(1049,'Jordan','JO',2,26),(1050,'Jordan','JO',3,26),(1051,'Jordan','JO',4,26),(1052,'Jordan','JO',5,26),(1053,'Jordan','JO',6,26),(1054,'Jordan','JO',7,26),(1055,'Jordan','JO',8,26),(1056,'Jordan','JO',9,26),(1057,'Jordan','JO',10,26),(1058,'Jordan','JO',11,26),(1059,'Jordan','JO',12,26),(1060,'Jordan','JO',13,26),(1061,'Kazakhstan','KZ',1,26),(1062,'Kazakhstan','KZ',2,26),(1063,'Kazakhstan','KZ',3,26),(1064,'Kazakhstan','KZ',4,26),(1065,'Kazakhstan','KZ',5,26),(1066,'Kazakhstan','KZ',6,26),(1067,'Kazakhstan','KZ',7,26),(1068,'Kazakhstan','KZ',8,26),(1069,'Kazakhstan','KZ',9,26),(1070,'Kazakhstan','KZ',10,26),(1071,'Kazakhstan','KZ',11,26),(1072,'Kazakhstan','KZ',12,26),(1073,'Kazakhstan','KZ',13,26),(1074,'Korea, Republic of','KR',1,26),(1075,'Korea, Republic of','KR',2,26),(1076,'Korea, Republic of','KR',3,26),(1077,'Korea, Republic of','KR',4,26),(1078,'Korea, Republic of','KR',5,26),(1079,'Korea, Republic of','KR',6,26),(1080,'Korea, Republic of','KR',7,26),(1081,'Korea, Republic of','KR',8,26),(1082,'Korea, Republic of','KR',9,26),(1083,'Korea, Republic of','KR',10,26),(1084,'Korea, Republic of','KR',11,26),(1085,'Korea, Republic of','KR',12,26),(1086,'Korea, Republic of','KR',13,26),(1087,'Korea, Republic of','KR',59,30),(1088,'Korea, Republic of','KR',61,30),(1089,'Korea, Republic of','KR',63,30),(1090,'Korea, Republic of','KR',65,30),(1104,'','K2',1,26),(1105,'','K2',2,26),(1106,'','K2',3,26),(1107,'','K2',4,26),(1108,'','K2',5,26),(1109,'','K2',6,26),(1110,'','K2',7,26),(1111,'','K2',8,26),(1112,'','K2',9,26),(1113,'','K2',10,26),(1114,'','K2',11,26),(1115,'','K2',12,26),(1116,'','K2',13,26),(1117,'','K2',59,30),(1118,'','K2',61,30),(1119,'','K2',63,30),(1120,'','K2',65,30),(1121,'Kuwait','KW',1,26),(1122,'Kuwait','KW',2,26),(1123,'Kuwait','KW',3,26),(1124,'Kuwait','KW',4,26),(1125,'Kuwait','KW',5,26),(1126,'Kuwait','KW',6,26),(1127,'Kuwait','KW',7,26),(1128,'Kuwait','KW',8,26),(1129,'Kuwait','KW',9,26),(1130,'Kuwait','KW',10,26),(1131,'Kuwait','KW',11,26),(1132,'Kuwait','KW',12,26),(1133,'Kuwait','KW',13,26),(1134,'Latvia','LV',1,26),(1135,'Latvia','LV',2,26),(1136,'Latvia','LV',3,26),(1137,'Latvia','LV',4,26),(1138,'Latvia','LV',5,26),(1139,'Latvia','LV',6,26),(1140,'Latvia','LV',7,26),(1141,'Latvia','LV',8,26),(1142,'Latvia','LV',9,26),(1143,'Latvia','LV',10,26),(1144,'Latvia','LV',11,26),(1145,'Latvia','LV',12,26),(1146,'Latvia','LV',13,26),(1147,'Lebanon','LB',1,26),(1148,'Lebanon','LB',2,26),(1149,'Lebanon','LB',3,26),(1150,'Lebanon','LB',4,26),(1151,'Lebanon','LB',5,26),(1152,'Lebanon','LB',6,26),(1153,'Lebanon','LB',7,26),(1154,'Lebanon','LB',8,26),(1155,'Lebanon','LB',9,26),(1156,'Lebanon','LB',10,26),(1157,'Lebanon','LB',11,26),(1158,'Lebanon','LB',12,26),(1159,'Lebanon','LB',13,26),(1160,'Liechtenstein','LI',1,26),(1161,'Liechtenstein','LI',2,26),(1162,'Liechtenstein','LI',3,26),(1163,'Liechtenstein','LI',4,26),(1164,'Liechtenstein','LI',5,26),(1165,'Liechtenstein','LI',6,26),(1166,'Liechtenstein','LI',7,26),(1167,'Liechtenstein','LI',8,26),(1168,'Liechtenstein','LI',9,26),(1169,'Liechtenstein','LI',10,26),(1170,'Liechtenstein','LI',11,26),(1171,'Liechtenstein','LI',12,26),(1172,'Liechtenstein','LI',13,26),(1173,'Liechtenstein','LI',22,30),(1174,'Liechtenstein','LI',24,30),(1175,'Liechtenstein','LI',26,30),(1176,'Liechtenstein','LI',28,30),(1177,'Lithuania','LT',1,26),(1178,'Lithuania','LT',2,26),(1179,'Lithuania','LT',3,26),(1180,'Lithuania','LT',4,26),(1181,'Lithuania','LT',5,26),(1182,'Lithuania','LT',6,26),(1183,'Lithuania','LT',7,26),(1184,'Lithuania','LT',8,26),(1185,'Lithuania','LT',9,26),(1186,'Lithuania','LT',10,26),(1187,'Lithuania','LT',11,26),(1188,'Lithuania','LT',12,26),(1189,'Lithuania','LT',13,26),(1190,'Lithuania','LT',22,30),(1191,'Lithuania','LT',24,30),(1192,'Lithuania','LT',26,30),(1193,'Lithuania','LT',28,30),(1194,'Lithuania','LT',30,30),(1195,'Lithuania','LT',32,30),(1196,'Lithuania','LT',34,30),(1197,'Lithuania','LT',36,30),(1198,'Lithuania','LT',37,30),(1199,'Lithuania','LT',39,30),(1200,'Lithuania','LT',41,30),(1201,'Lithuania','LT',43,30),(1202,'Lithuania','LT',45,30),(1203,'Lithuania','LT',47,30),(1204,'Lithuania','LT',49,30),(1205,'Lithuania','LT',51,30),(1206,'Lithuania','LT',52,30),(1207,'Lithuania','LT',54,30),(1208,'Lithuania','LT',56,30),(1209,'Luxembourg','LU',1,26),(1210,'Luxembourg','LU',2,26),(1211,'Luxembourg','LU',3,26),(1212,'Luxembourg','LU',4,26),(1213,'Luxembourg','LU',5,26),(1214,'Luxembourg','LU',6,26),(1215,'Luxembourg','LU',7,26),(1216,'Luxembourg','LU',8,26),(1217,'Luxembourg','LU',9,26),(1218,'Luxembourg','LU',10,26),(1219,'Luxembourg','LU',11,26),(1220,'Luxembourg','LU',12,26),(1221,'Luxembourg','LU',13,26),(1222,'Luxembourg','LU',22,30),(1223,'Luxembourg','LU',24,30),(1224,'Luxembourg','LU',26,30),(1225,'Luxembourg','LU',28,30),(1226,'Luxembourg','LU',30,30),(1227,'Luxembourg','LU',32,30),(1228,'Luxembourg','LU',34,30),(1229,'Luxembourg','LU',36,30),(1230,'Luxembourg','LU',37,30),(1231,'Luxembourg','LU',39,30),(1232,'Luxembourg','LU',41,30),(1233,'Luxembourg','LU',43,30),(1234,'Luxembourg','LU',45,30),(1235,'Luxembourg','LU',47,30),(1236,'Luxembourg','LU',49,30),(1237,'Luxembourg','LU',51,30),(1238,'Luxembourg','LU',52,30),(1239,'Luxembourg','LU',54,30),(1240,'Luxembourg','LU',56,30),(1241,'Macau','MO',1,26),(1242,'Macau','MO',2,26),(1243,'Macau','MO',3,26),(1244,'Macau','MO',4,26),(1245,'Macau','MO',5,26),(1246,'Macau','MO',6,26),(1247,'Macau','MO',7,26),(1248,'Macau','MO',8,26),(1249,'Macau','MO',9,26),(1250,'Macau','MO',10,26),(1251,'Macau','MO',11,26),(1252,'Macau','MO',12,26),(1253,'Macau','MO',13,26),(1254,'Macau','MO',22,30),(1255,'Macau','MO',24,30),(1256,'Macau','MO',26,30),(1257,'Macau','MO',28,30),(1258,'Macau','MO',30,30),(1259,'Macau','MO',32,30),(1260,'Macau','MO',34,30),(1261,'Macau','MO',36,30),(1262,'Macau','MO',59,30),(1263,'Macau','MO',61,30),(1264,'Macau','MO',63,30),(1265,'Macau','MO',65,30),(1266,'Macau','MO',66,30),(1267,'Macedonia, The Former Yugoslav Republic of','MK',1,26),(1268,'Macedonia, The Former Yugoslav Republic of','MK',2,26),(1269,'Macedonia, The Former Yugoslav Republic of','MK',3,26),(1270,'Macedonia, The Former Yugoslav Republic of','MK',4,26),(1271,'Macedonia, The Former Yugoslav Republic of','MK',5,26),(1272,'Macedonia, The Former Yugoslav Republic of','MK',6,26),(1273,'Macedonia, The Former Yugoslav Republic of','MK',7,26),(1274,'Macedonia, The Former Yugoslav Republic of','MK',8,26),(1275,'Macedonia, The Former Yugoslav Republic of','MK',9,26),(1276,'Macedonia, The Former Yugoslav Republic of','MK',10,26),(1277,'Macedonia, The Former Yugoslav Republic of','MK',11,26),(1278,'Macedonia, The Former Yugoslav Republic of','MK',12,26),(1279,'Macedonia, The Former Yugoslav Republic of','MK',13,26),(1280,'Malaysia','MY',1,26),(1281,'Malaysia','MY',2,26),(1282,'Malaysia','MY',3,26),(1283,'Malaysia','MY',4,26),(1284,'Malaysia','MY',5,26),(1285,'Malaysia','MY',6,26),(1286,'Malaysia','MY',7,26),(1287,'Malaysia','MY',8,26),(1288,'Malaysia','MY',9,26),(1289,'Malaysia','MY',10,26),(1290,'Malaysia','MY',11,26),(1291,'Malaysia','MY',12,26),(1292,'Malaysia','MY',13,26),(1293,'Mexico','MX',1,26),(1294,'Mexico','MX',2,26),(1295,'Mexico','MX',3,26),(1296,'Mexico','MX',4,26),(1297,'Mexico','MX',5,26),(1298,'Mexico','MX',6,26),(1299,'Mexico','MX',7,26),(1300,'Mexico','MX',8,26),(1301,'Mexico','MX',9,26),(1302,'Mexico','MX',10,26),(1303,'Mexico','MX',11,26),(1304,'Mexico','MX',22,30),(1305,'Mexico','MX',24,30),(1306,'Mexico','MX',26,30),(1307,'Mexico','MX',28,30),(1308,'Mexico','MX',30,30),(1309,'Mexico','MX',32,30),(1310,'Mexico','MX',34,30),(1311,'Mexico','MX',36,30),(1312,'Mexico','MX',59,30),(1313,'Mexico','MX',61,30),(1314,'Mexico','MX',63,30),(1315,'Mexico','MX',65,30),(1316,'Mexico','MX',66,30),(1322,'Monaco','MC',1,26),(1323,'Monaco','MC',2,26),(1324,'Monaco','MC',3,26),(1325,'Monaco','MC',4,26),(1326,'Monaco','MC',5,26),(1327,'Monaco','MC',6,26),(1328,'Monaco','MC',7,26),(1329,'Monaco','MC',8,26),(1330,'Monaco','MC',9,26),(1331,'Monaco','MC',10,26),(1332,'Monaco','MC',11,26),(1333,'Monaco','MC',12,26),(1334,'Monaco','MC',13,26),(1335,'Monaco','MC',22,30),(1336,'Monaco','MC',24,30),(1337,'Monaco','MC',26,30),(1338,'Monaco','MC',28,30),(1339,'Monaco','MC',30,30),(1340,'Monaco','MC',32,30),(1341,'Monaco','MC',34,30),(1342,'Monaco','MC',36,30),(1343,'Morocco','MA',1,26),(1344,'Morocco','MA',2,26),(1345,'Morocco','MA',3,26),(1346,'Morocco','MA',4,26),(1347,'Morocco','MA',5,26),(1348,'Morocco','MA',6,26),(1349,'Morocco','MA',7,26),(1350,'Morocco','MA',8,26),(1351,'Morocco','MA',9,26),(1352,'Morocco','MA',10,26),(1353,'Morocco','MA',11,26),(1354,'Morocco','MA',12,26),(1355,'Morocco','MA',13,26),(1356,'Netherlands','NL',1,26),(1357,'Netherlands','NL',2,26),(1358,'Netherlands','NL',3,26),(1359,'Netherlands','NL',4,26),(1360,'Netherlands','NL',5,26),(1361,'Netherlands','NL',6,26),(1362,'Netherlands','NL',7,26),(1363,'Netherlands','NL',8,26),(1364,'Netherlands','NL',9,26),(1365,'Netherlands','NL',10,26),(1366,'Netherlands','NL',11,26),(1367,'Netherlands','NL',12,26),(1368,'Netherlands','NL',13,26),(1369,'Netherlands','NL',22,30),(1370,'Netherlands','NL',24,30),(1371,'Netherlands','NL',26,30),(1372,'Netherlands','NL',28,30),(1373,'Netherlands','NL',30,30),(1374,'Netherlands','NL',32,30),(1375,'Netherlands','NL',34,30),(1376,'Netherlands','NL',36,30),(1377,'Netherlands','NL',37,30),(1378,'Netherlands','NL',39,30),(1379,'Netherlands','NL',41,30),(1380,'Netherlands','NL',43,30),(1381,'Netherlands','NL',45,30),(1382,'Netherlands','NL',47,30),(1383,'Netherlands','NL',49,30),(1384,'Netherlands','NL',51,30),(1385,'Netherlands','NL',52,30),(1386,'Netherlands','NL',54,30),(1387,'Netherlands','NL',56,30),(1388,'New Zealand','NZ',1,26),(1389,'New Zealand','NZ',2,26),(1390,'New Zealand','NZ',3,26),(1391,'New Zealand','NZ',4,26),(1392,'New Zealand','NZ',5,26),(1393,'New Zealand','NZ',6,26),(1394,'New Zealand','NZ',7,26),(1395,'New Zealand','NZ',8,26),(1396,'New Zealand','NZ',9,26),(1397,'New Zealand','NZ',10,26),(1398,'New Zealand','NZ',11,26),(1399,'New Zealand','NZ',12,26),(1400,'New Zealand','NZ',13,26),(1401,'New Zealand','NZ',22,30),(1402,'New Zealand','NZ',24,30),(1403,'New Zealand','NZ',26,30),(1404,'New Zealand','NZ',28,30),(1405,'New Zealand','NZ',30,30),(1406,'New Zealand','NZ',32,30),(1407,'New Zealand','NZ',34,30),(1408,'New Zealand','NZ',36,30),(1409,'New Zealand','NZ',59,30),(1410,'New Zealand','NZ',61,30),(1411,'New Zealand','NZ',63,30),(1412,'New Zealand','NZ',65,30),(1413,'New Zealand','NZ',66,30),(1414,'Norway','NO',1,26),(1415,'Norway','NO',2,26),(1416,'Norway','NO',3,26),(1417,'Norway','NO',4,26),(1418,'Norway','NO',5,26),(1419,'Norway','NO',6,26),(1420,'Norway','NO',7,26),(1421,'Norway','NO',8,26),(1422,'Norway','NO',9,26),(1423,'Norway','NO',10,26),(1424,'Norway','NO',11,26),(1425,'Norway','NO',12,26),(1426,'Norway','NO',13,26),(1427,'Norway','NO',22,30),(1428,'Norway','NO',24,30),(1429,'Norway','NO',26,30),(1430,'Norway','NO',28,30),(1431,'Norway','NO',30,30),(1432,'Norway','NO',32,30),(1433,'Norway','NO',34,30),(1434,'Norway','NO',36,30),(1435,'Norway','NO',37,30),(1436,'Norway','NO',39,30),(1437,'Norway','NO',41,30),(1438,'Norway','NO',43,30),(1439,'Norway','NO',45,30),(1440,'Norway','NO',47,30),(1441,'Norway','NO',49,30),(1442,'Norway','NO',51,30),(1443,'Norway','NO',52,30),(1444,'Norway','NO',54,30),(1445,'Norway','NO',56,30),(1446,'Oman','OM',1,26),(1447,'Oman','OM',2,26),(1448,'Oman','OM',3,26),(1449,'Oman','OM',4,26),(1450,'Oman','OM',5,26),(1451,'Oman','OM',6,26),(1452,'Oman','OM',7,26),(1453,'Oman','OM',8,26),(1454,'Oman','OM',9,26),(1455,'Oman','OM',10,26),(1456,'Oman','OM',11,26),(1457,'Oman','OM',12,26),(1458,'Oman','OM',13,26),(1459,'Pakistan','PK',1,26),(1460,'Pakistan','PK',2,26),(1461,'Pakistan','PK',3,26),(1462,'Pakistan','PK',4,26),(1463,'Pakistan','PK',5,26),(1464,'Pakistan','PK',6,26),(1465,'Pakistan','PK',7,26),(1466,'Pakistan','PK',8,26),(1467,'Pakistan','PK',9,26),(1468,'Pakistan','PK',10,26),(1469,'Pakistan','PK',11,26),(1470,'Pakistan','PK',12,26),(1471,'Pakistan','PK',13,26),(1472,'Panama','PA',1,26),(1473,'Panama','PA',2,26),(1474,'Panama','PA',3,26),(1475,'Panama','PA',4,26),(1476,'Panama','PA',5,26),(1477,'Panama','PA',6,26),(1478,'Panama','PA',7,26),(1479,'Panama','PA',8,26),(1480,'Panama','PA',9,26),(1481,'Panama','PA',10,26),(1482,'Panama','PA',11,26),(1483,'Panama','PA',22,30),(1484,'Panama','PA',24,30),(1485,'Panama','PA',26,30),(1486,'Panama','PA',28,30),(1487,'Panama','PA',30,30),(1488,'Panama','PA',32,30),(1489,'Panama','PA',34,30),(1490,'Panama','PA',36,30),(1491,'Panama','PA',59,30),(1492,'Panama','PA',61,30),(1493,'Panama','PA',63,30),(1494,'Panama','PA',65,30),(1495,'Panama','PA',66,30),(1501,'Peru','PE',1,26),(1502,'Peru','PE',2,26),(1503,'Peru','PE',3,26),(1504,'Peru','PE',4,26),(1505,'Peru','PE',5,26),(1506,'Peru','PE',6,26),(1507,'Peru','PE',7,26),(1508,'Peru','PE',8,26),(1509,'Peru','PE',9,26),(1510,'Peru','PE',10,26),(1511,'Peru','PE',11,26),(1512,'Peru','PE',12,26),(1513,'Peru','PE',13,26),(1514,'Philippines','PH',1,26),(1515,'Philippines','PH',2,26),(1516,'Philippines','PH',3,26),(1517,'Philippines','PH',4,26),(1518,'Philippines','PH',5,26),(1519,'Philippines','PH',6,26),(1520,'Philippines','PH',7,26),(1521,'Philippines','PH',8,26),(1522,'Philippines','PH',9,26),(1523,'Philippines','PH',10,26),(1524,'Philippines','PH',11,26),(1525,'Philippines','PH',12,26),(1526,'Philippines','PH',13,26),(1527,'Philippines','PH',22,30),(1528,'Philippines','PH',24,30),(1529,'Philippines','PH',26,30),(1530,'Philippines','PH',28,30),(1531,'Philippines','PH',30,30),(1532,'Philippines','PH',32,30),(1533,'Philippines','PH',34,30),(1534,'Philippines','PH',36,30),(1535,'Philippines','PH',59,30),(1536,'Philippines','PH',61,30),(1537,'Philippines','PH',63,30),(1538,'Philippines','PH',65,30),(1539,'Philippines','PH',66,30),(1545,'Poland','PL',1,26),(1546,'Poland','PL',2,26),(1547,'Poland','PL',3,26),(1548,'Poland','PL',4,26),(1549,'Poland','PL',5,26),(1550,'Poland','PL',6,26),(1551,'Poland','PL',7,26),(1552,'Poland','PL',8,26),(1553,'Poland','PL',9,26),(1554,'Poland','PL',10,26),(1555,'Poland','PL',11,26),(1556,'Poland','PL',12,26),(1557,'Poland','PL',13,26),(1558,'Poland','PL',22,30),(1559,'Poland','PL',24,30),(1560,'Poland','PL',26,30),(1561,'Poland','PL',28,30),(1562,'Poland','PL',30,30),(1563,'Poland','PL',32,30),(1564,'Poland','PL',34,30),(1565,'Poland','PL',36,30),(1566,'Poland','PL',37,30),(1567,'Poland','PL',39,30),(1568,'Poland','PL',41,30),(1569,'Poland','PL',43,30),(1570,'Poland','PL',45,30),(1571,'Poland','PL',47,30),(1572,'Poland','PL',49,30),(1573,'Poland','PL',51,30),(1574,'Poland','PL',52,30),(1575,'Poland','PL',54,30),(1576,'Poland','PL',56,30),(1577,'Portugal','PT',1,26),(1578,'Portugal','PT',2,26),(1579,'Portugal','PT',3,26),(1580,'Portugal','PT',4,26),(1581,'Portugal','PT',5,26),(1582,'Portugal','PT',6,26),(1583,'Portugal','PT',7,26),(1584,'Portugal','PT',8,26),(1585,'Portugal','PT',9,26),(1586,'Portugal','PT',10,26),(1587,'Portugal','PT',11,26),(1588,'Portugal','PT',12,26),(1589,'Portugal','PT',13,26),(1590,'Portugal','PT',22,30),(1591,'Portugal','PT',24,30),(1592,'Portugal','PT',26,30),(1593,'Portugal','PT',28,30),(1594,'Portugal','PT',30,30),(1595,'Portugal','PT',32,30),(1596,'Portugal','PT',34,30),(1597,'Portugal','PT',36,30),(1598,'Portugal','PT',37,30),(1599,'Portugal','PT',39,30),(1600,'Portugal','PT',41,30),(1601,'Portugal','PT',43,30),(1602,'Portugal','PT',45,30),(1603,'Portugal','PT',47,30),(1604,'Portugal','PT',49,30),(1605,'Portugal','PT',51,30),(1606,'Portugal','PT',52,30),(1607,'Portugal','PT',54,30),(1608,'Portugal','PT',56,30),(1609,'Puerto Rico','PR',1,26),(1610,'Puerto Rico','PR',2,26),(1611,'Puerto Rico','PR',3,26),(1612,'Puerto Rico','PR',4,26),(1613,'Puerto Rico','PR',5,26),(1614,'Puerto Rico','PR',6,26),(1615,'Puerto Rico','PR',7,26),(1616,'Puerto Rico','PR',8,26),(1617,'Puerto Rico','PR',9,26),(1618,'Puerto Rico','PR',10,26),(1619,'Puerto Rico','PR',11,26),(1620,'Puerto Rico','PR',22,30),(1621,'Puerto Rico','PR',24,30),(1622,'Puerto Rico','PR',26,30),(1623,'Puerto Rico','PR',28,30),(1624,'Puerto Rico','PR',30,30),(1625,'Puerto Rico','PR',32,30),(1626,'Puerto Rico','PR',34,30),(1627,'Puerto Rico','PR',36,30),(1628,'Puerto Rico','PR',59,30),(1629,'Puerto Rico','PR',61,30),(1630,'Puerto Rico','PR',63,30),(1631,'Puerto Rico','PR',65,30),(1632,'Puerto Rico','PR',66,30),(1638,'Qatar','QA',1,26),(1639,'Qatar','QA',2,26),(1640,'Qatar','QA',3,26),(1641,'Qatar','QA',4,26),(1642,'Qatar','QA',5,26),(1643,'Qatar','QA',6,26),(1644,'Qatar','QA',7,26),(1645,'Qatar','QA',8,26),(1646,'Qatar','QA',9,26),(1647,'Qatar','QA',10,26),(1648,'Qatar','QA',11,26),(1649,'Qatar','QA',12,26),(1650,'Qatar','QA',13,26),(1651,'Romania','RO',1,26),(1652,'Romania','RO',2,26),(1653,'Romania','RO',3,26),(1654,'Romania','RO',4,26),(1655,'Romania','RO',5,26),(1656,'Romania','RO',6,26),(1657,'Romania','RO',7,26),(1658,'Romania','RO',8,26),(1659,'Romania','RO',9,26),(1660,'Romania','RO',10,26),(1661,'Romania','RO',11,26),(1662,'Romania','RO',12,26),(1663,'Romania','RO',13,26),(1664,'Russia','RU',1,26),(1665,'Russia','RU',2,26),(1666,'Russia','RU',3,26),(1667,'Russia','RU',4,26),(1668,'Russia','RU',5,26),(1669,'Russia','RU',6,26),(1670,'Russia','RU',7,26),(1671,'Russia','RU',8,26),(1672,'Russia','RU',9,26),(1673,'Russia','RU',10,26),(1674,'Russia','RU',11,26),(1675,'Russia','RU',12,26),(1676,'Russia','RU',13,26),(1677,'Saudi Arabia','SA',1,26),(1678,'Saudi Arabia','SA',2,26),(1679,'Saudi Arabia','SA',3,26),(1680,'Saudi Arabia','SA',4,26),(1681,'Saudi Arabia','SA',5,26),(1682,'Saudi Arabia','SA',6,26),(1683,'Saudi Arabia','SA',7,26),(1684,'Saudi Arabia','SA',8,26),(1685,'Saudi Arabia','SA',9,26),(1686,'Saudi Arabia','SA',10,26),(1687,'Saudi Arabia','SA',11,26),(1688,'Saudi Arabia','SA',12,26),(1689,'Saudi Arabia','SA',13,26),(1690,'Singapore','SG',1,26),(1691,'Singapore','SG',2,26),(1692,'Singapore','SG',3,26),(1693,'Singapore','SG',4,26),(1694,'Singapore','SG',5,26),(1695,'Singapore','SG',6,26),(1696,'Singapore','SG',7,26),(1697,'Singapore','SG',8,26),(1698,'Singapore','SG',9,26),(1699,'Singapore','SG',10,26),(1700,'Singapore','SG',11,26),(1701,'Singapore','SG',12,26),(1702,'Singapore','SG',13,26),(1703,'Singapore','SG',22,30),(1704,'Singapore','SG',24,30),(1705,'Singapore','SG',26,30),(1706,'Singapore','SG',28,30),(1707,'Singapore','SG',59,30),(1708,'Singapore','SG',61,30),(1709,'Singapore','SG',63,30),(1710,'Singapore','SG',65,30),(1711,'Singapore','SG',66,30),(1712,'Slovakia (Slovak Republic)','SK',1,26),(1713,'Slovakia (Slovak Republic)','SK',2,26),(1714,'Slovakia (Slovak Republic)','SK',3,26),(1715,'Slovakia (Slovak Republic)','SK',4,26),(1716,'Slovakia (Slovak Republic)','SK',5,26),(1717,'Slovakia (Slovak Republic)','SK',6,26),(1718,'Slovakia (Slovak Republic)','SK',7,26),(1719,'Slovakia (Slovak Republic)','SK',8,26),(1720,'Slovakia (Slovak Republic)','SK',9,26),(1721,'Slovakia (Slovak Republic)','SK',10,26),(1722,'Slovakia (Slovak Republic)','SK',11,26),(1723,'Slovakia (Slovak Republic)','SK',12,26),(1724,'Slovakia (Slovak Republic)','SK',13,26),(1725,'Slovakia (Slovak Republic)','SK',22,30),(1726,'Slovakia (Slovak Republic)','SK',24,30),(1727,'Slovakia (Slovak Republic)','SK',26,30),(1728,'Slovakia (Slovak Republic)','SK',28,30),(1729,'Slovakia (Slovak Republic)','SK',30,30),(1730,'Slovakia (Slovak Republic)','SK',32,30),(1731,'Slovakia (Slovak Republic)','SK',34,30),(1732,'Slovakia (Slovak Republic)','SK',36,30),(1733,'Slovenia','SI',1,26),(1734,'Slovenia','SI',2,26),(1735,'Slovenia','SI',3,26),(1736,'Slovenia','SI',4,26),(1737,'Slovenia','SI',5,26),(1738,'Slovenia','SI',6,26),(1739,'Slovenia','SI',7,26),(1740,'Slovenia','SI',8,26),(1741,'Slovenia','SI',9,26),(1742,'Slovenia','SI',10,26),(1743,'Slovenia','SI',11,26),(1744,'Slovenia','SI',12,26),(1745,'Slovenia','SI',13,26),(1746,'Slovenia','SI',22,30),(1747,'Slovenia','SI',24,30),(1748,'Slovenia','SI',26,30),(1749,'Slovenia','SI',28,30),(1750,'Slovenia','SI',30,30),(1751,'Slovenia','SI',32,30),(1752,'Slovenia','SI',34,30),(1753,'Slovenia','SI',36,30),(1754,'Slovenia','SI',37,30),(1755,'Slovenia','SI',39,30),(1756,'Slovenia','SI',41,30),(1757,'Slovenia','SI',43,30),(1758,'Slovenia','SI',45,30),(1759,'Slovenia','SI',47,30),(1760,'Slovenia','SI',49,30),(1761,'Slovenia','SI',51,30),(1762,'Slovenia','SI',52,30),(1763,'Slovenia','SI',54,30),(1764,'Slovenia','SI',56,30),(1765,'South Africa','ZA',1,26),(1766,'South Africa','ZA',2,26),(1767,'South Africa','ZA',3,26),(1768,'South Africa','ZA',4,26),(1769,'South Africa','ZA',5,26),(1770,'South Africa','ZA',6,26),(1771,'South Africa','ZA',7,26),(1772,'South Africa','ZA',8,26),(1773,'South Africa','ZA',9,26),(1774,'South Africa','ZA',10,26),(1775,'South Africa','ZA',11,26),(1776,'South Africa','ZA',12,26),(1777,'South Africa','ZA',13,26),(1778,'South Africa','ZA',22,30),(1779,'South Africa','ZA',24,30),(1780,'South Africa','ZA',26,30),(1781,'South Africa','ZA',28,30),(1782,'South Africa','ZA',30,30),(1783,'South Africa','ZA',32,30),(1784,'South Africa','ZA',34,30),(1785,'South Africa','ZA',36,30),(1786,'South Africa','ZA',37,30),(1787,'South Africa','ZA',39,30),(1788,'South Africa','ZA',41,30),(1789,'South Africa','ZA',43,30),(1790,'South Africa','ZA',45,30),(1791,'South Africa','ZA',47,30),(1792,'South Africa','ZA',49,30),(1793,'South Africa','ZA',51,30),(1794,'South Africa','ZA',52,30),(1795,'South Africa','ZA',54,30),(1796,'South Africa','ZA',56,30),(1797,'Spain','ES',1,26),(1798,'Spain','ES',2,26),(1799,'Spain','ES',3,26),(1800,'Spain','ES',4,26),(1801,'Spain','ES',5,26),(1802,'Spain','ES',6,26),(1803,'Spain','ES',7,26),(1804,'Spain','ES',8,26),(1805,'Spain','ES',9,26),(1806,'Spain','ES',10,26),(1807,'Spain','ES',11,26),(1808,'Spain','ES',12,26),(1809,'Spain','ES',13,26),(1810,'Spain','ES',22,30),(1811,'Spain','ES',24,30),(1812,'Spain','ES',26,30),(1813,'Spain','ES',28,30),(1814,'Spain','ES',30,30),(1815,'Spain','ES',32,30),(1816,'Spain','ES',34,30),(1817,'Spain','ES',36,30),(1818,'Spain','ES',37,30),(1819,'Spain','ES',39,30),(1820,'Spain','ES',41,30),(1821,'Spain','ES',43,30),(1822,'Spain','ES',45,30),(1823,'Spain','ES',47,30),(1824,'Spain','ES',49,30),(1825,'Spain','ES',51,30),(1826,'Spain','ES',52,30),(1827,'Spain','ES',54,30),(1828,'Spain','ES',56,30),(1829,'Sweden','SE',1,26),(1830,'Sweden','SE',2,26),(1831,'Sweden','SE',3,26),(1832,'Sweden','SE',4,26),(1833,'Sweden','SE',5,26),(1834,'Sweden','SE',6,26),(1835,'Sweden','SE',7,26),(1836,'Sweden','SE',8,26),(1837,'Sweden','SE',9,26),(1838,'Sweden','SE',10,26),(1839,'Sweden','SE',11,26),(1840,'Sweden','SE',12,26),(1841,'Sweden','SE',13,26),(1842,'Sweden','SE',22,30),(1843,'Sweden','SE',24,30),(1844,'Sweden','SE',26,30),(1845,'Sweden','SE',28,30),(1846,'Sweden','SE',30,30),(1847,'Sweden','SE',32,30),(1848,'Sweden','SE',34,30),(1849,'Sweden','SE',36,30),(1850,'Sweden','SE',37,30),(1851,'Sweden','SE',39,30),(1852,'Sweden','SE',41,30),(1853,'Sweden','SE',43,30),(1854,'Sweden','SE',45,30),(1855,'Sweden','SE',47,30),(1856,'Sweden','SE',49,30),(1857,'Sweden','SE',51,30),(1858,'Sweden','SE',52,30),(1859,'Sweden','SE',54,30),(1860,'Sweden','SE',56,30),(1861,'Switzerland','CH',1,26),(1862,'Switzerland','CH',2,26),(1863,'Switzerland','CH',3,26),(1864,'Switzerland','CH',4,26),(1865,'Switzerland','CH',5,26),(1866,'Switzerland','CH',6,26),(1867,'Switzerland','CH',7,26),(1868,'Switzerland','CH',8,26),(1869,'Switzerland','CH',9,26),(1870,'Switzerland','CH',10,26),(1871,'Switzerland','CH',11,26),(1872,'Switzerland','CH',12,26),(1873,'Switzerland','CH',13,26),(1874,'Switzerland','CH',22,30),(1875,'Switzerland','CH',24,30),(1876,'Switzerland','CH',26,30),(1877,'Switzerland','CH',28,30),(1878,'Syrian Arab Republic','SY',1,26),(1879,'Syrian Arab Republic','SY',2,26),(1880,'Syrian Arab Republic','SY',3,26),(1881,'Syrian Arab Republic','SY',4,26),(1882,'Syrian Arab Republic','SY',5,26),(1883,'Syrian Arab Republic','SY',6,26),(1884,'Syrian Arab Republic','SY',7,26),(1885,'Syrian Arab Republic','SY',8,26),(1886,'Syrian Arab Republic','SY',9,26),(1887,'Syrian Arab Republic','SY',10,26),(1888,'Syrian Arab Republic','SY',11,26),(1889,'Syrian Arab Republic','SY',12,26),(1890,'Syrian Arab Republic','SY',13,26),(1891,'Taiwan, Province of China','TW',1,26),(1892,'Taiwan, Province of China','TW',2,26),(1893,'Taiwan, Province of China','TW',3,26),(1894,'Taiwan, Province of China','TW',4,26),(1895,'Taiwan, Province of China','TW',5,26),(1896,'Taiwan, Province of China','TW',6,26),(1897,'Taiwan, Province of China','TW',7,26),(1898,'Taiwan, Province of China','TW',8,26),(1899,'Taiwan, Province of China','TW',9,26),(1900,'Taiwan, Province of China','TW',10,26),(1901,'Taiwan, Province of China','TW',11,26),(1902,'Taiwan, Province of China','TW',12,26),(1903,'Taiwan, Province of China','TW',13,26),(1904,'Taiwan, Province of China','TW',32,30),(1905,'Taiwan, Province of China','TW',34,30),(1906,'Taiwan, Province of China','TW',36,30),(1907,'Taiwan, Province of China','TW',59,30),(1908,'Taiwan, Province of China','TW',61,30),(1909,'Taiwan, Province of China','TW',63,30),(1910,'Taiwan, Province of China','TW',65,30),(1911,'Thailand','TH',1,26),(1912,'Thailand','TH',2,26),(1913,'Thailand','TH',3,26),(1914,'Thailand','TH',4,26),(1915,'Thailand','TH',5,26),(1916,'Thailand','TH',6,26),(1917,'Thailand','TH',7,26),(1918,'Thailand','TH',8,26),(1919,'Thailand','TH',9,26),(1920,'Thailand','TH',10,26),(1921,'Thailand','TH',11,26),(1922,'Thailand','TH',12,26),(1923,'Thailand','TH',13,26),(1924,'Thailand','TH',59,30),(1925,'Thailand','TH',61,30),(1926,'Thailand','TH',63,30),(1927,'Thailand','TH',65,30),(1928,'Trinidad and Tobago','TT',1,26),(1929,'Trinidad and Tobago','TT',2,26),(1930,'Trinidad and Tobago','TT',3,26),(1931,'Trinidad and Tobago','TT',4,26),(1932,'Trinidad and Tobago','TT',5,26),(1933,'Trinidad and Tobago','TT',6,26),(1934,'Trinidad and Tobago','TT',7,26),(1935,'Trinidad and Tobago','TT',8,26),(1936,'Trinidad and Tobago','TT',9,26),(1937,'Trinidad and Tobago','TT',10,26),(1938,'Trinidad and Tobago','TT',11,26),(1939,'Trinidad and Tobago','TT',12,26),(1940,'Trinidad and Tobago','TT',13,26),(1941,'Trinidad and Tobago','TT',22,30),(1942,'Trinidad and Tobago','TT',24,30),(1943,'Trinidad and Tobago','TT',26,30),(1944,'Trinidad and Tobago','TT',28,30),(1945,'Trinidad and Tobago','TT',30,30),(1946,'Trinidad and Tobago','TT',32,30),(1947,'Trinidad and Tobago','TT',34,30),(1948,'Trinidad and Tobago','TT',36,30),(1949,'Tunisia','TN',1,26),(1950,'Tunisia','TN',2,26),(1951,'Tunisia','TN',3,26),(1952,'Tunisia','TN',4,26),(1953,'Tunisia','TN',5,26),(1954,'Tunisia','TN',6,26),(1955,'Tunisia','TN',7,26),(1956,'Tunisia','TN',8,26),(1957,'Tunisia','TN',9,26),(1958,'Tunisia','TN',10,26),(1959,'Tunisia','TN',11,26),(1960,'Tunisia','TN',12,26),(1961,'Tunisia','TN',13,26),(1962,'Tunisia','TN',22,30),(1963,'Tunisia','TN',24,30),(1964,'Tunisia','TN',26,30),(1965,'Tunisia','TN',28,30),(1966,'Tunisia','TN',30,30),(1967,'Tunisia','TN',32,30),(1968,'Tunisia','TN',34,30),(1969,'Tunisia','TN',36,30),(1970,'Turkey','TR',1,26),(1971,'Turkey','TR',2,26),(1972,'Turkey','TR',3,26),(1973,'Turkey','TR',4,26),(1974,'Turkey','TR',5,26),(1975,'Turkey','TR',6,26),(1976,'Turkey','TR',7,26),(1977,'Turkey','TR',8,26),(1978,'Turkey','TR',9,26),(1979,'Turkey','TR',10,26),(1980,'Turkey','TR',11,26),(1981,'Turkey','TR',12,26),(1982,'Turkey','TR',13,26),(1983,'Turkey','TR',22,30),(1984,'Turkey','TR',24,30),(1985,'Turkey','TR',26,30),(1986,'Turkey','TR',28,30),(1987,'Turkey','TR',30,30),(1988,'Turkey','TR',32,30),(1989,'Turkey','TR',34,30),(1990,'Turkey','TR',36,30),(1991,'Ukraine','UA',1,26),(1992,'Ukraine','UA',2,26),(1993,'Ukraine','UA',3,26),(1994,'Ukraine','UA',4,26),(1995,'Ukraine','UA',5,26),(1996,'Ukraine','UA',6,26),(1997,'Ukraine','UA',7,26),(1998,'Ukraine','UA',8,26),(1999,'Ukraine','UA',9,26),(2000,'Ukraine','UA',10,26),(2001,'Ukraine','UA',11,26),(2002,'Ukraine','UA',12,26),(2003,'Ukraine','UA',13,26),(2004,'United Arab Emirates','AE',1,26),(2005,'United Arab Emirates','AE',2,26),(2006,'United Arab Emirates','AE',3,26),(2007,'United Arab Emirates','AE',4,26),(2008,'United Arab Emirates','AE',5,26),(2009,'United Arab Emirates','AE',6,26),(2010,'United Arab Emirates','AE',7,26),(2011,'United Arab Emirates','AE',8,26),(2012,'United Arab Emirates','AE',9,26),(2013,'United Arab Emirates','AE',10,26),(2014,'United Arab Emirates','AE',11,26),(2015,'United Arab Emirates','AE',12,26),(2016,'United Arab Emirates','AE',13,26),(2017,'United Kingdom','GB',1,26),(2018,'United Kingdom','GB',2,26),(2019,'United Kingdom','GB',3,26),(2020,'United Kingdom','GB',4,26),(2021,'United Kingdom','GB',5,26),(2022,'United Kingdom','GB',6,26),(2023,'United Kingdom','GB',7,26),(2024,'United Kingdom','GB',8,26),(2025,'United Kingdom','GB',9,26),(2026,'United Kingdom','GB',10,26),(2027,'United Kingdom','GB',11,26),(2028,'United Kingdom','GB',12,26),(2029,'United Kingdom','GB',13,26),(2030,'United Kingdom','GB',22,30),(2031,'United Kingdom','GB',24,30),(2032,'United Kingdom','GB',26,30),(2033,'United Kingdom','GB',28,30),(2034,'United Kingdom','GB',30,30),(2035,'United Kingdom','GB',32,30),(2036,'United Kingdom','GB',34,30),(2037,'United Kingdom','GB',36,30),(2038,'United Kingdom','GB',37,30),(2039,'United Kingdom','GB',39,30),(2040,'United Kingdom','GB',41,30),(2041,'United Kingdom','GB',43,30),(2042,'United Kingdom','GB',45,30),(2043,'United Kingdom','GB',47,30),(2044,'United Kingdom','GB',49,30),(2045,'United Kingdom','GB',51,30),(2046,'United Kingdom','GB',52,30),(2047,'United Kingdom','GB',54,30),(2048,'United Kingdom','GB',56,30),(2049,'United States','US',1,30),(2050,'United States','US',2,30),(2051,'United States','US',3,30),(2052,'United States','US',4,30),(2053,'United States','US',5,30),(2054,'United States','US',6,30),(2055,'United States','US',7,30),(2056,'United States','US',8,30),(2057,'United States','US',9,30),(2058,'United States','US',10,30),(2059,'United States','US',11,30),(2060,'United States','US',22,30),(2061,'United States','US',24,30),(2062,'United States','US',26,30),(2063,'United States','US',28,30),(2064,'United States','US',30,30),(2065,'United States','US',32,30),(2066,'United States','US',34,30),(2067,'United States','US',36,30),(2068,'United States','US',59,30),(2069,'United States','US',61,30),(2070,'United States','US',63,30),(2071,'United States','US',65,30),(2072,'United States','US',66,30),(2078,'Uruguay','UY',1,26),(2079,'Uruguay','UY',2,26),(2080,'Uruguay','UY',3,26),(2081,'Uruguay','UY',4,26),(2082,'Uruguay','UY',5,26),(2083,'Uruguay','UY',6,26),(2084,'Uruguay','UY',7,26),(2085,'Uruguay','UY',8,26),(2086,'Uruguay','UY',9,26),(2087,'Uruguay','UY',10,26),(2088,'Uruguay','UY',11,26),(2089,'Uruguay','UY',12,26),(2090,'Uruguay','UY',13,26),(2091,'Uruguay','UY',59,30),(2092,'Uruguay','UY',61,30),(2093,'Uruguay','UY',63,30),(2094,'Uruguay','UY',65,30),(2095,'Uzbekistan','UZ',1,26),(2096,'Uzbekistan','UZ',2,26),(2097,'Uzbekistan','UZ',3,26),(2098,'Uzbekistan','UZ',4,26),(2099,'Uzbekistan','UZ',5,26),(2100,'Uzbekistan','UZ',6,26),(2101,'Uzbekistan','UZ',7,26),(2102,'Uzbekistan','UZ',8,26),(2103,'Uzbekistan','UZ',9,26),(2104,'Uzbekistan','UZ',10,26),(2105,'Uzbekistan','UZ',11,26),(2106,'Uzbekistan','UZ',22,30),(2107,'Uzbekistan','UZ',24,30),(2108,'Uzbekistan','UZ',26,30),(2109,'Uzbekistan','UZ',28,30),(2110,'Uzbekistan','UZ',30,30),(2111,'Uzbekistan','UZ',32,30),(2112,'Uzbekistan','UZ',34,30),(2113,'Uzbekistan','UZ',36,30),(2114,'Uzbekistan','UZ',37,30),(2115,'Uzbekistan','UZ',39,30),(2116,'Uzbekistan','UZ',41,30),(2117,'Uzbekistan','UZ',43,30),(2118,'Uzbekistan','UZ',45,30),(2119,'Uzbekistan','UZ',47,30),(2120,'Uzbekistan','UZ',49,30),(2121,'Uzbekistan','UZ',51,30),(2122,'Uzbekistan','UZ',52,30),(2123,'Uzbekistan','UZ',54,30),(2124,'Uzbekistan','UZ',56,30),(2125,'Uzbekistan','UZ',59,30),(2126,'Uzbekistan','UZ',61,30),(2127,'Uzbekistan','UZ',63,30),(2128,'Uzbekistan','UZ',65,30),(2129,'Uzbekistan','UZ',66,30),(2135,'Venezuela','VE',1,26),(2136,'Venezuela','VE',2,26),(2137,'Venezuela','VE',3,26),(2138,'Venezuela','VE',4,26),(2139,'Venezuela','VE',5,26),(2140,'Venezuela','VE',6,26),(2141,'Venezuela','VE',7,26),(2142,'Venezuela','VE',8,26),(2143,'Venezuela','VE',9,26),(2144,'Venezuela','VE',10,26),(2145,'Venezuela','VE',11,26),(2146,'Venezuela','VE',12,26),(2147,'Venezuela','VE',13,26),(2148,'Venezuela','VE',59,30),(2149,'Venezuela','VE',61,30),(2150,'Venezuela','VE',63,30),(2151,'Venezuela','VE',65,30),(2152,'Viet Nam','VN',1,26),(2153,'Viet Nam','VN',2,26),(2154,'Viet Nam','VN',3,26),(2155,'Viet Nam','VN',4,26),(2156,'Viet Nam','VN',5,26),(2157,'Viet Nam','VN',6,26),(2158,'Viet Nam','VN',7,26),(2159,'Viet Nam','VN',8,26),(2160,'Viet Nam','VN',9,26),(2161,'Viet Nam','VN',10,26),(2162,'Viet Nam','VN',11,26),(2165,'Yemen','YE',1,26),(2166,'Yemen','YE',2,26),(2167,'Yemen','YE',3,26),(2168,'Yemen','YE',4,26),(2169,'Yemen','YE',5,26),(2170,'Yemen','YE',6,26),(2171,'Yemen','YE',7,26),(2172,'Yemen','YE',8,26),(2173,'Yemen','YE',9,26),(2174,'Yemen','YE',10,26),(2175,'Yemen','YE',11,26),(2176,'Yemen','YE',12,26),(2177,'Yemen','YE',13,26),(2178,'Zimbabwe','ZW',1,26),(2179,'Zimbabwe','ZW',2,26),(2180,'Zimbabwe','ZW',3,26),(2181,'Zimbabwe','ZW',4,26),(2182,'Zimbabwe','ZW',5,26),(2183,'Zimbabwe','ZW',6,26),(2184,'Zimbabwe','ZW',7,26),(2185,'Zimbabwe','ZW',8,26),(2186,'Zimbabwe','ZW',9,26),(2187,'Zimbabwe','ZW',10,26),(2188,'Zimbabwe','ZW',11,26),(2189,'Zimbabwe','ZW',12,26),(2190,'Zimbabwe','ZW',13,26),(2191,'India','IN',22,30),(2192,'India','IN',24,30),(2193,'India','IN',26,30),(2194,'India','IN',28,30),(2195,'India','IN',30,30),(2196,'India','IN',32,30),(2197,'India','IN',34,30),(2198,'India','IN',36,30),(2199,'India','IN',59,30),(2200,'India','IN',61,30),(2201,'India','IN',63,30),(2202,'India','IN',65,30),(2203,'India','IN',66,30),(2204,'Vanuatu','VU',1,26),(2205,'Vanuatu','VU',2,26),(2206,'Vanuatu','VU',3,26),(2207,'Vanuatu','VU',4,26),(2208,'Vanuatu','VU',5,26),(2209,'Vanuatu','VU',6,26),(2210,'Vanuatu','VU',7,26),(2211,'Vanuatu','VU',8,26),(2212,'Vanuatu','VU',9,26),(2213,'Vanuatu','VU',10,26),(2214,'Vanuatu','VU',11,26),(2215,'Vanuatu','VU',12,26),(2216,'Vanuatu','VU',13,26),(2217,'Vanuatu','VU',22,30),(2218,'Vanuatu','VU',24,30),(2219,'Vanuatu','VU',26,30),(2220,'Vanuatu','VU',28,30),(2221,'Vanuatu','VU',30,30),(2222,'Vanuatu','VU',32,30),(2223,'Vanuatu','VU',34,30),(2224,'Vanuatu','VU',36,30),(2225,'Vanuatu','VU',59,30),(2226,'Vanuatu','VU',61,30),(2227,'Vanuatu','VU',63,30),(2228,'Vanuatu','VU',65,30),(2229,'Vanuatu','VU',66,30),(2230,'Nigeria','NG',1,26),(2231,'Nigeria','NG',2,26),(2232,'Nigeria','NG',3,26),(2233,'Nigeria','NG',4,26),(2234,'Nigeria','NG',5,26),(2235,'Nigeria','NG',6,26),(2236,'Nigeria','NG',7,26),(2237,'Nigeria','NG',8,26),(2238,'Nigeria','NG',9,26),(2239,'Nigeria','NG',10,26),(2240,'Nigeria','NG',11,26),(2241,'Nigeria','NG',12,26),(2242,'Nigeria','NG',13,26);
/*!40000 ALTER TABLE `wifi_countrywise_frequency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wifi_frequency_bands`
--

DROP TABLE IF EXISTS `wifi_frequency_bands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wifi_frequency_bands` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `Band` int(4) NOT NULL,
  `Frequency` int(4) NOT NULL,
  `Channel` int(3) NOT NULL,
  `Bandwidth` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `BandIndex` (`Band`),
  KEY `ChannelIndex` (`Channel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wifi_frequency_bands`
--

LOCK TABLES `wifi_frequency_bands` WRITE;
/*!40000 ALTER TABLE `wifi_frequency_bands` DISABLE KEYS */;
INSERT INTO `wifi_frequency_bands` VALUES (1,2400,2412,1,22),(2,2400,2417,2,24),(3,2400,2422,3,22),(4,2400,2427,4,22),(5,2400,2432,5,22),(6,2400,2437,6,22),(7,2400,2442,7,22),(8,2400,2447,8,22),(9,2400,2452,9,22),(10,2400,2457,10,17),(11,2400,2462,11,22),(12,2400,2467,12,22),(13,2400,2472,13,22),(14,2400,2484,14,22),(16,5000,5040,8,0),(19,5000,5060,12,0),(20,5000,5080,16,0),(21,5000,5170,34,0),(22,5000,5180,36,80),(23,5000,5190,38,40),(24,5000,5200,40,20),(26,5000,5220,44,40),(28,5000,5240,48,20),(30,5000,5260,52,20),(32,5000,5280,56,20),(34,5000,5300,60,20),(35,5000,5310,62,40),(36,5000,5320,64,20),(37,5000,5500,100,20),(38,5000,5510,102,40),(39,5000,5520,104,20),(40,5000,5530,106,80),(41,5000,5540,108,20),(42,5000,5550,110,40),(43,5000,5560,112,20),(44,5000,5570,114,80),(45,5000,5580,116,20),(46,5000,5590,118,40),(47,5000,5600,120,20),(48,5000,5610,122,80),(49,5000,5620,124,20),(50,5000,5630,126,40),(51,5000,5640,128,20),(52,5000,5660,132,20),(53,5000,5670,134,40),(54,5000,5680,136,20),(55,5000,5690,138,80),(56,5000,5700,140,20),(57,5000,5710,142,40),(58,5000,5720,144,20),(59,5000,5745,149,80),(60,5000,5755,151,40),(61,5000,5765,153,20),(62,5000,5775,155,80),(63,5000,5785,157,40),(64,5000,5795,159,40),(65,5000,5805,161,20),(66,5000,5825,165,20);
/*!40000 ALTER TABLE `wifi_frequency_bands` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `ap_adv_dns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_adv_dns` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApMac` varchar(20) DEFAULT NULL,
  `ApId` int(11) DEFAULT NULL,
  `EnableDns` tinyint(1) DEFAULT NULL,
  `LocalDns` tinyint(1) DEFAULT NULL,
  `ServiceBlockNegative` tinyint(1) DEFAULT NULL,
  `CachingLogQueries` tinyint(1) DEFAULT NULL,
  `Rebind` tinyint(1) DEFAULT NULL,
  `ProtectionDnsCacheSize` int(10) DEFAULT NULL,
  `MaxConcurrentQueries` int(10) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOCK TABLES `ap_adv_dns` WRITE;
/*!40000 ALTER TABLE `ap_adv_dns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_adv_dns` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ap_adv_domain`
--

DROP TABLE IF EXISTS `ap_adv_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_adv_domain` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApMac` varchar(20) DEFAULT NULL,
  `ApId` int(11) DEFAULT NULL,
  `DomainName` varchar(150) DEFAULT NULL,
  `IpAddress` varchar(20) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `ap_adv_domain` WRITE;
/*!40000 ALTER TABLE `ap_adv_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_adv_domain` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `ap_adv_port_forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_adv_port_forward` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApMac` varchar(20) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Protocol` varchar(50) DEFAULT NULL,
  `ExternalZone` varchar(50) DEFAULT NULL,
  `ExternalPort` int(5) DEFAULT NULL,
  `InternalZone` varchar(50) DEFAULT NULL,
  `InternalPort` int(5) DEFAULT NULL,
  `InternalIp` varchar(32) DEFAULT NULL,
  `ApId` int(11) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ap_adv_port_forward` WRITE;
/*!40000 ALTER TABLE `ap_adv_port_forward` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_adv_port_forward` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `ap_adv_radio`
--

DROP TABLE IF EXISTS `ap_adv_radio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_adv_radio` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApMac` varchar(20) DEFAULT NULL,
  `ApId` int(11) DEFAULT NULL,
  `Override` tinyint(1) DEFAULT 0,
  `AdvRadioCountryCode` varchar(2) DEFAULT 'US',
  `AdvRadio12400Enable` tinyint(1) DEFAULT 1,
  `AdvRadio12400Channel` int(2) DEFAULT 0,
  `AdvRadio12400TxPower` int(2) DEFAULT 26,
  `AdvRadio12400Bandwidth` int(3) DEFAULT 20,
  `AdvRadio12400BackgrounScan` tinyint(1) DEFAULT 1,
  `AdvRadio12400ScanTime` int(10) DEFAULT 360,
  `AdvRadio25000Enable` tinyint(1) DEFAULT 1,
  `AdvRadio25000Channel` int(2) DEFAULT 0,
  `AdvRadio25000TxPower` int(2) DEFAULT 30,
  `AdvRadio25000Bandwidth` int(3) DEFAULT 80,
  `AdvRadio25000BackgrounScan` tinyint(1) DEFAULT 1,
  `AdvRadio25000ScanTime` int(10) DEFAULT 360,
  `AdvRadio35000Enable` tinyint(1) DEFAULT 1,
  `AdvRadio35000Channel` int(2) DEFAULT 0,
  `AdvRadio35000TxPower` int(2) DEFAULT 30,
  `AdvRadio35000Bandwidth` int(3) DEFAULT 80,
  `AdvRadio35000BackgrounScan` tinyint(1) DEFAULT 1,
  `AdvRadio35000ScanTime` int(10) DEFAULT 360,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `ap_adv_radio` WRITE;
/*!40000 ALTER TABLE `ap_adv_radio` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_adv_radio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ap_events`
--

DROP TABLE IF EXISTS `ap_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MacAddress` varchar(100) NOT NULL,
  `CreatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `CustomerId` int(11) NOT NULL,
  `Description` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CustomerId` (`CustomerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `ap_events` WRITE;
/*!40000 ALTER TABLE `ap_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_events` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `ap_adv_static_lease`
--

DROP TABLE IF EXISTS `ap_adv_static_lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_adv_static_lease` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApMac` varchar(20) DEFAULT NULL,
  `ApId` int(11) DEFAULT NULL,
  `HostName` varchar(100) DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  `Ipv4Address` varchar(20) DEFAULT NULL,
  `LeaseTime` int(10) DEFAULT NULL,
  `DUID` varchar(100) DEFAULT NULL,
  `Ipv6Suffix` varchar(32) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ap_adv_static_lease` WRITE;
/*!40000 ALTER TABLE `ap_adv_static_lease` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_adv_static_lease` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `ap_adv_static_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_adv_static_routes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ApId` int(11) DEFAULT NULL,
  `ApMac` varchar(20) DEFAULT NULL,
  `InterfaceName` varchar(50) DEFAULT NULL,
  `IpType` varchar(10) DEFAULT NULL,
  `TargetType` varchar(10) DEFAULT NULL,
  `Target` varchar(20) DEFAULT NULL,
  `Netmask` varchar(20) DEFAULT NULL,
  `Gateway` varchar(20) DEFAULT NULL,
  `Metric` int(10) DEFAULT NULL,
  `MTU` int(11) DEFAULT 0,
  `RouteType` varchar(10) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedOn` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `ap_adv_static_routes` WRITE;
/*!40000 ALTER TABLE `ap_adv_static_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ap_adv_static_routes` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `cambium_ap`
--

DROP TABLE IF EXISTS `cambium_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cambium_ap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApName` varchar(100) DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  `Product` varchar(100) DEFAULT NULL,
  `Ip` varchar(16) DEFAULT NULL,
  `Latitude` varchar(25) DEFAULT NULL,
  `Longitude` varchar(25) DEFAULT NULL,
  `LastUpdate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Status` tinyint(1) DEFAULT NULL,
  `ApGroup` varchar(150) DEFAULT NULL,
  `ApStatusTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MacAddress` (`MacAddress`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `cambium_ap` WRITE;
/*!40000 ALTER TABLE `cambium_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambium_ap` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `cambium_ap_alarms`
--

DROP TABLE IF EXISTS `cambium_ap_alarms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cambium_ap_alarms` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `AlarmId` varchar(50) DEFAULT NULL,
  `Ip` varchar(16) DEFAULT NULL,
  `Network` varchar(50) DEFAULT NULL,
  `SourceType` varchar(50) DEFAULT NULL,
  `SubCategory` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Origin` varchar(20) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Severity` varchar(15) DEFAULT NULL,
  `TimeRaised` datetime DEFAULT NULL,
  `Code` varchar(250) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `AlarmId` (`AlarmId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cambium_ap_alarms` WRITE;
/*!40000 ALTER TABLE `cambium_ap_alarms` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambium_ap_alarms` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `cambium_ap_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cambium_ap_events` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `EventId` varchar(50) DEFAULT NULL,
  `Ip` varchar(16) DEFAULT NULL,
  `Network` varchar(50) DEFAULT NULL,
  `SourceType` varchar(50) DEFAULT NULL,
  `SubCategory` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Origin` varchar(20) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Severity` varchar(15) DEFAULT NULL,
  `TimeRaised` datetime DEFAULT NULL,
  `Code` varchar(250) DEFAULT NULL,
  `Message` varchar(255) DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


LOCK TABLES `cambium_ap_events` WRITE;
/*!40000 ALTER TABLE `cambium_ap_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambium_ap_events` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `cambium_ap_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cambium_ap_stats` (
  `Id` int(10) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `RadioData` longtext DEFAULT NULL,
  `Network` varchar(50) DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `LastSync` datetime DEFAULT NULL,
  `LanModeStatus` varchar(20) DEFAULT NULL,
  `LanSpeedStatus` varchar(20) DEFAULT NULL,
  `LanStatus` varchar(20) DEFAULT NULL,
  `Site` varchar(20) DEFAULT NULL,
  `IPWan` varchar(16) DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  `ParentMac` varchar(20) DEFAULT NULL,
  `StatusTime` varchar(100) DEFAULT NULL,
  `Ip` varchar(16) DEFAULT NULL,
  `Radio2400Bssid` varchar(20) DEFAULT NULL,
  `Radio2400Channel` int(10) DEFAULT NULL,
  `Radio2400MulticastRate` int(10) DEFAULT NULL,
  `Radio2400NumWlans` int(10) DEFAULT NULL,
  `Radio2400Power` int(10) DEFAULT NULL,
  `Radio2400Quality` int(10) DEFAULT NULL,
  `Radio2400RadioState` varchar(6) DEFAULT NULL,
  `Radio2400RxBps` bigint(20) DEFAULT NULL,
  `Radio2400TxBps` bigint(20) DEFAULT NULL,
  `Radio2400RxBytes` bigint(20) DEFAULT NULL,
  `Radio2400TxBytes` bigint(20) DEFAULT NULL,
  `Radio2400UnicastRates` varchar(20) DEFAULT NULL,
  `Radio2400NumClients` int(10) DEFAULT NULL,
  `Radio2400NoiseFloor` int(10) DEFAULT NULL,
  `Radio2400Utilization` int(10) DEFAULT NULL,
  `Radio2400Airtime` varchar(50) DEFAULT NULL,
  `Radio5000Bssid` varchar(20) DEFAULT NULL,
  `Radio5000Channel` int(10) DEFAULT NULL,
  `Radio5000MulticastRate` int(10) DEFAULT NULL,
  `Radio5000NumWlans` int(10) DEFAULT NULL,
  `Radio5000Power` int(10) DEFAULT NULL,
  `Radio5000Quality` int(10) DEFAULT NULL,
  `Radio5000RadioState` varchar(6) DEFAULT NULL,
  `Radio5000RxBps` bigint(20) DEFAULT NULL,
  `Radio5000TxBps` bigint(20) DEFAULT NULL,
  `Radio5000RxBytes` bigint(20) DEFAULT NULL,
  `Radio5000TxBytes` bigint(20) DEFAULT NULL,
  `Radio5000UnicastRates` varchar(20) DEFAULT NULL,
  `Radio5000NumClients` int(10) DEFAULT NULL,
  `Radio5000NoiseFloor` int(10) DEFAULT NULL,
  `Radio5000Utilization` int(10) DEFAULT NULL,
  `Radio5000Airtime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;



LOCK TABLES `cambium_ap_stats` WRITE;
/*!40000 ALTER TABLE `cambium_ap_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `cambium_ap_stats` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `wani_ap`
--

DROP TABLE IF EXISTS `wani_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wani_ap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `location_state` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `location_type` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `cp_url` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `geo_loc` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `mac_id` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `rating` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ssid` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `status` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `tag` text CHARACTER SET latin1 DEFAULT NULL,
  `provider_id` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `last_updated` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wani_pdoa_ap_index` (`mac_id`),
  KEY `id` (`id`),
  KEY `mac_id` (`mac_id`),
  KEY `mac_id_2` (`mac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


LOCK TABLES `wani_ap` WRITE;
/*!40000 ALTER TABLE `wani_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `wani_ap` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `connect_apk`
--

DROP TABLE IF EXISTS `connect_apk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connect_apk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` enum('retailer','subscriber') DEFAULT NULL,
  `Name` varchar(150) DEFAULT NULL,
  `Version` varchar(100) DEFAULT NULL,
  `APKFilePath` varchar(200) DEFAULT NULL,
  `IPAFilePath` varchar(200) DEFAULT NULL,
  `PlayStoreLink` varchar(200) DEFAULT NULL,
  `AppStoreLink` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `connect_apk` WRITE;
/*!40000 ALTER TABLE `connect_apk` DISABLE KEYS */;
/*!40000 ALTER TABLE `connect_apk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `accounting`
--

/*!50001 DROP TABLE IF EXISTS `accounting`*/;
/*!50001 DROP VIEW IF EXISTS `accounting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `accounting` AS select `radius`.`radius_accounting`.`id` AS `id`,`radius`.`radius_accounting`.`client_macaddress` AS `client_macaddress`,`radius`.`radius_accounting`.`client_ipv4address` AS `client_ipv4address`,`radius`.`radius_accounting`.`controller_macaddress` AS `controller_macaddress`,`radius`.`radius_accounting`.`controller_ipv4address` AS `controller_ipv4address`,`radius`.`radius_accounting`.`sessionid` AS `sessionid`,`radius`.`radius_accounting`.`multisessionid` AS `multisessionid`,`radius`.`radius_accounting`.`uniqueid` AS `uniqueid`,date_format(`radius`.`radius_accounting`.`starttime`,'%Y-%m-%d %H:%i:%s') AS `starttime`,date_format(`radius`.`radius_accounting`.`endtime`,'%Y-%m-%d %H:%i:%s') AS `endtime`,date_format(`radius`.`radius_accounting`.`updatetime`,'%Y-%m-%d %H:%i:%s') AS `updatetime`,`radius`.`radius_accounting`.`sessiontime` AS `sessiontime`,`radius`.`radius_accounting`.`downloadbytes` AS `downloadbytes`,`radius`.`radius_accounting`.`uploadbytes` AS `uploadbytes`,`radius`.`radius_accounting`.`terminatecause` AS `terminatecause`,`radius`.`radius_accounting`.`customer_id` AS `customer_id`,`radius`.`radius_accounting`.`location_id` AS `location_id`,`radius`.`radius_accounting`.`user_id` AS `user_id` from `radius`.`radius_accounting` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `activeusersummary`
--

/*!50001 DROP TABLE IF EXISTS `activeusersummary`*/;
/*!50001 DROP VIEW IF EXISTS `activeusersummary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `activeusersummary` AS select `radius`.`radius_activeusersummary`.`id` AS `id`,`radius`.`radius_activeusersummary`.`client_macaddress` AS `client_macaddress`,`radius`.`radius_activeusersummary`.`online` AS `online`,`radius`.`radius_activeusersummary`.`downloadbytes` AS `downloadbytes`,`radius`.`radius_activeusersummary`.`uploadbytes` AS `uploadbytes`,`radius`.`radius_activeusersummary`.`sessiontime` AS `sessiontime`,`radius`.`radius_activeusersummary`.`sessioncount` AS `sessioncount`,`radius`.`radius_activeusersummary`.`logout` AS `logout`,`radius`.`radius_activeusersummary`.`customer_id` AS `customer_id`,`radius`.`radius_activeusersummary`.`location_id` AS `location_id`,`radius`.`radius_activeusersummary`.`user_id` AS `user_id` from `radius`.`radius_activeusersummary` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `autologin`
--

/*!50001 DROP TABLE IF EXISTS `autologin`*/;
/*!50001 DROP VIEW IF EXISTS `autologin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `autologin` AS select `radius`.`radius_autologin`.`id` AS `id`,`radius`.`radius_autologin`.`macaddress` AS `macaddress`,date_format(`radius`.`radius_autologin`.`created`,'%Y-%m-%d %H:%i:%s') AS `created`,`radius`.`radius_autologin`.`description` AS `description`,date_format(`radius`.`radius_autologin`.`expirydate`,'%Y-%m-%d %H:%i:%s') AS `expirydate`,`radius`.`radius_autologin`.`user_id` AS `user_id`,`radius`.`radius_autologin`.`location_id` AS `location_id`,`radius`.`radius_autologin`.`autologintype` AS `autologintype` from `radius`.`radius_autologin` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `device`
--

/*!50001 DROP TABLE IF EXISTS `device`*/;
/*!50001 DROP VIEW IF EXISTS `device`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `device` AS select `radius`.`radius_device`.`id` AS `id`,`radius`.`radius_device`.`ipv4address` AS `ipv4address`,`radius`.`radius_device`.`devicetype_id` AS `devicetype_id`,`radius`.`radius_device`.`secret` AS `secret`,`radius`.`radius_device`.`macaddress` AS `macaddress`,`radius`.`radius_device`.`nasid` AS `nasid`,`radius`.`radius_device`.`customer_id` AS `customer_id`,`radius`.`radius_device`.`location_id` AS `location_id` from `radius`.`radius_device` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `eapconfig`
--

/*!50001 DROP TABLE IF EXISTS `eapconfig`*/;
/*!50001 DROP VIEW IF EXISTS `eapconfig`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eapconfig` AS select `radius`.`radius_eapconfig`.`id` AS `id`,`radius`.`radius_eapconfig`.`cacert` AS `cacert`,`radius`.`radius_eapconfig`.`cert` AS `cert`,`radius`.`radius_eapconfig`.`key` AS `key`,`radius`.`radius_eapconfig`.`customer_id` AS `customer_id`,`radius`.`radius_eapconfig`.`name` AS `name` from `radius`.`radius_eapconfig` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `eventlogsradius`
--

/*!50001 DROP TABLE IF EXISTS `eventlogsradius`*/;
/*!50001 DROP VIEW IF EXISTS `eventlogsradius`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eventlogsradius` AS select `radius`.`radius_event`.`id` AS `id`,date_format(`radius`.`radius_event`.`timestamp`,'%Y-%m-%d %H:%i:%s') AS `EventTime`,`radius`.`radius_event`.`eventID` AS `EventID`,`radius`.`radius_event`.`message` AS `Description`,`radius`.`radius_event`.`client_macaddress` AS `client_macaddress`,`radius`.`radius_event`.`client_ipv4address` AS `client_ipv4address`,`radius`.`radius_event`.`customer_id` AS `CustomerId`,`radius`.`radius_event`.`location_id` AS `LocationId`,`radius`.`radius_event`.`user_id` AS `user_id`,`radius`.`radius_user`.`username` AS `UserName`,`radius`.`radius_user`.`usertype` AS `UserType`,`radius`.`radius_user`.`userstatus` AS `userstatus` from (`radius`.`radius_event` join `radius`.`radius_user` on(`radius`.`radius_event`.`user_id` = `radius`.`radius_user`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `eventlogsradius1`
--

/*!50001 DROP TABLE IF EXISTS `eventlogsradius1`*/;
/*!50001 DROP VIEW IF EXISTS `eventlogsradius1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `eventlogsradius1` AS select `re`.`id` AS `id`,`re`.`timestamp` AS `EventTime`,`re`.`eventID` AS `EventID`,`re`.`message` AS `Description`,`re`.`client_macaddress` AS `client_macaddress`,`re`.`client_ipv4address` AS `client_ipv4address`,`re`.`customer_id` AS `CustomerId`,`re`.`location_id` AS `LocationId`,`re`.`user_id` AS `UserId`,`ru`.`username` AS `UserName`,`ru`.`usertype` AS `UserType`,`ru`.`userstatus` AS `UserStatus` from (`radius`.`radius_event` `re` join `radius`.`radius_user` `ru` on(`re`.`user_id` = `ru`.`id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user`
--

/*!50001 DROP TABLE IF EXISTS `user`*/;
/*!50001 DROP VIEW IF EXISTS `user`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user` AS select `radius`.`radius_user`.`id` AS `id`,`radius`.`radius_user`.`username` AS `username`,`radius`.`radius_user`.`password` AS `password`,`radius`.`radius_user`.`usertype` AS `usertype`,`radius`.`radius_user`.`userstatus` AS `userstatus`,`radius`.`radius_user`.`restrictlocation` AS `restrictlocation`,date_format(`radius`.`radius_user`.`createddate`,'%Y-%m-%d %H:%i:%s') AS `createddate`,date_format(`radius`.`radius_user`.`lastrechargedate`,'%Y-%m-%d %H:%i:%s') AS `lastrechargedate`,date_format(`radius`.`radius_user`.`expirydate`,'%Y-%m-%d %H:%i:%s') AS `expirydate`,date_format(`radius`.`radius_user`.`statuschangedate`,'%Y-%m-%d %H:%i:%s') AS `statuschangedate`,`radius`.`radius_user`.`statuschangereason` AS `statuschangereason`,date_format(`radius`.`radius_user`.`lastmodified`,'%Y-%m-%d %H:%i:%s') AS `lastmodified`,`radius`.`radius_user`.`customer_id` AS `customer_id`,`radius`.`radius_user`.`location_id` AS `location_id`,`radius`.`radius_user`.`plan_id` AS `plan_id`,`radius`.`radius_user`.`policy_id` AS `policy_id`,`radius`.`radius_user`.`data_limit` AS `data_limit`,`radius`.`radius_user`.`time_limit` AS `time_limit`,`radius`.`radius_user`.`total_topup_count` AS `total_topup_count`,`radius`.`radius_user`.`last_topup_date` AS `last_topup_date`,`radius`.`radius_user`.`prepaidgroup_id` AS `prepaidgroup_id`,`radius`.`radius_user`.`app_id` AS `app_id`,`radius`.`radius_user`.`app_username` AS `app_username`,`radius`.`radius_userinfo`.`fullname` AS `fullname`,`radius`.`radius_userinfo`.`email` AS `email`,`radius`.`radius_userinfo`.`age` AS `age`,`radius`.`radius_userinfo`.`address` AS `address`,`radius`.`radius_userinfo`.`city` AS `city`,`radius`.`radius_userinfo`.`state` AS `state`,`radius`.`radius_userinfo`.`country` AS `country`,`radius`.`radius_userinfo`.`phone` AS `phone`,`radius`.`radius_userinfo`.`aptnumber` AS `aptnumber`,`radius`.`radius_userinfo`.`zipcode` AS `zipcode`,`radius`.`radius_userinfo`.`dob` AS `dob`,`radius`.`radius_userinfo`.`gender` AS `gender` from (`radius`.`radius_user` join `radius`.`radius_userinfo` on(`radius`.`radius_user`.`id` = `radius`.`radius_userinfo`.`user_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userdevice`
--

/*!50001 DROP TABLE IF EXISTS `userdevice`*/;
/*!50001 DROP VIEW IF EXISTS `userdevice`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userdevice` AS select `radius`.`radius_userdevice`.`id` AS `id`,`radius`.`radius_userdevice`.`macaddress` AS `macaddress`,date_format(`radius`.`radius_userdevice`.`created`,'%Y-%m-%d %H:%i:%s') AS `created`,`radius`.`radius_userdevice`.`user_id` AS `user_id` from `radius`.`radius_userdevice` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userrestrictions`
--

/*!50001 DROP TABLE IF EXISTS `userrestrictions`*/;
/*!50001 DROP VIEW IF EXISTS `userrestrictions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userrestrictions` AS select `radius`.`radius_userrestrictions`.`user_id` AS `user_id`,date_format(`radius`.`radius_userrestrictions`.`lastmodified`,'%Y-%m-%d %H:%i:%s') AS `lastmodified`,`radius`.`radius_userrestrictions`.`validity` AS `validity`,`radius`.`radius_userrestrictions`.`validity_unit` AS `validity_unit`,`radius`.`radius_userrestrictions`.`concurrency_limit` AS `concurrency_limit`,`radius`.`radius_userrestrictions`.`daily_session_limit` AS `daily_session_limit`,`radius`.`radius_userrestrictions`.`max_device_limit` AS `max_device_limit`,`radius`.`radius_userrestrictions`.`uploadrate` AS `uploadrate`,`radius`.`radius_userrestrictions`.`uploadrate_unit` AS `uploadrate_unit`,`radius`.`radius_userrestrictions`.`downloadrate` AS `downloadrate`,`radius`.`radius_userrestrictions`.`downloadrate_unit` AS `downloadrate_unit`,`radius`.`radius_userrestrictions`.`total_bw_quota` AS `total_bw_quota`,`radius`.`radius_userrestrictions`.`total_bw_quota_unit` AS `total_bw_quota_unit`,`radius`.`radius_userrestrictions`.`daily_bw_quota` AS `daily_bw_quota`,`radius`.`radius_userrestrictions`.`daily_bw_quota_unit` AS `daily_bw_quota_unit`,`radius`.`radius_userrestrictions`.`total_time_quota` AS `total_time_quota`,`radius`.`radius_userrestrictions`.`total_time_quota_unit` AS `total_time_quota_unit`,`radius`.`radius_userrestrictions`.`daily_time_quota` AS `daily_time_quota`,`radius`.`radius_userrestrictions`.`daily_time_quota_unit` AS `daily_time_quota_unit`,`radius`.`radius_userrestrictions`.`session_timeout` AS `session_timeout`,`radius`.`radius_userrestrictions`.`session_timeout_unit` AS `session_timeout_unit`,`radius`.`radius_userrestrictions`.`idle_timeout` AS `idle_timeout`,`radius`.`radius_userrestrictions`.`idle_timeout_unit` AS `idle_timeout_unit`,`radius`.`radius_userrestrictions`.`fup` AS `fup`,`radius`.`radius_userrestrictions`.`fup_downloadrate` AS `fup_downloadrate`,`radius`.`radius_userrestrictions`.`fup_downloadrate_unit` AS `fup_downloadrate_unit`,`radius`.`radius_userrestrictions`.`fup_trigger_quota` AS `fup_trigger_quota`,`radius`.`radius_userrestrictions`.`fup_trigger_unit` AS `fup_trigger_unit`,`radius`.`radius_userrestrictions`.`fup_uploadrate` AS `fup_uploadrate`,`radius`.`radius_userrestrictions`.`fup_uploadrate_unit` AS `fup_uploadrate_unit` from `radius`.`radius_userrestrictions` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ad_campaignmap`
--

/*!50001 DROP TABLE IF EXISTS `vw_ad_campaignmap`*/;
/*!50001 DROP VIEW IF EXISTS `vw_ad_campaignmap`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ad_campaignmap` AS select `ac`.`id` AS `campaignid`,`ac`.`AdWeight` AS `campaignweight`,`ae`.`id` AS `adid`,`ae`.`AdMediaId` AS `admediaid`,`ae`.`DestinationLink` AS `destinationlink`,`ae`.`Weight` AS `weight`,`ae`.`TotalImpressions` AS `totalimpressions`,`ae`.`DisplayDays` AS `displaydays`,`ae`.`DisplayHours` AS `displayhours`,`ae`.`AdDisplayTime` AS `displaytime`,`ae`.`AdType` AS `adtype`,`ae`.`Gender` AS `gender`,`ae`.`FromAge` AS `FromAge`,`ae`.`ToAge` AS `ToAge`,`ac`.`AdWeight` * 5 + floor(rand() * (50 - 1 + 1) + 1) AS `adscore`,case when `ast`.`Impressions` is null then 0 else `ast`.`Impressions` end AS `impressions` from (((((`ad_campaign` `ac` join `ad_campaigngroup` `acg` on(`acg`.`AdCampaignId` = `ac`.`id`)) join `ad_group` `ag` on(`ag`.`id` = `acg`.`AdGroupId`)) join `ad_groupmap` `agm` on(`agm`.`GroupId` = `ag`.`id`)) join `ad_entry` `ae` on(`ae`.`id` = `agm`.`AdId` and `ae`.`Status` = 1)) left join `vw_ad_statistics` `ast` on(`ae`.`AdMediaId` = `ast`.`AdMediaId`)) where `ast`.`Impressions` < `ae`.`TotalImpressions` or `ast`.`Impressions` is null */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ad_media`
--

/*!50001 DROP TABLE IF EXISTS `vw_ad_media`*/;
/*!50001 DROP VIEW IF EXISTS `vw_ad_media`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ad_media` AS select `ad_media`.`id` AS `id`,`ad_media`.`Image1` AS `Image1`,`ad_media`.`ImageSize1` AS `ImageSize1`,`ad_media`.`ImageDimension1` AS `ImageDimension1`,`ad_media`.`ImageType1` AS `ImageType1`,`ad_media`.`Image2` AS `Image2`,`ad_media`.`ImageSize2` AS `ImageSize2`,`ad_media`.`ImageDimension2` AS `ImageDimension2`,`ad_media`.`ImageType2` AS `ImageType2`,`ad_media`.`Image3` AS `Image3`,`ad_media`.`ImageSize3` AS `ImageSize3`,`ad_media`.`ImageDimension3` AS `ImageDimension3`,`ad_media`.`ImageType3` AS `ImageType3`,`ad_media`.`CustomerId` AS `CustomerId`,`ad_media`.`VideoName` AS `VideoName` from `ad_media` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ad_statistics`
--

/*!50001 DROP TABLE IF EXISTS `vw_ad_statistics`*/;
/*!50001 DROP VIEW IF EXISTS `vw_ad_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ad_statistics` AS select `ad_statistics`.`AdMediaId` AS `AdMediaId`,count(1) AS `Impressions` from `ad_statistics` group by `ad_statistics`.`AdMediaId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-26  8:23:41
