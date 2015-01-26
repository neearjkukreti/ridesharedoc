-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2015 at 10:52 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ride`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate_no` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `grade` int(2) NOT NULL,
  `stereo` int(2) NOT NULL,
  `rating` int(2) NOT NULL,
  `leather_seat` int(2) NOT NULL,
  `extra_info` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ride`
--

CREATE TABLE IF NOT EXISTS `ride` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rdate` date NOT NULL,
  `rtime` time NOT NULL,
  `host` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `rfrom` varchar(100) NOT NULL,
  `rto` varchar(100) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `seats` int(2) NOT NULL,
  `rlat` float NOT NULL,
  `rlong` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ride`
--

INSERT INTO `ride` (`id`, `rdate`, `rtime`, `host`, `car_id`, `rfrom`, `rto`, `status`, `seats`, `rlat`, `rlong`) VALUES
(1, '2014-10-09', '11:00:00', 0, 0, 'Dehradun', 'Satpuli', 0, 0, 0, 0),
(2, '2014-10-09', '11:00:00', 3, 0, 'Dehradun', 'delhi', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ride_booking`
--

CREATE TABLE IF NOT EXISTS `ride_booking` (
  `ride_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `booking_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` enum('Male','Female','Others') NOT NULL,
  `fb_id` varchar(100) NOT NULL COMMENT 'Facebook Id retrived',
  `email_id` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fb_id` (`fb_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `gender`, `fb_id`, `email_id`, `mobile`, `dob`) VALUES
(1, 'Anubhav', 'Bhat', 'Male', '1051266228233974', 'test@example.com', '9879879870', '2012-01-15'),
(2, 'pnkj', 'negi', 'Male', '1051266228221974', '', '', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `user_car_detail`
--

CREATE TABLE IF NOT EXISTS `user_car_detail` (
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_detail`
--

CREATE TABLE IF NOT EXISTS `user_detail` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `privacy` int(2) NOT NULL,
  `chat` int(2) NOT NULL,
  `pet` int(2) NOT NULL,
  `music` int(2) NOT NULL,
  `smoking` int(2) NOT NULL,
  `food` int(2) NOT NULL,
  `lang_known` varchar(50) NOT NULL,
  `profession` varchar(100) NOT NULL,
  `ext_info` varchar(250) NOT NULL,
  UNIQUE KEY `user_id_2` (`user_id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_3` (`user_id`),
  KEY `user_id_4` (`user_id`),
  KEY `user_id_5` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_detail`
--
ALTER TABLE `user_detail`
  ADD CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
