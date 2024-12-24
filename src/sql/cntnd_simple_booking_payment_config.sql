-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 24. Dez 2024 um 19:40
-- Server-Version: 10.6.18-MariaDB-log
-- PHP-Version: 8.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `schuepfenried_db`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cntnd_simple_booking_payment_config`
--

CREATE TABLE `cntnd_simple_booking_payment_config` (
  `id` int(11) NOT NULL,
  `idart` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` datetime NOT NULL,
  `time_until` time DEFAULT NULL,
  `day` int(1) NOT NULL,
  `slots` int(10) NOT NULL,
  `price_id` int(10) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `recurrent` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cntnd_simple_booking_payment_config`
--
ALTER TABLE `cntnd_simple_booking_payment_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idart` (`idart`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cntnd_simple_booking_payment_config`
--
ALTER TABLE `cntnd_simple_booking_payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
