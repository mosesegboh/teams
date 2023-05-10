-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 11, 2023 at 12:28 AM
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
-- Database: `teams_test`
--

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
  `team_id` int(11) NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `team_id`, `first_name`, `last_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Test', 'Player', '2023-05-09 22:54:59', '2023-05-09 22:54:59'),
(2, 1, 'Test', 'Player', '2023-05-09 23:03:40', '2023-05-09 23:03:40'),
(3, 1, 'Test', 'Player', '2023-05-09 23:04:43', '2023-05-09 23:04:43'),
(4, 1, 'Test', 'Player', '2023-05-09 23:05:31', '2023-05-09 23:05:31');

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
(1, 'Test Team', 'Test Country', 1000, '2023-05-09 21:42:31', '2023-05-09 21:42:31'),
(2, 'Test Team', 'Test Country', 1000, '2023-05-09 21:52:59', '2023-05-09 21:52:59'),
(3, 'Test Team', 'Test Country', 1000, '2023-05-09 21:52:59', '2023-05-09 21:52:59'),
(4, 'Test Team', 'Test Country', 1000, '2023-05-09 22:25:48', '2023-05-09 22:25:48'),
(5, 'Test Team', 'Test Country', 1000, '2023-05-09 22:25:48', '2023-05-09 22:25:48'),
(6, 'Test Team', 'Test Country', 1000, '2023-05-09 22:26:56', '2023-05-09 22:26:56'),
(7, 'Test Team', 'Test Country', 1000, '2023-05-09 22:26:56', '2023-05-09 22:26:56'),
(8, 'Test Team', 'Test Country', 1000, '2023-05-09 22:27:46', '2023-05-09 22:27:46'),
(9, 'Test Team', 'Test Country', 1000, '2023-05-09 22:27:46', '2023-05-09 22:27:46'),
(10, 'Test Team', 'Test Country', 1000, '2023-05-09 22:34:08', '2023-05-09 22:34:08'),
(11, 'Test Team', 'Test Country', 1000, '2023-05-09 22:34:08', '2023-05-09 22:34:08'),
(12, 'Test Team', 'Test Country', 1000, '2023-05-09 22:45:22', '2023-05-09 22:45:22'),
(13, 'Test Team', 'Test Country', 1000, '2023-05-09 22:45:22', '2023-05-09 22:45:22'),
(14, 'Test Team', 'Test Country', 1000, '2023-05-09 22:47:13', '2023-05-09 22:47:13'),
(15, 'Test Team', 'Test Country', 1000, '2023-05-09 22:47:13', '2023-05-09 22:47:13'),
(16, 'Test Team', 'Test Country', 1000, '2023-05-09 22:51:30', '2023-05-09 22:51:30'),
(17, 'Test Team', 'Test Country', 1000, '2023-05-09 22:51:30', '2023-05-09 22:51:30'),
(18, 'Test Team', 'Test Country', 1000, '2023-05-09 22:52:21', '2023-05-09 22:52:21'),
(19, 'Test Team', 'Test Country', 1000, '2023-05-09 22:52:21', '2023-05-09 22:52:21'),
(20, 'Test Team', 'Test Country', 1000, '2023-05-09 22:55:00', '2023-05-09 22:55:00'),
(21, 'Test Team', 'Test Country', 1000, '2023-05-09 22:55:00', '2023-05-09 22:55:00'),
(22, 'Test Team', 'Test Country', 1000, '2023-05-09 22:59:48', '2023-05-09 22:59:48'),
(23, 'Test Team', 'Test Country', 1000, '2023-05-09 22:59:48', '2023-05-09 22:59:48'),
(24, 'Test Team', 'Test Country', 1000, '2023-05-09 23:03:41', '2023-05-09 23:03:41'),
(25, 'Test Team', 'Test Country', 1000, '2023-05-09 23:03:41', '2023-05-09 23:03:41'),
(26, 'Test Team', 'Test Country', 1000, '2023-05-09 23:04:44', '2023-05-09 23:04:44'),
(27, 'Test Team', 'Test Country', 1000, '2023-05-09 23:04:44', '2023-05-09 23:04:44'),
(28, 'Test Team', 'Test Country', 1000, '2023-05-09 23:05:32', '2023-05-09 23:05:32'),
(29, 'Test Team', 'Test Country', 1000, '2023-05-09 23:05:32', '2023-05-09 23:05:32'),
(30, 'Test Team', 'Test Country', 1000, '2023-05-09 23:08:21', '2023-05-09 23:08:21'),
(31, 'Test Team', 'Test Country', 1000, '2023-05-09 23:08:21', '2023-05-09 23:08:21'),
(32, 'Test Team', 'Test Country', 1000, '2023-05-09 23:12:59', '2023-05-09 23:12:59'),
(33, 'Test Team', 'Test Country', 1000, '2023-05-09 23:12:59', '2023-05-09 23:12:59'),
(34, 'Test Team', 'Test Country', 1000, '2023-05-09 23:13:17', '2023-05-09 23:13:17'),
(35, 'Test Team', 'Test Country', 1000, '2023-05-09 23:13:17', '2023-05-09 23:13:17'),
(36, 'Test Team', 'Test Country', 1000, '2023-05-09 23:15:05', '2023-05-09 23:15:05'),
(37, 'Test Team', 'Test Country', 1000, '2023-05-09 23:15:05', '2023-05-09 23:15:05'),
(38, 'Test Team', 'Test Country', 1000, '2023-05-10 20:16:37', '2023-05-10 20:16:37'),
(39, 'Test Team', 'Test Country', 1000, '2023-05-10 20:16:37', '2023-05-10 20:16:37'),
(40, 'Test Team', 'Test Country', 1000, '2023-05-10 21:28:31', '2023-05-10 21:28:31'),
(41, 'Test Team', 'Test Country', 1000, '2023-05-10 21:28:31', '2023-05-10 21:28:31'),
(42, 'Test Team', 'Test Country', 1000, '2023-05-10 22:04:57', '2023-05-10 22:04:57'),
(43, 'Test Team', 'Test Country', 1000, '2023-05-10 22:04:57', '2023-05-10 22:04:57');

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
-- Indexes for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
