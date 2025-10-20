-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2025 at 08:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_09_26_165646_add_role_to_users_table', 1),
(6, '2025_09_26_165717_create_orders_table', 1),
(7, '2025_09_26_165721_create_order_items_table', 1),
(8, '2025_09_26_165821_create_products_table', 1),
(9, '2025_09_26_170623_add_foreign_keys', 1),
(10, '2025_09_26_170645_add_constraints', 1),
(11, '2025_09_26_170707_add_indexes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','paid','shipped','completed','cancelled') NOT NULL DEFAULT 'pending',
  `items_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `billing_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`billing_address`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `status`, `items_count`, `billing_address`, `created_at`, `updated_at`) VALUES
(1, 7, 'pending', 4, '{\"full_name\":\"Lucious Little\",\"address\":\"6595 Jamey Plaza\",\"city\":\"Janiestad\",\"zip\":\"81167\",\"country\":\"Tokelau\",\"phone\":\"(580) 564-7341\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(2, 8, 'completed', 8, '{\"full_name\":\"Ms. Serena Weimann\",\"address\":\"9183 Clement Key Suite 755\",\"city\":\"West Eugenia\",\"zip\":\"64867\",\"country\":\"Bahrain\",\"phone\":\"254.445.2834\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(3, 3, 'cancelled', 4, '{\"full_name\":\"Imelda Dietrich I\",\"address\":\"23465 Heaney Forge Apt. 195\",\"city\":\"South Alexisport\",\"zip\":\"38818-8103\",\"country\":\"Sweden\",\"phone\":\"630.803.9763\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(4, 2, 'completed', 8, '{\"full_name\":\"Vincenza Grady\",\"address\":\"6425 Considine Orchard Suite 945\",\"city\":\"Willmsville\",\"zip\":\"18021-7375\",\"country\":\"Ecuador\",\"phone\":\"+1 (623) 294-8739\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(5, 8, 'paid', 9, '{\"full_name\":\"Shanon Parker MD\",\"address\":\"7846 Britney Fall\",\"city\":\"East Willa\",\"zip\":\"20213\",\"country\":\"Moldova\",\"phone\":\"+1-321-576-7950\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(6, 5, 'cancelled', 5, '{\"full_name\":\"Nella Runolfsdottir\",\"address\":\"326 Torrance Crescent\",\"city\":\"Alexannefort\",\"zip\":\"24788\",\"country\":\"Armenia\",\"phone\":\"+1-763-206-8965\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(7, 7, 'paid', 13, '{\"full_name\":\"Gabriel Parisian\",\"address\":\"548 Idell Pass\",\"city\":\"Lucieland\",\"zip\":\"67278\",\"country\":\"Rwanda\",\"phone\":\"+1.225.798.0658\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(8, 4, 'cancelled', 9, '{\"full_name\":\"Zachariah West\",\"address\":\"37060 Bosco Bypass\",\"city\":\"Juanaview\",\"zip\":\"27283-7757\",\"country\":\"Bahamas\",\"phone\":\"+1-562-644-0066\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(9, 8, 'pending', 14, '{\"full_name\":\"Ethelyn Mills\",\"address\":\"9938 Thompson Station Suite 955\",\"city\":\"Rutherfordstad\",\"zip\":\"87363-8831\",\"country\":\"Reunion\",\"phone\":\"+1-726-355-9308\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(10, 6, 'completed', 1, '{\"full_name\":\"Cristal Balistreri DDS\",\"address\":\"920 Boyer Station\",\"city\":\"East Ava\",\"zip\":\"92005\",\"country\":\"Sudan\",\"phone\":\"(954) 221-0498\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(11, 5, 'pending', 2, '{\"full_name\":\"Alvina Crona\",\"address\":\"361 Prohaska Fort\",\"city\":\"West Kathryne\",\"zip\":\"41447-1211\",\"country\":\"Costa Rica\",\"phone\":\"+1-423-872-3891\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(12, 5, 'shipped', 7, '{\"full_name\":\"Madonna Ledner DDS\",\"address\":\"19264 Eleazar Inlet\",\"city\":\"Port Alessandra\",\"zip\":\"18547\",\"country\":\"Dominican Republic\",\"phone\":\"+1.760.868.3448\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(13, 8, 'cancelled', 11, '{\"full_name\":\"Una Heathcote\",\"address\":\"9149 Ansel Unions\",\"city\":\"Beerbury\",\"zip\":\"68975\",\"country\":\"Mongolia\",\"phone\":\"458.989.8742\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(14, 2, 'cancelled', 1, '{\"full_name\":\"Timmy Macejkovic\",\"address\":\"8090 Mertie Wells\",\"city\":\"North Ezra\",\"zip\":\"35514\",\"country\":\"Iran\",\"phone\":\"+1 (574) 217-2789\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(15, 4, 'paid', 1, '{\"full_name\":\"Rose Lehner\",\"address\":\"760 Ryan Path\",\"city\":\"Delphaland\",\"zip\":\"89113\",\"country\":\"Venezuela\",\"phone\":\"(272) 450-0481\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(16, 9, 'pending', 6, '{\"full_name\":\"Elroy Toy\",\"address\":\"700 Laurence Junction Apt. 111\",\"city\":\"Wardmouth\",\"zip\":\"30629-5629\",\"country\":\"Korea\",\"phone\":\"(863) 526-2757\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(17, 7, 'completed', 6, '{\"full_name\":\"Name O\'Conner DVM\",\"address\":\"38662 Kris Station Suite 339\",\"city\":\"New Margefort\",\"zip\":\"20581-0608\",\"country\":\"Sweden\",\"phone\":\"1-978-504-1588\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(18, 9, 'paid', 5, '{\"full_name\":\"Adelbert Hodkiewicz\",\"address\":\"759 Jackie Landing Apt. 528\",\"city\":\"South Bernitabury\",\"zip\":\"40492-3037\",\"country\":\"Pakistan\",\"phone\":\"+1.208.308.3043\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(19, 8, 'pending', 8, '{\"full_name\":\"Mr. Emmet Stiedemann DVM\",\"address\":\"3234 Aisha Throughway Apt. 917\",\"city\":\"Gloverfurt\",\"zip\":\"92105\",\"country\":\"Cameroon\",\"phone\":\"+1-856-692-0189\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(20, 5, 'pending', 13, '{\"full_name\":\"Richmond Herzog\",\"address\":\"24155 Miller Walks\",\"city\":\"Croninmouth\",\"zip\":\"32298-2744\",\"country\":\"Guinea-Bissau\",\"phone\":\"1-775-546-6931\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(21, 9, 'cancelled', 13, '{\"full_name\":\"Sabina Fritsch\",\"address\":\"6919 Swift Ports Suite 291\",\"city\":\"East Gia\",\"zip\":\"97889\",\"country\":\"Isle of Man\",\"phone\":\"+1-828-774-5929\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(22, 6, 'pending', 13, '{\"full_name\":\"Brady McGlynn\",\"address\":\"5254 Preston Station Suite 700\",\"city\":\"North Howardburgh\",\"zip\":\"41979\",\"country\":\"Yemen\",\"phone\":\"303-975-8620\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(23, 3, 'completed', 9, '{\"full_name\":\"Rowland Ullrich\",\"address\":\"3127 Terrence Rapid Apt. 708\",\"city\":\"South Xzavierview\",\"zip\":\"19910-3842\",\"country\":\"Austria\",\"phone\":\"+1-385-991-5999\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(24, 2, 'cancelled', 6, '{\"full_name\":\"Ericka Cartwright\",\"address\":\"273 Sauer Freeway Apt. 576\",\"city\":\"East Arnemouth\",\"zip\":\"40732-4325\",\"country\":\"Bermuda\",\"phone\":\"1-629-270-5023\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(25, 3, 'shipped', 10, '{\"full_name\":\"Dr. Georgianna Hoeger\",\"address\":\"7501 Alfreda Lakes\",\"city\":\"Hodkiewiczberg\",\"zip\":\"24543\",\"country\":\"Anguilla\",\"phone\":\"1-253-544-8433\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(26, 7, 'paid', 9, '{\"full_name\":\"Martine Shanahan\",\"address\":\"8084 Marty Overpass Suite 845\",\"city\":\"Sipesville\",\"zip\":\"52899-0015\",\"country\":\"Monaco\",\"phone\":\"+1-208-735-7335\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(27, 6, 'completed', 4, '{\"full_name\":\"D\'angelo Schuster\",\"address\":\"2318 Zemlak Knolls Apt. 244\",\"city\":\"North Marjoryton\",\"zip\":\"09093-1302\",\"country\":\"Finland\",\"phone\":\"458.862.4810\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(28, 2, 'pending', 13, '{\"full_name\":\"Jean Donnelly\",\"address\":\"626 Gibson Underpass\",\"city\":\"South Medaborough\",\"zip\":\"28670\",\"country\":\"Lesotho\",\"phone\":\"810.739.8781\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(29, 9, 'paid', 2, '{\"full_name\":\"Earline Abernathy\",\"address\":\"7898 Bins Mews\",\"city\":\"North Kristy\",\"zip\":\"63121\",\"country\":\"Turkey\",\"phone\":\"603.332.9618\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(30, 8, 'completed', 11, '{\"full_name\":\"Dr. Vivian Boehm\",\"address\":\"84978 Murphy Trail\",\"city\":\"South Moseland\",\"zip\":\"83824\",\"country\":\"Vietnam\",\"phone\":\"+17263002555\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(31, 5, 'completed', 5, '{\"full_name\":\"Baron Hegmann DVM\",\"address\":\"5388 O\'Conner Roads\",\"city\":\"Lake Larissaport\",\"zip\":\"55091-2881\",\"country\":\"Gabon\",\"phone\":\"425-994-3531\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(32, 6, 'cancelled', 12, '{\"full_name\":\"Rory Murphy III\",\"address\":\"30155 Nick Parks\",\"city\":\"Port Nolanport\",\"zip\":\"44773\",\"country\":\"Belgium\",\"phone\":\"218-796-9857\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(33, 3, 'pending', 10, '{\"full_name\":\"Lila Erdman\",\"address\":\"131 Alysa Shoals Apt. 034\",\"city\":\"Cummingschester\",\"zip\":\"50172-7118\",\"country\":\"Falkland Islands (Malvinas)\",\"phone\":\"1-413-589-9936\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(34, 9, 'cancelled', 9, '{\"full_name\":\"Roman Marquardt\",\"address\":\"6979 Shad Circle\",\"city\":\"Orvillefurt\",\"zip\":\"84423-0031\",\"country\":\"Tonga\",\"phone\":\"(678) 397-0399\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(35, 7, 'paid', 8, '{\"full_name\":\"Charlie Reinger\",\"address\":\"1774 Liam Flats\",\"city\":\"South Rahulport\",\"zip\":\"14218-6303\",\"country\":\"Faroe Islands\",\"phone\":\"220.640.6433\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(36, 7, 'completed', 12, '{\"full_name\":\"Annabelle Lemke\",\"address\":\"7750 Swaniawski Station\",\"city\":\"Lake Elyssa\",\"zip\":\"26864-1497\",\"country\":\"Namibia\",\"phone\":\"1-256-338-3575\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(37, 5, 'pending', 13, '{\"full_name\":\"Kasey Dickinson\",\"address\":\"2545 Jan Walk Apt. 332\",\"city\":\"Rahsaanshire\",\"zip\":\"25446\",\"country\":\"Lebanon\",\"phone\":\"617-677-0504\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(38, 9, 'completed', 5, '{\"full_name\":\"Mr. Evans Ziemann\",\"address\":\"9711 Florian Causeway\",\"city\":\"Satterfieldberg\",\"zip\":\"81341\",\"country\":\"South Georgia and the South Sandwich Islands\",\"phone\":\"(831) 241-8338\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(39, 3, 'cancelled', 6, '{\"full_name\":\"Mariam Reilly\",\"address\":\"21777 Cummerata Forges\",\"city\":\"Runolfsdottirton\",\"zip\":\"45063\",\"country\":\"Nauru\",\"phone\":\"+1.602.301.8189\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(40, 4, 'shipped', 12, '{\"full_name\":\"Kathlyn Kovacek DVM\",\"address\":\"46830 Weber Walk Suite 293\",\"city\":\"South Carlie\",\"zip\":\"61933\",\"country\":\"Libyan Arab Jamahiriya\",\"phone\":\"828.396.9085\"}', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(41, 10, 'completed', 2, '{\"full_name\":\"Ivana An\\u0111eli\\u0107\",\"address\":\"Test adresa update\",\"city\":\"Belgrade\",\"zip\":\"11000\",\"country\":\"Serbia\",\"phone\":\"060123456\"}', '2025-09-26 16:26:39', '2025-09-26 16:40:35'),
(42, 10, 'paid', 2, '{\"full_name\":\"Ivana An\\u0111eli\\u0107\",\"address\":\"Test adresa\",\"city\":\"Belgrade\",\"zip\":\"11000\",\"country\":\"Serbia\",\"phone\":\"060123456\"}', '2025-09-26 16:27:59', '2025-09-26 16:42:29'),
(43, 10, 'cancelled', 0, '{\"full_name\":\"Ivana An\\u0111eli\\u0107\",\"address\":\"Test adresa\",\"city\":\"Belgrade\",\"zip\":\"11000\",\"country\":\"Serbia\",\"phone\":\"060123456\"}', '2025-09-26 16:38:44', '2025-09-26 16:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `unit_price`, `quantity`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 20, 34.77, 2, 69.54, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(2, 1, 10, 262.01, 2, 524.02, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(3, 2, 9, 299.36, 3, 898.08, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(4, 2, 24, 153.46, 4, 613.84, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(5, 2, 29, 27.19, 1, 27.19, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(6, 3, 9, 299.36, 2, 598.72, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(7, 3, 8, 342.07, 2, 684.14, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(8, 4, 27, 193.92, 1, 193.92, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(9, 4, 3, 109.79, 2, 219.58, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(10, 4, 5, 230.76, 1, 230.76, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(11, 4, 16, 47.50, 4, 190.00, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(12, 5, 29, 27.19, 3, 81.57, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(13, 5, 30, 344.79, 1, 344.79, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(14, 5, 18, 160.64, 4, 642.56, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(15, 5, 12, 78.31, 1, 78.31, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(16, 6, 14, 203.10, 4, 812.40, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(17, 6, 17, 131.71, 1, 131.71, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(18, 7, 25, 394.54, 2, 789.08, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(19, 7, 6, 184.08, 4, 736.32, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(20, 7, 21, 63.07, 3, 189.21, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(21, 7, 11, 349.87, 4, 1399.48, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(22, 8, 30, 344.79, 3, 1034.37, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(23, 8, 18, 160.64, 2, 321.28, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(24, 8, 20, 34.77, 1, 34.77, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(25, 8, 27, 193.92, 2, 387.84, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(26, 8, 15, 328.18, 1, 328.18, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(27, 9, 3, 109.79, 1, 109.79, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(28, 9, 15, 328.18, 4, 1312.72, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(29, 9, 14, 203.10, 4, 812.40, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(30, 9, 9, 299.36, 2, 598.72, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(31, 9, 16, 47.50, 3, 142.50, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(32, 10, 10, 262.01, 1, 262.01, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(33, 11, 6, 184.08, 1, 184.08, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(34, 11, 15, 328.18, 1, 328.18, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(35, 12, 6, 184.08, 3, 552.24, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(36, 12, 14, 203.10, 4, 812.40, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(37, 13, 16, 47.50, 3, 142.50, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(38, 13, 9, 299.36, 3, 898.08, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(39, 13, 20, 34.77, 3, 104.31, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(40, 13, 28, 291.01, 2, 582.02, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(41, 14, 20, 34.77, 1, 34.77, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(42, 15, 28, 291.01, 1, 291.01, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(43, 16, 4, 288.88, 1, 288.88, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(44, 16, 13, 359.54, 4, 1438.16, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(45, 16, 16, 47.50, 1, 47.50, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(46, 17, 30, 344.79, 1, 344.79, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(47, 17, 4, 288.88, 2, 577.76, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(48, 17, 18, 160.64, 1, 160.64, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(49, 17, 29, 27.19, 2, 54.38, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(50, 18, 1, 104.45, 2, 208.90, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(51, 18, 15, 328.18, 3, 984.54, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(52, 19, 8, 342.07, 3, 1026.21, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(53, 19, 27, 193.92, 2, 387.84, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(54, 19, 14, 203.10, 3, 609.30, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(55, 20, 17, 131.71, 1, 131.71, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(56, 20, 5, 230.76, 4, 923.04, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(57, 20, 16, 47.50, 4, 190.00, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(58, 20, 22, 36.74, 1, 36.74, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(59, 20, 7, 387.31, 3, 1161.93, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(60, 21, 11, 349.87, 1, 349.87, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(61, 21, 3, 109.79, 3, 329.37, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(62, 21, 5, 230.76, 3, 692.28, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(63, 21, 2, 280.72, 2, 561.44, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(64, 21, 18, 160.64, 4, 642.56, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(65, 22, 23, 20.85, 4, 83.40, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(66, 22, 9, 299.36, 4, 1197.44, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(67, 22, 25, 394.54, 2, 789.08, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(68, 22, 18, 160.64, 3, 481.92, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(69, 23, 19, 109.69, 2, 219.38, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(70, 23, 3, 109.79, 2, 219.58, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(71, 23, 24, 153.46, 2, 306.92, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(72, 23, 22, 36.74, 3, 110.22, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(73, 24, 14, 203.10, 2, 406.20, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(74, 24, 15, 328.18, 4, 1312.72, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(75, 25, 4, 288.88, 2, 577.76, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(76, 25, 23, 20.85, 1, 20.85, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(77, 25, 5, 230.76, 4, 923.04, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(78, 25, 6, 184.08, 2, 368.16, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(79, 25, 25, 394.54, 1, 394.54, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(80, 26, 27, 193.92, 1, 193.92, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(81, 26, 17, 131.71, 4, 526.84, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(82, 26, 26, 289.26, 4, 1157.04, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(83, 27, 20, 34.77, 4, 139.08, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(84, 28, 14, 203.10, 2, 406.20, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(85, 28, 27, 193.92, 3, 581.76, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(86, 28, 1, 104.45, 4, 417.80, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(87, 28, 4, 288.88, 2, 577.76, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(88, 28, 6, 184.08, 2, 368.16, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(89, 29, 13, 359.54, 2, 719.08, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(90, 30, 4, 288.88, 4, 1155.52, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(91, 30, 8, 342.07, 4, 1368.28, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(92, 30, 5, 230.76, 1, 230.76, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(93, 30, 10, 262.01, 2, 524.02, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(94, 31, 30, 344.79, 1, 344.79, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(95, 31, 17, 131.71, 1, 131.71, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(96, 31, 8, 342.07, 1, 342.07, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(97, 31, 16, 47.50, 2, 95.00, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(98, 32, 6, 184.08, 2, 368.16, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(99, 32, 5, 230.76, 3, 692.28, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(100, 32, 25, 394.54, 3, 1183.62, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(101, 32, 1, 104.45, 4, 417.80, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(102, 33, 10, 262.01, 4, 1048.04, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(103, 33, 2, 280.72, 1, 280.72, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(104, 33, 21, 63.07, 2, 126.14, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(105, 33, 26, 289.26, 1, 289.26, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(106, 33, 18, 160.64, 2, 321.28, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(107, 34, 13, 359.54, 4, 1438.16, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(108, 34, 18, 160.64, 2, 321.28, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(109, 34, 21, 63.07, 2, 126.14, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(110, 34, 28, 291.01, 1, 291.01, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(111, 35, 4, 288.88, 3, 866.64, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(112, 35, 13, 359.54, 3, 1078.62, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(113, 35, 3, 109.79, 2, 219.58, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(114, 36, 3, 109.79, 4, 439.16, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(115, 36, 1, 104.45, 1, 104.45, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(116, 36, 2, 280.72, 3, 842.16, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(117, 36, 28, 291.01, 4, 1164.04, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(118, 37, 9, 299.36, 1, 299.36, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(119, 37, 22, 36.74, 2, 73.48, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(120, 37, 26, 289.26, 4, 1157.04, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(121, 37, 1, 104.45, 3, 313.35, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(122, 37, 7, 387.31, 3, 1161.93, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(123, 38, 10, 262.01, 3, 786.03, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(124, 38, 23, 20.85, 1, 20.85, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(125, 38, 25, 394.54, 1, 394.54, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(126, 39, 19, 109.69, 1, 109.69, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(127, 39, 4, 288.88, 1, 288.88, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(128, 39, 9, 299.36, 4, 1197.44, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(129, 40, 17, 131.71, 4, 526.84, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(130, 40, 29, 27.19, 2, 54.38, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(131, 40, 9, 299.36, 3, 898.08, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(132, 40, 1, 104.45, 3, 313.35, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(133, 41, 1, 104.45, 2, 208.90, '2025-09-26 16:31:36', '2025-09-26 16:31:36'),
(135, 42, 2, 280.72, 2, 561.44, '2025-09-26 16:41:36', '2025-09-26 16:41:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 10, 'auth_token', 'a713cecc37022b5e580a1ddcc9b079c5db769d0f8313c902b9a5c1ca8dbe1270', '[\"*\"]', NULL, NULL, '2025-09-26 16:02:41', '2025-09-26 16:02:41'),
(2, 'App\\Models\\User', 10, 'auth_token', '06dc67b3cf3cb2f8578fb519a7eaef946cfb04eef5e1473e85c397a487ae6e14', '[\"*\"]', NULL, NULL, '2025-09-26 16:03:03', '2025-09-26 16:03:03'),
(3, 'App\\Models\\User', 1, 'auth_token', 'cc0c1454d55f3f11f6fb940f14bcc561a1eb0af05a46eb35a587eb4817b361b7', '[\"*\"]', '2025-09-26 16:09:24', NULL, '2025-09-26 16:07:36', '2025-09-26 16:09:24'),
(4, 'App\\Models\\User', 10, 'auth_token', '350a9b320e9c760fbda3a84546764ab681f50b44a6623649efc59b57f7706a0e', '[\"*\"]', '2025-09-26 16:42:29', NULL, '2025-09-26 16:25:29', '2025-09-26 16:42:29'),
(5, 'App\\Models\\User', 1, 'auth_token', 'd6c4b0ff7cd989ffe5610c881a9d9bab62134eb398d8c7148ee0956d29d7c8e5', '[\"*\"]', '2025-09-26 16:40:35', NULL, '2025-09-26 16:39:57', '2025-09-26 16:40:35'),
(6, 'App\\Models\\User', 1, 'auth_token', '468853731821c861345345e8ca4c2828ffbd9a0f60278ddb59eef94320b26782', '[\"*\"]', NULL, NULL, '2025-09-26 16:50:59', '2025-09-26 16:50:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `stock`, `created_at`, `updated_at`) VALUES
(1, 'Wi-Fi 6 Router', 'Rerum voluptatem ratione consequuntur voluptatem similique iure qui.', 104.45, 13, '2025-09-26 15:16:26', '2025-09-26 16:31:36'),
(2, 'Graphic Tablet S', 'Rerum modi neque perspiciatis porro vero vero aut quam delectus.', 280.72, 86, '2025-09-26 15:16:26', '2025-09-26 16:41:36'),
(3, 'Bluetooth Speaker', 'Repellendus maiores et earum cum dolor aut asperiores expedita voluptatibus aut nihil perspiciatis eius.', 109.79, 182, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(4, 'Desk LED Lamp', 'Corporis ullam amet voluptatem ea ipsam ut dolor.', 288.88, 68, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(5, 'Gaming Chair', 'Dolorem aspernatur aut aliquid tenetur qui est quae soluta unde labore officia aliquam veniam dolorem enim asperiores.', 230.76, 8, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(6, 'USB-C Hub 7-in-1', 'Dolores sint voluptatum ipsum recusandae corporis vel eius pariatur sint possimus omnis.', 184.08, 23, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(7, 'Ergonomic Office Chair', 'Qui aliquam id alias occaecati id minima temporibus est quaerat dolor perferendis.', 387.31, 79, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(8, 'Power Bank 20000mAh', 'Praesentium temporibus nulla aliquid eius quia laborum voluptate officia nesciunt.', 342.07, 62, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(9, 'Fitness Tracker Band', 'Aut quasi ducimus modi exercitationem voluptatem excepturi qui laboriosam.', 299.36, 123, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(10, 'Drone Mini', 'Aspernatur ipsam consequatur eveniet ad voluptatem velit tenetur quis.', 262.01, 11, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(11, 'Ring Light 12\"', 'Consequatur cupiditate omnis aut recusandae tenetur non ut soluta molestiae provident explicabo at doloremque.', 349.87, 55, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(12, 'Wireless Mouse', 'Corporis veritatis inventore esse consequatur soluta eum autem pariatur.', 78.31, 100, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(13, 'Noise-Canceling Headphones', 'Explicabo eos explicabo id nesciunt neque vel aliquid molestias quia qui.', 359.54, 169, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(14, 'Microphone USB', 'Sit non voluptatem ut perspiciatis esse omnis esse sequi quas.', 203.10, 57, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(15, 'Action Camera 4K', 'Excepturi maiores consectetur quaerat rem eum praesentium qui.', 328.18, 118, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(16, 'NVMe SSD 1TB', 'Enim facilis autem minus rerum voluptas eos ut voluptates explicabo laborum deserunt asperiores vel perspiciatis enim.', 47.50, 170, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(17, 'Smartwatch Series X', 'Ducimus consequatur ex ipsam aliquid veniam adipisci occaecati aperiam possimus animi voluptatem nisi ducimus nobis reiciendis.', 131.71, 21, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(18, 'Phone Tripod', 'Ut dicta provident dolorem nobis dolores natus eos sed odio minima quibusdam aut aut recusandae ad nisi.', 160.64, 63, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(19, 'External HDD 2TB', 'Ut nesciunt sint quo distinctio qui voluptatem ut ut similique et.', 109.69, 159, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(20, 'Raspberry Pi Kit', 'Reiciendis error voluptatum non occaecati et consequatur omnis deleniti.', 34.77, 180, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(21, 'Portable SSD 1TB', 'Eveniet ut fugiat veniam nulla voluptas earum consequatur.', 63.07, 179, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(22, 'Webcam 1080p', 'Eos dolorem et adipisci itaque voluptates velit quidem sunt sunt qui non ab ea dicta.', 36.74, 5, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(23, 'USB-C Charger 65W', 'Ab in repellendus dicta laborum est veniam occaecati adipisci provident ea corporis aut architecto.', 20.85, 88, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(24, 'Arduino Starter Kit', 'Ex quas dolores et voluptas quod veritatis non ut iusto corporis enim dolor blanditiis.', 153.46, 140, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(25, 'Mechanical Keyboard', 'Voluptas quos ea non debitis perspiciatis impedit cumque aut excepturi quae.', 394.54, 96, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(26, 'Laptop Stand Aluminum', 'Error debitis sed aliquam quos placeat facilis cupiditate non molestiae sunt id atque sit.', 289.26, 84, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(27, 'Smart Plug Wi-Fi', 'Eius qui dolore quia impedit quis at architecto aut aspernatur nobis ut consequuntur illo modi doloremque.', 193.92, 16, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(28, '27\" IPS Monitor', 'Voluptatem eligendi velit quaerat ratione et praesentium quas.', 291.01, 54, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(29, 'Laser Printer Mono', 'Placeat aut molestiae dolorum aut sint neque autem tempora.', 27.19, 187, '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(30, '4K HDMI Cable', 'Quia quia rerum quas tempore quas sunt aspernatur minima odio ut laudantium sunt distinctio aut.', 344.79, 173, '2025-09-26 15:16:26', '2025-09-26 15:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','customer') NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Shop Admin', 'admin@mail.com', '2025-09-26 15:16:25', '$2y$12$gzI19F6QMn7gvWz3wVMDketiZPSBr9a.FOGV8Su.16BgM7VEnbrpe', 'admin', 'Jomh4mH7tFs67nnJt82RlT9hg9r6uU2nvSg0JeoErd8RnHud1ywOXQlfVioW', '2025-09-26 15:16:25', '2025-09-26 15:16:25'),
(2, 'Tierra Bernhard', 'erick.russel@example.org', '2025-09-26 15:16:25', '$2y$12$A/8EcaSgXvvztpbN78yiSeCyINE6fmPK9PU0i5.vhHQUjNbmix4DC', 'customer', 'RHYHRWlZ9j', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(3, 'Lonny Morissette', 'aubrey.mills@example.net', '2025-09-26 15:16:26', '$2y$12$A/8EcaSgXvvztpbN78yiSeCyINE6fmPK9PU0i5.vhHQUjNbmix4DC', 'customer', 'KZ6yYqEKms', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(4, 'Laura Schamberger', 'uturner@example.com', '2025-09-26 15:16:26', '$2y$12$A/8EcaSgXvvztpbN78yiSeCyINE6fmPK9PU0i5.vhHQUjNbmix4DC', 'customer', 'lmfgkEWZjT', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(5, 'Dr. Braden Beatty', 'mortimer64@example.org', '2025-09-26 15:16:26', '$2y$12$A/8EcaSgXvvztpbN78yiSeCyINE6fmPK9PU0i5.vhHQUjNbmix4DC', 'customer', 'VDVCj7p1kZ', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(6, 'Mr. Floyd O\'Connell I', 'wgreenholt@example.org', '2025-09-26 15:16:26', '$2y$12$A/8EcaSgXvvztpbN78yiSeCyINE6fmPK9PU0i5.vhHQUjNbmix4DC', 'customer', 'LQwRsNqWyB', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(7, 'Prof. Sydnie Abshire', 'krajcik.rosario@example.com', '2025-09-26 15:16:26', '$2y$12$A/8EcaSgXvvztpbN78yiSeCyINE6fmPK9PU0i5.vhHQUjNbmix4DC', 'customer', '4QVkMhUHiC', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(8, 'Torrance Hyatt', 'mercedes63@example.net', '2025-09-26 15:16:26', '$2y$12$A/8EcaSgXvvztpbN78yiSeCyINE6fmPK9PU0i5.vhHQUjNbmix4DC', 'customer', 'LERpCh5aYV', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(9, 'Ahmed Bergnaum', 'gardner.olson@example.net', '2025-09-26 15:16:26', '$2y$12$A/8EcaSgXvvztpbN78yiSeCyINE6fmPK9PU0i5.vhHQUjNbmix4DC', 'customer', 'PF7t5xteBp', '2025-09-26 15:16:26', '2025-09-26 15:16:26'),
(10, 'Ivana', 'ivana@mail.com', NULL, '$2y$12$Cx5YNSldIyctOaSdcwGegOwxKggSN9uO0sqKPS1lqo6Vt8js4LH8m', 'customer', NULL, '2025-09-26 16:02:41', '2025-09-26 16:02:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_status_index` (`status`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_created_at_index` (`created_at`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_order_product_index` (`order_id`,`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_title_unique` (`title`),
  ADD KEY `products_price_index` (`price`),
  ADD KEY `products_stock_index` (`stock`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_index` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
