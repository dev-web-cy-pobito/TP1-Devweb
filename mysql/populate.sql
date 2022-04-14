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

create database if not exists Puffles;

use Puffles;


--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Adoptable'),(3,'Membership-Free'),(4,'Membership-Only'),(6,'Mythical Puffle Creature'),(2,'Original'),(7,'Other'),(5,'Premium');
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
INSERT INTO `categorized_puffles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(1,3),(2,3),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(17,4),(18,4),(19,4),(20,4),(21,4),(22,4),(23,4),(11,5),(12,5),(13,6),(14,6),(15,6),(16,6),(17,6),(18,6),(19,6),(20,6),(21,6),(22,6),(23,6),(24,7),(25,7),(26,7),(27,7),(28,7),(29,7);
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
  `description` varchar(2048) DEFAULT NULL,
  `apparition_date` varchar(255) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `price` int NOT NULL DEFAULT '0',
  `pic_url` varchar(255) NOT NULL DEFAULT 'assets/images/default.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puffles`
--

LOCK TABLES `puffles` WRITE;
/*!40000 ALTER TABLE `puffles` DISABLE KEYS */;
INSERT INTO `puffles` VALUES (1,'Blue','Considered trustworthy, loyal, and easy to care for. Their favorite toy is a ball.','November 2005',5,400,'assets/images/338Puffle_2014_Transformation_Player_Card_Blue.png'),(2,'Red','The most adventurous, and native to Rockhopper Island. They like being like pirates, bowling, surfing, and eating stinky cheese.','June 9, 2005[1]',5,400,'assets/images/882Puffle_2014_Transformation_Player_Card_Red.png'),(3,'Pink','Known for their athleticism, and depicted as cheerful. The best swimmers.','November 2005',5,400,'assets/images/449Puffle_2014_Transformation_Player_Card_Pink.png'),(4,'Green','Very energetic and silly, much like clowns, and usually seen with a propeller cap or a unicycle.','November 2005',5,400,'assets/images/bb0Puffle_2014_Transformation_Player_Card_Green.png'),(5,'Black','The strong and silent type, however, they have a wild side; they love to skateboard, and can fly as a fireball. They rarely smile, but they will smile when pleased.','November 2005',5,400,'assets/images/33cPuffle_2014_Transformation_Player_Card_Black.png'),(6,'Purple','Love to dance, picky eaters, and portrayed as divas. They can blow incredibly large bubbles by using their bubble wand.','August 2006',5,400,'assets/images/ee7Puffle_2014_Transformation_Player_Card_Purple.png'),(7,'Yellow','Creative, artistic, can sculpt and paint great pieces of art. They love anything that has got to do with the arts, be it art, design, stage plays, and music.','October 2007',5,400,'assets/images/bb3Puffle_2014_Transformation_Player_Card_Yellow.png'),(8,'White','The smallest of all puffles, which fits their shy and quiet personalities. Their ice breath can freeze anything, and they like ice skating. They are connected back to ninjas quite often, especially since white puffles were first spotted at the Dojo Courtyard.','February 2009',5,400,'assets/images/bb8Puffle_2014_Transformation_Player_Card_White.png'),(9,'Orange','Depicted as goofy and zany, and native to the Box Dimension. Their prominent buck teeth and long tongues make them stand out among other puffles.','February 2010',5,400,'assets/images/449Puffle_2014_Transformation_Player_Card_Orange.png'),(10,'Brown','The most intelligent puffles, they love experiments. Equiped with safety goggles and a pocket multi-purpose laser shooter.','January 2011',5,400,'assets/images/aafPuffle_2014_Transformation_Player_Card_Brown.png'),(11,'Rainbow','Legendary, majestic, can fly, and fart sparkles. Native to the Cloud Forest. Their existence was rumored for years. Non-members could adopt them without needing to complete any tasks at the Rainbow Puffle Party.','March 2013',5,0,'assets/images/aa0Puffle_2014_Transformation_Player_Card_Rainbow.png'),(12,'Gold','Energetic, hide-and-seek experts, and they shine a lot. Like rainbow puffles, gold puffles had been rumored to exist years before being discovered. They can dig up exclusive golden items when they are walked.','November 2013',5,10,'assets/images/11dPuffle_2014_Transformation_Player_Card_Golden.png'),(13,'Dinosaur','There are six variants: Blue Triceratops, Black T-Rex, Pink Stegosaurus, Red Triceratops, Purple T-Rex, and Yellow Stegosaurus. Rescued by time travelers. They can dig up exclusive prehistoric items when they are walked.','January 2014/Age of the dinosaurs',5,0,'assets/images/ff5BlackTRexPuffle.png'),(14,'Border Collie','Full of energy, they are always up for a walk or playing fetch. Just watch out for their slobbery kisses. They can dig up exclusive items and exclusive prehistoric items when they are walked.','April 2014',5,800,'assets/images/cc3Puffle_2014_Transformation_Player_Card_Blue_Border_Collie.png'),(15,'Tabby Cat','Always curious, they will get into almost anything. They love high places and being the center of attention. They can dig up exclusive items and exclusive prehistoric items when they are walked.','April 2014',5,800,'assets/images/66ePuffle_2014_Transformation_Player_Card_Orange_Tabby_Cat.png'),(16,'Snowman','Artificial puffles made out of snow who resemble Olaf, and were created by Elsa. They can dig up exclusive items and exclusive prehistoric items when they are walked.','August 2014',5,0,'assets/images/44dSnowman_Puffle_up-close.png'),(17,'Ghost','Supernatural puffles that were lurking in the Puffle Hotel when it was haunted by Skip during the Halloween Party 2014. They can fly, and pass through anything.','October 2014',5,0,'assets/images/ff3DWkiQRl.png'),(18,'Yellow Unicorn','Found deep in the Wilderness. They were Adoptable in the mobile application Puffle Wild and at the Puffle Wild room. Other variants appeared at the Medieval Party 2013.','November 2014',5,800,'assets/images/ddePuffle_yellow1020_paper.png'),(19,'Rabbit','Found deep in the Wilderness. They were Adoptable in the mobile application Puffle Wild and at the Puffle Wild room. They have large ears. A not Adoptable purple variant can be seen in the Puffle Wild loading screen.','November 2014',5,800,'assets/images/008Puffle_white1014_paper.png'),(20,'Raccoon','Found deep in the Wilderness. They were Adoptable in the mobile application Puffle Wild and at the Puffle Wild room.','November 2014',5,800,'assets/images/ddePuffle_orange1009_paper.png'),(21,'Deer','Found deep in the Wilderness. They were Adoptable in the mobile application Puffle Wild and at the Puffle Wild room. They were first seen in the first version of another mobile app, Sled Racer.','November 2014',5,800,'assets/images/001Puffle_black1017_paper.png'),(22,'Blue Crystal','Magic flying crystalline puffles, brought by Merry Walrus. Six of these puffles pull the Merry Walrus\' sleigh, one of them is Enrique, from the We Wish You a Merry Walrus TV special.','December 2014',5,0,'assets/images/ff0Blue_Crystal_Puffle_smiling.png'),(23,'Alien','Came from outer space. They abduct penguins to their UFO temporarily. During Operation: Crustacean, non-members could adopt the green variant.','November 2015',5,0,'assets/images/884Green_Alien_Puffle.png'),(24,'Purple Turkish Van Cat','A drawing of it was discovered in the Doodle Dimension at the April Fools\' Party 2012. A real one is in the video Puffle Trouble among a crowd of puffles. A picture of it could be seen in Jangrah\'s igloo in the Club Penguin: Monster Beach Party TV special.','Club Penguin: Monster Beach Party',5,0,'assets/images/ffaCatnewartwork.png'),(25,'Bat','One was seen through the Mansion Attic telescope of the Halloween Party 2012. Featured on the Puffle Bat Key Pin, the Puffle Bat Tee and the Halloween Tee. Members could turn into one during Halloween Parties 2013 and 2016 by dancing as a vampire.','Club Penguin: Halloween Panic!',5,0,'assets/images/88fBat_Puffle_2013.png'),(26,'Reindeer','Members could transform into one during the Holiday Party 2012 by eating its magic cookie. Featured on the Holiday Cookies Pin as a cookie, and on the Reindeer Puffle Sweater as a silhouette. A decoration featuring a red-nosed reindeer puffle could be seen at the Dock during the Holiday Party 2013. Two real ones appear on the Puffle Wild loading screen. They are slightly larger than ordinary puffles.','Puffle Wild loading screen',5,0,'assets/images/33eReindeer_Puffle_laughing.png'),(27,'Dragon','Rumored due to an appearance in a foreign Club Penguin Magazine issue. Members could transform into the green and blue variants during the Medieval Party 2013 by using their respective potion.','Club Penguin: Halloween Panic!',5,0,'assets/images/994Green_Puffle_Dragon.png'),(28,'Unicorn','Members could transform into the white and black variants during the Medieval Party 2013 by using their respective potion. The yellow variant was Adoptable.','Puffle Wild',5,0,'assets/images/990Unicorn_Puffle_artwork.png'),(29,'Chicken','Members were able to transform into one during the Medieval Party 2013 when failing a potion recipe. During the Muppets World Tour, penguins who joined a member\'s Salad Tongs act became a chicken puffle until the act ended. It has its own official music video.','Muppets World Tour',5,0,'assets/images/115Chicken_Puffle_Artwork.png');
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

-- Dump completed on 2022-04-14 19:57:31
