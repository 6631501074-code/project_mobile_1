-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 27, 2025 at 07:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test1`
--

-- --------------------------------------------------------

--
-- Table structure for table `expense`
--

CREATE TABLE `expense` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `item` varchar(50) NOT NULL,
  `paid` mediumint(9) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense`
--

INSERT INTO `expense` (`id`, `user_id`, `item`, `paid`, `date`) VALUES
(17, 1, 'lunch', 70, '2024-08-09 12:07:33'),
(18, 1, 'coffee', 45, '2024-08-09 13:07:33'),
(19, 1, 'rent', 1600, '2025-08-16 07:26:53'),
(20, 2, 'lunch', 50, '2024-08-09 13:27:39'),
(24, 1, 'shirt', 120, '2025-08-24 16:21:34'),
(25, 1, 'botton', 5, '2025-08-24 22:49:36');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'Lisa', '$2b$10$ZdgWgAMozNGtudXV0/ZOqORoD1bZdoQpz9p3qzDggGbv87cz.hVIm'),
(2, 'Tom', '$2b$10$clih59bd7gWPzmHJ2ejmc.IA.PHAyUaL8b5SVnnEGYLtYpLnSVfX.'),
(7, 'Doid', '$2b$10$ozNQd/IZpP6lJa6ZD9ZweeJSyraRvFBiNkU2CUdzRsfuUvqawZREC'),
(8, 'doid1', '$2b$10$PN/.rQSKFCrBRyGS8fjzIeMHQTjaC.T/VyvhI/ZcWjShiFqLBqJIe'),
(9, 'Doid2', '$2b$10$S8jmZsYmlVFwZMd4SZ3uTeNJ4i69BiKRbNaa0uwyge6JX7b6uAGAW'),
(10, 'Doid3', '$2b$10$AtuuqsoCIiRzKYHmoXCWBuPUDSMntvhGx3dxaL79iuCX.44NnBV7G');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expense`
--
ALTER TABLE `expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expense`
--
ALTER TABLE `expense`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
