-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: tasks1
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bill_items`
--

DROP TABLE IF EXISTS `bill_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  KEY `bill_items_bill_number_fkey` (`bill_number`),
  KEY `bill_items_product_id_fkey` (`product_id`),
  CONSTRAINT `bill_items_bill_number_fkey` FOREIGN KEY (`bill_number`) REFERENCES `bills` (`bill_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bill_items_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bill_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bill_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `bills_bill_number_key` (`bill_number`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lot_info`
--

DROP TABLE IF EXISTS `lot_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lot_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lot_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bulk_weight_before` double DEFAULT NULL,
  `bulk_after_weight` double DEFAULT NULL,
  `adjustment_percent` int DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `lot_process` enum('completed','not_completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'not_completed',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lot_info_lot_name_key` (`lot_name`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `before_weight_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `after_weight_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `final_weight_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_fkey` (`product_id`),
  CONSTRAINT `product_images_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `before_weight` double DEFAULT NULL,
  `after_weight` double DEFAULT NULL,
  `difference` double DEFAULT NULL,
  `adjustment` double DEFAULT NULL,
  `final_weight` double DEFAULT NULL,
  `product_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `product_type` enum('hold','active','sold') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `barcode_weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lot_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_info_product_number_key` (`product_number`),
  KEY `product_info_lot_id_fkey` (`lot_id`),
  CONSTRAINT `product_info_lot_id_fkey` FOREIGN KEY (`lot_id`) REFERENCES `lot_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2212 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-24 15:58:40
