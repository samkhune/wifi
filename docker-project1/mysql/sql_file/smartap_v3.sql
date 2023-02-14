-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: smartap_v3
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB-1:10.4.12+maria~bionic

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
-- Table structure for table `ap`
--
CREATE DATABASE IF NOT EXISTS smartap_v3;
USE smartap_v3;


DROP TABLE IF EXISTS `ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `WifilanAPId` int(11) NOT NULL COMMENT 'Wifilan server Access point Id ',
  `MacAddress` varchar(20) NOT NULL COMMENT 'Access Point MAC Address',
  `LastCheckinTime` datetime DEFAULT NULL,
  `LastStatusId` int(11) DEFAULT NULL,
  `SSHPassword` varchar(30) NOT NULL DEFAULT 'lkpewrtyu@',
  `AdminPassword` varchar(30) DEFAULT 'qw4rk6ba23',
  `ConfigChangeDate` datetime DEFAULT NULL,
  `FastCheckin` tinyint(1) NOT NULL DEFAULT 0,
  `Reboot` tinyint(1) NOT NULL DEFAULT 0,
  `Reset` tinyint(1) DEFAULT 0,
  `SpeedTest` tinyint(1) DEFAULT 0,
  `CreatedOn` timestamp NULL DEFAULT current_timestamp() COMMENT 'This time will be in system timezone',
  `ModifiedOn` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'This time will be in system timezone',
  `WifilanServerId` smallint(6) DEFAULT NULL,
  `WifilanCustomerId` int(11) NOT NULL,
  `WifilanOperatorId` int(11) DEFAULT NULL,
  `WifilanLocationId` int(11) NOT NULL,
  `Radio1Channel` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Radio2Channel` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Radio3Channel` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `Radio1ChannelWidth` smallint(6) NOT NULL DEFAULT 20,
  `Radio2ChannelWidth` smallint(6) NOT NULL DEFAULT 20,
  `Radio3ChannelWidth` smallint(6) NOT NULL DEFAULT 20,
  `Radio1Power` varchar(10) NOT NULL DEFAULT '0',
  `Radio2Power` varchar(10) NOT NULL DEFAULT '0',
  `Radio3Power` varchar(10) NOT NULL DEFAULT '0',
  `GpsLat` varchar(10) DEFAULT NULL,
  `GpsLong` varchar(10) DEFAULT NULL,
  `IsGpsEnabled` tinyint(4) NOT NULL DEFAULT 0,
  `GpsUpdateTime` datetime DEFAULT NULL,
  `PublicIpAddress` varchar(20) NOT NULL DEFAULT '',
  `CommandExec` tinyint(4) NOT NULL DEFAULT 0,
  `ApUptime` varchar(20) NOT NULL DEFAULT '',
  `FirmwareUpgrade` tinyint(1) NOT NULL DEFAULT 0,
  `FirmwareVersion` varchar(45) DEFAULT NULL,
  `UpgradeConfigBackup` tinyint(4) NOT NULL DEFAULT 0,
  `CurrentFirmwareVersion` varchar(15) DEFAULT NULL,
  `FirmwareUpgradeSchedule` tinyint(4) NOT NULL DEFAULT 0,
  `FirmwareUpgradeScheduleDateTime` varchar(30) DEFAULT NULL,
  `WanIpAddress` varchar(20) NOT NULL DEFAULT '',
  `MultiWanMode` tinyint(4) NOT NULL DEFAULT 0,
  `WanLinks` varchar(40) NOT NULL DEFAULT 'Wired:UP',
  `WanSpeedDownlink` varchar(16) NOT NULL DEFAULT '0',
  `WanSpeedUplink` varchar(16) NOT NULL DEFAULT '0',
  `WirelessClients` smallint(6) NOT NULL DEFAULT 0,
  `WiredClients` smallint(6) NOT NULL DEFAULT 0,
  `HotspotTotalClientCount` smallint(6) NOT NULL DEFAULT 0,
  `HotspotAuthenticatedClientCount` smallint(6) NOT NULL DEFAULT 0,
  `ApBoardName` varchar(20) DEFAULT NULL,
  `RSysLogEnable` tinyint(4) NOT NULL DEFAULT 0,
  `RSysLogServer` varchar(20) DEFAULT NULL,
  `RSysLogPort` varchar(5) DEFAULT '514',
  `RSysLogPrefix` varchar(5) DEFAULT NULL,
  `RSysLogDuration` varchar(20) DEFAULT NULL,
  `RSysLogDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MacAddress` (`MacAddress`),
  KEY `WifilanServer_Customer` (`WifilanServerId`,`WifilanCustomerId`),
  KEY `WifilanServer_Customer_Location` (`WifilanServerId`,`WifilanCustomerId`,`WifilanLocationId`),
  KEY `WifilanServer_Customer_Operator` (`WifilanServerId`,`WifilanCustomerId`,`WifilanOperatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `Reply` mediumtext DEFAULT NULL,
  `Status` tinyint(1) DEFAULT 0,
  `Result` tinyint(1) DEFAULT 0,
  `AddedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  `ExecutionTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_debug`
--

DROP TABLE IF EXISTS `ap_debug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_debug` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Log` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_event_logs`
--

DROP TABLE IF EXISTS `ap_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_event_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Autogenerated',
  `ApId` int(11) NOT NULL,
  `EventId` varchar(10) NOT NULL COMMENT 'foreign key of event Metadata table',
  `Description` varchar(300) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `NetworkId` int(11) DEFAULT NULL,
  `UserMacAddress` varchar(20) DEFAULT NULL,
  `ApMacAddress` varchar(20) DEFAULT NULL,
  `Counter` int(11) DEFAULT NULL COMMENT 'No events occurs',
  `EventTime` datetime NOT NULL DEFAULT current_timestamp(),
  `CreatedOn` datetime NOT NULL DEFAULT current_timestamp(),
  `CustomerId` int(11) NOT NULL DEFAULT 0,
  `OperatorId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_outage`
--

DROP TABLE IF EXISTS `ap_outage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_outage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `NetworkId` int(10) unsigned DEFAULT NULL,
  `CustomerId` int(10) unsigned DEFAULT NULL,
  `ServerId` int(11) NOT NULL,
  `OutageDate` date NOT NULL,
  `FromDate` datetime DEFAULT NULL,
  `ToDate` datetime DEFAULT NULL,
  `Type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ApNetworkCustomerIndex` (`ApId`,`NetworkId`,`CustomerId`),
  KEY `FromDateIndex` (`FromDate`),
  KEY `TypeIndex` (`Type`),
  CONSTRAINT `ao_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status`
--

DROP TABLE IF EXISTS `ap_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `CheckinTime` datetime NOT NULL,
  `MacAddressList` varchar(100) DEFAULT NULL,
  `PrimaryMacAddress` varchar(20) NOT NULL,
  `Reboot` tinyint(1) DEFAULT 0,
  `PublicIpAddress` varchar(20) DEFAULT NULL,
  `WanIpAddress` varchar(20) DEFAULT NULL,
  `UploadedBytes` bigint(20) DEFAULT NULL,
  `DownloadedBytes` bigint(20) DEFAULT NULL,
  `RTT` float(6,3) DEFAULT NULL,
  `GatewayIpAddress` varchar(20) DEFAULT NULL,
  `Mode` varchar(20) DEFAULT NULL,
  `FreeMemoryKb` int(5) DEFAULT NULL,
  `TotalMemoryKb` int(5) DEFAULT NULL,
  `CpuLoad` varchar(20) DEFAULT NULL,
  `Uptime` varchar(20) DEFAULT NULL,
  `CheckinErrorCount` int(3) DEFAULT NULL,
  `TotalClients` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Total Hotspot Users Count',
  `OnlineClients` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Total Authenticated Hotspot Users Count',
  `BootTimestamp` int(20) unsigned DEFAULT NULL,
  `CurrentTimestamp` int(20) unsigned DEFAULT NULL,
  `WirelessClients` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Total Wireless Clients Connected',
  `WiredClients` smallint(6) NOT NULL DEFAULT 0 COMMENT 'Total Wired Clients Connected',
  PRIMARY KEY (`id`),
  KEY `PrimaryMacAddressIndex` (`PrimaryMacAddress`),
  KEY `ApIdIndex` (`ApId`),
  KEY `CheckinTimeIndex` (`CheckinTime`),
  CONSTRAINT `as_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_chilliclients`
--

DROP TABLE IF EXISTS `ap_status_chilliclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_chilliclients` (
  `ClientId` int(10) unsigned NOT NULL,
  `ApStatusId` int(10) unsigned NOT NULL,
  `ApId` int(10) unsigned DEFAULT NULL,
  `CheckinTime` datetime DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  `IpAddress` varchar(20) DEFAULT NULL,
  `IsAuthenticated` tinyint(1) DEFAULT 0,
  `UserName` varchar(50) DEFAULT NULL,
  `ChilliSessionId` varchar(20) DEFAULT NULL,
  `SessionTime` varchar(20) DEFAULT NULL,
  `IdleTime` varchar(20) DEFAULT NULL,
  `DownloadedBytes` varchar(30) DEFAULT NULL,
  `UploadedBytes` varchar(30) DEFAULT NULL,
  `DownloadSpeed` varchar(20) DEFAULT NULL,
  `UploadSpeed` varchar(20) DEFAULT NULL,
  KEY `CheckinTime` (`CheckinTime`),
  KEY `ApStatusId` (`ApStatusId`),
  KEY `MacAddress` (`MacAddress`),
  KEY `ap_status_apid` (`ApId`),
  KEY `isauthenticated_index` (`IsAuthenticated`),
  CONSTRAINT `asc_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `asc_statusid_fk` FOREIGN KEY (`ApStatusId`) REFERENCES `ap_status` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_dhcp_lease`
--

DROP TABLE IF EXISTS `ap_status_dhcp_lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_dhcp_lease` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `MacAddress` varchar(20) NOT NULL,
  `HostName` varchar(50) DEFAULT NULL,
  `IpAddress` varchar(20) DEFAULT NULL,
  `LeaseTime` bigint(20) unsigned DEFAULT 0,
  `LastCheckinTime` datetime DEFAULT NULL,
  `LastStatusId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dhcp_lease_apid` (`ApId`),
  CONSTRAINT `dhcp_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_mesh`
--

DROP TABLE IF EXISTS `ap_status_mesh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_mesh` (
  `ApStatusId` int(10) unsigned NOT NULL,
  `ApId` int(10) unsigned DEFAULT NULL,
  `CheckinTime` datetime DEFAULT NULL,
  `Frequency` int(4) DEFAULT NULL,
  `NextHop` varchar(20) DEFAULT NULL,
  `SNR` float(5,2) DEFAULT NULL,
  KEY `ApStatusIdIndex` (`ApStatusId`),
  KEY `ApIdIndex` (`ApId`),
  KEY `CheckinTimeIndex` (`CheckinTime`),
  CONSTRAINT `asm_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `asm_statusid_fk` FOREIGN KEY (`ApStatusId`) REFERENCES `ap_status` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_ports`
--

DROP TABLE IF EXISTS `ap_status_ports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_ports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `PortName` varchar(20) NOT NULL,
  `NetworkName` varchar(33) NOT NULL DEFAULT '',
  `TxBytes` bigint(20) unsigned DEFAULT 0,
  `TxPackets` bigint(20) unsigned DEFAULT 0,
  `TxErrors` bigint(20) unsigned DEFAULT 0,
  `TxDrops` bigint(20) unsigned DEFAULT 0,
  `Uplink` bigint(20) unsigned DEFAULT 0,
  `RxBytes` bigint(20) unsigned DEFAULT 0,
  `RxPackets` bigint(20) unsigned DEFAULT 0,
  `RxErrors` bigint(20) unsigned DEFAULT 0,
  `RxDrops` bigint(20) unsigned DEFAULT 0,
  `Downlink` bigint(20) unsigned DEFAULT 0,
  `LastCheckinTime` datetime DEFAULT NULL,
  `LastStatusId` int(11) DEFAULT NULL,
  `DiffTxBytes` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxPackets` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxErrors` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxDrops` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxDrops` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxErrors` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxPackets` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxBytes` bigint(20) NOT NULL DEFAULT 0,
  `ElapsedTime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `port_apid` (`ApId`),
  KEY `port_apid_netname` (`ApId`,`NetworkName`),
  KEY `port_apid_portname` (`ApId`,`PortName`),
  CONSTRAINT `port_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_reboot`
--

DROP TABLE IF EXISTS `ap_status_reboot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_reboot` (
  `ApStatusId` bigint(20) NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `CheckinTime` datetime DEFAULT NULL,
  `Kernel` varchar(20) DEFAULT NULL,
  `SystemType` varchar(50) DEFAULT NULL,
  `FirmwareVersion` varchar(15) DEFAULT NULL,
  `FirmwareTarget` varchar(30) DEFAULT NULL,
  `SystemBoard` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `LanIpAddress` varchar(20) DEFAULT NULL,
  `ConfigChangeDate` datetime DEFAULT NULL,
  KEY `ApId` (`ApId`),
  KEY `CheckinTime` (`CheckinTime`),
  KEY `ApStatusId` (`ApStatusId`),
  CONSTRAINT `asr_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_rfclients`
--

DROP TABLE IF EXISTS `ap_status_rfclients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_rfclients` (
  `ClientId` int(10) unsigned NOT NULL,
  `ApStatusId` int(10) unsigned NOT NULL,
  `ApId` int(10) unsigned DEFAULT NULL,
  `CheckinTime` datetime DEFAULT NULL,
  `MacAddress` varchar(20) DEFAULT NULL,
  `AssociatedSSID` varchar(32) DEFAULT NULL,
  `AssociatedFrequency` int(4) DEFAULT NULL,
  `RxBytes` bigint(20) DEFAULT NULL,
  `TxBytes` bigint(20) DEFAULT NULL,
  `FailedTxBytes` int(5) DEFAULT NULL,
  `SignalAverage` int(5) DEFAULT NULL,
  `RxBitRate` float(5,2) DEFAULT NULL,
  `TxBitRate` float(5,2) DEFAULT NULL,
  `Throughput` float(5,2) DEFAULT NULL,
  `WirelessClients` smallint(6) NOT NULL DEFAULT 0,
  `WiredClients` smallint(6) NOT NULL DEFAULT 0,
  `HotspotTotalClientCount` smallint(6) NOT NULL DEFAULT 0,
  `HotspotAuthenticatedClientCount` smallint(6) NOT NULL DEFAULT 0,
  `TxPackets` bigint(20) NOT NULL DEFAULT 0,
  `RxPackets` bigint(20) NOT NULL DEFAULT 0,
  `TxFailed` int(11) NOT NULL DEFAULT 0,
  `TxRetried` int(11) NOT NULL DEFAULT 0,
  `ConnectedTime` int(11) NOT NULL DEFAULT 0,
  `InactiveTime` int(11) NOT NULL DEFAULT 0,
  `DiffTxBytes` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxBytes` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxPackets` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxPackets` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxFailed` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxRetried` bigint(20) NOT NULL DEFAULT 0,
  `ElapsedTime` int(11) NOT NULL DEFAULT 0,
  KEY `ApStatusId` (`ApStatusId`),
  KEY `CheckinTime` (`CheckinTime`),
  KEY `ap_status_rfclients_ibfk_1` (`ClientId`),
  KEY `ap_status_rfclients_apid` (`ApId`),
  CONSTRAINT `asrf_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `asrf_statusid_fk` FOREIGN KEY (`ApStatusId`) REFERENCES `ap_status` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_sdwan`
--

DROP TABLE IF EXISTS `ap_status_sdwan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_sdwan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `SdwanName` varchar(20) NOT NULL,
  `TxBytes` bigint(20) unsigned DEFAULT 0,
  `TxPackets` bigint(20) unsigned DEFAULT 0,
  `TxErrors` bigint(20) unsigned DEFAULT 0,
  `TxDrops` bigint(20) unsigned DEFAULT 0,
  `Uplink` bigint(20) unsigned DEFAULT 0,
  `RxBytes` bigint(20) unsigned DEFAULT 0,
  `RxPackets` bigint(20) unsigned DEFAULT 0,
  `RxErrors` bigint(20) unsigned DEFAULT 0,
  `RxDrops` bigint(20) unsigned DEFAULT 0,
  `Downlink` bigint(20) unsigned DEFAULT 0,
  `LastCheckinTime` datetime DEFAULT NULL,
  `LastStatusId` int(11) DEFAULT NULL,
  `DiffTxBytes` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxPackets` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxErrors` bigint(20) NOT NULL DEFAULT 0,
  `DiffTxDrops` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxDrops` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxErrors` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxPackets` bigint(20) NOT NULL DEFAULT 0,
  `DiffRxBytes` bigint(20) NOT NULL DEFAULT 0,
  `ElapsedTime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sdwan_apid` (`ApId`),
  KEY `sdwan_apid_name` (`ApId`,`SdwanName`),
  CONSTRAINT `sdwan_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_speedtest`
--

DROP TABLE IF EXISTS `ap_status_speedtest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_speedtest` (
  `ApStatusId` int(10) unsigned NOT NULL,
  `ApId` int(10) unsigned DEFAULT NULL,
  `CheckinTime` datetime DEFAULT NULL,
  `TestTime` datetime DEFAULT NULL,
  `Server` varchar(20) DEFAULT NULL,
  `Sponsor` varchar(30) DEFAULT NULL,
  `DownloadSpeed` float(11,2) DEFAULT NULL,
  `UploadSpeed` float(11,2) DEFAULT NULL,
  KEY `ApId` (`ApId`),
  KEY `CheckinTime` (`CheckinTime`),
  KEY `ApStatusId` (`ApStatusId`),
  CONSTRAINT `ass_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ass_statusid_fk` FOREIGN KEY (`ApStatusId`) REFERENCES `ap_status` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_ssid`
--

DROP TABLE IF EXISTS `ap_status_ssid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_ssid` (
  `ApStatusId` int(10) unsigned NOT NULL,
  `ApId` int(10) unsigned DEFAULT NULL,
  `CheckinTime` datetime DEFAULT NULL,
  `SSIDName` varchar(33) DEFAULT NULL,
  `Frequency` int(4) DEFAULT NULL,
  `Network` varchar(10) DEFAULT NULL,
  KEY `ApStatusIdIndex` (`ApStatusId`),
  KEY `ApIdIndex` (`ApId`),
  KEY `CheckinTimeIndex` (`CheckinTime`),
  CONSTRAINT `assid_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `assid_statusid_fk` FOREIGN KEY (`ApStatusId`) REFERENCES `ap_status` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ap_status_wifinetworks`
--

DROP TABLE IF EXISTS `ap_status_wifinetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_status_wifinetworks` (
  `ApId` int(10) unsigned NOT NULL,
  `CheckinTime` datetime NOT NULL DEFAULT current_timestamp(),
  `WiFiName` varchar(33) DEFAULT '',
  `InterfaceName` varchar(20) NOT NULL DEFAULT '',
  `Channel` tinyint(4) DEFAULT 0,
  `ChannelWidth` smallint(6) DEFAULT 20,
  `Frequency` int(4) DEFAULT 0,
  `Bssid` varchar(20) DEFAULT '',
  `Network` varchar(20) DEFAULT '',
  PRIMARY KEY (`ApId`,`InterfaceName`),
  KEY `ApIdIndex` (`ApId`),
  KEY `CheckinTimeIndex` (`CheckinTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `ApStatusId` int(10) unsigned NOT NULL,
  `CheckinTime` datetime DEFAULT NULL,
  `MacAddress` varchar(20) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `IpAddress` varchar(20) DEFAULT NULL,
  `IsAuthenticated` tinyint(1) DEFAULT 0,
  `DownloadSpeed` varchar(20) DEFAULT NULL,
  `UploadSpeed` varchar(20) DEFAULT NULL,
  `AssociatedSSID` varchar(20) DEFAULT NULL,
  `AssociatedFrequency` int(4) DEFAULT NULL,
  `SignalAverage` int(5) DEFAULT NULL,
  `RxBitRate` float(5,2) DEFAULT NULL,
  `TxBitRate` float(5,2) DEFAULT NULL,
  `IsConnected` tinyint(1) DEFAULT 0,
  `FullName` varchar(50) NOT NULL DEFAULT '',
  `ConnectionType` tinyint(4) NOT NULL DEFAULT 0,
  `UserType` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MacAddress` (`MacAddress`),
  KEY `client_apid` (`ApId`),
  KEY `client_checkintime` (`CheckinTime`),
  CONSTRAINT `c_apid_fk` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `firmware_upgrades`
--

DROP TABLE IF EXISTS `firmware_upgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `firmware_upgrades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MacAddress` varchar(20) NOT NULL,
  `CurrentFirmwareVersion` varchar(15) DEFAULT NULL,
  `FirmwareUpgrade` tinyint(4) DEFAULT NULL,
  `FirmwareVersion` varchar(15) DEFAULT NULL,
  `UpgradeConfigBackup` tinyint(4) DEFAULT NULL,
  `FirmwareUpgradeSchedule` tinyint(4) DEFAULT NULL,
  `FirmwareUpgradeScheduleDateTime` varchar(30) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `WifilanAPId` int(11) NOT NULL,
  `WifilanServerId` int(11) NOT NULL,
  `WifilanCustomerId` int(11) NOT NULL,
  `CreatedOn` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `WifilanServerId` smallint(6) DEFAULT NULL,
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `filesize` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hardware` (`board`),
  KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neighbor_ap`
--

DROP TABLE IF EXISTS `neighbor_ap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neighbor_ap` (
  `NApMacAddress` varchar(20) NOT NULL,
  `NApStatus` tinyint(3) unsigned DEFAULT 0,
  `NApDescription` varchar(40) NOT NULL DEFAULT '',
  `CreatedOn` timestamp NULL DEFAULT current_timestamp() COMMENT 'This time will be in system timezone',
  `ModifiedOn` timestamp NULL DEFAULT current_timestamp() COMMENT 'This time will be in system timezone',
  `LastSeenOn` timestamp NULL DEFAULT current_timestamp() COMMENT 'This time will be in system timezone',
  `WifilanServerId` varchar(10) NOT NULL,
  `WifilanCustomerId` int(11) NOT NULL,
  PRIMARY KEY (`NApMacAddress`,`WifilanServerId`,`WifilanCustomerId`),
  KEY `neighbor_macaddress` (`NApMacAddress`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neighbor_ap_status`
--

DROP TABLE IF EXISTS `neighbor_ap_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neighbor_ap_status` (
  `ApId` int(10) unsigned NOT NULL,
  `NApMacAddress` varchar(20) NOT NULL,
  `LastCheckinTime` datetime DEFAULT NULL,
  `LastStatusId` int(11) DEFAULT NULL,
  `SSID` varchar(33) NOT NULL,
  `TSF` bigint(20) DEFAULT NULL,
  `Frequency` smallint(6) DEFAULT 0,
  `Rssi` tinyint(4) NOT NULL DEFAULT -100,
  `PrimaryChannel` tinyint(4) DEFAULT 0,
  `SecondaryChannel` tinyint(4) DEFAULT 0,
  `ChannelWidth` varchar(8) DEFAULT NULL,
  `StaChannelWidth` varchar(8) DEFAULT NULL,
  `FirstCenterFrequency` varchar(8) DEFAULT NULL,
  `SecondCenterFrequency` varchar(8) DEFAULT NULL,
  `Authentication` varchar(20) DEFAULT NULL,
  `Security` varchar(20) DEFAULT 'None',
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ApId`,`NApMacAddress`),
  KEY `neighbor_apid` (`ApId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rogue_ap_classification`
--

DROP TABLE IF EXISTS `rogue_ap_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rogue_ap_classification` (
  `ApId` int(10) unsigned NOT NULL,
  `NApMacAddress` varchar(20) NOT NULL,
  `LastCheckinTime` datetime DEFAULT NULL,
  `LastStatusId` int(11) DEFAULT NULL,
  `SSID` varchar(33) NOT NULL,
  `TSF` bigint(20) DEFAULT NULL,
  `Frequency` smallint(6) DEFAULT 0,
  `Rssi` tinyint(4) NOT NULL DEFAULT -100,
  `PrimaryChannel` tinyint(4) DEFAULT 0,
  `SecondaryChannel` tinyint(4) DEFAULT 0,
  `ChannelWidth` varchar(8) DEFAULT NULL,
  `StaChannelWidth` varchar(8) DEFAULT NULL,
  `FirstCenterFrequency` varchar(8) DEFAULT NULL,
  `SecondCenterFrequency` varchar(8) DEFAULT NULL,
  `Authentication` varchar(20) DEFAULT NULL,
  `Security` varchar(20) DEFAULT 'None',
  `Description` varchar(150) DEFAULT 'NULL',
  `EnableRogue` varchar(10) DEFAULT '0',
  PRIMARY KEY (`ApId`,`NApMacAddress`),
  KEY `neighbor_apid` (`ApId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `rogue_ap_classification`
--



--
-- Table structure for table `ap_cellular_info`
--

DROP TABLE IF EXISTS `ap_cellular_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `ap_cellular_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `SimNo` tinyint(4) NOT NULL,
  `ModemVendor` varchar(50) NOT NULL DEFAULT 'Unknown',
  `IMEI` varchar(20) NOT NULL DEFAULT '',
  `IMSI` varchar(20) NOT NULL DEFAULT '',
  `RSSI` int(5) DEFAULT NULL,
  `RSRP` bigint(20) DEFAULT NULL,
  `MCC` varchar(4) NOT NULL DEFAULT '0',
  `MNC` varchar(4) NOT NULL DEFAULT '0',
  `TxBytes` bigint(20) DEFAULT NULL,
  `RxBytes` bigint(20) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `RxRate` bigint(20) DEFAULT NULL,
  `TxRate` bigint(20) DEFAULT NULL,
  `IPv4` varchar(16) NOT NULL DEFAULT '',
  `IPv6` varchar(50) NOT NULL DEFAULT '',
  `PrimaryDnsIpv4` varchar(16) NOT NULL DEFAULT '',
  `SecondaryDnsIpv4` varchar(16) NOT NULL DEFAULT '',
  `NextHopIpv4` varchar(16) NOT NULL DEFAULT '',
  `DnsRttMin` float(5,2) DEFAULT NULL,
  `DnsRttMax` float(5,2) DEFAULT NULL,
  `DnsRttAvg` float(5,2) DEFAULT NULL,
  `NextHopRTTMin` float(5,2) DEFAULT NULL,
  `NextHopRTTMax` float(5,2) DEFAULT NULL,
  `NextHopRTTAvg` float(5,2) DEFAULT NULL,
  `PnetRTTMin` float(5,2) NOT NULL DEFAULT 0.00,
  `PnetRTTMax` float(5,2) NOT NULL DEFAULT 0.00,
  `PnetRTTAvg` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTMin` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTMax` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTAvg` float(5,2) NOT NULL DEFAULT 0.00,
  `NetType` varchar(3) DEFAULT NULL,
  `SimStatus` tinyint(3) unsigned NOT NULL DEFAULT 254,
  `RoamingStatus` tinyint(4) NOT NULL DEFAULT 127 COMMENT '127-Unknown, 0-Not Roaming, 1-Roaming',
  `SimServiceStatus` tinyint(4) NOT NULL DEFAULT 127 COMMENT '127-Unknown',
  `SimServiceDomain` tinyint(3) unsigned NOT NULL DEFAULT 254 COMMENT '254-Unknown',
  `ModemVendorId` tinyint(4) DEFAULT NULL,
  `LinkStatus` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ApId` (`ApId`,`SimNo`),
  KEY `ap_cellular_info_lookup_by_apid` (`ApId`),
  CONSTRAINT `apid_fk1` FOREIGN KEY (`ApId`) REFERENCES `ap` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ap_cellular_status`
--

DROP TABLE IF EXISTS `ap_cellular_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `ap_cellular_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ApId` int(10) unsigned DEFAULT NULL,
  `SimNo` tinyint(4) NOT NULL,
  `ModemVendor` varchar(50) NOT NULL DEFAULT 'Unknown',
  `IMEI` varchar(20) NOT NULL DEFAULT '',
  `IMSI` varchar(20) NOT NULL DEFAULT '',
  `MCC` varchar(4) NOT NULL DEFAULT '0',
  `MNC` varchar(4) NOT NULL DEFAULT '0',
  `TxBytes` bigint(20) DEFAULT NULL,
  `RxBytes` bigint(20) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `RxRate` bigint(20) DEFAULT NULL,
  `TxRate` bigint(20) DEFAULT NULL,
  `IPv4` varchar(16) NOT NULL DEFAULT '',
  `IPv6` varchar(50) NOT NULL DEFAULT '',
  `PrimaryDnsIpv4` varchar(16) NOT NULL DEFAULT '',
  `SecondaryDnsIpv4` varchar(16) NOT NULL DEFAULT '',
  `NextHopIpv4` varchar(16) NOT NULL DEFAULT '',
  `DnsRttMin` float(5,2) DEFAULT NULL,
  `DnsRttMax` float(5,2) DEFAULT NULL,
  `DnsRttAvg` float(5,2) DEFAULT NULL,
  `NextHopRTTMin` float(5,2) DEFAULT NULL,
  `NextHopRTTMax` float(5,2) DEFAULT NULL,
  `NextHopRTTAvg` float(5,2) DEFAULT NULL,
  `PnetRTTMin` float(5,2) NOT NULL DEFAULT 0.00,
  `PnetRTTMax` float(5,2) NOT NULL DEFAULT 0.00,
  `PnetRTTAvg` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTMin` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTMax` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTAvg` float(5,2) NOT NULL DEFAULT 0.00,
  `NetType` varchar(3) DEFAULT NULL,
  `RSSI` tinyint(5) DEFAULT NULL,
  `RSRP` tinyint(5) DEFAULT NULL,
  `SimStatus` tinyint(3) unsigned NOT NULL DEFAULT 254,
  `RoamingStatus` tinyint(4) NOT NULL DEFAULT 127 COMMENT '127-Unknown, 0-Not Roaming, 1-Roaming',
  `SimServiceStatus` tinyint(4) NOT NULL DEFAULT 127 COMMENT '127-Unknown',
  `SimServiceDomain` tinyint(3) unsigned NOT NULL DEFAULT 254 COMMENT '254-Unknown',
  `LinkStatus` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ap_cellular_info_lookup_by_apid_simno` (`ApId`,`SimNo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ap_gps_tracking`
--

DROP TABLE IF EXISTS `ap_gps_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_gps_tracking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `APId` int(11) NOT NULL COMMENT 'ap table Access point Id ',
  `WifilanAPId` int(11) NOT NULL COMMENT 'Wifilan server Access point Id ',
  `MacAddress` varchar(20) NOT NULL COMMENT 'Access Point MAC Address',
  `WifilanServerId` smallint(6) DEFAULT NULL,
  `WifilanCustomerId` int(11) NOT NULL,
  `WifilanOperatorId` int(11) DEFAULT NULL,
  `WifilanLocationId` int(11) NOT NULL,
  `GpsLat` varchar(10) DEFAULT NULL,
  `GpsLong` varchar(10) DEFAULT NULL,
  `GpsUpdateTime` timestamp NULL DEFAULT current_timestamp() COMMENT 'This time will be in system timezone',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ap_tunnel_info`
--

DROP TABLE IF EXISTS `ap_tunnel_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `ap_tunnel_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) DEFAULT NULL,
  `ApId` int(10) unsigned DEFAULT NULL,
  `SimNo` tinyint(4) NOT NULL,
  `TxBytes` bigint(20) DEFAULT NULL,
  `RxBytes` bigint(20) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `RxRate` bigint(20) DEFAULT NULL,
  `TxRate` bigint(20) DEFAULT NULL,
  `NextHopIpv4` varchar(16) NOT NULL DEFAULT '',
  `DnsRttMin` float(5,2) DEFAULT NULL,
  `DnsRttMax` float(5,2) DEFAULT NULL,
  `DnsRttAvg` float(5,2) DEFAULT NULL,
  `NextHopRTTMin` float(5,2) DEFAULT NULL,
  `NextHopRTTMax` float(5,2) DEFAULT NULL,
  `NextHopRTTAvg` float(5,2) DEFAULT NULL,
  `PnetRTTMin` float(5,2) NOT NULL DEFAULT 0.00,
  `PnetRTTMax` float(5,2) NOT NULL DEFAULT 0.00,
  `PnetRTTAvg` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTMin` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTMax` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTAvg` float(5,2) NOT NULL DEFAULT 0.00,
  `Ip` varchar(16) DEFAULT NULL,
  `Pdns` varchar(16) DEFAULT NULL,
  `GatewayIp` varchar(16) DEFAULT NULL,
  `LinkStatus` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name` (`Name`,`ApId`),
  KEY `ap_cellular_info_lookup_by_apid` (`ApId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;

/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `ap_tunnel_status`
--

DROP TABLE IF EXISTS `ap_tunnel_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ap_tunnel_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Name` varchar(10) DEFAULT NULL,
  `ApId` int(10) unsigned DEFAULT NULL,
  `SimNo` tinyint(4) NOT NULL,
  `TxBytes` bigint(20) DEFAULT NULL,
  `RxBytes` bigint(20) DEFAULT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `RxRate` bigint(20) DEFAULT NULL,
  `TxRate` bigint(20) DEFAULT NULL,
  `NextHopIpv4` varchar(16) NOT NULL DEFAULT '',
  `DnsRttMin` float(5,2) DEFAULT NULL,
  `DnsRttMax` float(5,2) DEFAULT NULL,
  `DnsRttAvg` float(5,2) DEFAULT NULL,
  `NextHopRTTMin` float(5,2) DEFAULT NULL,
  `NextHopRTTMax` float(5,2) DEFAULT NULL,
  `NextHopRTTAvg` float(5,2) DEFAULT NULL,
  `PnetRTTMin` float(5,2) NOT NULL DEFAULT 0.00,
  `PnetRTTMax` float(5,2) NOT NULL DEFAULT 0.00,
  `PnetRTTAvg` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTMin` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTMax` float(5,2) NOT NULL DEFAULT 0.00,
  `SnetRTTAvg` float(5,2) NOT NULL DEFAULT 0.00,
  `Ip` varchar(16) DEFAULT NULL,
  `Pdns` varchar(16) DEFAULT NULL,
  `GatewayIp` varchar(16) DEFAULT NULL,
  `LinkStatus` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ap_cellular_info_lookup_by_apid` (`ApId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;

/*!40101 SET character_set_client = @saved_cs_client */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;












-- Dump completed on 2021-10-26  8:07:28
