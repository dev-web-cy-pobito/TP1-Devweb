-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: Puffles
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorized_puffles`
--

DROP TABLE IF EXISTS `categorized_puffles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorized_puffles` (
  `puffle_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`puffle_id`,`category_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `categorized_puffles_ibfk_1` FOREIGN KEY (`puffle_id`) REFERENCES `puffles` (`id`),
  CONSTRAINT `categorized_puffles_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorized_puffles`
--

LOCK TABLES `categorized_puffles` WRITE;
/*!40000 ALTER TABLE `categorized_puffles` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorized_puffles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `discount` int NOT NULL DEFAULT '0',
  `uses` int NOT NULL DEFAULT '0',
  `max_uses` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_categories`
--

DROP TABLE IF EXISTS `job_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_categories`
--

LOCK TABLES `job_categories` WRITE;
/*!40000 ALTER TABLE `job_categories` DISABLE KEYS */;
INSERT INTO `job_categories` VALUES (1,'AGRICULTURE ET PÊCHE, ESPACES NATURELS ET ESPACES VERTS, SOINS AUX ANIMAUX'),(2,'ARTS ET FACONNAGE D\'OUVRAGES D\'ART'),(3,'BANQUE, ASSURANCE, IMMOBILIER'),(4,'COMMERCE, VENTE ET GRANDE DISTRIBUTION'),(5,'COMMUNICATION, MEDIA ET MULTIMEDIA'),(6,'CONSTRUCTION, BÂTIMENT ET TRAVAUX PUBLICS'),(7,'HÔTELLERIE- RESTAURATION TOURISME LOISIRS ET ANIMATION'),(8,'INDUSTRIE'),(9,'INSTALLATION ET MAINTENANCE'),(10,'SANTE'),(11,'SERVICES A LA PERSONNE ET A LA COLLECTIVITE'),(12,'SPECTACLE'),(13,'SUPPORT A L\'ENTREPRISE'),(14,'TRANSPORT ET LOGISTIQUE');
/*!40000 ALTER TABLE `job_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `job_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'Engins agricoles et forestiers',1),(2,'Espaces naturels et espaces verts',1),(3,'Etudes et assistance technique',1),(4,'Production',1),(5,'Soins aux animaux',1),(6,'Arts plastiques',2),(7,'Céramique',2),(8,'Décoration',2),(9,'Fibres et papier',2),(10,'Instruments de musique',2),(11,'Métal, verre, bijouterie et horlogerie',2),(12,'Taxidermie',2),(13,'Tissu et cuirs',2),(14,'Assurance',3),(15,'Banque',3),(16,'Finance',3),(17,'Gestion administrative banque et assurances',3),(18,'Immobilier',3),(19,'Commerce alimentaire et métiers de bouche',4),(20,'Commerce non alimentaire et de prestations de confort',4),(21,'Direction de magasin de détail',4),(22,'Force de vente',4),(23,'Grande distribution',4),(24,'Edition et communication',5),(25,'Images et sons',5),(26,'Industries graphiques',5),(27,'Publicité',5),(28,'Conception et études',6),(29,'Conduite et encadrement de chantier - travaux',6),(30,'Engins de chantier',6),(31,'Extraction',6),(32,'Montage de structures',6),(33,'Second oeuvre',6),(34,'Travaux et gros oeuvre',6),(35,'Accueil et promotion touristique',7),(36,'Animation d\'activités de loisirs',7),(37,'Conception, commercialisation et vente de produits touristiques',7),(38,'Gestion et direction',7),(39,'Personnel d\'étage en hôtellerie',7),(40,'Production culinaire',7),(41,'Accueil en hôtellerie',7),(42,'Service',7),(43,'Etudes et supports techniques à l\'industrie',8),(44,'Production industrielle',8),(45,'Encadrement',9),(46,'Entretien technique',9),(47,'Equipements de production, équipements collectifs',9),(48,'Equipements domestiques et informatique',9),(49,'Travaux d\'accès difficile',9),(50,'Véhicules, engins, aéronefs',9),(51,'Praticiens médicaux',10),(52,'Praticiens médico-techniques',10),(53,'Professionnels médico-techniques',10),(54,'Rééducation et appareillage',10),(55,'Soins paramédicaux',10),(56,'Accompagnement de la personne',11),(57,'Action sociale, socio-éducative et socio-culturelle',11),(58,'Aide à la vie quotidienne',11),(59,'Conception et mise en oeuvre des politiques publiques',11),(60,'Contrôle public',11),(61,'Culture et gestion documentaire',11),(62,'Défense, sécurité publique et secours',11),(63,'Développement territorial et emploi',11),(64,'Droit',11),(65,'Formation initiale et continue',11),(66,'Nettoyage et propreté industriels',11),(67,'Propreté et environnement urbain',11),(68,'Recherche',11),(69,'Sécurité privée',11),(70,'Services funéraires',11),(71,'Animation de spectacles',12),(72,'Artistes - interprètes du spectacle',12),(73,'Conception et production de spectacles',12),(74,'Sport professionnel',12),(75,'Techniciens du spectacle',12),(76,'Achats',13),(77,'Comptabilité et gestion',13),(78,'Direction d\'entreprise',13),(79,'Organisation et études',13),(80,'Ressources humaines',13),(81,'Secrétariat et assistance',13),(82,'Stratégie commerciale, marketing et supervision des ventes',13),(83,'Systèmes d\'information et de télécommunication',13),(84,'Logistique',14),(85,'Transport aérien et activités aéroportuaires',14),(86,'Transport maritime et fluvial et activités portuaires',14),(87,'Transport terrestre',14);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_puffles`
--

DROP TABLE IF EXISTS `ordered_puffles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_puffles` (
  `order_id` int NOT NULL,
  `user_id` int NOT NULL,
  `puffle_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` int NOT NULL DEFAULT '0',
  KEY `user_id` (`user_id`),
  KEY `puffle_id` (`puffle_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `ordered_puffles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `ordered_puffles_ibfk_2` FOREIGN KEY (`puffle_id`) REFERENCES `puffles` (`id`),
  CONSTRAINT `ordered_puffles_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_puffles`
--

LOCK TABLES `ordered_puffles` WRITE;
/*!40000 ALTER TABLE `ordered_puffles` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_puffles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(64) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `country` varchar(64) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `order_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puffles`
--

DROP TABLE IF EXISTS `puffles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puffles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `apparition_date` varchar(255) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `price` int NOT NULL DEFAULT '0',
  `pic_url` varchar(255) NOT NULL DEFAULT 'assets/images/default.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puffles`
--

LOCK TABLES `puffles` WRITE;
/*!40000 ALTER TABLE `puffles` DISABLE KEYS */;
/*!40000 ALTER TABLE `puffles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `used_coupons`
--

DROP TABLE IF EXISTS `used_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `used_coupons` (
  `order_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  KEY `order_id` (`order_id`),
  KEY `coupon_id` (`coupon_id`),
  CONSTRAINT `used_coupons_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `used_coupons_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `used_coupons`
--

LOCK TABLES `used_coupons` WRITE;
/*!40000 ALTER TABLE `used_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `used_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `permission` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2022-04-07 12:01:36
