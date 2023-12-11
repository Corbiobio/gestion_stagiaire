-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 11 déc. 2023 à 12:53
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
('6576sdfzed19596488', '6576e4e87fc64', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e615c36a1', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e6276f4a3', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e628082b7', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e6283688d', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e63a412f1', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e64130e8c', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e6570a3ff', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e66c76f45', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e66d14daa', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e6dfa5fbe', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e7d49b1c7', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576e8b601df1', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576ea4e69130', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576ea747405e', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576ea78bb46a', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576ea78e1bb2', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576ea79114d3', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576ea8a82b97', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576ea8ac19a0', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6576ea8aec571', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6577020733b3b', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '6577026ab514c', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '657702844163a', '2023-12-11', '2023-12-11'),
('6576sdfzed19596488', '657702c0c6759', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e4e87fc64', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e615c36a1', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e6276f4a3', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e628082b7', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e6283688d', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e63a412f1', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e64130e8c', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e6570a3ff', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e66c76f45', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e66d14daa', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e6dfa5fbe', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e7d49b1c7', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576e8b601df1', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576ea4e69130', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576ea747405e', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576ea78bb46a', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576ea78e1bb2', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576ea79114d3', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576ea8a82b97', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576ea8ac19a0', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6576ea8aec571', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6577020733b3b', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '6577026ab514c', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '657702844163a', '2023-12-11', '2023-12-11'),
('6sdf576d19596488sdfs', '657702c0c6759', '2023-12-11', '2023-12-11');

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
('6576sdfzed19596488', 4597863, 'zelda'),
('6sdf576d19596488sdfs', 41564, 'link'),
('gsd:kgdfssq', 41564, 'flo');

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
('8456sg', '6576sdfzed19596488'),
('6576d19596588', '6sdf576d19596488sdfs'),
('6576d1dsf6488', '6sdf576d19596488sdfs'),
('6576d19596588', 'gsd:kgdfssq'),
('6576d1dsf6488', 'gsd:kgdfssq'),
('8456sg', 'gsd:kgdfssq');

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
('6576d395cc063', '8456sg', '6576d19596488', 'vabien', 'tu'),
('6576d409657a7', '8456sg', '6576d195sdf96488s', 'dfsfsd', 'sdf'),
('6576d4a662824', '6576d19596588', '6576d19596488', 'aaa', 'aaaa'),
('6576d52ba33bf', '6576d19596588', '6576d19596488', 'aaa', 'aaaa'),
('6576d531f2cfa', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576d55c95c3d', '6576d19596588', '6576d19596488', 'dfgdfg', 'dfg'),
('6576d5b74f0c0', '6576d19596588', '6576d19596488', 'dfgdfg', 'dfg'),
('6576d5d674b15', '6576d19596588', '6576d19596488', 'dfgdfg', 'dfg'),
('6576d5e61a3f6', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576d62850d77', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576d632de44c', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576d635db882', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576d638ba71b', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576d64526495', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576d64b947f5', '6576d19596588', '6576d19596488', 'aaaaa', 'a'),
('6576d65180f4a', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576e2121ef4a', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576e282226e8', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576e328d6576', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576e48b3425c', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576e4b613a71', '6576d19596588', '6576d19596488', 'a', 'a'),
('6576e4bd3dee5', '6576d19596588', '6576d19596488', 'aaaaaaa', 'aaaa'),
('6576e4e87fc64', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e615c36a1', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e6276f4a3', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e628082b7', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e6283688d', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e63a412f1', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e64130e8c', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e6570a3ff', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e66c76f45', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e66d14daa', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e6dfa5fbe', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e7d49b1c7', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576e8b601df1', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576ea4e69130', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576ea747405e', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576ea78bb46a', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576ea78e1bb2', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576ea79114d3', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576ea8a82b97', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576ea8ac19a0', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6576ea8aec571', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6577020733b3b', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('6577026ab514c', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('657702844163a', '8456sg', '6576d195sdf96488s', 'test', 'test'),
('657702c0c6759', '8456sg', '6576d195sdf96488s', 'test', 'test');

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
('8456sg', 'ui_designer');

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
