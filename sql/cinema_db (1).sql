-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2024 at 05:10 AM
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
  `status` enum('Now Showing','Coming Soon') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `genre`, `format`, `language`, `description`, `image_url`, `trailer_url`, `status`) VALUES
(1, 'Inception', 'Action', '2D', 'English', 'A thief steals secrets through dream-sharing.', '../images/film1.jpg', NULL, 'Now Showing'),
(2, 'Venom', 'Action', '3D', 'English', 'A journalist bonds with an alien symbiote.', '../images/film2.jpg', NULL, 'Now Showing'),
(3, 'Monkey Man', 'Adventure', '2D', 'English', 'An ex-convict battles with corruption.', '../images/film3.jpg', NULL, 'Now Showing'),
(4, 'Spirited Away', 'Adventure', '3D', 'English', 'A girl explores a magical world.', '../images/film4.jpg', NULL, 'Now Showing'),
(5, 'The Rise of Apes', 'Action', '2D', 'English', 'The story of intelligent apes rising.', '../images/nfilm1.jpg', 'https://youtu.be/XtFI7SNtVpY?si=qXFjZvxOhzBRMOLC', 'Coming Soon'),
(6, 'Kong 2', 'Adventure', '3D', 'English', 'A giant gorilla fights to survive.', '../images/nfilm2.jpg', 'https://youtu.be/44LdLqgOpjo?si=d4KGArysnCo7djI0', 'Coming Soon'),
(7, 'Meg 2', 'Action', '2D', 'English', 'A giant shark terrorizes the seas.', '../images/nfilm3.jpg', 'https://youtu.be/dG91B3hHyY4?si=ssaAyHfS_adBPcL2', 'Coming Soon'),
(8, 'Interstellar', 'Adventure', '3D', 'English', 'A team explores a wormhole in space.', '../images/nfilm4.jpg', 'https://youtu.be/zSWdZVtXT7E?si=3ifUTqYXkfmPsJXG', 'Coming Soon');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `seat_numbers` varchar(100) NOT NULL,
  `reservation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(5, 'dulni', 'dulni123', '1234', 'duli@gmail.com', '2024-11-28 04:18:25');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `movie_id` (`movie_id`);

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
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
