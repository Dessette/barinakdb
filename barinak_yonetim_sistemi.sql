CREATE DATABASE  IF NOT EXISTS `a` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `a`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: a
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add barinak',7,'add_barinak'),(26,'Can change barinak',7,'change_barinak'),(27,'Can delete barinak',7,'delete_barinak'),(28,'Can view barinak',7,'view_barinak'),(29,'Can add hayvan',8,'add_hayvan'),(30,'Can change hayvan',8,'change_hayvan'),(31,'Can delete hayvan',8,'delete_hayvan'),(32,'Can view hayvan',8,'view_hayvan'),(33,'Can add ilgilenir',9,'add_ilgilenir'),(34,'Can change ilgilenir',9,'change_ilgilenir'),(35,'Can delete ilgilenir',9,'delete_ilgilenir'),(36,'Can view ilgilenir',9,'view_ilgilenir'),(37,'Can add personel',10,'add_personel'),(38,'Can change personel',10,'change_personel'),(39,'Can delete personel',10,'delete_personel'),(40,'Can view personel',10,'view_personel'),(41,'Can add sahiplenen',11,'add_sahiplenen'),(42,'Can change sahiplenen',11,'change_sahiplenen'),(43,'Can delete sahiplenen',11,'delete_sahiplenen'),(44,'Can view sahiplenen',11,'view_sahiplenen'),(45,'Can add sponsor',12,'add_sponsor'),(46,'Can change sponsor',12,'change_sponsor'),(47,'Can delete sponsor',12,'delete_sponsor'),(48,'Can view sponsor',12,'view_sponsor'),(49,'Can add sponsor oldu',13,'add_sponsoroldu'),(50,'Can change sponsor oldu',13,'change_sponsoroldu'),(51,'Can delete sponsor oldu',13,'delete_sponsoroldu'),(52,'Can view sponsor oldu',13,'view_sponsoroldu'),(53,'Can add ziyaretci',14,'add_ziyaretci'),(54,'Can change ziyaretci',14,'change_ziyaretci'),(55,'Can delete ziyaretci',14,'delete_ziyaretci'),(56,'Can view ziyaretci',14,'view_ziyaretci'),(57,'Can add ziyaret edildi',15,'add_ziyaretedildi'),(58,'Can change ziyaret edildi',15,'change_ziyaretedildi'),(59,'Can delete ziyaret edildi',15,'delete_ziyaretedildi'),(60,'Can view ziyaret edildi',15,'view_ziyaretedildi');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$870000$SzAOFzddZ1nVdpaz9jZ1SF$+OsSswDnjvL/0XqhBipjsWSHh6uckv0WXELqB6IDydg=',NULL,1,'kaan','','','',1,1,'2024-08-08 10:32:53.310683');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barinak`
--

DROP TABLE IF EXISTS `barinak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barinak` (
  `BarinakID` int NOT NULL,
  `Isim` varchar(255) DEFAULT NULL,
  `Adres` varchar(255) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`BarinakID`),
  UNIQUE KEY `BarinakID_UNIQUE` (`BarinakID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barinak`
--

LOCK TABLES `barinak` WRITE;
/*!40000 ALTER TABLE `barinak` DISABLE KEYS */;
INSERT INTO `barinak` VALUES (1,'Gökkuşağı Barınağı','Huzur Sokak, Ankara','0123456780','barinak1@example.com'),(2,'Dostluk Barınağı','İnönü Sokak, İstanbul','0123456781','barinak2@example.com'),(3,'Umut Barınağı','Karanfil Sokak, İzmir','0123456782','barinak3@example.com'),(4,'Bulut Barınağı','Sevgi Sokak, Tekirdağ','0123456783','barinak4@example.com'),(5,'Gökyüzü Barınağı','Yalın Sokak, İstanbul','0123456784','barinak5@example.com'),(6,'Pati Barınağı','Cumhuriyet Sokak, Ankara','0123456785','barinak6@example.com'),(7,'Sevgi Yuva Barınağı','Gül Sokak, Bursa','0123456786','barinak7@example.com');
/*!40000 ALTER TABLE `barinak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'api','barinak'),(8,'api','hayvan'),(9,'api','ilgilenir'),(10,'api','personel'),(11,'api','sahiplenen'),(12,'api','sponsor'),(13,'api','sponsoroldu'),(14,'api','ziyaretci'),(15,'api','ziyaretedildi'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-08 10:32:06.818175'),(2,'auth','0001_initial','2024-08-08 10:32:07.400353'),(3,'admin','0001_initial','2024-08-08 10:32:07.550470'),(4,'admin','0002_logentry_remove_auto_add','2024-08-08 10:32:07.557485'),(5,'admin','0003_logentry_add_action_flag_choices','2024-08-08 10:32:07.563993'),(6,'api','0001_initial','2024-08-08 10:32:07.572996'),(7,'contenttypes','0002_remove_content_type_name','2024-08-08 10:32:07.655065'),(8,'auth','0002_alter_permission_name_max_length','2024-08-08 10:32:07.718719'),(9,'auth','0003_alter_user_email_max_length','2024-08-08 10:32:07.763257'),(10,'auth','0004_alter_user_username_opts','2024-08-08 10:32:07.779277'),(11,'auth','0005_alter_user_last_login_null','2024-08-08 10:32:07.900936'),(12,'auth','0006_require_contenttypes_0002','2024-08-08 10:32:07.905445'),(13,'auth','0007_alter_validators_add_error_messages','2024-08-08 10:32:07.912950'),(14,'auth','0008_alter_user_username_max_length','2024-08-08 10:32:07.993517'),(15,'auth','0009_alter_user_last_name_max_length','2024-08-08 10:32:08.069589'),(16,'auth','0010_alter_group_name_max_length','2024-08-08 10:32:08.085603'),(17,'auth','0011_update_proxy_permissions','2024-08-08 10:32:08.094827'),(18,'auth','0012_alter_user_first_name_max_length','2024-08-08 10:32:08.159888'),(19,'sessions','0001_initial','2024-08-08 10:32:08.191414');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hayvan`
--

DROP TABLE IF EXISTS `hayvan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hayvan` (
  `HayvanID` int NOT NULL,
  `Isim` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Tur` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cins` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Cinsiyet` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Yas` int DEFAULT NULL,
  `Saglik_Durumu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Sahiplenme_Durumu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Giris_Tarihi` date DEFAULT NULL,
  `HayvanBarinakID` int NOT NULL,
  PRIMARY KEY (`HayvanID`),
  UNIQUE KEY `HayvanID_UNIQUE` (`HayvanID`),
  KEY `HayvanBarinakID` (`HayvanBarinakID`),
  CONSTRAINT `HayvanBarinakID` FOREIGN KEY (`HayvanBarinakID`) REFERENCES `barinak` (`BarinakID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hayvan`
--

LOCK TABLES `hayvan` WRITE;
/*!40000 ALTER TABLE `hayvan` DISABLE KEYS */;
INSERT INTO `hayvan` VALUES (101,'Maviş','Kedi','Van Kedisi','Dişi',2,'Sağlıklı','Sahiplenildi','2023-01-01',1),(102,'Karabaş','Köpek','Golden Retriever','Erkek',3,'Hastalık: Parvovirüs','Bekliyor','2023-01-02',1),(103,'Boncuk','Kedi','Tekir','Dişi',1,'Sağlıklı','Bekliyor','2023-02-03',2),(104,'Zeytin','Köpek','Labrador','Erkek',4,'Sağlıklı','Sahiplenildi','2023-03-04',3),(105,'Pamuk','Kedi','Angora','Dişi',2,'Hastalık: FIV','Bekliyor','2023-04-05',2),(106,'Tarçın','Köpek','Beagle','Erkek',3,'Sağlıklı','Bekliyor','2023-05-06',1),(107,'Fıstık','Kedi','Scottish Fold','Dişi',1,'Sağlıklı','Sahiplenildi','2023-06-07',3),(108,'Duman','Köpek','Husky','Erkek',5,'Sağlıklı','Bekliyor','2023-07-08',4),(109,'Limon','Kedi','Siamese','Dişi',3,'Hastalık: Leukemia','Bekliyor','2023-08-09',4),(110,'Köpük','Köpek','Poodle','Erkek',4,'Sağlıklı','Bekliyor','2023-09-10',5),(111,'Leo','Kedi','Maine Coon','Erkek',2,'Sağlıklı','Sahiplenildi','2023-10-11',6),(112,'Rex','Köpek','Rottweiler','Erkek',4,'Sağlıklı','Bekliyor','2023-11-12',6),(113,'Minnie','Kedi','British Shorthair','Dişi',3,'Sağlıklı','Bekliyor','2023-12-13',5),(114,'Bruno','Köpek','Boxer','Erkek',5,'Sağlıklı','Bekliyor','2023-01-14',7),(115,'Nala','Kedi','Bengal','Dişi',1,'Sağlıklı','Sahiplenildi','2023-02-15',7),(116,'Rocky','Köpek','German Shepherd','Erkek',4,'Hastalık: Kennel Cough','Bekliyor','2023-03-16',6),(117,'Lily','Kedi','Sphynx','Dişi',2,'Sağlıklı','Bekliyor','2023-04-17',6),(118,'Max','Köpek','Dalmatian','Erkek',3,'Sağlıklı','Sahiplenildi','2023-05-18',5),(119,'Bella','Kedi','Ragdoll','Dişi',3,'Sağlıklı','Bekliyor','2023-06-19',5),(120,'Charlie','Köpek','Bulldog','Erkek',4,'Sağlıklı','Sahiplenildi','2023-07-20',7),(121,'Simba','Kedi','Persian','Erkek',2,'Sağlıklı','Bekliyor','2023-08-21',1),(122,'Çedar','Köpek','Maltipoo','Erkek',3,'Sağlıklı','Sahiplenildi','2024-05-10',3),(123,'Milo','Kedi','Russian Blue','Dişi',1,'Sağlıklı','Bekliyor','2023-10-23',3),(124,'Cooper','Köpek','Great Dane','Erkek',5,'Sağlıklı','Bekliyor','2023-11-24',4),(125,'Luna','Kedi','Siamese','Dişi',3,'Sağlıklı','Bekliyor','2023-12-25',5),(126,'Buddy','Köpek','Schnauzer','Erkek',4,'Sağlıklı','Sahiplenildi','2024-01-26',6),(127,'Daisy','Kedi','Birman','Dişi',2,'Sağlıklı','Bekliyor','2024-02-27',7),(128,'Jack','Köpek','Shih Tzu','Erkek',3,'Sağlıklı','Sahiplenildi','2024-03-28',7),(129,'Chloe','Kedi','Burmese','Dişi',1,'Sağlıklı','Bekliyor','2024-04-29',6),(130,'Zeus','Köpek','Border Collie','Erkek',4,'Sağlıklı','Bekliyor','2024-05-30',7),(131,'Toby','Kedi','Abyssinian','Erkek',2,'Sağlıklı','Bekliyor','2024-06-01',1),(132,'Duke','Köpek','Doberman','Erkek',3,'Sağlıklı','Bekliyor','2024-07-02',2),(133,'Oliver','Kedi','Cornish Rex','Dişi',1,'Sağlıklı','Bekliyor','2024-08-03',3),(134,'Buster','Köpek','St. Bernard','Erkek',5,'Sağlıklı','Sahiplenildi','2024-09-04',4),(135,'Molly','Kedi','Turkish Angora','Dişi',3,'Sağlıklı','Bekliyor','2024-10-05',5),(136,'Murphy','Köpek','Greyhound','Erkek',4,'Sağlıklı','Bekliyor','2024-11-06',6),(137,'Kiki','Kedi','Exotic Shorthair','Dişi',2,'Sağlıklı','Bekliyor','2024-12-07',7),(138,'Winston','Köpek','Maltese','Erkek',3,'Sağlıklı','Bekliyor','2024-01-08',7),(139,'Sophie','Kedi','Tonkinese','Dişi',1,'Sağlıklı','Sahiplenildi','2024-02-09',6),(140,'Jasper','Köpek','Chihuahua','Erkek',4,'Sağlıklı','Bekliyor','2024-03-10',7),(141,'Felix','Kedi','Balinese','Erkek',2,'Sağlıklı','Bekliyor','2024-04-11',1),(142,'Samson','Köpek','Shetland Sheepdog','Erkek',3,'Sağlıklı','Bekliyor','2024-05-12',2),(143,'Missy','Kedi','Manx','Dişi',1,'Sağlıklı','Sahiplenildi','2024-06-13',3),(144,'Riley','Köpek','American Bulldog','Erkek',5,'Sağlıklı','Bekliyor','2024-07-14',4),(145,'Coco','Kedi','Somali','Dişi',3,'Sağlıklı','Bekliyor','2024-08-15',5),(146,'Sam','Köpek','West Highland White Terrier','Erkek',4,'Sağlıklı','Bekliyor','2024-09-16',6),(147,'Pepper','Kedi','Himalayan','Dişi',2,'Sağlıklı','Sahiplenildi','2024-10-17',7),(148,'Gus','Köpek','Basset Hound','Erkek',3,'Sağlıklı','Bekliyor','2024-11-18',7),(149,'Ella','Kedi','Oriental Shorthair','Dişi',1,'Sağlıklı','Bekliyor','2024-12-19',7),(150,'Thor','Köpek','Weimaraner','Erkek',4,'Sağlıklı','Bekliyor','2025-01-20',7),(151,'Rusty','Kedi','American Shorthair','Erkek',2,'Sağlıklı','Sahiplenildi','2025-02-21',1),(152,'Tank','Köpek','Bullmastiff','Erkek',3,'Sağlıklı','Bekliyor','2025-03-22',2),(153,'Mittens','Kedi','Japanese Bobtail','Dişi',1,'Sağlıklı','Bekliyor','2025-04-23',3),(154,'Finn','Köpek','Papillon','Erkek',5,'Sağlıklı','Sahiplenildi','2025-05-24',4),(155,'Tigger','Kedi','Ocicat','Dişi',3,'Sağlıklı','Bekliyor','2025-06-25',5),(156,'Benji','Köpek','Bloodhound','Erkek',4,'Sağlıklı','Sahiplenildi','2025-07-26',6),(157,'Muffin','Kedi','Siberian','Dişi',2,'Sağlıklı','Bekliyor','2025-08-27',7),(158,'Scout','Köpek','Australian Terrier','Erkek',3,'Sağlıklı','Bekliyor','2025-09-28',7),(159,'Zelda','Kedi','Chartreux','Dişi',1,'Sağlıklı','Bekliyor','2025-10-29',7),(160,'Odin','Köpek','Cane Corso','Erkek',4,'Sağlıklı','Sahiplenildi','2025-11-30',7),(161,'Nemo','Kedi','Egyptian Mau','Erkek',2,'Sağlıklı','Bekliyor','2025-12-01',1),(162,'Bella','Kedi','Ankara Kedisi','Dişi',1,'Sağlıklı','Sahiplenildi','2024-04-15',2),(163,'Ginger','Kedi','American Curl','Dişi',1,'Sağlıklı','Bekliyor','2026-02-03',3),(164,'Apollo','Köpek','Akita','Erkek',5,'Sağlıklı','Sahiplenildi','2026-03-04',4),(165,'Marley','Kedi','Burmilla','Dişi',3,'Sağlıklı','Bekliyor','2026-04-05',5),(166,'Rocco','Köpek','Bernese Mountain Dog','Erkek',4,'Sağlıklı','Bekliyor','2026-05-06',6),(167,'Snowball','Kedi','Selkirk Rex','Dişi',2,'Sağlıklı','Bekliyor','2026-06-07',7),(168,'Bandit','Köpek','Norfolk Terrier','Erkek',3,'Sağlıklı','Bekliyor','2026-07-08',7),(169,'Precious','Kedi','Devon Rex','Dişi',1,'Sağlıklı','Sahiplenildi','2026-08-09',7),(170,'Rufus','Köpek','Whippet','Erkek',4,'Sağlıklı','Bekliyor','2026-09-10',7),(171,'Tinkerbell','Kedi','Korat','Erkek',2,'Sağlıklı','Sahiplenildi','2026-10-11',1),(172,'Moose','Köpek','Newfoundland','Erkek',3,'Sağlıklı','Sahiplenildi','2026-11-12',2),(173,'Loki','Kedi','American Wirehair','Dişi',1,'Sağlıklı','Bekliyor','2026-12-13',3),(174,'Tank','Köpek','Great Pyrenees','Erkek',5,'Sağlıklı','Bekliyor','2027-01-14',4),(175,'Pumpkin','Kedi','LaPerm','Dişi',3,'Sağlıklı','Bekliyor','2027-02-15',5),(176,'Sarge','Köpek','Scottish Terrier','Erkek',4,'Sağlıklı','Sahiplenildi','2027-03-16',6),(177,'Spooky','Kedi','Exotic Shorthair','Dişi',2,'Sağlıklı','Bekliyor','2027-04-17',7),(178,'Blue','Köpek','Great Dane','Erkek',5,'Sağlıklı','Sahiplenildi','2027-05-18',7),(179,'Ginger','Kedi','Burmese','Dişi',1,'Sağlıklı','Bekliyor','2027-06-19',7),(180,'Axel','Köpek','Labrador Retriever','Erkek',4,'Sağlıklı','Bekliyor','2027-07-20',7),(181,'Oscar','Köpek','Cocker Spaniel','Erkek',3,'Sağlıklı','Bekliyor','2023-09-22',2),(182,'Gırgır','Kedi','Tekir','Dişi',1,'Sağlıklı','Sahiplenildi','2024-02-20',5),(183,'Hank','Köpek','Alaskan Malamute','Erkek',3,'Sağlıklı','Bekliyor','2026-01-02',2),(184,'Zilli','Kedi','Scottish','Dişi',5,'Sağlıklı','Sahiplenildi','2024-03-25',6);
/*!40000 ALTER TABLE `hayvan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilgilenir`
--

DROP TABLE IF EXISTS `ilgilenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilgilenir` (
  `IlgiPersonelID` int NOT NULL,
  `IlgiHayvanID` int NOT NULL,
  PRIMARY KEY (`IlgiPersonelID`,`IlgiHayvanID`),
  KEY `IlgiHayvanID` (`IlgiHayvanID`),
  CONSTRAINT `IlgiHayvanID` FOREIGN KEY (`IlgiHayvanID`) REFERENCES `hayvan` (`HayvanID`),
  CONSTRAINT `IlgiPersonelID` FOREIGN KEY (`IlgiPersonelID`) REFERENCES `personel` (`PersonelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilgilenir`
--

LOCK TABLES `ilgilenir` WRITE;
/*!40000 ALTER TABLE `ilgilenir` DISABLE KEYS */;
INSERT INTO `ilgilenir` VALUES (1,101),(36,101),(2,102),(4,103),(25,103),(7,104),(26,104),(4,105),(25,105),(3,106),(22,106),(7,107),(27,107),(10,108),(29,108),(10,109),(29,109),(13,110),(16,111),(16,112),(13,113),(19,114),(19,115),(17,116),(17,117),(14,118),(14,119),(19,120),(22,121),(23,121),(8,122),(8,123),(40,123),(11,124),(29,124),(15,125),(37,125),(18,126),(19,127),(20,128),(18,129),(20,130),(2,131),(23,131),(24,132),(39,132),(9,133),(41,133),(10,134),(11,134),(15,135),(32,136),(20,137),(20,138),(32,139),(21,140),(22,141),(23,141),(5,142),(9,143),(11,144),(12,144),(30,145),(32,146),(21,147),(21,148),(21,149),(21,150),(3,151),(5,152),(39,152),(26,153),(41,153),(12,154),(28,154),(30,155),(33,156),(34,157),(34,158),(34,159),(34,160),(2,161),(6,162),(27,163),(12,164),(28,164),(31,165),(33,166),(35,167),(35,168),(35,169),(35,170),(1,171),(36,171),(6,172),(40,173),(28,174),(31,175),(38,176),(42,177),(42,178),(42,179),(42,180),(24,181),(39,181),(37,182),(25,183),(38,184);
/*!40000 ALTER TABLE `ilgilenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personel`
--

DROP TABLE IF EXISTS `personel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personel` (
  `PersonelID` int NOT NULL,
  `Ad` varchar(100) DEFAULT NULL,
  `Soyad` varchar(100) DEFAULT NULL,
  `Telefon` varchar(100) DEFAULT NULL,
  `Mail` varchar(50) DEFAULT NULL,
  `PersonelBarinakID` int NOT NULL,
  PRIMARY KEY (`PersonelID`),
  UNIQUE KEY `PersonelID_UNIQUE` (`PersonelID`),
  KEY `PersonelBarinakID` (`PersonelBarinakID`),
  CONSTRAINT `PersonelBarinakID` FOREIGN KEY (`PersonelBarinakID`) REFERENCES `barinak` (`BarinakID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personel`
--

LOCK TABLES `personel` WRITE;
/*!40000 ALTER TABLE `personel` DISABLE KEYS */;
INSERT INTO `personel` VALUES (1,'Ahmet','Yılmaz','05001234501','ahmet.yilmaz@example.com',1),(2,'Mehmet','Kaya','05001234502','mehmet.kaya@example.com',1),(3,'Ayşe','Demir','05001234503','ayse.demir@example.com',1),(4,'Fatma','Çelik','05001234504','fatma.celik@example.com',2),(5,'Emre','Yıldırım','05001234505','emre.yildirim@example.com',2),(6,'Elif','Aydın','05001234506','elif.aydin@example.com',2),(7,'Burak','Öztürk','05001234507','burak.ozturk@example.com',3),(8,'Hüseyin','Aksoy','05001234508','huseyin.aksoy@example.com',3),(9,'Ceren','Koç','05001234509','ceren.koc@example.com',3),(10,'Buse','Karaca','05001234510','buse.karaca@example.com',4),(11,'Ali','Şahin','05001234511','ali.sahin@example.com',4),(12,'Gizem','Kılıç','05001234512','gizem.kilic@example.com',4),(13,'Yusuf','Arslan','05001234513','yusuf.arslan@example.com',5),(14,'Melike','Erdem','05001234514','melike.erdem@example.com',5),(15,'Serkan','Bulut','05001234515','serkan.bulut@example.com',5),(16,'İrem','Şimşek','05001234516','irem.simsek@example.com',6),(17,'Zeynep','Güler','05001234517','zeynep.guler@example.com',6),(18,'Kadir','Acar','05001234518','kadir.acar@example.com',6),(19,'Mert','Türkmen','05001234519','mert.turkmen@example.com',7),(20,'Sevil','Yalçın','05001234520','sevil.yalcin@example.com',7),(21,'Ozan','Gök','05001234521','ozan.gok@example.com',7),(22,'Deniz','Toprak','05001234522','deniz.toprak@example.com',1),(23,'Büşra','Ergin','05001234523','busra.ergin@example.com',1),(24,'Tugay','Ünlü','05001234524','tugay.unlu@example.com',2),(25,'Derya','Kurt','05001234525','derya.kurt@example.com',2),(26,'Oğuz','Duman','05001234526','oguz.duman@example.com',3),(27,'Aslı','Kara','05001234527','asli.kara@example.com',3),(28,'Onur','Tan','05001234528','onur.tan@example.com',4),(29,'Nazlı','Şen','05001234529','nazli.sen@example.com',4),(30,'Barış','Sever','05001234530','baris.sever@example.com',5),(31,'Esra','Soylu','05001234531','esra.soylu@example.com',5),(32,'Ferhat','Çetin','05001234532','ferhat.cetin@example.com',6),(33,'Selin','Tuna','05001234533','selin.tuna@example.com',6),(34,'Nihat','Demirci','05001234534','nihat.demirci@example.com',7),(35,'Gül','Ay','05001234535','gul.ay@example.com',7),(36,'Berat','Yıldız','05001234536','berat.yildiz@example.com',1),(37,'Dilek','Uçar','05001234537','dilek.ucar@example.com',5),(38,'Can','Eser','05001234538','can.eser@example.com',6),(39,'Cansu','Deniz','05001234539','cansu.deniz@example.com',2),(40,'Doğukan','Bozkurt','05001234540','dogukan.bozkurt@example.com',3),(41,'Emir','Savaş','05001234541','emir.savas@example.com',3),(42,'Gamze','Yaz','05001234542','gamze.yaz@example.com',7);
/*!40000 ALTER TABLE `personel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sahiplenen`
--

DROP TABLE IF EXISTS `sahiplenen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sahiplenen` (
  `Sahiplenen_ID` int NOT NULL,
  `Ad` varchar(100) DEFAULT NULL,
  `Soyad` varchar(100) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  `SahiplenenHayvanID` int NOT NULL,
  PRIMARY KEY (`Sahiplenen_ID`),
  UNIQUE KEY `Sahiplenen_ID_UNIQUE` (`Sahiplenen_ID`),
  UNIQUE KEY `SahiplenenHayvanID_UNIQUE` (`SahiplenenHayvanID`),
  CONSTRAINT `SahiplenenHayvanID` FOREIGN KEY (`SahiplenenHayvanID`) REFERENCES `hayvan` (`HayvanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sahiplenen`
--

LOCK TABLES `sahiplenen` WRITE;
/*!40000 ALTER TABLE `sahiplenen` DISABLE KEYS */;
INSERT INTO `sahiplenen` VALUES (30001,'Kerem','Yılmaz','05001234601','kerem.yilmaz@gmail.com',118),(30002,'Ezgi','Kara','05001234602','ezgi.kara@gmail.com',171),(30003,'Canan','Uysal','05001234603','canan.uysal@gmail.com',169),(30004,'Levent','Özdemir','05001234604','levent.ozdemir@gmail.com',111),(30005,'Seda','Çetin','05001234605','seda.cetin@gmail.com',134),(30006,'Ege','Demir','05001234606','ege.demir@gmail.com',154),(30007,'Yasemin','Şahin','05001234607','yasemin.sahin@gmail.com',147),(30008,'Bora','Koç','05001234608','bora.koc@gmail.com',126),(30009,'Furkan','Güler','05001234609','furkan.guler@gmail.com',178),(30010,'Nazan','Aydın','05001234610','nazan.aydin@gmail.com',104),(30011,'Derya','Aslan','05001234611','derya.aslan@gmail.com',143),(30012,'İrem','Onaran','05001234612','irem.onaran@gmail.com',122),(30013,'Ayşegül','Güven','05001234613','aysegul.guven@gmail.com',151),(30014,'Selin','Aras','05001234614','selin.aras@gmail.com',115),(30015,'Berk','Turan','05001234615','berk.turan@gmail.com',176),(30016,'Sevilay','Deniz','05001234616','sevilay.deniz@gmail.com',184),(30017,'Merve','Yılmaz','05001234617','merve.yilmaz@gmail.com',107),(30018,'Ozan','Öztürk','05001234618','ozan.ozturk@gmail.com',156),(30019,'Selma','Yavuz','05001234619','selma.yavuz@gmail.com',172),(30020,'Öykü','Zeybek','05001234620','deniz.topal@gmail.com',182),(30021,'Efe','Çelik','05001234621','efe.celik@gmail.com',139),(30022,'Aslı','Koçak','05001234622','asli.kocak@gmail.com',101),(30023,'Funda','Demir','05001234623','funda.demir@gmail.com',120),(30024,'Ertuğ','Yıldırım','050012345624','ertug.yildirim@gmail.com',164),(30025,'Demet','Bulut','050012345625','demet.bulut@gmail.com',128),(30026,'Can','Doğan','050012345626','can.dogan@gmail.com',160),(30027,'Gülay','Cekinmez','05001234627','gulay.cekinmez@gmail.com',162);
/*!40000 ALTER TABLE `sahiplenen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `SponsorID` int NOT NULL,
  `Isim` varchar(100) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SponsorID`),
  UNIQUE KEY `SponsorID_UNIQUE` (`SponsorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (20001,'Pati Dostları Derneği','05001234561','patidostlari@gmail.com'),(20002,'Hayvanseverler Vakfı','05001234562','hayvanseverler@gmail.com'),(20003,'Mama Yardım Grubu','05001234563','mamayardim@gmail.com'),(20004,'Barınak Destek Ekibi','05001234564','barinakdestek@gmail.com'),(20005,'Veterinerler Birliği','05001234565','veterinerler@gmail.com'),(20006,'Hayvan Hakları Koruma','05001234566','hayvankoruma@gmail.com'),(20007,'Doğa ve Hayvan Dostları','05001234567','dogahayvan@gmail.com'),(20008,'Pati Bakım Merkezi','05001234568','patibakim@gmail.com'),(20009,'Sokak Hayvanları Yardım','05001234569','sokakyardim@gmail.com'),(20010,'Can Dostlar Derneği','05001234570','candostlar@gmail.com'),(20011,'Hayvansever Topluluğu','05001234571','hayvansevertop@gmail.com'),(20012,'Kurtarma ve Rehabilitasyon','05001234572','kurtarmarehab@gmail.com');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor_oldu`
--

DROP TABLE IF EXISTS `sponsor_oldu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor_oldu` (
  `SpSponsorID` int NOT NULL,
  `SpBarinakID` int NOT NULL,
  `Bagis_Miktari` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`SpSponsorID`,`SpBarinakID`),
  KEY `SpBarinakID` (`SpBarinakID`),
  CONSTRAINT `SpBarinakID` FOREIGN KEY (`SpBarinakID`) REFERENCES `barinak` (`BarinakID`),
  CONSTRAINT `SpSponsorID` FOREIGN KEY (`SpSponsorID`) REFERENCES `sponsor` (`SponsorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor_oldu`
--

LOCK TABLES `sponsor_oldu` WRITE;
/*!40000 ALTER TABLE `sponsor_oldu` DISABLE KEYS */;
INSERT INTO `sponsor_oldu` VALUES (20001,1,50000.00),(20002,2,75000.00),(20003,3,60000.00),(20004,4,85000.00),(20005,5,70000.00),(20006,6,90000.00),(20007,7,80000.00),(20008,1,65000.00),(20009,2,55000.00),(20010,3,75000.00),(20011,4,72000.00),(20012,5,68000.00);
/*!40000 ALTER TABLE `sponsor_oldu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ziyaret_edildi`
--

DROP TABLE IF EXISTS `ziyaret_edildi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ziyaret_edildi` (
  `ZiyaretZiyaretciID` int NOT NULL,
  `ZiyaretBarinakID` int NOT NULL,
  `Ziyaret_Tarihi` date DEFAULT NULL,
  PRIMARY KEY (`ZiyaretZiyaretciID`,`ZiyaretBarinakID`),
  KEY `ZiyaretBarinakID` (`ZiyaretBarinakID`),
  CONSTRAINT `ZiyaretBarinakID` FOREIGN KEY (`ZiyaretBarinakID`) REFERENCES `barinak` (`BarinakID`),
  CONSTRAINT `ZiyaretZiyaretciID` FOREIGN KEY (`ZiyaretZiyaretciID`) REFERENCES `ziyaretci` (`ZiyaretciID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ziyaret_edildi`
--

LOCK TABLES `ziyaret_edildi` WRITE;
/*!40000 ALTER TABLE `ziyaret_edildi` DISABLE KEYS */;
INSERT INTO `ziyaret_edildi` VALUES (10001,1,'2022-01-10'),(10002,2,'2023-01-15'),(10003,3,'2023-03-20'),(10004,4,'2022-12-25'),(10005,5,'2022-05-10'),(10006,6,'2023-06-05'),(10007,7,'2023-02-10'),(10008,1,'2023-04-15'),(10009,2,'2023-05-10'),(10010,3,'2023-03-15'),(10011,4,'2022-06-30'),(10012,5,'2022-04-05'),(10013,6,'2023-01-10'),(10014,7,'2023-02-15'),(10015,1,'2023-01-20'),(10016,2,'2022-10-15'),(10017,3,'2023-05-30'),(10018,4,'2022-05-05'),(10019,5,'2022-02-20'),(10020,6,'2023-03-25'),(10021,7,'2022-09-20'),(10022,1,'2023-04-15'),(10023,2,'2022-11-30'),(10024,3,'2023-01-05'),(10025,4,'2022-03-10'),(10026,5,'2023-02-15'),(10027,6,'2023-02-20'),(10028,7,'2022-10-25'),(10029,1,'2023-01-30'),(10030,2,'2022-11-05'),(10031,3,'2022-06-10'),(10032,4,'2022-07-15'),(10033,5,'2022-04-20'),(10034,6,'2022-05-25'),(10035,7,'2022-09-10'),(10036,1,'2023-02-05'),(10037,2,'2022-03-15'),(10038,3,'2022-12-20'),(10039,4,'2022-01-25'),(10040,5,'2022-04-30'),(10041,6,'2023-01-10'),(10042,7,'2023-01-15'),(10043,1,'2023-04-10'),(10044,2,'2022-02-15'),(10045,3,'2022-05-20'),(10046,4,'2023-02-25'),(10047,5,'2022-03-30'),(10048,6,'2022-08-05'),(10049,7,'2023-05-10'),(10050,1,'2022-07-15'),(10051,2,'2023-03-20'),(10052,3,'2022-01-25'),(10053,4,'2023-04-30'),(10054,5,'2022-06-05'),(10055,6,'2022-03-10'),(10056,7,'2023-05-25'),(10057,1,'2022-11-20'),(10058,2,'2023-02-05'),(10059,3,'2022-09-15'),(10060,4,'2023-04-25');
/*!40000 ALTER TABLE `ziyaret_edildi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ziyaretci`
--

DROP TABLE IF EXISTS `ziyaretci`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ziyaretci` (
  `ZiyaretciID` int NOT NULL,
  `Ad` varchar(100) DEFAULT NULL,
  `Soyad` varchar(100) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ZiyaretciID`),
  UNIQUE KEY `ZiyaretciID_UNIQUE` (`ZiyaretciID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ziyaretci`
--

LOCK TABLES `ziyaretci` WRITE;
/*!40000 ALTER TABLE `ziyaretci` DISABLE KEYS */;
INSERT INTO `ziyaretci` VALUES (10001,'Zeynep','Yıldız','05001234501','zeynep.yildiz@example.com'),(10002,'Ali','Demir','05001234502','ali.demir@example.com'),(10003,'Ayşe','Kaya','05001234503','ayse.kaya@example.com'),(10004,'Mehmet','Çelik','05001234504','mehmet.celik@example.com'),(10005,'Fatma','Yılmaz','05001234505','fatma.yilmaz@example.com'),(10006,'Emre','Aydın','05001234506','emre.aydin@example.com'),(10007,'Elif','Koç','05001234507','elif.koc@example.com'),(10008,'Burak','Öztürk','05001234508','burak.ozturk@example.com'),(10009,'Hüseyin','Aksoy','05001234509','huseyin.aksoy@example.com'),(10010,'Ceren','Karaca','05001234510','ceren.karaca@example.com'),(10011,'Buse','Arslan','05001234511','buse.arslan@example.com'),(10012,'Ali','Şahin','05001234512','ali.sahin@example.com'),(10013,'Gizem','Kılıç','05001234513','gizem.kilic@example.com'),(10014,'Yusuf','Erdem','05001234514','yusuf.erdem@example.com'),(10015,'Melike','Bulut','05001234515','melike.bulut@example.com'),(10016,'Serkan','Şimşek','05001234516','serkan.simsek@example.com'),(10017,'İrem','Güler','05001234517','irem.guler@example.com'),(10018,'Zeynep','Acar','05001234518','zeynep.acar@example.com'),(10019,'Kadir','Türkmen','05001234519','kadir.turkmen@example.com'),(10020,'Mert','Yalçın','05001234520','mert.yalcin@example.com'),(10021,'Sevil','Gök','05001234521','sevil.gok@example.com'),(10022,'Ozan','Toprak','05001234522','ozan.toprak@example.com'),(10023,'Deniz','Ergin','05001234523','deniz.ergin@example.com'),(10024,'Büşra','Ünlü','05001234524','busra.unlu@example.com'),(10025,'Tugay','Kurt','05001234525','tugay.kurt@example.com'),(10026,'Derya','Kurt','05001234526','derya.kurt@example.com'),(10027,'Oğuz','Duman','05001234527','oguz.duman@example.com'),(10028,'Aslı','Kara','05001234528','asli.kara@example.com'),(10029,'Onur','Tan','05001234529','onur.tan@example.com'),(10030,'Nazlı','Şen','05001234530','nazli.sen@example.com'),(10031,'Barış','Sever','05001234531','baris.sever@example.com'),(10032,'Esra','Soylu','05001234532','esra.soylu@example.com'),(10033,'Ferhat','Çetin','05001234533','ferhat.cetin@example.com'),(10034,'Selin','Tuna','05001234534','selin.tuna@example.com'),(10035,'Nihat','Demirci','05001234535','nihat.demirci@example.com'),(10036,'Gül','Ay','05001234536','gul.ay@example.com'),(10037,'Berat','Yıldız','05001234537','berat.yildiz@example.com'),(10038,'Dilek','Uçar','05001234538','dilek.ucar@example.com'),(10039,'Can','Eser','05001234539','can.eser@example.com'),(10040,'Cansu','Deniz','05001234540','cansu.deniz@example.com'),(10041,'Doğukan','Bozkurt','05001234541','dogukan.bozkurt@example.com'),(10042,'Emir','Savaş','05001234542','emir.savas@example.com'),(10043,'Gamze','Yazıcı','05001234543','gamze.yazici@example.com'),(10044,'Sibel','Özkan','05001234544','sibel.ozkan@example.com'),(10045,'Deniz','Yıldırım','05001234545','deniz.yildirim@example.com'),(10046,'Neslihan','Kara','05001234546','neslihan.kara@example.com'),(10047,'Efe','Güneş','05001234547','efe.gunes@example.com'),(10048,'Kerem','Çelik','05001234548','kerem.celik@example.com'),(10049,'Nisa','Yılmaz','05001234549','nisa.yilmaz@example.com'),(10050,'Tuğba','Kaya','05001234550','tugba.kaya@example.com'),(10051,'Melis','Demir','05001234551','melis.demir@example.com'),(10052,'Cenk','Özdemir','05001234552','cenk.ozdemir@example.com'),(10053,'Alp','Çetin','05001234553','alp.cetin@example.com'),(10054,'Ayça','Yalçın','05001234554','ayca.yalcin@example.com'),(10055,'Sena','Erdem','05001234555','sena.erdem@example.com'),(10056,'Yunus','Aslan','05001234556','yunus.aslan@example.com'),(10057,'Ebru','Koç','05001234557','ebru.koc@example.com'),(10058,'Gülsüm','Arslan','05001234558','gulsum.arslan@example.com'),(10059,'Neşe','Özkan','05001234559','nese.ozkan@example.com'),(10060,'Sinan','Eker','05001234560','sinan.eker@example.com');
/*!40000 ALTER TABLE `ziyaretci` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-09 14:29:21
