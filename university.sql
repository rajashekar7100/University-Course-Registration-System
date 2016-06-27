-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2015 at 06:16 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `courseallocation`
--

CREATE TABLE IF NOT EXISTS `courseallocation` (
  `CID` int(15) NOT NULL,
  `Semester` varchar(15) NOT NULL,
  `PID` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE IF NOT EXISTS `courses` (
`CID` int(15) NOT NULL,
  `Cname` varchar(30) NOT NULL,
  `PID` int(20) NOT NULL,
  `Description` text NOT NULL,
  `CrHrs` int(15) NOT NULL,
  `Term` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CID`, `Cname`, `PID`, `Description`, `CrHrs`, `Term`) VALUES
(1, 'Mobile Computing', 3456, 'Mobile computing involves developing mobile applications, mobile communication, mobile hardware, and mobile software.It also deals with Communication issues include ad hoc and infrastructure networks as well as communication properties, protocols, data formats and concrete technologies.', 4, 'Spring15'),
(2, 'Network Security', 5566, 'It involves authorization access of data through a network. IDs will be assigned in order to retrieve data by authentication of the authority.', 4, 'Spring15'),
(3, 'Advanced Computer Networks', 9876, 'It deals with the computer communication through communication channel among wide range of users using shared resources.', 3, 'Spring15'),
(4, 'Advanced Database Systems', 5678, 'It deals with database management and the types of transactions which can be made in an efficient way. ', 3, 'Spring15'),
(5, 'Information retrieval', 1234, 'It deals with organizing the data and the way we can extract required data efficiently using different methods.', 3, 'Spring15'),
(6, 'Power Electronics', 9988, 'It deals with power management and energy saving methods by using resource sharing. ', 4, 'Spring15');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE IF NOT EXISTS `departments` (
`Dno` int(15) NOT NULL,
  `Dname` text NOT NULL,
  `DOffice` varchar(50) NOT NULL,
  `DHead` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`Dno`, `Dname`, `DOffice`, `DHead`) VALUES
(1, 'Computer Sceince', '5th floor, C.V.Raman block', 'Jason Hitlzler'),
(2, 'Electronics Department', 'Russ engineering Building', 'Adam Sean'),
(3, 'Mechanical', 'Oleman hall', 'Dominc Josh'),
(4, 'Musical Learning', 'Dunbar Library', 'Thomas diplo'),
(5, 'psychology', 'Rike building', 'Ervin Cena');

-- --------------------------------------------------------

--
-- Table structure for table `professors`
--

CREATE TABLE IF NOT EXISTS `professors` (
`uid` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `Dno` int(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `Cid` int(15) DEFAULT NULL,
  `CrHrsUndertook` int(50) DEFAULT NULL,
  `salary` int(25) NOT NULL,
  `state` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9989 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `professors`
--

INSERT INTO `professors` (`uid`, `name`, `Dno`, `email`, `Cid`, `CrHrsUndertook`, `salary`, `state`) VALUES
(1001, 'Ram Prasad', 1, 'ramprasad@gmail.com', 2, 4, 60000, 'NY'),
(1100, '1100pfor', 1, '1100@gmail.com', 3, 3, 60000, 'NY'),
(1234, 'Eric Bishop', 1, 'erick@gmail.com', 5, 3, 16000, 'OH'),
(3456, 'Harish Pamidi', 1, 'harish@gmail.com', 1, 4, 20000, 'NY'),
(5566, 'shiva kumar', 2, 'shiv@gmail.com', 2, 4, 9000, 'FL'),
(5678, 'chandra paul', 1, 'chandra@gmail.com', 4, 3, 13000, 'WA'),
(9876, 'randy johnson', 2, 'randy@gmail.com', 3, 4, 20000, 'WA'),
(9988, 'srinivas rao', 2, 'srinivas@gmail.com', 6, 3, 15000, 'FL');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`uid` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `Deptno` int(15) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `courses` blob,
  `CrHrsRegistered` int(10) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`uid`, `name`, `Deptno`, `email`, `courses`, `CrHrsRegistered`) VALUES
(1100, '1100pfor', 2, '1100@gmail.com', NULL, NULL),
(1111, 'Nishanth Reddy', 1, 'nishanth@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000047704000000047400104d6f62696c6520436f6d707574696e677400104e6574776f726b20536563757269747974001a416476616e63656420436f6d7075746572204e6574776f726b73740019416476616e6365642044617461626173652053797374656d7378, 14),
(2222, 'pavan kumar', 2, 'pavan@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000047704000000047400104d6f62696c6520436f6d707574696e677400104e6574776f726b205365637572697479740019416476616e6365642044617461626173652053797374656d73740011506f77657220456c656374726f6e69637378, 15),
(3333, 'narsimha yadav', 3, 'narsimha@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000057704000000057400104d6f62696c6520436f6d707574696e677400104e6574776f726b20536563757269747974001a416476616e63656420436f6d7075746572204e6574776f726b73740015496e666f726d6174696f6e2072657472696576616c740011506f77657220456c656374726f6e69637378, 18),
(4444, 'feroz mohammed', 2, 'feroz@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000037704000000037400104d6f62696c6520436f6d707574696e677400104e6574776f726b205365637572697479740011506f77657220456c656374726f6e69637378, 12),
(5555, 'alok sean', 1, 'alok@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000377040000000374001a416476616e63656420436f6d7075746572204e6574776f726b73740019416476616e6365642044617461626173652053797374656d73740015496e666f726d6174696f6e2072657472696576616c78, 9),
(6666, 'suresh goud', 4, 'suresh@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000047704000000047400104d6f62696c6520436f6d707574696e677400104e6574776f726b20536563757269747974001a416476616e63656420436f6d7075746572204e6574776f726b73740019416476616e6365642044617461626173652053797374656d7378, 14),
(7777, 'abhilash reddy', 1, 'abhilash@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a657870000000047704000000047400104d6f62696c6520436f6d707574696e677400104e6574776f726b205365637572697479740015496e666f726d6174696f6e2072657472696576616c740011506f77657220456c656374726f6e69637378, 15),
(8888, 'devin paul', 4, 'devin@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000274001a416476616e63656420436f6d7075746572204e6574776f726b73740019416476616e6365642044617461626173652053797374656d7378, 6),
(9999, 'Stephene Anderson', 1, 'stephene@gmail.com', 0xaced00057372001a73657276656c65742e436f75727365735265676973746572656406be27a35f77c0160200014c0007636f75727365737400154c6a6176612f7574696c2f41727261794c6973743b7870737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000274001a416476616e63656420436f6d7075746572204e6574776f726b737400104e6574776f726b20536563757269747978, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`uid` int(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `name` text NOT NULL,
  `DOB` date NOT NULL,
  `position` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `email`, `password`, `name`, `DOB`, `position`) VALUES
(1001, 'ramprasad@gmail.com', 'ram', 'Ram Prasad', '1979-08-22', 'professor'),
(1100, '1100@gmail.com', '1100', '1100pfor', '1992-04-04', 'professor'),
(1111, 'nishanth@gmail.com', 'nishanth', 'Nishanth Reddy', '1992-04-04', 'student'),
(2222, 'pavan@gmail.com', 'pavan', 'pavan kumar', '1991-06-13', 'student'),
(2345, 'erick@gmail.com', 'erick', 'Erick Sean', '1967-04-04', 'professor'),
(3333, 'narsimha@gmail.com', 'narsimha', 'narsimha yadav', '1992-03-23', 'student'),
(3456, 'harish@gmail.com', 'harish', 'Harish', '1972-06-10', 'professor'),
(4444, 'feroz@gmail.com', 'feroz', 'feroz mohammed', '1992-05-13', 'student'),
(5555, 'alok@gmail.com', 'alok', 'alok sean', '1991-07-26', 'student'),
(5566, 'shiva@gmail.com', 'shiva', 'shiva kumar', '1969-03-11', 'professor'),
(5678, 'chandra@gmail.com', 'chandra', 'chandra paul', '1972-11-24', 'professor'),
(6666, 'suresh@gmail.com', 'suresh', 'suresh goud', '1990-08-16', 'student'),
(7777, 'abhilash@gmail.com', 'abhilash', 'abhilash reddy', '1991-08-17', 'student'),
(8888, 'devin@gmail.com', 'devin', 'devin paul', '1992-09-15', 'student'),
(9876, 'randy@gmail.com', 'randy', 'randy johnson', '1970-05-14', 'professor'),
(9999, 'stephene@gmail.com', 'stephene', 'Stephene Anderson', '1992-03-24', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courseallocation`
--
ALTER TABLE `courseallocation`
 ADD PRIMARY KEY (`CID`,`Semester`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
 ADD PRIMARY KEY (`CID`), ADD UNIQUE KEY `Cname` (`Cname`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
 ADD PRIMARY KEY (`Dno`);

--
-- Indexes for table `professors`
--
ALTER TABLE `professors`
 ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`uid`), ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
MODIFY `CID` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
MODIFY `Dno` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `professors`
--
ALTER TABLE `professors`
MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9989;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
MODIFY `uid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10000;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `uid` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10000;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
