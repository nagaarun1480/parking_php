-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2024 at 02:17 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `pname` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `username` varchar(20) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `booking_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `pid`, `pname`, `price`, `image`, `start_time`, `end_time`, `username`, `total_price`, `booking_date`, `status`) VALUES
(2, 2, 'ABC Parking', '50.00', 'p1.jpg', '16:58:00', '20:58:00', 'sagar', '200.00', '2024-06-06 10:28:15', '0'),
(3, 4, 'xyz parking', '20.00', 'service3.webp', '19:19:00', '21:19:00', 'suresh', '40.00', '2024-06-06 12:50:04', '0'),
(4, 2, 'ABC Parking', '50.00', 'p1.jpg', '20:14:00', '22:14:00', '', '100.00', '2024-06-08 13:44:27', '0'),
(5, 2, 'ABC Parking', '50.00', 'p1.jpg', '16:12:00', '19:12:00', 'rahul', '150.00', '2024-08-06 10:43:05', '1'),
(6, 6, 'xyz parking', '10.00', 'service4.jpeg', '17:39:00', '23:39:00', 'xzy', '60.00', '2024-08-13 12:10:03', '1');

-- --------------------------------------------------------

--
-- Table structure for table `parking_area`
--

CREATE TABLE `parking_area` (
  `id` int(11) NOT NULL,
  `pname` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `address` varchar(225) NOT NULL,
  `slots` varchar(10) NOT NULL,
  `area` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `t_slots` varchar(20) NOT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parking_area`
--

INSERT INTO `parking_area` (`id`, `pname`, `image`, `address`, `slots`, `area`, `price`, `t_slots`, `latitude`, `longitude`) VALUES
(2, 'ABC Parking', 'p1.jpg', 'Jss college of arts, commerce and science college ooty road, mysuru', '6', 'Chamundipuram', '50', '10', 12.522157, 76.900917),
(4, 'xyz parking', 'service3.webp', 'water tank, vijaynagar 2nd stage, vijayanagar', '49', 'Vijayanagar', '20', '50', 12.914142, 74.855957),
(5, 'ABC Parking', 'Screenshot 2024-07-15 154209.png', 'Jss college of arts, commerce and science college ooty road, mysuru', '10', 'Hebbal', '50', '10', 12.920422, 77.607735),
(6, 'xyz parking', 'service4.jpeg', 'Jss college of arts, commerce and science college ooty road, mysuru', '9', 'Hebbal', '10', '10', 12.920422, 77.607735);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `username`, `rating`, `review`, `created_at`) VALUES
(1, 'sagar', 5, 'a general survey of something, especially in words; a report or account of something. an inspection or examination by viewing, especially a formal inspection of any military or naval.', '2024-06-06 11:56:59'),
(2, 'sagar', 5, 'a general survey of something, especially in words; a report or account of something. an inspection or examination by viewing, especially a formal inspection of any military or naval force, parade, or the like.', '2024-06-06 11:58:27'),
(3, 'kushal', 4, 'a general survey of something, especially in words; a report or account of something. an inspection or examination by viewing, especially a formal inspection of any military or naval force, parade, or the like.', '2024-06-06 12:40:50'),
(4, 'suresh', 3, 'a general survey of something, especially in words; a report or account of something. an inspection or examination by viewing, especially a formal inspection of any military or naval force, parade, or the like.', '2024-06-06 12:50:55'),
(5, 'sagar', 5, 'yghopojhi', '2024-06-08 13:46:18'),
(6, 'rahul', 5, 'retrfghuobvyfgyiubgvyviyuo', '2024-08-06 10:44:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `wallet` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `phone`, `password`, `wallet`) VALUES
(2, 'rahul', 'rahul@gmail.com', '', '$2y$10$qew1.MVum8/borBxRpHexeCul5vGhyjIxjYFfQJh4Wysux4uT0Tt6', '500'),
(3, 'varun', 'varun@gmail.com', '', '$2y$10$ck4vjy1PprVDFEgokTTHcuWxtRCO.TAoua77civjg9slX0b7Nd26W', '0'),
(4, 'ravi', 'ravi@gmail.com', '', '$2y$10$b.lRkJBZ8OhE.90sU7yl3.ZPETpYDeNdrcV/K52QzdQPjgN13flrS', '0'),
(5, '', '', '+919071198727', '$2y$10$w9c6s4vWfblYnlYPGI1Un.JzEo0hDk0.f7wMnIBTeKxO3FfRZXWZy', '0'),
(6, 'admin', 'sagarsmarty84@gmail.com', '+919071198727', '$2y$10$uqfrfGhO9jvaVleCkLH17..K23Lz5xaXlmGENhKSq4i3t6yicchiq', '0'),
(7, 'kushal', 'kushal@gmail.com', '+919071198727', '$2y$10$77hoPLUP/ShFCB4P/k8zROtdmKWLNA2.xNGK7fFoYIEW0MUsj3Hgy', '0'),
(8, 'suresh', 'suresh@gmail.com', '+919071198727', '$2y$10$BzfZzwt089GMEV1sf4sp/O72r6HVwyNq.ADJwBYfCQLGrsd/Uk2cy', '0'),
(9, 'thejas', 'sagarsmarty84@gmail.com', '+919071198727', '$2y$10$05aB9A4rkQ05iIq495CtXuYGl95gZGJtMeGLT9zEjZHPOGpoeZtDW', '0'),
(10, 'sagar', 'sagarsmarty56@gmail.com', '+919071198727', '$2y$10$56PTpYmJXDrEnwe7QHtObueSCKOlqUHufp2RFCDjVTMGWLicsyYLm', '0'),
(11, 'xzy', 'xzy@gmail.com', '9071198727', '$2y$10$BUfGF9N4YnYUM/iobJJxq..zYtbhIl2bck5Fxw9jQv5qEx8n06xnG', '440');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `parking_area`
--
ALTER TABLE `parking_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `parking_area`
--
ALTER TABLE `parking_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `parking_area` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
