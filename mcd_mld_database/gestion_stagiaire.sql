-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 13 déc. 2023 à 15:07
-- Version du serveur : 8.0.31
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_stagiaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `enseigner`
--

DROP TABLE IF EXISTS `enseigner`;
CREATE TABLE IF NOT EXISTS `enseigner` (
  `ID_FORMATEUR` varchar(255) NOT NULL,
  `ID_STAGIERE` varchar(255) NOT NULL,
  `DATE_DEBUT` date DEFAULT NULL,
  `DATE_FIN` date DEFAULT NULL,
  PRIMARY KEY (`ID_FORMATEUR`,`ID_STAGIERE`),
  KEY `FK_ENSEIGNER` (`ID_STAGIERE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `enseigner`
--

INSERT INTO `enseigner` (`ID_FORMATEUR`, `ID_STAGIERE`, `DATE_DEBUT`, `DATE_FIN`) VALUES
('azf+6165sFsdsdg', '6579c6c7affc4', '2023-12-13', '2023-12-13'),
('lknfdf52651dg5sd123vcb', '6579c6c7affc4', '2023-12-13', '2023-12-13'),
('lknfdf52651dg5sd123vcb', '6579c7427c4a0', '2023-12-13', '2023-12-13'),
('svdjfkghfg54dxh4hth$*4qhtqdr', '6579c6c7affc4', '2023-12-13', '2023-12-13');

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

DROP TABLE IF EXISTS `formateur`;
CREATE TABLE IF NOT EXISTS `formateur` (
  `ID_FORMATEUR` varchar(255) NOT NULL,
  `ID_SALLE` int NOT NULL,
  `NOM_FORMATEUR` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_FORMATEUR`),
  KEY `FK_TRAVAILLER` (`ID_SALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `formateur`
--

INSERT INTO `formateur` (`ID_FORMATEUR`, `ID_SALLE`, `NOM_FORMATEUR`) VALUES
('azf+6165sFsdsdg', 67541111, 'zelda'),
('dhfghlkkghdfgswfvbc', 41564, 'link'),
('lknfdf52651dg5sd123vcb', 4597863, 'ganon'),
('svdjfkghfg54dxh4hth$*4qhtqdr', 41564, 'epona');

-- --------------------------------------------------------

--
-- Structure de la table `former`
--

DROP TABLE IF EXISTS `former`;
CREATE TABLE IF NOT EXISTS `former` (
  `ID_FORMATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ID_FORMATEUR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`ID_FORMATION`,`ID_FORMATEUR`),
  KEY `FK_FORMER` (`ID_FORMATEUR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `former`
--

INSERT INTO `former` (`ID_FORMATION`, `ID_FORMATEUR`) VALUES
('6576d1dsf6488', 'azf+6165sFsdsdg'),
('8456sg', 'azf+6165sFsdsdg'),
('fdhjthqdrgfb', 'dhfghlkkghdfgswfvbc'),
('6576d1dsf6488', 'lknfdf52651dg5sd123vcb'),
('8456sg', 'lknfdf52651dg5sd123vcb'),
('8456sg', 'svdjfkghfg54dxh4hth$*4qhtqdr'),
('fdhjthqdrgfb', 'svdjfkghfg54dxh4hth$*4qhtqdr');

-- --------------------------------------------------------

--
-- Structure de la table `nationaliter`
--

DROP TABLE IF EXISTS `nationaliter`;
CREATE TABLE IF NOT EXISTS `nationaliter` (
  `ID_NATIONALITER` varchar(255) NOT NULL,
  `LABELLE_NATIONALITER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_NATIONALITER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `nationaliter`
--

INSERT INTO `nationaliter` (`ID_NATIONALITER`, `LABELLE_NATIONALITER`) VALUES
('6576d19596488', 'english'),
('6576d19596488xcvxvfs', 'spanish'),
('6576d195sdf96488s', 'french');

-- --------------------------------------------------------

--
-- Structure de la table `salle_formation`
--

DROP TABLE IF EXISTS `salle_formation`;
CREATE TABLE IF NOT EXISTS `salle_formation` (
  `ID_SALLE` int NOT NULL,
  `NOM_SALLE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID_SALLE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `salle_formation`
--

INSERT INTO `salle_formation` (`ID_SALLE`, `NOM_SALLE`) VALUES
(41564, '112'),
(4597863, '903'),
(67541111, '413');

-- --------------------------------------------------------

--
-- Structure de la table `stagiaire`
--

DROP TABLE IF EXISTS `stagiaire`;
CREATE TABLE IF NOT EXISTS `stagiaire` (
  `ID_STAGIAIRE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ID_FORMRATION` varchar(255) NOT NULL,
  `ID_NATIONALITER` varchar(255) NOT NULL,
  `NOM_STAGIERE` varchar(255) DEFAULT NULL,
  `PRENOM_STAGIERE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`ID_STAGIAIRE`),
  KEY `FK_APPRENDRE` (`ID_FORMRATION`),
  KEY `FK_ASSOCIATION_9` (`ID_NATIONALITER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `stagiaire`
--

INSERT INTO `stagiaire` (`ID_STAGIAIRE`, `ID_FORMRATION`, `ID_NATIONALITER`, `NOM_STAGIERE`, `PRENOM_STAGIERE`) VALUES
('6579c1456485b', '8456sg', '6576d19596488', 'dgdfgaaaa', 'dfgdgg'),
('6579c14bc3a7d', '6576d1dsf6488', '6576d19596488', 'g', 'g'),
('6579c15381fad', 'fdhjthqdrgfb', '6576d195sdf96488s', 'naaa', 'n'),
('6579c69ec2bea', '6576d1dsf6488', '6576d19596488', 'sdf', 'se'),
('6579c6c7affc4', '8456sg', '6576d19596488', 'z', 'z'),
('6579c6f2277a1', '6576d1dsf6488', '6576d19596488', 'ghnghn', 'jh,gtfn'),
('6579c7017bedc', '6576d1dsf6488', '6576d19596488', 'ghn', 'ghn'),
('6579c7427c4a0', '6576d1dsf6488', '6576d19596488', 'a', 'a');

-- --------------------------------------------------------

--
-- Structure de la table `type_formation`
--

DROP TABLE IF EXISTS `type_formation`;
CREATE TABLE IF NOT EXISTS `type_formation` (
  `ID_FORMATION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `NOM_FORMATION` longtext,
  PRIMARY KEY (`ID_FORMATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `type_formation`
--

INSERT INTO `type_formation` (`ID_FORMATION`, `NOM_FORMATION`) VALUES
('6576d19596588', 'dev_web'),
('6576d1dsf6488', 'game_dev'),
('8456sg', 'ui_designer'),
('fdhjthqdrgfb', 'boulanger');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `enseigner`
--
ALTER TABLE `enseigner`
  ADD CONSTRAINT `FK_ENSEIGNER` FOREIGN KEY (`ID_STAGIERE`) REFERENCES `stagiaire` (`ID_STAGIAIRE`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_ENSEIGNER3` FOREIGN KEY (`ID_FORMATEUR`) REFERENCES `formateur` (`ID_FORMATEUR`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD CONSTRAINT `FK_TRAVAILLER` FOREIGN KEY (`ID_SALLE`) REFERENCES `salle_formation` (`ID_SALLE`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `former`
--
ALTER TABLE `former`
  ADD CONSTRAINT `FK_FORMER` FOREIGN KEY (`ID_FORMATEUR`) REFERENCES `formateur` (`ID_FORMATEUR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_FORMER2` FOREIGN KEY (`ID_FORMATION`) REFERENCES `type_formation` (`ID_FORMATION`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `stagiaire`
--
ALTER TABLE `stagiaire`
  ADD CONSTRAINT `FK_APPRENDRE` FOREIGN KEY (`ID_FORMRATION`) REFERENCES `type_formation` (`ID_FORMATION`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_ASSOCIATION_9` FOREIGN KEY (`ID_NATIONALITER`) REFERENCES `nationaliter` (`ID_NATIONALITER`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
