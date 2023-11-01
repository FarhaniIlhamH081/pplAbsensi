-- MySQL dump 10.13  Distrib 8.0.31, for macos13.0 (arm64)
--
-- Host: localhost    Database: db_absen_siswa
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `absensi`
--

DROP TABLE IF EXISTS `absensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absensi` (
  `id_absensi` int unsigned NOT NULL AUTO_INCREMENT,
  `siswa_id` int unsigned NOT NULL,
  `kelas_id` int unsigned NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('Alfa','Izin','Sakit','Hadir') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id_absensi`),
  KEY `created_by` (`created_by`),
  KEY `siswa_id` (`siswa_id`),
  KEY `kelas_id` (`kelas_id`),
  CONSTRAINT `absensi_ibfk_2` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `absensi`
--

LOCK TABLES `absensi` WRITE;
/*!40000 ALTER TABLE `absensi` DISABLE KEYS */;
INSERT INTO `absensi` VALUES (1,1,12,'2017-12-14','Izin','Izin','2017-12-13 17:29:46','2017-12-13 17:29:46',NULL),(3,3,12,'2017-12-14','Sakit','Sakit','2017-12-13 17:34:03','2017-12-13 17:34:03',NULL),(11,1,12,'2018-02-08','Sakit','Sakit','2018-02-07 10:53:18','2018-02-07 10:53:18',NULL),(12,2,12,'2018-02-08','Sakit','Sakit','2018-02-07 10:53:18','2018-02-07 10:53:18',NULL),(13,3,12,'2018-02-08','Alfa','Alfa','2018-02-07 10:53:18','2018-02-07 10:53:18',NULL),(14,4,12,'2018-02-08','Izin','Izin','2018-02-07 11:13:12','2018-02-07 11:13:12',NULL),(15,125,9,'2022-02-03','Alfa','Alfa','2022-02-03 06:14:51','2022-02-03 06:14:51',NULL),(16,120,9,'2022-02-03','Izin','Izin','2022-02-03 06:14:51','2022-02-03 06:14:51',NULL),(17,117,9,'2022-02-03','Sakit','Sakit','2022-02-03 06:14:51','2022-02-03 06:14:51',NULL),(18,114,9,'2022-09-24','Alfa','Alfa','2022-09-24 08:50:32','2022-09-24 08:50:32',NULL),(19,138,9,'2022-09-24','Izin','Izin','2022-09-24 08:50:32','2022-09-24 08:50:32',NULL),(20,112,9,'2022-09-24','Alfa','Alfa','2022-09-24 08:53:20','2022-09-24 08:53:20',NULL),(21,119,9,'2022-09-25','Alfa','Alfa','2022-09-25 07:05:22','2022-09-25 07:05:22',NULL),(22,137,9,'2022-09-25','Izin','Izin','2022-09-25 07:05:22','2022-09-25 07:05:22',NULL),(23,138,9,'2022-09-25','Sakit','Sakit','2022-09-25 07:05:22','2022-09-25 07:05:22',NULL),(24,128,9,'2022-10-10','Alfa','Alfa','2022-10-09 21:58:51','2022-10-09 21:58:51',NULL),(25,138,9,'2022-10-10','Alfa','Alfa','2022-10-09 21:58:51','2022-10-09 21:58:51',NULL),(27,3,12,'2022-10-18','Hadir','Masuk','2022-10-18 01:38:43','2022-10-18 01:38:43',NULL),(28,3,12,'2022-10-18','Hadir','Masuk','2022-10-18 01:41:40','2022-10-18 01:41:40',NULL),(29,3,12,'2022-10-18','Hadir','Masuk','2022-10-18 01:42:12','2022-10-18 01:42:12',NULL),(30,3,12,'2022-10-18','Hadir','Masuk','2022-10-18 01:44:21','2022-10-18 01:44:21',NULL),(33,2,12,'2022-11-05','Hadir','Hadir','2022-11-04 19:42:30','2022-11-04 19:42:30',NULL);
/*!40000 ALTER TABLE `absensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guru`
--

DROP TABLE IF EXISTS `guru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guru` (
  `id_guru` int unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_guru`),
  UNIQUE KEY `guru_nip_unique` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guru`
--

LOCK TABLES `guru` WRITE;
/*!40000 ALTER TABLE `guru` DISABLE KEYS */;
INSERT INTO `guru` VALUES (2,'199083727372','KaSetya','L','Aktif'),(3,'1990837259021','Mira Febriani','P','Aktif');
/*!40000 ALTER TABLE `guru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kelas`
--

DROP TABLE IF EXISTS `kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelas` (
  `id_kelas` int unsigned NOT NULL AUTO_INCREMENT,
  `tingkat_kelas` enum('X','XI','XII') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `jurusan` enum('RPL','TKJ','MM') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_kelas` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kuota` int NOT NULL,
  `tahun_masuk` year NOT NULL,
  `tahun_keluar` year NOT NULL,
  `wali_kelas` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_kelas`),
  KEY `wali_kelas` (`wali_kelas`),
  CONSTRAINT `kelas_ibfk_1` FOREIGN KEY (`wali_kelas`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kelas`
--

LOCK TABLES `kelas` WRITE;
/*!40000 ALTER TABLE `kelas` DISABLE KEYS */;
INSERT INTO `kelas` VALUES (9,'X','RPL','1',40,2017,2018,NULL),(10,'X','RPL','2',40,2017,2018,NULL),(11,'XI','RPL','1',40,2017,2018,NULL),(12,'XII','RPL','1',40,2017,2018,NULL),(14,'XI','RPL','2',40,2022,2023,NULL),(15,'XI','RPL','12',35,2019,2020,NULL);
/*!40000 ALTER TABLE `kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (9,'2017_10_27_142219_create_table_siswa',1),(10,'2017_10_27_142653_create_table_kelas',1),(11,'2017_10_27_143125_create_table_absensi',1),(12,'2017_10_27_144836_create_table_siswa_kelas',1),(13,'2017_11_04_063824_create_pdf_table',1),(14,'2017_11_07_163530_create_table_user',2),(15,'2017_11_09_131335_create_table_guru',3),(17,'2022_11_03_232535_create_qr_code_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdf`
--

DROP TABLE IF EXISTS `pdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdf` (
  `id_pdf` int unsigned NOT NULL AUTO_INCREMENT,
  `jenis` enum('H','F') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pdf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdf`
--

LOCK TABLES `pdf` WRITE;
/*!40000 ALTER TABLE `pdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qr_code`
--

DROP TABLE IF EXISTS `qr_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr_code` (
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_code`
--

LOCK TABLES `qr_code` WRITE;
/*!40000 ALTER TABLE `qr_code` DISABLE KEYS */;
INSERT INTO `qr_code` VALUES ('6364fa5232912','2022-11-04','2022-11-04 04:41:06','2022-11-04 04:41:06'),('6365ba4f81e95','2022-11-05','2022-11-04 18:20:15','2022-11-04 18:20:15');
/*!40000 ALTER TABLE `qr_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa`
--

DROP TABLE IF EXISTS `siswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siswa` (
  `id_siswa` int unsigned NOT NULL AUTO_INCREMENT,
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('Laki - Laki','Perempuan','L','P') NOT NULL,
  `tingkat_kelas` varchar(20) NOT NULL,
  PRIMARY KEY (`id_siswa`),
  KEY `id_siswa` (`id_siswa`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa`
--

LOCK TABLES `siswa` WRITE;
/*!40000 ALTER TABLE `siswa` DISABLE KEYS */;
INSERT INTO `siswa` VALUES (1,'151610382','Andrian Firmansyah','L','XII'),(2,'151610383','Arif Nurdiansyah','L','XII'),(3,'151610386','Citra Fitri Pratiwi','P','XII'),(4,'151610387','Deri Komara','L','XII'),(5,'151610388','Devid Alfian','L','XII'),(6,'151610390','Diky Badar Saputra','L','XII'),(7,'151610393','Fahrul Septiana','L','XII'),(8,'151610397','Fikri Dzulfiqar Zain','L','XII'),(9,'151610402','Irfan Saepur Rohman','L','XII'),(10,'151610405','Mila Amalia Saputri','P','XII'),(11,'151610413','Sekar Mawardi Utomo','L','XII'),(12,'151610422','Bagoes Cahya Ardhana','L','XII'),(13,'151610426','Fahriza Vita Akbar','P','XII'),(14,'151610434','Ikhsan Rahmadsyah','L','XII'),(15,'151610440','Mochamad Febryan Putra Herawan','L','XII'),(16,'151610441','Muhammad Luthfi Hizbulloh','L','XII'),(17,'151610444','Rani Triani Gustia','P','XII'),(18,'151610448','Ronald Rizki Akbar Ambarisan','L','XII'),(19,'151610450','Shavira Ariyani','P','XII'),(20,'151610455','Adityawan Chandra','P','XII'),(21,'151610464','Fajar Nursidiq','L','XII'),(22,'151610475','Muhammad Arief Kurnianto','L','XII'),(23,'151610481','Novan Kurniansyah','L','XII'),(24,'151610484','Ripaldi Sabarno','L','XII'),(25,'151610500','Farhan Rizky Fauzi Setiawan','L','XII'),(26,'151610501','Fikri Fauzan Akbar','L','XII'),(27,'151610504','Gusnandi Arafi Azhar','L','XII'),(28,'151610511','Kurniawan Wijaya','L','XII'),(29,'151610517','Risma Artha Melvia Arofi','P','XII'),(30,'151610518','Rivaldi Palermo','L','XII'),(31,'151610522','Sendy Dzikri Ferdiansyah','L','XII'),(32,'151610523','Syahrul Daffa Mahesa','L','XII'),(33,'151610550','Luthfi Sukmawardhani','L','XII'),(34,'151610552','Mochamad Fiqri Ardiansyah','L','XII'),(35,'151610558','Muhammad Ramadhan Maulana Asyarief','L','XII'),(36,'151610565','Roy Ryando Roni Habeahan','L','XII'),(37,'161710470','David Fauzi Shidqie','L','XI'),(38,'161710474','Fathur Rachman Aryanto','L','XI'),(39,'161710475','Fitri Nuraini','P','XI'),(40,'161710476','Gefy Aqillah Aqshal','L','XI'),(41,'161710478','Ilham Hambali Nasrulloh','L','XI'),(42,'161710479','Kaleb Adi Pramono','L','XI'),(43,'161710480','Leni Aulia Ayu','P','XI'),(44,'161710486','Muhamad Faisal Akbar','L','XI'),(45,'161710488','Nisrina Indah Rahmantyah','P','XI'),(46,'161710490','Rahmi Attifah','P','XI'),(47,'161710494','Rizky Subagja Sopandi','L','XI'),(48,'161710499','Tedi Maulana','L','XI'),(49,'161710500','Yudistira Viandy','L','XI'),(50,'161710502','Afni Zahrotulmuna Syaro','P','XI'),(51,'161710510','Ekatama Ilham Prayoga','L','XI'),(52,'161710517','Lia Emilia','P','XI'),(53,'161710521','Mochamad Raffi Ramdhani','L','XI'),(54,'161710534','Silviana Wahyuningrum Sidik','L','XI'),(55,'161710537','Tio Hardadi Somantri','L','XI'),(56,'161710540','Agis Tamami Wasfika','L','XI'),(57,'161710542','Anisa Pradasurya','P','XI'),(58,'161710549','Fadilah Muhamad Riantino Akbar','L','XI'),(59,'161710551','Fawwaz Baahir Hidayatulloh','L','XI'),(60,'161710553','Giustry Fadh Wirannapoera','L','XI'),(61,'161710556','Lia Nurjanah','P','XI'),(62,'161710558','Mahmud Hamdani','L','XI'),(63,'161710559','Mochamad Alif Yasin Mubarok','L','XI'),(64,'161710564','Nugraha Agung','L','XI'),(65,'161710566','Renita Geby Nababan','P','XI'),(66,'161710568','Rivan Mochammad Fauzi','L','XI'),(67,'161710572','Silvy Novia Vanjily','P','XI'),(68,'161710574','Sylvania Diva Jezreelia','P','XI'),(69,'161710582','Candra Ramdhan','L','XI'),(70,'161710590','Haris Rachman','L','XI'),(71,'161710599','Muhammad Rizal Supriadi','L','XI'),(72,'161710604','Resa Agustin','P','XI'),(73,'161710606','Rizal Awal Suhada','L','XI'),(74,'161710608','Sherly Oktaviani','P','XI'),(75,'161710610','Siti Ashifa Miya Paramita','P','XI'),(76,'161710611','Sri Wulandari','P','XI'),(77,'161710612','Tarisa Refiana','P','XI'),(78,'161710615','Akhdan Musyaffa Firdaus','L','XI'),(79,'161710618','Anisa Oktaviani Rusmana','P','XI'),(80,'161710622','Diki Farhan','L','XI'),(81,'161710623','Eka Lestari','P','XI'),(82,'161710627','Hanna Maudy Salsabila','P','XI'),(83,'161710628','Helmi Fachry Aeymadu Rahman','L','XI'),(84,'161710633','Michael Christensen Bonar Kaspar','L','XI'),(85,'161710635','Muchammad Rivan Renaldy','L','XI'),(86,'161710638','Nining Nur Fadilah','P','XI'),(87,'161710644','Rizal Miftahul Falah','L','XI'),(88,'161710650','Tiara Nur Haerani','P','XI'),(89,'161710652','Yuni Nurlaela','P','XI'),(90,'161710653','Al Fikri Shafar Hanif','L','XI'),(91,'161710654','Andini Aulia Sari','P','XI'),(92,'161710655','Anissa Nur Asyifaya','P','XI'),(93,'161710656','Anwar Muhamad Sidiq','L','XI'),(94,'161710657','Briliana Rosalin','P','XI'),(95,'161710660','Dimas Pranakusumah','L','XI'),(96,'161710662','Falih Naufal','L','XI'),(97,'161710664','Garda Anggara Dwi Pangga S','L','XI'),(98,'161710667','Intan Maulani','P','XI'),(99,'161710669','Lutfiah Miftah Nur Fadillah','P','XI'),(100,'161710677','Raditya Rizqy Rahmanda','L','XI'),(101,'161710679','Riana Putri Agustin','P','XI'),(102,'161710685','Sofy Fulpia','P','XI'),(103,'161710688','Tivani Febriana Nurohmat','P','XI'),(104,'171810001','Abdul Hafizh Fazrin','L','X'),(105,'171810002','Adi Pratama','L','X'),(106,'171810003','Alamsyah Wirayudha Hidayat','L','X'),(107,'171810004','Andre Firmansyah','L','X'),(108,'171810005','Anisa Febriani Puspa Kirana','P','X'),(109,'171810006','Annisa Nurhasanah Nadia','P','X'),(110,'171810007','Asep Ilham Setiadi','L','X'),(111,'171810008','Dewa Putra Prijowedar','L','X'),(112,'171810009','Dian Sri Utami','P','X'),(113,'171810010','Dipa Awaliah Hasanah','P','X'),(114,'171810011','Faizal Ramadhan','L','X'),(115,'171810012','Faza Malik Al Hakim','L','X'),(116,'171810013','Fitria Suprianti','P','X'),(117,'171810014','Hadaina Dhiyaul Arsy','L','X'),(118,'171810015','Hanif Abdurrouf Ramdhan','L','X'),(119,'171810016','Hilmi Zein','L','X'),(120,'171810017','Iman Wiguna','L','X'),(121,'171810018','Intan Sahwal Fadilah Haq','P','X'),(122,'171810019','Lucky Tri Bhakti','L','X'),(123,'171810020','Mochamad Prasetyo','L','X'),(124,'171810021','Muhamad Wendi Narizal Prasetio','L','X'),(125,'171810022','Muhammad Harry Rizky','L','X'),(126,'171810023','Muhammad Makmur Yahya','L','X'),(127,'171810024','Muhammad Rafli Nugraha','L','X'),(128,'171810025','Nadillathul Jannah','P','X'),(129,'171810026','Rafi Dzaky Darmawan','L','X'),(130,'171810027','Restu Akmal AL-Hunafa','L','X'),(131,'171810028','Rihan Didan','L','X'),(132,'171810029','Rio Giallorossi Riscky','L','X'),(133,'171810030','Rizki Aryandi','L','X'),(134,'171810031','Suci Novi Rahmawati','P','X'),(135,'171810032','Tegar Aryadi','L','X'),(136,'171810033','Tsara Azizah Nurul Andiki','P','X'),(137,'171810034','Ujang Najib','L','X'),(138,'171810035','Yusron Fauzan Nasrullah','L','X'),(139,'171810036','Adi Mustopa Yusup','L','X'),(140,'171810037','Akmal Fauzi Salman','L','X'),(141,'171810038','Alfina Septrianti','P','X'),(142,'171810039','Andi Permadi','L','X'),(143,'171810040','Angga Saeful Prayoga','L','X'),(144,'171810041','Annisa Frida Mardianti','P','X'),(145,'171810042','Deiana Auli Dwi Putri','P','X'),(146,'171810043','Denis Firmansyah Ramadhan','L','X'),(147,'171810044','Dika Ruli Ulfiana','L','X'),(148,'171810045','Dina K','P','X'),(149,'171810046','Fajar Ramadhan','L','X'),(150,'171810047','Faza Kamila Khoirunnisa','P','X'),(151,'171810048','Gan Gan Ahmad Setriawan','L','X'),(152,'171810049','Hafidz Rabbani','L','X'),(153,'171810050','Hanannisa Fitrianindita','P','X'),(154,'171810051','Harfin Taufik','L','X'),(155,'171810052','Ihsan Rasidin','L','X'),(156,'171810053','Ksatria Bagus Ramadhan','L','X'),(157,'171810054','Lisdania Nurul Zannaty','P','X'),(158,'171810055','Mochamad Insan','L','X'),(159,'171810056','Muhamad Fathul Umam','L','X'),(160,'171810057','Muhammad Abdul Aziz','L','X'),(161,'171810058','Muhammad Iqbal Alamsah Sanjaya','L','X'),(162,'171810059','Muhammad Rafli Jatnika','L','X'),(163,'171810060','Muhammad Rafli Santana','L','X'),(164,'171810061','Neng Sekar Arum Nurpuspita Mulya','P','X'),(165,'171810062','Raga Puteraku Dermawan','L','X'),(166,'171810063','Rifqi Rifaldi','L','X'),(167,'171810064','Riko Hendrawan','L','X'),(168,'171810065','Risma Septiani','P','X'),(169,'171810066','Rivalda Fatah Rachman H','L','X'),(170,'171810067','Surya Putra Pratama','L','X'),(171,'171810068','Syifa Shintawati Azizah','P','X'),(172,'171810069','Thoriq Asa Nurhanif','L','X'),(173,'171810070','Yudi Maulana','L','X'),(174,'171810071','Zhahra Sahira','P','X'),(175,'171814565','Anezka Rahadatul Aisy','P','XI'),(176,'192010456','Maryam Ammara Nur Ghadati Al - Amin','P','XI'),(177,'192010675','Khawla Syifa Putri ','P','XI'),(178,'192010876','Fakhira Sidqi Kholifah','P','XI'),(180,'221199','Mamat','L','XII'),(181,'121','wqqd','L','X');
/*!40000 ALTER TABLE `siswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siswa_kelas`
--

DROP TABLE IF EXISTS `siswa_kelas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siswa_kelas` (
  `id_siswa_kelas` int unsigned NOT NULL AUTO_INCREMENT,
  `siswa_id` int unsigned NOT NULL,
  `kelas_id` int unsigned NOT NULL,
  PRIMARY KEY (`id_siswa_kelas`),
  KEY `siswa_kelas_kelas_id_foreign` (`kelas_id`),
  KEY `siswa_id` (`siswa_id`),
  CONSTRAINT `siswa_kelas_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id_siswa`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `siswa_kelas_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siswa_kelas`
--

LOCK TABLES `siswa_kelas` WRITE;
/*!40000 ALTER TABLE `siswa_kelas` DISABLE KEYS */;
INSERT INTO `siswa_kelas` VALUES (1,1,12),(2,2,12),(3,3,12),(4,4,12),(5,5,12),(6,6,12),(7,7,12),(8,8,12),(9,9,12),(10,10,12),(11,11,12),(12,12,12),(13,13,12),(14,14,12),(15,15,12),(16,20,12),(17,36,12),(18,125,9),(19,119,9),(20,120,9),(21,117,9),(22,114,9),(23,112,9),(24,113,9),(25,105,9),(26,137,9),(27,108,9),(28,128,9),(29,109,9),(30,138,9),(31,139,10),(32,140,10),(33,141,10),(34,142,10),(35,143,10),(36,144,10),(37,145,10),(38,37,11),(39,38,11),(40,40,11),(41,41,11);
/*!40000 ALTER TABLE `siswa_kelas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `akses` enum('Admin','Guru','Siswa','Ortu') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_siswa` int unsigned DEFAULT NULL,
  `id_guru` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `user_username_unique` (`username`),
  KEY `id_siswa` (`id_siswa`),
  KEY `id_guru` (`id_guru`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_guru`) REFERENCES `guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'admin@gmail.com','$2y$10$hoEe3aSZel4QbJwE5YzqIOLNsxIePEjUET51oniaJu/UWw4F3sZ4i','Admin','7CdfIm4smoCWnL5L6VxS8SHfBAA9ErpzAj49R34IKIl9xZUJTFWrkOLxAbgK',NULL,NULL),(16,'amrul','$2a$12$8NMn4fpLoGXm7FfFZ61ZgeNp/ouFlx0cWM/uuSVhIWQtFF3DAokia','Siswa','We9FLpOYe9GC3kHoG4JYTEMfj6sylzZxHyV4lpTsIXXusBzKF9zKpUNYnFVU',2,NULL),(19,'Deafna Amin,S.Pd','$2y$10$KVYc1CZFYopJ6ztUpA494.VpWpf10gr2oxRFsDkjjUjYz90gq1bx.','Guru',NULL,NULL,NULL),(20,'Mat Kukuh,S.Kom','$2y$10$NHcEowEifbCQzV48W2KVWuFy7kaiWh0SSIkyLAHAR8DxJzmoKtbla','Guru',NULL,NULL,NULL),(21,'Agustah Endriyati,S.Kom','$2y$10$hGiMXoyAc48fYLxxt4PEzewIm5.jn6YVKrt11o.ZfXqWniYiik692','Guru',NULL,NULL,NULL),(22,'Indriyani,S.Kom','$2y$10$lVZVx.IK8O1GYXeFGvrcveL0LS6OUEBtZYlUl9yGukRadEb1zK6oG','Guru',NULL,NULL,NULL),(23,'Rosita Dewa,S.Kom','$2y$10$sBJd4h3I5FyXckpfRA1PXO.8E/dWgYYd4m3JLNCUbK3Mlbt6FvmQ.','Guru',NULL,NULL,NULL),(24,'Budi Riyanto,S.Kom,M.Pd','$2y$10$R3yGyvesffPX9AHiLmLh2.D4H5kHRDqeREJfT816dE5.Jz9azlaua','Admin',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-05  9:47:32
