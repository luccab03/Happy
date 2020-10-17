-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 17, 2020 at 05:00 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orphanages`
--

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) NOT NULL,
  `orphanage_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `path`, `orphanage_id`) VALUES
(9, '1602706186606-orf-1.jpeg', 10),
(10, '1602706186619-orf-2.jpeg', 10),
(11, '1602706186622-orf-3.jpeg', 10),
(12, '1602711085642-orf-1.jpeg', 11),
(14, '1602711085651-orf-3.jpeg', 11),
(15, '1602717284784-orf-1.jpeg', 12),
(16, '1602717284788-orf-2.jpeg', 12),
(17, '1602717712848-orf-2.jpeg', 14),
(18, '1602717712850-orf-3.jpeg', 14),
(19, '1602905553638-image_0.jpg', 17),
(20, '1602905555076-image_1.jpg', 17);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `timestamp`, `name`) VALUES
(5, 1602680248507, 'createOrphanages1602680248507'),
(6, 1602693597151, 'createImages1602693597151');

-- --------------------------------------------------------

--
-- Table structure for table `orphanages`
--

CREATE TABLE `orphanages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(10,8) NOT NULL,
  `about` text NOT NULL,
  `instructions` text NOT NULL,
  `open_on_weekends` tinyint(1) NOT NULL DEFAULT '0',
  `opening_hours` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orphanages`
--

INSERT INTO `orphanages` (`id`, `name`, `latitude`, `longitude`, `about`, `instructions`, `open_on_weekends`, `opening_hours`) VALUES
(10, 'Lar das Meninas', '-30.06983880', '-51.24022230', 'Sobre o orfanato', 'Venha Visitar', 1, 'Das 8h até as 18h'),
(11, 'Abrigo João Paulo 2', '-30.05729650', '-51.19684150', 'Sobre o orfanato', 'Venha Visitar', 0, 'Das 8h até as 18h'),
(12, 'Orfanato Secreto', '-30.03975666', '-51.16210481', 'Secreto do FNIO', 'Info', 0, 'Das 8h às 19h'),
(14, 'Orfanato Secreto #2', '-30.08235549', '-51.12815291', 'Orfanato Secreto #2', 'Orfanato Secreto #2', 1, 'Orfanato Secreto #2'),
(17, 'Segredo Multiplo', '-30.06193122', '-51.16591271', 'Não sei meu', 'Só vem', 1, 'Sempre');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ImageOrphanage` (`orphanage_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orphanages`
--
ALTER TABLE `orphanages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orphanages`
--
ALTER TABLE `orphanages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `ImageOrphanage` FOREIGN KEY (`orphanage_id`) REFERENCES `orphanages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
