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
-- Table structure for table `tb_tickets`
--

CREATE TABLE `tb_tickets` (
  `id` int(11) NOT NULL,
  `ticket_number` varchar(50) NOT NULL,
  `date_show` date NOT NULL,
  `time_show` time NOT NULL,
  `price` int(11) NOT NULL,
  `venue` varchar(100) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tickets`
--

INSERT INTO `tb_tickets` (`id`, `ticket_number`, `date_show`, `time_show`, `price`, `venue`, `movie_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '01', '2021-10-21', '05:49:00', 40000, 'PIM XXI  ', 1, 1, '2021-10-01 12:45:42', '2021-10-01 12:45:42'),
(2, '02', '2021-10-01', '11:00:00', 40000, 'PIM XXI', 2, 1, '2021-10-01 12:46:29', '2021-10-01 12:46:29'),
(3, '03', '2021-10-01', '12:00:00', 40000, 'PIM XXI', 3, 2, '2021-10-01 12:46:53', '2021-10-01 12:46:53'),
(5, '05', '2021-10-01', '14:00:00', 40000, 'PIM XXI', 5, 2, '2021-10-01 12:48:07', '2021-10-01 12:48:07'),
(6, '06', '2021-10-01', '15:00:00', 40000, 'PIM XXI', 6, 3, '2021-10-01 12:48:33', '2021-10-01 12:48:33'),
(7, '07', '2021-10-01', '16:00:00', 40000, 'PIM XXI', 7, 3, '2021-10-01 12:48:59', '2021-10-01 12:48:59'),
(8, '08', '2021-10-01', '17:00:00', 40000, 'PIM XXI', 8, 3, '2021-10-01 12:49:18', '2021-10-01 12:49:18'),
(9, '09', '2021-10-01', '05:22:00', 40000, 'PIM XXI  ', 9, 1, '2021-10-02 18:51:18', '2021-10-02 18:51:18'),
(10, '10', '2021-10-04', '19:50:00', 40000, 'PIM XXI', 10, 1, '2021-10-02 18:53:48', '2021-10-02 18:53:48'),
(21, '', '2021-10-07', '06:27:00', 40000, 'PIM XXI', 21, NULL, '2021-10-03 17:21:53', '2021-10-03 17:21:53'),
(22, '', '2021-09-30', '04:40:00', 40000, 'PIM XXI  ', 22, NULL, '2021-10-03 17:33:32', '2021-10-03 17:33:32'),
(23, '', '2022-10-11', '23:42:00', 40000, 'PIM XXI ', 23, NULL, '2021-10-03 19:02:50', '2021-10-03 19:02:50'),
(24, '', '2021-10-22', '22:11:00', 40000, 'PIM XXI ', 24, NULL, '2021-10-03 19:04:41', '2021-10-03 19:04:41'),
(25, '', '2021-09-30', '08:12:00', 40000, 'PIM XXI', 25, NULL, '2021-10-03 19:07:24', '2021-10-03 19:07:24'),
(27, '', '2021-10-29', '05:44:00', 40000, 'PIM XXI', 27, NULL, '2021-10-04 16:38:44', '2021-10-04 16:38:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_tickets`
--
ALTER TABLE `tb_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movie` (`movie_id`),
  ADD KEY `fk_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_tickets`
--
ALTER TABLE `tb_tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_tickets`
--
ALTER TABLE `tb_tickets`
  ADD CONSTRAINT `fk_movie` FOREIGN KEY (`movie_id`) REFERENCES `tb_movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `tb_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
