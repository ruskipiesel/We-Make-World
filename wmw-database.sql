-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 94.23.90.14:3306
-- Czas generowania: 17 Paź 2017, 19:03
-- Wersja serwera: 5.5.54-0+deb8u1-log
-- Wersja PHP: 7.0.24-1~dotdeb+8.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `db_27021`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-administracja`
--

CREATE TABLE `wmw-administracja` (
  `osoba` int(11) NOT NULL,
  `serial` text NOT NULL,
  `date` text NOT NULL,
  `level` tinyint(1) NOT NULL,
  `visualrank` text,
  `actived` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-frakcje`
--

CREATE TABLE `wmw-frakcje` (
  `code` varchar(125) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-gracze`
--

CREATE TABLE `wmw-gracze` (
  `id` int(11) NOT NULL,
  `login` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `login2` text,
  `pass` text CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `bank_money` int(25) NOT NULL DEFAULT '0',
  `skin` int(11) NOT NULL DEFAULT '0',
  `weave` int(11) NOT NULL DEFAULT '50',
  `reputation` int(25) NOT NULL DEFAULT '0',
  `pjA` int(11) NOT NULL DEFAULT '0',
  `pjB` int(11) NOT NULL DEFAULT '0',
  `pjC` int(11) NOT NULL DEFAULT '0',
  `pjL` int(11) NOT NULL DEFAULT '0',
  `pjH` int(11) NOT NULL DEFAULT '0',
  `worker` int(11) NOT NULL DEFAULT '0',
  `hours` int(12) NOT NULL,
  `mandate` int(10) NOT NULL DEFAULT '0',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `register_serial` varchar(120) DEFAULT NULL,
  `premiumdate` date NOT NULL DEFAULT '0000-00-00',
  `changedpw` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Neveron';

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-kary`
--

CREATE TABLE `wmw-kary` (
  `kolejnosc` int(11) NOT NULL,
  `serial` text NOT NULL,
  `reason` text CHARACTER SET utf8 NOT NULL,
  `time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `type` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-logi`
--

CREATE TABLE `wmw-logi` (
  `name` text CHARACTER SET latin1,
  `osoba` int(11) NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-organizacje`
--

CREATE TABLE `wmw-organizacje` (
  `code` varchar(31) CHARACTER SET utf16 COLLATE utf16_polish_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `rank` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-pojazdy`
--

CREATE TABLE `wmw-pojazdy` (
  `id` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT '411',
  `frozen` int(11) NOT NULL DEFAULT '0',
  `pos` varchar(82) NOT NULL DEFAULT '0, 0, 0, 0, 0, 0',
  `text` mediumtext CHARACTER SET utf32 COLLATE utf32_polish_ci NOT NULL,
  `health` int(11) NOT NULL DEFAULT '1000',
  `fuel` int(11) NOT NULL DEFAULT '100',
  `mileage` int(11) NOT NULL DEFAULT '0',
  `driver` text NOT NULL,
  `color` varchar(50) NOT NULL DEFAULT '255, 255, 255',
  `headlights` varchar(41) NOT NULL DEFAULT '255, 255, 255',
  `paintjob` tinyint(1) NOT NULL DEFAULT '3',
  `tuning` text NOT NULL,
  `panelstates` text NOT NULL,
  `rent` varchar(255) CHARACTER SET utf32 COLLATE utf32_bin DEFAULT '0',
  `plateText` text NOT NULL,
  `ownedGroup` varchar(111) CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT '0',
  `ownedPlayer` int(11) NOT NULL DEFAULT '0',
  `parking` int(11) NOT NULL DEFAULT '0',
  `police` tinyint(1) NOT NULL DEFAULT '0',
  `neon` int(11) NOT NULL DEFAULT '0',
  `blokada` text NOT NULL,
  `registered` varchar(10) NOT NULL DEFAULT 'true',
  `mk1` varchar(1) NOT NULL DEFAULT '0',
  `mk2` varchar(1) NOT NULL DEFAULT '0',
  `masked` tinyint(1) NOT NULL DEFAULT '0',
  `createdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `firstowner` varchar(100) NOT NULL DEFAULT 'Brak',
  `removehood` int(1) NOT NULL DEFAULT '0',
  `rh` varchar(1) NOT NULL DEFAULT '0',
  `tp_to_parking` varchar(99) DEFAULT NULL,
  `naped` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-prace-stale`
--

CREATE TABLE `wmw-prace-stale` (
  `code` varchar(120) NOT NULL,
  `uid` int(11) NOT NULL,
  `actived` date NOT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `NULL` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wmw-prace-urzad`
--

CREATE TABLE `wmw-prace-urzad` (
  `dodatek` int(11) NOT NULL,
  `code` text NOT NULL,
  `name` text NOT NULL,
  `spaces` int(11) NOT NULL DEFAULT '0',
  `maxspaces` int(11) NOT NULL DEFAULT '0',
  `reputation` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `wmw-administracja`
--
ALTER TABLE `wmw-administracja`
  ADD PRIMARY KEY (`osoba`);

--
-- Indexes for table `wmw-frakcje`
--
ALTER TABLE `wmw-frakcje`
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `uid_2` (`uid`),
  ADD KEY `code` (`uid`,`actived`);

--
-- Indexes for table `wmw-gracze`
--
ALTER TABLE `wmw-gracze`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wmw-kary`
--
ALTER TABLE `wmw-kary`
  ADD PRIMARY KEY (`kolejnosc`);

--
-- Indexes for table `wmw-organizacje`
--
ALTER TABLE `wmw-organizacje`
  ADD UNIQUE KEY `uid` (`uid`),
  ADD UNIQUE KEY `uid_2` (`uid`),
  ADD KEY `code` (`uid`,`actived`);

--
-- Indexes for table `wmw-pojazdy`
--
ALTER TABLE `wmw-pojazdy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wmw-prace-stale`
--
ALTER TABLE `wmw-prace-stale`
  ADD UNIQUE KEY `NULL` (`NULL`),
  ADD KEY `code` (`code`,`uid`,`actived`,`added`),
  ADD KEY `code_2` (`code`);

--
-- Indexes for table `wmw-prace-urzad`
--
ALTER TABLE `wmw-prace-urzad`
  ADD PRIMARY KEY (`dodatek`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `wmw-administracja`
--
ALTER TABLE `wmw-administracja`
  MODIFY `osoba` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wmw-gracze`
--
ALTER TABLE `wmw-gracze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wmw-kary`
--
ALTER TABLE `wmw-kary`
  MODIFY `kolejnosc` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wmw-pojazdy`
--
ALTER TABLE `wmw-pojazdy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `wmw-prace-urzad`
--
ALTER TABLE `wmw-prace-urzad`
  MODIFY `dodatek` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
