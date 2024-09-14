-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 04:22 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `is_ban` tinyint(1) DEFAULT 0 COMMENT '0=not_ban ,1=ban',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `is_ban`, `created_at`) VALUES
(3, 'ahmad kiwan', 'ahmad.fkiwan12@gmail.com', '$2y$10$WmewzNLgBUKDOkyf2j.h2e6bNQAN4QJD9rErTotFTBplJBdGe7E0y', '0787011250', 0, '2024-05-23'),
(5, 'ennab', 'ennab@test.com', '$2y$10$oMbefMxJUQsrqHJgJlICx.OwkI.WirVQq3Kz0FmpiQgfHdx8dL88a', '7932818348', 1, '2024-05-23'),
(7, 'test', 'test@test.com', '$2y$10$ms/U4cN4Rq8sjBgCHJRjkOcCCWM2Z0KnCb3FCZMeKREas3QuhT6eG', '122456789', 0, '2024-05-23'),
(8, 'test1', 'test2@test.com', '$2y$10$haP7mIhospXil.5ODKpmSeTmvw7nzXTs2jIXjU/qCplo/U2xpCO1m', '1234567890', 0, '2024-05-23'),
(9, 'test', 'test@admin.com', '$2y$10$XdWjDJjXeOo3ho1jjD7Svu77lxoikqYJ4OfRLSaoqtwodEll3u9EK', '2345434563', 1, '2024-05-26'),
(10, 'test', 'kiwitest@test.com', '$2y$10$QnOJFQlB4sNu/oS7T0Djiu0yTPZBauuvSRR0RFlq.fMvY.rAHQMQS', '3432345678', 1, '2024-05-26');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible , 1=hidden',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `categoryName`, `description`, `status`, `created_at`) VALUES
(1, 'Electronics', '', 0, '2024-05-26'),
(2, 'Fashion', '', 1, '2024-05-27'),
(3, 'Health & Beauty', '', 0, '2024-05-27'),
(4, 'Industrial equipment', '', 0, '2024-05-27'),
(5, 'Motors', '', 0, '2024-05-27');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible , 1=invisible ',
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `status`, `created_at`) VALUES
(2, 'test', 'test@test.com', '0787011252', 0, '2024-05-27'),
(4, 'test2', 'test2@test.com', '0787011250', 0, '2024-05-27'),
(6, 'ahmad', 'ahmad.fkiwan12@gmail.com', '0787011250', 0, '2024-05-27'),
(7, 'tariq', 'kiwi@test.com', '0788888523', 0, '2024-05-27');

-- --------------------------------------------------------

--
-- Table structure for table `orderinfo`
--

CREATE TABLE `orderinfo` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `total_price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orderinfo`
--

INSERT INTO `orderinfo` (`order_id`, `product_id`, `quantity`, `total_price`) VALUES
(3, 21, '1', '956'),
(4, 21, '1', '956'),
(6, 21, '1', '956'),
(7, 28, '1', '435');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `total_amount` varchar(255) NOT NULL,
  `invoice_path` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `warehouse_id`, `customer_id`, `payment_type`, `total_amount`, `invoice_path`, `created_at`, `status`) VALUES
(3, 1, 4, 'cash', '956', 'invoices/invoice_3.pdf', '2024-06-05', 1),
(4, 1, 2, 'online', '956', 'invoices/invoice_4.pdf', '2024-06-05', 0),
(6, 1, 2, 'cash', '956', 'invoices/invoice_6.pdf', '2024-06-05', 1),
(7, 1, 6, 'cash', '435', 'invoices/invoice_7.pdf', '2024-06-06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `quantity`, `image`, `barcode`, `status`, `created_at`) VALUES
(21, 1, 'i phone 15', 'smart phone', 956, 12, '../assets/uploads/products/1716792124.jpg', '7843215326', 0, '2024-05-27 06:42:04'),
(22, 1, 'apple watch', 'smart watch', 623, 43, '../assets/uploads/products/1716792170.jpeg', '4523165237', 0, '2024-05-27 06:42:50'),
(23, 1, 'iphone 15 pro', '1T 19g ram', 1500, 34, '../assets/uploads/products/1716792268.webp', '2346288951', 0, '2024-05-27 06:44:28'),
(25, 2, 'test', 'test qr code', 22, 34, '../assets/uploads/products/1717313450.png', '3462788246', 0, '2024-06-02 07:30:50'),
(26, 4, 'testbarcode', 'eeeee', 12, 212, '../assets/uploads/products/1717331137.jpeg', '8653214963', 0, '2024-06-02 12:25:37'),
(27, 5, 'bmw', 'wewe', 34, 234, '../assets/uploads/products/1717403869.png', '8689054378', 0, '2024-06-03 08:37:49'),
(28, 1, 'mac book', 'sss', 435, 43, '../assets/uploads/products/1717495653.png', '2589672834', 0, '2024-06-04 10:07:33');

-- --------------------------------------------------------

--
-- Table structure for table `warehouseproducts`
--

CREATE TABLE `warehouseproducts` (
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `warehouseproducts`
--

INSERT INTO `warehouseproducts` (`warehouse_id`, `product_id`, `quantity`, `created_at`) VALUES
(1, 22, '1', '2024-05-29'),
(3, 22, '14', '2024-05-30'),
(3, 23, '12', '2024-05-30'),
(1, 26, '11', '2024-06-04'),
(3, 27, '1', '2024-06-04'),
(1, 21, '11', '2024-06-05'),
(1, 23, '3', '2024-06-05'),
(1, 25, '1', '2024-06-05'),
(1, 27, '1', '2024-06-05'),
(1, 28, '2', '2024-06-05');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=visible , 1=invisible '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `location`, `status`) VALUES
(1, 'test', 'amman1', 0),
(3, 'test1', 'Irbid', 0),
(4, 'CUSTOUMER', 'jarash', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categoryName` (`categoryName`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `warehouseproducts`
--
ALTER TABLE `warehouseproducts`
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `warehouseproducts`
--
ALTER TABLE `warehouseproducts`
  ADD CONSTRAINT `warehouseproducts_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`),
  ADD CONSTRAINT `warehouseproducts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
