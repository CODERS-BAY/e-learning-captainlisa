-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Apr 2020 um 14:33
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `elearning`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `course_list`
--

CREATE TABLE `course_list` (
  `course_list_id` int(11) NOT NULL,
  `lva_nr` int(11) DEFAULT NULL,
  `personal_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `curriculum`
--

CREATE TABLE `curriculum` (
  `curriculum_id` int(11) NOT NULL,
  `lva_nr` int(11) DEFAULT NULL,
  `module_id` int(11) DEFAULT NULL,
  `order_nr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ecourse`
--

CREATE TABLE `ecourse` (
  `lva_nr` int(11) NOT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `requirement_id` int(11) DEFAULT NULL,
  `moderator_allo_id` int(11) DEFAULT NULL,
  `course_list_id` int(11) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `max_participants` int(11) DEFAULT NULL,
  `duration` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `exam_mode`
--

CREATE TABLE `exam_mode` (
  `mode_id` int(11) NOT NULL,
  `question_allo_id` int(11) DEFAULT NULL,
  `type_of_test` varchar(20) DEFAULT NULL,
  `deadline` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `exam_begin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `learning_module`
--

CREATE TABLE `learning_module` (
  `module_id` int(11) NOT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `learning_object`
--

CREATE TABLE `learning_object` (
  `designation` varchar(20) NOT NULL,
  `module_id` int(11) NOT NULL,
  `type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `moderator_allocation`
--

CREATE TABLE `moderator_allocation` (
  `moderator_allo_id` int(11) NOT NULL,
  `lva_nr` int(11) DEFAULT NULL,
  `moderator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `person`
--

CREATE TABLE `person` (
  `personal_id` int(11) NOT NULL,
  `moderator_allo_id` int(11) DEFAULT NULL,
  `course_list_id` int(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `is_moderator` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `questionnaire`
--

CREATE TABLE `questionnaire` (
  `question_id` int(11) NOT NULL,
  `question_allo_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `aw_true` text DEFAULT NULL,
  `aw_false1` text DEFAULT NULL,
  `aw_false2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `question_allocation`
--

CREATE TABLE `question_allocation` (
  `question_allo_id` int(11) NOT NULL,
  `mode_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `requirement_list`
--

CREATE TABLE `requirement_list` (
  `requirement_id` int(11) NOT NULL,
  `lva_nr` int(11) DEFAULT NULL,
  `prerequisite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `test_module`
--

CREATE TABLE `test_module` (
  `test_id` int(11) NOT NULL,
  `mode_id` int(11) DEFAULT NULL,
  `definition` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `course_list`
--
ALTER TABLE `course_list`
  ADD PRIMARY KEY (`course_list_id`);

--
-- Indizes für die Tabelle `curriculum`
--
ALTER TABLE `curriculum`
  ADD PRIMARY KEY (`curriculum_id`);

--
-- Indizes für die Tabelle `ecourse`
--
ALTER TABLE `ecourse`
  ADD PRIMARY KEY (`lva_nr`),
  ADD KEY `curriculum_id` (`curriculum_id`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `requirement_id` (`requirement_id`),
  ADD KEY `moderator_allo_id` (`moderator_allo_id`),
  ADD KEY `course_list_id` (`course_list_id`);

--
-- Indizes für die Tabelle `exam_mode`
--
ALTER TABLE `exam_mode`
  ADD PRIMARY KEY (`mode_id`),
  ADD KEY `question_allo_id` (`question_allo_id`);

--
-- Indizes für die Tabelle `learning_module`
--
ALTER TABLE `learning_module`
  ADD PRIMARY KEY (`module_id`),
  ADD KEY `curriculum_id` (`curriculum_id`);

--
-- Indizes für die Tabelle `learning_object`
--
ALTER TABLE `learning_object`
  ADD PRIMARY KEY (`designation`,`module_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indizes für die Tabelle `moderator_allocation`
--
ALTER TABLE `moderator_allocation`
  ADD PRIMARY KEY (`moderator_allo_id`);

--
-- Indizes für die Tabelle `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`personal_id`),
  ADD KEY `moderator_allo_id` (`moderator_allo_id`),
  ADD KEY `course_list_id` (`course_list_id`);

--
-- Indizes für die Tabelle `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `question_allo_id` (`question_allo_id`);

--
-- Indizes für die Tabelle `question_allocation`
--
ALTER TABLE `question_allocation`
  ADD PRIMARY KEY (`question_allo_id`);

--
-- Indizes für die Tabelle `requirement_list`
--
ALTER TABLE `requirement_list`
  ADD PRIMARY KEY (`requirement_id`);

--
-- Indizes für die Tabelle `test_module`
--
ALTER TABLE `test_module`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `mode_id` (`mode_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `ecourse`
--
ALTER TABLE `ecourse`
  ADD CONSTRAINT `ecourse_ibfk_1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`curriculum_id`),
  ADD CONSTRAINT `ecourse_ibfk_2` FOREIGN KEY (`test_id`) REFERENCES `test_module` (`test_id`),
  ADD CONSTRAINT `ecourse_ibfk_3` FOREIGN KEY (`requirement_id`) REFERENCES `requirement_list` (`requirement_id`),
  ADD CONSTRAINT `ecourse_ibfk_4` FOREIGN KEY (`moderator_allo_id`) REFERENCES `moderator_allocation` (`moderator_allo_id`),
  ADD CONSTRAINT `ecourse_ibfk_5` FOREIGN KEY (`course_list_id`) REFERENCES `course_list` (`course_list_id`);

--
-- Constraints der Tabelle `exam_mode`
--
ALTER TABLE `exam_mode`
  ADD CONSTRAINT `exam_mode_ibfk_1` FOREIGN KEY (`question_allo_id`) REFERENCES `question_allocation` (`question_allo_id`);

--
-- Constraints der Tabelle `learning_module`
--
ALTER TABLE `learning_module`
  ADD CONSTRAINT `learning_module_ibfk_1` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`curriculum_id`);

--
-- Constraints der Tabelle `learning_object`
--
ALTER TABLE `learning_object`
  ADD CONSTRAINT `learning_object_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `learning_module` (`module_id`);

--
-- Constraints der Tabelle `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`moderator_allo_id`) REFERENCES `moderator_allocation` (`moderator_allo_id`),
  ADD CONSTRAINT `person_ibfk_2` FOREIGN KEY (`course_list_id`) REFERENCES `course_list` (`course_list_id`);

--
-- Constraints der Tabelle `questionnaire`
--
ALTER TABLE `questionnaire`
  ADD CONSTRAINT `questionnaire_ibfk_1` FOREIGN KEY (`question_allo_id`) REFERENCES `question_allocation` (`question_allo_id`);

--
-- Constraints der Tabelle `test_module`
--
ALTER TABLE `test_module`
  ADD CONSTRAINT `test_module_ibfk_1` FOREIGN KEY (`mode_id`) REFERENCES `exam_mode` (`mode_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
