-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Sam 28 Avril 2018 à 19:44
-- Version du serveur: 5.5.24-log
-- Version de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `projet`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `ID_USER2` varchar(10) NOT NULL,
  `PASS` varchar(50) DEFAULT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  `PRIVILEGE` varchar(50) DEFAULT NULL,
  `PSEUDO` varchar(50) NOT NULL,
  `CONNECTE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_USER2`),
  UNIQUE KEY `PSEUDO` (`PSEUDO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`ID_USER2`, `PASS`, `NOM`, `PRENOM`, `PRIVILEGE`, `PSEUDO`, `CONNECTE`) VALUES
('1', 'mdp', 'MBOUP', 'Mouhamadane', 'Admin', 'Ad1004664', 'oui'),
('2', 'passer', 'DIENG', 'Lamane', 'Admin', 'Ad1004998', 'oui');

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `IDCLASSE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMCLASSE` varchar(50) DEFAULT NULL,
  `EFFECTIF` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDCLASSE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `classe`
--

INSERT INTO `classe` (`IDCLASSE`, `NOMCLASSE`, `EFFECTIF`) VALUES
(1, 'SID2', 300),
(2, 'SID3', 25),
(3, 'MPCI 1', 450),
(4, 'MPCI 2', 150),
(5, 'Master 1 Chimie', 20),
(6, 'L3 MATH', 30),
(7, 'Mater 1 MATH', 20);

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE IF NOT EXISTS `enseignant` (
  `ID_ENSEIGNANT` varchar(10) NOT NULL,
  `PASS` varchar(50) DEFAULT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  `PRIVILEGE` varchar(50) DEFAULT NULL,
  `PSEUDO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_ENSEIGNANT`),
  UNIQUE KEY `PSEUDO` (`PSEUDO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `enseignant`
--

INSERT INTO `enseignant` (`ID_ENSEIGNANT`, `PASS`, `NOM`, `PRENOM`, `PRIVILEGE`, `PSEUDO`) VALUES
('1', 'passer', 'CAMARA', 'FODE', 'Enseignant', 'EN001'),
('2', 'passer', 'CAMARA', 'Gaoussou', 'Enseignant', 'EN002');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `ID_USER3` varchar(10) NOT NULL,
  `IDCLASSE` int(11) NOT NULL,
  `PASS` varchar(50) DEFAULT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `PRENOM` varchar(50) DEFAULT NULL,
  `PRIVILEGE` varchar(50) DEFAULT NULL,
  `PSEUDO` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_USER3`),
  UNIQUE KEY `Pseudo` (`PSEUDO`),
  KEY `IDCLASSE` (`IDCLASSE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `etudiant`
--

INSERT INTO `etudiant` (`ID_USER3`, `IDCLASSE`, `PASS`, `NOM`, `PRENOM`, `PRIVILEGE`, `PSEUDO`) VALUES
('2', 2, 'passer', 'DIENG', 'Lamane', 'Etudiant', '1004998'),
('ET01', 3, 'passer', 'DIOP', 'Fatou', 'Etudiant', '1004664');

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `CODEMATIERE` varchar(10) NOT NULL,
  `LIBELLE` varchar(25) DEFAULT NULL,
  `VH` int(11) DEFAULT NULL,
  PRIMARY KEY (`CODEMATIERE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `matiere`
--

INSERT INTO `matiere` (`CODEMATIERE`, `LIBELLE`, `VH`) VALUES
('ADD', 'ANALYSE DE DONNEES', 4),
('BDD', 'Base de Donnees', 4),
('DW', 'DatawareHouse', 4),
('ML', 'Modelisation Lineaire', 4),
('OPT001', 'Optimisation', 2),
('PLC', 'Langage C', 4),
('RES1', 'Initiation Reseau', 4),
('RO', 'Recherche Operationnelle', 4),
('SONDAGE1', 'Sondage', 4);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `idmes` int(11) NOT NULL AUTO_INCREMENT,
  `CODEMATIERE` varchar(10) NOT NULL,
  `ID_ENSEIGNANT` varchar(10) NOT NULL,
  `IDSALLE` int(11) NOT NULL,
  `DATE` date NOT NULL,
  `DEBUT` time NOT NULL,
  `FIN` time NOT NULL,
  `DATESENDING` date NOT NULL,
  `NUM` varchar(25) NOT NULL,
  `LU` int(11) NOT NULL,
  PRIMARY KEY (`idmes`),
  KEY `ID_ENSEIGNANT` (`ID_ENSEIGNANT`,`IDSALLE`),
  KEY `IDSALLE` (`IDSALLE`),
  KEY `CODEMATIERE` (`CODEMATIERE`),
  KEY `CODEMATIERE_2` (`CODEMATIERE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `message`
--

INSERT INTO `message` (`idmes`, `CODEMATIERE`, `ID_ENSEIGNANT`, `IDSALLE`, `DATE`, `DEBUT`, `FIN`, `DATESENDING`, `NUM`, `LU`) VALUES
(8, 'RO', '1', 8, '2018-04-14', '10:00:00', '12:00:00', '2018-04-26', 'danelegrand@gmail.com', 0),
(9, 'OPT001', '1', 1, '2018-04-15', '10:00:00', '11:00:00', '2018-04-26', 'danelegrand@gmail.com', 0),
(10, 'OPT001', '1', 8, '2018-04-22', '08:00:00', '10:00:00', '2018-04-27', 'danelegrand@gmail.com', 0),
(15, 'BDD', '1', 1, '2018-04-08', '11:11:00', '11:01:00', '2018-04-27', 'danelegrand@gmail.com', 0);

-- --------------------------------------------------------

--
-- Structure de la table `occupation`
--

CREATE TABLE IF NOT EXISTS `occupation` (
  `NOCCUPATION` int(11) NOT NULL AUTO_INCREMENT,
  `CODEMATIERE` varchar(10) NOT NULL,
  `ID_ENSEIGNANT` varchar(10) NOT NULL,
  `IDCLASSE` int(11) NOT NULL,
  `IDSALLE` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `DEBUT` time DEFAULT NULL,
  `FIN` time NOT NULL,
  PRIMARY KEY (`NOCCUPATION`),
  KEY `FK_CONCERNER4` (`ID_ENSEIGNANT`),
  KEY `IDSALLE` (`IDSALLE`),
  KEY `IDCLASSE` (`IDCLASSE`),
  KEY `CODEMATIERE` (`CODEMATIERE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Contenu de la table `occupation`
--

INSERT INTO `occupation` (`NOCCUPATION`, `CODEMATIERE`, `ID_ENSEIGNANT`, `IDCLASSE`, `IDSALLE`, `DATE`, `DEBUT`, `FIN`) VALUES
(1, 'OPT001', '1', 1, 1, '2018-04-23', '11:01:00', '11:01:00'),
(3, 'OPT001', '1', 1, 1, '2018-04-23', '11:01:00', '12:12:00'),
(4, 'OPT001', '2', 1, 8, '2018-04-24', '00:59:00', '11:11:00'),
(5, 'OPT001', '1', 1, 1, '2018-04-24', '11:01:00', '13:03:00'),
(7, 'OPT001', '1', 4, 8, '2018-04-25', '12:03:00', '12:02:00'),
(10, 'OPT001', '1', 1, 8, '2018-04-25', '10:00:00', '12:00:00'),
(11, 'OPT001', '1', 1, 2, '2018-04-25', '15:00:00', '18:00:00'),
(12, 'OPT001', '2', 1, 1, '2018-04-25', '15:00:00', '18:00:00'),
(13, 'DW', '2', 2, 8, '2018-04-25', '08:00:00', '12:00:00'),
(14, 'DW', '2', 1, 1, '2018-04-26', '12:00:00', '15:00:00'),
(15, 'DW', '1', 2, 1, '2018-04-27', '10:00:00', '12:00:00'),
(16, 'RO', '2', 1, 8, '2018-04-27', '10:00:00', '12:00:00'),
(17, 'OPT001', '1', 2, 8, '2018-04-27', '08:00:00', '10:00:00'),
(19, 'ADD', '1', 1, 1, '2018-04-27', '12:02:00', '14:00:00'),
(20, 'PLC', '1', 1, 10, '2018-04-28', '08:00:00', '12:00:00'),
(21, 'BDD', '2', 2, 2, '2018-04-28', '08:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `IDSALLE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMSALLE` varchar(10) DEFAULT NULL,
  `CAPACITE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDSALLE`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`IDSALLE`, `NOMSALLE`, `CAPACITE`) VALUES
(1, 'Salle tp c', 20),
(2, 'Salle 2', 30),
(8, 'salle 10', 0),
(10, 'Salle Info', 20),
(11, 'salle 5', 30),
(12, 'salle chim', 20);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`IDCLASSE`) REFERENCES `classe` (`IDCLASSE`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`ID_ENSEIGNANT`) REFERENCES `enseignant` (`ID_ENSEIGNANT`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`IDSALLE`) REFERENCES `salle` (`IDSALLE`),
  ADD CONSTRAINT `message_ibfk_3` FOREIGN KEY (`CODEMATIERE`) REFERENCES `matiere` (`CODEMATIERE`);

--
-- Contraintes pour la table `occupation`
--
ALTER TABLE `occupation`
  ADD CONSTRAINT `FK_CONCERNER4` FOREIGN KEY (`ID_ENSEIGNANT`) REFERENCES `enseignant` (`ID_ENSEIGNANT`),
  ADD CONSTRAINT `occupation_ibfk_1` FOREIGN KEY (`IDSALLE`) REFERENCES `salle` (`IDSALLE`),
  ADD CONSTRAINT `occupation_ibfk_2` FOREIGN KEY (`IDCLASSE`) REFERENCES `classe` (`IDCLASSE`),
  ADD CONSTRAINT `occupation_ibfk_3` FOREIGN KEY (`CODEMATIERE`) REFERENCES `matiere` (`CODEMATIERE`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
