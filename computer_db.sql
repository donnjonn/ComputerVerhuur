-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2019 at 04:20 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `computer_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `computers`
--

CREATE TABLE `computers` (
  `c_id` int(11) NOT NULL,
  `c_naam` varchar(20) NOT NULL,
  `c_omsch` varchar(100) NOT NULL,
  `c_lok` varchar(5) NOT NULL,
  `c_opl` varchar(6) NOT NULL,
  `c_serie` int(11) NOT NULL,
  `c_aankoop` int(11) NOT NULL,
  `c_huur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `huurder`
--

CREATE TABLE `huurder` (
  `h_id` int(11) NOT NULL,
  `h_naam` varchar(20) NOT NULL,
  `h_rol` varchar(1) NOT NULL,
  `h_opl` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservaties`
--

CREATE TABLE `reservaties` (
  `r_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `van` datetime NOT NULL,
  `tot` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `computers`
--
ALTER TABLE `computers`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `huurder`
--
ALTER TABLE `huurder`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `reservaties`
--
ALTER TABLE `reservaties`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `c_id` (`c_id`),
  ADD KEY `h_id` (`h_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservaties`
--
ALTER TABLE `reservaties`
  ADD CONSTRAINT `reservaties_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `computers` (`c_id`),
  ADD CONSTRAINT `reservaties_ibfk_2` FOREIGN KEY (`h_id`) REFERENCES `huurder` (`h_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
