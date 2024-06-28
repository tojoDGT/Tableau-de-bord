-- MySQL dump 10.13  Distrib 5.6.46, for Linux (x86_64)
--
-- Host: 10.2.206.75    Database: cnfifo
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
-- Table structure for table `cnfifo_contact`
--

DROP TABLE IF EXISTS `cnfifo_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfifo_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_nom` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_objet` varchar(255) DEFAULT NULL,
  `contact_message` text,
  PRIMARY KEY (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfifo_contact`
--

LOCK TABLES `cnfifo_contact` WRITE;
/*!40000 ALTER TABLE `cnfifo_contact` DISABLE KEYS */;
INSERT INTO `cnfifo_contact` VALUES (1,'RAZAFINDRABE','033 86 355 42','vahatracompta@gmail.com','Mot de passe oublié','J\'arrive pas ouvrir la base. J\'ai déjà modifié une fois et je l\'ai oublié. Je vous demande quoi faire ?\r\nMerci');
/*!40000 ALTER TABLE `cnfifo_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfifo_contenu`
--

DROP TABLE IF EXISTS `cnfifo_contenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfifo_contenu` (
  `contenu_id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu_type` int(11) DEFAULT NULL,
  `contenu_description` tinytext,
  PRIMARY KEY (`contenu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfifo_contenu`
--

LOCK TABLES `cnfifo_contenu` WRITE;
/*!40000 ALTER TABLE `cnfifo_contenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `cnfifo_contenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfifo_equipe`
--

DROP TABLE IF EXISTS `cnfifo_equipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfifo_equipe` (
  `equipe_id` int(11) NOT NULL AUTO_INCREMENT,
  `equipe_image` varchar(255) DEFAULT NULL,
  `equipe_nom` text,
  `equipe_prenom` text,
  `equipe_responsable` text,
  `equipe_description` text,
  `equipe_ordre` int(11) DEFAULT NULL,
  PRIMARY KEY (`equipe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfifo_equipe`
--

LOCK TABLES `cnfifo_equipe` WRITE;
/*!40000 ALTER TABLE `cnfifo_equipe` DISABLE KEYS */;
INSERT INTO `cnfifo_equipe` VALUES (1,'walter.png','RAZAKANTOANINA','Walter Ambinintsoa','Chef de division suivi-&eacute;valuation','',1),(2,'soamialy.png','RAFIRINGA','Soamialy','Chargée d\'études suivi-évaluation','',2),(3,'onja.png','RAJAONSON','Onjatina','Chargé d\'études suivi-évaluation','',3),(4,'andry.png','RARIVONONA','Andrianina Nantenaina','Chargée d\'études suivi-évaluation','',4),(5,'tojo.png','RANDRIANANTENAINA','Tojo Michaël','Développeur back end, responsable <br/>Base de donnée','',5);
/*!40000 ALTER TABLE `cnfifo_equipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfifo_mission`
--

DROP TABLE IF EXISTS `cnfifo_mission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfifo_mission` (
  `mission_id` int(11) NOT NULL AUTO_INCREMENT,
  `mission_titre` varchar(255) DEFAULT NULL,
  `mission_descriptionCourt` text,
  `mission_descriptionLong` text,
  `mission_ordre` int(11) DEFAULT NULL,
  PRIMARY KEY (`mission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfifo_mission`
--

LOCK TABLES `cnfifo_mission` WRITE;
/*!40000 ALTER TABLE `cnfifo_mission` DISABLE KEYS */;
INSERT INTO `cnfifo_mission` VALUES (1,'Ny Asanay ','Donec suscipit hendrerit euismod. Ut at nisl sem. Praesent ac efficitur mi. Sed fermentum iaculis accumsan. Mauris rutrum dignissim eros id finibus sed turpis in diam mollis lobortis. <br><br>Phasellus tincidunt leo ante, quis convallis lectus pretium vel. Ut blandit, est eget feugiat laoreet, magna nisi volutpat ligula, commodo efficitur metus magna vel sapien.',NULL,2),(2,'Mission 2','<p>Mission 2 courte&nbsp;</p>','<p>&nbsp;Mission 2 longue</p>',1);
/*!40000 ALTER TABLE `cnfifo_mission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfifo_qsn`
--

DROP TABLE IF EXISTS `cnfifo_qsn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfifo_qsn` (
  `qsn_id` int(11) NOT NULL AUTO_INCREMENT,
  `qsn_image` varchar(255) DEFAULT NULL,
  `qsn_titre` varchar(255) DEFAULT NULL,
  `qsn_description` text,
  `qsn_ordre` int(11) DEFAULT NULL,
  PRIMARY KEY (`qsn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfifo_qsn`
--

LOCK TABLES `cnfifo_qsn` WRITE;
/*!40000 ALTER TABLE `cnfifo_qsn` DISABLE KEYS */;
INSERT INTO `cnfifo_qsn` VALUES (1,'matheus-ferrero-pg_WCHWSdT8-unsplash.jpg','CNFI','<p>Coordonnation Nationale de la Finance Inclusive</p>',1);
/*!40000 ALTER TABLE `cnfifo_qsn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cnfifo_slide`
--

DROP TABLE IF EXISTS `cnfifo_slide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cnfifo_slide` (
  `slide_id` int(11) NOT NULL AUTO_INCREMENT,
  `slide_image` varchar(255) DEFAULT NULL,
  `slide_titre` varchar(255) DEFAULT NULL,
  `slide_sousTitre` text,
  `slide_contenu` text,
  `slide_ordre` int(11) DEFAULT NULL,
  PRIMARY KEY (`slide_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cnfifo_slide`
--

LOCK TABLES `cnfifo_slide` WRITE;
/*!40000 ALTER TABLE `cnfifo_slide` DISABLE KEYS */;
INSERT INTO `cnfifo_slide` VALUES (2,'money-2696219_1920_(2).jpg','Base de données de l\'inclusion financière de Madagascar','Pourquoi une base de données de l\'inclusion financière?','<p><span style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">L&rsquo;inclusion financi&egrave;re, dans le contexte malagasy, se d&eacute;finit comme &laquo;&nbsp;</span><i style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">l&rsquo;acc&egrave;s et l&rsquo;utilisation pour tous les segments de la population malgache de produits et services financiers adapt&eacute;s et de proximit&eacute;, dont l&rsquo;&eacute;pargne, l&rsquo;assurance, le paiement et le cr&eacute;dit, offerts par des institutions p&eacute;rennes</i><span style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">&nbsp;&raquo;.</span></p>\r\n<p><span style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">Dans le cadre de la mise en &oelig;uvre des Objectifs de D&eacute;veloppement Durable &agrave; l&rsquo;horizon 2030 (ODD), le Gouvernement fait de l&rsquo;inclusion financi&egrave;re l&rsquo;un des outils privil&eacute;gi&eacute;s pour la promotion d&rsquo;une croissance &eacute;conomique forte et inclusive &agrave; Madagascar.&nbsp;</span></p>\r\n<p><span style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">Dans le but de soutenir une&nbsp;meilleure inclusion financi&egrave;re dans le pays, le Gouvernement a adopt&eacute; en Mai 2018, la </span><b style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">Strat&eacute;gie Nationale d&rsquo;Inclusion Financi&egrave;re (SNIM, 2018-2022)</b><span style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">. Elle&nbsp;a pour vision d&rsquo;am&eacute;liorer l&rsquo;acc&egrave;s aux services financiers de la population malagasy en augmentant le nombre d&rsquo;adultes ayant acc&egrave;s aux services financiers formels de 29% en 2016&nbsp;&agrave; 45% d&rsquo;ici 2022.</span></p>\r\n<p><span style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">Le Minist&egrave;re de l&rsquo;Economie et des Finances de Madagascar, &agrave; travers la </span><b style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">Coordination Nationale de la Finance Inclusive (CNFI)</b><span style=\"font-family: Calibri, sans-serif; font-size: 13pt;\">, assure la coordination et la promotion de l&rsquo;inclusion financi&egrave;re.&nbsp;La mise en place d&rsquo;un cadre de suivi-&eacute;valuation performant et efficace s&rsquo;av&egrave;re indispensable.</span></p>\r\n<p><span style=\"font-family: Calibri, sans-serif; font-size: 13pt; text-align: justify;\">Ainsi, pour assurer la r&eacute;ussite de la mise en &oelig;uvre de la SNIM et garantir le suivi de l&rsquo;&eacute;volution de l&rsquo;inclusion financi&egrave;re du pays, la CNFI a pour t&acirc;che de mesurer p&eacute;riodiquement l&rsquo;avancement des activit&eacute;s entreprises par l&rsquo;interm&eacute;diaire d&rsquo;indicateurs pr&eacute;alablement &eacute;tablis et de communiquer les r&eacute;sultats des interventions par l&rsquo;&eacute;tablissement des rapports de suivi.</span></p>\r\n<p><span style=\"font-family: Calibri, sans-serif; font-size: 13pt; text-align: justify;\">Une collecte p&eacute;riodique de donn&eacute;es aupr&egrave;s de toutes les institutions financi&egrave;res du pays est fondamentale pour l\'efficacit&eacute; de ce cadre de suivi-&eacute;valuation. Pour ce faire, la CNFI a mis en place cette plateforme de collecte en ligne; dans un but de faciliter et de s&eacute;curiser la transmission des donn&eacute;es.</span><span style=\"font-family: Calibri, sans-serif; font-size: 13pt; text-align: justify;\"><br type=\"_moz\" />\r\n</span></p>',3);
/*!40000 ALTER TABLE `cnfifo_slide` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-14  7:22:03
