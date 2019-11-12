-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2019 at 07:44 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumni`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_num` int(11) NOT NULL,
  `admin_id` varchar(20) NOT NULL,
  `admin_pass` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_num`, `admin_id`, `admin_pass`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `high_study`
--

CREATE TABLE `high_study` (
  `hid` int(11) NOT NULL,
  `university` varchar(50) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `major` varchar(30) DEFAULT NULL,
  `start_year` year(4) DEFAULT NULL,
  `pass_year` year(4) DEFAULT NULL,
  `user_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `log_id` varchar(11) NOT NULL,
  `log_email` varchar(320) DEFAULT NULL,
  `log_pwd` varchar(100) DEFAULT NULL,
  `flag` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`log_id`, `log_email`, `log_pwd`, `flag`) VALUES
('1kg16cs033', 'gnanendra097@gmail.com', 'gnanendra', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `pid` int(11) NOT NULL,
  `ptype` varchar(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`pid`, `ptype`, `description`, `user_id`) VALUES
(2, 'news', 'This is a test news', '1kg16cs033');

-- --------------------------------------------------------

--
-- Table structure for table `ptype`
--

CREATE TABLE `ptype` (
  `pid` int(11) NOT NULL,
  `ptype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ptype`
--

INSERT INTO `ptype` (`pid`, `ptype`) VALUES
(1, 'news'),
(2, 'job'),
(3, 'event');

-- --------------------------------------------------------

--
-- Table structure for table `ujobs`
--

CREATE TABLE `ujobs` (
  `jid` int(11) NOT NULL,
  `company` varchar(30) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `user_id` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unreg`
--

CREATE TABLE `unreg` (
  `unid` int(11) NOT NULL,
  `usn` varchar(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_usn` varchar(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `branch` varchar(30) DEFAULT NULL,
  `batch` year(4) DEFAULT NULL,
  `mob` int(11) DEFAULT NULL,
  `skills` varchar(100) DEFAULT NULL,
  `user_email` varchar(320) DEFAULT NULL,
  `flag2` bit(1) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_usn`, `name`, `dob`, `gender`, `branch`, `batch`, `mob`, `skills`, `user_email`, `flag2`, `user_id`) VALUES
('1kg16cs033', 'gnanendra prasad t', '1998-07-21', 'male', 'cse', 2020, 814745752, 'c', 'gnanendra097@gmail.com', b'1', 8);

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `email` AFTER INSERT ON `users` FOR EACH ROW UPDATE login l
SET log_email=(select user_email from users where l.log_id=user_usn)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `flag` AFTER UPDATE ON `users` FOR EACH ROW UPDATE login SET flag=(SELECT flag2 from users where login.log_id= user_usn)
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_num`);

--
-- Indexes for table `high_study`
--
ALTER TABLE `high_study`
  ADD PRIMARY KEY (`hid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ptype`
--
ALTER TABLE `ptype`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `ujobs`
--
ALTER TABLE `ujobs`
  ADD PRIMARY KEY (`jid`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `unreg`
--
ALTER TABLE `unreg`
  ADD PRIMARY KEY (`unid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_usn`),
  ADD UNIQUE KEY `unique` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_num` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `high_study`
--
ALTER TABLE `high_study`
  MODIFY `hid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ptype`
--
ALTER TABLE `ptype`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ujobs`
--
ALTER TABLE `ujobs`
  MODIFY `jid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unreg`
--
ALTER TABLE `unreg`
  MODIFY `unid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `high_study`
--
ALTER TABLE `high_study`
  ADD CONSTRAINT `high_study_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_usn`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_usn`);

--
-- Constraints for table `ujobs`
--
ALTER TABLE `ujobs`
  ADD CONSTRAINT `ujobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_usn`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_usn`) REFERENCES `login` (`log_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
