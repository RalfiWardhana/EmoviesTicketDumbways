-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2021 at 03:44 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ticket`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_movies`
--

CREATE TABLE `tb_movies` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `movie_hour` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_movies`
--

INSERT INTO `tb_movies` (`id`, `name`, `movie_hour`, `photo`, `type_id`, `created_at`, `updated_at`) VALUES
(1, 'Avengers  ', '120 Menit  ', 'avengerss.jpg', 1, '2021-10-01 12:15:24', '2021-10-01 12:15:24'),
(2, 'Interstellar', '125 Menit', 'interstellar.jpg', 1, '2021-10-01 12:16:10', '2021-10-01 12:16:10'),
(3, 'Insidious', '100 Menit', 'insidious.jpg', 2, '2021-10-01 12:17:00', '2021-10-01 12:17:00'),
(5, 'The Mechanic', '120 Menit', 'mechanic.jpg', 3, '2021-10-01 12:18:09', '2021-10-01 12:18:09'),
(6, 'The Bank Jobs', '130 Menit', 'bank.jpg', 3, '2021-10-01 12:18:47', '2021-10-01 12:18:47'),
(7, '365 Days', '120 Menit', '365.jpg', 4, '2021-10-01 12:19:30', '2021-10-01 12:19:30'),
(8, 'Amar', '120 Menit', 'amar.jpg', 4, '2021-10-01 12:20:10', '2021-10-01 12:20:10'),
(9, 'Justice League  ', '120 menit  ', 'justice.jpg', 1, '2021-10-02 18:35:53', '2021-10-02 18:35:53'),
(10, 'Annabelle', '90 menit', 'annabele.jpeg', 2, '2021-10-02 17:58:44', '2021-10-02 17:58:44'),
(21, 'The Martians', '123 menit', 'martian.jpg', 1, '2021-10-03 17:21:53', '2021-10-03 17:21:53'),
(22, 'The nun', '120 menit  ', 'the nun.jpg', 2, '2021-10-03 17:33:32', '2021-10-03 17:33:32'),
(23, 'The Meg ', '150 menit ', 'the meg.jpg', 1, '2021-10-03 19:02:50', '2021-10-03 19:02:50'),
(24, 'Ant Man 2015', '120 menit   ', 'ant.jpg', 1, '2021-10-03 19:04:41', '2021-10-03 19:04:41'),
(25, 'Killer elits', '123 menit', 'elit.jpg', 3, '2021-10-03 19:07:24', '2021-10-03 19:07:24'),
(27, 'Ghost at School', '120 menit', 'school.jpg', 2, '2021-10-04 16:38:44', '2021-10-04 16:38:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_movies`
--
ALTER TABLE `tb_movies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_type` (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_movies`
--
ALTER TABLE `tb_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_movies`
--
ALTER TABLE `tb_movies`
  ADD CONSTRAINT `fk_type` FOREIGN KEY (`type_id`) REFERENCES `tb_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
