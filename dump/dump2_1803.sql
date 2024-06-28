-- MySQL dump 10.13  Distrib 5.6.46, for Linux (x86_64)
--
-- Host: 10.2.206.75    Database: cnfi
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.37-MariaDB

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
-- Table structure for table `cnfi_activiteassurance`
--

DROP TABLE IF EXISTS `cnfi_activiteassurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_activiteassurance` (
  `activiteAssurance_id` int(11) NOT NULL AUTO_INCREMENT,
  `activiteAssurance_produitId` int(11) DEFAULT NULL,
  `activiteAssurance_nomEntreprise` text,
  `activiteAssurance_periode` varchar(255) DEFAULT NULL,
  `activiteAssurance_regionId` int(11) DEFAULT NULL,
  `activiteAssurance_typeAssuranceId` int(11) DEFAULT NULL,
  `activiteAssurance_nomPoliceAssurance` text,
  `activiteAssurance_montantCapital` double DEFAULT NULL,
  `activiteAssurance_montantCapitalLiee` double DEFAULT NULL,
  `activiteAssurance_nbTotalBenef` int(11) DEFAULT NULL,
  `activiteAssurance_nbSouscripteur` int(11) DEFAULT NULL,
  `activiteAssurance_nbPersMorale` int(11) DEFAULT NULL,
  `activiteAssurance_nbFemme` int(11) DEFAULT NULL,
  `activiteAssurance_nbHomme` int(11) DEFAULT NULL,
  `activiteAssurance_nbCreancier` int(11) DEFAULT NULL,
  `activiteAssurance_nbAgriculteur` int(11) DEFAULT NULL,
  `activiteAssurance_montantNbFemme` double DEFAULT NULL,
  `activiteAssurance_montantNbHomme` double DEFAULT NULL,
  `activiteAssurance_montantNbCreancier` double DEFAULT NULL,
  `activiteAssurance_montantNbAgriculteur` double DEFAULT NULL,
  `activiteAssurance_montantNbSouscripteur` double DEFAULT NULL,
  `activiteAssurance_montantNbPersMorale` double DEFAULT NULL,
  PRIMARY KEY (`activiteAssurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_activiteassurance`
--

LOCK TABLES `cnfi_activiteassurance` WRITE;
/*!40000 ALTER TABLE `cnfi_activiteassurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_activiteassurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_activitecem`
--

DROP TABLE IF EXISTS `cnfi_activitecem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_activitecem` (
  `activiteCem_id` int(11) NOT NULL AUTO_INCREMENT,
  `activiteCem_produitId` int(11) DEFAULT NULL,
  `activiteCem_nomEtab` text,
  `activiteCem_regionId` int(11) DEFAULT NULL,
  `activiteCem_typeEpargneId` int(11) DEFAULT NULL,
  `activiteCem_nbrEpargnant` int(11) DEFAULT NULL,
  `activiteCem_nbrPlans` int(11) DEFAULT NULL,
  `activiteCem_montantTotalEnCours` double DEFAULT NULL,
  `activiteCem_montantMoyensDesEncours` double DEFAULT NULL,
  `activiteCem_stratificationPme` text,
  `activiteCem_stratificationGenre` text,
  PRIMARY KEY (`activiteCem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_activitecem`
--

LOCK TABLES `cnfi_activitecem` WRITE;
/*!40000 ALTER TABLE `cnfi_activitecem` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_activitecem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_autrerepartition`
--

DROP TABLE IF EXISTS `cnfi_autrerepartition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_autrerepartition` (
  `produitId` int(11) DEFAULT NULL,
  `autreRepartition_typeAutreId` int(11) DEFAULT NULL,
  `autreRepartition_nbrTotal` int(11) DEFAULT NULL,
  `autreRepartition_nbrTotalDeclarer` int(11) DEFAULT NULL,
  `autreRepartition_cotisationMensuel` double DEFAULT NULL,
  `autreRepartition_nbrTotFemmeCouvert` int(11) DEFAULT NULL,
  `autreRepartition_nbrTotHommeCouvert` int(11) DEFAULT NULL,
  `autreRepartition_nbrTotalCouvert` int(11) DEFAULT NULL,
  `autreRepartition_indemniteJournaliere` double DEFAULT NULL,
  `autreRepartition_dureeMoyenne` double DEFAULT NULL,
  `autreRepartition_nbrFemmePrestataire` int(11) DEFAULT NULL,
  `autreRepartition_nbrHommePrestataire` int(11) DEFAULT NULL,
  `autreRepartition_nbrTotalPrestataire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_autrerepartition`
--

LOCK TABLES `cnfi_autrerepartition` WRITE;
/*!40000 ALTER TABLE `cnfi_autrerepartition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_autrerepartition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_autrevolumeactivite`
--

DROP TABLE IF EXISTS `cnfi_autrevolumeactivite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_autrevolumeactivite` (
  `autreVolumeActivite_id` int(11) NOT NULL AUTO_INCREMENT,
  `autreVolumeActivite_produitId` int(11) DEFAULT NULL,
  `autreVolumeActivite_regionId` int(11) DEFAULT NULL,
  `autreVolumeActivite_nbrCompteEmeOuvert` int(11) DEFAULT NULL,
  `autreVolumeActivite_nbrCompteActif` int(11) DEFAULT NULL,
  `autreVolumeActivite_nbrCompteInactif` int(11) DEFAULT NULL,
  `autreVolumeActivite_reclammationEtOpposition` text,
  `autreVolumeActivite_encoursME` double DEFAULT NULL,
  PRIMARY KEY (`autreVolumeActivite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_autrevolumeactivite`
--

LOCK TABLES `cnfi_autrevolumeactivite` WRITE;
/*!40000 ALTER TABLE `cnfi_autrevolumeactivite` DISABLE KEYS */;
INSERT INTO `cnfi_autrevolumeactivite` VALUES (1,1,6,45,89,5,'12',35000),(2,1,1,9,32,4,'25',12000);
/*!40000 ALTER TABLE `cnfi_autrevolumeactivite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_cemfinancier`
--

DROP TABLE IF EXISTS `cnfi_cemfinancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_cemfinancier` (
  `produitId` int(11) DEFAULT NULL,
  `cemFinancier_typeId` int(11) DEFAULT NULL,
  `cemFinancier_nbrTransaction` int(11) DEFAULT NULL,
  `cemFinancier_montantTransaction` double DEFAULT NULL,
  `cemFinancier_nbrClient` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_cemfinancier`
--

LOCK TABLES `cnfi_cemfinancier` WRITE;
/*!40000 ALTER TABLE `cnfi_cemfinancier` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_cemfinancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_colonneexport`
--

DROP TABLE IF EXISTS `cnfi_colonneexport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_colonneexport` (
  `colonneExport_id` int(11) NOT NULL AUTO_INCREMENT,
  `colonneExport_nom` varchar(255) DEFAULT NULL,
  `colonneExport_libelle` text,
  `colonneExport_table` varchar(255) DEFAULT NULL,
  `colonneExport_join` varchar(255) DEFAULT NULL,
  `colonneExport_where` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`colonneExport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_colonneexport`
--

LOCK TABLES `cnfi_colonneexport` WRITE;
/*!40000 ALTER TABLE `cnfi_colonneexport` DISABLE KEYS */;
INSERT INTO `cnfi_colonneexport` VALUES (1,'zone_nombre','Nombre de point de service','cnfi_zone','zone_produitId',NULL),(2,'encoursActivite_montant','Montant encours Actvité','cnfi_encoursactivite','encoursActivite_produitId',NULL),(3,'spoCredit_montant','Montant minimum Service et Produit Offert : Crédit','cnfi_spocredit','spo_produitId',NULL),(4,'spoCredit_montantMax','Montant maxium Service et Produit Offert : Crédit','cnfi_spocredit','spo_produitId',NULL),(5,'spoEpargne_depotMin','Dépôt minimum Service et Produit Offert : Epargne','cnfi_spoepargne','spo_produitId',NULL),(6,'societariat_nbrFemme','Nombre de membres par clients : Femmes','cnfi_societariat','societariat_produitId',NULL),(7,'societariat_nbrHomme','Nombre de membres par clients : Hommes','cnfi_societariat','societariat_produitId',NULL),(8,'societariat_nbrMorale','Nombre de membres par clients : Personnes morales','cnfi_societariat','societariat_produitId',NULL),(9,'societariat_groupFemme','Nombre d\'association ou de groupement de femmes','cnfi_societariat','societariat_produitId',NULL),(10,'societariat_volontaireFemme','Nombre d\'épargnants volontaires : Femmes','cnfi_societariat','societariat_produitId',NULL),(11,'societariat_volontaireHomme','Nombre d\'épargnants volontaires : Hommes','cnfi_societariat','societariat_produitId',NULL),(12,'societariat_volontaireMorale','Nombre d\'épargnants volontaires : Personnes morales','cnfi_societariat','societariat_produitId',NULL),(13,'societariat_empActifFemme','Nombre d\'emprunteurs actifs : Femmes','cnfi_societariat','societariat_produitId',NULL),(14,'societariat_empActifHomme','Nombre d\'emprunteurs actifs : Hommes','cnfi_societariat','societariat_produitId',NULL),(15,'societariat_empActifMorale','Nombre d\'emprunteurs actifs : Personnes morales','cnfi_societariat','societariat_produitId',NULL),(16,'encoursActivite_nombre','Volume des activités > Encours de crédit : par secteur d\'activité (Nombre)','cnfi_encoursactivite','encoursActivite_produitId','encoursActivite_type = 1'),(17,'encoursActivite_nombre','Volume des activités > Encours de crédit : par PME / Ménage (Nombre)','cnfi_encoursactivite','encoursActivite_produitId','encoursActivite_type = 2'),(18,'encoursActivite_nombre','Volume des activités > Encours de crédit : par genre (Nombre)','cnfi_encoursactivite','encoursActivite_produitId','encoursActivite_type = 3'),(19,'encoursActivite_montant','Volume des activités > Encours de crédit : par secteur d\'activité (Montant)','cnfi_encoursactivite','encoursActivite_produitId','encoursActivite_type = 1'),(20,'encoursActivite_montant','Volume des activités > Encours de crédit : par PME / Ménage (Montant)','cnfi_encoursactivite','encoursActivite_produitId','encoursActivite_type = 2'),(21,'encoursActivite_montant','Volume des activités > Encours de crédit : par genre (Montant)','cnfi_encoursactivite','encoursActivite_produitId','encoursActivite_type = 3'),(22,'octroiActivite_nombre','Volume des activités > Octroi de crédit : par secteur d\'activité (Nombre)','cnfi_octroiactivite','octroiActivite_produitId','octroiActivite_type = 1'),(23,'octroiActivite_nombre','Volume des activités > Octroi de crédit : par PME / Ménage (Nombre)','cnfi_octroiactivite','octroiActivite_produitId','octroiActivite_type = 2'),(24,'octroiActivite_nombre','Volume des activités > Octroi de crédit : par genre (Nombre)','cnfi_octroiactivite','octroiActivite_produitId','octroiActivite_type = 3'),(25,'octroiActivite_montant','Volume des activités > Octroi de crédit : par secteur d\'activité (Montant)','cnfi_octroiactivite','octroiActivite_produitId','octroiActivite_type = 1'),(26,'octroiActivite_montant','Volume des activités > Octroi de crédit : par PME / Ménage (Montant)','cnfi_octroiactivite','octroiActivite_produitId','octroiActivite_type = 2'),(27,'octroiActivite_montant','Volume des activités > Octroi de crédit : par genre (Montant)','cnfi_octroiactivite','octroiActivite_produitId','octroiActivite_type = 3'),(28,'epargne_nombre','Volume des activités > Encours d\'epargne : par type (Nombre)','cnfi_epargne','epargne_produitId','epargne_type = 1'),(29,'epargne_nombre','Volume des activités > Encours d\'epargne : par PME / Ménage (Nombre)','cnfi_epargne','epargne_produitId','epargne_type = 2'),(30,'epargne_nombre','Volume des activités > Encours d\'epargne : par genre (Nombre)','cnfi_epargne','epargne_produitId','epargne_type = 3'),(31,'epargne_montant','Volume des activités > Encours d\'epargne : par type (Montant)','cnfi_epargne','epargne_produitId','epargne_type = 1'),(32,'epargne_montant','Volume des activités > Encours d\'epargne : par PME / Ménage (Montant)','cnfi_epargne','epargne_produitId','epargne_type = 2'),(33,'epargne_montant','Volume des activités > Encours d\'epargne : par genre (Montant)','cnfi_epargne','epargne_produitId','epargne_type = 3'),(35,'porteFeuille_totalEncoursCredit','Qualité de portefeuille : Total Encours de crédit','cnfi_portefeuille','porteFeuille_produitId',''),(36,'porteFeuille_encoursCreditSain','Qualité de portefeuille : Total Encours de crédit sain','cnfi_portefeuille','porteFeuille_produitId',''),(37,'porteFeuille_encoursCreditEnRetard','Qualité de portefeuille : Total de crédit en retard','cnfi_portefeuille','porteFeuille_produitId',NULL),(38,'poAssurance_capiatlGarantieMin','Assurance Vie : Capital Garanti Minimum','cnfi_poassurance','poAssurance_produitId','poAssurance_typeAssuranceId=1'),(39,'poAssurance_capiatlGarantieMin','Assurance Crédit : Capital Garanti Minimum','cnfi_poassurance','poAssurance_produitId','poAssurance_typeAssuranceId=2'),(40,'poAssurance_montantMaxCouverture','Assurance Maladie/Accident : Montant Maximum de la Couverture','cnfi_poassurance','poAssurance_produitId','poAssurance_typeAssuranceId=3'),(41,'poAssurance_capitalGarantieMax','Assurance \"Incendie et éléments naturels\" et Autres dommages aux biens\" : Capital Garanti Maximum','cnfi_poassurance','poAssurance_produitId','poAssurance_typeAssuranceId=4'),(42,'poAssurance_capitalGarantieMax','Assurance Bien Agricole : Capital Garanti Maximum','cnfi_poassurance','poAssurance_produitId','poAssurance_typeAssuranceId=5'),(43,'poAssurance_capitalGarantieMax','Autres produits d\'assurance :  Capital Garanti Maximum','cnfi_poassurance','poAssurance_produitId','poAssurance_typeAssuranceId=6'),(44,'societariatAssurance_nombreHomme','Sociétariat : Nombre de souscripteur homme','cnfi_societariatassurance','societariatAssurance_produitId',NULL),(45,'societariatAssurance_nombreFemme','Sociétariat : Nombre de souscripteur femme','cnfi_societariatassurance','societariatAssurance_produitId',NULL),(46,'societariatAssurance_personneMorale','Sociétariat : Nombre de souscripteur personne morale','cnfi_societariatassurance','societariatAssurance_produitId',NULL),(47,'activiteAssurance_nomPoliceAssurance','Volume des activités : nombre de police d\'assurance','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(48,'activiteAssurance_montantCapital','Volume des activités : montant capital','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(49,'activiteAssurance_nbSouscripteur','Volume des activités : nombre souscripteur','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(50,'activiteAssurance_nbHomme','Volume des activités : nombre homme','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(51,'activiteAssurance_nbFemme','Volume des activités : nombre femme','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(52,'activiteAssurance_nbPersMorale','Volume des activités : nombre personne morale','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(53,'activiteAssurance_nbCreancier','Volume des activités : nombre créancier','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(54,'activiteAssurance_nbAgriculteur','Volume des activités : nombre agriculteur','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(55,'activiteAssurance_montantNbSouscripteur','Volume des activités : montant indemnisation souscripteur','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(56,'activiteAssurance_montantNbHomme','Volume des activités : montant indemnisation homme','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(57,'activiteAssurance_montantNbFemme','Volume des activités : montant indemnisation femme','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(58,'activiteAssurance_nbPersMorale','Volume des activités : montant indemnisation personne morale','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(59,'activiteAssurance_montantNbCreancier','Volume des activités : montant indemnisation créancier','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(60,'activiteAssurance_montantNbAgriculteur','Volume des activités : montant indemnisation agriculteur','cnfi_activiteassurance','activiteAssurance_produitId',NULL),(61,'repartition_nbrPentionner','Nombre pentionné','cnfi_repartition','repartition_produitId',NULL),(62,'repartition_nbrTotalPrestataire','Nombre total de prestataire','cnfi_repartition','repartition_produitId',NULL),(63,'repartition_nbrTravailleurs','Nombre total de travailleur','cnfi_repartition','repartition_produitId',NULL),(65,'societariatAssurance_nombreMorale','Nombre Membres/clients personnes morales','cnfi_societariatassurance','societariatAssurance_produitId',NULL),(66,'poActivite_nbCompteEpargne','Nombre de compte courant','cnfi_poactivite','poActivite_produitId',NULL),(67,'poActivite_montantTotal','Montant activité','cnfi_poactivite','poActivite_produitId',NULL),(68,'societariatAssurance_nbrClient','Nombre de clients enregistrés','cnfi_societariatassurance','societariatAssurance_produitId',NULL),(69,'societariatAssurance_nombreHomme','Nombre de clients Hommes enregistrés','cnfi_societariatassurance','societariatAssurance_produitId',NULL),(70,'societariatAssurance_nombreFemme','Nombre de clientes enregistrées','cnfi_societariatassurance','societariatAssurance_produitId',NULL),(71,'emeActivite_nbrTransactionsParPeriode','Nombre de transactions sur la periode','cnfi_emeactivite','emeActivite_produitId',NULL),(72,'emeActivite_montantTotalTransaction','Montant total des transactions sur la periode','cnfi_emeactivite','emeActivite_produitId',NULL),(73,'autreVolumeActivite_nbrCompteEmeOuvert','Nombre de Comptes de ME ouverts sur la Période','cnfi_autrevolumeactivite','autreVolumeActivite_produitId',NULL),(74,'autreVolumeActivite_nbrCompteActif','Nombre de comptes de monnaie électronique actifs','cnfi_autrevolumeactivite','autreVolumeActivite_produitId',NULL),(75,'autreVolumeActivite_nbrCompteInactif','Nombre de comptes de monnaie électronique inactifs','cnfi_autrevolumeactivite','autreVolumeActivite_produitId',NULL),(76,'autreVolumeActivite_reclammationEtOpposition','Nombre de réclamations et oppositions','cnfi_autrevolumeactivite','autreVolumeActivite_produitId',NULL),(77,'autreVolumeActivite_encoursME','Encours de monnaie électronique','cnfi_autrevolumeactivite','autreVolumeActivite_produitId',NULL);
/*!40000 ALTER TABLE `cnfi_colonneexport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_commune`
--

DROP TABLE IF EXISTS `cnfi_commune`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_commune` (
  `commune_id` int(11) NOT NULL AUTO_INCREMENT,
  `commune_type` int(1) DEFAULT '2',
  `commune_provinceId` int(11) DEFAULT NULL,
  `commune_regionId` int(11) DEFAULT NULL,
  `commune_districtId` int(11) DEFAULT NULL,
  `commune_commune` text,
  PRIMARY KEY (`commune_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1696 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_commune`
--

LOCK TABLES `cnfi_commune` WRITE;
/*!40000 ALTER TABLE `cnfi_commune` DISABLE KEYS */;
INSERT INTO `cnfi_commune` VALUES (1,1,1,1,13,'Commune Urbaine d\'Antananarivo'),(2,1,1,4,21,'Antsirabe'),(3,1,2,21,1,'Antsiranana'),(4,1,2,21,5,'Nosy-Be'),(5,1,3,7,72,'Fianarantsoa'),(6,1,4,14,36,'Mahajanga'),(7,1,5,11,56,'Sainte Marie'),(8,1,5,12,55,'Toamasina'),(9,1,6,19,95,'Toliara'),(10,1,1,1,16,'Ambohidratrimo'),(11,1,1,1,20,'Anjozorobe'),(12,1,1,1,17,'Ankazobe'),(13,1,1,1,19,'Manjakandriana'),(14,1,1,2,27,'Tsiroanomandidy'),(15,1,1,4,23,'Ambatolampy'),(16,1,1,4,24,'Betafo'),(17,1,1,3,12,'Arivonimamo'),(18,1,1,3,12,'Imerintsiatosika'),(19,1,1,3,10,'Miarinarivo'),(20,1,1,3,11,'Soavinandriana '),(21,1,2,21,4,'Ambanja'),(22,1,2,21,3,'Ambilobe'),(23,1,2,22,9,'Andapa'),(24,1,2,22,8,'Antalaha'),(25,1,2,22,6,'Sambava'),(26,1,2,22,7,'Vohemar'),(27,1,3,7,74,'Ambalavao'),(28,1,3,7,75,'Ambohimahasoa'),(29,1,3,5,68,'Ambositra'),(30,1,3,5,71,'Fandriana'),(31,1,3,5,70,'Ambatofinandrahana'),(32,1,3,9,87,'Ihosy'),(33,1,3,6,83,'Farafangana'),(34,1,3,6,111,'Vangaindrano'),(35,1,3,8,77,'Manakara'),(36,1,3,8,79,'Mananjary'),(37,1,3,8,82,'Ifanadiana'),(38,1,3,8,78,'Vohipeno'),(39,1,3,8,81,'Ikongo'),(40,1,4,14,41,'Marovoay'),(41,1,4,14,40,'Ambato Ambarimay'),(42,1,4,14,39,'Soalala'),(43,1,4,13,42,'Maevatanana'),(44,1,4,13,44,'Tsaratanana'),(45,1,4,15,45,'Maintirano'),(46,1,4,15,48,'Besalampy'),(47,1,4,16,29,'Antsohihy'),(48,1,4,16,35,'Befandriana Nord'),(49,1,4,16,32,'Mampikony'),(50,1,4,16,31,'Mandritsara'),(51,1,4,16,33,'Port-Berger'),(52,1,4,16,34,'Analalava'),(53,1,4,16,30,'Bealanana'),(54,1,5,10,50,'Ambatondrazaka'),(55,1,5,10,51,'Moramanga'),(56,1,5,10,53,'Amparafaravola'),(57,1,5,10,54,'Andilamena'),(58,1,5,11,62,'Fenerive Est'),(59,1,5,11,67,'Maroantsetra'),(60,1,5,11,63,'Vavatenina'),(61,1,5,11,66,'Mananara Nord'),(62,1,5,12,58,'Vatomandry'),(63,1,5,12,59,'Mahanoro'),(64,1,5,12,57,'Brickaville'),(65,1,6,17,104,'Ambovombe Androy'),(66,1,6,17,105,'Morafeno'),(67,1,6,18,110,'Betroka'),(68,1,6,18,108,'Tolagnaro'),(69,1,6,18,109,'Amboasary Sud'),(70,1,6,19,97,'Morombe'),(71,1,6,19,102,'Ampanihy Centre'),(72,1,6,19,101,'Betioky Sud'),(73,1,6,20,92,'Mahabo'),(74,1,6,20,90,'Morondava'),(75,1,6,20,112,'Miandrivazo'),(76,1,6,20,91,'Manja'),(77,2,1,1,18,'Andramasina'),(78,2,1,1,18,'Ambohimiadana'),(79,2,1,1,14,'Bemasoandro'),(80,2,1,1,14,'Tanjombato'),(81,2,1,1,14,'Andoharanofotsy'),(82,2,1,1,14,'Andranonahoatra'),(83,2,1,1,14,'Ambavahaditokana'),(84,2,1,1,14,'Itaosy'),(85,2,1,1,14,'Alakamisy Fenoarivo'),(86,2,1,1,14,'Ampitatafika'),(87,2,1,1,14,'Anosizato Andrefana'),(88,2,1,1,15,'Ankadikely Ilafy'),(89,2,1,1,15,'Sabotsy Namehana'),(90,2,1,1,15,'Alasora'),(91,2,1,1,15,'Ambohimangakely'),(92,2,1,1,15,'Ambohimanga Rova'),(93,2,1,1,15,'Talata Volonondry'),(94,2,1,1,19,'Mantasoa'),(95,2,1,1,16,'Ambohibao Antehiroka'),(96,2,1,1,16,'Talatamaty'),(97,2,1,1,16,'Ambohitrimanjaka'),(98,2,1,1,16,'Anosiala'),(99,2,1,1,16,'Mahitsy'),(100,2,1,1,16,'Ivato'),(101,2,1,2,28,'Fenoarivobe'),(102,2,1,2,27,'Ankadinondry Sakay'),(103,2,1,3,12,'Arivonimamo II'),(104,2,1,3,10,'Analavory'),(105,2,1,4,25,'Antanifotsy'),(106,2,1,4,25,'Ambohimandroso'),(107,2,1,4,26,'Faratsiho'),(108,2,1,4,113,'Mandoto'),(109,2,5,10,52,'Anosibe An\'ala'),(111,2,5,10,50,'Didy'),(112,2,5,11,64,'Soanierana Ivongo'),(113,2,5,12,60,'Antanambao Manampotsy'),(114,2,5,12,56,'Foulpointe'),(115,2,5,12,56,'Tamatave Suburbaine'),(116,2,5,12,61,'Marolambo'),(117,2,4,14,38,'Mitsinjo'),(118,2,4,14,40,'Andranofasika'),(119,2,4,14,41,'Marovoay Banlieu'),(120,2,4,13,43,'Kandreho'),(121,2,4,13,42,'Maevatanana II'),(122,2,4,15,49,'Ambatomainty'),(123,2,4,15,46,'Antsalova'),(124,2,4,15,47,'Morafenobe'),(125,2,4,16,32,'Mampikony II'),(126,2,4,16,33,'Borizinyr II'),(127,2,3,7,76,'Ikalamavony'),(128,2,3,7,114,'Sahambavy'),(129,2,3,7,114,'Alakamisy Ambohimaha'),(130,2,3,7,74,'Ambohimahamasina'),(131,2,3,7,74,'Anjoma'),(132,2,3,7,74,'Ankaramena'),(133,2,3,7,75,'Vohiposa'),(134,2,3,7,115,'Isorana'),(135,2,3,7,116,'Mahasoabe'),(136,2,3,7,116,'Talata Ampano'),(137,2,3,7,116,'Alakamisy Itenina'),(138,2,3,5,69,'Ambovombe'),(139,2,3,5,68,'Ambositra II'),(140,2,3,5,68,'Ivato Centre'),(141,2,3,5,71,'Sandrandahy'),(142,2,3,9,89,'Iakora'),(143,2,3,9,88,'Ivohibe'),(144,2,3,9,87,'Ranohira'),(145,2,3,6,85,'Befotaka Sud'),(146,2,3,6,86,'Nosifeno'),(147,2,3,6,84,'Vondrozo'),(148,2,3,8,82,'Ranomafana'),(149,2,3,8,80,'Nosy Varika'),(150,2,3,8,78,'Vohipeno'),(151,2,3,8,79,'Kianjavato'),(152,2,3,8,77,'Marofarihy'),(153,2,2,21,2,'Antanamitarana'),(154,2,2,21,2,'Anivorano Nord'),(155,2,2,21,2,'Joffre Ville'),(156,2,2,21,2,'Ramena'),(157,2,2,22,9,'Ambalamanasy II'),(158,2,2,22,8,'Ambohitralanana'),(159,2,2,22,6,'Amboangibe'),(160,2,2,22,6,'Farahalana'),(161,2,2,22,7,'Ampanefena'),(162,2,2,22,7,'Antsirabe Nord'),(163,2,6,18,108,'Ampasy Nampohana'),(164,2,6,18,108,'Mandromoromotsy'),(165,2,6,18,108,'Soanierana'),(166,2,6,17,106,'Beloha Androy'),(167,2,6,17,107,'Tsihombe'),(168,2,6,19,99,'Ankazoabo Sud'),(169,2,6,19,103,'Benenitra'),(170,2,6,19,100,'Beroroha'),(171,2,6,19,98,'Sakaraha'),(172,2,6,19,96,'Mitsinjo Betanimena'),(173,2,6,19,96,'Ankililoaky'),(174,2,6,19,102,'Ejeda'),(175,2,6,20,93,'Belo Sur Tsiribihina'),(176,2,1,1,18,'Alarobia Vatosola'),(177,2,1,1,18,'Alatsinainy Bakaro'),(178,2,1,1,18,'Andohariana'),(179,2,1,1,18,'Anosibe Trimoloharano'),(180,2,1,1,18,'Antotohazo'),(181,2,1,1,18,'Fitsinjovana Bakaro'),(182,2,1,1,18,'Mandrosoa'),(183,2,1,1,18,'Sabotsy Ambohitromby'),(184,2,1,1,18,'Sabotsy Manjakavahoaka'),(185,2,1,1,18,'Tankafatra'),(186,2,1,1,18,'Anjoma Faliarivo'),(187,2,1,1,18,'Morarano Soa Firaisana'),(188,2,1,1,16,'Ambato'),(189,2,1,1,16,'Ambatolampy'),(190,2,1,1,16,'Ambohimanjaka'),(191,2,1,1,16,'Ambohimpihaonana'),(192,2,1,1,16,'Ampangabe'),(193,2,1,1,16,'Ampanotokana'),(194,2,1,1,16,'Anjanadoria'),(195,2,1,1,16,'Antanetibe'),(196,2,1,1,16,'Antsahafilo'),(197,2,1,1,16,'Avaratsena'),(198,2,1,1,16,'Fiadanana'),(199,2,1,1,16,'Iarinarivo'),(200,2,1,1,16,'Mahabo'),(201,2,1,1,16,'Mahereza'),(202,2,1,1,16,'Mananjara'),(203,2,1,1,16,'ManjakAntananarivo Avaradrano'),(204,2,1,1,16,'Merimandroso'),(205,2,1,1,20,'Alakamisy'),(206,2,1,1,20,'Ambatomanoina'),(207,2,1,1,20,'Amboasary nord'),(208,2,1,1,20,'Ambohibary Vohilena'),(209,2,1,1,20,'Ambohimarina Marovazaha'),(210,2,1,1,20,'Ambohimirary'),(211,2,1,1,20,'Ambongamarina'),(212,2,1,1,20,'Amparatanjona'),(213,2,1,1,20,'Analaroa'),(214,2,1,1,20,'Androvakely'),(215,2,1,1,20,'Antanetibe'),(216,2,1,1,20,'Belanitra'),(217,2,1,1,20,'Beronono'),(218,2,1,1,20,'Betatao'),(219,2,1,1,20,'Mangamila'),(220,2,1,1,20,'Marotsipoy'),(221,2,1,1,20,'Tsarasoatra'),(222,2,1,1,20,'Andranomisa'),(223,2,1,1,17,'Ambohitromby'),(224,2,1,1,17,'Ambolotarakely'),(225,2,1,1,17,'Antakavana'),(226,2,1,1,17,'Antotohazo'),(227,2,1,1,17,'Fiadanana'),(228,2,1,1,17,'Fihaonana'),(229,2,1,1,17,'Kiangara'),(230,2,1,1,17,'Mahavelona'),(231,2,1,1,17,'Marondry'),(232,2,1,1,17,'Miantso'),(233,2,1,1,17,'Talata-Angavo'),(234,2,1,1,17,'Tsaramasoandro'),(235,2,1,1,17,'Mangasoavina'),(236,2,1,1,17,'Andranomiely'),(237,2,1,1,14,'Alatsinainy Ambazaha'),(238,2,1,1,14,'Ambalavao'),(239,2,1,1,14,'Ambatofahavalo'),(240,2,1,1,14,'Ambohidrapeto'),(241,2,1,1,14,'Ambohijanaka'),(242,2,1,1,14,'Ampahitrosy'),(243,2,1,1,14,'Ampanefy'),(244,2,1,1,14,'Androhibe'),(245,2,1,1,14,'Ankadimanga'),(246,2,1,1,14,'Ankaraobato'),(247,2,1,1,14,'Antanetikely'),(248,2,1,1,14,'Bongatsara'),(249,2,1,1,14,'Fenoarivo'),(250,2,1,1,14,'Fiombonana'),(251,2,1,1,14,'Soalandy'),(252,2,1,1,14,'Soavina'),(253,2,1,1,14,'Tsiafahy'),(254,2,1,1,15,'Ambohimalaza Miray'),(255,2,1,1,15,'Ambohimanambola'),(256,2,1,1,15,'Anjeva Gara'),(257,2,1,1,15,'Ankadinandriana'),(258,2,1,1,15,'Fieferana'),(259,2,1,1,15,'Manandriana'),(260,2,1,1,15,'Masindray'),(261,2,1,1,15,'Viliahazo'),(262,2,1,1,15,'Ambohitrabiby'),(263,2,1,1,15,'Anosy Avaratra'),(264,2,1,1,19,'Alarobia'),(265,2,1,1,19,'Ambanitsena'),(266,2,1,1,19,'Ambatoloana'),(267,2,1,1,19,'Ambatomanga'),(268,2,1,1,19,'Ambatomena'),(269,2,1,1,19,'Ambohibao Sud'),(270,2,1,1,19,'Ambohibary'),(271,2,1,1,19,'Ambohitrandriamanitra'),(272,2,1,1,19,'Ambohitrolomahitsy'),(273,2,1,1,19,'Ambohitrony'),(274,2,1,1,19,'Ambohitseheno'),(275,2,1,1,19,'Ampaneva'),(276,2,1,1,19,'Anjepy'),(277,2,1,1,19,'Anjoma Betoho'),(278,2,1,1,19,'Ankazodandy'),(279,2,1,1,19,'Antsahalalina'),(280,2,1,1,19,'Merikanjaka'),(281,2,1,1,19,'Miadanandriana'),(282,2,1,1,19,'Nandihizana'),(283,2,1,1,19,'Carion'),(284,2,1,1,19,'Ranovao'),(285,2,1,1,19,'Sadabe'),(286,2,1,1,19,'Sambaina'),(287,2,1,1,19,'Soavinandriana'),(288,2,1,2,28,'Ambatomainty Sud'),(289,2,1,2,28,'Ambohitromby'),(290,2,1,2,28,'Fenoarivo Afovoany'),(291,2,1,2,28,'Firavahana'),(292,2,1,2,28,'Kiranomena'),(293,2,1,2,28,'Mahajeby'),(294,2,1,2,28,'Morarano Marotampona'),(295,2,1,2,28,'Tsinjoarivo'),(296,2,1,2,28,'Andriampotsy'),(297,2,1,2,28,'Mangatany'),(298,2,1,2,27,'Ambalanirana'),(299,2,1,2,27,'Ambararatabe'),(300,2,1,2,27,'Ambatolampy'),(301,2,1,2,27,'Ankerana Nord'),(302,2,1,2,27,'Anosy'),(303,2,1,2,27,'Belobaka'),(304,2,1,2,27,'Bemahatazana'),(305,2,1,2,27,'Bevato'),(306,2,1,2,27,'Fierenana'),(307,2,1,2,27,'Mahasolo'),(308,2,1,2,27,'Maroharona'),(309,2,1,2,27,'Marotampona'),(310,2,1,2,27,'Miandrarivo'),(311,2,1,2,27,'Soanierana'),(312,2,1,2,27,'Tsinjoarivo-Imanga'),(313,2,1,2,27,'Tsiroanomandidy Fihaonana'),(314,2,1,2,27,'Antsahalava'),(315,2,1,2,27,'Fiadanantsoa'),(316,2,1,3,12,'Alakamisikely'),(317,2,1,3,12,'Ambatomanga'),(318,2,1,3,12,'Ambatomirahavavy'),(319,2,1,3,12,'Amboanana'),(320,2,1,3,12,'Ambohimandry'),(321,2,1,3,12,'Ambohimasina'),(322,2,1,3,12,'Ambohipandrano'),(323,2,1,3,12,'Ambohitrambo'),(324,2,1,3,12,'Ampahimanga'),(325,2,1,3,12,'Andranomiely'),(326,2,1,3,12,'Antambolo'),(327,2,1,3,12,'Antenimbe'),(328,2,1,3,12,'Mahatsinjo Est'),(329,2,1,3,12,'Manalalondo'),(330,2,1,3,12,'Marofangady'),(331,2,1,3,12,'Miandrandra'),(332,2,1,3,12,'Miantsoarivo'),(333,2,1,3,12,'Morafeno'),(334,2,1,3,12,'Morarano'),(335,2,1,3,12,'Talata Tsimadilo'),(336,2,1,3,10,'Alatsinainikely'),(338,2,1,3,10,'Ambatomanjaka'),(339,2,1,3,10,'Andolofotsy'),(340,2,1,3,10,'Anosibe-Ifanja'),(341,2,1,3,10,'Antoby Est'),(342,2,1,3,10,'Manazary'),(343,2,1,3,10,'Mandiavato'),(344,2,1,3,10,'Miarinarivo II'),(345,2,1,3,10,'Sarobaratra'),(346,2,1,3,10,'Soamahamanina'),(347,2,1,3,10,'Soavimbazaha'),(348,2,1,3,10,'Zoma Behaloka'),(349,2,1,3,10,'Ambatoasana'),(350,2,1,3,10,'Amberomanga'),(351,2,1,3,10,'Amparaky'),(352,2,1,3,10,'Amparibohitra'),(353,2,1,3,10,'Ampary'),(354,2,1,3,10,'Ampefy'),(355,2,1,3,10,'Ankaranana'),(356,2,1,3,10,'Ankisabe'),(357,2,1,3,10,'Antanetibe'),(358,2,1,3,10,'Dondona'),(359,2,1,3,10,'Mahavelona'),(360,2,1,3,10,'Mananasy'),(361,2,1,3,10,'Masindray'),(362,2,1,3,10,'Tamponala'),(363,2,1,3,10,'Ambohidanerana'),(364,2,1,4,23,'Ambatondrakalavao'),(365,2,1,4,23,'Ambodifarihy Fenomanana'),(366,2,1,4,23,'Ambohimpihaonana'),(367,2,1,4,23,'Andranovelona'),(368,2,1,4,23,'Andravola Vohipeno\n'),(369,2,1,4,23,'Andriambilany'),(370,2,1,4,23,'Antakasina'),(371,2,1,4,23,'Antanamalaza'),(372,2,1,4,23,'Antanimasaka'),(373,2,1,4,23,'Antsampandrano'),(374,2,1,4,23,'Behenjy'),(375,2,1,4,23,'Belambo Firaisana'),(376,2,1,4,23,'Manjakatompo'),(377,2,1,4,23,'Morarano'),(378,2,1,4,23,'Sabotsy Namotana'),(379,2,1,4,23,'Tsiafajavona Ankaratra'),(380,2,1,4,23,'Tsinjoarivo'),(381,2,1,4,23,'Andriantsivalana'),(382,2,1,4,25,'Ambatolahy'),(383,2,1,4,25,'Ambatomiady'),(384,2,1,4,25,'Ambatotsipihana'),(385,2,1,4,25,'Ambodiarina'),(386,2,1,4,25,'Ambohitompoina'),(387,2,1,4,25,'Ampitatafika'),(388,2,1,4,25,'Andranofito'),(389,2,1,4,25,'Antsahalava'),(390,2,1,4,25,'Antsampandrano'),(391,2,1,4,25,'Belanitra'),(392,2,1,4,25,'Anjamanga'),(393,2,1,4,25,'Soamanandrariny'),(394,2,1,4,22,'Alakamisy'),(395,2,1,4,22,'Alatsinainy Ibity'),(396,2,1,4,22,'Ambano'),(397,2,1,4,22,'Ambatomena'),(398,2,1,4,22,'Ambohibary'),(399,2,1,4,22,'Ambohidranandriana'),(400,2,1,4,22,'Ambohimiarivo'),(401,2,1,4,22,'Ambohitsimanova'),(402,2,1,4,22,'Andranomanelatra'),(403,2,1,4,22,'Antanambao'),(404,2,1,4,22,'Antanimandry'),(405,2,1,4,22,'Antsoantany'),(406,2,1,4,22,'Belazao'),(407,2,1,4,22,'Mandrosohasina'),(408,2,1,4,22,'Mangarano'),(409,2,1,4,22,'Sahanivotry Manandona'),(410,2,1,4,22,'Soanindrariny'),(411,2,1,4,22,'Tsarahonenana Sahanivotry'),(412,2,1,4,22,'Vinanikarena'),(413,2,1,4,22,'Manandona'),(414,2,1,4,24,'Alakamisy Anativato'),(415,2,1,4,24,'Alakamisy'),(416,2,1,4,24,'Marososona'),(417,2,1,4,24,'Alarobia Bemaha'),(418,2,1,4,24,'Ambatonikolahy'),(419,2,1,4,24,'Ambohimanambola'),(420,2,1,4,24,'Ambohimasina'),(421,2,1,4,24,'Andranomafana'),(422,2,1,4,24,'Andrembesoa'),(423,2,1,4,24,'Anosiarivo Manapa'),(424,2,1,4,24,'Antohobe'),(425,2,1,4,24,'Antsoso'),(426,2,1,4,24,'Inanantonana'),(427,2,1,4,24,'Mahaiza'),(428,2,1,4,24,'Mandritsara'),(429,2,1,4,24,'Manohisoa'),(430,2,1,4,24,'Soavina'),(431,2,1,4,24,'Tritriva'),(432,2,1,4,26,'Ambohiborona'),(433,2,1,4,26,'Andranomiady'),(434,2,1,4,26,'Antsampanimahazo'),(435,2,1,4,26,'Miandrarivo'),(436,2,1,4,26,'Ramainandro'),(437,2,1,4,26,'Valabetokana'),(438,2,1,4,26,'Faravohitra'),(439,2,1,4,26,'Vinaninony Sud'),(440,2,1,4,113,'Vasiana'),(441,2,1,4,113,'Antanambao Ambary'),(442,2,1,4,113,'Betsohana'),(443,2,1,4,113,'Vinany'),(444,2,1,4,113,'Anjoma Ramartina'),(445,2,1,4,113,'Ankazomiriotra'),(446,2,1,4,113,'Fidirana'),(447,2,1,4,113,'Maromandray'),(448,2,2,21,4,'Ambalahonko'),(449,2,2,21,4,'Ambodimanga Ramena'),(450,2,2,21,4,'Ambohimarina'),(451,2,2,21,4,'Ambohimena'),(452,2,2,21,4,'Anorotsangana'),(453,2,2,21,4,'Antsirabe'),(454,2,2,21,4,'Bemanevika Haut Sambirano'),(455,2,2,21,4,'Marovato'),(456,2,2,21,4,'Ankingameloko'),(457,2,2,21,4,'Ambaliha'),(458,2,2,21,4,'Ambohitrandriana'),(459,2,2,21,4,'Ankatafa'),(460,2,2,21,4,'Antafiambotry'),(461,2,2,21,4,'Antranonkarany'),(462,2,2,21,4,'Antsakoamanondro'),(463,2,2,21,4,'Antsatsaka'),(464,2,2,21,4,'Bemanevika Ouest'),(465,2,2,21,4,'Benavony'),(466,2,2,21,4,'Djangoa'),(467,2,2,21,4,'Maevatanana'),(468,2,2,21,4,'Maherivaratra'),(469,2,2,21,4,'Marotaolana'),(470,2,2,21,4,'Marotaolana'),(471,2,2,21,3,'Anaborano Ifasy'),(472,2,2,21,3,'Antsaravibe'),(473,2,2,21,3,'Manambato'),(474,2,2,21,3,'Ambakirano'),(475,2,2,21,3,'Ambarakaraka'),(476,2,2,21,3,'Ambatoben\'anjavy'),(477,2,2,21,3,'Ambodiboanara'),(478,2,2,21,3,'Ampondralava'),(479,2,2,21,3,'Anjiabe Haut'),(480,2,2,21,3,'Antsohimbondrona'),(481,2,2,21,3,'Beramanja'),(482,2,2,21,3,'Betsiaka'),(483,2,2,21,3,'Mantaly'),(484,2,2,21,3,'Tanambao Marivorahona'),(485,2,2,21,3,'Sirama'),(486,2,2,21,3,'Antanabe'),(487,2,2,21,2,'Ambondrona'),(488,2,2,21,2,'Andrafiabe'),(489,2,2,21,2,'Andranovondronina'),(490,2,2,21,2,'Anketrakabe'),(491,2,2,21,2,'Bobakilandy'),(492,2,2,21,2,'Bobasakoa'),(493,2,2,21,2,'Mangaoko'),(494,2,2,21,2,'Andranofanjava'),(495,2,2,21,2,'Ankarongona'),(496,2,2,21,2,'Antsahampano'),(497,2,2,21,2,'Antsalaka'),(498,2,2,21,2,'Antsoha'),(499,2,2,21,2,'Mahalina'),(500,2,2,21,2,'Mahavanona'),(501,2,2,21,2,'Mosorolava'),(502,2,2,21,2,'Sadjoavato'),(503,2,2,21,2,'Sakaramy'),(504,2,2,21,2,'Antsakoabe'),(505,2,2,21,2,'Ambolobozobe'),(506,2,2,22,9,'Andrakata'),(507,2,2,22,9,'Doany'),(508,2,2,22,9,'Ankiakabe Nord'),(509,2,2,22,9,'Anoviara'),(510,2,2,22,9,'Belaoka Lokoho'),(511,2,2,22,9,'Belaoka Marovato'),(512,2,2,22,9,'Tanandava'),(513,2,2,22,9,'Ambodiangezoka'),(514,2,2,22,9,'Ambodimanga I'),(515,2,2,22,9,'Andranomena'),(516,2,2,22,9,'Anjialavabe'),(517,2,2,22,9,'Antsahamena'),(518,2,2,22,9,'Bealampona'),(519,2,2,22,9,'Betsakotsako'),(520,2,2,22,9,'Marovato'),(521,2,2,22,9,'Matsohely'),(522,2,2,22,9,'Ambodidivaina'),(523,2,2,22,9,'Ambalavelona'),(524,2,2,22,9,'Andasibe Kobahena'),(525,2,2,22,8,'Lanjarivo'),(526,2,2,22,8,'Ampohibe'),(527,2,2,22,8,'Ambinanifaho'),(528,2,2,22,8,'Ampahana'),(529,2,2,22,8,'Ampanavoana'),(530,2,2,22,8,'Andampy'),(531,2,2,22,8,'Antananambo'),(532,2,2,22,8,'Antsambalahy'),(533,2,2,22,8,'Marofinaritra'),(534,2,2,22,8,'Sarahandrano'),(535,2,2,22,8,'Vinanivao'),(536,2,2,22,8,'Ambalabe'),(537,2,2,22,8,'Antombana'),(538,2,2,22,8,'Antsahanoro'),(539,2,2,22,8,'Manakambahiny Ankavia'),(540,2,2,22,8,'Sahantaha'),(541,2,2,22,6,'Ambohimitsinjo'),(542,2,2,22,6,'Antsahavaribe'),(543,2,2,22,6,'Ambohimalaza'),(544,2,2,22,6,'Antindra'),(545,2,2,22,6,'Antsambaharo'),(546,2,2,22,6,'Marogaona'),(547,2,2,22,6,'Marojala'),(548,2,2,22,6,'Anjialava'),(549,2,2,22,6,'Anjangoveratra'),(550,2,2,22,6,'Ambatoafo'),(551,2,2,22,6,'Ambodiampana'),(552,2,2,22,6,'Ambodivoara'),(553,2,2,22,6,'Analamaho'),(554,2,2,22,6,'Andrahanjo'),(555,2,2,22,6,'Andratamarina'),(556,2,2,22,6,'Anjinjaomby'),(557,2,2,22,6,'Bevonotra'),(558,2,2,22,6,'Maroambihy'),(559,2,2,22,6,'Morafeno'),(560,2,2,22,6,'Nosiarina'),(561,2,2,22,6,'Tanambao Daoud'),(562,2,2,22,6,'Andrembona'),(563,2,2,22,6,'Bemanevika'),(564,2,2,22,6,'Andapabe'),(565,2,2,22,6,'Mahasoa Antindra'),(566,2,2,22,7,'Ambalasatrana'),(567,2,2,22,7,'Andrafainkona'),(568,2,2,22,7,'Fanambana'),(569,2,2,22,7,'Ambinan\'andravory'),(570,2,2,22,7,'Ambodisambalahy'),(571,2,2,22,7,'Amboriala'),(572,2,2,22,7,'Ampisikina'),(573,2,2,22,7,'Ampondra'),(574,2,2,22,7,'Andravory'),(575,2,2,22,7,'Belambo'),(576,2,2,22,7,'Bobakindro'),(577,2,2,22,7,'Daraina'),(578,2,2,22,7,'Maromokotra Loky'),(579,2,2,22,7,'Milanoa'),(580,2,2,22,7,'Nosibe'),(581,2,2,22,7,'Tsarabaria'),(582,2,3,7,74,'Ambinanindovoka'),(583,2,3,7,74,'Ambinaniroa'),(584,2,3,7,74,'Ambohimandroso'),(585,2,3,7,74,'Andrainjato'),(586,2,3,7,74,'Besoa'),(587,2,3,7,74,'Fenoarivo'),(588,2,3,7,74,'Iarintsena'),(589,2,3,7,74,'Kirano'),(590,2,3,7,74,'Mahazony'),(591,2,3,7,74,'Manamisoa'),(592,2,3,7,74,'10'),(593,2,3,7,74,'Sendrisoa'),(594,2,3,7,74,'Vohitsaoka'),(595,2,3,7,74,'Namoly'),(596,2,3,7,74,'Volamena'),(597,2,3,7,74,'Ambalakindresy'),(598,2,3,7,75,'Ambatosoa'),(599,2,3,7,75,'Ambohinamboarina'),(600,2,3,7,75,'Ampitana'),(601,2,3,7,75,'Ankafina Tsarafindy'),(602,2,3,7,75,'Ankerana'),(603,2,3,7,75,'Befeta'),(604,2,3,7,75,'Camp Robin'),(605,2,3,7,75,'Fiadanana'),(606,2,3,7,75,'Isaka'),(607,2,3,7,75,'Kalalao'),(608,2,3,7,75,'Manandroy'),(609,2,3,7,75,'Morafeno'),(610,2,3,7,75,'Sahadona'),(611,2,3,7,75,'Sahafe'),(612,2,3,7,75,'Vohitrarivo'),(613,2,3,7,76,'Ambatomainty'),(614,2,3,7,76,'Fitampito'),(615,2,3,7,76,'Mangidy'),(616,2,3,7,76,'Solila'),(617,2,3,7,76,'Tanamarina Bekisoba'),(618,2,3,7,76,'Tanamarina Sakay'),(619,2,3,7,76,'Tsitondrohina'),(620,2,3,7,114,'Alatsinainy Lalamarina'),(621,2,3,7,114,'Ambalakely'),(622,2,3,7,114,'Ambalamahasoa'),(623,2,3,7,114,'Andrainjato Centre'),(624,2,3,7,114,'Andrainjato Est'),(625,2,3,7,114,'Androy'),(626,2,3,7,114,'Fandradava'),(627,2,3,7,114,'Lalananindro'),(628,2,3,7,114,'Ivoara'),(629,2,3,7,114,'Mahatsinjony'),(630,2,3,7,114,'Taindambo'),(631,2,3,7,114,'Sahafata'),(632,2,3,7,114,'Ampatsy Ampangambe'),(633,2,3,7,114,'Vinaninoro Andrefana'),(634,2,3,7,115,'Ambalamindera 2'),(635,2,3,7,115,'Ambondrona'),(636,2,3,7,115,'Andoharanomaitso'),(637,2,3,7,115,'Anjomahitsara'),(638,2,3,7,115,'Ankarinarivo Manirisoa'),(639,2,3,7,115,'Fanjakana'),(640,2,3,7,115,'Mahazoarivo'),(641,2,3,7,115,'Nasandratrony'),(642,2,3,7,115,'Soatanana'),(643,2,3,7,115,'Vohibola'),(644,2,3,7,115,'Andreamalama'),(645,2,3,7,115,'Ambalamidera Ambohimanana'),(646,2,3,7,116,'Andranomiditra'),(647,2,3,7,116,'Andranovorivato'),(648,2,3,7,116,'Ankaromalaza Mifanasoa'),(649,2,3,7,116,'Ihazoara'),(650,2,3,7,116,'Mahaditra'),(651,2,3,7,116,'Maneva'),(652,2,3,7,116,'Soaindrana'),(653,2,3,7,116,'Vinanitelo'),(654,2,3,7,116,'Vohibato Ouest'),(655,2,3,7,116,'Vohimarina'),(656,2,3,7,116,'Vohitrafeno'),(657,2,3,7,116,'Lamosina'),(658,2,3,7,116,'AnjanomanonaTsiamiavaka'),(659,2,3,5,70,'Ambatomifangoa'),(660,2,3,5,70,'Ambondromisotra'),(661,2,3,5,70,'Amborompotsy'),(662,2,3,5,70,'Fenoarivo'),(663,2,3,5,70,'Itremo'),(664,2,3,5,70,'Mandrosonoro'),(665,2,3,5,70,'Mangataboahangy'),(666,2,3,5,70,'Soavina'),(667,2,3,5,68,'Alakamisy Ambohijato'),(668,2,3,5,68,'Ambalamanakana'),(669,2,3,5,68,'Ambatofitorahana'),(670,2,3,5,68,'Ambinaninandro'),(671,2,3,5,68,'Ambohimitombo I'),(672,2,3,5,68,'Ambohimitombo II'),(673,2,3,5,68,'Andina'),(674,2,3,5,68,'Ankazoambo'),(675,2,3,5,68,'Antoetra'),(676,2,3,5,68,'Fahizay'),(677,2,3,5,68,'Ihadilanana'),(678,2,3,5,68,'Ilaka Centre'),(679,2,3,5,68,'Imerina Imady'),(680,2,3,5,68,'Ivony Miara-Miasa'),(681,2,3,5,68,'Kianjandrakefina'),(682,2,3,5,68,'Mahazina Ambohipierenana'),(683,2,3,5,68,'Marosoa'),(684,2,3,5,68,'Sahatsiho Ambohimanjaka'),(685,2,3,5,68,'Tsarasaotra'),(686,2,3,5,68,'Vohidahy'),(687,2,3,5,68,'Ambohiperivoana'),(688,2,3,5,68,'Ankazotsararavina'),(689,2,3,5,71,'Alakamisy Ambohimahazo'),(690,2,3,5,71,'Ankarinoro'),(691,2,3,5,71,'Betsimisotra'),(692,2,3,5,71,'Fiadanana'),(693,2,3,5,71,'Imito'),(694,2,3,5,71,'Mahazoarivo'),(695,2,3,5,71,'Miarinavaratra'),(696,2,3,5,71,'Milamina'),(697,2,3,5,71,'Sahamadio'),(698,2,3,5,71,'Tatamalaza'),(699,2,3,5,71,'Tsarazaza'),(700,2,3,5,71,'Soanakambana'),(701,2,3,5,71,'Isandrandahy Ambony'),(702,2,3,5,69,'Ambatomarina'),(703,2,3,5,69,'Ambohimahazo'),(704,2,3,5,69,'Ambohimilanja'),(705,2,3,5,69,'Ambohipo'),(706,2,3,5,69,'Andakatany'),(707,2,3,5,69,'Anjoma Nandihizana'),(708,2,3,5,69,'Anjoman’ankona'),(709,2,3,5,69,'Talata Vohimena'),(710,2,3,5,69,'Vinany Andakantanikely'),(711,2,3,5,69,'Soatanana'),(712,2,3,5,69,'Ilanjona'),(713,2,3,9,89,'Begogo'),(714,2,3,9,89,'Ranotsara Nord'),(715,2,3,9,89,'Andranombao'),(716,2,3,9,89,'Volambita'),(717,2,3,9,87,'Andioalava'),(718,2,3,9,87,'Ankily'),(719,2,3,9,87,'Analavoka'),(720,2,3,9,87,'Ambatolahy'),(721,2,3,9,87,'Antsoha'),(722,2,3,9,87,'Iloto Menamaty'),(723,2,3,9,87,'Tolohomiady'),(724,2,3,9,87,'Ambia'),(725,2,3,9,87,'Analaliry'),(726,2,3,9,87,'Ilakaka'),(727,2,3,9,87,'Irina'),(728,2,3,9,87,'Mahasoa'),(729,2,3,9,87,'Sahambano'),(730,2,3,9,87,'Sakalalina'),(731,2,3,9,87,'Satrokala'),(732,2,3,9,87,'Soamatasy'),(733,2,3,9,87,'Zazafotsy'),(734,2,3,9,87,'Andohan\'Ilakaka'),(735,2,3,9,88,'Antambohombe'),(736,2,3,9,88,'Ivongo'),(737,2,3,9,88,'Maropaika'),(738,2,3,9,88,'Kotipa'),(739,2,3,9,88,'Antaramena'),(740,2,3,6,85,'Antaninarenina'),(741,2,3,6,85,'Antondabe'),(742,2,3,6,85,'Beharena'),(743,2,3,6,85,'Bekofafa Sud'),(744,2,3,6,85,'Marovitsika Sud'),(745,2,3,6,85,'Ranotsara Sud'),(746,2,3,6,85,'Antokoboritelo'),(747,2,3,6,85,'Inosy'),(748,2,3,6,83,'Manambotra Sud'),(749,2,3,6,83,'Etrotroka'),(750,2,3,6,83,'Ihorombe'),(751,2,3,6,83,'Ambohimandroso'),(752,2,3,6,83,'Anosivelo'),(753,2,3,6,83,'Ivandrika'),(754,2,3,6,83,'Marovandrika'),(755,2,3,6,83,'Sahamadio'),(756,2,3,6,83,'Vohimasy'),(757,2,3,6,83,'Vohitromby'),(758,2,3,6,83,'Ambalatany'),(759,2,3,6,83,'Ambalavato Antevato'),(760,2,3,6,83,'Ambalavato Nord'),(761,2,3,6,83,'Ambohigogo'),(762,2,3,6,83,'Amporoforo'),(763,2,3,6,83,'Ankarana'),(764,2,3,6,83,'Anosy tsarafara'),(765,2,3,6,83,'Antsiranambe'),(766,2,3,6,83,'Bevoay Beretra'),(767,2,3,6,83,'Efatsy'),(768,2,3,6,83,'Evato'),(769,2,3,6,83,'Fenoarivo'),(770,2,3,6,83,'Iabohazo'),(771,2,3,6,83,'Mahabo Mananivo'),(772,2,3,6,83,'Mahafasa'),(773,2,3,6,83,'Mahavelo'),(774,2,3,6,83,'Maheriraty'),(775,2,3,6,83,'Namohora Laborano'),(776,2,3,6,83,'Tangainony'),(777,2,3,6,83,'Tovona'),(778,2,3,6,83,'Vohilengo'),(779,2,3,6,83,'Vohilavan\'i Manampatra'),(780,2,3,6,86,'Andranolalina'),(781,2,3,6,86,'Ankazovelo'),(782,2,3,6,86,'Ivondro'),(783,2,3,6,86,'Zara'),(784,2,3,6,86,'Soakibany'),(785,2,3,6,86,'Bevaho'),(786,2,3,6,111,'Bekaraoky'),(787,2,3,6,111,'Fenoambany'),(788,2,3,6,111,'Ambatolava'),(789,2,3,6,111,'Ranomena'),(790,2,3,6,111,'Ambongo'),(791,2,3,6,111,'Anolibe'),(792,2,3,6,111,'Bevata'),(793,2,3,6,111,'Lohafary'),(794,2,3,6,111,'Sandravinany'),(795,2,3,6,111,'Amparihy Est'),(796,2,3,6,111,'Ampasimalemy'),(797,2,3,6,111,'Ampataka'),(798,2,3,6,111,'Bema'),(799,2,3,6,111,'Iara'),(800,2,3,6,111,'Isahara'),(801,2,3,6,111,'Karimbary'),(802,2,3,6,111,'Lopary'),(803,2,3,6,111,'Manambondro'),(804,2,3,6,111,'Marokibo'),(805,2,3,6,111,'Masianaka'),(806,2,3,6,111,'Matava'),(807,2,3,6,111,'Soamanova'),(808,2,3,6,111,'Tsianofana'),(809,2,3,6,111,'Tsiately'),(810,2,3,6,111,'Vatanato'),(811,2,3,6,111,'Vohimalaza'),(812,2,3,6,111,'Vohipaho'),(813,2,3,6,111,'Vohitrambo'),(814,2,3,6,111,'Mahabe'),(815,2,3,6,111,'Fonilaza'),(816,2,3,6,84,'Maroteza'),(817,2,3,6,84,'Anandravy'),(818,2,3,6,84,'Vohiboreka'),(819,2,3,6,84,'Ivato'),(820,2,3,6,84,'Ambohimanana'),(821,2,3,6,84,'Andakana'),(822,2,3,6,84,'Antokonala'),(823,2,3,6,84,'Iamonta'),(824,2,3,6,84,'Karianga'),(825,2,3,6,84,'Mahatsinjo'),(826,2,3,6,84,'Mahavelo'),(827,2,3,6,84,'Mahazoarivo'),(828,2,3,6,84,'Manambidala'),(829,2,3,6,84,'Manato'),(830,2,3,6,84,'Vohimary'),(831,2,3,6,84,'Ambodirano'),(832,2,3,6,84,'Andoharano'),(833,2,3,8,82,'Ambohimanga sud'),(834,2,3,8,82,'Ambohimiera'),(835,2,3,8,82,'Analampasina'),(836,2,3,8,82,'Androrangavola'),(837,2,3,8,82,'Antaretra'),(838,2,3,8,82,'Antsindra'),(839,2,3,8,82,'Fasintsara'),(840,2,3,8,82,'Kelilalina'),(841,2,3,8,82,'Maroharatra'),(842,2,3,8,82,'Marotoko'),(843,2,3,8,82,'Tsaratanana'),(844,2,3,8,82,'Ampasinambo'),(845,2,3,8,82,'Ambiabe'),(846,2,3,8,81,'Ambatofotsy'),(847,2,3,8,81,'Ambinanitromby'),(848,2,3,8,81,'Ambohimisafy'),(849,2,3,8,81,'Ambolomandinika'),(850,2,3,8,81,'Ankaribelo'),(851,2,3,8,81,'Antondinga'),(852,2,3,8,81,'Belemoka'),(853,2,3,8,81,'Ifanirea'),(854,2,3,8,81,'Kalafotsy'),(855,2,3,8,81,'Manampatrana'),(856,2,3,8,81,'Maromiandra'),(857,2,3,8,81,'Sahalanona'),(858,2,3,8,81,'Tanakamba'),(859,2,3,8,81,'Tolongoina'),(860,2,3,8,81,'Andefampony'),(861,2,3,8,81,'Tsifenokataka'),(862,2,3,8,77,'Ambahatrazo'),(863,2,3,8,77,'Ambahive'),(864,2,3,8,77,'Ambalaroka'),(865,2,3,8,77,'Ambalavero'),(866,2,3,8,77,'Ambandrika'),(867,2,3,8,77,'Ambila'),(868,2,3,8,77,'Amboanjo'),(869,2,3,8,77,'Ambohitsara'),(870,2,3,8,77,'Amborondra'),(871,2,3,8,77,'Ambotaka'),(872,2,3,8,77,'Ampasimanjeva'),(873,2,3,8,77,'Ampasimboraka'),(874,2,3,8,77,'Apasimpotsy Sud'),(875,2,3,8,77,'Analavory'),(876,2,3,8,77,'Anorombato'),(877,2,3,8,77,'Anteza'),(878,2,3,8,77,'Bekatra'),(879,2,3,8,77,'Betampona'),(880,2,3,8,77,'Fenomby'),(881,2,3,8,77,'Kianjanomby'),(882,2,3,8,77,'Lokomby'),(883,2,3,8,77,'Mahabako'),(884,2,3,8,77,'Mahamaibe'),(885,2,3,8,77,'Mangatsiotra'),(886,2,3,8,77,'Mavorano'),(887,2,3,8,77,'Mitanty'),(888,2,3,8,77,'Mizilo'),(889,2,3,8,77,'Nihaonana'),(890,2,3,8,77,'Nosiala'),(891,2,3,8,77,'Onilahy'),(892,2,3,8,77,'Sahanambohitra'),(893,2,3,8,77,'Saharefo'),(894,2,3,8,77,'Sahasinaka'),(895,2,3,8,77,'Sakoana'),(896,2,3,8,77,'Sorombo'),(897,2,3,8,77,'Tataho'),(898,2,3,8,77,'Vatana'),(899,2,3,8,77,'Vinanitelo'),(900,2,3,8,77,'Vohilava'),(901,2,3,8,77,'Vohimanitra'),(902,2,3,8,77,'Vohimasina Nord'),(903,2,3,8,77,'Vohimasina Sud'),(904,2,3,8,77,'Vohimasy'),(905,2,3,8,77,'Ambohitrova'),(906,2,3,8,77,'Manjarivo'),(907,2,3,8,79,'Ambalahosy Nord'),(908,2,3,8,79,'Ambodinonoka'),(909,2,3,8,79,'Ambohimarina'),(910,2,3,8,79,'Ambohinihaonana '),(911,2,3,8,79,'Ambohitsara Est'),(912,2,3,8,79,'Andonabe'),(913,2,3,8,79,'Andragnambolavo'),(914,2,3,8,79,'Andranomavo'),(915,2,3,8,79,'Ankatafana'),(916,2,3,8,79,'Anosimparihy'),(917,2,3,8,79,'Antaretra'),(918,2,3,8,79,'Antsenavolo'),(919,2,3,8,79,'Mahatsara Lefaka'),(920,2,3,8,79,'Mahatsara Sud'),(921,2,3,8,79,'Mahavoky Nord'),(922,2,3,8,79,'Mahela'),(923,2,3,8,79,'Manakana Nord'),(924,2,3,8,79,'Marofototra'),(925,2,3,8,79,'Marokarima'),(926,2,3,8,79,'Marosangy'),(927,2,3,8,79,'Morafeno'),(928,2,3,8,79,'Namorona'),(929,2,3,8,79,'Sandrohy'),(930,2,3,8,79,'Vatohandrina'),(931,2,3,8,79,'Vohilava'),(932,2,3,8,79,'Tsaravary'),(933,2,3,8,79,'Tsiatosika'),(934,2,3,8,80,'Ambahy'),(935,2,3,8,80,'Ambakobe'),(936,2,3,8,80,'Ambodiara'),(937,2,3,8,80,'Ambodilafa'),(938,2,3,8,80,'Ambodirian\'i Sahafary'),(939,2,3,8,80,'Ampasinambo'),(940,2,3,8,80,'Andara'),(941,2,3,8,80,'Androrangavola'),(942,2,3,8,80,'Angodongodona'),(943,2,3,8,80,'Antanambao'),(944,2,3,8,80,'Befody'),(945,2,3,8,80,'Fiadanana'),(946,2,3,8,80,'Sahavato'),(947,2,3,8,80,'Soavina'),(948,2,3,8,80,'Vohidroa'),(949,2,3,8,80,'Vohilava'),(950,2,3,8,80,'Vohitrandriana'),(951,2,3,8,80,'Fanivelona'),(952,2,3,8,78,'Andemaka'),(953,2,3,8,78,'Ankaribamry'),(954,2,3,8,78,'Anoloka'),(955,2,3,8,78,'Antananabo'),(956,2,3,8,78,'Ifatsy'),(957,2,3,8,78,'Ilakatra'),(958,2,3,8,78,'Ivato'),(959,2,3,8,78,'Lanivo'),(960,2,3,8,78,'Mahabo '),(961,2,3,8,78,'Masoahabe'),(962,2,3,8,78,'Mahazoarivo'),(963,2,3,8,78,'Nato'),(964,2,3,8,78,'Onjatsy'),(965,2,3,8,78,'Sahalava'),(966,2,3,8,78,'Savana'),(967,2,3,8,78,'Vohilany'),(968,2,3,8,78,'Vohindava'),(969,2,3,8,78,'Vohitrindry'),(970,2,3,8,78,'Zafindrafady'),(971,2,3,8,78,'Amborombe'),(972,2,4,14,40,'Ambondromamy'),(973,2,4,14,40,'Andranomamy'),(974,2,4,14,40,'Anjiajia'),(975,2,4,14,40,'Ankijabe'),(976,2,4,14,40,'Ankirihitra'),(977,2,4,14,40,'Madirovalo'),(978,2,4,14,40,'Manerinerina'),(979,2,4,14,40,'Sitamoiky'),(980,2,4,14,40,'Tsaramandroso'),(981,2,4,14,40,'Ambesisika'),(982,2,4,14,37,'Ambalabe Befanjava'),(983,2,4,14,37,'Ambalakida'),(984,2,4,14,37,'Andranoboboka'),(985,2,4,14,37,'Bekobay Centre'),(986,2,4,14,37,'Belobaka'),(987,2,4,14,37,'Betsako'),(988,2,4,14,37,'Boanamary'),(989,2,4,14,37,'Mahajamba Usine'),(990,2,4,14,37,'Mariarano'),(991,2,4,14,41,'Ambolomoty'),(992,2,4,14,41,'Ankaraobato'),(993,2,4,14,41,'Ankazomborona'),(994,2,4,14,41,'Anosinalainolona'),(995,2,4,14,41,'Antanambao Andranolava'),(996,2,4,14,41,'Antanimasaka'),(997,2,4,14,41,'Bemaharivo'),(998,2,4,14,41,'Manaratsandry'),(999,2,4,14,41,'Marosakoa'),(1000,2,4,14,41,'Tsararano '),(1001,2,4,14,41,'Ankaboka'),(1002,2,4,14,38,'Ambarimaninga'),(1003,2,4,14,38,'Antongomena Bevary'),(1004,2,4,14,38,'Antseza'),(1005,2,4,14,38,'Bekipay'),(1006,2,4,14,38,'Katsepy'),(1007,2,4,14,38,'Mahatsakabanja'),(1008,2,4,14,39,'Ambohipaly'),(1009,2,4,14,39,'Andranomavo'),(1010,2,4,14,39,'Antsakoamileka'),(1011,2,4,13,43,'Ambaliha'),(1012,2,4,13,43,'Behazomaty'),(1013,2,4,13,43,'Betaimboay'),(1014,2,4,13,43,'Andasibe'),(1015,2,4,13,43,'Antanimbaribe'),(1016,2,4,13,43,'Mahatsinjo'),(1017,2,4,13,42,'Andrimba'),(1018,2,4,13,42,'Morafeno'),(1019,2,4,13,42,'Ambalajia'),(1020,2,4,13,42,'Ambalanjanakomby'),(1021,2,4,13,42,'Antanimbary'),(1022,2,4,13,42,'Antsiafabositra'),(1023,2,4,13,42,'Bemokotra'),(1024,2,4,13,42,'Beratsimanina'),(1025,2,4,13,42,'Madiromirafy'),(1026,2,4,13,42,'Mahatsinjo'),(1027,2,4,13,42,'Mahazoma'),(1028,2,4,13,42,'Mangabe'),(1029,2,4,13,42,'Maria'),(1030,2,4,13,42,'Marokoro '),(1031,2,4,13,42,'Tsararano '),(1032,2,4,13,42,'Beanana'),(1033,2,4,13,42,'Berivotra 5/5'),(1034,2,4,13,44,'Sakoamadinika'),(1035,2,4,13,44,'Ampandrana'),(1036,2,4,13,44,'Betrandraka'),(1037,2,4,13,44,'Ambakireny'),(1038,2,4,13,44,'Andriamena'),(1039,2,4,13,44,'Bekapaika'),(1040,2,4,13,44,'Brieville'),(1041,2,4,13,44,'Keliloha'),(1042,2,4,13,44,'Manakana'),(1043,2,4,13,44,'Sarobaratra'),(1044,2,4,13,44,'Tsararova'),(1045,2,4,13,44,'Isiko'),(1046,2,4,15,49,'Bemaribo'),(1047,2,4,15,49,'Marotsialeha'),(1048,2,4,15,49,'Sarodrano'),(1049,2,4,15,46,'Makaraingo'),(1050,2,4,15,46,'Bekopaka'),(1051,2,4,15,46,'Masoarivo'),(1052,2,4,15,46,'Soahany'),(1053,2,4,15,46,'Trangahy'),(1054,2,4,15,48,'Bemaraha Antsinanana'),(1055,2,4,15,48,'Ankasakasa'),(1056,2,4,15,48,'Ambolidia Sud'),(1057,2,4,15,48,'Ampako'),(1058,2,4,15,48,'Bekodoha'),(1059,2,4,15,48,'Mahabe'),(1060,2,4,15,48,'Marovoay Sud'),(1061,2,4,15,48,'Soanenga'),(1062,2,4,15,48,'Antsirasira'),(1063,2,4,15,45,'Andrea'),(1064,2,4,15,45,'Andranovao'),(1065,2,4,15,45,'Behaboka Sud'),(1066,2,4,15,45,'Andabotoka'),(1067,2,4,15,45,'Ankisatra'),(1068,2,4,15,45,'Antsaindoha Bebao'),(1069,2,4,15,45,'Antsondrondava'),(1070,2,4,15,45,'Belitsaky'),(1071,2,4,15,45,'Bemokotra'),(1072,2,4,15,45,'Berevo Ranobe'),(1073,2,4,15,45,'Betanatanana'),(1074,2,4,15,45,'Mafajijo'),(1075,2,4,15,45,'Marohazo'),(1076,2,4,15,45,'Maromavo'),(1077,2,4,15,45,'Tambohorano'),(1078,2,4,15,45,'Veromanga'),(1079,2,4,15,47,'Andramy'),(1080,2,4,15,47,'Beravina'),(1081,2,4,15,47,'Antranokoaky'),(1082,2,4,16,34,'Ambaliha'),(1083,2,4,16,34,'Ambarijeby Sud'),(1084,2,4,16,34,'Ambolobozo'),(1085,2,4,16,34,'Andribavontsina'),(1086,2,4,16,34,'Angoaka Sud'),(1087,2,4,16,34,'Ankaramy'),(1088,2,4,16,34,'Antonibe'),(1089,2,4,16,34,'85 Nord'),(1090,2,4,16,34,'Mahadrodroka'),(1091,2,4,16,34,'Maromandia'),(1092,2,4,16,34,'Marovantaza'),(1093,2,4,16,34,'Marovatolena'),(1094,2,4,16,34,'Bejofo'),(1095,2,4,16,34,'Andrevorevo'),(1096,2,4,16,29,'Ambodimadiro'),(1097,2,4,16,29,'Ambodimanary'),(1098,2,4,16,29,'Ambodimandresy'),(1099,2,4,16,29,'Ampandriakilandy'),(1100,2,4,16,29,'Anahidrano'),(1101,2,4,16,29,'Andreba'),(1102,2,4,16,29,'Anjalazala'),(1103,2,4,16,29,'Anijamangirana'),(1104,2,4,16,29,'Ankerika '),(1105,2,4,16,29,'Antsahabe'),(1106,2,4,16,29,'Maroala'),(1107,2,4,16,29,'Ambalafamity'),(1108,2,4,16,30,'Ambaiaromba'),(1109,2,4,16,30,'Ambarata Sofia'),(1110,2,4,16,30,'Ambaratabe Nord'),(1111,2,4,16,30,'Ambatoria Est'),(1112,2,4,16,30,'Ambatosia'),(1113,2,4,16,30,'Ambodiadabo'),(1114,2,4,16,30,'Amodiampana'),(1115,2,4,16,30,'Ambodisikidy'),(1116,2,4,16,30,'Ambovonomby'),(1117,2,4,16,30,'Analila'),(1118,2,4,16,30,'Anjoromadosy'),(1119,2,4,16,30,'Ankazotokana'),(1120,2,4,16,30,'Antananivo Haut'),(1121,2,4,16,30,'Antsamaka'),(1122,2,4,16,30,'Beandrarezona'),(1123,2,4,16,30,'Mangidrano'),(1124,2,4,16,30,'Marotolana'),(1125,2,4,16,30,'Ambohimisondrotra'),(1126,2,4,16,30,'Antsiradava'),(1127,2,4,16,35,'Ambararata'),(1128,2,4,16,35,'Ambodimotso Sud'),(1129,2,4,16,35,'Ambolidibe Est'),(1130,2,4,16,35,'Ankarongana '),(1131,2,4,16,35,'Antsakabary'),(1132,2,4,16,35,'Antsakanalabe'),(1133,2,4,16,35,'Maroamalona'),(1134,2,4,16,35,'Matsondakana'),(1135,2,4,16,35,'Morafeno'),(1136,2,4,16,35,'Tsarahonenana'),(1137,2,4,16,35,'Tsiamalao'),(1138,2,4,16,35,'Belafona'),(1139,2,4,16,35,'Ambodimotso Haut'),(1140,2,4,16,32,'Ambodihazoambo'),(1141,2,4,16,32,'Ambohitaoka'),(1142,2,4,16,32,'Ampasimatera'),(1143,2,4,16,32,'Ankirikiry'),(1144,2,4,16,32,'Bekoratsaka'),(1145,2,4,16,32,'Betaramahamay'),(1146,2,4,16,32,'koamija'),(1147,2,4,16,32,'Malakialina'),(1148,2,4,16,32,'Agnovolava Nord'),(1149,2,4,16,31,'Ambalakirajy'),(1150,2,4,16,31,'Ambarikorano'),(1151,2,4,16,31,'Ambaripaika'),(1152,2,4,16,31,'Ambilombe'),(1153,2,4,16,31,'Amboaboa'),(1154,2,4,16,31,'Ambodiadabo'),(1155,2,4,16,31,'Ambodiamontana Kionga'),(1156,2,4,16,31,'Ambohisoa'),(1157,2,4,16,31,'Amborondolo'),(1158,2,4,16,31,'Ampatakamaroreny'),(1159,2,4,16,31,'Andohajango'),(1160,2,4,16,31,'Andratamarina'),(1161,2,4,16,31,'Anjiabe'),(1162,2,4,16,31,'Ankiabe Salohy'),(1163,2,4,16,31,'Ankiakabe Fanoko'),(1164,2,4,16,31,'Antanambaon\'Amberina'),(1165,2,4,16,31,'Antanadava'),(1166,2,4,16,31,'Antsatramidola'),(1167,2,4,16,31,'Antsiatsiaka'),(1168,2,4,16,31,'Antsirabe Centre'),(1169,2,4,16,31,'Antsoha'),(1170,2,4,16,31,'Kalandy'),(1171,2,4,16,31,'Manampaneva'),(1172,2,4,16,31,'Marotandrano'),(1173,2,4,16,31,'Pont Sofia'),(1174,2,4,16,31,'Tsarajomoka'),(1175,2,4,16,31,'Tsaratanana'),(1176,2,4,16,31,'Ambinany Fango'),(1177,2,4,16,33,'Ampanjabe'),(1178,2,4,16,33,'Ambodimahabibo'),(1179,2,4,16,33,'Ambodisakoana'),(1180,2,4,16,33,'Ambodivongo'),(1181,2,4,16,33,'Amparihy '),(1182,2,4,16,33,'Andranomeva'),(1183,2,4,16,33,'Leanja'),(1184,2,4,16,33,'Mahevaranohely'),(1185,2,4,16,33,'Marovato'),(1186,2,4,16,33,'Tsarahasina'),(1187,2,4,16,33,'Tsaratanana I'),(1188,2,4,16,33,'Tsinongia'),(1189,2,4,16,33,'Tsinjomitondraka'),(1190,2,4,16,33,'Ihobaka'),(1191,2,4,16,33,'Ambatomilahatrano'),(1192,2,4,16,33,'Andranomena I'),(1193,2,5,10,50,'Ambandrika'),(1194,2,5,10,50,'Ambatosoratra'),(1195,2,5,10,50,'Ambohitsihilaozana'),(1196,2,5,10,50,'Amaparihintsatroka'),(1197,2,5,10,50,'Ampitatsimo'),(1198,2,5,10,50,'Andilanatoby'),(1199,2,5,10,50,'Andromba'),(1200,2,5,10,50,'Antanandava'),(1201,2,5,10,50,'Antsangasanga'),(1202,2,5,10,50,'bejofo'),(1203,2,5,10,50,'Feramanga Nord'),(1204,2,5,10,50,'Ilafy'),(1205,2,5,10,50,'Imerimandroso'),(1206,2,5,10,50,'Manankambahiny Est'),(1207,2,5,10,50,'Manakambahiny Ouest'),(1208,2,5,10,50,'Soalazaina'),(1209,2,5,10,50,'Tanambao Besakay'),(1210,2,5,10,50,'Ambohidava'),(1211,2,5,10,50,'Ambohiboromanga'),(1212,2,5,10,53,'Ambatomainty'),(1213,2,5,10,53,'Amboavory'),(1214,2,5,10,53,'Ambodimanga'),(1215,2,5,10,53,'Ambohijanahary'),(1216,2,5,10,53,'Ambohimandroso I'),(1217,2,5,10,53,'Ambohitrarivo'),(1218,2,5,10,53,'Ampasikely'),(1219,2,5,10,53,'Andilana Nord'),(1220,2,5,10,53,'Andrebakely Sud'),(1221,2,5,10,53,'Andrebakely Nord'),(1222,2,5,10,53,'Anororo'),(1223,2,5,10,53,'Beanana'),(1224,2,5,10,53,'Bedidy'),(1225,2,5,10,53,'Morarano Chrome'),(1226,2,5,10,53,'Ranomainty'),(1227,2,5,10,53,'Sahamamy'),(1228,2,5,10,53,'Tanambe'),(1229,2,5,10,53,'Vohimena'),(1230,2,5,10,53,'Vohitsara'),(1231,2,5,10,53,'Andranobe'),(1232,2,5,10,53,'Ambodirano'),(1233,2,5,10,54,'Antanimenabaka'),(1234,2,5,10,54,'Bemaitso'),(1235,2,5,10,54,'Maitsokely'),(1236,2,5,10,54,'Maroadabo'),(1237,2,5,10,54,'Marovato'),(1238,2,5,10,54,'Miarinarivo'),(1239,2,5,10,54,'Tanananifololahy'),(1240,2,5,10,54,'Ampondrabe'),(1241,2,5,10,52,'Ambalaomby'),(1242,2,5,10,52,'Ambatoharanana'),(1243,2,5,10,52,'Ampandroatraka'),(1244,2,5,10,52,'Ampasimaneva'),(1245,2,5,10,52,'Antandrokomby'),(1246,2,5,10,52,'Longozabe'),(1247,2,5,10,52,'Niarovana'),(1248,2,5,10,52,'Tratramarina'),(1249,2,5,10,52,'Tsaravinany'),(1250,2,5,10,52,'Ambodimerana'),(1251,2,5,10,51,'Ambatovola'),(1252,2,5,10,51,'Amboasary'),(1253,2,5,10,51,'Ambohibary'),(1254,2,5,10,51,'Ambohidronono'),(1255,2,5,10,51,'Ampasimpotsy Gare'),(1256,2,5,10,51,'Ampasimpotsy Mandialaza'),(1257,2,5,10,51,'Andaingo'),(1258,2,5,10,51,'Andasibe'),(1259,2,5,10,51,'Anosibe Ifody'),(1260,2,5,10,51,'Antanandava'),(1261,2,5,10,51,'Antaniniditra'),(1262,2,5,10,51,'Beforona'),(1263,2,5,10,51,'Belavabary'),(1264,2,5,10,51,'Mangarivtora'),(1265,2,5,10,51,'Fieranana'),(1266,2,5,10,51,'Lakato'),(1267,2,5,10,51,'Mandialaza'),(1268,2,5,10,51,'Morarano Gare'),(1269,2,5,10,51,'Sabotsy Anjiro'),(1270,2,5,10,51,'Fodiriana'),(1271,2,5,10,51,'Bembary'),(1272,2,5,10,51,'Analasoa'),(1273,2,5,11,62,'Ambatoharanana'),(1274,2,5,11,62,'Ambodimanga II'),(1275,2,5,11,62,'Ampasimbe'),(1276,2,5,11,62,'Ampasina'),(1277,2,5,11,62,'Antsiatsiaka'),(1278,2,5,11,62,'Mahambo'),(1279,2,5,11,62,'Mahanoro'),(1280,2,5,11,62,'Miorimivalana'),(1281,2,5,11,62,'Saranambana'),(1282,2,5,11,62,'Vohilengo'),(1283,2,5,11,62,'Vohipeno'),(1284,2,5,11,62,'Ambajan\'i Sahalava'),(1285,2,5,11,62,'Betampona'),(1286,2,5,11,66,'Ambatoaranana'),(1287,2,5,11,66,'Ambodiampana'),(1288,2,5,11,66,'Ambodivoanjo'),(1289,2,5,11,66,'Andasibe'),(1290,2,5,11,66,'Antanambaobe'),(1291,2,5,11,66,'Antanambe'),(1292,2,5,11,66,'Antananivo '),(1293,2,5,11,66,'Imorona'),(1294,2,5,11,66,'Manambolosy'),(1295,2,5,11,66,'Sandrakatsy'),(1296,2,5,11,66,'Saromahona'),(1297,2,5,11,66,'Tanibe'),(1298,2,5,11,66,'Vanono'),(1299,2,5,11,66,'Analampotsy'),(1300,2,5,11,66,'Mahanoro'),(1301,2,5,11,67,'Ambanizana'),(1302,2,5,11,67,'Ampanitelo'),(1303,2,5,11,67,'Ambodimanga Rantabe'),(1304,2,5,11,67,'Anandrivola'),(1305,2,5,11,67,'Andranofotsy'),(1306,2,5,11,67,'Androndrona'),(1307,2,5,11,67,'Anjahana'),(1308,2,5,11,67,'Anjanazana'),(1309,2,5,11,67,'Ankofa'),(1310,2,5,11,67,'Ankofabe'),(1311,2,5,11,67,'Antakotako'),(1312,2,5,11,67,'Antsirabe Sahatany'),(1313,2,5,11,67,'Mahavelona'),(1314,2,5,11,67,'Manambolo'),(1315,2,5,11,67,'Morafeno'),(1316,2,5,11,67,'Rantabe'),(1317,2,5,11,67,'Voloina'),(1318,2,5,11,67,'Mariharano '),(1319,2,5,11,67,'Sahasindro'),(1320,2,5,11,64,'Ambahoambe'),(1321,2,5,11,64,'Ambodiampana'),(1322,2,5,11,64,'Andapafito'),(1323,2,5,11,64,'Antanifotsy'),(1324,2,5,11,64,'Antenina'),(1325,2,5,11,64,'Fotsialanana'),(1326,2,5,11,64,'Manompana'),(1327,2,5,11,64,'Ambinanisakana'),(1328,2,5,11,63,'Ambatoharanana'),(1329,2,5,11,63,'Ambodimangavalo'),(1330,2,5,11,63,'Ambohibe'),(1331,2,5,11,63,'Ampasimazava'),(1332,2,5,11,63,'Andasibe'),(1333,2,5,11,63,'Anjahambe'),(1334,2,5,11,63,'Maromitety'),(1335,2,5,11,63,'Miarinarivo'),(1336,2,5,11,63,'Sahatavy'),(1337,2,5,11,63,'Tanamarina'),(1338,2,5,12,60,'Antanandehibe'),(1339,2,5,12,60,'Mahela'),(1340,2,5,12,60,'Manakana'),(1341,2,5,12,60,'Saivaza'),(1342,2,5,12,60,'Manaratsandry'),(1343,2,5,12,57,'Ambalarondra'),(1344,2,5,12,57,'Andekaleka'),(1345,2,5,12,57,'Anivorano Est'),(1346,2,5,12,57,'Fetraomby'),(1347,2,5,12,57,'Razanaka'),(1348,2,5,12,57,'Vohitranivona'),(1349,2,5,12,57,'Ambinaninony'),(1350,2,5,12,57,'Ambohimanana'),(1351,2,5,12,57,'Ampasimbe'),(1352,2,5,12,57,'Andevoranto'),(1353,2,5,12,57,'Anjahamana'),(1354,2,5,12,57,'Fanasana'),(1355,2,5,12,57,'Lohariandava'),(1356,2,5,12,57,'Mahatsara'),(1357,2,5,12,57,'Maroseranana'),(1358,2,5,12,57,'Ranomafana Est'),(1359,2,5,12,57,'Antsapanana'),(1360,2,5,12,59,'Ambinanidilana'),(1361,2,5,12,59,'Ambinanindrano'),(1362,2,5,12,59,'Ambodiboanara'),(1363,2,5,12,59,'Ambodiharina'),(1364,2,5,12,59,'Ankazotsifantatra'),(1365,2,5,12,59,'Befotaka'),(1366,2,5,12,59,'Betsizaraina'),(1367,2,5,12,59,'Manjakandriana'),(1368,2,5,12,59,'Masomeloka'),(1369,2,5,12,59,'Tsaravinany'),(1370,2,5,12,59,'Andranambomaro'),(1371,2,5,12,61,'Ambodivoangy'),(1372,2,5,12,61,'Tanamabao Rabemanana'),(1373,2,5,12,61,'Ambodinonoka'),(1374,2,5,12,61,'Androarangavola'),(1375,2,5,12,61,'Ambalapaiso II'),(1376,2,5,12,61,'Ambatofisaka II'),(1377,2,5,12,61,'Amboasary'),(1378,2,5,12,61,'Ambohimilanja'),(1379,2,5,12,61,'Andondabe Sud'),(1380,2,5,12,61,'Anosiarivo'),(1381,2,5,12,61,'Betampona'),(1382,2,5,12,61,'Lohavanana'),(1383,2,5,12,61,'Sahakevo'),(1384,2,5,12,61,'Maromitety I'),(1385,2,5,12,56,'Ampisokina'),(1386,2,5,12,56,'Fito'),(1387,2,5,12,56,'Antetezamaro'),(1388,2,5,12,56,'Ambodilazana'),(1389,2,5,12,56,'Ambodiriana'),(1390,2,5,12,56,'Amdoditandroho'),(1391,2,5,12,56,'Ampasimadinika'),(1392,2,5,12,56,'Ampasimbe onibe'),(1393,2,5,12,56,'Amporoforo'),(1394,2,5,12,56,'Andondabe '),(1395,2,5,12,56,'Andranoboloha'),(1396,2,5,12,56,'Antenina'),(1397,2,5,12,56,'Fanandrana'),(1398,2,5,12,56,'Mangabe'),(1399,2,5,12,56,'Sahambala'),(1400,2,5,12,56,'Satrandrohy'),(1401,2,5,12,58,'Iamborano'),(1402,2,5,12,58,'Tsarasambo'),(1403,2,5,12,58,'Ambalabe '),(1404,2,5,12,58,'Ambalavolo'),(1405,2,5,12,58,'Amboditavolo'),(1406,2,5,12,58,'Ambodivoananto'),(1407,2,5,12,58,'Ampasimadinika'),(1408,2,5,12,58,'Ampasimazava'),(1409,2,5,12,58,'Antanambao Mahatsara'),(1410,2,5,12,58,'Ifasina I'),(1411,2,5,12,58,'Ifasina II'),(1412,2,5,12,58,'Ilaka Est'),(1413,2,5,12,58,'Maintinandry'),(1414,2,5,12,58,'Niarovana Carolline'),(1415,2,5,12,58,'Nierenana'),(1416,2,5,12,58,'Sahamatevina'),(1417,2,5,12,58,'Tanambao Vahakatrakaka'),(1418,2,5,12,58,'Tsivangiana'),(1419,2,5,12,58,'Ifasina III'),(1420,2,5,12,58,'Ambodivononoka Ranganana'),(1421,2,6,18,109,'Behara'),(1422,2,6,18,109,'Ebelo'),(1423,2,6,18,109,'Elonty'),(1424,2,6,18,109,'Esira'),(1425,2,6,18,109,'Ifotaka'),(1426,2,6,18,109,'Mahaly'),(1427,2,6,18,109,'Manevy'),(1428,2,6,18,109,'Maromby'),(1429,2,6,18,109,'Marontsiraka'),(1430,2,6,18,109,'Ranobe'),(1431,2,6,18,109,'Sampona'),(1432,2,6,18,109,'Tanandava Sud'),(1433,2,6,18,109,'Tomboarivo'),(1434,2,6,18,109,'Tranomaro'),(1435,2,6,18,109,'Tsivory'),(1436,2,6,18,109,'Mahabo'),(1437,2,6,18,109,'Beranoville'),(1438,2,6,18,110,'Ambalasoa'),(1439,2,6,18,110,'Ambatomivary'),(1440,2,6,18,110,'Analamary'),(1441,2,6,18,110,'Andriandampy'),(1442,2,6,18,110,'Beampombo I'),(1443,2,6,18,110,'Beampombo II'),(1444,2,6,18,110,'Bekoropo'),(1445,2,6,18,110,'Benato toby'),(1446,2,6,18,110,'Iaboritra'),(1447,2,6,18,110,'Ianabinda'),(1448,2,6,18,110,'Ianakafy'),(1449,2,6,18,110,'Isoanala'),(1450,2,6,18,110,'Ivahona'),(1451,2,6,18,110,'Tsangano'),(1452,2,6,18,110,'Mahabo'),(1453,2,6,18,110,'Mahasoa Est'),(1454,2,6,18,110,'Nanarena besakoa'),(1455,2,6,18,110,'Naninora'),(1456,2,6,18,110,'Sakamahily'),(1457,2,6,18,110,'Tsaraitso'),(1458,2,6,18,110,'Kelivao'),(1459,2,6,18,108,'Ambatoabo'),(1460,2,6,18,108,'Ampasimena'),(1461,2,6,18,108,'Analamary'),(1462,2,6,18,108,'Analampatsy'),(1463,2,6,18,108,'Andranobory'),(1464,2,6,18,108,'Ankaramena'),(1465,2,6,18,108,'Ankariera'),(1466,2,6,18,108,'Bevoay'),(1467,2,6,18,108,'Emagnobo'),(1468,2,6,18,108,'Enakara Haut'),(1469,2,6,18,108,'Enaniliha'),(1470,2,6,18,108,'Fenoevo Efita'),(1471,2,6,18,108,'Iaboakoho'),(1472,2,6,18,108,'Ifarantsa'),(1473,2,6,18,108,'Isaka Ivondro'),(1474,2,6,18,108,'Mahatalaky'),(1475,2,6,18,108,'Manambaro'),(1476,2,6,18,108,'Manantenina'),(1477,2,6,18,108,'Mandiso'),(1478,2,6,18,108,'Ranomafana sud'),(1479,2,6,18,108,'Ranopiso'),(1480,2,6,18,108,'Salisambo'),(1481,2,6,18,108,'Soavary'),(1482,2,6,18,108,'Ankilevalo'),(1483,2,6,18,108,'Tanandava Mandrare'),(1484,2,6,17,104,'Ambanisarika'),(1485,2,6,17,104,'Ambazoa'),(1486,2,6,17,104,'Ambohimalaza'),(1487,2,6,17,104,'Ambohinaivo'),(1488,2,6,17,104,'Ambondro'),(1489,2,6,17,104,'Ampamanta'),(1490,2,6,17,104,'Analamary'),(1491,2,6,17,104,'Andalatanosy'),(1492,2,6,17,104,'Anjeky Ankilikira'),(1493,2,6,17,104,'Antanimora sud'),(1494,2,6,17,104,'Erada'),(1495,2,6,17,104,'Imanompo'),(1496,2,6,17,104,'Jafaro'),(1497,2,6,17,104,'Maroalomainte'),(1498,2,6,17,104,'Maroalopoty'),(1499,2,6,17,104,'Marovato befeno'),(1500,2,6,17,104,'Sianamaro'),(1501,2,6,17,104,'Tsimanada'),(1502,2,6,17,104,'Andragnanivo'),(1503,2,6,17,104,'Andoharano'),(1504,2,6,17,105,'Ambahita'),(1505,2,6,17,105,'Ambatosola'),(1506,2,6,17,105,'Anivorano mitsinjo'),(1507,2,6,17,105,'Anja Nord'),(1508,2,6,17,105,'Ankaranabo nord'),(1509,2,6,17,105,'Antsakoamaro'),(1510,2,6,17,105,'Bekitro'),(1511,2,6,17,105,'Belindo mahasoa'),(1512,2,6,17,105,'Beraketa'),(1513,2,6,17,105,'Besakoa'),(1514,2,6,17,105,'Beteza'),(1515,2,6,17,105,'Bevidiky'),(1516,2,6,17,105,'Manakompy'),(1517,2,6,17,105,'Maroviro'),(1518,2,6,17,105,'Tanandava'),(1519,2,6,17,105,'Tsikolaky'),(1520,2,6,17,105,'Tsirandragny'),(1521,2,6,17,105,'Vohimanga'),(1522,2,6,17,106,'Mikaikarivo ambatomainty'),(1523,2,6,17,106,'Beabobo'),(1524,2,6,17,106,'Kopoky'),(1525,2,6,17,106,'Marolinta'),(1526,2,6,17,106,'Tranoroa'),(1527,2,6,17,106,'Tranovaho'),(1528,2,6,17,106,'Ambatotsivala'),(1529,2,6,17,106,'Mahaenegne'),(1530,2,6,17,107,'Anjapaly'),(1531,2,6,17,107,'Antaritarika'),(1532,2,6,17,107,'Faux Cap'),(1533,2,6,17,107,'Imongy'),(1534,2,6,17,107,'Marovato'),(1535,2,6,17,107,'Nikoly'),(1536,2,6,17,107,'Ankilivalo'),(1537,2,6,17,107,'Behazomanga'),(1538,2,6,19,102,'Ankilizato'),(1539,2,6,19,102,'Androka'),(1540,2,6,19,102,'Amboropotsy'),(1541,2,6,19,102,'Ankiliabo'),(1542,2,6,19,102,'Ankilimivory'),(1543,2,6,19,102,'Antaly'),(1544,2,6,19,102,'Beahitse'),(1545,2,6,19,102,'Belafike haut'),(1546,2,6,19,102,'Berohy Sud'),(1547,2,6,19,102,'Fotandrevo'),(1548,2,6,19,102,'Gogogogo'),(1549,2,6,19,102,'Itampolo'),(1550,2,6,19,102,'Maniry'),(1551,2,6,19,102,'Vohitany'),(1552,2,6,19,102,'Androhimpana'),(1553,2,6,19,102,'Beara'),(1554,2,6,19,102,'Agnavoha'),(1555,2,6,19,99,'Berenty'),(1556,2,6,19,99,'Andranomafana'),(1557,2,6,19,99,'Fotivolo'),(1558,2,6,19,99,'Ilemby'),(1559,2,6,19,99,'Tandrano'),(1560,2,6,19,99,'Ankeriky'),(1561,2,6,19,99,'Ankilivalokely'),(1562,2,6,19,99,'Ambatolahy'),(1563,2,6,19,103,'Ihanamperana'),(1564,2,6,19,103,'Ambalavato'),(1565,2,6,19,103,'Ehara'),(1566,2,6,19,103,'Benonoky'),(1567,2,6,19,103,'Ankilimary'),(1568,2,6,19,100,'Behisatse'),(1569,2,6,19,100,'Bemavo'),(1570,2,6,19,100,'Fanjakana'),(1571,2,6,19,100,'Mandronarivo'),(1572,2,6,19,100,'Marerano'),(1573,2,6,19,100,'Sakena'),(1574,2,6,19,100,'Tanamary'),(1575,2,6,19,100,'Tanandava'),(1576,2,6,19,101,'Ambatry'),(1577,2,6,19,101,'Andranomangatsiaka'),(1578,2,6,19,101,'Ankazomanga Ouest'),(1579,2,6,19,101,'Ankazomalala'),(1580,2,6,19,101,'Ankilivato'),(1581,2,6,19,101,'Antohabato'),(1582,2,6,19,101,'Antsavoha'),(1583,2,6,19,101,'Beantake'),(1584,2,6,19,101,'Belamoty'),(1585,2,6,19,101,'Besely'),(1586,2,6,19,101,'Bezaha'),(1587,2,6,19,101,'Fenoandala'),(1588,2,6,19,101,'Lazarivo'),(1589,2,6,19,101,'Manalobe'),(1590,2,6,19,101,'Maroarivo'),(1591,2,6,19,101,'Marosavoa'),(1592,2,6,19,101,'Masiaboay'),(1593,2,6,19,101,'Montifeno'),(1594,2,6,19,101,'Sakamasay'),(1595,2,6,19,101,'Salobe'),(1596,2,6,19,101,'Soamanonga'),(1597,2,6,19,101,'Soaserana'),(1598,2,6,19,101,'Tanambao Haut'),(1599,2,6,19,101,'Temeantsoa'),(1600,2,6,19,101,'Tongobory'),(1601,2,6,19,101,'Vatolatsake'),(1602,2,6,19,101,'Vohimary'),(1603,2,6,19,101,'Savazy II'),(1604,2,6,19,101,'Beora'),(1605,2,6,19,97,'Befandrefa'),(1606,2,6,19,97,'Befandriana sud'),(1607,2,6,19,97,'Ambahikily'),(1608,2,6,19,97,'Antanimieva'),(1609,2,6,19,97,'Antongo vaovao'),(1610,2,6,19,97,'Basibasy'),(1611,2,6,19,97,'Tanandava Station'),(1612,2,6,19,97,'Ankatsakantsa sud'),(1613,2,6,19,98,'Ambinany'),(1614,2,6,19,98,'Amboronabo'),(1615,2,6,19,98,'Andamasigny vineta'),(1616,2,6,19,98,'Andranolava'),(1617,2,6,19,98,'Beraketa'),(1618,2,6,19,98,'Mhaboboka'),(1619,2,6,19,98,'Mihary lamatihy'),(1620,2,6,19,98,'Mihary teheza'),(1621,2,6,19,98,'Mihavatsy'),(1622,2,6,19,98,'Mikoboka'),(1623,2,6,19,98,'Mitsinjo'),(1624,2,6,19,96,'Milenaka'),(1625,2,6,19,96,'Ambohimahavelona'),(1626,2,6,19,96,'Ambolofoty'),(1627,2,6,19,96,'Anakao'),(1628,2,6,19,96,'Analamisampy'),(1629,2,6,19,96,'Andranohinaly'),(1630,2,6,19,96,'Andranovory'),(1631,2,6,19,96,'Ankilimalinika'),(1632,2,6,19,96,'Antanimena'),(1633,2,6,19,96,'Beheloka'),(1634,2,6,19,96,'Behompy'),(1635,2,6,19,96,'Belalanda'),(1636,2,6,19,96,'Betsinjaka'),(1637,2,6,19,96,'Manombo Sud'),(1638,2,6,19,96,'Manoro fify'),(1639,2,6,19,96,'Marofoty'),(1640,2,6,19,96,'Maromiandra'),(1641,2,6,19,96,'Mihary'),(1642,2,6,19,96,'Sainte Augustin'),(1643,2,6,19,96,'Soafara sud'),(1644,2,6,19,96,'Tsianisia'),(1645,2,6,19,96,'Efoetse'),(1646,2,6,19,96,'Soahazo'),(1647,2,6,20,93,'Tsifota'),(1648,2,6,20,93,'Hambiky'),(1649,2,6,20,93,'Hamboalimena '),(1650,2,6,20,93,'Andimaky Manambolo'),(1651,2,6,20,93,'Antsoha'),(1652,2,6,20,93,'Belita'),(1653,2,6,20,93,'Bemarivo ankirondro'),(1654,2,6,20,93,'Berivo'),(1655,2,6,20,93,'Beroboko Nord'),(1656,2,6,20,93,'Masoarivo'),(1657,2,6,20,93,'Tsaraotana'),(1658,2,6,20,93,'Tsimafana'),(1659,2,6,20,93,'Delta'),(1660,2,6,20,92,'Ambia'),(1661,2,6,20,92,'Ampanihy'),(1662,2,6,20,92,'Analamitsivala'),(1663,2,6,20,92,'Ankilivalo'),(1664,2,6,20,92,'Ankilizato'),(1665,2,6,20,92,'Befotaka'),(1666,2,6,20,92,'Beronono'),(1667,2,6,20,92,'Malaimbandy'),(1668,2,6,20,92,'Mandabe'),(1669,2,6,20,92,'Tsimazava'),(1670,2,6,20,92,'Bezezika'),(1671,2,6,20,91,'Andranopasy'),(1672,2,6,20,91,'Ankiliabo'),(1673,2,6,20,91,'Anotsibe centre'),(1674,2,6,20,91,'Bearona'),(1675,2,6,20,91,'Soaserana'),(1676,2,6,20,91,'Betsioky'),(1677,2,6,20,112,'Ambatolahy'),(1678,2,6,20,112,'Ampanihy'),(1679,2,6,20,112,'Ankavandra'),(1680,2,6,20,112,'Akondromena'),(1681,2,6,20,112,'Hankorofotsy'),(1682,2,6,20,112,'Anosimena'),(1683,2,6,20,112,'Bemahatazana'),(1684,2,6,20,112,'Betsipolitra'),(1685,2,6,20,112,'Dabolava'),(1686,2,6,20,112,'Isalo'),(1687,2,6,20,112,'Itondy'),(1688,2,6,20,112,'Manambina'),(1689,2,6,20,112,'Manandaza'),(1690,2,6,20,112,'Soaloka'),(1691,2,6,20,112,'Andranomainty'),(1692,2,6,20,90,'Analaiva'),(1693,2,6,20,90,'Befasy'),(1694,2,6,20,90,'Belo sur Mer'),(1695,2,6,20,90,'Bemanonga');
/*!40000 ALTER TABLE `cnfi_commune` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_contact`
--

DROP TABLE IF EXISTS `cnfi_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_type` int(11) DEFAULT NULL,
  `contact_entiteId` int(11) DEFAULT NULL,
  `contact_login` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `contact_password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `contact_civilite` varchar(255) DEFAULT NULL,
  `contact_nom` text NOT NULL,
  `contact_prenom` text,
  `contact_fonction` text,
  `contact_telephone` text,
  `contact_mail` text,
  PRIMARY KEY (`contact_id`),
  KEY `FK_cnfi_contact` (`contact_entiteId`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_contact`
--

LOCK TABLES `cnfi_contact` WRITE;
/*!40000 ALTER TABLE `cnfi_contact` DISABLE KEYS */;
INSERT INTO `cnfi_contact` VALUES (1,2,1,'acep!b8ouPx1','î¦Óæí™:ÓË¨ÒÄ\n','1','Test',NULL,'Test','222 22 222 22','Test@test.mg'),(2,2,2,'apem!nmZsis','îÀnçq:ý¨>¦Ä','2','RAVELOARISOA Mamy Hasina',NULL,'Assistante Opérationnelle','033 31 623 44','ravemamihasina@gmail.com'),(3,2,3,'cefor!q4CURr','IÛât?·°',NULL,'',NULL,NULL,NULL,NULL),(4,2,4,'cem!Y8V9ET','–$¬UËåì[ë',NULL,'',NULL,NULL,NULL,NULL),(5,2,5,'eam!i6DYKF','/u¶µá7{',NULL,'',NULL,NULL,NULL,NULL),(6,2,6,'fivoy!L539ua','B,åYwnïZ6',NULL,'',NULL,NULL,NULL,NULL),(7,2,7,'hardi-finance!TMdfoC','Áð8°{c£qSúà„qùþH†ÍË_þ”‰â','2','ANDRY Maholy',NULL,'d','034 18 541 77','andrymaholy.hardifinance@gmail.com'),(8,2,8,'madacredito!qCCehp','\0Ö¤¬‰}¯bˆ‚',NULL,'',NULL,NULL,NULL,NULL),(9,2,9,'mampita!HN4Ib9','€éUàQâ»:z*>ã','2','RAJAONARISON Mbolaniaina',NULL,'Responsable d’Administration','033 37 149 47','mampita.log@gmail.com'),(10,2,10,'mutua!As7cWW','Fb\ZmFb—ÜT',NULL,'',NULL,NULL,NULL,NULL),(11,2,11,'odrd!Y3VFrg','ÊÉ\'ü<Õ|›Æ',NULL,'',NULL,NULL,NULL,NULL),(12,2,12,'vahatra!yeFHPO','ƒÃÿ\'$¾W§¾Ç°·.Njí]c','2','RAZAFINDRABE Mbolatiana',NULL,'COMPTABLE','033 86 355 42','vahatracompta@gmail.com'),(13,2,13,'ordimic!WSaaPc','Xj ˆƒ¬<í¦',NULL,'',NULL,NULL,NULL,NULL),(14,2,14,'otiv!lxNROr','åÌ±¼yâ\"Œ',NULL,'',NULL,NULL,NULL,NULL),(15,2,15,'otiv!jCZtRK','ÿ¯‚Lx8‚,ç',NULL,'',NULL,NULL,NULL,NULL),(16,2,16,'otiv!nqfu37','/^¹óÔk4ŸN',NULL,'',NULL,NULL,NULL,NULL),(17,2,17,'otiv!FbdZxs','m	DžÉ)6®]^‡î/ H','2','SOLOMANJARY myriame Tombozandry',NULL,'Responsable Financier','034 05 213 16','fin.union@otivdiana.mg'),(18,2,18,'otiv!uHU5ky','g™¶ƒ˜èƒozÏ¾?AÅ','1','TSILANIZARA Marcellin',NULL,'Responsable Exploitation','032 07 146 11','dir@otivsava.mg'),(19,2,19,'otiv!PPlG7q','ï}_tKÿOÞ',NULL,'',NULL,NULL,NULL,NULL),(20,2,20,'pamf!KGPTvd','Ûüš‡SÚM«',NULL,'',NULL,NULL,NULL,NULL),(21,2,21,'papm!xEROzL','qO¨šL`\Z«B÷',NULL,'',NULL,NULL,NULL,NULL),(22,2,22,'tiavo!oklgii','ÊÉ»;O†?8',NULL,'',NULL,NULL,NULL,NULL),(23,2,23,'titem!rCJxrL','ä£¹þ<i­Of<',NULL,'',NULL,NULL,NULL,NULL),(24,2,24,'unicecam!3K9ziL','˜|<ÆÁö`þ',NULL,'',NULL,NULL,NULL,NULL),(25,2,25,'vatsy!n9B5Mt','J_óÂuÌ^Ô',NULL,'',NULL,NULL,NULL,NULL),(26,2,26,'vola!APjntA','ÁÐx•q%¾','1','Andriamarosolo Romuald',NULL,'Directeur National','034 14 224 05','romuald.andriamarosolo@volamahasoa.sa'),(27,2,27,'accesbanque!KdqKIh','…s5HK7_Ç¢O',NULL,'',NULL,NULL,NULL,NULL),(28,2,28,'bank!T9mP3m','ºEùAjO¬ýx—',NULL,'',NULL,NULL,NULL,NULL),(29,2,29,'societe!YKuEMi',' é­·MÈô',NULL,'',NULL,NULL,NULL,NULL),(30,2,30,'bgfibank!OBNv05','J¬ðG’lþ™',NULL,'',NULL,NULL,NULL,NULL),(31,2,31,'bm!Ov8oq4','ÿÈìkûxj2',NULL,'',NULL,NULL,NULL,NULL),(32,2,32,'bmoi!Jsb9oF','ýÉy!‘?›á~È',NULL,'',NULL,NULL,NULL,NULL),(33,2,33,'bni!ntyrXt','\0myv»„ÒúÁ',NULL,'',NULL,NULL,NULL,NULL),(34,2,34,'mcb!WD5JfB','Cx?5µ4kA‹',NULL,'',NULL,NULL,NULL,NULL),(35,2,35,'baobab!t490yp','Ô†GJ¦ ‡\ZÄ\0',NULL,'',NULL,NULL,NULL,NULL),(36,2,36,'sbm!vDgB6q','eº\rr;—ÃN',NULL,'',NULL,NULL,NULL,NULL),(37,2,37,'sipem!QcroYP','­®9t¹zæ!Ñ\n',NULL,'',NULL,NULL,NULL,NULL),(38,2,38,'aro!8kuidK','\ZãÅ±vã,%G”',NULL,'',NULL,NULL,NULL,NULL),(39,2,39,'ny!P64mK9','¾¢&uûñ#',NULL,'',NULL,NULL,NULL,NULL),(40,2,40,'mama!UQhv47','¡ƒ_}fU©Ð€',NULL,'',NULL,NULL,NULL,NULL),(41,2,41,'allianz!u2Yz7m','ºÖúw­Àçd”',NULL,'',NULL,NULL,NULL,NULL),(42,2,42,'saham!i6rLHp','5ÿÉ«¢Íb',NULL,'',NULL,NULL,NULL,NULL),(43,2,43,'paoma!LAtapi','C†Xþ§`‘Øâ',NULL,'',NULL,NULL,NULL,NULL),(44,2,44,'cnaps!rCON4I','Ñ\"|‹ˆÁªx\Z',NULL,'',NULL,NULL,NULL,NULL),(45,2,45,'airtel!73PGMX','qù÷JMÐêÊg6',NULL,'',NULL,NULL,NULL,NULL),(46,2,46,'orange!oSN3b6','2)6¼8ÖÕ¹Ï',NULL,'',NULL,NULL,NULL,NULL),(47,2,47,'telma!P4JHV7','Ê(•a-\'íYy',NULL,'',NULL,NULL,NULL,NULL),(48,2,1,'tojo111','Á0AOØ´8Û¨',NULL,'Test',NULL,'Test','333 33 333 33','test@test.fr'),(49,2,48,'infra!P4JHV7','?\"|????x\Z',NULL,'',NULL,NULL,NULL,NULL),(96,2,49,'ifra!P4JHV7','BÕ	o04^',NULL,'',NULL,NULL,NULL,NULL),(97,1,12,NULL,NULL,'1','VAHATRINIAINA Julio',NULL,'DIRECTEUR','033 14 948 47','vahatr@gmail.mg'),(98,1,9,NULL,NULL,'2','RAVAOMANANJARA Mina Florence',NULL,'Directrice','033 37 149 51','mampita.directeur@gmail.com'),(99,1,17,NULL,NULL,'1','YOUSSOUF Mahamoud',NULL,'Directeur du Réseau','034 05 213 02','dr.union@otivdiana.mg'),(100,1,7,NULL,NULL,'1','RAKOTOMALALA Niaina Louis Eric Tiana',NULL,'D','034 06 654 32','tianarakotomalala.hardifinance@gmail.com'),(101,1,2,NULL,NULL,'2','RASONARIVO Rihatiana Harson',NULL,'Directeur General','033 31 623 30','apem.paiq@moov.mg'),(102,1,26,NULL,NULL,'1','Andriamarosolo Romuald',NULL,'Directeur National','034 14 224 05','romuald.andriamarosolo@volamahasoa.sa'),(103,1,18,NULL,NULL,'2','MAMPIHAO Antonine Lucette',NULL,'Directeur du Réseau','032 07 146 11','dir@otivsava.mg');
/*!40000 ALTER TABLE `cnfi_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_district`
--

DROP TABLE IF EXISTS `cnfi_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_district` (
  `district_id` double DEFAULT NULL,
  `district_libelle` varchar(765) DEFAULT NULL,
  `district_regionId` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_district`
--

LOCK TABLES `cnfi_district` WRITE;
/*!40000 ALTER TABLE `cnfi_district` DISABLE KEYS */;
INSERT INTO `cnfi_district` VALUES (1,'Antsiranana I',21),(2,'Antsiranana II',21),(3,'Ambilobe',21),(4,'Ambanja',21),(5,'Nosy BE',21),(6,'Sambava',22),(7,'Vohémar',22),(8,'Antalaha',22),(9,'Andapa',22),(10,'Miarinarivo',3),(11,'Soavinandriana',3),(12,'Arivonimamo',3),(13,'Antananarivo Renivohitra',1),(14,'Antananarivo Atsimondrano',1),(15,'Antananarivo Avaradrano',1),(16,'Ambohidratrimo',1),(17,'Ankazobe',1),(18,'Andramasina',1),(19,'Manjakandriana',1),(20,'Anjozorobe',1),(21,'Antsirabe I',4),(22,'Antsirabe II',4),(23,'Ambatolampy',4),(24,'Betafo',4),(25,'antanifotsy',4),(26,'Faratsiho',4),(27,'Tsiroanomandidy',2),(28,'Fenoarivo Be',2),(29,'Antsohihy',16),(30,'Bealanana',16),(31,'Mandritsara',16),(32,'Mampikony',16),(33,'Port Bergé',16),(34,'Analalava',16),(35,'Befandriana Nord',16),(36,'Mahajanga I',14),(37,'Mahajanga II ',14),(38,'Mitsinjo',14),(39,'Soalala',14),(40,'Ambato Boeny',14),(41,'Marovoay',14),(42,'Maevatanana',13),(43,'Kandreho',13),(44,'Tsaratanana',13),(45,'Maintirano',15),(46,'Antsalova',15),(47,'Morafeno Be',8),(48,'Besalampy',15),(49,'Ambatomainty',15),(50,'Ambatondrazaka',10),(51,'Moramanga',10),(52,'Anosibe An\'ala',10),(53,'Amparafaravola',10),(54,'Andilamena',10),(55,'Toamasina I',12),(56,'Toamasina II',12),(57,'Brickaville',12),(58,'Vatomandry',12),(59,'Mahanoro',12),(60,'Antanambao Manampotsy',12),(61,'Marolambo',12),(62,'Fénérive Est',11),(63,'Vavatenina',11),(64,'Soanierana Ivongo',11),(65,'Sainte Marie',11),(66,'Mananara',11),(67,'Maroantsetra',11),(68,'Ambositra',5),(69,'Manandriana',5),(70,'Ambatofinandrahana',5),(71,'Fandriana',5),(72,'Fianarantsoa I',7),(73,'Fianarantsoa II',7),(74,'Ambalavao',7),(75,'Ambohimahasoa',7),(76,'Ikalamavony',7),(77,'Manakara ',8),(78,'Vohipeno',8),(79,'Mananjary',8),(80,'Nosy Varika',8),(81,'Ikongo',8),(82,'Ifanadiana',8),(83,'Farafangana',6),(84,'vondrozo',6),(85,'Befotaka',6),(86,'Midongy Atsimo',6),(87,'Ihosy',9),(88,'Ivohibe',9),(89,'Iakora',9),(90,'Morondava',20),(91,'Manja',20),(92,'Mahabo',20),(93,'Belo Tsiribihina',20),(94,'Maindrivazo',20),(95,'Toliara I',19),(96,'Toliara II',19),(97,'Morombe',19),(98,'Sakaraha',19),(99,'Ankazoabo',19),(100,'Beroroha',19),(101,'Betioky',19),(102,'Ampanihy',19),(103,'Benenitra',19),(104,'Ambovombe Androy',17),(105,'Bekily',17),(106,'Beloha',17),(107,'Tsihombe',17),(108,'Taolagnaro',18),(109,'Amboasary Atsimo',18),(110,'Betroka',18),(111,'Vangaindrano',6),(112,'Miandrivazo',20),(113,'Mandoto',4),(114,'Lalangina',7),(115,'Isandra',7),(116,'Vohibato',7);
/*!40000 ALTER TABLE `cnfi_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_eme`
--

DROP TABLE IF EXISTS `cnfi_eme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_eme` (
  `eme_id` int(11) NOT NULL AUTO_INCREMENT,
  `eme_produitId` int(11) DEFAULT NULL,
  `eme_typeServiceExistantId` varchar(255) DEFAULT NULL,
  `eme_denommination` text,
  `eme_souscriptionRequise` int(11) DEFAULT NULL,
  `eme_versementInitiale` double DEFAULT NULL,
  `eme_montantMinimale` double DEFAULT NULL,
  `eme_application` text,
  `eme_cible` text,
  `eme_tarificationParTransaction` double DEFAULT NULL,
  `eme_tarificationFraisProportionnel` double DEFAULT NULL,
  `eme_documents` text,
  `eme_typeTransactions` int(11) DEFAULT NULL,
  `eme_nbrTransactionsParPeriode` int(11) DEFAULT NULL,
  `eme_montantTotalTransaction` int(11) DEFAULT NULL,
  PRIMARY KEY (`eme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_eme`
--

LOCK TABLES `cnfi_eme` WRITE;
/*!40000 ALTER TABLE `cnfi_eme` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_eme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_emeactivite`
--

DROP TABLE IF EXISTS `cnfi_emeactivite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_emeactivite` (
  `emeActivite_id` int(11) NOT NULL AUTO_INCREMENT,
  `emeActivite_produitId` int(11) DEFAULT NULL,
  `emeActivite_typeTransactions` int(11) DEFAULT NULL,
  `emeActivite_nbrTransactionsParPeriode` int(11) DEFAULT NULL,
  `emeActivite_montantTotalTransaction` double DEFAULT NULL,
  PRIMARY KEY (`emeActivite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_emeactivite`
--

LOCK TABLES `cnfi_emeactivite` WRITE;
/*!40000 ALTER TABLE `cnfi_emeactivite` DISABLE KEYS */;
INSERT INTO `cnfi_emeactivite` VALUES (1,1,3,5,9),(2,1,5,9,12);
/*!40000 ALTER TABLE `cnfi_emeactivite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_encoursactivite`
--

DROP TABLE IF EXISTS `cnfi_encoursactivite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_encoursactivite` (
  `encoursActivite_id` int(11) NOT NULL AUTO_INCREMENT,
  `encoursActivite_type` int(11) DEFAULT NULL,
  `encoursActivite_produitId` int(11) DEFAULT NULL,
  `encoursActivite_regionId` int(11) DEFAULT NULL,
  `encoursActivite_typeCreditId` int(11) DEFAULT NULL,
  `encoursActivite_nombre` int(11) DEFAULT NULL,
  `encoursActivite_montant` double DEFAULT NULL,
  PRIMARY KEY (`encoursActivite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_encoursactivite`
--

LOCK TABLES `cnfi_encoursactivite` WRITE;
/*!40000 ALTER TABLE `cnfi_encoursactivite` DISABLE KEYS */;
INSERT INTO `cnfi_encoursactivite` VALUES (38,1,3,1,1,16,6104683),(39,1,3,1,2,44,16246744),(40,1,3,1,3,0,0),(41,1,3,1,4,197,77143146),(42,1,3,1,5,0,0),(43,1,3,1,6,0,0),(44,1,3,1,7,246,120424523),(45,1,3,1,8,7,2764756),(46,1,3,1,9,24,7229406),(47,1,3,0,0,0,0),(48,2,3,1,1,0,0),(49,2,3,1,2,534,229913258),(50,3,3,1,1,80,34711048),(52,3,3,1,2,454,195202209),(172,1,5,0,0,0,0),(173,2,5,0,0,0,0),(174,3,5,0,0,0,0),(186,1,6,14,4,746,135033120),(187,2,6,0,0,0,0),(188,3,6,14,1,124,20962440),(189,3,6,14,2,622,114070680),(190,1,7,1,1,12,30764842),(191,1,7,1,2,42,11729252.35),(192,1,7,1,4,162,59929676),(193,1,7,1,6,3,815900),(194,1,7,1,8,2,950000),(195,1,7,1,9,19,5142906),(196,1,7,1,7,246,113433371),(197,2,7,1,2,486,195077589),(198,3,7,1,1,70,28409966.85),(199,3,7,1,2,416,166667622.21),(274,1,8,4,1,9238,3158520404),(275,1,8,4,2,505,146620520),(276,1,8,4,4,2887,947024794),(277,1,8,4,9,722,141072010),(278,1,8,3,1,1441,455595400),(279,1,8,3,2,102,19488030),(280,1,8,3,4,560,148218350),(281,1,8,3,9,130,20362130),(282,1,8,5,1,213,66869790),(283,1,8,5,2,1,103680),(284,1,8,5,4,17,3077050),(285,1,8,5,9,1,200000),(286,2,8,4,2,13352,4393237728),(287,3,8,4,2,8876,2988921188),(300,2,8,3,2,2233,643663910),(301,2,8,5,2,232,70250520),(311,1,10,4,1,9365,3242182610),(312,1,10,4,2,465,130815540),(313,1,10,4,4,2948,1033981074),(314,1,10,4,9,672,105892610),(315,1,10,3,1,1505,465534710),(316,1,10,3,4,597,166747580),(317,1,10,3,2,63,9751200),(318,1,10,3,9,108,11502020),(319,1,10,5,1,208,62673960),(320,1,10,5,2,1,31440),(321,1,10,5,4,13,4180770),(322,1,10,5,9,1,154680),(323,2,10,4,2,13450,4512871834),(324,2,10,3,2,2273,653535510),(325,2,10,5,2,223,67040850),(326,3,10,4,2,8944,3078350079),(327,1,11,21,1,266,514983915),(328,2,11,21,1,650,3377047085),(329,3,11,21,1,3051,3571880000),(405,1,12,1,4,531,107824225),(406,2,12,1,2,531,107824225),(407,3,12,1,1,105,426),(408,3,12,1,2,426,65665475),(412,1,13,1,1,109,81542492),(413,2,13,1,2,1,994972545),(414,3,13,1,1,363,342342171),(466,1,13,1,2,40,39166549),(467,1,13,1,4,628,430849370),(468,1,13,1,5,33,58644229),(469,1,13,1,6,40,47111840),(470,1,13,1,7,124,166942843),(471,1,13,1,8,219,170715222),(472,1,13,3,1,11,6013795),(473,1,13,3,2,24,13974926),(474,1,13,3,4,106,63497846),(475,1,13,3,5,3,3558332),(476,1,13,3,6,3,2230831),(477,1,13,3,7,1,666668),(478,1,13,3,8,4,3075002),(479,2,13,3,2,152,93017400),(480,3,13,1,2,830,652630374),(481,3,13,3,1,38,20853765),(482,3,13,3,2,114,72163635),(486,1,14,0,0,0,0),(487,2,14,0,0,0,0),(488,3,14,0,0,0,0),(595,1,15,4,1,8694,2959344985),(596,1,15,4,2,435,124426770),(597,1,15,4,4,2792,942500826),(598,1,15,4,9,547,65713360),(599,1,15,3,1,1284,432385870),(600,1,15,3,2,40,8963960),(601,1,15,3,4,611,178958530),(602,1,15,3,9,64,4824060),(603,1,15,5,1,173,49662957),(604,1,15,5,4,13,3792770),(605,1,15,5,9,1,118520),(606,2,15,4,2,12468,4091985941),(607,2,15,3,2,1999,625132420),(608,2,15,3,2,187,53574247),(609,3,15,4,1,4176,1332033642),(610,3,15,4,2,8292,2759952299),(611,3,15,3,1,395,129335100),(612,3,15,3,2,1604,495797320),(613,3,15,5,1,98,27236347),(614,3,15,5,2,89,26337900),(621,1,16,4,1,110,165557544),(622,1,16,4,9,30,5488501),(623,2,16,4,2,1,150000),(624,3,16,0,0,0,0),(654,1,17,4,1,1033,165557544),(655,1,17,4,9,7,5488501),(656,2,17,4,2,1040,171046045),(657,3,17,4,1,472,77798879),(658,3,17,4,2,564,91621166),(667,1,18,4,1,268,254959650),(668,1,18,4,9,51,8961483),(669,2,18,4,2,319,263921133),(670,3,18,0,0,0,0),(745,1,11,21,4,5310,13871939351),(746,1,11,21,5,544,6020612295),(747,1,11,21,6,115,571991512),(748,1,11,21,7,1196,9335914428),(749,1,11,21,8,1814,2800927066),(750,1,11,16,1,14,14839389),(751,1,11,16,4,54,204762185),(752,1,11,16,6,3,36592955),(753,1,11,16,7,14,75771768),(754,1,11,16,8,4,3268622),(755,2,11,21,2,8595,29739321481.21),(756,2,11,16,1,2,4828253),(757,2,11,16,2,87,330406666),(758,3,11,21,2,1869,6844096000),(759,3,11,16,1,19,70800000),(760,3,11,16,2,10,13100000),(767,1,21,19,1,3490,578661775),(768,2,21,19,2,6868,1741199516),(769,3,21,19,1,1894,596005857),(1074,1,21,19,4,3246,934699524),(1075,1,21,19,5,74,113919108),(1076,1,21,19,7,14,22783822),(1077,1,21,19,9,44,91135287),(1078,1,21,7,1,3,1102358568),(1079,1,21,7,4,1,244497071),(1080,1,21,8,1,661,65624150),(1081,1,21,8,4,283,31133120),(1082,1,21,5,1,668,81031485),(1083,1,21,5,4,149,14948469),(1084,1,21,13,1,883,435142400),(1085,1,21,13,4,1032,188569571),(1086,1,21,13,5,6,10320200),(1087,1,21,13,7,1,834600),(1088,1,21,13,9,12,7217500),(1089,1,21,14,1,720,429453141),(1090,1,21,14,4,227,46203750),(1091,1,21,14,5,0,1799000),(1092,1,21,14,9,6,209850),(1093,1,21,12,1,355,352456235),(1094,1,21,12,4,2500,459414023),(1095,1,21,2,1,376,160370450),(1096,1,21,2,4,22,5900000),(1097,2,21,7,2,5083,1346855639),(1098,2,21,8,2,944,96757270),(1099,2,21,5,2,817,95979954),(1100,2,21,14,2,1934,642084271),(1101,2,21,12,2,2855,811870258),(1102,2,21,2,2,398,166270450),(1127,1,22,0,0,0,0),(1128,2,22,0,0,0,0),(1129,3,22,0,0,0,0),(1130,1,23,10,1,15,45396000),(1131,2,23,0,0,0,0),(1132,3,23,0,0,0,0),(1157,1,23,10,2,15,53000000),(1158,1,23,10,3,3,963000),(1159,1,23,10,4,101,561123000),(1160,1,23,10,5,26,707204000),(1161,1,23,10,6,96,261841000),(1162,1,23,10,9,74,395113000),(1163,1,23,1,1,87,489136000),(1164,1,23,1,2,139,939525),(1165,1,23,1,3,55,2694445000),(1166,1,23,1,4,1089,9105145000),(1167,1,23,1,5,547,9906021000),(1168,1,23,1,6,653,5567452),(1169,1,23,1,9,674,3859986),(1170,1,23,12,0,0,0),(1171,1,23,0,0,0,0),(1172,1,23,0,0,0,0),(1173,1,24,0,0,0,0),(1174,2,24,0,0,0,0),(1175,3,24,0,0,0,0),(1176,1,25,0,0,0,0),(1177,2,25,0,0,0,0),(1178,3,25,0,0,0,0),(1179,1,26,0,0,0,0),(1180,2,26,0,0,0,0),(1181,3,26,0,0,0,0),(1182,1,27,1,1,16,6104683),(1183,1,27,1,2,44,1624674422),(1184,1,27,1,4,197,77143146),(1185,1,27,1,7,246,120424523),(1186,1,27,1,8,7,2764756),(1187,1,27,1,9,24,7229406),(1188,2,27,1,2,534,2299132579),(1189,3,27,1,1,80,3471104852),(1190,3,27,1,2,454,19520220938),(1191,1,28,1,1,16,6104683),(1192,1,28,1,2,44,1624674422),(1193,1,28,1,4,197,77143146),(1194,1,28,1,7,246,120424523),(1195,1,28,1,8,7,2764756),(1196,1,28,1,9,24,7229406),(1197,2,28,1,2,534,2299132579),(1198,3,28,1,1,80,3471104852),(1199,3,28,1,2,454,19520220938),(1200,1,29,1,1,16,6104683),(1201,1,29,1,2,44,1624674422),(1202,1,29,1,4,197,77143146),(1203,1,29,1,7,246,120424523),(1204,1,29,1,8,7,2764756),(1205,1,29,1,9,24,7229406),(1206,2,29,1,2,534,2299132579),(1207,3,29,1,1,80,3471104852),(1208,3,29,1,2,454,19520220938),(1209,1,30,0,0,0,0),(1210,2,30,0,0,0,0),(1211,3,30,0,0,0,0);
/*!40000 ALTER TABLE `cnfi_encoursactivite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_entite`
--

DROP TABLE IF EXISTS `cnfi_entite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_entite` (
  `entite_id` int(11) NOT NULL AUTO_INCREMENT,
  `entite_typeEntiteId` int(11) DEFAULT NULL,
  `entite_login` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `entite_password` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `entite_denomination` text,
  `entite_sigle` text,
  `entite_typeAssurance` text,
  `entite_formeJuridique` text,
  `entite_banqueDepositaire` text,
  `entite_dateAgrement` date DEFAULT NULL,
  `entite_numeroAgrement` varchar(255) DEFAULT NULL,
  `entite_etabDomicilitaire` text,
  `entite_partenaireTraitement` text,
  `entite_partenaireDistribution` text,
  `entite_societeMere` text,
  `entite_filiales` text,
  `entite_categorie` text,
  `entite_anneeDemarrage` int(4) DEFAULT NULL,
  `entite_adressePhysique` text,
  `entite_postale` text,
  `entite_telephone` varchar(255) DEFAULT NULL,
  `entite_mail` varchar(255) DEFAULT NULL,
  `entite_sig` text,
  `entite_capital` double DEFAULT NULL,
  `entite_siteWeb` text,
  `entite_slogan` text,
  `entite_actif` int(1) DEFAULT NULL,
  `entite_logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entite_id`),
  KEY `FK_cnfi_entite` (`entite_typeEntiteId`),
  CONSTRAINT `FK_cnfi_entite` FOREIGN KEY (`entite_typeEntiteId`) REFERENCES `cnfi_typeentite` (`typeEntite_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_entite`
--

LOCK TABLES `cnfi_entite` WRITE;
/*!40000 ALTER TABLE `cnfi_entite` DISABLE KEYS */;
INSERT INTO `cnfi_entite` VALUES (1,1,'tojo11','r¿J','ACEP  Madagascar SA',NULL,'','','',NULL,'','','','','ACEP  Madagascar SA','ACEP  Madagascar SA','2',2009,'ACEP  Madagascar SA','101','111 11 111 11','tojo.drha@gmail.com','dfdfd',10000,'','',1,NULL),(2,1,'apem!nmZsis','¬˜>sý.²','APEM PAIQ SA',NULL,'','','',NULL,'','','','','','','1',1998,'Lot VB 14 Ambatonakanga TANA 101','','020 22 623 30','apem.paiq@moov.mg','ORCHID',0,'','Akaiky, Tsotra, Mahomby',1,NULL),(3,1,'cefor!q4CURr','IÛât?·°','CEFOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,1,'cem!Y8V9ET','–$¬UËåì[ë','CEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,1,'eam!i6DYKF','/u¶µá7{','EAM FINANCES Sarl',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,'fivoy!L539ua','B,åYwnïZ6','FIVOY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,1,'hardi-finance!TMdfoC','\rÛa>:Ï','HARDI-FINANCE',NULL,'','','',NULL,'','','','','','','2',2009,'LOT A 187 MANARINTSOA CENTRE','','020 22 249 65','andrymaholy.hardifinance@gmail.com','Loan Performer',25000000,'','Tosika ho amin’ny Fampandrosoana',1,NULL),(8,1,'madacredito!qCCehp','\0Ö¤¬‰}¯bˆ‚','MADACREDITO SA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,1,'mampita!HN4Ib9','7N°»ÜŸ ¾','MAMPITA',NULL,'','','',NULL,'','','','','N/A','N/A','1',2008,'Lot 39 parcelle 143 Morafeno Mahajanga','BP 109 Mahajanga 401','033 37 149 47','mampita.info@gmail.com','Loan Perfomer, Ciel Compta, EBP Paye',0,'','Mampita antsika amin’ny fandrosoana ny fiaraha-miasa',1,'Mampita.png'),(10,1,'mutua!As7cWW','Fb\ZmFb—ÜT','MUTUA FIDE MICROFINANCE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,1,'odrd!Y3VFrg','ÊÉ\'ü<Õ|›Æ','ODRD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,1,NULL,NULL,'VAHATRA',NULL,'','','',NULL,'','','','','','','1',2002,'Lot 1118 G 170 - Mahazoarivo Nord - 110 Antsirabe','','033 15 247 47','ongvahatra@gmail.com','Loan Performer Version 7.10.14',0,'','',1,NULL),(13,1,'ordimic!WSaaPc','Xj ˆƒ¬<í¦','ORDIMIC',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,1,'otiv!lxNROr','åÌ±¼yâ\"Œ','OTIV Alaotra Mangoro',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,1,'otiv!jCZtRK','ÿ¯‚Lx8‚,ç','OTIV Boeny Mahajanga',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,1,'otiv!nqfu37','/^¹óÔk4ŸN','OTIV TANA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,1,'otiv!FbdZxs','q¡¦¶*U&a5','RESEAU OTIV de la DIANA',NULL,'','','',NULL,'','','','','','','2',2001,'Lot 08A Cité elevage- Cité Ouvrière Antsiranana','BP 363','034 05 213 03','sec.union@otivdiana.mg','ORCHID',465192000,'','Kakazo Maro Hefaka Tsy latsaha magnaniky',1,NULL),(18,1,'otiv!uHU5ky','\0áhRæ&íÒ¥','OTIV SAVA',NULL,'','','',NULL,'','','','','','','2',1998,'Réseau OTIV – SAMBAVA','BP 106 A','020 88 922 16','dir@otivsava.mg','ND',0,'','',1,NULL),(19,1,'otiv!PPlG7q','ï}_tKÿOÞ','OTIV Zone Littoral',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,1,'pamf!KGPTvd','Ûüš‡SÚM«','PAMF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,1,'papm!xEROzL','qO¨šL`\Z«B÷','PAPM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,1,'tiavo!oklgii','ÊÉ»;O†?8','TIAVO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,1,'titem!rCJxrL','ä£¹þ<i­Of<','TITEM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,1,'unicecam!3K9ziL','˜|<ÆÁö`þ','UNICECAM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,1,'vatsy!n9B5Mt','J_óÂuÌ^Ô','VATSY',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,1,NULL,NULL,'VOLA MAHASOA SA',NULL,'','','',NULL,'','','','','N/A','N/A','2',1993,'Lot V, 2ème Etage, Immeuble SANTA Antanimena Tanà','Lot V, 2ème Etage, Immeuble SANTA Antanimena Tanà','034 14 224 05','romuald.andriamarosolo@volamahasoa.sa','LOAN PERFORMER v.8.17.03',500000000,'http://www.volamahasoa.mg/','Solidarité respecté, Développement équilibré',1,NULL),(27,3,'accesbanque!KdqKIh','…s5HK7_Ç¢O','ACCESBANQUE MADAGASCAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,3,'bank!T9mP3m','ºEùAjO¬ýx—','BANK OF AFRICA MADAGASCAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,3,'societe!YKuEMi',' é­·MÈô','SOCIETE GENERALE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,3,'bgfibank!OBNv05','J¬ðG’lþ™','BGFIBANK Madagascar SA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,3,'bm!Ov8oq4','ÿÈìkûxj2','BM Madagascar',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,3,'bmoi!Jsb9oF','ýÉy!‘?›á~È','BMOI',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,3,'bni!ntyrXt','\0myv»„ÒúÁ','BNI MADAGASCAR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,3,'mcb!WD5JfB','Cx?5µ4kA‹','MCB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,3,'baobab!t490yp','Ô†GJ¦ ‡\ZÄ\0','BAOBAB Banque  ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,3,'sbm!vDgB6q','eº\rr;—ÃN','SBM',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,3,'sipem!QcroYP','­®9t¹zæ!Ñ\n','SIPEM Banque',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,2,'aro!8kuidK','\ZãÅ±vã,%G”','ARO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,2,'ny!P64mK9','¾¢&uûñ#','NY HAVANA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,2,'mama!UQhv47','¡ƒ_}fU©Ð€','MAMA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,2,'allianz!u2Yz7m','ºÖúw­Àçd”','ALLIANZ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,2,'saham!i6rLHp','5ÿÉ«¢Íb','SAHAM ASSURANCE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,7,'paoma!LAtapi','C†Xþ§`‘Øâ','PAOMA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,4,'cnaps!rCON4I','Ñ\"|‹ˆÁªx\Z','CNaPS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,5,'airtel!73PGMX','qù÷JMÐêÊg6','Airtel Mobile Commerce Madagascar S.A. ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,5,'orange!oSN3b6','2)6¼8ÖÕ¹Ï','Orange Money Madagascar S .A.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,5,'telma!P4JHV7','Ê(•a-\'íYy','TELMA Money MVOLA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,1,NULL,NULL,'IFRA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cnfi_entite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_epargne`
--

DROP TABLE IF EXISTS `cnfi_epargne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_epargne` (
  `epargne_id` int(11) NOT NULL AUTO_INCREMENT,
  `epargne_type` int(11) DEFAULT NULL,
  `epargne_produitId` int(11) DEFAULT NULL,
  `epargne_regionId` int(11) DEFAULT NULL,
  `epargne_typeEpargneId` int(11) DEFAULT NULL,
  `epargne_nombre` int(11) DEFAULT NULL,
  `epargne_montant` double DEFAULT NULL,
  PRIMARY KEY (`epargne_id`)
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_epargne`
--

LOCK TABLES `cnfi_epargne` WRITE;
/*!40000 ALTER TABLE `cnfi_epargne` DISABLE KEYS */;
INSERT INTO `cnfi_epargne` VALUES (16,1,3,0,0,0,0),(17,2,3,0,0,0,0),(18,3,3,0,0,0,0),(43,1,5,0,0,0,0),(44,2,5,0,0,0,0),(45,3,5,0,0,0,0),(55,1,6,0,0,0,0),(56,2,6,0,0,0,0),(57,3,6,0,0,0,0),(58,1,7,0,0,0,0),(59,2,7,0,0,0,0),(60,3,7,0,0,0,0),(97,1,8,0,0,0,0),(98,2,8,0,0,0,0),(99,3,8,0,0,0,0),(100,1,11,21,1,71,32168148045),(101,2,11,21,1,5600,4282913909),(102,3,11,21,1,34,14000230233),(163,1,12,1,5,407,29403486),(164,2,12,1,2,407,29403486),(165,3,12,1,1,113,8442850),(166,3,12,1,2,294,20960636),(176,1,14,0,0,0,0),(177,2,14,0,0,0,0),(178,3,14,0,0,0,0),(200,1,15,0,0,0,0),(201,2,15,0,0,0,0),(202,3,15,0,0,0,0),(209,1,16,0,0,0,0),(210,2,16,0,0,0,0),(211,3,16,0,0,0,0),(230,1,17,0,0,0,0),(231,2,17,0,0,0,0),(232,3,17,0,0,0,0),(239,1,18,0,0,0,0),(240,2,18,0,0,0,0),(241,3,18,0,0,0,0),(253,1,11,21,2,74,649591490),(254,1,11,21,5,8,2728455900),(255,1,11,16,1,652,700220002),(256,1,11,16,2,2,23600000),(257,1,11,16,5,85,23439700),(258,2,11,21,2,74602,31263281526),(259,2,11,16,1,24,21284065),(260,2,11,16,2,715,725975637),(261,3,11,21,2,45,21546607013),(262,3,11,16,1,454,587367590),(263,3,11,16,2,285,159250301),(296,1,22,0,0,0,0),(297,2,22,0,0,0,0),(298,3,22,0,0,0,0),(299,1,23,0,0,0,0),(300,2,23,0,0,0,0),(301,3,23,0,0,0,0),(302,1,24,0,0,0,0),(303,2,24,0,0,0,0),(304,3,24,0,0,0,0),(308,1,26,0,0,0,0),(309,2,26,0,0,0,0),(310,3,26,0,0,0,0),(311,1,27,0,0,0,0),(312,2,27,0,0,0,0),(313,3,27,0,0,0,0),(314,1,28,0,0,0,0),(315,2,28,0,0,0,0),(316,3,28,0,0,0,0),(317,1,29,0,0,0,0),(318,2,29,0,0,0,0),(319,3,29,0,0,0,0),(320,1,30,0,0,0,0),(321,2,30,0,0,0,0),(322,3,30,0,0,0,0);
/*!40000 ALTER TABLE `cnfi_epargne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_epargneoffert`
--

DROP TABLE IF EXISTS `cnfi_epargneoffert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_epargneoffert` (
  `epargneOffert_id` int(11) NOT NULL AUTO_INCREMENT,
  `epargneOffert_produitId` int(11) DEFAULT NULL,
  `epargneOffert_denomination` int(11) DEFAULT NULL,
  `epargneOffert_taux` double DEFAULT NULL,
  `epargneOffert_duree` double DEFAULT NULL,
  `epargneOffert_condition` text,
  `epargneOffert_document` text,
  PRIMARY KEY (`epargneOffert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_epargneoffert`
--

LOCK TABLES `cnfi_epargneoffert` WRITE;
/*!40000 ALTER TABLE `cnfi_epargneoffert` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_epargneoffert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_exporttype`
--

DROP TABLE IF EXISTS `cnfi_exporttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_exporttype` (
  `exportType_typeId` int(11) DEFAULT NULL,
  `exportType_exportId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_exporttype`
--

LOCK TABLES `cnfi_exporttype` WRITE;
/*!40000 ALTER TABLE `cnfi_exporttype` DISABLE KEYS */;
INSERT INTO `cnfi_exporttype` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23),(1,24),(1,25),(1,26),(1,27),(1,28),(1,29),(1,30),(1,31),(1,32),(1,33),(1,35),(1,36),(1,37),(2,1),(2,38),(2,39),(2,40),(2,41),(2,42),(2,43),(2,44),(2,45),(2,46),(2,47),(2,48),(2,49),(2,50),(2,51),(2,52),(2,53),(2,54),(2,55),(2,56),(2,57),(2,58),(2,59),(2,60),(3,1),(3,2),(3,3),(3,4),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(3,21),(3,22),(3,23),(3,24),(3,25),(3,26),(3,27),(4,1),(4,61),(4,62),(4,63),(7,1),(7,65),(7,66),(7,67),(5,1),(5,68),(5,69),(5,70),(5,71),(5,72),(5,73),(5,74),(5,75),(5,77);
/*!40000 ALTER TABLE `cnfi_exporttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_infobulle`
--

DROP TABLE IF EXISTS `cnfi_infobulle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_infobulle` (
  `infobulle_id` int(11) NOT NULL AUTO_INCREMENT,
  `infobulle_typeId` int(11) DEFAULT '5',
  `infobulle_libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`infobulle_id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_infobulle`
--

LOCK TABLES `cnfi_infobulle` WRITE;
/*!40000 ALTER TABLE `cnfi_infobulle` DISABLE KEYS */;
INSERT INTO `cnfi_infobulle` VALUES (1,1,'Indiquer le nom commercial et le sigle de l\'organisation'),(2,1,'Indiquer le nom de la société mère (si applicable)'),(3,1,'Indiquer le(s) nom(s) de(s) filiale(s) de la société (si applicable)'),(4,1,'Choisir la catégorie de l\'institution selon la loi 2017-026 sur la microfinance'),(5,1,'Indiquer l\'année de commencement des activités, même sans autorisation'),(6,1,'Indiquer l\'adresse complète et exacte du siège social de l\'établissement'),(7,1,'Si différente de l\'adresse physique, indiquer l\'adresse postale pour l\'envoi des courriers'),(8,1,'Indiquer le numero de téléphone du siège social de l\'établissement'),(9,1,'Indiquer l\'adresse e-mail du siège social de l\'établissement'),(10,1,'Indiquer le(s) nom(s) de(s) logiciel(s) de gestion utilisé(s) par l\'établissement; que ce soit en comptabilité ou en base de données '),(11,1,'Préciser le capital social de l\'établissement, en Ariary'),(12,1,'Indiquer le site web de l\'établissement (si applicable)'),(13,1,'Indiquer le slogan de l\'établissement (si applicable)'),(14,1,'Indiquer la civilité du dirigeant exécutif'),(15,1,'Indiquer le nom du dirigeant exécutif'),(16,1,'Indiquer la fonction du dirigeant exécutif'),(17,1,'Indiquer le numéro de téléphone professionnel du dirigeant exécutif'),(18,1,'Indiquer l\'adresse e-mail professionnel du dirigeant exécutif'),(19,1,'Indiquer la civilité de l\'interlocuteur de la CNFI'),(20,1,'Indiquer le nom de l\'interlocuteur de la CNFI'),(21,1,'Indiquer la fonction de l\'interlocuteur de la CNFI'),(22,1,'Indiquer le numéro de téléphone professionnel de l\'interlocuteur de la CNFI'),(23,1,'Indiquer l\'adresse e-mail professionnel de l\'interlocuteur de la CNFI'),(24,1,'Indiquer le nom commercial du type de crédit octroyé par l\'institution'),(25,1,'Choisir le type de crédit selon le secteur d\'activités'),(26,1,'Indiquer le(s) catégorie(s) de client(s) ciblé(s) par le type de crédit (ex: Commerçants, PME, …)'),(27,1,'Indiquer le taux d\'intérêt nominal correspondant au crédit, en Pourcentage (Ex: 1,75%)\r\n'),(28,1,'Sélectionner le type de taux'),(29,1,'Indiquer la durée minimale et maximale du crédit, en Mois(Ex : 6-12 mois)'),(30,1,'Indiquer le montant minimal  pouvant être octroyé, en Ariary'),(31,1,'Indiquer le montant maximal  pouvant être octroyé, en Ariary'),(32,1,'Lister les conditions générales d\'accès au type de crédit'),(33,1,'Lister les documents requis pour l\'obtention du crédit'),(34,1,'Citer les garanties exigées pour l\'obtention du crédit, si applicable'),(35,1,'Indiquer le nom commercial du type d\'épargne offerte par l\'institution'),(36,1,'Choisir le type d\'épargne suivant la référence état déclaratif \"IMF 104\" de la CSBF'),(37,1,'Indiquer le(s) catégorie(s) de client(s) ciblé(s) par le type d\'épargne (ex: Commerçants, PME, …)'),(38,1,'Indiquer le taux de rémunération de l\'épargne, en Pourcentage (Ex:7,49%)'),(39,1,'Indiquer la durée minimale et/ou maximale; pour le cas de dépôt à terme, en Mois'),(40,1,'Sélectionner le type de taux'),(41,1,'Indiquer le dépôt minimum requis pour l\'ouverture du compte épargne, en Ariary'),(42,1,'Lister les conditions générales d\'accès au type d\'épargne'),(43,1,'Lister les documents requis pour l\'ouverture du compte épargne'),(44,1,'Sélectionner tous les types de services financiers mobiles et/ou transferts d\'argent offerts par l\'établissement'),(45,1,'Lister les partenaires de l\'établissement en matière de services financiers mobiles et en transfert d\'argent'),(46,1,'Lister les conditions pour accéder aux services financiers mobiles et/ou transferts d\'argent'),(47,1,'Sélectionner tous les types de services non-financiers offerts par l\'établissement'),(48,1,'Lister les partenaires de l\'établissement en matière de services non-financiers'),(49,1,'Lister les conditions pour accéder aux services non-financiers'),(50,1,'Sélectionner la Région d\'implantation'),(51,1,'Sélectionner le District d\'implantation'),(52,1,'Sélectionner la commune d\'implantation'),(53,1,'Indiquer le(s) Fokontany d\'implantation'),(54,1,'Sélectionner le type de point de service'),(55,1,'Indiquer le nombre de points de services selon le type'),(56,1,'Sélectionner la région'),(57,1,'Indiquer le nombre de membres ou clients \"Femmes\" ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(58,1,'Indiquer le nombre de membres ou clients \"Hommes\" ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(59,1,'Indiquer le nombre de membres ou clients \"Personnes Morales\" ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(60,1,'Indiquer le nombre de membres ou clients \"Associations\" ou \"Groupement de Femmes\" ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(61,1,'Indiquer le nombre de \"Femmes\" ayant déposé une épargne auprès de l\'établissement sans que cela ne constitue une condition pour l’obtention d’un prêt ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(62,1,'Indiquer le nombre d\' \"Hommes\" ayant déposé une épargne auprès de l\'établissement sans que cela ne constitue une condition pour l’obtention d’un prêt ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(63,1,'Indiquer le nombre de \"Personnes Morales\" ayant déposé une épargne auprès de l\'établissement sans que cela ne constitue une condition pour l’obtention d’un prêt ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée'),(64,1,'Indiquer le nombre de \"Femmes\"  ayant obtenu un prêt auprès de l’IMF pour lequel il reste encore un solde à payer ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(65,1,'Indiquer le nombre d\' \"Hommes\"  ayant obtenu un prêt auprès de l’IMF pour lequel il reste encore un solde à payer ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)\r\n'),(66,1,'Indiquer le nombre de \"Personnes Morales\"  ayant obtenu un prêt auprès de l’IMF pour lequel il reste encore un solde à payer ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(67,1,'Sélectionner le secteur d\'activité'),(68,1,'Indiquer le nombre  de l\'encours de crédit  selon le secteur d\'activité ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(69,1,'Indiquer le montant de l\'encours de crédit selon le secteur d\'activité ; montant arrêté à la fin du trimestre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(70,1,'Sélectionner le type de client'),(71,1,'Indiquer le nombre de l\'encours de crédit sollicité par un individu ou une entreprise dans le but d\'améliorer ses activités, c\'est-à-dire dont l\'objet est générateur de revenu ; nombre arrêté à la fin du trimestre (Données consolidées au niveau de la régi'),(72,1,'Indiquer le montant  de l\'encours de crédit, sollicité pendant le trimestre par un individu ou une entreprise dans le but d\'améliorer ses activités, c\'est-à-dire dont l\'objet est générateur de revenu ; montant arrêté à la fin du trimestre, en Ariary (Donn'),(73,1,'Sélectionner le Genre du Client'),(74,1,'Indiquer le nombre  de l\'encours de crédit, selon le Genre  ; nombre arrêté à la fin du trimestre(Données consolidées au niveau de la Région sélectionnée)'),(75,1,'Indiquer le montant de l\'encours de crédit selon le Genre ; montant arrêté à la fin du trimestre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(76,1,'Indiquer le nombre  de crédits octroyés pendant le trimestre, selon le secteur d\'activité (Données consolidées au niveau de la Région sélectionnée)'),(77,1,'Indiquer le montant des crédits octroyés pendant le trimestre, selon le secteur d\'activité , en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(78,1,'Indiquer le nombre  de crédit sollicité pendant le trimestre par un individu ou une entreprise dans le but d\'améliorer ses activités, c\'est-à-dire dont l\'objet est générateur de revenu (Données consolidées au niveau de la Région sélectionnée)'),(79,1,'Indiquer le montant  de crédit sollicité pendant le trimestre par un individu ou une entreprise dans le but d\'améliorer ses activités, c\'est-à-dire dont l\'objet est générateur de revenu, en Ariary(Données consolidées au niveau de la Région sélectionnée)'),(80,1,'Indiquer le nombre  de crédits octroyés  pendant le trimestre, selon le Genre (Données consolidées au niveau de la Région sélectionnée)'),(81,1,'Indiquer le nombre  de crédits octroyés  pendant le trimestre, selon le Genre (Données consolidées au niveau de la Région sélectionnée)'),(82,1,'Indiquer le montant restant dû de tous les prêts, qu\'ils soient sains ou douteux, montant arrêté à la fin du trimestre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(83,1,'\"Indiquer le montant restant dû de tous les prêts à jour, c’est-à-dire dont tous les remboursements  ont été effectué selon\nle calendrier fixé, montant arrêté à la fin du trimestre, en Ariary \n(Données consolidées au niveau de la Région sélectionnée)\"'),(84,1,'\"Indiquer le montant restant dû de tous les prêts en retard, c’est-à-dire dont  les remboursements  n\'ont pas été effectué selon\nle calendrier fixé, montant arrêté à la fin du trimestre, en Ariary \n(Données consolidées au niveau de la Région sélectionnée)'),(85,1,'Indiquer le montant restant dû de tous les prêts en retard de 31 à 90 jours, montant arrêté à la fin du trimestre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(86,1,'Indiquer le montant restant dû de tous les prêts en retard de 91 jours et plus, montant arrêté à la fin du trimestre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(87,1,'Indiquer le montant total des prêts, qu\'ils soient sains ou douteux, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(88,1,'Indiquer le montant restant dû de tous les prêts à jour, c’est-à-dire dont tous les remboursements  ont été effectué selon'),(89,1,'Indiquer le montant restant dû de tous les prêts en retard, c’est-à-dire dont  les remboursements  n\'ont pas été effectué selon'),(90,1,'Indiquer le montant restant dû de tous les prêts en retard de 31 à 90 jours, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(91,1,'Indiquer le montant restant dû de tous les prêts en retard de 91 jours et plus, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(92,1,'Sélectionner le type d\'épargne'),(93,1,'Indiquer le nombre  de l\'encours d\' épragne selon le type, nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(94,1,'Indiquer le montant de l\'encours d\'épargne selon le type, montant arrêté à la fin du trimestre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(95,1,'Sélectionner le type de client'),(96,1,'Indiquer le nombre  de l\'encours d\'épargne selon le type de client, nombre arrêté à la fin du trimestre (Données consolidées au niveau de la Région sélectionnée)'),(97,1,'Indiquer le montant de l\'encours d\'épargne selon le type de client, montant arrêté à la fin du trimestre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(98,1,'Sélectionner le Genre du Client'),(99,1,'\"Indiquer le nombre  de l\'encours d\'épargne selon le Genre, nombre arrêté à la fin du trimestre \n(Données consolidées au niveau de la Région sélectionnée)\"'),(100,1,'Indiquer le montant de l\'encours de l\'épargne selon le Genre, montant arrêté à la fin du trimestre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(101,1,'Sélectionner parmi les types de services financiers mobiles et/ou transferts d\'argent existants'),(102,1,'Indiquer le nombre transactions enregistrées pendant le trimestre, selon le type de service sélectionné'),(103,1,'Indiquer le montant des transactions enregistrées pendant le trimestre, pour chaque type de service sélectionné'),(104,1,'Indiquer le nombre de clients utilisant le type de service sélectionné, nombre arrêté à la fin du trimestre'),(105,1,'Indiquer le nombre de personnes formées pendant le trimestre et déjà bénéficiaires de services financiers'),(106,1,'Indiquer le nombre de personnes formées pendant le trimestre, non bénéficiaires de services financiers'),(107,1,'Indiquer le nombre de clients utilisant le coffre-fort, nombre arrêté à la fin du trimestre\r\n'),(108,1,'Indiquer le nombre de clients bénéficiaires de la Mutuelle de Santé et bénéficiaires de services financiers, nombre arrêté à la fin du trimestre'),(109,1,'Indiquer le nombre de clients bénéficiaires de la Mutuelle de Santé et non bénéficiaires de services financiers, nombre arrêté à la fin du trimestre'),(110,1,'Indiquer le nombre de personnes faisant partie du personnel actif de l\'établissement'),(111,1,'Indiquer le pourcentage de Femmes par rapport au nombre total des effectifs'),(112,1,'Indiquer le nombre de personnes exerçant des fonctions et des responsabilités d\'encadrement et de management au sein de l\'établissement'),(113,1,'\"Indiquer le nombre de personnes  directement responsable du\nprocessus de montage et de suivi des prêts aux clients.Les agents qui sont chargés des suivis des opérations de crédit avec la clientèle (analyse des demandes, instruction des demandes, suivi de'),(114,1,'Indiquer le pourcentage d\' Agents de crédit \"Femmes\"'),(115,1,'Indiquer le nombre d\'agents d\'exécution apportant leur appui pour permettre au reste du personnel de bien accomplir leurs tâches'),(116,1,'Indiquer la date du Changement du dirigeant exécutif'),(117,1,'Indiquer la civilité et le nom du nouveau dirigeant exécutif'),(118,1,'Indiquer le numero de téléphone du nouveau dirigeant exécutif'),(119,1,'Indiquer le nom du dirigeant exécutif partant'),(120,1,'Indiquer la date d\'ouverture du nouveau point de service'),(121,1,'Indiquer le motif d\'ouverture du nouveau point de service'),(122,1,'Sélectionner la région d\'implantation  du nouveau point de service'),(123,1,'Sélectionner le district d\'implantation  du nouveau point de service'),(124,1,'Sélectionner la commune d\'implantation  du nouveau point de service'),(125,1,'Indiquer le Fokontany d\'implantation du nouveau point de service'),(126,1,'Indiquer le type de point de service ouvert (Agence, Agence mobile, Caisse, GAB, TPE)'),(127,1,'Indiquer la date de fermeture du point de service'),(128,1,'Indiquer le motif de fermeture du point de service'),(129,1,'Sélectionner la région d\'implantation  du  point de service fermé'),(130,1,'Sélectionner le District d\'implantation  du  point de service fermé'),(131,1,'Sélectionner la commune d\'implantation  du  point de service fermé'),(132,1,'Indiquer le Fokontany d\'implantation du point de service fermé'),(133,1,'Indiquer le type de point de service fermé (Agence, Agence mobile, Caisse, GAB, TPE)'),(134,1,'Décrire brièvement l\'évènement marquant du trimestre (Exemple: Célébration anniversaire, Foire, Parution périodique de l’institution, etc…)'),(135,1,'Indiquer la date de l\'évènement marquant'),(136,1,'Indiquer le lieu où a eu lieu l\'évènement marquant, si applicable'),(137,1,'Indiquer les supports de l\'évènement marquand (Exemple: Lien web, Documents à télécharger, Photos, etc…)'),(138,1,'Indiquer le montant de crédits octroyés  pendant le trimestre, selon le Genre, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(139,2,'Indiquer le nom commercial du produit '),(140,2,'Préciser si l\'assurance vie offre une protection pendant une durée déterminée (Temporaire) ou une protection à vie (Indéterminée)'),(141,2,'Indiquer les catégories de personnes ciblées comme \"Souscripteurs\" (Le souscripteur est la personne qui signe les différents documents du contrat d’assurance et qui s’engage à payer les primes dues à l’assureur)'),(142,2,'Indiquer les catégories de personnes ciblées comme \"Assurés\" (L\'assuré est la personne sur qui repose le risque)\r\n'),(143,2,'Indiquer le montant annuel minimum que doit payer le souscripteur pour bénéficier des garanties prévues par l\'assurance vie, en Ariary'),(144,2,'Indiquer la durée minimum du contrat  pour bénéficier de l\'assurance, en année (Ecrire \"Néant\" en cas d\'assurance vie de type \"Indéterminée\")'),(145,2,'Indiquer le montant minimum garanti qui sera versé au bénéficiare en cas d\'apparition du risque, en Ariary'),(146,2,'Indiquer l\'âge limite de l\'Assuré, en années'),(147,2,'Indiquer les autres conditions d\'accès pour souscrire à l\'assurance'),(148,2,'Lister les documents exigés pour souscrire à l\'assurance'),(149,2,'Indiquer le nom commercial du produit '),(150,2,'Indiquer les catégories de personnes ciblées comme \"Souscripteurs\" (Dans le cas de l\'Assurance crédit, l\'Assuré est le Souscripteur lui-même)'),(151,2,'Indiquer les catégories d\'organismes prêteurs bénéficiaires en cas d\'apparition du risque\r\n'),(152,2,'Indiquer le montant annuel minimum que doit payer le souscripteur pour bénéficier des garanties prévues par l\'assurance crédit, en Ariary\r\n'),(153,2,'Indiquer la durée minimum du contrat  pour bénéficier de l\'assurance crédit, en année\r\n'),(154,2,'Indiquer le montant minimum garanti qui sera versé à l\'organisme prêteur en cas d\'apparition du risque, en Ariary\r\n'),(155,2,'Préciser si le montant du capital qui sera versé à l\'organisme prêteur en cas d\'apparition du risque correspond au capital restant dû (Montant total des emprunts restant à rembourser)\r\n'),(156,2,'Indiquer le montant maximum du crédit pour pouvoir souscrire à l\'assurance\r\n'),(157,2,'Indiquer l\'âge limite de l\'Assuré, en années\r\n'),(158,2,'Indiquer dans quel cas la couverture de l\'assurance est obligatoire (Ecrire \"Facultative\" le cas échéant)\r\n'),(159,2,'Indiquer les autres conditions d\'accès pour souscrire à l\'assurance\r\n'),(160,2,'Lister les documents exigés pour souscrire à l\'assurance\r\n'),(161,2,'Indiquer le nom commercial du produit '),(162,2,'Préciser le type d\'assurance\r\n'),(163,2,'Indiquer les catégories de personnes ciblées comme \"Assurés\" (L\'assuré est la personne sur qui repose le risque)\r\n'),(164,2,'Indiquer le montant annuel minimum que doit payer le souscripteur pour bénéficier des garanties prévues par l\'assurance, en Ariary\r\n'),(165,2,'Indiquer la durée minimum du contrat  pour bénéficier de l\'assurance, en année (néant si Indéterminée)\r\n'),(166,2,'Indiquer le montant qui reste à la charge de l’Assuré en cas d\'apparition du risque, en Ariary\r\n'),(167,2,'Indiquer le montant maximum qui sera à la charge de l\'Assureur en cas d\'apparition du risque, en Ariary\r\n'),(168,2,'Indiquer dans quel cas la couverture de l\'assurance est obligatoire (Ecrire \"Facultative\" le cas échéant)\r\n'),(169,2,'Indiquer les conditions d\'accès pour souscrire à l\'assurance'),(170,2,'Lister les documents exigés pour souscrire à l\'assurance'),(171,2,'Indiquer les conditions d\'exclusion (Clauses par lesquelles l’assureur écarte de la garantie certains évènements)'),(172,2,'Indiquer le nom commercial du produit '),(173,2,'Indiquer le type de bien couvert par l\'assurance'),(174,2,'Préciser les catégories de personnes ciblées comme \"Souscripteurs\"; si c\'est le propriétaire du bien ou la personne qui loue ou emprunte le bien'),(175,2,'Indiquer le montant annuel minimum que doit payer le souscripteur pour bénéficier des garanties prévues par l\'assurance, en Ariary'),(176,2,'Indiquer la durée minimum du contrat  pour bénéficier de l\'assurance, en année '),(177,2,'Indiquer le montant qui reste à la charge du Souscripteur en cas d\'apparition du risque, en Ariary'),(178,2,'Indiquer le montant minimum garanti qui sera versé au souscripteur en cas d\'apparition du risque, en Ariary'),(179,2,'Indiquer dans quel cas la couverture de l\'assurance est obligatoire (Ecrire \"Facultative\" le cas échéant)'),(180,2,'Indiquer les conditions d\'accès pour souscrire à l\'assurance'),(181,2,'Lister les documents exigés pour souscrire à l\'assurance'),(182,2,'Indiquer les conditions d\'exclusion (Clauses par lesquelles l’assureur écarte de la garantie certains évènements)'),(183,2,'Indiquer le nom commercial du produit '),(184,2,'Indiquer le type de risque couvert par l\'assurance'),(185,2,'Indiquer les catégories de personnes, d\'intérêts ou de biens ciblées sur lesquelles vont reposer le risque'),(186,2,'Indiquer le montant annuel minimum que doit payer le souscripteur pour bénéficier des garanties prévues par l\'assurance, en Ariary'),(187,2,'Indiquer la durée minimum du contrat  pour bénéficier de l\'assurance, en année '),(188,2,'Indiquer le montant qui reste à la charge du Souscripteur en cas d\'apparition du risque, en Ariary'),(189,2,'Indiquer le montant minimum garanti qui sera versé au souscripteur en cas d\'apparition du risque, en Ariary'),(190,2,'Indiquer dans quel cas la couverture de l\'assurance est obligatoire (Ecrire \"Facultative\" le cas échéant)'),(191,2,'Indiquer les conditions d\'accès pour souscrire à l\'assurance'),(192,2,'Lister les documents exigés pour souscrire à l\'assurance'),(193,2,'Indiquer les conditions d\'exclusion (Clauses par lesquelles l’assureur écarte de la garantie certains évènements)'),(194,2,'Indiquer le nom commercial du produit '),(195,2,'Indiquer le type de risque couvert par l\'assurance'),(196,2,'Indiquer les catégories de personnes, d\'intérêts ou de biens ciblées sur lesquelles vont reposer le risque'),(197,2,'Indiquer le montant annuel minimum que doit payer le souscripteur pour bénéficier des garanties prévues par l\'assurance, en Ariary'),(198,2,'Indiquer la durée minimum du contrat  pour bénéficier de l\'assurance, en année '),(199,2,'Indiquer le montant qui reste à la charge du Souscripteur en cas d\'apparition du risque, en Ariary'),(200,2,'Indiquer le montant minimum garanti qui sera versé au souscripteur en cas d\'apparition du risque, en Ariary'),(201,2,'Indiquer dans quel cas la couverture de l\'assurance est obligatoire (Ecrire \"Facultative\" le cas échéant)'),(202,2,'Indiquer les conditions d\'accès pour souscrire à l\'assurance'),(203,2,'Lister les documents exigés pour souscrire à l\'assurance'),(204,2,'Indiquer les conditions d\'exclusion (Clauses par lesquelles l’assureur écarte de la garantie certains évènements)'),(205,2,'Sélectionner la Région '),(206,2,'Sélectionner le District '),(207,2,'Sélectionner la commune'),(208,2,'Indiquer le nombre d\' hommes ayant contracté une police d\'assurance'),(209,2,'Indiquer le nombre de femmes ayant contracté une police d\'assurance'),(210,2,'Indiquer le nombre de \"Personnes Morales\" ayant contracté une police d\'assurance'),(211,2,'Sélectionner la Région'),(212,2,'Indiquer le type d\'assurance'),(213,2,'Indiquer le nombre de polices d\'assurances contractées pendant la période'),(214,2,'Dans le cas d\'une assurance crédit, indiquer le montant total du capital garanti qui sera versé aux organismes prêteurs en cas d\'apparition du risque, en Ariary '),(215,2,'Indiquer le nombre total de personnes ayant contracté le type de police d\'assurance'),(216,2,'Indiquer le nombre total d\'hommes ayant contracté le type de police d\'assurance'),(217,2,'Indiquer le nombre total de femmes ayant contracté le type de police d\'assurance'),(218,2,'Indiquer le nombre total de personnes morales ayant contracté le type de police d\'assurance'),(219,2,'Dans le cas d\'une assurance crédit, indiquer le nombre d\'organismes prêteurs bénéficiaires '),(220,2,'Dans le cas d\'une assurance agricole, indiquer le nombre d\'agricultures ayant souscrit au type d\'assurance'),(221,2,'Indiquer le montant total des demandes d\'indemnitsation, en Ariary'),(222,2,'Indiquer le montant total des demandes d\'indemnitsation émanant de femmes, en Ariary'),(223,2,'Indiquer le montant total des demandes d\'indemnitsation émanant d\'hommes, en Ariary'),(224,2,'Indiquer le montant total des demandes d\'indemnitsation émanant de personnes morales, en Ariary'),(225,2,'Dans le cas d\'une assurance crédit, indiquer le montant total des demandes d\'indemnitsation, en Ariary'),(226,2,'Dans le cas d\'une assurance agricole, indiquer le montant total des demandes d\'indemnitsation, en Ariary'),(227,2,'Indiquer le nombre de personnes faisant partie du personnel actif de l\'établissement'),(228,2,'Indiquer le pourcentage de Femmes dans le nombre total des effectifs'),(229,2,'Indiquer le nombre de personnes exerçant des fonctions et des responsabilités d\'encadrement et de management au sein de l\'établissement'),(230,2,'Indiquer le nombre d\'actuaires (Les actuaires sont des professionnels qui analysent l\'impact financier du risque, en estimant les flux futurs associés. Les actuaires utilisent des techniques en mathématiques, en économie et en statistiques pour modéliser '),(231,2,'\"Indiquer le nombre d\'agents généraux (L’agent général d’assurance exerce une profession libérale : il est mandataire exclusif\nd’une compagnie d’assurances qu’il\nreprésente et dont il engage la responsabilité. Il commercialise auprès de la clientèle les\nc'),(232,2,'\"Indiquer le nombre de courtiers (Le courtier d’assurance est un commerçant indépendant, propriétaire de son portefeuille\nde clients. Il conseille ses clients dans le choix de produits d’assurance et sert d’intermédiaire\nentre le client et la compag'),(233,4,'Sélectionner la région'),(234,4,'Indiquer le nombre total de pensionnés au niveau de la région'),(235,4,'Indiquer le nombre total de prestataires en matière d\'accident de travail et maladies professionnelles'),(236,4,'Indiquer le nombre total de travailleurs affiliés à la CNAPS au niveau de la région'),(237,5,'Sélectionner le type de service ou transaction'),(238,5,'Indiquer le type et le nom commercial de la transaction si applicable'),(239,5,'Indiquer si la souscription est requise pour bénéficier du service'),(240,5,'Indiquer le montant minimal requis à verser dans le compte de monnaie électronique pour pouvoir effectuer des opérations, en Ariary'),(241,5,'Indiquer le montant minimum requis pour effectuer ce type de transaction, en Ariary'),(242,5,'Indiquer le nom de l\'application si l\'installation d\'une application est requise pour effectuer ce type de transaction'),(243,5,'Indiquer les catégories de clients ciblées par ce type de transaction'),(244,5,'Dans le cas d\'une tarification forfaitaire, indiquer le frais minimum de la transaction, en Ariary (Dans d\'autres cas de tarification ou en cas de gratuité du service, indiquer \"0\")'),(245,5,'Dans le cas d\'une tarification forfaitaire, indiquer le frais maximum de la transaction, en Ariary (Dans d\'autres cas de tarification ou en cas de gratuité du service, indiquer \"0\")'),(246,5,'Dans le cas d\'une tarification où le frais est proportionnel au montant de la transaction, indiquer le  pourcentage (Dans d\'autres cas de tarification ou en cas de gratuité du service, indiquer \"0\")'),(247,5,'Indiquer les documents requis pour l\'ouverture du compte de monnaie électronique'),(248,7,'Indiquer le nom commercial du type d\'épargne offert par la Paositra Malagasy'),(249,7,'Indiquer le type d\'épargne'),(250,7,'Indiquer les catégories de clients ciblées par le type d\'épargne (ex: commercant, paysan producteur de paddy, etc.)'),(251,7,'Indiquer le montant minimum à déposer, en Ariary'),(252,7,'Indiquer le taux de rémunération annuel de l\'épargne, en %'),(253,7,'Indiquer la durée minimale, en mois'),(254,7,'Préciser pour chaque type de dépôt ou d\'épargne les conditions générales d\'accès (ex: personne physique disposant d\'une activité génératrice de revenu, dépôt minimum à l\'ouverture d\'un compte d\'épargne )'),(255,7,'Lister les documents requis pour l\'ouverture du compte épargne'),(256,7,'Indiquer le nom commercial du service de tranfert d\'argent'),(257,7,'Indiquer le type de transfert d\'argent'),(258,7,'Indiquer le réseau utilisé pour le transfert d\'argent'),(259,7,'Indiquer le partenaire de l\'établissement pour le service de transfert d\'argent'),(260,7,'Indiquer les catégories de clients ciblées par le service de transfert d\'argent'),(261,7,'Indiquer si le transfert est possible en émission seulement, réception seulement ou en émission et réception'),(262,7,'Préciser pour chaque type de transfert les conditions générales d\'accès'),(263,7,'Lister les documents requis pour bénéficier du service de ce type de transfert d\'argent'),(264,7,'Nom commercial du produit offert par l\'établissement'),(265,7,'Indiquer les catégories de clients ciblées par le compte courant (ex: commercant, paysan producteur de paddy, etc.)'),(266,7,'Indiquer le montant minimum à déposer, en Ariary'),(267,7,'Préciser les conditions d\'accès pour l\'ouverture du compte courant'),(268,7,'Lister les documents requis pour bénéficier du service de compte courant'),(269,7,'Sélectionner la région'),(270,7,'Indiquer le nombre de membres/clients Femmes'),(271,7,'Indiquer le nombre de membres/clients Hommes'),(272,7,'Indiquer le nombre de membres/clients Personnes morales'),(273,7,'Sélectionner la Région'),(274,7,'Sélectionner le type d\'épargne'),(275,7,'Indiquer le nombre  de l\'encours d\' épragne selon le type (Données consolidées au niveau de la Région sélectionnée)'),(276,7,'Indiquer le montant de l\'encours d\'épargne selon le type, en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(277,7,'Sélectionner la Région'),(278,7,'Sélectionner le type de client'),(279,7,'Indiquer le nombre  de l\'encours d\'épargne selon le type de client (PME ou Ménage) (Données consolidées au niveau de la Région sélectionnée)'),(280,7,'Indiquer le montant de l\'encours d\'épargne selon le type de client (PME ou Ménage) , en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(281,7,'Sélectionner la Région'),(282,7,'Sélectionner le Genre du Client'),(283,7,'Indiquer le nombre  de l\'encours d\'épargne selon le Genre (Données consolidées au niveau de la Région sélectionnée)'),(284,7,'Indiquer le montant de l\'encours de l\'épargne selon le Genre , en Ariary (Données consolidées au niveau de la Région sélectionnée)'),(285,7,'Sélectionner parmi les types de transferts d\'argent existants'),(286,7,'Indiquer le nombre transactions selon le type de service sélectionné'),(287,7,'Indiquer le montant des transactions pour chaque type de service sélectionné, en Ariary'),(288,7,'Indiquer le nombre de clients utilisant le type de service sélectionné'),(289,7,'Sélcetionner la région'),(290,7,'Indiquer le nombre de comptes courants ouverts dans la région'),(291,7,'Indiquer le montant total des dépôts de tous les comptes courants au niveau de la région, en Ariary'),(292,5,'Indiquer le nombre d\'agents'),(293,5,'Sélectionner le type d\'agent'),(294,5,'Sélectionner la région'),(295,5,'Indiquer le nombre de clients titulaires d\'un compte de monnaie électronique'),(296,5,'Indiquer le nombre de clients de sexe Masculin, titulaires d\'un compte de monnaie électronique'),(297,5,'Indiquer le nombre de clients de sexe Féminin, titulaires d\'un compte de monnaie électronique'),(298,5,'Indiquer le type de transaction'),(299,5,'Indiquer le nombre de transactions enregistrées pendant la période'),(300,5,'Indiquer le montant total des transactions enregistrées sur la période, en Ariary'),(301,5,'Sélectionner la région'),(302,5,'Indiquer le nombre de clients ayant ouvert un compte de monnaie électronique au cours de la période'),(303,5,'Indiquer le nombre de comptes de monnaie électronique ayant enregistré au moins une transaction sur 60 jours'),(304,5,'Indiquer le nombre de comptes de monnaie électronique n\'ayant enregistré aucune transaction sur 60 jours'),(305,5,'Indiquer le nombre de réclamations et oppositions pour vol, perte ou fraude en matière de monnaie électronique'),(306,5,'Indiquer le solde total de tous les comptes de monnaie électronique, en Ariary');
/*!40000 ALTER TABLE `cnfi_infobulle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_information`
--

DROP TABLE IF EXISTS `cnfi_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_information` (
  `produitId` int(11) DEFAULT NULL,
  `information_totalEffectif` int(11) DEFAULT NULL,
  `information_effectifFemme` int(11) DEFAULT NULL,
  `information_cadre` int(11) DEFAULT NULL,
  `information_agentCredit` int(11) DEFAULT NULL,
  `information_pourcentCreditFemme` double DEFAULT NULL,
  `information_personnelAppui` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_information`
--

LOCK TABLES `cnfi_information` WRITE;
/*!40000 ALTER TABLE `cnfi_information` DISABLE KEYS */;
INSERT INTO `cnfi_information` VALUES (3,12,25,4,6,33,3),(5,0,0,0,0,0,0),(6,34,50,8,8,37.5,9),(7,12,25,4,6,33,3),(8,131,5,10,92,3,36),(10,133,8,10,90,3.33,36),(12,8,50,2,5,50,3),(13,29,55,8,10,40,10),(14,0,0,0,0,0,0),(15,133,8,10,90,3,36),(16,0,0,0,0,0,0),(17,6,2,2,2,0,7),(18,0,0,0,0,0,0),(11,123,37,29,37,2.7,57),(21,0,0,0,0,0,0),(22,182,0,0,0,0,0),(23,0,0,0,0,0,0),(24,0,0,0,0,0,0),(26,0,0,0,0,0,0),(25,0,0,0,0,0,0),(27,12,25,4,6,33.33,3),(28,12,25,4,6,33.33,3),(29,12,25,4,6,33.33,3),(30,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cnfi_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_informationassurance`
--

DROP TABLE IF EXISTS `cnfi_informationassurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_informationassurance` (
  `produitId` int(11) DEFAULT NULL,
  `informationAssurance_totalEffectif` int(11) DEFAULT NULL,
  `informationAssurance_pourcentage` int(11) DEFAULT NULL,
  `informationAssurance_cadre` int(11) DEFAULT NULL,
  `informationAssurance_agent` int(11) DEFAULT NULL,
  `informationAssurance_actuaires` int(11) DEFAULT NULL,
  `informationAssurance_courtier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_informationassurance`
--

LOCK TABLES `cnfi_informationassurance` WRITE;
/*!40000 ALTER TABLE `cnfi_informationassurance` DISABLE KEYS */;
INSERT INTO `cnfi_informationassurance` VALUES (3,0,0,0,0,0,0),(5,0,0,0,0,0,0),(6,0,0,0,0,0,0),(7,0,0,0,0,0,0),(8,0,0,0,0,0,0),(10,0,0,0,0,0,0),(12,0,0,0,0,0,0),(13,0,0,0,0,0,0),(14,0,0,0,0,0,0),(15,0,0,0,0,0,0),(16,0,0,0,0,0,0),(17,0,0,0,0,0,0),(18,0,0,0,0,0,0),(11,0,0,0,0,0,0),(21,0,0,0,0,0,0),(22,0,0,0,0,0,0),(23,0,0,0,0,0,0),(24,0,0,0,0,0,0),(26,0,0,0,0,0,0),(25,0,0,0,0,0,0),(27,0,0,0,0,0,0),(28,0,0,0,0,0,0),(29,0,0,0,0,0,0),(30,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cnfi_informationassurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_marquant`
--

DROP TABLE IF EXISTS `cnfi_marquant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_marquant` (
  `produitId` int(11) DEFAULT NULL,
  `marquant_dirigeant` text,
  `marquant_date` date DEFAULT NULL,
  `marquant_nomDirigeant` text,
  `marquant_telephone` text,
  `marquant_nomDirigeantExecutif` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_marquant`
--

LOCK TABLES `cnfi_marquant` WRITE;
/*!40000 ALTER TABLE `cnfi_marquant` DISABLE KEYS */;
INSERT INTO `cnfi_marquant` VALUES (12,'changement de dirigeant exécutif','2001-01-01','RAKOTOMALALA Tiana','034 06 654 32','RAKOTOHARIVELO Mino');
/*!40000 ALTER TABLE `cnfi_marquant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_menuota`
--

DROP TABLE IF EXISTS `cnfi_menuota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_menuota` (
  `menuOta_id` int(11) NOT NULL AUTO_INCREMENT,
  `menuOta_activation` int(11) DEFAULT NULL,
  `menuOta_couleur` varchar(255) DEFAULT NULL,
  `menuOta_nom` varchar(255) DEFAULT NULL,
  `menuOta_zhashUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menuOta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_menuota`
--

LOCK TABLES `cnfi_menuota` WRITE;
/*!40000 ALTER TABLE `cnfi_menuota` DISABLE KEYS */;
INSERT INTO `cnfi_menuota` VALUES (1,277,'text-blue','Point d\'accès','point-d-access'),(2,278,'text-red','Encours epargne','encours-epargne'),(3,279,'text-green','Comptes Crédit','compte-credit'),(4,280,'text-yellow','Personnel','personnel'),(5,281,'text-magenta','Clientèle','clientele'),(6,282,'text-purple','EME activité clientèle','eme-activites-clientele'),(7,283,'text-orange','Assurance activité clientèle','assurance-activites-clientele'),(8,284,'text-blue','Ad hoc','ad-hoc');
/*!40000 ALTER TABLE `cnfi_menuota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_menuotachamps`
--

DROP TABLE IF EXISTS `cnfi_menuotachamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_menuotachamps` (
  `menuOtaChamps_id` int(11) NOT NULL AUTO_INCREMENT,
  `menuOtaChamps_menuOtaId` int(11) DEFAULT NULL,
  `menuOtaChamps_nomIntitule` varchar(255) DEFAULT NULL,
  `menuOtaChamps_nomDeChamps` varchar(255) DEFAULT NULL,
  `menuOtaChamps_ordre` int(2) DEFAULT NULL,
  PRIMARY KEY (`menuOtaChamps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_menuotachamps`
--

LOCK TABLES `cnfi_menuotachamps` WRITE;
/*!40000 ALTER TABLE `cnfi_menuotachamps` DISABLE KEYS */;
INSERT INTO `cnfi_menuotachamps` VALUES (1,1,'Institution','Institution',1),(2,1,'Secteur ','Secteur',2),(3,1,'Trimestre','trimestre',3),(4,1,'Année','Année',4),(5,1,'Région','Region',5),(6,1,'District','District',6),(7,1,'Fokontany','Fokontany',7),(8,1,'Commune','Commune',8),(12,1,'Type','zType',9),(13,1,'Nbre d\'Agents de Distribution EME','zoneNombreCompteMonnaie',10),(14,1,'Nbre d\'Agents detaillants (marchands ou purs) EME','zoneNombreActif',11),(15,1,'Nbre Total de Points de Service','ZoneNombre',12),(16,2,'Institution','institution',1),(17,2,'Secteur','secteur',2),(18,2,'Trimestre','trimestre',3),(19,2,'Année','annee',4),(20,2,'Région','region',5),(21,2,'Type D\'IMF','zType',6),(22,2,'Nbre de Comptes de Dépôts Détenus par des Femmes','nbrDepotFemme',7),(23,2,'Nbre de Comptes de Dépôts Détenus par des Hommes','nbrCompteDepotHomme',8),(24,2,'Nbre  de Comptes de Dépôts Détenus par des PMEs **','nbrComptePME',9),(25,2,'Montant des Comptes de Dépôts Détenus par des Femmes','MontantDepotFemme',10),(26,2,'Montant  des Comptes de Dépôts Détenus par des Hommes','MontantDepotHomme',11),(27,2,'Montant  des Comptes de Dépôts Détenus par des PMEs','MontantDepotPme',12),(28,2,'Nbre Total de Dépôts','NbrTotalDepot',13),(29,2,'Montant Total des Dépôts','MontantTotalDepot',14),(30,3,'Institution','Institution',1),(31,3,'Secteur ','Secteur',2),(32,3,'Trimestre','Trimestre',3),(33,3,'Année','Annee',4),(34,3,'Région','Region',5),(35,3,'Nbre de Prêts Octroyés aux Femmes','nbrFemme',6),(36,3,'Nbre de Prêts Octroyés aux Hommes','nbrhomme',7),(37,3,'Nbre de Prêts Octroyés aux PMEs','nbrPME',8),(38,3,'Montant des Prêts Octroyés aux Femmes','montantFemme',9),(39,3,'Montant des Prêts Octroyés aux Hommes','montanthomme',10),(40,3,'Montant des Prêts Octroyés aux PMEs','montantPME',11),(41,3,'Nbre Total de Prêts Octroyés','nombretotal',12),(42,3,'Montant Total des Prêts Octroyés','montanttotal',13),(43,4,'Institution','Institution',1),(44,4,'Secteur ','Secteur',2),(45,4,'Trimestre','Trimestre',3),(46,4,'Année','Annee',4),(47,4,'Région','Region',5),(48,4,'Total des Effectifs','TotalEffectifs',6),(49,4,'% Effectif Femme','PourcEffectif',7),(50,4,'Agents de Credit','AgentsCredit',8),(51,4,'% Agents de Credit Femme','PourcFemme',9),(52,5,'Institution','Institution',1),(53,5,'Secteur ','Secteur',2),(54,5,'Trimestre','Trimestre',3),(55,5,'Année','Annee',4),(56,5,'Région','Region',5),(57,5,'Nbre de Clients Hommes','NbrHomme',6),(58,5,'Nbre de Femmes','NbrFemme',7),(59,5,'Nbre de PMEs Clientes (personnes morales)','NbrPme',8),(60,5,'Nbre d\'Associations ou Groupements de Femmes','NbrGroupeAss',9),(61,5,'Nbre d\'Hommes Emprunteurs','NbrGroupeHomme',10),(62,5,'Nbre de Femmes Emprunteuses','NbrGroupeFemme',11),(63,5,'Nbre de PMEs Emprunteuses','empActifMorale',12),(64,6,'Institution','Institution',1),(65,6,'Secteur ','Secteur',2),(66,6,'Trimestre','Trimestre',3),(67,6,'Année','Annee',4),(68,6,'Région (ou se trouve l\'agent detaillant)','region',5),(69,6,'Nbre de Clients Enregistres','nbrClient',6),(70,6,'Nbre de Clients Homes Enregistres','nombreHomme',7),(71,6,'Nbre de Clientes Enregistrees','nombreFemme',8),(72,6,'Encours de ME','encoursME',9),(73,6,'Nbre de Transactions sur la Periode','nbrTransactionsParPeriode',10),(74,6,'Montant Total des Transactions sur la Periode','montantTotalTransaction',11),(75,6,'Nbre de comptes de ME Ouverts sur la Periode','nbrCompteEmeOuvert',12),(76,6,'Nbre de Comptes de ME Actifs','nbrCompteActif',13),(77,6,'Nbre de Comptes de ME Inactifs','nbrCompteInactif',14),(78,6,'Nbre de Reclamations et Oppositions','reclammationEtOpposition',15),(79,7,'Institution','Institution',1),(80,7,'Secteur ','Secteur',2),(81,7,'Trimestre','Trimestre',3),(82,7,'Année','Année',4),(83,7,'Région','Région',5),(84,7,'Nbre de Souscripteurs Hommes','nombreHomme',6),(85,7,'Nbre de Souscripteurs Femmes','nombreFemme',7),(86,7,'Nbre de Souscripteurs \"Personnes Morales\"','personneMorale',8),(87,7,'Nbre de Polices d\'Assurance','nomPoliceAssurance',9),(88,7,'Montant du Capital Garanti','montantCapital',10),(89,7,'Nbre d\'Indemnisations','nbSouscripteur',11),(90,7,'Montant Total des Indemnisations','montantNbSouscripteur',12);
/*!40000 ALTER TABLE `cnfi_menuotachamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_octroiactivite`
--

DROP TABLE IF EXISTS `cnfi_octroiactivite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_octroiactivite` (
  `octroiActivite_id` int(11) NOT NULL AUTO_INCREMENT,
  `octroiActivite_type` int(11) DEFAULT NULL,
  `octroiActivite_produitId` int(11) DEFAULT NULL,
  `octroiActivite_regionId` int(11) DEFAULT NULL,
  `octroiActivite_typeCreditId` int(11) DEFAULT NULL,
  `octroiActivite_nombre` int(11) DEFAULT NULL,
  `octroiActivite_montant` double DEFAULT NULL,
  PRIMARY KEY (`octroiActivite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=920 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_octroiactivite`
--

LOCK TABLES `cnfi_octroiactivite` WRITE;
/*!40000 ALTER TABLE `cnfi_octroiactivite` DISABLE KEYS */;
INSERT INTO `cnfi_octroiactivite` VALUES (10,1,3,1,1,11,5540000),(11,1,3,1,2,24,13200000),(12,1,3,1,3,0,0),(13,1,3,1,4,94,63850000),(14,1,3,1,5,0,0),(15,1,3,1,6,0,0),(16,1,3,1,7,61,48820000),(17,1,3,1,8,0,0),(18,1,3,1,9,10,3670000),(19,2,3,1,1,0,0),(20,3,3,1,1,28,22050000),(21,3,3,1,2,172,113030000),(102,1,5,0,0,0,0),(103,2,5,0,0,0,0),(104,3,5,0,0,0,0),(115,1,6,14,4,267,103904000),(116,2,6,0,0,0,0),(117,3,6,14,1,44,15897000),(118,3,6,14,2,223,88007000),(119,1,7,1,1,6,2050000),(120,1,7,1,2,21,8270000),(121,1,7,1,4,66,44780000),(122,1,7,1,6,3,1050000),(123,1,7,1,7,64,46700000),(124,1,7,1,9,4,2100000),(125,2,7,1,1,164,104950000),(126,3,7,1,1,18,11050000),(127,3,7,1,2,146,93900000),(171,1,8,4,1,2684,1297528000),(172,1,8,4,2,147,62830000),(173,1,8,4,4,735,482034000),(174,1,8,4,9,340,83210000),(175,1,8,3,1,713,260177000),(176,1,8,3,2,66,17790000),(177,1,8,3,4,281,112163000),(178,1,8,3,9,110,21512000),(179,1,8,5,1,46,16360000),(180,1,8,5,9,1,200000),(181,2,8,4,2,3906,1925602000),(182,3,8,4,2,2535,1323405000),(183,3,8,4,1,1371,602197000),(184,3,8,3,2,973,336588000),(185,3,8,3,1,197,75054000),(186,3,8,5,2,21,8680000),(187,3,8,5,1,26,7880000),(193,2,8,3,2,1170,411642000),(194,2,8,5,2,47,16560000),(204,1,10,4,1,2574,1372056000),(205,2,10,4,2,3602,2006716000),(206,3,10,4,2,2355,1364705000),(285,1,10,4,2,142,65670000),(286,1,10,4,4,858,550360000),(287,1,10,4,9,28,18630000),(288,1,10,3,1,495,196557000),(289,1,10,3,2,9,2340000),(290,1,10,3,4,267,109301000),(291,1,10,3,9,1,200000),(292,1,10,5,1,30,16220000),(293,1,10,5,4,4,2690000),(294,2,10,3,2,772,308398000),(295,2,10,5,2,34,18910000),(296,3,10,4,1,1247,642011000),(297,3,10,3,2,630,244353000),(298,3,10,3,1,142,64045000),(299,3,10,5,2,20,10210000),(300,3,10,5,1,14,8700000),(301,1,11,21,1,140,205504000),(302,2,11,21,1,316,2454090000),(303,3,11,21,1,760,3571880000),(378,1,12,1,4,61,5940000),(379,2,12,1,2,61,5940000),(380,3,12,1,1,19,1380000),(381,3,12,1,2,42,4560000),(385,1,13,1,1,45,40900000),(386,2,13,1,2,532,575360000),(387,3,13,1,1,141,181260000),(402,1,13,1,2,19,15250000),(403,1,13,1,4,299,273850000),(404,1,13,1,5,9,21300000),(405,1,13,1,6,17,27400000),(406,1,13,1,7,48,96100000),(407,1,13,1,8,95,100560000),(408,3,13,1,2,391,394100000),(412,1,14,0,0,0,0),(413,2,14,0,0,0,0),(414,3,14,0,0,0,0),(502,1,15,4,1,1800,1029354000),(503,1,15,4,2,109,60400000),(504,1,15,4,4,505,356910000),(505,1,15,4,9,11,5320000),(506,1,15,3,1,398,195395000),(507,1,15,3,2,11,4640000),(508,1,15,3,4,232,112240000),(509,1,15,3,9,1,400000),(510,1,15,5,1,25,10590000),(511,1,15,5,4,2,700000),(512,2,15,4,2,2425,1451984000),(513,2,15,3,2,642,312675000),(514,2,15,5,2,27,11290000),(515,3,15,4,1,868,492290000),(516,3,15,4,2,1557,959694000),(517,3,15,3,1,117,56725000),(518,3,15,3,2,525,255950000),(519,3,15,5,1,11,4700000),(520,3,15,5,2,16,6590000),(527,1,16,0,0,0,0),(528,2,16,0,0,0,0),(529,3,16,0,0,0,0),(552,1,17,4,9,9,2472000),(553,2,17,4,2,9,2472000),(554,3,17,4,2,5,1384000),(555,3,17,4,1,4,1088000),(562,1,18,0,0,0,0),(563,2,18,0,0,0,0),(564,3,18,0,0,0,0),(613,1,11,21,4,1514,5289900000),(614,1,11,21,5,80,1140300000),(615,1,11,21,6,29,385200000),(616,1,11,21,7,208,2682050000),(617,1,11,21,8,453,938150000),(618,1,11,16,1,1,600000),(619,1,11,16,8,6,104600000),(620,1,11,16,6,1,8000000),(621,1,11,16,7,3,30200000),(622,1,11,16,8,4,2500000),(623,2,11,21,2,2313,7961886000),(624,2,11,16,1,1,3600000),(625,2,11,16,2,28,80300000),(626,3,11,21,2,1869,6844096000),(627,3,11,16,1,19,70800000),(628,3,11,16,2,10,13100000),(635,1,21,19,1,1964,713245456),(636,2,21,0,0,0,0),(637,3,21,0,0,0,0),(819,1,21,19,4,1561,417387984),(820,1,21,19,5,19,126253100),(821,1,21,19,7,4,9380360),(822,1,21,19,9,17,25505100),(823,1,21,7,1,2250,1330000000),(824,1,21,7,4,69,265680826),(825,1,21,8,1,650,150000000),(826,1,21,8,4,278,58950500),(827,1,21,5,1,479,240500000),(828,1,21,5,4,63,37418974),(829,1,21,13,1,472,220000000),(830,1,21,13,4,284,271250000),(831,1,21,13,5,2,24000000),(832,1,21,13,9,6,10850000),(833,1,21,14,1,709,298302100),(834,1,21,14,4,119,73247900),(835,1,21,14,9,16,2500000),(836,1,21,12,1,1504,316500000),(837,1,21,12,4,1491,571860000),(838,1,21,2,1,1057,166431000),(839,1,21,2,4,7,22400000),(840,2,21,0,0,0,0),(841,2,21,0,0,0,0),(842,2,21,0,0,0,0),(843,2,21,0,0,0,0),(844,2,21,0,0,0,0),(845,2,21,0,0,0,0),(846,2,21,0,0,0,0),(847,2,21,0,0,0,0),(848,2,21,0,0,0,0),(849,2,21,0,0,0,0),(850,2,21,0,0,0,0),(851,2,21,0,0,0,0),(852,2,21,0,0,0,0),(853,2,21,0,0,0,0),(854,3,21,0,0,0,0),(855,3,21,0,0,0,0),(856,3,21,0,0,0,0),(857,3,21,0,0,0,0),(858,3,21,0,0,0,0),(859,3,21,0,0,0,0),(860,3,21,0,0,0,0),(861,3,21,0,0,0,0),(862,3,21,0,0,0,0),(863,3,21,0,0,0,0),(864,3,21,0,0,0,0),(865,3,21,0,0,0,0),(866,3,21,0,0,0,0),(867,3,21,0,0,0,0),(877,1,22,0,0,0,0),(878,2,22,0,0,0,0),(879,3,22,0,0,0,0),(880,1,23,0,0,0,0),(881,2,23,0,0,0,0),(882,3,23,0,0,0,0),(883,1,24,0,0,0,0),(884,2,24,0,0,0,0),(885,3,24,0,0,0,0),(886,1,25,0,0,0,0),(887,2,25,0,0,0,0),(888,3,25,0,0,0,0),(889,1,26,0,0,0,0),(890,2,26,0,0,0,0),(891,3,26,0,0,0,0),(892,1,27,1,1,11,5540000),(893,1,27,1,2,24,13200000),(894,1,27,1,4,94,63850000),(895,1,27,1,7,61,48820000),(896,1,27,1,9,10,3670000),(897,1,27,1,0,0,0),(898,2,27,1,2,200,135080000),(899,3,27,1,1,28,22050000),(900,3,27,1,2,172,113030000),(901,1,28,1,1,11,5540000),(902,1,28,1,2,24,13200000),(903,1,28,1,4,94,63850000),(904,1,28,1,7,61,48820000),(905,1,28,1,9,10,3670000),(906,2,28,1,2,200,135080000),(907,3,28,1,1,28,22050000),(908,3,28,1,2,172,113030000),(909,1,29,1,1,11,5540000),(910,1,29,1,2,24,13200000),(911,1,29,1,4,94,63850000),(912,1,29,1,7,61,48820000),(913,1,29,1,9,10,3670000),(914,2,29,1,2,200,135080000),(915,3,29,1,1,28,22050000),(916,3,29,1,2,172,113030000),(917,1,30,0,0,0,0),(918,2,30,0,0,0,0),(919,3,30,0,0,0,0);
/*!40000 ALTER TABLE `cnfi_octroiactivite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_parametre`
--

DROP TABLE IF EXISTS `cnfi_parametre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_parametre` (
  `parametre_id` int(11) NOT NULL AUTO_INCREMENT,
  `parametre_nom` varchar(255) DEFAULT NULL,
  `parametre_table` varchar(255) DEFAULT NULL,
  `parametre_activation` varchar(255) DEFAULT NULL,
  `parametre_hash` varchar(255) DEFAULT NULL,
  `parametre_color` varchar(255) DEFAULT NULL,
  `parametre_affiche` int(1) DEFAULT '1',
  PRIMARY KEY (`parametre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_parametre`
--

LOCK TABLES `cnfi_parametre` WRITE;
/*!40000 ALTER TABLE `cnfi_parametre` DISABLE KEYS */;
INSERT INTO `cnfi_parametre` VALUES (1,'Type de crédit','cnfi_typecredit','-27','type-de-credit','text-blue',1),(2,'Type d\'epargne','cnfi_typeepargne','-28','type-d-epargne','text-red',1),(3,'Type de service financier','cnfi_typeservicefin','-29','type-de-service-financier','text-green',1),(4,'Type de sergice non financier','cnfi_typeservicenonfin','-30','type-de-service-non-financier','text-yellow',1),(6,'Type d\'assurance','cnfi_typeassurance','-32','type-d-assurance','text-magenta',1),(8,'Type de pension','cnfi_typerepartition','-34','type-de-repartition-detaille','text-purple',1),(9,'Type Autres','cnfi_TypeaccidentMaladie','-35','type-autres','text-blue',1),(10,'Type secteur privé','cnfi_typeSecteurPrive','-36','type-secteur-prive','text-narrow',1),(14,'Type de Zone IMF','cnfi_typezone','-31','type-de-zone',NULL,0),(15,'Type de Zone Assurance','cnfi_typezoneassurance','-33','type-de-zone-assurance',NULL,0),(16,'Type de Zone CNAPS','cnfi_typezonecnaps','-37','type-de-zone-cnaps',NULL,0),(17,'Type de Zone CEM','cnfi_typezonecem','-38','type-de-zone-cem',NULL,0),(18,'Type de Zone POSTE','cnfi_typezoneposte','-39','type-de-zone-poste',NULL,0),(20,'Type Poste (Produit et service)','cnfi_typeposte','-40','type-poste','text-blue',1),(21,'Type de Zone EME','cnfi_typeZoneEme','-41','type-de-zone-eme','text-red',0);
/*!40000 ALTER TABLE `cnfi_parametre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_poactivite`
--

DROP TABLE IF EXISTS `cnfi_poactivite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_poactivite` (
  `poActivite_id` int(11) NOT NULL AUTO_INCREMENT,
  `poActivite_produitId` int(11) DEFAULT NULL,
  `poActivite_typeActiviteId` int(11) DEFAULT NULL,
  `poActivite_nomEtablissement` text,
  `poActivite_regionId` int(11) DEFAULT NULL,
  `poActivite_nbrTransactions` int(11) DEFAULT NULL,
  `poActivite_montantTotal` double DEFAULT NULL,
  `poActivite_montantMoyen` double DEFAULT NULL,
  `poActivite_stratificationPme` text,
  `poActivite_stratificationParGenre` text,
  `poActivite_typeEpargne` tinytext,
  `poActivite_nbrEpargant` tinytext,
  `poActivite_nbCompteEpargne` int(11) DEFAULT NULL,
  `poActivite_typeCompteCourant` tinytext,
  `poActivite_nbrClient` int(11) DEFAULT NULL,
  PRIMARY KEY (`poActivite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_poactivite`
--

LOCK TABLES `cnfi_poactivite` WRITE;
/*!40000 ALTER TABLE `cnfi_poactivite` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_poactivite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_poassurance`
--

DROP TABLE IF EXISTS `cnfi_poassurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_poassurance` (
  `poAssurance_id` int(11) NOT NULL AUTO_INCREMENT,
  `poAssurance_produitId` int(11) DEFAULT NULL,
  `poAssurance_denomination` text,
  `poAssurance_typeAssuranceId` int(11) DEFAULT NULL,
  `poAssurance_type` text,
  `poAssurance_cible` varchar(255) DEFAULT NULL,
  `poAssurance_cibleBeneficiaire` varchar(255) DEFAULT NULL,
  `poAssurance_primeAnuelle` double DEFAULT NULL,
  `poAssurance_montantFranchise` double DEFAULT NULL,
  `poAssurance_dureeMinSouscr` int(11) DEFAULT NULL,
  `poAssurance_capiatlGarantieMin` double DEFAULT NULL,
  `poAssurance_ageLimAssurer` int(11) DEFAULT NULL,
  `poAssurance_autresConditions` text,
  `poAssurance_documentsExiges` text,
  `poAssurance_capitalEnCoursCredit` double DEFAULT NULL,
  `poAssurance_montantLimiteCredit` double DEFAULT NULL,
  `poAssurance_couvertureObligatoire` varchar(255) DEFAULT NULL,
  `poAssurance_montantMaxCouverture` double DEFAULT NULL,
  `poAssurance_capitalGarantieMax` double DEFAULT NULL,
  `poAssurance_conditionAccesAssurance` text,
  `poAssurance_conditionExclusion` text,
  PRIMARY KEY (`poAssurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_poassurance`
--

LOCK TABLES `cnfi_poassurance` WRITE;
/*!40000 ALTER TABLE `cnfi_poassurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_poassurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_poposte`
--

DROP TABLE IF EXISTS `cnfi_poposte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_poposte` (
  `poPoste_id` int(11) NOT NULL AUTO_INCREMENT,
  `poPoste_produitId` int(11) DEFAULT NULL,
  `poPoste_typePosteId` int(11) DEFAULT NULL,
  `poPoste_denomination` text,
  `poPoste_type` int(11) DEFAULT NULL,
  `poPoste_reseauUtilise` text,
  `poPoste_partenaire` text,
  `poPoste_cible` text,
  `poPoste_finaliteTransfert` text,
  `poPoste_conditionAcces` text,
  `poPoste_documentsExiges` text,
  `poPoste_montantMin` double DEFAULT NULL,
  `poPoste_tauxInteret` double DEFAULT NULL,
  `poPoste_dureeMin` text,
  PRIMARY KEY (`poPoste_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_poposte`
--

LOCK TABLES `cnfi_poposte` WRITE;
/*!40000 ALTER TABLE `cnfi_poposte` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_poposte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_portefeuille`
--

DROP TABLE IF EXISTS `cnfi_portefeuille`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_portefeuille` (
  `porteFeuille_id` int(11) NOT NULL AUTO_INCREMENT,
  `porteFeuille_produitId` int(11) DEFAULT NULL,
  `porteFeuille_regionId` int(11) DEFAULT NULL,
  `porteFeuille_totalEncoursCredit` double DEFAULT NULL,
  `porteFeuille_encoursCreditSain` double DEFAULT NULL,
  `porteFeuille_encoursCreditEnRetard` double DEFAULT NULL,
  `porteFeuille_aRisque30` double DEFAULT NULL,
  `porteFeuille_aRisque90` double DEFAULT NULL,
  PRIMARY KEY (`porteFeuille_id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_portefeuille`
--

LOCK TABLES `cnfi_portefeuille` WRITE;
/*!40000 ALTER TABLE `cnfi_portefeuille` DISABLE KEYS */;
INSERT INTO `cnfi_portefeuille` VALUES (4,3,1,229913258,172945969,56967289,43556156,13411133),(21,5,0,0,0,0,0,0),(25,6,14,135033120,121291040,11912730,3479290,8433440),(26,7,1,195077589.06,125983008.52,69094580.54,68852573.98,30574237.66),(36,8,4,4393237728,2911263030,1481974698,305013238,274748178),(37,8,3,643663910,543263470,100400440,15363860,11938740),(38,8,5,70250520,36058640,34191880,3347930,2756290),(43,10,4,4512871834,2725381620,1787490214,179044250,61414930),(48,10,3,653535510,501375830,152159680,18249450,5991140),(49,10,5,67040850,31200500,35840350,2865720,2592400),(50,11,21,33116368566.21,31732372025.21,1383996541,1140044133,833408404),(70,12,1,138346675,30742450,107604225,47383750,60220475),(72,13,1,994972545,898749375,96223170,47923993,29548631),(75,13,3,93017400,75374620,17642780,10574787,7996000),(77,14,0,0,0,0,0,0),(93,15,4,4091985941,2231549910,1860436031,740138659,390496042),(94,15,3,625132420,512505690,112626730,42713290,20590580),(95,15,5,53574247,24875550,28698697,18536667,5285380),(98,16,0,0,0,0,0,0),(105,17,4,171046045,154481045,16565000,1160969,1123443),(108,18,0,0,0,0,0,0),(112,11,16,335234919,328386521,6848398,6848398,6583862),(115,21,19,1741199516,1311247885,429951631,103104130,168020765),(130,21,7,1346855639,1259570634,87285005,49752453,68955154),(131,21,8,96757270,93854552,2902718,667625,2118984),(132,21,5,95979954,94060355,1919599,921408,1554875),(133,21,13,642084271,592348184,49736087,20518800,33365200),(134,21,14,477665741,334366019,143299722,0,0),(140,22,0,0,0,0,0,0),(141,23,0,0,0,0,0,0),(142,24,0,0,0,0,0,0),(143,25,0,0,0,0,0,0),(144,26,0,0,0,0,0,0),(145,27,1,22991325790,17294596810,5696728980,4355615579,2814876985),(146,28,1,22991325790,17294596810,5696728980,4355615579,2814876985),(147,29,1,22991325790,17294596810,5696728980,4355615579,2814876985),(148,30,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cnfi_portefeuille` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_produit`
--

DROP TABLE IF EXISTS `cnfi_produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_produit` (
  `produit_id` int(11) NOT NULL AUTO_INCREMENT,
  `produit_typeId` int(11) DEFAULT NULL,
  `produit_entiteId` int(11) DEFAULT NULL,
  `produit_trimestreId` int(11) DEFAULT NULL,
  `produit_annee` int(4) DEFAULT NULL,
  `produit_dateSoumission` date DEFAULT NULL,
  `produit_dateValidation` date DEFAULT NULL,
  `produit_typeSpoId` varchar(255) DEFAULT NULL,
  `produit_typePoAssuranceId` varchar(255) DEFAULT NULL,
  `produit_typePoPosteId` varchar(255) DEFAULT NULL,
  `produit_nonFinancierType` int(11) DEFAULT NULL,
  `produit_nbrBeneficiaire` int(11) DEFAULT NULL,
  `produit_nbrNonBeneficiaire` int(11) DEFAULT NULL,
  `produit_location` text,
  `produit_mutuelleSante` text,
  `produit_statutServiceTypeId` varchar(255) DEFAULT NULL,
  `produit_typeServiceExistantEmeId` text,
  PRIMARY KEY (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_produit`
--

LOCK TABLES `cnfi_produit` WRITE;
/*!40000 ALTER TABLE `cnfi_produit` DISABLE KEYS */;
INSERT INTO `cnfi_produit` VALUES (3,1,21,4,2019,NULL,NULL,'1-4',NULL,NULL,0,400,3,'','',NULL,NULL),(5,1,25,1,2020,NULL,NULL,'1',NULL,NULL,0,0,0,'','',NULL,NULL),(6,1,9,4,2019,NULL,NULL,'1-3-4',NULL,NULL,0,264,113,'','803','4',NULL),(7,1,21,1,2020,NULL,NULL,'1-4',NULL,NULL,0,244,0,'','',NULL,NULL),(8,1,12,4,2019,NULL,NULL,'1',NULL,NULL,0,0,0,'','',NULL,NULL),(10,1,12,1,2020,NULL,NULL,'1',NULL,NULL,0,0,0,'','',NULL,NULL),(11,1,17,4,2019,NULL,NULL,'1-2-3',NULL,NULL,0,0,0,'','','3',NULL),(12,1,7,1,2020,NULL,NULL,'1-2-3-4',NULL,NULL,0,0,0,'','','1',NULL),(13,1,2,4,2019,NULL,NULL,'1-3-4',NULL,NULL,0,50,95,'','392',NULL,NULL),(14,3,37,4,2019,NULL,NULL,'1-2-3',NULL,NULL,0,0,0,'','',NULL,NULL),(15,1,12,2,2020,NULL,NULL,'1',NULL,NULL,0,0,0,'','',NULL,NULL),(16,1,25,1,2020,NULL,NULL,'1',NULL,NULL,0,0,0,'','',NULL,NULL),(17,1,25,1,2020,NULL,NULL,'1',NULL,NULL,0,0,0,'','',NULL,NULL),(18,1,25,2,2020,NULL,NULL,'1',NULL,NULL,0,0,0,'','',NULL,NULL),(21,1,26,4,2019,'2001-01-01',NULL,'1-2-3',NULL,NULL,0,0,0,'','',NULL,NULL),(22,1,18,4,2019,NULL,NULL,'1-2',NULL,NULL,0,0,0,'','',NULL,NULL),(23,3,37,1,2020,NULL,NULL,'1-2-3',NULL,NULL,0,0,0,'','',NULL,NULL),(24,1,24,4,2019,'2020-08-28',NULL,NULL,NULL,NULL,0,0,0,'','',NULL,NULL),(25,1,24,4,2019,'2020-08-28',NULL,NULL,NULL,NULL,0,0,0,'','',NULL,NULL),(26,1,24,4,2019,'2020-08-28',NULL,NULL,NULL,NULL,0,0,0,'','',NULL,NULL),(27,1,21,4,2019,'2020-09-09','2020-09-09','1-4',NULL,NULL,0,400,3,'','',NULL,NULL),(28,1,21,4,2019,'2020-09-09',NULL,'1-4',NULL,NULL,0,400,3,'','',NULL,NULL),(29,1,21,4,2019,'2020-09-09',NULL,'1-4',NULL,NULL,0,400,3,'','',NULL,NULL),(30,1,20,4,2019,'2020-09-11',NULL,'1-2-3',NULL,NULL,0,0,0,'','',NULL,NULL);
/*!40000 ALTER TABLE `cnfi_produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_province`
--

DROP TABLE IF EXISTS `cnfi_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_province`
--

LOCK TABLES `cnfi_province` WRITE;
/*!40000 ALTER TABLE `cnfi_province` DISABLE KEYS */;
INSERT INTO `cnfi_province` VALUES (1,'ANTSIRANANA'),(2,'ANTANANARIVO'),(3,'TOLIARY '),(4,'FIANARANTSOA '),(5,'MAHAJANGA '),(6,'TOAMASINA  ');
/*!40000 ALTER TABLE `cnfi_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_region`
--

DROP TABLE IF EXISTS `cnfi_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_libelle` varchar(255) DEFAULT NULL,
  `region_provinceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_region`
--

LOCK TABLES `cnfi_region` WRITE;
/*!40000 ALTER TABLE `cnfi_region` DISABLE KEYS */;
INSERT INTO `cnfi_region` VALUES (1,'Analamanga',2),(2,'Bongolava',2),(3,'Itasy',2),(4,'Vakinankaratra',2),(5,'Amoron\'i Mania',4),(6,'Atsimo-Atsinanana',4),(7,'Haute Matsiatra',4),(8,'Vatovavy-Fitovinany',4),(9,'Ihorombe',4),(10,'Alaotra Mangoro',6),(11,'Analanjirofo',6),(12,'Atsinanana',6),(13,'Betsiboka',5),(14,'Boeny',5),(15,'Melaky',5),(16,'Sofia',5),(17,'Androy',3),(18,'Anosy',3),(19,'Atsimo-Andrefana',3),(20,'Menabe',3),(21,'Diana',1),(22,'Sava',1);
/*!40000 ALTER TABLE `cnfi_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_repartition`
--

DROP TABLE IF EXISTS `cnfi_repartition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_repartition` (
  `repartition_id` int(11) NOT NULL AUTO_INCREMENT,
  `repartition_produitId` int(11) DEFAULT NULL,
  `repartition_regionId` int(11) DEFAULT NULL,
  `repartition_nbrPentionner` int(11) DEFAULT NULL,
  `repartition_nbrTotalPrestataire` int(11) DEFAULT NULL,
  `repartition_nbrTravailleurs` int(11) DEFAULT NULL,
  PRIMARY KEY (`repartition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_repartition`
--

LOCK TABLES `cnfi_repartition` WRITE;
/*!40000 ALTER TABLE `cnfi_repartition` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_repartition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_repartitiondetaille`
--

DROP TABLE IF EXISTS `cnfi_repartitiondetaille`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_repartitiondetaille` (
  `produitId` int(11) DEFAULT NULL,
  `repartitionDetaille_typeRepartitionId` int(11) DEFAULT NULL,
  `repartitionDetaille_cotisationMoyMensuel` double DEFAULT NULL,
  `repartitionDetaille_nbrFemme` int(11) DEFAULT NULL,
  `repartitionDetaille_nbrHomme` int(11) DEFAULT NULL,
  `repartitionDetaille_nbrTotTravailleurs` int(11) DEFAULT NULL,
  `repartitionDetaille_pensionMoyMensuel` double DEFAULT NULL,
  `repartitionDetaille_nbrFemmePensionner` int(11) DEFAULT NULL,
  `repartitionDetaille_nbrHommePensionner` int(11) DEFAULT NULL,
  `repartitionDetaille_nbrTotalPensionner` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_repartitiondetaille`
--

LOCK TABLES `cnfi_repartitiondetaille` WRITE;
/*!40000 ALTER TABLE `cnfi_repartitiondetaille` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_repartitiondetaille` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_secteurprive`
--

DROP TABLE IF EXISTS `cnfi_secteurprive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_secteurprive` (
  `produitId` int(11) DEFAULT NULL,
  `secteurPrive_typeSecteurId` int(11) DEFAULT NULL,
  `secteurPrive_nombreTotTravailleur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_secteurprive`
--

LOCK TABLES `cnfi_secteurprive` WRITE;
/*!40000 ALTER TABLE `cnfi_secteurprive` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_secteurprive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_sfinancier`
--

DROP TABLE IF EXISTS `cnfi_sfinancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_sfinancier` (
  `financier_id` int(11) NOT NULL AUTO_INCREMENT,
  `financier_produitId` int(11) DEFAULT NULL,
  `financier_type` int(11) DEFAULT NULL,
  `financier_nbrTransaction` int(11) DEFAULT NULL,
  `financier_montantTransaction` double DEFAULT NULL,
  `financier_nbrClient` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`financier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_sfinancier`
--

LOCK TABLES `cnfi_sfinancier` WRITE;
/*!40000 ALTER TABLE `cnfi_sfinancier` DISABLE KEYS */;
INSERT INTO `cnfi_sfinancier` VALUES (6,3,0,0,0,''),(15,5,0,0,0,''),(19,6,0,0,0,''),(20,7,0,0,0,''),(33,8,0,0,0,''),(34,11,16,5124,1,''),(54,12,0,0,0,''),(56,13,15,363,62,'153'),(58,14,0,0,0,''),(66,15,0,0,0,''),(69,16,0,0,0,''),(76,17,0,0,0,''),(79,18,0,0,0,''),(81,11,18,322,130,''),(88,22,0,0,0,''),(89,23,0,0,0,''),(90,24,0,0,0,''),(92,26,0,0,0,''),(93,27,0,0,0,''),(94,28,0,0,0,''),(95,29,0,0,0,''),(96,30,0,0,0,'');
/*!40000 ALTER TABLE `cnfi_sfinancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_societariat`
--

DROP TABLE IF EXISTS `cnfi_societariat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_societariat` (
  `societariat_id` int(11) NOT NULL AUTO_INCREMENT,
  `societariat_produitId` int(11) DEFAULT NULL,
  `societariat_regionId` int(11) DEFAULT NULL,
  `societariat_nbrFemme` int(11) DEFAULT NULL,
  `societariat_nbrHomme` int(11) DEFAULT NULL,
  `societariat_nbrMorale` int(11) DEFAULT NULL,
  `societariat_groupFemme` int(11) DEFAULT NULL,
  `societariat_volontaireFemme` int(11) DEFAULT NULL,
  `societariat_volontaireHomme` int(11) DEFAULT NULL,
  `societariat_volontaireMorale` int(11) DEFAULT NULL,
  `societariat_empActifFemme` int(11) DEFAULT NULL,
  `societariat_empActifHomme` int(11) DEFAULT NULL,
  `societariat_empActifMorale` int(11) DEFAULT NULL,
  PRIMARY KEY (`societariat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_societariat`
--

LOCK TABLES `cnfi_societariat` WRITE;
/*!40000 ALTER TABLE `cnfi_societariat` DISABLE KEYS */;
INSERT INTO `cnfi_societariat` VALUES (4,3,1,1545,255,0,0,0,0,0,454,80,0),(13,5,0,0,0,0,0,0,0,0,0,0,0),(17,6,14,6835,1642,0,0,0,0,0,622,124,0),(18,7,1,1,263,0,0,0,0,0,416,70,0),(34,8,4,23253,11635,0,0,0,0,0,8876,4476,0),(35,8,3,2471,737,0,0,0,0,0,1768,465,0),(36,8,5,140,164,0,0,0,0,0,107,125,0),(41,10,4,25079,13096,0,0,0,0,0,8944,4506,0),(42,10,3,2730,779,0,0,0,0,0,1825,448,0),(43,10,5,146,168,0,0,0,0,0,105,118,0),(44,11,21,51783,38143,6515,1425,38621,27896,4953,5809,2786,5089),(64,12,1,1800,525,0,0,0,0,0,511,114,0),(66,13,1,903,378,0,76,0,0,0,903,378,0),(70,13,3,156,40,0,38,0,0,0,156,40,0),(72,14,0,0,0,0,0,0,0,0,0,0,0),(90,15,4,25358,13239,0,0,0,0,0,8292,4176,0),(91,15,3,2813,801,0,0,0,0,0,1604,395,0),(92,15,5,150,169,0,0,0,0,0,89,98,0),(95,16,4,564,472,4,0,0,0,0,0,0,0),(102,17,4,564,472,4,0,0,0,0,564,472,4),(105,18,4,90,64,165,0,0,0,0,90,64,164),(112,11,16,310,543,27,9,245,387,22,35,52,8),(115,21,19,6797,2655,28,146,6797,2655,28,4974,1894,0),(194,21,7,5850,4675,0,3937,4970,3065,0,3164,1919,0),(195,21,8,891,629,0,54,1203,740,0,547,397,0),(196,21,5,1002,711,0,49,2727,1053,0,531,286,0),(197,21,13,2538,3247,0,1507,2538,3247,0,1133,792,0),(198,21,14,1145,1702,0,595,1145,1702,0,493,469,0),(199,21,12,4500,1584,0,917,4500,1584,0,2094,761,0),(200,21,2,317,403,3,134,11,13,88,211,187,0),(204,22,0,0,0,0,0,0,0,0,0,0,0),(205,23,10,771,730,16,0,0,0,0,0,0,0),(222,23,1,7955,7192,551,0,0,0,0,0,0,0),(223,23,12,2248,1903,18,0,0,0,0,0,0,0),(224,23,19,693,456,86,0,0,0,0,0,0,0),(225,23,14,1598,1249,13,0,0,0,0,0,0,0),(226,23,21,3629,2844,4,0,0,0,0,0,0,0),(227,23,7,1077,1107,85,0,0,0,0,0,0,0),(228,23,22,1804,1718,192,0,0,0,0,0,0,0),(229,23,4,1182,1208,47,0,0,0,0,0,0,0),(230,24,0,0,0,0,0,0,0,0,0,0,0),(231,25,0,0,0,0,0,0,0,0,0,0,0),(232,26,0,0,0,0,0,0,0,0,0,0,0),(233,27,0,1545,255,0,0,0,0,0,454,80,0),(234,28,1,1545,255,0,0,0,0,0,454,80,0),(235,29,1,1545,255,0,0,0,0,0,454,80,0),(236,30,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cnfi_societariat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_societariatassurance`
--

DROP TABLE IF EXISTS `cnfi_societariatassurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_societariatassurance` (
  `societariatAssurance_id` int(11) NOT NULL AUTO_INCREMENT,
  `societariatAssurance_produitId` int(11) DEFAULT NULL,
  `societariatAssurance_nomEntrePrise` text,
  `societariatAssurance_regionId` int(11) DEFAULT NULL,
  `societariatAssurance_districtId` int(11) DEFAULT NULL,
  `societariatAssurance_communeId` int(11) DEFAULT NULL,
  `societariatAssurance_nombreHomme` int(11) DEFAULT NULL,
  `societariatAssurance_nombreFemme` int(11) DEFAULT NULL,
  `societariatAssurance_personneMorale` int(11) DEFAULT NULL,
  `societariatAssurance_nombreMorale` int(11) DEFAULT NULL,
  `societariatAssurance_nbrClient` int(11) DEFAULT NULL,
  `societariatAssurance_nouveauClient` int(11) DEFAULT NULL,
  PRIMARY KEY (`societariatAssurance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_societariatassurance`
--

LOCK TABLES `cnfi_societariatassurance` WRITE;
/*!40000 ALTER TABLE `cnfi_societariatassurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfi_societariatassurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_spocredit`
--

DROP TABLE IF EXISTS `cnfi_spocredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_spocredit` (
  `spoCredit_id` int(11) NOT NULL AUTO_INCREMENT,
  `spo_produitId` int(11) DEFAULT NULL,
  `spoCredit_denomination` text,
  `spoCredit_typeCreditId` int(11) DEFAULT NULL,
  `spoCredit_cible` text,
  `spoCredit_taux` text,
  `spoCredit_degressif` text,
  `spoCredit_duree` text,
  `spoCredit_montant` double DEFAULT NULL,
  `spoCredit_montantMax` double DEFAULT NULL,
  `spoCredit_condition` text,
  `spoCredit_document` text,
  `spoCredit_garantie` text,
  PRIMARY KEY (`spoCredit_id`),
  KEY `FK_cnfi_spocredit` (`spo_produitId`),
  CONSTRAINT `FK_cnfi_spocredit` FOREIGN KEY (`spo_produitId`) REFERENCES `cnfi_produit` (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_spocredit`
--

LOCK TABLES `cnfi_spocredit` WRITE;
/*!40000 ALTER TABLE `cnfi_spocredit` DISABLE KEYS */;
INSERT INTO `cnfi_spocredit` VALUES (4,7,'-	Crédit de Fonctionnemnt  -	Crédit d’Investissement  -	Crédit à la consommation ',NULL,'Personnes Vulnérables,	Pauvre ou Indigent Actif particuliers','Crédit de Fonctionnement : 2%, Crédit d’Investissement : 2.5%;	Crédit de consommation : 3%','Linéaire','-	Crédit de Fonctionnemnt : 3 à 6 mois -	Crédit d’Investissement : 3 à 12 mois la durée maximal -	Crédit à la consommation : 3 à 12 mois la durée',30000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(40,8,'Crédits Productifs',NULL,'Personne vivant en dessous de 2 dollars par jour par personne et par famille et répondant à notre outil de catégorisation sociale','3% mensuel','Linéaire','Moyenne 7 mois et 12 mois au maximum',180000,6000000,'Personne physique Doit suivre une réunion d\'Information (RIF) concernant Vahatra. 21 à 60 ans Ayant un revenu de moins de 2 dollar par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra.  N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(41,8,'Crédits sociaux',NULL,'Personne vivant en dessous de 2 dollars par jour par personne et par famille et répondant à notre outil de catégorisation sociale','3% mensuel','Linéaire','10 mois',180000,720000,'Personne physique Doit suivre une réunion d\'Information (RIF) concernant Vahatra. 21 à 60 ans Ayant un revenu de moins de 2 dollar par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra.  N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(42,8,'Crédit à la scolarisation',NULL,'Crédit destiné au financement de la scolarisation des enfants','3% mensuel','Linéaire','10 mois',180000,720000,'Personne physique Doit suivre une réunion d\'Information (RIF) concernant Vahatra. 21 à 60 ans Ayant un revenu de moins de 2 dollar par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra.  N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(43,8,'Crédit à la formation',NULL,'Crédit destiné au financement de la formation professionnelle','3% mensuel','Linéaire','10 mois',360000,720000,'Personne physique Doit suivre une réunion d\'Information (RIF) concernant Vahatra. 21 à 60 ans Ayant un revenu de moins de 2 dollar par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra.  N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(44,8,'Crédit Association',NULL,'Crédit destiné à finacer les associations partenaires de Vahatra','3% mensuel','Linéaire','10 mois',3000000,3000000,'Personne physique Doit suivre une réunion d\'Information (RIF) concernant Vahatra. 21 à 60 ans Ayant un revenu de moins de 2 dollar par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra.  N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(45,18,'GCV',NULL,'Groupement ','2,5%','Linéaire','6 Mois',450000,24000000,'','',''),(46,18,'Equipement Solaire',NULL,'Individuel','2,5%','Linéaire','6 Mois',200000,3000000,'','',''),(47,18,'Cheptel/Elevage',NULL,'Individuel','2,5%','Linéaire','6 Mois',150000,3000000,'','',''),(48,18,'Intrant Agri',NULL,'Individuel','2,5%','Linéaire','6 Mois',150000,3000000,'','',''),(49,18,'LVM Bike to School',NULL,'Individuel','2,5%','Dégressif','6 Mois',90000,90000,'','',''),(50,18,'LVM Vélo pour tous',NULL,'Individuel','2,5%','Dégressif','6-10 %ois',200000,3000000,'','',''),(51,18,'Mat-Agri',NULL,'Individuel','2,5%','Linéaire','6 Mois',100000,3000000,'','',''),(52,18,'Scolaire',NULL,'Individuel','2,5%','Linéaire','6 Mois',100000,100000,'','',''),(71,6,'Prêts d’amorçage (PA)',NULL,'Commercant, PME formelles, PME informelles,Individu','3%','Linéaire','5mois-12mois',10000,799999,'-Familles vulnérables -pas de prêts Ailleurs(Banque,IMF,Mobile Banking)  -Dossiers de demande  de prêt complets','-Certificat de Résidence moins de 3mois -Photocopie CIN -Plan d’accés  -Devis  -3 photos récentss -1 photo de chaque membre de la famille','Pas de garantie'),(72,6,'Prêts  de Croissance (PC)',NULL,'Commercant, PME formelles, PME informelles,Individu','2.5%','Linéaire','7mois-12 mois',800000,5000000,'- Ayant des Prêts successifs   à partir  de 3ème cycle chez Mampita  -Familles vulnérables -pas de prêts Ailleurs(Banque,IMF,Mobile Banking)  - Dossiers de demande  de prêt complets','-Certificat de Résidence moins de 3mois -Photocopie CIN -Plan d’accés  -Devis  -3 photos récentss -1 photo de chaque membre de la famille','Pas de garantie '),(73,6,'Premier Prêts avec Garant (PG1)',NULL,'Commercant, PME formelles, PME informelles,Individu','2.75%','Linéaire','6mois-12 mois',350000,799999,'-Familles vulnérables -pas de prêts Ailleurs(Banque,IMF,Mobile Banking)  - Dossiers de demande  de prêt complets','-Certificat de Résidence moins de 3mois -Photocopie CIN -Plan d’accés  -Devis  -3 photos récentss -1 photo de chaque membre de la famille','Un garant moral'),(74,6,'Prêts avec Garant  Elévé (PGE)',NULL,'Commercant, PME formelles, PME informelles,Individu','2.25%','Linéaire',' 7mois-12 mois',800000,5000000,'-Familles vulnérables -pas de prêts Ailleurs(Banque,IMF,Mobile Banking)  - Dossiers de demande  de prêt complets','-Certificat de Résidence moins de 3mois -Photocopie CIN -Plan d’accés  -Devis  -3 photos récentss -1 photo de chaque membre de la famille -Certificat de Résidence moins de 3mois du garant -Photocopie CIN du garant - dernier fiche de paie du garant si salarié  -1photo récent du garant','Un garant moral'),(75,6,'Ppzéro',NULL,'Commercant, PME formelles, PME informelles,Individu','0','Linéaire','6mois-12 mois',10000,120000,'-  familles vulnérables en suivies d’accompagnement familial Chez Mampita -pas de prêts Ailleurs(Banque,IMF,Mobile Banking)  - Dossiers de demande  de prêt complets','-Certificat de Résidence moins de 3mois -Photocopie CIN -Plan d’accés  -Devis  -3 photos récentss -1 photo de chaque membre de la famille','Pas de garantie '),(76,6,'Prêt Scolaire',NULL,'Famille ayant des enfants scolarisés','1,5%','Linéaire','6mois-12 mois',10000,160000,'Ayant revenu régulier (Emploi fixe ou activité fonctionne normalement) -  familles vulnérables suivies en accompagnement familial de Mampita -pas de prêts Ailleurs(Banque,IMF,Mobile Banking)  - Dossiers de demande  de prêt complets','-Certificat de Résidence moins de 3mois -Photocopie CIN -Plan d’accés  -Devis  -3 photos récentss -1 photo de chaque membre de la famille','Pas de garantie  '),(92,15,'Crédits Productifs',NULL,'Personne vivant en dessous de 2 dollars par jour par persone et par famille et répondant à notre outil de catégorisation sociale','3% mensuel','Linéaire','Moyenne 7 mois et 12 mois au maximum',180000,6000000,'Personne physique doit survivre une réunion d\'information (RIF)concernant Vahatra. 21 à 60 ans ayant un revenu de moins de 2 dollars par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra. N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(93,15,'Crédits Sociaux',NULL,'Personne vivant en dessous de 2 dollars par jour par persone et par famille et répondant à notre outil de catégorisation sociale','3% mensuel','Linéaire','10 mois',180000,720000,'Personne physique doit survivre une réunion d\'information (RIF)concernant Vahatra. 21 à 60 ans ayant un revenu de moins de 2 dollars par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra. N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(94,15,'Crédit à la scolarisation',NULL,'Crédit destiné au financement de la scolarisation des enfants','3% mensuel','Linéaire','10 mois',180000,720000,'Personne physique doit survivre une réunion d\'information (RIF)concernant Vahatra. 21 à 60 ans ayant un revenu de moins de 2 dollars par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra. N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(95,15,'Crédit à la Formation',NULL,'Crédit destiné au financement de la formation professionnelle','3% mansuel','Linéaire','10 mois',360000,720000,'Personne physique doit survivre une réunion d\'information (RIF)concernant Vahatra. 21 à 60 ans ayant un revenu de moins de 2 dollars par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra. N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(96,15,'Crédit Association',NULL,'Crédit destiné à financer les associations partenaires de Vahatra','3% mensuel','Linéaire','10 mois',3000000,3000000,'Personne physique doit survivre une réunion d\'information (RIF)concernant Vahatra. 21 à 60 ans ayant un revenu de moins de 2 dollars par jour. Ayant un projet d\'activité. Résidé plus de 6 mois au FKT qui collabore avec Vahatra. N\'ayant pas du prêt dans d\'autres institutions.','3','1 personne garantie'),(97,11,'Crédit  consommation',NULL,'Tous les membres  OTIV particulier ','2.5%','Dégressif','60',0,0,'Membre  résident plus de 21 ans et moins de 65 ans. Avoir une capacité de remboursement. Sources de revenus justifiées. N\'inclue pas sur la liste noire de la centrale des risques.  Qualité du dossier d\'épargne et de crédit ainsi que les   garanties  suffisantes et avaliseur ','Carnet du membre, Certificat de résidence et CIN légalisée de l\'emprunteur et de l’avaliseur, photo, nantissement de garantie ou hypothèque','Minimum de dépôt de 5 % du montant sollicité et autres garanties matérielles '),(98,11,'Crédit consommation (Crédit salarial)',NULL,'Tous les membres  OTIV salariés d’un organisme (Entreprise individuelle ou Société), depuis plus de 01 an d’existence','2,5% ','Dégressif','60',0,0,'Membre  résident plus de 21 ans et moins de 65 ans, salaire domicilié à l’OTIV ou garanti à 100% par son  employeur. Avoir une capacité de remboursement. N\'inclue pas sur la liste noire de la centrale des  risques, Qualité du dossier d’épargne  et de crédit et les   garanties  suffisantes et avaliseur ','Carnet du membre, photo, Certificat de résidence et CIN légalisée de l\'emprunteur et de l\'avaliseur, Cession de salaire et engagement de l’employeur sont obligatoire, nantissement Garanties  et engagement de l\'avaliseur','Minimum de dépôt de 5 % du montant sollicité et autres garanties matérielles'),(118,12,'Credit TPME',NULL,'Commercant, artisant, …','8 à 12,5%','Linéaire','30-35j',50000,2000000,'Avoir une AGR, de nationnalité Malagasy, +21 ans, travail aux alentour de Manarintsoa','Photocopie CIN, certificat de résidence, photo d’identité','Garanties materiels, FGP'),(123,13,'INDIV',NULL,'Individu  promoteur d’activité génératrice de revenu, en milieu urbain ou rural, formel ou non','2,5% ','Linéaire','4-12 ',100000,6000000,'-	Activité licite depuis au moins 6 mois -	21 ans révolu -	Domicile dans la zone d’intervention','-	Photocopie CIN des époux et garant -	Photo d’identité des époux et garant -	Certificat de résidence des époux et garant -	Certificat d’occupation -	Photocopie NIF et STAT si il y en a','-	Mobiliers -	Voiture ou moto -	Dépôt obligatoire 10% -	Cautionnement'),(124,13,'SOL Hebdo',NULL,'Groupe de 02 ou plus de  promoteur d’activité génératrice de revenu, en milieu urbain ou rural, formel ou non (Remboursement hebdomadaire)','3% ','Linéaire','4-12 ',100000,6000000,'-	Activité licite depuis au moins 6 mois -	21 ans révolu -	Domicile dans la zone d’intervention','-	Photocopie CIN des membres et époux -	Photo d’identité des membres et époux -	Certificat de résidence des membres -	Certificat d’occupation -	Règlement Intérieur du groupe','-	Cautionnement solidaire -	Dépôt obligatoire 10%'),(125,13,'SOL 15',NULL,'Groupe de 02 ou plus de  promoteur d’activité génératrice de revenu, en milieu urbain ou rural, formel ou non (Remboursement par Quinzaine)','3%','Linéaire','4-12 ',100000,6000000,'Activité licite depuis au moins 6 mois -	21 ans révolu -	Domicile dans la zone d’intervention','Photocopie CIN des membres et époux -	Photo d’identité des membres et époux -	Certificat de résidence des membres -	Certificat d’occupation -	Règlement Intérieur du groupe','-	Cautionnement solidaire -	Dépôt obligatoire 10%'),(126,13,'LOCAT',NULL,'Individu  loueur de local d’habitation ou à usage commercial, en milieu urbain ou rural, formel ou non','2,5% ','Linéaire','4-12 ',100000,6000000,'-	Location de local depuis au moins 6 mois -	21 ans révolu -	Domicile dans la zone d’intervention','-	Photocopie CIN des époux et garant -	Photo d’identité des époux et garant -	Certificat de résidence des époux et garant -	Certificat d’occupation -	Bail de location','-	Mobiliers -	Voiture ou moto -	Dépôt obligatoire 10% -	Cautionnement'),(127,13,'CSA Classique',NULL,'Individu salarié, en milieu urbain ou rural','2,5% ','Linéaire','4-12 ',100000,6000000,'-	Employé depuis au moins 1an -	21 ans révolu -	Domicile dans la zone d’intervention','-	Photocopie CIN des époux et garant -	Photo d’identité des époux et garant -	Certificat de résidence des époux et garant -	Attestation d’emploi -	03 derniers fiches de paie','-	Mobiliers -	Voiture ou moto -	Dépôt obligatoire 10% -	Cautionnement'),(128,13,'CSA FLASH (Besoin Urgent)',NULL,'Individu salarié, en milieu urbain ou rural','3% ','Linéaire','4',100000,6000000,'-	Employé depuis au moins 1an -	21 ans révolu -	Domicile dans la zone d’intervention','-	Photocopie CIN des époux et garant -	Photo d’identité des époux et garant -	Certificat de résidence des époux et garant -	Attestation d’emploi -	03 derniers fiches de paie',''),(129,13,'CSA PRO',NULL,'Groupe de salariés d’une société, au moins 05 membres, en milieu urbain ou rural','2,5% ','Linéaire','4-12 ',100000,6000000,'-	Employés depuis au moins 1an -	21 ans révolu -	Domicile dans la zone d’intervention','CIN des membres et époux  -	Photo d’identité des  des membres et époux  -	Certificat de résidence  des  des membres et époux  -	Attestation d’emploi des membres -	03 derniers fiches de paie des membres','-	Protocole de collaboration avec la société -	Dépôt obligatoire 10%'),(130,13,'AGRI-IND',NULL,'Individu  agriculteur, en milieu rural','3,5% ','Linéaire','4-12 ',100000,6000000,'-	Activité effectuée depuis au moins 2 ans -	21 ans révolu -	Domicile dans la zone d’intervention','-	Photocopie CIN des membres et époux -	Photo d’identité des membres et époux -	Certificat de résidence des membres -	Certificat d’occupation -	Règlement Intérieur du groupe','-	Cautionnement solidaire -	Dépôt obligatoire 10%'),(131,13,'LVE',NULL,'Toute activité remunerative','2,5% ','Linéaire','4-12 ',100000,6000000,'-	Activité licite depuis au moins 6 mois -	21 ans révolu -	Domicile dans la zone d’intervention','-	Photocopie CIN des époux et garant -	Photo d’identité des époux et garant -	Certificat de résidence des époux et garant -	Certificat d’occupation -	Photocopie NIF et STAT si il y en a','-	Mobiliers -	Voiture ou moto -	Dépôt obligatoire 10% -	Cautionnement'),(139,23,'MICRO',0,'Particuliers et Commerçant en milieu urbain','2% ','Linéaire','3-12 mois',200000,6999999,'Personne physique agée de 18 ans et plus','Copie CIN legalisée mois de 3 mois et Certificat de résidence mois de 3 mois.','Matériel, véhicule ou Hypothèque'),(140,23,'TPE',0,'Particuliers et Commerçant en milieu urbain','1.85% ','Linéaire','3-24 mois',7000000,29999999,'Personne physique agée de 18 ans et plus','Copie CIN legalisée mois de 3 mois et Certificat de résidence mois de 3 mois.','Matériel, véhicule ou Hypothèque'),(141,23,'ZARASOA',0,'Fonctionnaire et salarié du secteur privé en milieu urbain','1.45% ','Linéaire','3-24 mois',0,0,'Fonctionnaire ou Salarié avec 2 ans d’anciennété','Copie CIN legalisée mois de 3 mois et Certificat de résidence mois de 3 mois, Fiche de payé de 3 derniers mois et Attestation de travail originale','Virement de salaire'),(142,23,'PERSONNEL',0,'Salarié de la SIPEM','1% ','Linéaire','3-60 mois',0,0,'Salarié confirmé','','Salaire'),(143,23,'CAH CT',0,'Commerçant et PME formelle et informelle en milieu urbain','1.65% ','Linéaire','',200000,24999999,'Personne physique agée de 18 ans et plus','Copie CIN legalisée mois de 3 mois et Certificat de résidence mois de 3 mois.','Matériel, véhicule ou Hypothèque'),(144,23,'CAH MT',0,'Commerçant et PME formelle et informelle en milieu urbain','1.65% ','Linéaire','3-36 mois',25000000,800000000,'Personne physique agée de 18 ans et plus','Copie CIN legalisée mois de 3 mois et Certificat de résidence mois de 3 mois.','Matériel, véhicule ou Hypothèque'),(145,23,'PME',0,'Commerçant et PME formelle et informelle en milieu urbain','1.75% ','Linéaire','3-24 mois',30000000,800000000,'Personne physique agée de 18 ans et plus','Copie CIN legalisée mois de 3 mois et Certificat de résidence mois de 3 mois, Patente et copie RCS','Matériel, véhicule ou Hypothèque'),(146,11,'Crédit de consommation (Crédit scolaire',NULL,'Membre particulier  devant servir à financer les frais de  la scolarisation des enfants (fournitures scolaires,  frais généraux …)','2,5% ','Dégressif','10',0,0,'Membre  résident plus de 21 ans et moins de 65 ans, Avoir une capacité de remboursement, Ne pas être sur la liste noire de la centrale des risques. Garanties suffisantes. Qualité du dossier d’épargne  et de crédit et les   garanties  suffisantes et avaliseur ','Carnet du membre, certificat de résidence, photo, CIN légalisée,  certificat de scolarité de chaque enfant est exigé  et   la photocopie de bulletins de notes de l’année, Nantissement de garantie précédente comme pièce justificative de la demande','Minimum dépôt de 5 % du montant sollicité et autres garanties matérielles'),(147,11,'Crédit consommation (Crédit universitaire)',NULL,'Membre particulier  devant servir à financer les frais de l’étude supérieure des étudiants ','2,5%','Dégressif','10',0,0,'Membre  résident plus de 21 ans et moins de 65 ans. Avoir une capacité de remboursement. N\'inclue pas sur la liste noire de la centrale des risques.  Qualité  du dossier d\'épargne et de crédit ainsi que les  garanties suffisante et avaliseur ','Carnet du membre, certificat de résidence et CIN légalisée, Le certificat de scolarité de chaque enfant est exigé  et   la photocopie de bulletins de notes de l’année précédente.','Minimum dépôt  de 5 % du montant sollicité et autres garanties matérielles'),(148,11,'Crédit consommation (Crédit dépannage)',NULL,'Membre particulier  devant servir à financer les besoins courants familiaux ou sociaux (frais médicaux, les besoins alimentaires, les articles ménagers et les fêtes traditionnelles…)','2,5%','Dégressif','12',0,0,'Membre  résident plus de 21 ans et moins de 65 ans. Avoir une capacité avérée de remboursement. Ne pas être sur la liste noire de la centrale des risques.  Qualité du dossier d\'épargne et de crédit ainsi que les  garanties suffisante et avaliseur ','Carnet du membre, certificat de résidence, CIN légalisée, photo, justification de sources de revenus, les pièces exigées selon l\'objet de dépannage (frais médicaux, les besoins alimentaires, les articles ménagers et les fêtes traditionnelles…) nantissement de garanties','Minimum de dépôt de 5 % du montant sollicité et autres garanties matérielles'),(149,11,'Crédit commercial',NULL,'Membres  commerçants pour couvrir les besoins en fonds de roulement ou  collecteurs pour financer leur collecte des marchandises ou produits locaux','2,5%','Dégressif','24',0,0,'Membre  résident plus de 21 ans et moins de 65 ans. Avoir une capacité avérée de remboursement. Ne pas être sur la liste noire de la centrale des risques.  Qualité du dossier d\'épargne et de crédit ainsi que les  garanties suffisante et avaliseur ','Carnet du membre, Certificat de résidence et CIN légalisée de l\'emprunteur et de l\'avaliseur, Carte collecteur, Patente,  engagement de l\'avaliseur et justification de sources revenus, nantissement de garanties','Minimum de dépôt de 5 % du montant sollicité et autres garanties matérielles'),(150,11,'Crédit commercial (Crédit flash)',NULL,'Les petits commerçants','2,5%','Dégressif','8',0,0,'Membre  résident plus de 21 ans et moins de 65 ans. Avoir une capacité avérée de remboursement. Ne pas être sur la liste noire de la centrale des risques.   Qualité du dossier d\'épargne et de crédit ainsi que les  garanties suffisante et avaliseur ','Carnet du membre, CIN l’égalisée et certificat de résidence, photo, Patente, justification de sources de revenus  et garanties offertes','Minimum de dépôt de 5 % du montant sollicité et autres garanties matérielles'),(151,11,'Crédit commercial (Crédit solidaire avec éducation)CSAE',NULL,'Toutes  les associations ayant effectué plusieurs cycles du CAE dans l’OTIV et qui, au fil du temps n’appartiennent plus aux cibles du CAE (Activité développé demandant plus de temps disponible…)','2,5%','Dégressif','12',0,0,'L’association est  membre de l’OTIV et ayant effectué au moins 7 Cycles de prêt  CAE. Chaque membre devrait également adhérer à l’OTIV individuellement. • Minimum, quatre membres par groupement ou Association • Avoir un bon antécédent de crédit (Association et membres de l’Association). • Chaque membre accepte d’être solidaire et cosignataire du prêt ','Carnet du membre de l\'association ou de groupement,  caution solidaire, dossier de crédit; photo et  certificat de résidence ainsi que  CIN légalisé pour chaque emprunteur','Caution solidaire et épargne minimale de 5% du montant sollicité '),(152,11,'Crédit avec éducation(CAE)',NULL,'Association d\'épargne et de crédit (femmes ou des femmes majoritaire avec homme mais présidées par les femmes qui ont difficilement accès au crédit)','3%','Linéaire','4-6',0,0,'Être membre de l\'AEC plus de 21 ans • S’engage à respecter mutuellement le Règlements intérieurs • Disposé à participer à une séance d’éducation hebdomadaire,  Accepte  d’être solidaire et cosignataire du prêt, Devra détenir l’épargne minimale requise  et avoir une capacité de remboursement','Carnet du membre de l’association, photocopie de CIN  de chaque membre, caution solidaire, dossier de crédit','Caution solidaire  et épargne préalable de 5%'),(153,11,'Crédit agricole individuel',NULL,'Les ménages agricoles membres de l’OTIV ','2%','Dégressif','3-9',0,0,'Tous les adhérents du groupe doivent être membres de l\'OTIV • Avoir un bon antécédent de crédit (association et membres du groupe). • Démontrer sa capacité de remboursement. • Appliquer les recommandations des techniciens agricoles qu’ils auront eux-mêmes choisis. • Respecter les règlements de l’OTIV. • Cautionner   par les autorités locales et pour les organismes œuvrant dans le domaine agricole (Exemple : DRDR, Agriculture','Carnet du membre de l’association,   caution solidaire, dossier de crédit','Minimum de  dépôt de 5 % du montant sollicité et autres garanties matérielles'),(154,11,'Crédit agricole (Crédit canne à sucre)',NULL,'Membre planteurs qui doivent investir des sommes dans la préparation de leurs champs, dans l’achat d’intrants, et la plantation de canne à sucre','2%','Dégressif','14',0,0,'Appliquer les techniques agricoles appropriées• Démontrer que la production génère les revenus suffisants pour acquitter le prêt à son échéance. Octroi: par tranche d’activités effectuées et suivant le calendrier cultural','Carnet du membre, CIN légalisée et certificat de résidence, photo, calendrier cultural, avaliseur et  nantissement de garanties ou hypothèque','Minimum de dépôt d’épargne de 5 % du montant sollicité et autres garanties matérielles'),(155,11,'Crédit agricole (Crédit ravim-bary)',NULL,'Tout membre producteur du riz qui ont besoins des dépannages durant la période de soudure','2%','Dégressif','6',0,0,'Membre  résident plus de 21 ans et moins de 65 ans  • Ne pas être sur la liste noire de la centrale des risques, Cultivateurs de riz au moment de la demande• Démontrer que la production génère les revenus suffisants pour acquitter le prêt à son échéance','Carnet du membre, CIN légalisée et certificat de résidence, photo , calendrier cultural, avaliseur et  nantissement de garanties ou hypothèque','Minimum de dépôt de 5 % du montant sollicité et autres garanties matérielles'),(156,11,'Grenier Communautaire Villageoise (GCV)',NULL,'Tout membre producteur de riz (personne physique ou morale). ','2%','Dégressif','9',0,0,'Membre  résident plus de 21 ans et moins de 65 ans  • Ne pas être sur la liste noire de la centrale des risques, Cultivateurs de riz au moment de la demande• Démontrer que la production génère les revenus suffisants pour acquitter le prêt à son échéance','Carnet du membre, CIN légalisée et certificat de résidence, photo , calendrier cultural, avaliseur et  nantissement de garanties ou hypothèque','Minimum de dépôt de 5 % du montant sollicité et autres garanties matérielles'),(157,11,'Crédit habitat',NULL,'Tous les membres veulent à financer l’achat de terrain, de maison et de matériaux ou servir au paiement des coûts de main d’œuvre pour la construction ou la rénovation de logements. ','2,5%','Dégressif','60',0,0,'Membre depuis plus de 1 mois, résident, plus de 21 ans et moins de 65 ans. Avoir une capacité de remboursement. Sources de revenus justifiées. N\'inclue pas sur la liste noire de la centrale des de risque.  Avoir de bons antécédents de crédit. Garanties suffisantes et avaliseur.','Carnet du membre, Certificat de résidence et CIN légalisée de l\'emprunteur et de l\'avaliseur, photo, les pièces exigés  comme devis estimatif, nantissement de garantie ou affectation hypothécaire','Minimum de dépôt  de 5 % du montant sollicité et autres garanties matérielles'),(158,11,'Crédit d\'équipement (Crédit production matériel)',NULL,'Tout membre de la caisse d’avoir besoin de crédit uniquement pour acquisition de matériels ou équipements utilisés à des buts lucratifs.','2,5%','Dégressif','60',0,0,'Membre depuis plus de 1 mois, résident, plus de 21 ans et moins de 65 ans. Avoir une capacité de remboursement. Sources de revenus justifiées. N\'inclue pas sur la liste noire de la centrale des de risque.  Avoir de bons antécédents de crédit. Garanties suffisantes et avaliseur.','Carnet du membre, Certificat de résidence et CIN légalisée de l\'emprunteur et de l\'avaliseur, photo, les pièces exigés selon l\'objet de prêt, nantissement de garantie ou affectation hypothécaire','Minimum de dépôt de 5 % du montant sollicité et autres garanties matérielles'),(159,11,'Crédit entièrement garantie',NULL,'','1,5%','Dégressif','12',0,0,'Membre depuis plus de 1 mois, résident, plus de 21 ans. Avoir une capacité de remboursement. Sources de revenus justifiées. N\'inclue pas sur la liste noire de la centrale des de risque.  Avoir de bons antécédents de crédit. ','Carnet du membre, certificat de résidence, CIN légalisée, photo, les pièces exigées selon l\'objet de prêt','Epargne de 100 % du montant sollicité '),(160,11,'Crédit agricole  solidaire',NULL,'les associations formelles ou groupements  membres de l’OTIV  ','2%','Dégressif','3-9',0,0,'Tous les adhérents du groupe doivent être membres de l\'OTIV • Avoir un bon antécédent de crédit (association et membres du groupe). • Démontrer sa capacité de remboursement. • Appliquer les recommandations des techniciens agricoles qu’ils auront eux-mêmes choisis. • Respecter les règlements de l’OTIV. • Cautionner   par les autorités locales et pour les organismes œuvrant dans le domaine agricole (Exemple : DRDR, Agriculture','Carnet du membre de l’association,   caution solidaire, dossier de crédit','Minimum de  dépôt de 5 % du montant sollicité et autres garanties matérielles'),(171,21,'Crédit avec Education (CAE',NULL,'Les catégories de clients cibles du crédit : Association des commerçantes informelle mais validée au niveau de Vola Mahasoa En milieu Urbain et rural','4% mensuel avec réduction d’intérêt de 0,5% par mois pour les clients sans défaut de remboursement','Linéaire','',50000,600000,'Association de 3 groupes de caution solidaire Femme âgée entre 16 à 60 ans Ayant une activité commerciale permettant de faire de remboursement hebdomadaire','. Demande de crédit . Certificat de résidence des membres (< 3mois) . Photos d’identité . Photocopie de CIN . Règlement intérieur de l’association . Plan de localisation des domiciles','Caution solidaire des membres'),(172,21,'Crédit Solidaire sans garanties réelles (CSGR)',NULL,'Les catégories de clients cibles du crédit : Association des paysans ou habitant dans le milieu rural Informelle mais validée au niveau de Vola Mahasoa En milieu rural','3,5% mensuel avec réduction d’intérêt de 0,5% par mois pour les clients sans défaut de remboursement','Linéaire','6',150000,600000,'Groupe de 5 à 7 personnes Homme et femme âgés de 16 à 60 ans Ayant une activité génératrice de revenu (commerce, productif, stockage, etc.)','Demande de crédit . Certificat de résidence des membres (< 3mois) . Photos d’identité . Photocopie de CIN . Règlement intérieur de l’association . Plan de localisation des domiciles des membres',' Caution solidaire des membres . Fonds de garantie 10%'),(173,21,'Crédit Solidaire aux microentreprises (CSME)',NULL,'Les catégories de clients cibles du crédit : Groupe de 5 à 7 personnes Informel mais validé au niveau de Vola Mahasoa En milieu rural et urbain','3,5% mensuel avec réduction d’intérêt de 0,5% par mois pour les clients sans défaut de remboursement','Linéaire','6',600000,2000000,'Groupe de 5 à 7 personnes Homme et femme âgés de 16 à 60 ans Ayant une activité génératrice de revenu (commerce, productif, stockage, etc.) Les membres ont déjà fait preuve de sériosité dans le remboursement du crédit CAE ou CSGR au moins pour deux cycles',' Demande de crédit . Certificat de résidence des membres (< 3mois) . Photos d’identité . Photocopie de CIN . Règlement intérieur de l’association . Plan de localisation des domiciles des membres',' Caution solidaire des membres . Fonds de garantie 10% . Garanties matérielles : 50% du crédit demandé'),(174,21,'Crédit individuel aux micro entreprises (CIME)',NULL,'Individu ou microentreprise (informelle ou formelle)','3,5%','Dégressif','3-24',1000000,15000000,'Homme ou femme âgée de 16 à 60 ans Personne physique ou morale Ayant une activité génératrice de revenu (commerce, productif, stockage, équipements, service, etc.) Disposant de garanties matérielles suffisantes Habitant dans le lieu d’exploitation depuis au moins 6 mois',' Demande de crédit . Certificat de résidence du client (< 3mois) . Photos d’identité . Photocopie de CIN . Plan de localisation du domicile du client','. Caution solidaire d’un tiers . Fonds de garantie 10% . Garanties matérielles : 125% du crédit demandé . Cession sur salaire'),(175,21,'Crédit aux Petites Entreprises (CPE)',NULL,'Petite entreprise formelle (avec NIF et STAT)','3%','','3-36',15000000,0,'Société formelle Exerçant une activité d’entreprise Ayant son siège dans l’une des agences de Vola Mahasoa','. Demande de crédit . Certificat de résidence du Directeur de la société (< 3mois) . Photos d’identité . Photocopie de CIN . Plan de localisation du d',' Caution solidaire d’un tiers . Fonds de garantie 10% . Garanties matérielles : 125% du crédit demandé . Hypothèque . Cession sur salaire'),(199,22,'Commercial',NULL,'ND','2,75%','','12',0,0,'ND','ND','ND'),(200,22,'Agricole',NULL,'ND','2,75%','','12',0,0,'','',''),(201,22,'Consommation',NULL,'','2,75%','','12',0,0,'','',''),(202,22,'Dépannage',NULL,'','2%','','12',0,0,'','',''),(203,22,'Crédit avec éducation',NULL,'','3.5%','','4',0,0,'','',''),(204,22,'Crédit stockage',NULL,'','4%','','6',0,0,'','',''),(205,22,' Equipement',NULL,'','2,75%','','12',0,0,'','',''),(206,22,'Intrant agricole',NULL,'','2%','','6',0,0,'','',''),(207,22,'Scolarisation',NULL,'','2%','','6',0,0,'','',''),(208,22,'Soudure',NULL,'','2%','','6',0,0,'','',''),(209,22,'Crédit personnel',NULL,'','1,5%','','36',0,0,'','',''),(210,27,'Crédit de Fonctionnemnt ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','2%','Linéaire','3 à 6 mois',30000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(211,27,'Crédit d’Investissement ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','2.5%','Linéaire','3 à 12 mois',200000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(212,27,'Crédit à la consommation ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','3%','Linéaire','3 à 12 mois ',200000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(213,28,'Crédit de Fonctionnemnt ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','2%','Linéaire','3 à 6 mois',30000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(214,28,'Crédit d’Investissement ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','2.5%','Linéaire','3 à 12 mois',200000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(215,28,'Crédit à la consommation ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','3%','Linéaire','3 à 12 mois ',200000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(216,29,'Crédit de Fonctionnemnt ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','2%','Linéaire','3 à 6 mois',30000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(217,29,'Crédit d’Investissement ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','2.5%','Linéaire','3 à 12 mois',200000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(218,29,'Crédit à la consommation ',NULL,'Personnes Vulnérables, Pauvre ou Indigent Actif parrticuliers,','3%','Linéaire','3 à 12 mois ',200000,3000000,'-	Agé de 21 ans et plus -	residant au moins 1  an dans le quartier d’intervention : Antananarivo  Renivohittraet sa péripherie -	ayant formulé une demande de crédit -	Ayant reçu le consentement du conjoint -	Ayant participé à la séance de l’ éducation financière ou formation gestion simplifiée -	Solvabilité ,  -	Ayant de capacité de remboursement -	Ayant de capacité d’endettement  -	Caution d’un tiers ou Garant','-	Formulaire de demande  -	Certificat de residance  -	4 photo d’identités pour le demandeur et une photo pour la garant -	Photocopie d’une carte d’identité nationale pour le demandeur, le conjoint et  le garant . ','Dépôt de garantie : 10% du capital octroyé -	Caution d’un tiers  ou Garant'),(219,30,'M-Kajy',NULL,'Particuliers','9%','Linéaire','1 - 30 j',5000,300000,'Toutes personnes physiques, 18 ans et plus, disposant d\'un compte Orange Money','Dossiers : CIN / Résidence/. L\' enregistrement de ces documents se fait au niveau d\'Orange Money et non au niveau de PAMF','N.A'),(220,30,'M-Kajy Pro',NULL,'Gérant cash point Orange money','0,3%*','Linéaire','1- 30 j',5000,2000000,'Points de Services Orange Money','Dossiers : CIN / Résidence/. L\' enregistrement de ces documents se fait au niveau d\'Orange Money et non au niveau de PAMF','N.A'),(221,30,'MF Commerce',NULL,'Entrepreneurs individuels / ou TPE','31,68%','Linéaire','12 - 36 mois',100000,10000000,'Toutes personnes physiques, 18 ans et plus, exerçant une activité génératrice de revenus','Dossiers : CIN / Résidence/. L\' enregistrement de ces documents se fait au niveau d\'Orange Money et non au niveau de PAMF','Biens mobiliers, matériels et équipements professionnels, hypothèque, stocks'),(222,30,'MF services et production',NULL,'','','','',0,0,'','',''),(223,30,'',NULL,'','','','',0,0,'','',''),(224,30,'',NULL,'','','','',0,0,'','',''),(225,30,'',NULL,'','','','',0,0,'','','');
/*!40000 ALTER TABLE `cnfi_spocredit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_spoepargne`
--

DROP TABLE IF EXISTS `cnfi_spoepargne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_spoepargne` (
  `spoEpargne_id` int(11) NOT NULL AUTO_INCREMENT,
  `spo_produitId` int(11) DEFAULT NULL,
  `spoEpargne_typeEpargneId` int(11) DEFAULT NULL,
  `spoEpargne_denomination` text,
  `spoEpargne_cible` text,
  `spoEpargne_taux` text,
  `spoEpargne_duree` int(11) DEFAULT NULL,
  `spoEpargne_typeTauxId` int(11) DEFAULT NULL,
  `spoEpargne_montantMin` double DEFAULT NULL,
  `spoEpargne_depotMin` text,
  `spoEpargne_condition` text,
  `spoEpargne_document` text,
  PRIMARY KEY (`spoEpargne_id`),
  KEY `FK_cnfi_spoepargne` (`spo_produitId`),
  CONSTRAINT `FK_cnfi_spoepargne` FOREIGN KEY (`spo_produitId`) REFERENCES `cnfi_produit` (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_spoepargne`
--

LOCK TABLES `cnfi_spoepargne` WRITE;
/*!40000 ALTER TABLE `cnfi_spoepargne` DISABLE KEYS */;
INSERT INTO `cnfi_spoepargne` VALUES (2,12,5,'a','emprunteurs ','0',0,1,NULL,'0','a','a'),(3,23,1,'DAV','Particulier et Association','1.0%',0,0,NULL,'-','Dépôt minimum à l\'ouverture d\'un compte d\'épargne','Copie CIN légalisée ou copie Statut légalisée'),(4,23,2,'DAT','Particulier, Association et Grandes institutions','8.4%',3,0,NULL,'','Dépôt minimum à l\'ouverture d\'un compte d\'épargne','Copie CIN légalisée ou copie Statut légalisée'),(5,23,3,'EPARGNE','Particulier, Association et Grandes institutions','6.0%',3,0,NULL,'','Dépôt minimum à l\'ouverture d\'un compte d\'épargne','Copie CIN légalisée ou copie Statut légalisée'),(6,11,1,'Epargne à vue','Tous les membres','',0,0,NULL,'','Etre membre','Carnet  du membre'),(7,11,2,'Epargne à terme','Tous les membres','0,75%',3,0,NULL,'','Etre membre et procéder à la signature du contrat','Carnet du membre  et contrat signé avec une échéance bien déterminée'),(8,11,2,'Epargne à terme','Tous les membres','1,75%',6,0,NULL,'','Etre membre et procéder à la signature du contrat','Carnet du membre  et contrat signé avec une échéance bien déterminée'),(9,11,2,'Epargne à terme','Tous les membres','3,00%',9,0,NULL,'','Etre membre et procéder à la signature du contrat','Carnet du membre  et contrat signé avec une échéance bien déterminée'),(10,11,2,'Epargne à terme','Tous les membres','4,50%',12,0,NULL,'','Etre membre et procéder à la signature du contrat','Carnet du membre  et contrat signé avec une échéance bien déterminée'),(11,11,5,'Dépôts de garanties','Dépôts de garanties	Emprunteur','5,00%',0,0,NULL,'','','Contrat de prêt'),(20,21,1,'Hajary Mamonjy','Tout public, en particulier les clients individuels et les micro entreprises','0%',0,0,NULL,'5000','Personne physique ou morale qui accèpte les conditions suivantes :  . Frais d’ouverture de compte : 10 000 Ar  . Dépôt minimum : 5 000 Ar  . Frais de clôture de compte : 5 000 Ar  . Périodicité de dépôt : libre','Certificat de résidence de signataire de compte (< 3 mois) Photocopie de carte d’identité nationale Photos d’identité Frais d’ouverture de compte'),(21,21,3,'Hajary Mahasoa','Tout public, en particulier les étudiants ou jeunes qui ont un projet, les groupes et les femmes ayant déjà un compte d’épargne à vue (DAV)','4%',0,2,NULL,'10000','Personne physique ou morale qui dispose déjà un compte à vue (Hajary mamonjy) et qui accèpte les conditions suivantes :  . Frais d’ouverture de compte : 0 Ar  . Dépôt minimum : 10 000 Ar par périodicité convenue  . Frais de clôture de compte : 0 Ar  . Périodicité de dépôt : conventionnelle (hebdomadaire, bimensuelle, mensuelle, bimestrielle, trimestrielle)','Carnet d’épargne Hajary Mamonjy Certificat de résidence de signataire de compte (< 3 mois) Photocopie de carte d’identité nationale Photos d’identité Montant du premier dépôt convenu'),(22,21,3,'Hajary mamiratra','Tout public, en particulier les parents ayant déjà un compte d’épargne à vue (DAV) ','4%',0,2,NULL,'10000','Personne physique ou morale qui dispose déjà un compte à vue (Hajary mamonjy) et qui accèpte les conditions suivantes :  . Frais d’ouverture de compte : 0 Ar  . Dépôt minimum : 10 000 Ar par périodicité convenue  . Frais de clôture de compte : 0 Ar  . Périodicité de dépôt : conventionnelle (hebdomadaire, bimensuelle, mensuelle, bimestrielle, trimestrielle','Carnet d’épargne Hajary Mamonjy Certificat de résidence de signataire de compte (< 3 mois) Photocopie de carte d’identité nationale Photos d’identité Montant du premier dépôt convenu Copie de naissance de l’enfant mineur titulaire du compte'),(23,21,2,'Hajary Mahatoky','Tout public ayant déjà un compte à vue (DAV) ','5% à 10% suivant le montant et la durée',0,2,NULL,'10000','Personne physique ou morale qui dispose déjà un compte à vue (Hajary mamonjy) et qui accèpte les conditions suivantes :  . Frais d’ouverture de compte : 0 Ar  . Dépôt minimum : 10 000 Ar  . Frais de clôture de compte : 0 Ar  . Périodicité de retrait : in fine','Carnet d’épargne Hajary Mamonjy Certificat de résidence de signataire de compte (< 3 mois) Photocopie de carte d’identité nationale Photos d’identité Montant du premier dépôt convenu'),(28,22,1,'Dépôt à vue','','0',0,0,NULL,'','',''),(29,22,5,'Dépôt de garantie','','0',0,0,NULL,'','',''),(30,30,0,'','','',0,0,NULL,'','','');
/*!40000 ALTER TABLE `cnfi_spoepargne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_sposfm`
--

DROP TABLE IF EXISTS `cnfi_sposfm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_sposfm` (
  `spoSfm_id` int(11) NOT NULL AUTO_INCREMENT,
  `spo_produitId` int(11) DEFAULT NULL,
  `spoSfm_typeServiceFinancierId` text,
  `spoSfm_partenaire` text,
  `spoSfm_condition` text,
  PRIMARY KEY (`spoSfm_id`),
  KEY `FK_cnfi_sposfm` (`spo_produitId`),
  CONSTRAINT `FK_cnfi_sposfm` FOREIGN KEY (`spo_produitId`) REFERENCES `cnfi_produit` (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_sposfm`
--

LOCK TABLES `cnfi_sposfm` WRITE;
/*!40000 ALTER TABLE `cnfi_sposfm` DISABLE KEYS */;
INSERT INTO `cnfi_sposfm` VALUES (1,6,'14-15','Orange Money','Partenarie encours de Prêt'),(2,6,'14-15','Orange Money','Partenarie encours de Prêt'),(3,6,'14-15','Orange Money','Partenarie encours de Prêt'),(4,6,'14-15','Orange Money','Partenarie encours de Prêt'),(5,11,'16-18','ORANGE','Etre membre de l’OTIV , Posséder  un compte orange Money'),(6,12,'15','Airtel Madagascar','-'),(7,12,'15','Airtel Madagascar','-'),(8,12,'15','Airtel Madagascar','-'),(9,12,'15','Airtel Madagascar','-'),(10,12,'15','Airtel Madagascar','-'),(11,12,'15','Airtel Madagascar','-'),(12,12,'15','Airtel Madagascar','-'),(13,12,'15','Airtel Madagascar','-'),(14,12,'15','Airtel Madagascar','-'),(15,12,'15','Airtel Madagascar','-'),(16,12,'15','Airtel Madagascar','-'),(17,12,'15','Airtel Madagascar','-'),(18,12,'15','Airtel Madagascar','-'),(19,12,'15','Airtel Madagascar','-'),(20,12,'15','Airtel Madagascar','-'),(21,12,'15','Airtel Madagascar','-'),(22,12,'15','Airtel Madagascar','-'),(23,12,'15','Airtel Madagascar','-'),(24,12,'15','Airtel Madagascar','-'),(25,12,'15','Airtel Madagascar','-'),(26,13,'15','MVOLA','AUCUNE'),(27,13,'15','MVOLA','-'),(28,23,'7-8','MVola, RIA et GLOBAL TRANSFERT',''),(29,14,'7-8','MVola, RIA et GLOBAL TRANSFERT','-'),(32,21,'15','ORANGE','N/A'),(33,30,NULL,'','');
/*!40000 ALTER TABLE `cnfi_sposfm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_sposnonfnc`
--

DROP TABLE IF EXISTS `cnfi_sposnonfnc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_sposnonfnc` (
  `spoSNonFnc_id` int(11) NOT NULL AUTO_INCREMENT,
  `spo_produitId` int(11) DEFAULT NULL,
  `spoSNonFnc_typeServiceFinancierId` text,
  `spoSNonFnc_partenaire` text,
  `spoSNonFnc_condition` text,
  PRIMARY KEY (`spoSNonFnc_id`),
  KEY `FK_cnfi_sposnonfnc` (`spo_produitId`),
  CONSTRAINT `FK_cnfi_sposnonfnc` FOREIGN KEY (`spo_produitId`) REFERENCES `cnfi_produit` (`produit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_sposnonfnc`
--

LOCK TABLES `cnfi_sposnonfnc` WRITE;
/*!40000 ALTER TABLE `cnfi_sposnonfnc` DISABLE KEYS */;
INSERT INTO `cnfi_sposnonfnc` VALUES (1,7,'1','CDA, APIMF, ECPAT France à Madagascar, ','Selon la demande du partenaire, prestation de service'),(2,3,'1','CDA, APIMF, ECPAT France à Madagascar, ','Selon la demande du partenaire, prestation de service'),(3,3,'1','CDA, APIMF, ECPAT France à Madagascar, ','Selon la demande du partenaire, prestation de service'),(4,3,'1','CDA, APIMF, ECPAT France à Madagascar, ','Selon la demande du partenaire, prestation de service'),(5,6,'1-3','N/A','N/A'),(6,12,NULL,'',''),(7,12,NULL,'',''),(8,12,NULL,'',''),(9,12,NULL,'',''),(10,12,NULL,'',''),(11,12,NULL,'',''),(12,12,NULL,'',''),(13,12,NULL,'',''),(14,12,NULL,'',''),(15,12,NULL,'',''),(16,12,NULL,'',''),(17,12,NULL,'',''),(18,12,NULL,'',''),(19,12,NULL,'',''),(20,12,NULL,'',''),(21,12,NULL,'',''),(22,12,NULL,'-','-'),(23,12,NULL,'-','-'),(24,13,'1-3','ND','ND'),(25,13,'1-3','-','-'),(26,27,'1','',''),(27,28,'1','neant','neant'),(28,29,'1','neant','neant');
/*!40000 ALTER TABLE `cnfi_sposnonfnc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_statutservice`
--

DROP TABLE IF EXISTS `cnfi_statutservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_statutservice` (
  `statutService_id` int(11) NOT NULL AUTO_INCREMENT,
  `produitId` int(11) DEFAULT NULL,
  `statutService_statutId` int(1) DEFAULT NULL,
  `statutService_TypeId` text,
  `statutService_date` date DEFAULT NULL,
  `statutService_motif` text,
  `statutService_regionId` int(11) DEFAULT NULL,
  `statutService_districtId` int(11) DEFAULT NULL,
  `statutService_communeId` int(11) DEFAULT NULL,
  `statutService_fokotany` text,
  `statutService_type` text,
  `statutService_lieu` text,
  `statutService_support` text,
  PRIMARY KEY (`statutService_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_statutservice`
--

LOCK TABLES `cnfi_statutservice` WRITE;
/*!40000 ALTER TABLE `cnfi_statutservice` DISABLE KEYS */;
INSERT INTO `cnfi_statutservice` VALUES (1,6,4,'4','2001-01-04',NULL,NULL,NULL,NULL,NULL,'Célébration anniversaire','Espace d’Amborovy Mahajanga','Document de Team Building'),(2,11,2,'3','2001-01-01','',0,0,0,'','',NULL,NULL);
/*!40000 ALTER TABLE `cnfi_statutservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_trimestre`
--

DROP TABLE IF EXISTS `cnfi_trimestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_trimestre` (
  `trimestre_id` int(11) NOT NULL AUTO_INCREMENT,
  `trimestre_libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trimestre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_trimestre`
--

LOCK TABLES `cnfi_trimestre` WRITE;
/*!40000 ALTER TABLE `cnfi_trimestre` DISABLE KEYS */;
INSERT INTO `cnfi_trimestre` VALUES (1,'1er Trimestre'),(2,'2e Trimestre'),(3,'3e Trimestre'),(4,'4e Trimestre');
/*!40000 ALTER TABLE `cnfi_trimestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typeaccidentmaladie`
--

DROP TABLE IF EXISTS `cnfi_typeaccidentmaladie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typeaccidentmaladie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typeaccidentmaladie`
--

LOCK TABLES `cnfi_typeaccidentmaladie` WRITE;
/*!40000 ALTER TABLE `cnfi_typeaccidentmaladie` DISABLE KEYS */;
INSERT INTO `cnfi_typeaccidentmaladie` VALUES (1,'Accident Du Travail'),(2,'Maladies Professionnelles');
/*!40000 ALTER TABLE `cnfi_typeaccidentmaladie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typeassurance`
--

DROP TABLE IF EXISTS `cnfi_typeassurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typeassurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typeassurance`
--

LOCK TABLES `cnfi_typeassurance` WRITE;
/*!40000 ALTER TABLE `cnfi_typeassurance` DISABLE KEYS */;
INSERT INTO `cnfi_typeassurance` VALUES (1,'Assurance Vie'),(2,'Assurance Crédit'),(3,'Assurance Maladie/Accident'),(4,'Assurance \"Incendie et éléments naturels\" et Autres dommages aux biens\"'),(6,'Assurance Bien Agricole'),(7,'Autres produits d\'assurance');
/*!40000 ALTER TABLE `cnfi_typeassurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typecredit`
--

DROP TABLE IF EXISTS `cnfi_typecredit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typecredit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typecredit`
--

LOCK TABLES `cnfi_typecredit` WRITE;
/*!40000 ALTER TABLE `cnfi_typecredit` DISABLE KEYS */;
INSERT INTO `cnfi_typecredit` VALUES (1,'Agriculture'),(2,'Artisanat'),(3,'Transformation / Industrie'),(4,'Commerce'),(5,'Transport'),(6,'Service'),(7,'Immobilier'),(8,'Consommation'),(9,'Autres');
/*!40000 ALTER TABLE `cnfi_typecredit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typeentite`
--

DROP TABLE IF EXISTS `cnfi_typeentite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typeentite` (
  `typeEntite_id` int(11) NOT NULL AUTO_INCREMENT,
  `typeEntite_libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`typeEntite_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typeentite`
--

LOCK TABLES `cnfi_typeentite` WRITE;
/*!40000 ALTER TABLE `cnfi_typeentite` DISABLE KEYS */;
INSERT INTO `cnfi_typeentite` VALUES (1,'IMF'),(2,'Assurance'),(3,'Banque'),(4,'CNAPS'),(5,'EME'),(6,'CEM'),(7,'Poste');
/*!40000 ALTER TABLE `cnfi_typeentite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typeepargne`
--

DROP TABLE IF EXISTS `cnfi_typeepargne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typeepargne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typeepargne`
--

LOCK TABLES `cnfi_typeepargne` WRITE;
/*!40000 ALTER TABLE `cnfi_typeepargne` DISABLE KEYS */;
INSERT INTO `cnfi_typeepargne` VALUES (1,'Comptes ordinaires'),(2,'Dépots à termes'),(3,'comptes d\'épargne à régime spécial'),(4,'Bons de caisse'),(5,'Dépôts de garantie');
/*!40000 ALTER TABLE `cnfi_typeepargne` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typemarquant`
--

DROP TABLE IF EXISTS `cnfi_typemarquant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typemarquant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typemarquant`
--

LOCK TABLES `cnfi_typemarquant` WRITE;
/*!40000 ALTER TABLE `cnfi_typemarquant` DISABLE KEYS */;
INSERT INTO `cnfi_typemarquant` VALUES (1,'Changement'),(2,'Ouverture de points de services'),(3,'Fermeture de points de service'),(4,'Autres événements marquants');
/*!40000 ALTER TABLE `cnfi_typemarquant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typeposte`
--

DROP TABLE IF EXISTS `cnfi_typeposte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typeposte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typeposte`
--

LOCK TABLES `cnfi_typeposte` WRITE;
/*!40000 ALTER TABLE `cnfi_typeposte` DISABLE KEYS */;
INSERT INTO `cnfi_typeposte` VALUES (1,'Epargne'),(3,'Transferts d\'argent'),(4,'Compte courant');
/*!40000 ALTER TABLE `cnfi_typeposte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typerepartition`
--

DROP TABLE IF EXISTS `cnfi_typerepartition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typerepartition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typerepartition`
--

LOCK TABLES `cnfi_typerepartition` WRITE;
/*!40000 ALTER TABLE `cnfi_typerepartition` DISABLE KEYS */;
INSERT INTO `cnfi_typerepartition` VALUES (1,'ALLOCATION AUX SURVIVANTS'),(2,'ALLOCATION DE SOLIDARITE'),(3,'PENSION DE VIEILLESSE'),(4,'PENSION PROPORTIONNELLE DE VIEILLESSE'),(5,'RENTE D\'INVALIDITE ');
/*!40000 ALTER TABLE `cnfi_typerepartition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typesecteurprive`
--

DROP TABLE IF EXISTS `cnfi_typesecteurprive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typesecteurprive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typesecteurprive`
--

LOCK TABLES `cnfi_typesecteurprive` WRITE;
/*!40000 ALTER TABLE `cnfi_typesecteurprive` DISABLE KEYS */;
INSERT INTO `cnfi_typesecteurprive` VALUES (1,'ADMINISTRATION PUBLIQUE'),(2,'AGRICULTURE - ELEVAGE - PECHE'),(3,'COMMERCE - TRANSPORT ET AUTRES ACTIVITES CONNEXES'),(4,'ENSEIGNEMENT -ASSOC. RELIG. - ORGANISATION '),(5,'GENS DE MAISON'),(6,'INDUSTRIES'),(7,'SERVICES - BANQUES & ASSURANCES'),(8,'SERVICES RECREATIFS - TOURISME & LOISIRS');
/*!40000 ALTER TABLE `cnfi_typesecteurprive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typeservicefin`
--

DROP TABLE IF EXISTS `cnfi_typeservicefin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typeservicefin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  `isBanque` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typeservicefin`
--

LOCK TABLES `cnfi_typeservicefin` WRITE;
/*!40000 ALTER TABLE `cnfi_typeservicefin` DISABLE KEYS */;
INSERT INTO `cnfi_typeservicefin` VALUES (1,'TRANSACTION au guichet de personne à personne (CLIENT non-enregistre) ',0),(2,'TRANSACTION au guichet pour paiement de facture (CLIENT non-enregistre)',0),(3,'Retrait d\'argent au guichet',0),(4,'Dépôt d\'argent au guichet',0),(5,'Transfert de banque à compte mobile',0),(6,'Transfert de compte mobile à compte bancaire',0),(7,'Transfert domestique de personne à personne',0),(8,'Transfert international de personne à personne',0),(9,'Paiement marchand',0),(10,'Paiement Factures',0),(11,'Salaires (secteur prive)',0),(12,'Achat de crédit téléphonique',0),(13,'Transactions avec administrations publiques (pensions, salaires, impots, taxes, bourses, indemnites sociales, etc.)',0),(14,'Obtention de crédit',1),(15,'Remboursement de crédit',1),(16,'Versement de dépôt',1),(17,'Paiement de prime d\'assurance',1),(18,'Autres',1),(19,'Aucun',0);
/*!40000 ALTER TABLE `cnfi_typeservicefin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typeservicenonfin`
--

DROP TABLE IF EXISTS `cnfi_typeservicenonfin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typeservicenonfin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typeservicenonfin`
--

LOCK TABLES `cnfi_typeservicenonfin` WRITE;
/*!40000 ALTER TABLE `cnfi_typeservicenonfin` DISABLE KEYS */;
INSERT INTO `cnfi_typeservicenonfin` VALUES (1,'Conseil/Formation'),(2,'Location de coffre fort'),(3,'Mutuelle de santé');
/*!40000 ALTER TABLE `cnfi_typeservicenonfin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typezone`
--

DROP TABLE IF EXISTS `cnfi_typezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typezone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typezone`
--

LOCK TABLES `cnfi_typezone` WRITE;
/*!40000 ALTER TABLE `cnfi_typezone` DISABLE KEYS */;
INSERT INTO `cnfi_typezone` VALUES (1,'Agence'),(2,'Agence mobile'),(3,'Caisse'),(4,'GAB');
/*!40000 ALTER TABLE `cnfi_typezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typezoneassurance`
--

DROP TABLE IF EXISTS `cnfi_typezoneassurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typezoneassurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typezoneassurance`
--

LOCK TABLES `cnfi_typezoneassurance` WRITE;
/*!40000 ALTER TABLE `cnfi_typezoneassurance` DISABLE KEYS */;
INSERT INTO `cnfi_typezoneassurance` VALUES (1,'Agence centrale'),(2,'Agence général'),(3,'Agence mobile');
/*!40000 ALTER TABLE `cnfi_typezoneassurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typezonecem`
--

DROP TABLE IF EXISTS `cnfi_typezonecem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typezonecem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typezonecem`
--

LOCK TABLES `cnfi_typezonecem` WRITE;
/*!40000 ALTER TABLE `cnfi_typezonecem` DISABLE KEYS */;
INSERT INTO `cnfi_typezonecem` VALUES (1,'Livret Epargne'),(2,'Compte Special Epargne'),(3,'Compte Special Retraite');
/*!40000 ALTER TABLE `cnfi_typezonecem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typezonecnaps`
--

DROP TABLE IF EXISTS `cnfi_typezonecnaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typezonecnaps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typezonecnaps`
--

LOCK TABLES `cnfi_typezonecnaps` WRITE;
/*!40000 ALTER TABLE `cnfi_typezonecnaps` DISABLE KEYS */;
INSERT INTO `cnfi_typezonecnaps` VALUES (1,'Agence'),(4,'Agence Mobile');
/*!40000 ALTER TABLE `cnfi_typezonecnaps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typezoneeme`
--

DROP TABLE IF EXISTS `cnfi_typezoneeme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typezoneeme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typezoneeme`
--

LOCK TABLES `cnfi_typezoneeme` WRITE;
/*!40000 ALTER TABLE `cnfi_typezoneeme` DISABLE KEYS */;
INSERT INTO `cnfi_typezoneeme` VALUES (1,'Agents de Distribution '),(2,'Agents Marchands'),(3,'Agents Purs ');
/*!40000 ALTER TABLE `cnfi_typezoneeme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_typezoneposte`
--

DROP TABLE IF EXISTS `cnfi_typezoneposte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_typezoneposte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_typezoneposte`
--

LOCK TABLES `cnfi_typezoneposte` WRITE;
/*!40000 ALTER TABLE `cnfi_typezoneposte` DISABLE KEYS */;
INSERT INTO `cnfi_typezoneposte` VALUES (1,'Agence'),(2,'DAB');
/*!40000 ALTER TABLE `cnfi_typezoneposte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfi_zone`
--

DROP TABLE IF EXISTS `cnfi_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfi_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_produitId` int(11) DEFAULT NULL,
  `zone_regionId` int(11) NOT NULL,
  `zone_districtId` int(11) NOT NULL,
  `zone_communeId` int(11) NOT NULL,
  `zone_typeId` int(11) DEFAULT NULL,
  `zone_fokontany` text,
  `zone_nombre` int(11) DEFAULT NULL,
  `zone_nombreCompteMonnaie` int(11) DEFAULT NULL,
  `zone_nombreCompteActif` int(11) DEFAULT NULL,
  `zone_nombreCompteInacif` int(11) DEFAULT NULL,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=873 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfi_zone`
--

LOCK TABLES `cnfi_zone` WRITE;
/*!40000 ALTER TABLE `cnfi_zone` DISABLE KEYS */;
INSERT INTO `cnfi_zone` VALUES (65,7,1,13,1,3,'Andohatapenaka-II',1,NULL,NULL,NULL),(66,7,1,16,97,1,'',0,NULL,NULL,NULL),(67,7,1,16,95,1,'',0,NULL,NULL,NULL),(249,8,4,21,2,1,'Avaratsena',5,NULL,NULL,NULL),(250,8,4,22,412,1,'Vinaninkarena',1,NULL,NULL,NULL),(251,8,4,22,398,1,'Ambohibary',1,NULL,NULL,NULL),(252,8,4,22,407,3,'Mandrosohasina',1,NULL,NULL,NULL),(253,8,4,22,402,1,'Andranomanelatra',1,NULL,NULL,NULL),(254,8,4,22,406,3,'Belazao',1,NULL,NULL,NULL),(255,8,4,22,413,1,'Manandona',1,NULL,NULL,NULL),(256,8,4,22,409,2,'Sahanivotry',1,NULL,NULL,NULL),(257,8,4,22,396,1,'Aambano',1,NULL,NULL,NULL),(258,8,4,22,405,3,'Antsoatany',1,NULL,NULL,NULL),(259,8,4,22,399,3,'Ambohidranandriana',1,NULL,NULL,NULL),(260,8,4,22,394,3,'Alakamisy',1,NULL,NULL,NULL),(261,8,4,24,16,1,'Betafo',1,NULL,NULL,NULL),(262,8,4,24,414,3,'Alakamisy anativato',1,NULL,NULL,NULL),(264,8,4,24,428,3,'Mandritsara',1,NULL,NULL,NULL),(265,8,4,23,15,1,'Ambatolampy',1,NULL,NULL,NULL),(266,8,4,23,374,1,'Behenjy',1,NULL,NULL,NULL),(267,8,4,23,377,3,'Morarano',1,NULL,NULL,NULL),(268,8,4,23,369,3,'Andriambilany',1,NULL,NULL,NULL),(269,8,4,23,366,3,'AMbohimpihaonana',1,NULL,NULL,NULL),(270,8,4,25,105,1,'Antanifotsy',1,NULL,NULL,NULL),(271,8,4,25,106,1,'Ambohimandroso',1,NULL,NULL,NULL),(272,8,4,25,387,3,'Ampitatafika',1,NULL,NULL,NULL),(273,8,4,25,389,3,'Antsahalava',1,NULL,NULL,NULL),(274,8,4,26,107,1,'Faratsiho',1,NULL,NULL,NULL),(275,8,4,26,438,1,'Faravohitra',1,NULL,NULL,NULL),(276,8,3,11,20,1,'Soavinandriana',1,NULL,NULL,NULL),(277,8,3,10,19,1,'Miarinarivo',1,NULL,NULL,NULL),(278,8,5,68,684,3,'Sahatsiho',1,NULL,NULL,NULL),(279,18,4,0,0,1,'',4,NULL,NULL,NULL),(287,6,14,36,6,1,'Morafeno',1,NULL,NULL,NULL),(288,6,14,36,6,1,'Pont Blanc',1,NULL,NULL,NULL),(289,6,14,36,6,1,'Sotema',1,NULL,NULL,NULL),(290,15,4,21,2,1,'Avaratsena',5,NULL,NULL,NULL),(293,8,3,10,104,1,'Analavory',1,NULL,NULL,NULL),(294,8,3,12,18,1,'Imerintsiatosika',1,NULL,NULL,NULL),(295,8,3,10,353,1,'Ampary',1,NULL,NULL,NULL),(333,15,4,22,412,1,'Vinaninkarena',1,NULL,NULL,NULL),(334,15,4,22,398,1,'Ambohibary',1,NULL,NULL,NULL),(335,15,4,22,407,3,'Mandrosohasina',1,NULL,NULL,NULL),(336,15,4,22,402,1,'Andranomanelatra',1,NULL,NULL,NULL),(337,15,4,22,406,3,'Belazao',1,NULL,NULL,NULL),(338,15,4,22,413,1,'Manandona',1,NULL,NULL,NULL),(339,15,4,22,409,3,'Sahanivotry',1,NULL,NULL,NULL),(340,15,4,22,396,1,'Ambano',1,NULL,NULL,NULL),(341,15,4,22,405,3,'Antsoantany',1,NULL,NULL,NULL),(342,15,4,22,399,3,'Ambohidranandriana',1,NULL,NULL,NULL),(343,15,4,22,394,3,'Alakamisy',1,NULL,NULL,NULL),(344,15,4,24,16,1,'Betafo',1,NULL,NULL,NULL),(345,15,4,24,414,3,'Alakamisy Anativato',1,NULL,NULL,NULL),(346,15,4,24,428,3,'Mandritsara',1,NULL,NULL,NULL),(347,15,4,23,15,1,'Ambatolampy',1,NULL,NULL,NULL),(348,15,4,23,374,1,'Behenjy',1,NULL,NULL,NULL),(349,15,4,23,377,3,'Morarano',1,NULL,NULL,NULL),(350,15,4,23,369,3,'Andriambilany',1,NULL,NULL,NULL),(351,15,4,23,366,3,'Ambohimpihaonana',1,NULL,NULL,NULL),(352,15,4,25,105,1,'Antanifotsy',1,NULL,NULL,NULL),(353,15,4,25,106,1,'Ambohimandroso',1,NULL,NULL,NULL),(354,15,4,25,387,3,'Ampitatafika',1,NULL,NULL,NULL),(355,15,4,25,389,3,'Antsahalava',1,NULL,NULL,NULL),(356,15,4,26,107,1,'Faratsiho',1,NULL,NULL,NULL),(357,15,4,26,438,1,'Faravohitra',1,NULL,NULL,NULL),(358,15,3,11,20,1,'Soavinandriana',1,NULL,NULL,NULL),(359,15,3,10,19,1,'Miarinarivo',1,NULL,NULL,NULL),(360,15,5,68,684,3,'Sahatsiho',1,NULL,NULL,NULL),(361,15,3,10,104,1,'Analavory',1,NULL,NULL,NULL),(362,15,3,12,18,1,'Imerintsiatosika',1,NULL,NULL,NULL),(363,15,3,10,353,1,'Ampary',1,NULL,NULL,NULL),(364,11,21,1,3,1,'AVENIR- SCAMA- CITE OUVRIERE',3,NULL,NULL,NULL),(384,12,1,13,1,1,'Manarintsoa Afovoany',1,NULL,NULL,NULL),(386,13,1,13,1,1,'Ambatonakanga',1,NULL,NULL,NULL),(388,23,10,51,55,1,'Camp des Mariés',0,NULL,NULL,NULL),(414,18,4,21,0,1,'',5,NULL,NULL,NULL),(415,18,4,113,0,1,'',1,NULL,NULL,NULL),(416,18,4,26,0,1,'',2,NULL,NULL,NULL),(417,18,4,24,0,1,'',6,NULL,NULL,NULL),(418,18,4,0,0,1,'',5,NULL,NULL,NULL),(496,11,21,2,154,1,'ANIVORANO III',1,NULL,NULL,NULL),(497,11,21,2,497,1,'ANTSALAKA',1,NULL,NULL,NULL),(498,11,21,3,22,1,'MATIAKOHO',1,NULL,NULL,NULL),(499,11,21,3,481,1,'ANKAZOMBORONA',1,NULL,NULL,NULL),(500,11,21,3,478,1,'AMPONDRALAVA',1,NULL,NULL,NULL),(501,11,21,3,485,1,'ANTRANOVATO',1,NULL,NULL,NULL),(502,11,21,4,21,1,'AMBAIBO',1,NULL,NULL,NULL),(503,11,21,4,454,1,'BEMANEVIKY',1,NULL,NULL,NULL),(504,11,21,4,466,1,'DJANGOA',1,NULL,NULL,NULL),(505,11,21,5,4,1,'HELL VILLE, DZAMANDZAR, DAR ES SALAM',1,NULL,NULL,NULL),(506,11,16,34,1087,1,'ANKARAMY',1,NULL,NULL,NULL),(509,21,19,95,9,3,'',1,NULL,NULL,NULL),(510,21,19,96,173,1,'',60,NULL,NULL,NULL),(511,21,10,0,0,1,'',0,NULL,NULL,NULL),(512,21,19,0,0,1,'',0,NULL,NULL,NULL),(513,21,10,0,0,1,'',0,NULL,NULL,NULL),(514,21,10,0,0,1,'',0,NULL,NULL,NULL),(515,21,10,0,0,1,'',0,NULL,NULL,NULL),(516,21,10,0,0,1,'',0,NULL,NULL,NULL),(517,21,10,0,0,1,'',0,NULL,NULL,NULL),(518,21,10,0,0,1,'',0,NULL,NULL,NULL),(519,21,10,0,0,1,'',0,NULL,NULL,NULL),(520,21,10,0,0,1,'',0,NULL,NULL,NULL),(521,21,10,0,0,1,'',0,NULL,NULL,NULL),(522,21,10,0,0,1,'',0,NULL,NULL,NULL),(523,21,10,0,0,1,'',0,NULL,NULL,NULL),(524,21,10,0,0,1,'',0,NULL,NULL,NULL),(525,21,10,0,0,1,'',0,NULL,NULL,NULL),(526,21,10,0,0,1,'',0,NULL,NULL,NULL),(527,21,10,0,0,1,'',0,NULL,NULL,NULL),(528,21,10,0,0,1,'',0,NULL,NULL,NULL),(529,21,10,0,0,1,'',0,NULL,NULL,NULL),(530,21,10,0,0,1,'',0,NULL,NULL,NULL),(531,21,10,0,0,1,'',0,NULL,NULL,NULL),(532,21,10,0,0,1,'',0,NULL,NULL,NULL),(533,21,10,0,0,1,'',0,NULL,NULL,NULL),(534,21,10,0,0,1,'',0,NULL,NULL,NULL),(535,21,10,0,0,1,'',0,NULL,NULL,NULL),(536,21,10,0,0,1,'',0,NULL,NULL,NULL),(537,21,10,0,0,1,'',0,NULL,NULL,NULL),(538,21,10,0,0,1,'',0,NULL,NULL,NULL),(539,21,10,0,0,1,'',0,NULL,NULL,NULL),(540,21,10,0,0,1,'',0,NULL,NULL,NULL),(541,21,10,0,0,1,'',0,NULL,NULL,NULL),(542,21,10,0,0,1,'',0,NULL,NULL,NULL),(543,21,10,0,0,1,'',0,NULL,NULL,NULL),(544,21,10,0,0,1,'',0,NULL,NULL,NULL),(545,21,10,0,0,1,'',0,NULL,NULL,NULL),(546,21,10,0,0,1,'',0,NULL,NULL,NULL),(547,21,10,0,0,1,'',0,NULL,NULL,NULL),(548,21,10,0,0,1,'',0,NULL,NULL,NULL),(549,21,10,0,0,1,'',0,NULL,NULL,NULL),(550,21,10,0,0,1,'',0,NULL,NULL,NULL),(580,22,22,6,25,0,'',1,NULL,NULL,NULL),(581,22,22,6,0,0,'Antanifotsy',1,NULL,NULL,NULL),(582,22,22,6,563,0,'',1,NULL,NULL,NULL),(583,22,22,6,552,0,'',1,NULL,NULL,NULL),(584,22,22,6,549,0,'',1,NULL,NULL,NULL),(585,22,22,6,551,0,'',1,NULL,NULL,NULL),(586,22,22,6,159,0,'',1,NULL,NULL,NULL),(587,22,22,6,160,0,'',1,NULL,NULL,NULL),(588,22,22,6,547,0,'',1,NULL,NULL,NULL),(589,22,22,6,553,0,'',1,NULL,NULL,NULL),(590,22,22,8,24,0,'',1,NULL,NULL,NULL),(591,22,22,8,527,0,'',1,NULL,NULL,NULL),(592,22,22,8,526,0,'',1,NULL,NULL,NULL),(593,22,22,8,0,0,'Ankoalabe',1,NULL,NULL,NULL),(594,22,22,8,533,0,'',1,NULL,NULL,NULL),(595,22,22,7,26,0,'',1,NULL,NULL,NULL),(596,22,22,7,162,0,'',1,NULL,NULL,NULL),(597,22,22,7,161,0,'',1,NULL,NULL,NULL),(598,22,22,7,577,0,'',1,NULL,NULL,NULL),(599,22,22,7,579,0,'',1,NULL,NULL,NULL),(600,22,22,7,567,0,'',1,NULL,NULL,NULL),(601,22,22,9,23,0,'',1,NULL,NULL,NULL),(602,22,22,9,510,0,'',1,NULL,NULL,NULL),(603,22,22,9,524,0,'',1,NULL,NULL,NULL),(604,22,22,9,513,0,'',1,NULL,NULL,NULL),(605,22,22,9,507,0,'',1,NULL,NULL,NULL),(606,22,22,9,518,0,'',1,NULL,NULL,NULL),(607,23,1,13,1,1,'Andavamamba',0,NULL,NULL,NULL),(608,23,1,55,8,1,'',0,NULL,NULL,NULL),(609,23,1,0,0,1,'',0,NULL,NULL,NULL),(610,23,10,0,0,1,'',0,NULL,NULL,NULL),(611,23,10,0,0,1,'',0,NULL,NULL,NULL),(612,23,10,0,0,1,'',0,NULL,NULL,NULL),(613,23,10,0,0,1,'',0,NULL,NULL,NULL),(614,23,10,0,0,1,'',0,NULL,NULL,NULL),(615,23,10,0,0,1,'',0,NULL,NULL,NULL),(616,23,10,0,0,1,'',0,NULL,NULL,NULL),(617,23,10,0,0,1,'',0,NULL,NULL,NULL),(618,23,10,0,0,1,'',0,NULL,NULL,NULL),(619,23,10,0,0,1,'',0,NULL,NULL,NULL),(620,23,10,0,0,1,'',0,NULL,NULL,NULL),(621,23,10,0,0,1,'',0,NULL,NULL,NULL),(622,23,10,0,0,1,'',0,NULL,NULL,NULL),(623,23,10,0,0,1,'',0,NULL,NULL,NULL),(624,23,10,0,0,1,'',0,NULL,NULL,NULL),(625,23,10,0,0,1,'',0,NULL,NULL,NULL),(626,23,10,0,0,1,'',0,NULL,NULL,NULL),(627,24,1,18,177,1,'',1,NULL,NULL,NULL),(628,24,1,18,78,1,'',1,NULL,NULL,NULL),(629,24,1,18,183,1,'',1,NULL,NULL,NULL),(630,24,1,16,190,1,'',1,NULL,NULL,NULL),(631,24,1,16,194,1,'',1,NULL,NULL,NULL),(632,24,1,16,195,1,'',1,NULL,NULL,NULL),(633,24,1,16,100,1,'',1,NULL,NULL,NULL),(634,24,1,16,99,1,'',1,NULL,NULL,NULL),(635,24,1,16,204,1,'',1,NULL,NULL,NULL),(636,24,1,20,206,1,'',1,NULL,NULL,NULL),(637,24,0,0,0,0,'',0,NULL,NULL,NULL),(638,24,0,0,0,0,'',0,NULL,NULL,NULL),(639,24,0,0,0,0,'',0,NULL,NULL,NULL),(640,24,0,0,0,0,'',0,NULL,NULL,NULL),(641,25,1,18,177,1,'',1,NULL,NULL,NULL),(642,25,1,18,78,1,'',1,NULL,NULL,NULL),(643,25,1,18,183,1,'',1,NULL,NULL,NULL),(644,25,1,16,190,1,'',1,NULL,NULL,NULL),(645,25,1,16,194,1,'',1,NULL,NULL,NULL),(646,25,1,16,195,1,'',1,NULL,NULL,NULL),(647,25,1,16,100,1,'',1,NULL,NULL,NULL),(648,25,1,16,99,1,'',1,NULL,NULL,NULL),(649,25,1,16,204,1,'',1,NULL,NULL,NULL),(650,25,1,20,206,1,'',1,NULL,NULL,NULL),(651,25,1,20,11,1,'',1,NULL,NULL,NULL),(652,25,1,20,215,1,'',1,NULL,NULL,NULL),(653,25,1,20,207,1,'',1,NULL,NULL,NULL),(654,25,1,17,230,1,'',1,NULL,NULL,NULL),(655,25,1,17,12,1,'',1,NULL,NULL,NULL),(656,25,1,17,226,1,'',1,NULL,NULL,NULL),(657,25,1,17,228,1,'',1,NULL,NULL,NULL),(658,25,1,13,1,1,'',3,NULL,NULL,NULL),(659,25,1,14,81,1,'',1,NULL,NULL,NULL),(660,25,1,14,241,1,'',1,NULL,NULL,NULL),(661,25,1,14,240,1,'',1,NULL,NULL,NULL),(662,25,1,14,0,1,'Ambatofotsy',1,NULL,NULL,NULL),(663,25,1,15,88,1,'',1,NULL,NULL,NULL),(664,25,1,15,255,1,'',1,NULL,NULL,NULL),(665,25,1,15,91,1,'',1,NULL,NULL,NULL),(666,25,1,15,89,1,'',1,NULL,NULL,NULL),(667,25,1,15,93,1,'',1,NULL,NULL,NULL),(668,25,1,19,13,1,'',1,NULL,NULL,NULL),(669,25,1,19,285,1,'',1,NULL,NULL,NULL),(670,25,1,19,267,1,'',1,NULL,NULL,NULL),(671,25,1,19,0,1,'Andriampamaky',1,NULL,NULL,NULL),(672,25,10,51,0,1,'Anjiro',1,NULL,NULL,NULL),(673,25,10,51,55,1,'',1,NULL,NULL,NULL),(674,25,10,51,1267,1,'',1,NULL,NULL,NULL),(675,25,10,50,1197,1,'',1,NULL,NULL,NULL),(676,25,10,50,54,1,'',1,NULL,NULL,NULL),(677,25,10,50,1206,1,'',1,NULL,NULL,NULL),(678,26,1,18,177,1,'',1,NULL,NULL,NULL),(679,26,1,18,78,1,'',1,NULL,NULL,NULL),(680,26,1,18,183,1,'',1,NULL,NULL,NULL),(681,26,1,16,190,1,'',1,NULL,NULL,NULL),(682,26,1,16,194,1,'',1,NULL,NULL,NULL),(683,26,1,16,195,1,'',1,NULL,NULL,NULL),(684,26,1,16,100,1,'',1,NULL,NULL,NULL),(685,26,1,16,99,1,'',1,NULL,NULL,NULL),(686,26,1,16,204,1,'',1,NULL,NULL,NULL),(687,26,1,20,206,1,'',1,NULL,NULL,NULL),(688,26,1,20,11,1,'',1,NULL,NULL,NULL),(689,26,1,20,215,1,'',1,NULL,NULL,NULL),(690,26,1,20,207,1,'',1,NULL,NULL,NULL),(691,26,1,17,230,1,'',1,NULL,NULL,NULL),(692,26,1,17,12,1,'',1,NULL,NULL,NULL),(693,26,1,17,226,1,'',1,NULL,NULL,NULL),(694,26,1,17,228,1,'',1,NULL,NULL,NULL),(695,26,1,13,1,1,'',3,NULL,NULL,NULL),(696,26,1,14,81,1,'',1,NULL,NULL,NULL),(697,26,1,14,241,1,'',1,NULL,NULL,NULL),(698,26,1,14,240,1,'',1,NULL,NULL,NULL),(699,26,1,14,0,1,'Ambatofotsy',1,NULL,NULL,NULL),(700,26,1,15,88,1,'',1,NULL,NULL,NULL),(701,26,1,15,255,1,'',1,NULL,NULL,NULL),(702,26,1,15,91,1,'',1,NULL,NULL,NULL),(703,26,1,15,89,1,'',1,NULL,NULL,NULL),(704,26,1,15,93,1,'',1,NULL,NULL,NULL),(705,26,1,19,13,1,'',1,NULL,NULL,NULL),(706,26,1,19,285,1,'',1,NULL,NULL,NULL),(707,26,1,19,267,1,'',1,NULL,NULL,NULL),(708,26,1,19,0,1,'Andriampamaky',1,NULL,NULL,NULL),(709,26,0,0,0,0,'',0,NULL,NULL,NULL),(710,26,0,0,0,0,'',0,NULL,NULL,NULL),(711,26,0,0,0,0,'',0,NULL,NULL,NULL),(712,26,0,0,0,0,'',0,NULL,NULL,NULL),(713,26,0,0,0,0,'',0,NULL,NULL,NULL),(714,26,0,0,0,0,'',0,NULL,NULL,NULL),(794,25,10,50,1195,1,'',1,NULL,NULL,NULL),(795,25,10,50,0,1,'Ranomainty',1,NULL,NULL,NULL),(796,25,10,50,0,1,'Andrebakely',1,NULL,NULL,NULL),(797,25,10,50,111,1,'',1,NULL,NULL,NULL),(798,25,10,53,1217,1,'',1,NULL,NULL,NULL),(799,25,10,53,1228,1,'',1,NULL,NULL,NULL),(800,25,10,53,56,1,'',1,NULL,NULL,NULL),(801,25,10,53,1225,1,'',1,NULL,NULL,NULL),(802,25,10,51,1257,1,'',1,NULL,NULL,NULL),(803,25,10,54,57,1,'',1,NULL,NULL,NULL),(804,25,5,70,666,1,'',1,NULL,NULL,NULL),(805,25,5,70,660,1,'',1,NULL,NULL,NULL),(806,25,5,70,31,1,'',1,NULL,NULL,NULL),(807,25,5,68,685,1,'',1,NULL,NULL,NULL),(808,25,5,68,673,1,'',1,NULL,NULL,NULL),(809,25,5,68,29,1,'',1,NULL,NULL,NULL),(810,25,5,68,678,1,'',1,NULL,NULL,NULL),(811,25,5,68,684,1,'',1,NULL,NULL,NULL),(812,25,5,68,679,1,'',1,NULL,NULL,NULL),(813,25,5,71,141,1,'',1,NULL,NULL,NULL),(814,25,5,71,693,1,'',1,NULL,NULL,NULL),(815,25,5,71,692,1,'',1,NULL,NULL,NULL),(816,25,5,71,30,1,'',1,NULL,NULL,NULL),(817,25,5,71,695,1,'',1,NULL,NULL,NULL),(818,25,5,69,703,1,'',1,NULL,NULL,NULL),(819,25,5,69,702,1,'',1,NULL,NULL,NULL),(820,25,5,69,138,1,'',1,NULL,NULL,NULL),(821,25,11,0,0,0,'',0,NULL,NULL,NULL),(822,25,0,0,0,0,'',0,NULL,NULL,NULL),(823,25,0,0,0,0,'',0,NULL,NULL,NULL),(824,25,0,0,0,0,'',0,NULL,NULL,NULL),(825,25,0,0,0,0,'',0,NULL,NULL,NULL),(826,25,0,0,0,0,'',0,NULL,NULL,NULL),(827,25,0,0,0,0,'',0,NULL,NULL,NULL),(828,25,0,0,0,0,'',0,NULL,NULL,NULL),(829,25,0,0,0,0,'',0,NULL,NULL,NULL),(830,25,0,0,0,0,'',0,NULL,NULL,NULL),(831,25,0,0,0,0,'',0,NULL,NULL,NULL),(832,25,0,0,0,0,'',0,NULL,NULL,NULL),(833,25,0,0,0,0,'',0,NULL,NULL,NULL),(834,25,0,0,0,0,'',0,NULL,NULL,NULL),(835,25,0,0,0,0,'',0,NULL,NULL,NULL),(836,25,0,0,0,0,'',0,NULL,NULL,NULL),(837,25,0,0,0,0,'',0,NULL,NULL,NULL),(838,25,0,0,0,0,'',0,NULL,NULL,NULL),(839,25,0,0,0,0,'',0,NULL,NULL,NULL),(840,25,0,0,0,0,'',0,NULL,NULL,NULL),(841,25,0,0,0,0,'',0,NULL,NULL,NULL),(842,25,0,0,0,0,'',0,NULL,NULL,NULL),(843,25,0,0,0,0,'',0,NULL,NULL,NULL),(844,25,0,0,0,0,'',0,NULL,NULL,NULL),(845,25,0,0,0,0,'',0,NULL,NULL,NULL),(846,25,0,0,0,0,'',0,NULL,NULL,NULL),(847,25,0,0,0,0,'',0,NULL,NULL,NULL),(848,25,0,0,0,0,'',0,NULL,NULL,NULL),(849,25,0,0,0,0,'',0,NULL,NULL,NULL),(850,25,0,0,0,0,'',0,NULL,NULL,NULL),(851,25,0,0,0,0,'',0,NULL,NULL,NULL),(852,25,0,0,0,0,'',0,NULL,NULL,NULL),(853,25,0,0,0,0,'',0,NULL,NULL,NULL),(854,25,0,0,0,0,'',0,NULL,NULL,NULL),(855,25,0,0,0,0,'',0,NULL,NULL,NULL),(856,25,0,0,0,0,'',0,NULL,NULL,NULL),(857,25,0,0,0,0,'',0,NULL,NULL,NULL),(858,25,0,0,0,0,'',0,NULL,NULL,NULL),(859,25,0,0,0,0,'',0,NULL,NULL,NULL),(860,25,0,0,0,0,'',0,NULL,NULL,NULL),(861,25,0,0,0,0,'',0,NULL,NULL,NULL),(862,25,0,0,0,0,'',0,NULL,NULL,NULL),(863,25,0,0,0,0,'',0,NULL,NULL,NULL),(864,25,0,0,0,0,'',0,NULL,NULL,NULL),(865,25,0,0,0,0,'',0,NULL,NULL,NULL),(866,25,0,0,0,0,'',0,NULL,NULL,NULL),(867,25,0,0,0,0,'',0,NULL,NULL,NULL),(868,25,0,0,0,0,'',0,NULL,NULL,NULL),(869,27,1,13,1,1,'Andohatapenaka ',1,NULL,NULL,NULL),(870,28,1,13,1,1,'Andohatapenaka ',1,NULL,NULL,NULL),(871,29,1,13,1,1,'Andohatapenaka ',1,NULL,NULL,NULL),(872,30,0,0,0,0,'',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cnfi_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` double DEFAULT NULL,
  `username` varchar(765) DEFAULT NULL,
  `password` blob,
  `fullname` varchar(765) DEFAULT NULL,
  `status` double DEFAULT NULL,
  `image` varchar(765) DEFAULT NULL,
  `privilege` varchar(765) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','7dac56bc5c66de6bb9aa08ea91032677725d6787','Tojo Michaël',2,'tojo.jpg','superadmin'),(2,'walter','5d4054e975ce2eac47904dbcd15952f61c6cb29d','Walter Ambinintsoa',2,'walter.jpg','superadmin'),(3,'soamialy','e0d5eecd57b35bfd63adf3b3990f9fe94a2af3f0','Soamialy',2,'soamialy.jpg','superadmin'),(4,'andry','596045f5286e9b44528b44043768dedddc4f5f38','Andrianina ',2,'andry.jpg','superadmin'),(5,'onja','80b99354bb278c11fa9e891d110e175de6ebc8a0','Onja',2,'onja.jpg','superadmin'),(6,'Wilfried','6d2d9860aa7a7c158b96d06657923560992284ec','Wilfried Afopa',2,'avatar5.png','admin');
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

-- Dump completed on 2020-09-14  7:21:44
