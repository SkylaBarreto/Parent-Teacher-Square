-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 06:01 AM
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
-- Database: `parenttrsquare`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `ffname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fback` varchar(255) DEFAULT NULL,
  `feedbackid` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`ffname`, `email`, `fback`, `feedbackid`) VALUES
('skyla ', 'Skyla@gmail.com', 'good', 1),
('abc', 'abc@gmail.com', 'bad', 2);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `lemail` varchar(255) NOT NULL,
  `trregno` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`lemail`, `trregno`) VALUES
('paygoy@gmail.com', 1256),
('shaty@gmail.com', 1256);

-- --------------------------------------------------------

--
-- Table structure for table `logp`
--

CREATE TABLE `logp` (
  `lemail` varchar(255) NOT NULL,
  `cregno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logp`
--

INSERT INTO `logp` (`lemail`, `cregno`) VALUES
('shaty@gmail.com', 58);

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE `record` (
  `recorid` int(3) NOT NULL,
  `rfname` varchar(255) NOT NULL,
  `rlname` varchar(255) NOT NULL,
  `dob` date NOT NULL,
  `rollno` int(11) NOT NULL,
  `sem` varchar(255) NOT NULL,
  `attendance` int(11) NOT NULL,
  `behv` varchar(255) NOT NULL,
  `semper` int(11) NOT NULL,
  `avgit` int(11) NOT NULL,
  `trid` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `record`
--

INSERT INTO `record` (`recorid`, `rfname`, `rlname`, `dob`, `rollno`, `sem`, `attendance`, `behv`, `semper`, `avgit`, `trid`) VALUES
(7, 'Payal', 'Goyal', '2004-10-24', 56, 'SEM1', 80, 'Good', 91, 95, 1256);

-- --------------------------------------------------------

--
-- Table structure for table `reg_parent`
--

CREATE TABLE `reg_parent` (
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `emailid` varchar(255) NOT NULL,
  `cfname` varchar(255) NOT NULL,
  `clname` varchar(255) NOT NULL,
  `cregno` int(100) NOT NULL,
  `recordid` int(100) NOT NULL,
  `feedbackid` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reg_parent`
--

INSERT INTO `reg_parent` (`fname`, `lname`, `emailid`, `cfname`, `clname`, `cregno`, `recordid`, `feedbackid`) VALUES
('Shamita', 'Shetty', 'shaty@gmail.com', 'Raj', 'Shetty', 58, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reg_tr`
--

CREATE TABLE `reg_tr` (
  `tfname` varchar(255) NOT NULL,
  `tlname` varchar(255) NOT NULL,
  `temailid` varchar(255) NOT NULL,
  `trregno` int(11) NOT NULL,
  `feedbackid` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reg_tr`
--

INSERT INTO `reg_tr` (`tfname`, `tlname`, `temailid`, `trregno`, `feedbackid`) VALUES
('Payal', 'Goyal', 'paygoy@gmail.com', 1256, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackid`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`lemail`),
  ADD KEY `trregno` (`trregno`);

--
-- Indexes for table `logp`
--
ALTER TABLE `logp`
  ADD PRIMARY KEY (`lemail`),
  ADD KEY `cregno` (`cregno`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`recorid`),
  ADD KEY `trid` (`trid`);

--
-- Indexes for table `reg_parent`
--
ALTER TABLE `reg_parent`
  ADD PRIMARY KEY (`cregno`),
  ADD KEY `recordid` (`recordid`),
  ADD KEY `feedbackid` (`feedbackid`);

--
-- Indexes for table `reg_tr`
--
ALTER TABLE `reg_tr`
  ADD PRIMARY KEY (`trregno`),
  ADD KEY `feedbackid` (`feedbackid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `recorid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`trregno`) REFERENCES `reg_tr` (`trregno`);

--
-- Constraints for table `logp`
--
ALTER TABLE `logp`
  ADD CONSTRAINT `logp_ibfk_1` FOREIGN KEY (`cregno`) REFERENCES `reg_parent` (`cregno`);

--
-- Constraints for table `record`
--
ALTER TABLE `record`
  ADD CONSTRAINT `record_ibfk_1` FOREIGN KEY (`trid`) REFERENCES `reg_tr` (`trregno`);

--
-- Constraints for table `reg_parent`
--
ALTER TABLE `reg_parent`
  ADD CONSTRAINT `reg_parent_ibfk_1` FOREIGN KEY (`recordid`) REFERENCES `record` (`recorid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reg_parent_ibfk_2` FOREIGN KEY (`feedbackid`) REFERENCES `feedback` (`feedbackid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reg_tr`
--
ALTER TABLE `reg_tr`
  ADD CONSTRAINT `reg_tr_ibfk_1` FOREIGN KEY (`feedbackid`) REFERENCES `feedback` (`feedbackid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
