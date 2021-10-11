-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2021 at 03:45 AM
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
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `email`, `name`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Ralfi@gmail.com', 'Ralfi', 'ralfi123', '2021-10-01 12:43:45', '2021-10-01 12:43:45'),
(2, 'Rudi@gmail.com', 'Rudi', 'rudi123', '2021-10-01 12:44:13', '2021-10-01 12:44:13'),
(3, 'Resi@gmail.com', 'Resi', 'resi123', '2021-10-01 12:44:32', '2021-10-01 12:44:32'),
(9, 'clarence@gmail.com', 'Clarrence', '1234', '2021-10-02 12:16:45', '2021-10-02 12:16:45'),
(11, 'c@gmail.com', 'Clar', '12345', '2021-10-02 15:10:52', '2021-10-02 15:10:52'),
(12, 'admin@gmail.com', 'admin', 'admin123', '2021-10-03 07:36:44', '2021-10-03 07:36:44'),
(13, 'empi@gmail.com', 'empi', '1234', '2021-10-04 13:14:46', '2021-10-04 13:14:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
