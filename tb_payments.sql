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
-- Table structure for table `tb_payments`
--

CREATE TABLE `tb_payments` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_payments`
--

INSERT INTO `tb_payments` (`id`, `amount`, `sub_total`, `ticket_id`, `created_at`, `updated_at`) VALUES
(1, 4, 160000, 22, '2021-10-04 08:19:01', '2021-10-04 08:19:01'),
(2, 4, 160000, 9, '2021-10-04 08:19:33', '2021-10-04 08:19:33'),
(3, 5, 200000, 2, '2021-10-04 11:14:08', '2021-10-04 11:14:08'),
(4, 5, 200000, 22, '2021-10-04 12:34:52', '2021-10-04 12:34:52'),
(5, 2, 80000, 23, '2021-10-04 12:35:19', '2021-10-04 12:35:19'),
(6, 2, 80000, 25, '2021-10-04 12:39:25', '2021-10-04 12:39:25'),
(7, 6, 240000, 2, '2021-10-04 12:47:59', '2021-10-04 12:47:59'),
(8, 4, 160000, 23, '2021-10-04 12:49:37', '2021-10-04 12:49:37'),
(9, 4, 160000, 21, '2021-10-04 12:51:07', '2021-10-04 12:51:07'),
(10, 5, 200000, 6, '2021-10-04 13:33:09', '2021-10-04 13:33:09'),
(11, 2, 80000, 25, '2021-10-04 14:13:50', '2021-10-04 14:13:50'),
(12, 4, 160000, 2, '2021-10-04 16:59:34', '2021-10-04 16:59:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_payments`
--
ALTER TABLE `tb_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket` (`ticket_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_payments`
--
ALTER TABLE `tb_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_payments`
--
ALTER TABLE `tb_payments`
  ADD CONSTRAINT `fk_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `tb_tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
