CREATE DATABASE  IF NOT EXISTS `exerciciodml1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `exerciciodml1`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: exerciciodml1
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `depto`
--

DROP TABLE IF EXISTS `depto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depto` (
  `coddepto` int(11) NOT NULL,
  `nomedepto` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`coddepto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depto`
--

LOCK TABLES `depto` WRITE;
/*!40000 ALTER TABLE `depto` DISABLE KEYS */;
/*!40000 ALTER TABLE `depto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplina`
--

DROP TABLE IF EXISTS `disciplina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplina` (
  `coddepto` int(11) NOT NULL,
  `numdisc` int(11) NOT NULL,
  `nomedisc` varchar(50) DEFAULT NULL,
  `creditosdisc` int(11) DEFAULT NULL,
  PRIMARY KEY (`coddepto`,`numdisc`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplina`
--

LOCK TABLES `disciplina` WRITE;
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horario` (
  `coddepto` int(11) NOT NULL,
  `numdisc` int(11) NOT NULL,
  `anosem` int(11) NOT NULL,
  `siglatur` varchar(20) NOT NULL,
  `diasem` date NOT NULL,
  `horainicio` time NOT NULL,
  `codpredio_predio` int(11) NOT NULL,
  `numsala_sala` int(11) NOT NULL,
  `numhoras` time DEFAULT NULL,
  PRIMARY KEY (`coddepto`,`numdisc`,`anosem`,`siglatur`,`diasem`,`horainicio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predio`
--

DROP TABLE IF EXISTS `predio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `predio` (
  `codpredio` int(11) NOT NULL,
  `descricaopredio` varchar(70) NOT NULL,
  PRIMARY KEY (`codpredio`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predio`
--

LOCK TABLES `predio` WRITE;
/*!40000 ALTER TABLE `predio` DISABLE KEYS */;
/*!40000 ALTER TABLE `predio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prereq`
--

DROP TABLE IF EXISTS `prereq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prereq` (
  `coddepto` int(11) NOT NULL,
  `numdisc` int(11) NOT NULL,
  `coddeptoprereq` int(11) NOT NULL,
  `numdiscprereq` int(11) NOT NULL,
  PRIMARY KEY (`coddepto`,`numdisc`,`coddeptoprereq`,`numdiscprereq`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prereq`
--

LOCK TABLES `prereq` WRITE;
/*!40000 ALTER TABLE `prereq` DISABLE KEYS */;
/*!40000 ALTER TABLE `prereq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professor` (
  `codprof` int(11) NOT NULL,
  `coddepto_depto` int(11) NOT NULL,
  `codtit_titulacao` int(11) NOT NULL,
  `nomeprof` varchar(50) NOT NULL,
  PRIMARY KEY (`codprof`),
  KEY `coddepto_depto` (`coddepto_depto`),
  KEY `codtit_titulacao` (`codtit_titulacao`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profturma`
--

DROP TABLE IF EXISTS `profturma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profturma` (
  `coddepto` int(11) NOT NULL,
  `numdisc` int(11) NOT NULL,
  `anosem` int(11) NOT NULL,
  `siglatur` varchar(20) NOT NULL,
  `codprof` int(11) NOT NULL,
  PRIMARY KEY (`coddepto`,`numdisc`,`anosem`,`siglatur`,`codprof`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profturma`
--

LOCK TABLES `profturma` WRITE;
/*!40000 ALTER TABLE `profturma` DISABLE KEYS */;
/*!40000 ALTER TABLE `profturma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `codpredio` int(11) NOT NULL,
  `numsala` int(11) NOT NULL,
  `descricaosala` varchar(20) NOT NULL,
  `capacidade` int(11) NOT NULL,
  PRIMARY KEY (`codpredio`,`numsala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulacao`
--

DROP TABLE IF EXISTS `titulacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulacao` (
  `codtit` int(11) NOT NULL,
  `nometit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codtit`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulacao`
--

LOCK TABLES `titulacao` WRITE;
/*!40000 ALTER TABLE `titulacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turma`
--

DROP TABLE IF EXISTS `turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `turma` (
  `coddepto` int(11) NOT NULL,
  `numdisc` int(11) NOT NULL,
  `anosem` int(11) NOT NULL,
  `siglatur` varchar(20) NOT NULL,
  `capacidade` int(11) NOT NULL,
  PRIMARY KEY (`coddepto`,`numdisc`,`anosem`,`siglatur`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turma`
--

LOCK TABLES `turma` WRITE;
/*!40000 ALTER TABLE `turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-17 17:39:42
