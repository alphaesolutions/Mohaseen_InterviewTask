-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 02:45 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `address`, `status`, `created_at`) VALUES
(1, 'mohamed', 'coimbatore', 1, '2022-03-09 11:07:01'),
(2, 'Ashik', 'Erode', 1, '2022-03-09 11:07:01');

-- --------------------------------------------------------

--
-- Table structure for table `delayed_orders`
--

CREATE TABLE `delayed_orders` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `current_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `etd` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `item_rate` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(15) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `etd` datetime NOT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_qty` int(11) NOT NULL,
  `total_value` int(11) NOT NULL,
  `order_status` int(11) NOT NULL,
  `delay_status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `order_date`, `etd`, `delivery_address`, `billing_address`, `customer_id`, `total_qty`, `total_value`, `order_status`, `delay_status`, `created_at`, `updated_at`) VALUES
(1, 'OD-00001', '2022-03-09 17:21:01', '2022-03-09 11:50:20', 'Erode', 'coimbatore', 1, 4, 500, 2, 1, '2022-03-09 11:50:20', '2022-03-09 12:18:51'),
(2, 'OD-00002', '2022-03-09 17:21:30', '2022-03-09 13:51:30', 'Erode', 'coimbatore', 1, 4, 500, 1, 0, '2022-03-09 11:51:30', '2022-03-09 13:28:06'),
(3, 'OD-00003', '2022-03-09 11:52:20', '2022-03-09 13:52:20', 'Erode', 'coimbatore', 1, 4, 500, 1, 0, '2022-03-09 11:52:20', '2022-03-09 13:28:07'),
(4, 'OD-00004', '2022-03-09 11:56:44', '2022-03-09 13:56:44', 'Erode', 'coimbatore', 1, 4, 500, 1, 0, '2022-03-09 11:56:44', '2022-03-09 13:28:07'),
(5, 'OD-00005', '2022-03-09 11:57:14', '2022-03-09 13:57:14', 'Erode', 'coimbatore', 1, 4, 500, 1, 0, '2022-03-09 11:57:14', '2022-03-09 13:28:07'),
(6, 'OD-00006', '2022-03-09 12:22:10', '2022-03-09 13:22:10', 'Erode', 'coimbatore', 1, 4, 500, 1, 0, '2022-03-09 12:22:10', '2022-03-09 12:22:10'),
(7, 'OD-00007', '2022-03-09 12:29:25', '2022-03-09 17:29:25', 'Erode', 'coimbatore', 1, 4, 500, 1, 0, '2022-03-09 12:29:25', '2022-03-09 13:28:07'),
(8, 'OD-00008', '2022-03-09 12:30:17', '2022-03-09 14:30:17', 'Erode', 'coimbatore', 1, 4, 500, 1, 0, '2022-03-09 12:30:17', '2022-03-09 13:28:07');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_rate` int(11) NOT NULL,
  `item_value` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `item_id`, `item_quantity`, `item_rate`, `item_value`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 2, 100, 200, 1, '2022-03-09 11:57:15', '2022-03-09 11:57:15'),
(2, 5, 2, 2, 150, 300, 1, '2022-03-09 11:57:15', '2022-03-09 11:57:15'),
(3, 6, 1, 2, 100, 200, 1, '2022-03-09 12:22:10', '2022-03-09 12:22:10'),
(4, 6, 2, 2, 150, 300, 1, '2022-03-09 12:22:11', '2022-03-09 12:22:11'),
(5, 7, 1, 2, 100, 200, 1, '2022-03-09 12:29:25', '2022-03-09 12:29:25'),
(6, 7, 2, 2, 150, 300, 1, '2022-03-09 12:29:25', '2022-03-09 12:29:25'),
(7, 8, 1, 2, 100, 200, 1, '2022-03-09 12:30:17', '2022-03-09 12:30:17'),
(8, 8, 2, 2, 150, 300, 1, '2022-03-09 12:30:17', '2022-03-09 12:30:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delayed_orders`
--
ALTER TABLE `delayed_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delayed_orders`
--
ALTER TABLE `delayed_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
