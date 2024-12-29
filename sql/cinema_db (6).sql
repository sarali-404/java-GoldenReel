-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2024 at 06:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cinema_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin1', 'password123', '2024-12-09 05:15:41');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `rating` enum('Poor','Fair','Good','Very Good','Excellent') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `feedback_text` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `name`, `email`, `rating`, `created_at`, `feedback_text`) VALUES
(1, 'sarali', 'sara@gmail.com', 'Fair', '2024-11-29 06:29:36', 'ooo'),
(2, 'sarali', 'sara@gmail.com', 'Very Good', '2024-11-29 06:43:54', 'goooood'),
(3, 'sarali', 'sara@gmail.com', 'Very Good', '2024-11-29 06:45:12', 'uyyyy'),
(4, 'sarali', 'sara@gmail.com', 'Excellent', '2024-11-29 06:46:45', 'fffffdd'),
(5, 'jajajajajaja', 'jjj@email.com', 'Good', '2024-12-03 04:02:30', 'iiiiiiiiiiiiiiiiiii'),
(6, 'sarali', 'sara@gmail.com', 'Good', '2024-12-06 05:53:38', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
(7, 'sarali', 'sara@gmail.com', 'Good', '2024-12-06 05:54:32', 'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
(8, 'gune', 'jjj@email.com', 'Very Good', '2024-12-06 13:59:44', 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii'),
(9, 'gune', 'sara@gmail.com', 'Poor', '2024-12-09 08:38:12', 'yyyyyyyyyyyyyyyyyyyyyyyyyyyy'),
(10, 'gune', 'jjj@email.com', 'Good', '2024-12-11 06:42:13', 'kkkkkkkkkkkkkkkkkkkkkk'),
(11, 'ddd', 'sara@gmail.com', 'Fair', '2024-12-16 04:36:02', 'dddddddddddd'),
(12, 'sarali', 'sara@gmail.com', 'Fair', '2024-12-17 06:28:05', 'example feedback');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `format` varchar(20) NOT NULL,
  `language` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  `status` enum('Now Showing','Coming Soon') NOT NULL,
  `release_date` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `cast` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `genre`, `format`, `language`, `description`, `image_url`, `trailer_url`, `status`, `release_date`, `duration`, `cast`, `price`) VALUES
(1, 'Inception', 'Action', '2D', 'English', 'A thief steals secrets through dream-sharing.', 'http://localhost:8082/GoldenReel/images/film1.jpg', NULL, 'Now Showing', '2010-07-16', 148, 'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy', 800.00),
(2, 'Venom', 'Action', '3D', 'English', 'A journalist bonds with an alien symbiote.', 'http://localhost:8082/GoldenReel/images/film2.jpg', NULL, 'Now Showing', '2021-10-01', 97, 'Tom Hardy, Woody Harrelson, Michelle Williams, Naomie Harris', 800.00),
(3, 'Monkey Man', 'Adventure', '2D', 'English', 'An ex-convict battles with corruption.', 'http://localhost:8082/GoldenReel/images/film3.jpg', NULL, 'Now Showing', '2021-04-01', 110, 'Dev Patel', 800.00),
(4, 'Spirited Away', 'Adventure', '3D', 'English', 'A girl explores a magical world.', 'http://localhost:8082/GoldenReel/images/film4.jpg', NULL, 'Now Showing', '2001-07-20', 125, 'Rumi Hiiragi, Miyu Irino, Mari Natsuki, Takeshi Naito', 800.00),
(5, 'The Rise of Apes', 'Action', '2D', 'English', 'The story of intelligent apes rising.', 'http://localhost:8082/GoldenReel/images/nfilm1.jpg', 'https://youtu.be/XtFI7SNtVpY?si=qXFjZvxOhzBRMOLC', 'Coming Soon', NULL, NULL, NULL, 0.00),
(6, 'Kong 2', 'Adventure', '3D', 'English', 'A giant gorilla fights to survive.', 'http://localhost:8082/GoldenReel/images/nfilm2.jpg', 'https://youtu.be/44LdLqgOpjo?si=d4KGArysnCo7djI0', 'Coming Soon', NULL, NULL, NULL, 0.00),
(7, 'Meg 2', 'Action', '2D', 'English', 'A giant shark terrorizes the seas.', 'http://localhost:8082/GoldenReel/images/nfilm3.jpg', 'https://youtu.be/dG91B3hHyY4?si=ssaAyHfS_adBPcL2', 'Coming Soon', NULL, NULL, NULL, 0.00),
(8, 'Interstellar', 'Adventure', '3D', 'English', 'A team explores a wormhole in space.', 'http://localhost:8082/GoldenReel/images/nfilm4.jpg', 'https://youtu.be/zSWdZVtXT7E?si=3ifUTqYXkfmPsJXG', 'Coming Soon', NULL, NULL, NULL, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `showtime_id` int(11) DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `status` enum('available','reserved','selected') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `showtime_id`, `seat_number`, `status`) VALUES
(5, 2, 'A1', 'available'),
(6, 2, 'A2', 'available'),
(7, 2, 'A3', 'available'),
(8, 2, 'A4', 'available'),
(9, 2, 'B1', 'available'),
(10, 2, 'B2', 'available'),
(11, 2, 'B3', 'available'),
(12, 2, 'B4', 'available'),
(13, 3, 'A1', 'available'),
(14, 3, 'A2', 'available'),
(15, 3, 'A3', 'available'),
(16, 3, 'A4', 'available'),
(17, 3, 'B1', 'available'),
(18, 3, 'B2', 'available'),
(19, 3, 'B3', 'available'),
(20, 3, 'B4', 'available'),
(21, 4, 'A1', 'available'),
(22, 4, 'A2', 'available'),
(23, 4, 'A3', 'available'),
(24, 4, 'A4', 'available'),
(25, 4, 'B1', 'available'),
(26, 4, 'B2', 'available'),
(27, 4, 'B3', 'available'),
(28, 4, 'B4', 'available'),
(29, 17, 'A1', 'available'),
(30, 17, 'A2', 'available'),
(31, 17, 'A3', 'available'),
(32, 17, 'A4', 'available'),
(33, 17, 'B1', 'available'),
(34, 17, 'B2', 'available'),
(35, 17, 'B3', 'available'),
(36, 17, 'B4', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `showtime`
--

CREATE TABLE `showtime` (
  `showtime_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `showtimes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`showtimes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `showtime`
--

INSERT INTO `showtime` (`showtime_id`, `movie_id`, `showtimes`) VALUES
(2, 2, '[\"10:00 AM\", \"1:30 PM\", \"6:00 PM\"]'),
(3, 3, '[\"11:00 AM\", \"4:00 PM\", \"9:00 PM\"]'),
(4, 4, '[\"12:00 PM\", \"3:30 PM\", \"8:30 PM\"]'),
(17, 1, '[\"10:00 AM\",\"3:00 PM\"]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `password`, `email`, `created_at`) VALUES
(1, NULL, 'john_doe', 'password123', 'john@example.com', '2024-11-24 05:48:04'),
(2, NULL, 'jane_doe', 'password456', 'jane@example.com', '2024-11-24 05:48:04'),
(3, 'sarali', 'sara123', '1234', 'sara@gmail.com', '2024-11-27 14:19:37'),
(5, 'dulni', 'dulni123', '1234', 'duli@gmail.com', '2024-11-28 04:18:25'),
(11, 'gimhana', 'gimhana123', '444', 'gimhana@gmail.com', '2024-12-05 03:55:48'),
(16, 'hhhh', 'hhh', 'hhh', 'jjj@email.com', '2024-12-06 08:00:46'),
(21, 'sachini', 'sachini123', '111', 'sachini@gmail.com', '2024-12-13 13:50:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `showtime_id` (`showtime_id`);

--
-- Indexes for table `showtime`
--
ALTER TABLE `showtime`
  ADD PRIMARY KEY (`showtime_id`),
  ADD KEY `fk_movie` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `showtime`
--
ALTER TABLE `showtime`
  MODIFY `showtime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`showtime_id`) REFERENCES `showtime` (`showtime_id`);

--
-- Constraints for table `showtime`
--
ALTER TABLE `showtime`
  ADD CONSTRAINT `fk_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `showtime_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
