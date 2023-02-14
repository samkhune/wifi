-- MariaDB dump 10.17  Distrib 10.4.13-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: radius
-- ------------------------------------------------------
-- Server version	10.4.13-MariaDB-1:10.4.13+maria~bionic-log

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
-- Table structure for table `auth_group`
--

CREATE DATABASE IF NOT EXISTS radius;
USE radius;

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `background_task`
--

DROP TABLE IF EXISTS `background_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `background_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint(20) NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int(10) unsigned DEFAULT NULL,
  `creator_content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background_task_creator_content_type_61cc9af3_fk_django_co` (`creator_content_type_id`),
  KEY `background_task_task_name_4562d56a` (`task_name`),
  KEY `background_task_task_hash_d8f233bd` (`task_hash`),
  KEY `background_task_priority_88bdbce9` (`priority`),
  KEY `background_task_run_at_7baca3aa` (`run_at`),
  KEY `background_task_queue_1d5f3a40` (`queue`),
  KEY `background_task_attempts_a9ade23d` (`attempts`),
  KEY `background_task_failed_at_b81bba14` (`failed_at`),
  KEY `background_task_locked_by_db7779e3` (`locked_by`),
  KEY `background_task_locked_at_0fb0f225` (`locked_at`),
  CONSTRAINT `background_task_creator_content_type_61cc9af3_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `background_task_completedtask`
--

DROP TABLE IF EXISTS `background_task_completedtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `background_task_completedtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint(20) NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int(10) unsigned DEFAULT NULL,
  `creator_content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background_task_comp_creator_content_type_21d6a741_fk_django_co` (`creator_content_type_id`),
  KEY `background_task_completedtask_task_name_388dabc2` (`task_name`),
  KEY `background_task_completedtask_task_hash_91187576` (`task_hash`),
  KEY `background_task_completedtask_priority_9080692e` (`priority`),
  KEY `background_task_completedtask_run_at_77c80f34` (`run_at`),
  KEY `background_task_completedtask_queue_61fb0415` (`queue`),
  KEY `background_task_completedtask_attempts_772a6783` (`attempts`),
  KEY `background_task_completedtask_failed_at_3de56618` (`failed_at`),
  KEY `background_task_completedtask_locked_by_edc8a213` (`locked_by`),
  KEY `background_task_completedtask_locked_at_29c62708` (`locked_at`),
  CONSTRAINT `background_task_comp_creator_content_type_21d6a741_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_accounting`
--

DROP TABLE IF EXISTS `radius_accounting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_accounting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_macaddress` varchar(17) NOT NULL,
  `client_ipv4address` char(39) DEFAULT NULL,
  `controller_macaddress` varchar(17) NOT NULL,
  `controller_ipv4address` char(39) DEFAULT NULL,
  `sessionid` varchar(64) NOT NULL,
  `multisessionid` varchar(64) DEFAULT NULL,
  `uniqueid` varchar(32) NOT NULL,
  `starttime` datetime(6) NOT NULL,
  `endtime` datetime(6) DEFAULT NULL,
  `updatetime` datetime(6) NOT NULL,
  `sessiontime` bigint(20) DEFAULT NULL,
  `downloadbytes` bigint(20) DEFAULT NULL,
  `uploadbytes` bigint(20) DEFAULT NULL,
  `terminatecause` varchar(19) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `updatetime_ts` int(10) unsigned GENERATED ALWAYS AS (unix_timestamp(`updatetime`)) VIRTUAL,
  PRIMARY KEY (`id`),
  KEY `radius_accounting_customer_id_a51de681` (`customer_id`),
  KEY `radius_accounting_location_id_901e94f6` (`location_id`),
  KEY `radius_acco_locatio_58daee_idx` (`location_id`,`updatetime_ts`),
  KEY `radius_accounting_endtime_f1481fe0` (`endtime`),
  KEY `radius_acco_user_id_9df806_idx` (`user_id`,`location_id`,`sessionid`,`uniqueid`,`client_macaddress`,`controller_macaddress`,`starttime`),
  KEY `radius_accounting_lookup_by_user_id` (`user_id`),
  KEY `radius_accounting_lookup_by_customer_starttime` (`customer_id`,`starttime`),
  KEY `radius_accounting_idx_updatetime` (`updatetime`),
  CONSTRAINT `accounting_customer` FOREIGN KEY (`customer_id`) REFERENCES `wifilan`.`adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accounting_location` FOREIGN KEY (`location_id`) REFERENCES `wifilan`.`location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radius_accounting_user_id_8cf98230_fk_radius_user_id` FOREIGN KEY (`user_id`) REFERENCES `radius_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_activeusersummary`
--

DROP TABLE IF EXISTS `radius_activeusersummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_activeusersummary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `client_macaddress` varchar(17) NOT NULL,
  `online` tinyint(1) NOT NULL,
  `downloadbytes` bigint(20) DEFAULT NULL,
  `uploadbytes` bigint(20) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sessiontime` bigint(20) DEFAULT NULL,
  `sessioncount` bigint(20) DEFAULT NULL,
  `logout` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_mac_location_unq` (`user_id`,`client_macaddress`,`location_id`),
  KEY `radius_activeusersummary_customer_id_4ebf321d` (`customer_id`),
  KEY `radius_activeusersummary_location_id_f1e75056` (`location_id`),
  CONSTRAINT `radius_activeusersummary_user_id_522745f4_fk_radius_user_id` FOREIGN KEY (`user_id`) REFERENCES `radius_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_autologin`
--

DROP TABLE IF EXISTS `radius_autologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_autologin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macaddress` varchar(17) NOT NULL,
  `created` datetime(6) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `expirydate` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `autologintype` varchar(18) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mac_location_uniq` (`location_id`,`macaddress`),
  KEY `radius_autologin_user_id_4b21e8e9_fk_radius_user_id` (`user_id`),
  KEY `radius_autologin_location_id_e96d0f3e` (`location_id`),
  CONSTRAINT `autologin_location` FOREIGN KEY (`location_id`) REFERENCES `wifilan`.`location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radius_autologin_user_id_4b21e8e9_fk_radius_user_id` FOREIGN KEY (`user_id`) REFERENCES `radius_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_device`
--

DROP TABLE IF EXISTS `radius_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipv4address` char(39) NOT NULL,
  `devicetype_id` int(11) NOT NULL,
  `secret` varchar(128) NOT NULL,
  `macaddress` varchar(17) DEFAULT NULL,
  `nasid` varchar(100) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `eapconfig_id` int(11) DEFAULT NULL,
  `lastmodified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ipv4address` (`ipv4address`),
  UNIQUE KEY `location_id` (`location_id`),
  UNIQUE KEY `macaddress` (`macaddress`),
  UNIQUE KEY `nasid` (`nasid`),
  KEY `radius_device_customer_id_0e0f08b8` (`customer_id`),
  KEY `radius_device_devicetype_id_3ec527be` (`devicetype_id`),
  KEY `radius_device_eapconfig_id_3f9aaa7e_fk_radius_eapconfig_id` (`eapconfig_id`),
  CONSTRAINT `device_customer` FOREIGN KEY (`customer_id`) REFERENCES `wifilan`.`adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `device_devicetype` FOREIGN KEY (`devicetype_id`) REFERENCES `wifilan`.`devicetype` (`id`),
  CONSTRAINT `device_location` FOREIGN KEY (`location_id`) REFERENCES `wifilan`.`location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radius_device_eapconfig_id_3f9aaa7e_fk_radius_eapconfig_id` FOREIGN KEY (`eapconfig_id`) REFERENCES `radius_eapconfig` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_eapconfig`
--

DROP TABLE IF EXISTS `radius_eapconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_eapconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacert` longtext NOT NULL,
  `cert` longtext NOT NULL,
  `key` longtext NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `radius_eapconfig_customer_id_5d99ae13` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_event`
--

DROP TABLE IF EXISTS `radius_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime(6) NOT NULL,
  `eventID` varchar(50) NOT NULL,
  `severity` varchar(5) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `client_macaddress` varchar(17) DEFAULT NULL,
  `client_ipv4address` char(39) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `radius_event_user_id_dda04ceb_fk_radius_user_id` (`user_id`),
  KEY `radius_event_customer_id_394a2ce3` (`customer_id`),
  KEY `radius_event_location_id_dbab7dc6` (`location_id`),
  KEY `events_idx` (`customer_id`,`timestamp`,`eventID`,`severity`,`location_id`),
  CONSTRAINT `event_customer` FOREIGN KEY (`customer_id`) REFERENCES `wifilan`.`adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_location` FOREIGN KEY (`location_id`) REFERENCES `wifilan`.`location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radius_event_user_id_dda04ceb_fk_radius_user_id` FOREIGN KEY (`user_id`) REFERENCES `radius_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_postauth`
--

DROP TABLE IF EXISTS `radius_postauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_postauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_macaddress` varchar(17) NOT NULL,
  `client_ipv4address` char(39) DEFAULT NULL,
  `useragent` varchar(250) DEFAULT NULL,
  `url` varchar(450) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sessionid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `radius_postauth_customer_id_49160bef` (`customer_id`),
  KEY `radius_postauth_location_id_890d22bf` (`location_id`),
  KEY `radius_post_user_id_c8a1ac_idx` (`user_id`,`client_macaddress`,`location_id`,`customer_id`,`sessionid`),
  KEY `radius_post_session_30a1a1_idx` (`sessionid`,`client_macaddress`),
  CONSTRAINT `postauth_customer` FOREIGN KEY (`customer_id`) REFERENCES `wifilan`.`adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `postauth_location` FOREIGN KEY (`location_id`) REFERENCES `wifilan`.`location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `radius_postauth_user_id_2efeace8_fk_radius_user_id` FOREIGN KEY (`user_id`) REFERENCES `radius_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_user`
--

DROP TABLE IF EXISTS `radius_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `usertype` varchar(15) NOT NULL,
  `userstatus` varchar(15) NOT NULL,
  `restrictlocation` tinyint(1) NOT NULL,
  `createddate` datetime(6) NOT NULL,
  `lastrechargedate` datetime(6) NOT NULL,
  `expirydate` datetime(6) DEFAULT NULL,
  `statuschangedate` datetime(6) DEFAULT NULL,
  `data_limit` bigint(30) DEFAULT NULL,
  `time_limit` bigint(20) DEFAULT NULL,
  `last_topup_date` datetime DEFAULT NULL,
  `total_topup_count` int(10) DEFAULT NULL,
  `lastmodified` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `plan_id` int(11) DEFAULT NULL,
  `policy_id` int(11) NOT NULL,
  `prepaidgroup_id` int(11) DEFAULT NULL,
  `statuschangereason` varchar(200) DEFAULT NULL,
  `app_id` varchar(200) DEFAULT NULL,
  `app_username` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `radius_user_customer_id_856d3cdc` (`customer_id`),
  KEY `radius_user_location_id_729a498d` (`location_id`),
  KEY `radius_user_plan_id_98cd55f4` (`plan_id`),
  KEY `radius_user_policy_id_837e5e50` (`policy_id`),
  KEY `radius_user_prepaidgroup_id_a4024640` (`prepaidgroup_id`),
  CONSTRAINT `user_customer` FOREIGN KEY (`customer_id`) REFERENCES `wifilan`.`adm_customer` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_location` FOREIGN KEY (`location_id`) REFERENCES `wifilan`.`location` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_plan` FOREIGN KEY (`plan_id`) REFERENCES `wifilan`.`bill_plan` (`id`),
  CONSTRAINT `user_policy` FOREIGN KEY (`policy_id`) REFERENCES `wifilan`.`policy` (`id`),
  CONSTRAINT `user_prepaidgroup` FOREIGN KEY (`prepaidgroup_id`) REFERENCES `wifilan`.`bill_voucher_batch` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_userdevice`
--

DROP TABLE IF EXISTS `radius_userdevice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_userdevice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macaddress` varchar(17) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_mac_unique` (`user_id`,`macaddress`),
  CONSTRAINT `radius_userdevice_user_id_10b35f5e_fk_radius_user_id` FOREIGN KEY (`user_id`) REFERENCES `radius_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_userinfo`
--

DROP TABLE IF EXISTS `radius_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_userinfo` (
  `user_id` int(11) NOT NULL,
  `fullname` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `age` smallint(5) unsigned DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `state` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL,
  `phone` varchar(60) DEFAULT NULL,
  `aptnumber` varchar(20) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `radius_userinfo_user_id_3d093010_fk_radius_user_id` FOREIGN KEY (`user_id`) REFERENCES `radius_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `radius_userrestrictions`
--

DROP TABLE IF EXISTS `radius_userrestrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `radius_userrestrictions` (
  `user_id` int(11) NOT NULL,
  `lastmodified` datetime(6) NOT NULL,
  `validity` int(10) unsigned DEFAULT NULL,
  `validity_unit` smallint(5) unsigned DEFAULT NULL,
  `concurrency_limit` smallint(5) unsigned DEFAULT NULL,
  `daily_session_limit` smallint(5) unsigned DEFAULT NULL,
  `max_device_limit` smallint(5) unsigned DEFAULT NULL,
  `uploadrate` int(10) unsigned DEFAULT NULL,
  `uploadrate_unit` smallint(5) unsigned DEFAULT NULL,
  `downloadrate` int(10) unsigned DEFAULT NULL,
  `downloadrate_unit` smallint(5) unsigned DEFAULT NULL,
  `total_bw_quota` double DEFAULT NULL,
  `total_bw_quota_unit` smallint(5) unsigned DEFAULT NULL,
  `daily_bw_quota` int(10) unsigned DEFAULT NULL,
  `daily_bw_quota_unit` smallint(5) unsigned DEFAULT NULL,
  `total_time_quota` double DEFAULT NULL,
  `total_time_quota_unit` smallint(5) unsigned DEFAULT NULL,
  `daily_time_quota` int(10) unsigned DEFAULT NULL,
  `daily_time_quota_unit` smallint(5) unsigned DEFAULT NULL,
  `session_timeout` int(10) unsigned DEFAULT NULL,
  `session_timeout_unit` smallint(5) unsigned DEFAULT NULL,
  `idle_timeout` int(10) unsigned DEFAULT NULL,
  `idle_timeout_unit` smallint(5) unsigned DEFAULT NULL,
  `fup` tinyint(1) DEFAULT NULL,
  `fup_downloadrate` int(10) unsigned DEFAULT NULL,
  `fup_downloadrate_unit` smallint(5) unsigned DEFAULT NULL,
  `fup_trigger_quota` int(10) unsigned DEFAULT NULL,
  `fup_trigger_unit` smallint(5) unsigned DEFAULT NULL,
  `fup_uploadrate` int(10) unsigned DEFAULT NULL,
  `fup_uploadrate_unit` smallint(5) unsigned DEFAULT NULL,
  `filter_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `radius_userrestrictions_user_id_1a382c9b_fk_radius_user_id` FOREIGN KEY (`user_id`) REFERENCES `radius_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-26  8:05:08
