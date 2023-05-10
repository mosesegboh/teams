-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2023 at 12:27 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `teams`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230504213719', '2023-05-04 21:42:38', 33),
('DoctrineMigrations\\Version20230505103540', '2023-05-05 10:36:02', 45);

-- --------------------------------------------------------

--
-- Table structure for table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `team_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `team_id`, `first_name`, `last_name`, `created_at`, `updated_at`) VALUES
(4, 1, 'kanye', 'west', '2023-05-05 14:08:23', '2023-05-05 14:08:23'),
(5, 3, 'kanji', 'dam', '2023-05-05 14:09:01', '2023-05-05 14:09:01'),
(6, 3, 'musa', 'abeg', '2023-05-05 14:09:01', '2023-05-05 14:09:01'),
(7, 1, 'halima', 'abu', '2023-05-05 14:09:38', '2023-05-05 14:09:38'),
(8, 2, 'hungary', 'south', '2023-05-05 14:09:38', '2023-05-05 14:09:38'),
(9, 2, 'ken', 'saro', '2023-05-05 14:10:03', '2023-05-05 14:10:03'),
(10, 4, 'femi', 'jala', '2023-05-05 14:10:03', '2023-05-05 14:10:03'),
(12, 8, 'james', 'ken', '2023-05-08 20:48:52', '2023-05-08 20:48:52'),
(14, 10, 'moses', 'nkem', '2023-05-08 21:12:43', '2023-05-08 21:12:43'),
(15, 11, 'gerald', 'butler', '2023-05-08 21:58:02', '2023-05-08 21:58:02'),
(16, 12, 'ken', 'hannah', '2023-05-08 22:02:11', '2023-05-08 22:02:11'),
(17, 13, 'John', 'Ekeh', '2023-05-08 22:03:20', '2023-05-08 22:03:20'),
(18, 13, 'jane', 'enaroh', '2023-05-08 22:03:20', '2023-05-08 22:03:20'),
(20, 14, 'Ama', 'Maths', '2023-05-09 21:10:44', '2023-05-09 21:10:44'),
(21, 14, 'Ken ', 'Saro', '2023-05-09 21:10:44', '2023-05-09 21:10:44'),
(22, 15, 'keneth', 'ifeoma', '2023-05-09 23:31:52', '2023-05-09 23:31:52'),
(23, 16, 'mark', 'more', '2023-05-10 01:51:35', '2023-05-10 01:51:35'),
(25, 18, 'kim', 'Parker', '2023-05-10 11:12:31', '2023-05-10 11:12:31'),
(27, 20, 'gerald', 'butler', '2023-05-10 21:19:32', '2023-05-10 21:19:32'),
(28, 20, 'jin', 'shun', '2023-05-10 21:19:32', '2023-05-10 21:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` double NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `country`, `balance`, `created_at`, `updated_at`) VALUES
(1, 'ac milan', 'spain', 2000, '2023-05-05 13:45:40', '2023-05-05 13:45:40'),
(2, 'real madrid', 'france', 2000, '2023-05-05 13:45:40', '2023-05-05 13:45:40'),
(3, 'rangers', 'greece', 4000, '2023-05-05 14:03:43', '2023-05-05 14:03:43'),
(4, 'shooters', 'ghana', 5000, '2023-05-05 14:03:43', '2023-05-05 14:03:43'),
(8, 'lakers fc', 'united states', 3500, '2023-05-08 20:48:52', '2023-05-08 20:48:52'),
(10, 'lakers fc', 'united states', 2500, '2023-05-08 21:12:43', '2023-05-08 21:12:43'),
(11, 'jamb shooters', 'France', 1000, '2023-05-08 21:58:02', '2023-05-08 21:58:02'),
(12, 'globe trotters', 'United Kingdom', 0, '2023-05-08 22:02:11', '2023-05-08 22:02:11'),
(13, 'German Lions', 'Estonia', 2000, '2023-05-08 22:03:20', '2023-05-08 22:03:20'),
(14, 'jakpa club', 'Saudi Arabia', 0, '2023-05-09 21:10:44', '2023-05-09 21:10:44'),
(15, 'raker bulls', 'Finland', 3000, '2023-05-09 23:31:52', '2023-05-09 23:31:52'),
(16, 'piston', 'kenya', 0, '2023-05-10 01:51:35', '2023-05-10 01:51:35'),
(18, 'shooters', 'Japan', 0, '2023-05-10 11:12:31', '2023-05-10 11:12:31'),
(20, 'china guns', 'china', 50, '2023-05-10 21:19:32', '2023-05-10 21:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'mosesegboh@yahoo.com', '[]', '$2y$13$EPkFmq1gSgiIyB6OvskLZeUd9IsrVXoWkGKfFyR5ZuU7X78xeJQ4G'),
(2, 'chidi@yahoo.com', '[]', '$2y$13$KzEC5eYLf2H0d0cpc4rUMO7.EYjI5Rv6TfYL6kKJxFLnseevXq8O2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_98197A65296CD8AE` (`team_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `FK_98197A65296CD8AE` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
