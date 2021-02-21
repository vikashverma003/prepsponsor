-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2019 at 01:13 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presponsor`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_members`
--

CREATE TABLE `add_members` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `teams_id` int(67) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `add_members`
--

INSERT INTO `add_members` (`id`, `firstname`, `lastname`, `email`, `teams_id`) VALUES
(28, '[\"sam\",\"dam\",\"we\",\"ooo\"]', '[\"samy\",\"ao\",\"ew\",\"pp\"]', '[\"same@gmail.com\",\"ao@gmail.com\",\"ew@gmail.com\",\"pp@gmail.com\"]', 53),
(29, '[\"gfvcbhncv\"]', '[\"cvbcvb\"]', '[\"cvbcv@gmail.com\"]', 32),
(30, '[\"bvnbv\"]', '[\"sdf\"]', '[\"fgf@gmail.com\"]', 65),
(31, '[\"bvnbv\"]', '[\"sdf\"]', '[\"fgf@gmail.com\"]', 66),
(32, '[\"paras\"]', '[\"erasfc\"]', '[\"sd@gmail.com\"]', 67),
(33, '[\"fg\"]', '[\"fgh\"]', '[\"gfh@gmail.com\"]', 68);

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `user_role` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `name`, `password`, `remember_token`, `user_role`, `created_at`, `updated_at`) VALUES
(1, 'fullstackdeveloper918@gmail.com', 'Full Stackdeveloper', '$2y$10$ekYuwDDiYZef5wr3AbPIlusRXUT58K5mx.U8zhASbPgoGP2/OU28u', 'T0op88MjE6Jfnt7BThxYzK5Grti7hmMtB6BwdxvMs21TJYwRbg18Cz3I5RDa', 1, '2018-03-21 00:14:50', '2018-03-21 00:14:50');

-- --------------------------------------------------------

--
-- Table structure for table `crawls`
--

CREATE TABLE `crawls` (
  `id` int(11) NOT NULL,
  `trip_url` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `crawls`
--

INSERT INTO `crawls` (`id`, `trip_url`, `phone`, `email`, `business_name`) VALUES
(1, 'https://activewealthshow.com/', '45345345', 'mailto:Ford@activewealth.com', NULL),
(2, 'https://www.agiratech.com', 'tel:+914443574451', 'mailto:info@agiratech.com', NULL),
(3, 'https://dzone.com/', 'tel:+19196780300', 'mailto:support@dzone.com', NULL),
(4, 'http://www.jackmorton.com', 'tel:+49021149554501', 'mailto:experience@jackmorton.com', NULL),
(5, 'https://www.tripadvisor.in/Tourism-g33252-West_Hollywood_California-Vacations.html', 'tel:+1 310-289-1630', NULL, NULL),
(6, 'https://www.tripadvisor.in/Restaurant_Review-g60713-d353960-Reviews-Hog_Island_Oyster_Company-San_Francisco_California.html#', 'tel:+1 415-391-7117', NULL, NULL),
(7, 'https://www.tripadvisor.in/Tourism-g190454-Vienna-Vacations.html', 'tel:+43 1 7125310', 'mailto:reservierung@gmoakeller.at', 'Gmoakeller'),
(8, 'https://www.tripadvisor.in/Restaurant_Review-g32532-d14172450-Reviews-The_Original_Grilled_Cheese_Truck-Isla_Vista_California.html', 'tel:+1 805-845-0566', NULL, NULL),
(9, 'https://www.tripadvisor.in/Restaurant_Review-g32438-d7967017-Reviews-Woody_s_Bbq-Goleta_California.html', 'tel:+1 805-681-3520', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(2307, 'default', '{\"displayName\":\"App\\\\Jobs\\\\SendEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendEmailJob\",\"command\":\"O:21:\\\"App\\\\Jobs\\\\SendEmailJob\\\":7:{s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";O:13:\\\"Carbon\\\\Carbon\\\":3:{s:4:\\\"date\\\";s:26:\\\"2019-09-16 11:12:27.203937\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:3:\\\"UTC\\\";}s:7:\\\"chained\\\";a:0:{}}\"}}', 255, NULL, 1568632350, 1568632350);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 2),
(3, '2019_09_16_095023_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', '', '2018-03-22 05:24:37', '2018-03-22 05:24:39');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `id` int(11) NOT NULL,
  `sponsor_name` varchar(255) DEFAULT NULL,
  `category` varchar(55) DEFAULT NULL,
  `yelp_website` varchar(255) DEFAULT NULL,
  `yelp_address` varchar(255) DEFAULT NULL,
  `trip_advisor_email` varchar(55) DEFAULT NULL,
  `yellow_pages_email` varchar(55) DEFAULT NULL,
  `website_email` varchar(55) DEFAULT NULL,
  `whoIs_email` varchar(55) DEFAULT NULL,
  `manually_email` varchar(55) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `unsubscribe_date` date DEFAULT NULL,
  `sponsorship_tier` varchar(55) DEFAULT NULL,
  `sponsorship_amount` float DEFAULT NULL,
  `sponsorship_date` date DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`id`, `sponsor_name`, `category`, `yelp_website`, `yelp_address`, `trip_advisor_email`, `yellow_pages_email`, `website_email`, `whoIs_email`, `manually_email`, `team_id`, `unsubscribe_date`, `sponsorship_tier`, `sponsorship_amount`, `sponsorship_date`, `updated_at`, `created_at`, `lat`, `lng`) VALUES
(1, 'rrrrr', 'dfhdfh', 'dfghdfhdfh.com', '67,gfhjgf', 'kavita.auspicioussoft@gmail.com', NULL, 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 67, '2019-08-08', 'rtrtr', 10000, '2019-08-06', '2019-09-16 06:11:39', '2019-08-07 08:12:23', NULL, NULL),
(2, 'upuponesix', 'xcvxcv', 'cvxcv', '1212', 'kavita.auspicioussoft@gmail.com', NULL, 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 34, '2019-08-23', 'platinum', 10000, '2019-08-01', '2019-09-16 06:12:42', '2019-08-08 23:54:45', NULL, NULL),
(3, 'jai', 'ja', 'ja.com', 'mohali', 'kavita.auspicioussoft@gmail.com', NULL, 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 23, '2019-08-08', 'gold', 1000, '2019-08-10', '2019-08-09 00:46:56', '2019-08-09 00:46:56', '30.7046486', '76.71787259999999'),
(4, 'jatin', 'jat', 'dfghdfhdfh.com', 'delhi', 'jatin@gmail.com', NULL, 'jatin@gmail.com', 'jatin@gmail.com', 'vikashverma003@gmail.com', 23, '2019-08-08', 'gold', 10000, '2019-08-10', '2019-08-09 01:36:10', '2019-08-09 01:36:10', '28.7040592', '77.10249019999999'),
(5, 'sharavan', 'share', 'dfghdfhdfh.com', 'mumbai', 'kavita.auspicioussoft@gmail.com', NULL, 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 'vikashverma003@gmail.com', 23, '2019-08-10', '12', 20000, '2019-08-09', '2019-08-09 01:43:43', '2019-08-09 01:43:43', '19.0759837', '72.8776559'),
(6, 'Hot Millions', 'sdgfds', 'sdfdsf', 'SCF 60 & 61, Phase 3 B2, Mohali', 'kavita.auspicioussoft@gmail.com', NULL, 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 'kavita.auspicioussoft@gmail.com', 34, '2019-08-09', '23', 122332, '2019-08-09', '2019-08-09 07:06:33', '2019-08-09 07:06:33', '27.4378838', '-82.58968469999999'),
(7, 'sfdkjsa', 'xcvx', 'xcv.com', '11232, Mohali', 'hbnjh@gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-10', '34343', 1111, '2019-09-25', '2019-09-05 01:47:06', '2019-09-05 01:47:06', NULL, NULL),
(8, 'sfdkjsa', 'xcvx', 'xcv.com', '11232, Mohali', 'vikas.auspicioussoft@gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-10', '34343', 1111, '2019-09-25', '2019-09-05 01:48:31', '2019-09-05 01:48:31', NULL, NULL),
(9, 'sssss', 'xcvx', 'xcv.com', '11232,', 'vikas.auspicioussoft@gmail.com', NULL, 'fjn@gmail.com', 'vbv@gmail.com', 'vbv@gmail.com', 45, '2019-09-10', '34343', 1111, '2019-09-25', '2019-09-05 05:38:06', '2019-09-05 01:48:47', NULL, NULL),
(10, 'fh', 'h', 'fgh', 'gh', 'vikas.auspicioussoft@gmail.com', NULL, 'dsf@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-20', '34343', 1111, '2019-09-23', '2019-09-05 01:50:33', '2019-09-05 01:50:33', NULL, NULL),
(11, 'fh', 'h', 'fgh', 'gh', 'vikas.auspicioussoft@gmail.com', NULL, 'dsf@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-20', '34343', 1111, '2019-09-23', '2019-09-05 01:51:18', '2019-09-05 01:51:18', NULL, NULL),
(12, 'fh', 'h', 'fgh', 'gh', 'vikas.auspicioussoft@gmail.com', NULL, 'dsf@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-20', '34343', 1111, '2019-09-23', '2019-09-05 01:51:58', '2019-09-05 01:51:58', NULL, NULL),
(13, 'fh', 'h', 'fgh', 'gh', 'vikas.auspicioussoft@gmail.com', NULL, 'dsf@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-20', '34343', 1111, '2019-09-23', '2019-09-05 01:52:03', '2019-09-05 01:52:03', NULL, NULL),
(14, 'gfhfg', 'gfhgf', 'gfhgfhgf', 'gfh', 'vikas.auspicioussoft@gmail.com', NULL, 'gfhgf', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-03', '454', 45454, '2019-09-17', '2019-09-05 02:06:57', '2019-09-05 02:06:57', NULL, NULL),
(15, 'gfhfg', 'gfhgf', 'gfhgfhgf', 'gfh', 'vikas.auspicioussoft@gmail.com', NULL, 'gfhgf', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-03', '454', 45454, '2019-09-17', '2019-09-05 02:08:24', '2019-09-05 02:08:24', NULL, NULL),
(16, 'gfhfg', 'gfhgf', 'gfhgfhgf', 'gfh', 'vikas.auspicioussoft@gmail.com', NULL, 'gfhgf', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-03', '454', 45454, '2019-09-17', '2019-09-05 02:08:55', '2019-09-05 02:08:55', NULL, NULL),
(18, 'bvnbv', 'xcv', 'xcv.com', '11232, Mohali', 'vikas.auspicioussoft@gmail.com', NULL, 'dsf@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-05', '34343', 4545, '2019-09-25', '2019-09-05 02:42:14', '2019-09-05 02:42:14', NULL, NULL),
(19, 'dfgdsg', 'dgdgf', 'fdf.com', '11232, Mohali', 'vikas.auspicioussoft@gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-19', '34343', 4545, '2019-09-23', '2019-09-05 02:47:17', '2019-09-05 02:47:17', NULL, NULL),
(20, 'dfgdsg', 'dgdgf', 'fdf.com', '11232, Mohali', 'vikas.auspicioussoft@gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-19', '34343', 4545, '2019-09-23', '2019-09-05 02:51:45', '2019-09-05 02:51:45', NULL, NULL),
(21, 'dfgdsg', 'dgdgf', 'fdf.com', '11232, Mohali', 'vikas.auspicioussoft@gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-19', '34343', 4545, '2019-09-23', '2019-09-05 02:53:06', '2019-09-05 02:53:06', NULL, NULL),
(22, 'sfdkjsa', 'hjghj', 'xcv.com', '11232, Mohali', 'vikas.auspicioussoft@gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 67, '2019-09-12', '5555', 67676, '2019-09-10', '2019-09-05 02:54:15', '2019-09-05 02:54:15', NULL, NULL),
(23, 'sfdkjsa', 'hjghj', 'xcv.com', '11232, Mohali', 'vikas.auspicioussoft@gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 67, '2019-09-12', '5555', 67676, '2019-09-10', '2019-09-05 02:54:32', '2019-09-05 02:54:32', NULL, NULL),
(28, 'sapn', 'spany', 'sapny.com', '1211, 3b3, Mohali', 'sdnf@gmail.com', NULL, 'vn@gmail.com', 'f@gmail.com', 'vbv@gmail.com', 78, '2019-09-06', '77', 56565, '2019-09-06', '2019-09-05 06:23:09', '2019-09-05 06:23:09', NULL, NULL),
(29, 'sfdkjsadsgf', 'sdf', 'xcv.com', '11232, Mohali', 'vikas.auspicioussoft@gmail.com', NULL, 'vn@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 34, '2019-09-06', '34343', 34343, '2019-09-25', '2019-09-05 07:10:57', '2019-09-05 07:10:57', NULL, NULL),
(30, 'sam', 'hjghj', 'xcv.com', '11232,', 'vikas.auspicioussoft@gmail.com', NULL, 'vbv@gmail.com', 'vbv@gmail.com', 'vbv@gmail.com', 100, '2019-09-25', '77', 45454, '2019-09-24', '2019-09-16 07:28:49', '2019-09-05 08:16:28', NULL, NULL),
(31, 'pepsi', 'shipping', 'pepsi.co.in', 'sanasfree', 'asd.gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 34, '2019-09-06', '34343', 23232, '2019-09-17', '2019-09-05 08:23:06', '2019-09-05 08:23:06', NULL, NULL),
(32, 'pepsi', 'shipping', 'pepsi.co.in', 'sanasfree', 'asd.gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 34, '2019-09-06', '34343', 23232, '2019-09-17', '2019-09-05 08:23:29', '2019-09-05 08:23:29', NULL, NULL),
(33, 'pepsi', 'shipping', 'pepsi.co.in', 'sanasfree', 'asd.gmail.com', NULL, 'fnvg@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 34, '2019-09-06', '34343', 23232, '2019-09-17', '2019-09-05 08:24:28', '2019-09-05 08:24:28', NULL, NULL),
(34, 'pepsi', 'shipping', 'xcv.com', '11232, Mohali', 'asd.gmail.com', NULL, 'vn@gmail.com', 'f@gmail.com', 'vbv@gmail.com', 56, '2019-09-23', '454', 34343, '2019-09-16', '2019-09-05 08:27:44', '2019-09-05 08:27:44', NULL, NULL),
(35, 'pepsi12', 'shipping', 'xcv.com', 'austria', 'asd.gmail.com', NULL, 'test12@gmail.com', 'fjn@gmail.com', 'vbv@gmail.com', 45, '2019-09-05', '77', 45454, '2019-09-05', '2019-09-05 09:18:36', '2019-09-05 09:18:36', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_package`
--

CREATE TABLE `sponsor_package` (
  `id` int(11) NOT NULL,
  `participants` varchar(255) DEFAULT NULL,
  `diamond` varchar(255) NOT NULL,
  `platinum` varchar(255) NOT NULL,
  `gold` varchar(255) NOT NULL,
  `silver` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsor_package`
--

INSERT INTO `sponsor_package` (`id`, `participants`, `diamond`, `platinum`, `gold`, `silver`) VALUES
(1, '0-150', '$1000', '$751', '$250', '$50'),
(2, '151-500', '$1500', '$1000', '$500', '$50'),
(5, '501-1000', '$2000', '$1000', '$500', '$50'),
(6, '1000-5000', '$3000', '$2000', '$1000', '$50'),
(7, '5000-15000', '$5000', '$2500', '$1000', '$75'),
(8, '15001 or more', '$10,000', '$5000', '$2000', '$100');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_package_option`
--

CREATE TABLE `sponsor_package_option` (
  `id` int(11) NOT NULL,
  `sponsorpackage_id` varchar(255) DEFAULT NULL,
  `tier_name` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sponsor_amount` varchar(255) DEFAULT NULL,
  `slot_available` int(25) DEFAULT NULL,
  `Total` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsor_package_option`
--

INSERT INTO `sponsor_package_option` (`id`, `sponsorpackage_id`, `tier_name`, `active`, `description`, `sponsor_amount`, `slot_available`, `Total`) VALUES
(1, '1', 'diamond', 'yes', 'somee', '1000', 100, '10,0000'),
(2, '1', 'platinum', 'yes', 'some', '500', 150, '650'),
(3, '1', 'gold', 'yes', 'someeee', '4000', 10, '40000'),
(4, '1', 'silver', 'yes', 'some', '100', 100, '10000');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor_payment`
--

CREATE TABLE `sponsor_payment` (
  `id` int(11) NOT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiry_month` varchar(255) DEFAULT NULL,
  `expiry_year` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `team_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsor_payment`
--

INSERT INTO `sponsor_payment` (`id`, `card_number`, `cvv`, `expiry_month`, `expiry_year`, `amount`, `email`, `business_name`, `team_id`) VALUES
(27, '4012888888881881', 'eyJpdiI6InpJTk0yVE9FemVlNWFGUXJaMnd6cEE9PSIsInZhbHVlIjoiQWw1bitRT1ZvNm9cL285aFhLUUJDVkE9PSIsIm1hYyI6ImFmNTE1MjlkZjE3MmY2YTJhNjQyNzFjZTM4YjhkZDM5NWM0N2NmN2I5M2Q5ODkxODBhMTMzMjMxOTg0MmE3NzUifQ==', 'eyJpdiI6InJZMkN0REJwRDh3R0lIUk92Y1pZXC9nPT0iLCJ2YWx1ZSI6IlpkcWZ3WXZRMlZQdVBmK1FmejdiZEE9PSIsIm1hYyI6IjY2OTM2ZWVmMTZlZGRjNzU4OTRkZDlmZWJjNDM2NDg0NmI3M2JkOGI3Y2M5OGYwMzgwOWFmN2E3NGFkMTdlZTMifQ==', 'eyJpdiI6IkJJMGFTRVZcL3VudWJObWlvR1pQY0dBPT0iLCJ2YWx1ZSI6ImFJNWtMaEQwY2RWOEpiZWFPaHZURnc9PSIsIm1hYyI6ImI5ZjY5NTI4Mzk4MjU4NDA0MDc3NzY4YjQ1YjBlMDI0YjMzZDk5YzU0NjM1OTMxZDU2MTYyYWRjZDM2M2QyYjUifQ==', '4545', NULL, 'Nina\'s Cafe', '147'),
(28, '4012888888881881', 'eyJpdiI6Im95RWxMZWl2a0xTVkFBMDVEeDEzQWc9PSIsInZhbHVlIjoidzFMdzZKdG05Wk9iaVM5czNkRjRadz09IiwibWFjIjoiZDVlYTExNjRiNTdkNThjZTcwMWFhYjA2NGY2NDkyNjNjZWExY2I2MmJlMmE2OGQxZTVlNGRhNzA0ZmFkODNiZiJ9', 'eyJpdiI6ImhrbkF2ckxRSUQxUkFibXc0VFdUZ0E9PSIsInZhbHVlIjoiVUQ4MHBxTTBRVEJSdllZUXlZSVl6QT09IiwibWFjIjoiOTkwY2E1NDZhZDM3YWQ4OWQxZjQzZmY4MGE3YjA0OTI0MWQ3MTA4M2NlNTMxNzZmYTYxMTAyODhmMTE2MTAyYyJ9', 'eyJpdiI6ImU0QzhHbE9JZjZDVmVkaHlUaVhQTGc9PSIsInZhbHVlIjoiZDdBWXFod252QTNkZ1NtUU5XcDMwdz09IiwibWFjIjoiZWMyODRmMjY1ZGE4YjY5YzU4Y2MzNTQ1ZmJhMmRmYjlhODFhN2RlNGJkODRiYTY0NjNiODYyODFhMThiOTgxZSJ9', '6767', NULL, 'California Science Center', '147'),
(29, '4012888888881881', 'eyJpdiI6InVcLzZuN0o3RGZcL1duVEhNY211MGpiQT09IiwidmFsdWUiOiJwV25NOTRKUUFaY2xGNGxtXC9UZjlnQT09IiwibWFjIjoiYzlhZjM3ZTliNmE3OWY5NTBhMGVkNWQzMWY3YWRjN2MxMjE0ODdkZDZjNzAzNDllYzcwMmU3Mjg0OGQwMDI5OSJ9', 'eyJpdiI6IlJVWHVrcSt3NnNuSk9Ha09icVhjWkE9PSIsInZhbHVlIjoiSXJHXC9mNHhVMHVEd0tGNmVRV0VBUVE9PSIsIm1hYyI6IjA1ZmVkMDE5MjAwMjk5MDNhMDg0MWUxYTc5YTkwNjYwZDNlMzE2NDY0OGI2NTZjNmYyNWQ4NDJiYzA3NzA5NjAifQ==', 'eyJpdiI6IlFtUTB5Z25EUWhyYmNBcE1IOExWS2c9PSIsInZhbHVlIjoiK0NHR1VzY2lvS1wvTHdNcDNoczhDQ1E9PSIsIm1hYyI6IjRhMGNmODRiNWYzYmY4M2RkMjdiYTFhYzI1MGE1NjljM2U5NjIxMmNlY2VlMmJhNDliZDhiYTVjODBjNzVhMzcifQ==', '3434', NULL, 'Hot Millions', '34'),
(30, '4012888888881881', 'eyJpdiI6IkptM0lyM3NSbGx0U0Exd0syOUxzYWc9PSIsInZhbHVlIjoiYXZyUlRVSkxWdUVrcEMzRm5tRklNZz09IiwibWFjIjoiNzA3N2JjZWI3YzU4ZTUwY2RiMDUxYzc3ZWZmODI1ODdmMGYzZTg2OTc5ZDBhOGEwOWIzZmNiN2FkMmQyNDc4NiJ9', 'eyJpdiI6ImFmVldVa1U4bDdkZENURExwUWpTRlE9PSIsInZhbHVlIjoiYzdRUThkTkllSlBDYTk1VVFrVzJHQT09IiwibWFjIjoiZWU0Y2Y0NTU5OWU3YmM1OTYyZjM1YzA0M2E2M2JiYjA5Mjc4N2Q1NWNkZTVmMDIxMDI1OWFkYTk3MDQwZGRiZSJ9', 'eyJpdiI6Ik9QRnd6ZnFlbDdzMFRlRkpiSGhscUE9PSIsInZhbHVlIjoiSkc5Zm43QlpoazE0Nm0yMWVJQ2NiUT09IiwibWFjIjoiOTM3ZTEzYzUwNWVmNmFlM2ZlMDRhMjgxMmJlM2FjMTkwNjMyNzliZjM1MTliNmFiYjkyOGY3ZDA1ZDcxNGU4ZCJ9', '2222', NULL, 'sam', '100');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `grouptype` varchar(255) DEFAULT NULL,
  `main_activity` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `mail_add_groupname` varchar(255) DEFAULT NULL,
  `website_fb_page` varchar(255) DEFAULT NULL,
  `member_participants` int(11) DEFAULT NULL,
  `tc` varchar(55) DEFAULT '0',
  `other_member` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `group_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `plan_name` varchar(255) DEFAULT NULL,
  `other_main_activity` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `grouptype`, `main_activity`, `first_name`, `last_name`, `title`, `email`, `phone`, `mail_add_groupname`, `website_fb_page`, `member_participants`, `tc`, `other_member`, `updated_at`, `created_at`, `group_name`, `address`, `plan_name`, `other_main_activity`) VALUES
(1, 'One team', 'Test', 'kavita', NULL, NULL, 'kavita.auspicioussoft@gmail.com', '1232664', 'kavita.auspicioussoft@gmail.com', NULL, 12, '0', NULL, '2019-09-06 01:03:33', '2019-08-06 00:08:31', 'kkkkkkkh', '90002', NULL, NULL),
(19, 'Entire travel club', 'jghjg', 'ghjgh', 'ghjghj', 'ghjghjghj', 'ghj@gmail.com', '567567567', 'hj@gmail.com', 'ghm.com', 45, '0', NULL, '2019-09-05 04:46:45', '2019-08-07 06:34:12', 'ghjgh', '90001', NULL, NULL),
(5, 'League', 'fgf', 'kavita', 'kk', 'fgf', 'kavita.auspicioussoft@gmail.com', '1232664', 'dfgdf@gmail.com', 'abc.com', 7, '0', NULL, '2019-08-06 04:12:59', '2019-08-06 04:12:59', 'gfg', '90003', NULL, NULL),
(17, 'Entire travel club', 'bnmnb', 'bnmbn', 'bnmbn', 'bnmbnm', 'kavita.auspicioussoft@gmail.com', '879789789', 'dfgdf@gmail.com', 'vbvcb.com', 80, '0', NULL, '2019-08-07 05:15:17', '2019-08-07 05:15:17', 'bnmbnmbn', '90001', NULL, NULL),
(7, 'Entire school athletic department', 'vcbcv', 'kavita', 'kk', 'vcbcv', 'kavita.auspicioussoft@gmail.com', '1232664', 'dfgdf@gmail.com', 'cvbcvb', 5, '0', NULL, '2019-08-06 04:16:07', '2019-08-06 04:16:07', 'dsfdsf', '90002', NULL, NULL),
(8, 'School band', 'playing', 'kavita', 'kk', 'aasa', 'kavita.auspicioussoft@gmail.com', '1232664', 'asa@gmail.com', 'wewewe', 23, '0', NULL, '2019-08-06 04:17:54', '2019-08-06 04:17:54', 'avbvb', '90003', NULL, NULL),
(9, 'School band', 'fgfgf', 'kavita', 'kk', 'ttt', 'kavita.auspicioussoft@gmail.com', '1232664', 'dfgdf@gmail.com', 'tty.com', 45, '0', NULL, '2019-08-06 04:19:34', '2019-08-06 04:19:34', 'jack', '90001', NULL, NULL),
(10, 'School band', 'baseball', 'kavita', 'kk', 'tyut', 'kavita.auspicioussoft@gmail.com', '1232664', 'asa@gmail.com', 'tty.com', 7, '0', NULL, '2019-08-06 04:20:51', '2019-08-06 04:20:51', 'jilj', '90003', NULL, NULL),
(11, 'League', 'edtgfdr', 'kavita', 'kk', 'kjbhib', 'kavita.auspicioussoft@gmail.com', '1232664', 'asa@gmail.com', 'kjbnk.com', 8, '0', NULL, '2019-08-06 04:22:19', '2019-08-06 04:22:19', 'tablet', '90005', NULL, NULL),
(12, 'League', 'sd', 'kavita', 'kk', 'sdsd', 'kavita.auspicioussoft@gmail.com', '1232664', 'hj@gmail.com', 'ds', 5, '0', NULL, '2019-08-06 04:31:06', '2019-08-06 04:31:06', 'sdasdsa', '90006', NULL, NULL),
(13, 'League', 'sd', 'kavita', 'kk', 'sdsd', 'kavita.auspicioussoft@gmail.com', '1232664', 'hj@gmail.com', 'ds', 5, '0', NULL, '2019-08-06 04:31:30', '2019-08-06 04:31:30', 'sdasdsa', '90001', NULL, NULL),
(14, 'League', 'xcv', 'kavita', 'kk', 'xcvxc', 'kavita.auspicioussoft@gmail.com', '1232664', 'hj@gmail.com', 'xcvxcv', 5, '0', NULL, '2019-08-06 04:32:59', '2019-08-06 04:32:59', 'xcvxc', '90002', NULL, NULL),
(15, 'League', 'baseball', 'kavita', 'kk', 'Paul', 'kavita.auspicioussoft@gmail.com', '1232664', 'asa@gmail.com', 'abc.com', 99, '0', NULL, '2019-08-06 05:09:07', '2019-08-06 05:09:07', 'alan', '90003', NULL, NULL),
(16, 'Entire school athletic department', 'cricket', 'gambling', 'gambler', 'Lesly', 'gambler@gmail.com', '5467456546', 'dfgdf@gmail.com', 'fgfdgabc.com', 23, '0', NULL, '2019-08-06 05:22:38', '2019-08-06 05:22:38', 'gambler', '90005', NULL, NULL),
(108, 'Entire school athletic department', 'cvbcvb', 'cvb', 'cvb', NULL, 'cvb@gmail.com', '456546546', 'cv@gmail.com', 'gfh.fb.com', 666, '0', NULL, '2019-09-12 05:17:38', '2019-09-12 05:17:38', 'cfgb', '90011', 'platinum', 'bnm'),
(107, 'Entire school athletic department', 'dsgfsd', 'vikas', 'dfg', NULL, 's@gmail.com', '4545454', 'dfg@gmail.com', 'dfg.fb.com', 678, '0', NULL, '2019-09-12 05:16:12', '2019-09-12 05:16:12', 'sdgds', '900011', 'platinum', 'dfgh'),
(106, 'Entire school athletic department', 'dsgfsd', 'vikas', 'dfg', NULL, 's@gmail.com', '4545454', 'dfg@gmail.com', 'dfg.fb.com', 678, '0', NULL, '2019-09-12 05:11:00', '2019-09-12 05:11:00', 'sdgds', '900011', 'platinum', 'dfgh'),
(105, 'Entire school athletic department', 'dsgfsd', 'vikas', 'dfg', NULL, 's@gmail.com', '4545454', 'dfg@gmail.com', 'dfg.fb.com', 678, '0', NULL, '2019-09-12 05:09:12', '2019-09-12 05:09:12', 'sdgds', '900011', 'platinum', 'dfgh'),
(104, 'Entire school athletic department', 'playing', 'vikas', 'dsgf', NULL, 'x@gmail.com', '343434', 's@gmail.com', 'dgf.fb.com', 676, '0', NULL, '2019-09-12 05:07:10', '2019-09-12 05:07:10', 'vbn', '90001', 'platinum', 'fbvgn'),
(103, 'Entire travel club', 'dsfds', 'dfsg', 'dfg', NULL, 'ds@gmail.com', '7007526684', 'dfg@gmail.com', 'dasf.fb.com', 678, '0', NULL, '2019-09-12 04:55:07', '2019-09-12 04:55:07', 'dsf', '90001', 'platinum', 'dsf'),
(102, 'Entire school athletic department', 'dfg', 'ds', 'dsf', NULL, 'df@gmail.com', '343434343', 'sdf@gmail.com', 'cvb.fb.com', 678, '0', NULL, '2019-09-12 04:51:12', '2019-09-12 04:51:12', 'dfg', '90011', 'gold', 'fdgdf'),
(101, 'Entire school athletic department', 'playing', 'dsfds', 'sdfds', NULL, 'sd@gmail.com', '345', 'dsf@gmail.com', 'df.fb.com', 345, '0', NULL, '2019-09-12 04:48:41', '2019-09-12 04:48:41', 'dsfds', '90008', 'diamond', 'dsfds'),
(100, 'Entire travel club', 'fgh', 'cvgb', 'cvb', NULL, 'fgh@gmail.com', '34534534', 'vbc@gmail.com', 'fdgb.fb.com', 234, '0', NULL, '2019-09-12 04:34:31', '2019-09-12 04:34:31', 'fghgf', '90001', 'gold', 'fgh'),
(99, 'Entire travel club', 'fgh', 'cvgb', 'cvb', NULL, 'fgh@gmail.com', '34534534', 'vbc@gmail.com', 'fdgb.fb.com', 234, '0', NULL, '2019-09-12 04:34:08', '2019-09-12 04:34:08', 'fghgf', '90001', 'gold', 'fgh'),
(31, 'Entire travel club', 'baseball', 'kavita', 'kavita', NULL, 'kavita.auspicioussoft@gmail.com', '466464', 'kavita.auspicioussoft@gmail.com', 'kavita.fb.com', 24, '0', NULL, '2019-08-11 23:25:51', '2019-08-11 23:25:51', 'auspicioussoft', '90006', 'platinum', 'baseball'),
(32, 'Entire travel club', 'cricket', 'tyrty', 'rtyrty', NULL, 'asdf@gmail.com', '14353453', 'tyrt@gmail.com', 'dfgdfg.fb.com', 34, '0', NULL, '2019-08-21 23:18:48', '2019-08-21 23:18:48', 'dsnkj', 'Mohali', 'gold', 'playing'),
(33, 'League', 'cricket', 'gfhjgfh', 'gfhfgh', NULL, 'sd@gmail.com', '23432423423', 'gfhgf@gmail.com', 'dfgdfg.fb.facebook', 23, '0', NULL, '2019-08-22 00:10:44', '2019-08-22 00:10:44', 'abch', 'london', 'platinum', 'playing'),
(34, 'League', 'cvbcv', 'gfhgf', 'gfhgf', NULL, 'kavita.auspicioussoft@gmail.com', '1232664', 'kavita.auspicioussoft@gmail.com', 'gfhgf.fb.com', 45, '0', NULL, '2019-08-23 00:00:15', '2019-08-23 00:00:15', 'cvbcv', '454, Mohali', 'platinum', 'cfbxcvb'),
(35, 'School band', 'dsfds', 'ghjgh', 'hjgh', NULL, 'kavita.auspicioussoft@gmail.com', '1232664', 'kavita.auspicioussoft@gmail.com', 'ghjgh.fb.com', 45, '0', NULL, '2019-08-23 00:02:16', '2019-08-23 00:02:16', 'gfhgf', '1212, Mohali', 'platinum', 'ghgfh'),
(36, 'Entire travel club', 'gfhgfh', 'bvnbvn', 'bvnbvn', NULL, 'kavita.auspicioussoft@gmail.com', '1232664', 'kavita.auspicioussoft@gmail.com', 'bhnmbn.fb.com', 34, '0', NULL, '2019-08-23 00:04:39', '2019-08-23 00:04:39', 'gfhgfhgf', 'Brazil', 'platinum', 'gfhgf'),
(37, 'Entire school athletic department', 'edtgfdr', 'fgdf', 'dfgdf', NULL, 'kavita.auspicioussoft@gmail.com', '1232664', 'kavita.auspicioussoft@gmail.com', 'fdgdf.fb.com', 500, '0', NULL, '2019-08-23 00:25:31', '2019-08-23 00:25:31', 'ddsgfds', 'Austria', 'gold', 'dgfdsgds'),
(38, 'Entire school athletic department', 'playing', 'bcvnbvn', 'bvnbvnbv', NULL, 'kavita.auspicioussoft@gmail.com', '75675676', 'bvn@gmail.com', 'ghjg.fb.com', 600, '0', NULL, '2019-08-23 01:26:43', '2019-08-23 01:26:43', 'agh', 'Germany', 'platinum', 'cricket'),
(39, 'Entire travel club', 'cricket', 'bvn', 'bbg', NULL, 'dfsf@gmail.com', '2323232', 'gh@gmail.com', 'sdfds.fb.com', 34, '0', NULL, '2019-08-27 04:28:29', '2019-08-27 04:28:29', 'dfgdf', 'Malaysia', 'platinum', 'playing'),
(40, 'Entire travel club', 'cricket', 'bvn', 'bbg', NULL, 'dfsf@gmail.com', '2323232', 'gh@gmail.com', 'sdfds.fb.com', 34, '0', NULL, '2019-08-27 05:21:29', '2019-08-27 05:21:29', 'dfgdf', 'Malaysia', 'platinum', 'playing'),
(41, 'Entire travel club', 'cricket', 'bvn', 'bbg', NULL, 'dfsf@gmail.com', '2323232', 'gh@gmail.com', 'sdfds.fb.com', 34, '0', NULL, '2019-08-27 05:21:53', '2019-08-27 05:21:53', 'dfgdf', 'Malaysia', 'platinum', 'playing'),
(42, 'Entire travel club', 'cricket', 'bvn', 'bbg', NULL, 'dfsf@gmail.com', '2323232', 'gh@gmail.com', 'sdfds.fb.com', 34, '0', NULL, '2019-08-27 05:22:52', '2019-08-27 05:22:52', 'dfgdf', 'Malaysia', 'platinum', 'playing'),
(114, 'Entire school athletic department', 'dsgfdfgdf', 'fgdfg', 'dfg', NULL, 'df@gmail.com', '4545445', 'fullstackdeveloper918@yopmail.com', 'dfg.fb.com', 343, '0', NULL, '2019-09-12 08:21:09', '2019-09-12 08:21:09', 'bvnbvn', '90001', 'diamond', 'gfhgfh'),
(113, 'Entire school athletic department', 'dfg', 'vb', 'cvb', NULL, 'df@gmail.com', '345345', 'cv@gmail.com', 'dfg.fb.com', 343, '0', NULL, '2019-09-12 07:13:24', '2019-09-12 07:13:24', 'gfhgf', '90001', 'platinum', 'fvgh'),
(112, 'School band', 'dfgbcv', 'dsf', 'sdf', NULL, 'cv@gmail.com', '3434343', 'ds@gmail.com', 'dfv.fb.com', 345, '0', NULL, '2019-09-12 06:58:14', '2019-09-12 06:58:14', 'dfgfd', '90001', 'platinum', 'fgdfg'),
(111, 'School band', 'dfgbcv', 'dsf', 'sdf', NULL, 'cv@gmail.com', '3434343', 'ds@gmail.com', 'dfv.fb.com', 345, '0', NULL, '2019-09-12 06:55:57', '2019-09-12 06:55:57', 'dfgfd', '90001', 'platinum', 'fgdfg'),
(109, 'Entire travel club', 'playing', 'gfv', 'gfh', NULL, 'sd@gmail.com', '4356345345', 'h@gmail.com', 'df.fb.com', 454, '0', NULL, '2019-09-12 05:29:30', '2019-09-12 05:29:30', 'dsf', '90015', 'platinum', 'edrfsd'),
(110, 'Entire travel club', 'gfhgf', 'dfg', 'dfg', NULL, 'gfh@gmail.com', '465465', 'df@gmail.com', 'gfh.fb.com', 345, '0', NULL, '2019-09-12 06:49:43', '2019-09-12 06:49:43', 'fgh', '90001', 'platinum', 'fdh'),
(52, 'School band', 'cricket', 'xcv', 'v', NULL, 'dfxg@gmail.com', '34534', 'fullstackdeveloper918@gmail.com', 'dfcgvxcv.fb.com', 34, '0', NULL, '2019-08-27 08:22:06', '2019-08-27 08:22:06', 'xcbvxcv', 'Brazil', 'platinum', 'xfgvbxc'),
(53, 'Entire school athletic department', 'playing', 'vikas', 'fdgdf', NULL, 'df@gmail.com', '2322323', 'fd@gmail.com', 'dsfds.fb.com', 34, '0', NULL, '2019-08-30 00:05:43', '2019-08-30 00:05:43', 'cricket', 'Belgium', 'diamond', 'dsfds'),
(54, 'League', 'ghkg', 'ytr', 'fjf', NULL, 'ghk@gmail.com', '768678', 'fullstackdeveloper918@gmail.com', 'fjgf.fb.com', 56, '0', NULL, '2019-09-03 02:08:46', '2019-09-03 02:08:46', 'gkg', 'Los Angeles', 'platinum', 'gkukg'),
(55, 'League', 'ghkg', 'ytr', 'fjf', NULL, 'ghk@gmail.com', '768678', 'fullstackdeveloper918@gmail.com', 'fjgf.fb.com', 56, '0', NULL, '2019-09-03 02:10:04', '2019-09-03 02:10:04', 'gkg', 'Los Angeles', 'platinum', 'gkukg'),
(93, 'Entire travel club', 'bnm', 'vikas', 'cvfb', NULL, 'df@gmail.com', '345345', 'cvb@gmail.com', 'cvb.fb.com', 23, '0', NULL, '2019-09-09 08:37:57', '2019-09-09 08:37:57', 'kkkkkkk', 'chile', 'platinum', 'bnmbn'),
(87, 'Entire school athletic department', 'xcv', 'cbv', 'xcb', NULL, 'xcv@gmail.com', '34343', 'xcb@gmail.com', 'dfg.fb.com', 45, '0', NULL, '2019-09-06 04:24:12', '2019-09-06 04:24:12', 'xcv', 'poland', 'diamond', 'xcbvxc'),
(88, 'Entire school athletic department', 'xcv', 'cbv', 'xcb', NULL, 'xcv@gmail.com', '34343', 'xcb@gmail.com', 'dfg.fb.com', 45, '0', NULL, '2019-09-06 04:25:27', '2019-09-06 04:25:27', 'xcv', 'poland', 'diamond', 'xcbvxc'),
(92, 'League', 'bcvcv', 'vikas', 'vcbvc', NULL, 'gf@gmail.com', '57567', 'cvb@gmail.com', 'fgh.fb.com', 502, '0', NULL, '2019-09-09 08:31:36', '2019-09-09 08:31:36', 'cvbcvb', '90010', 'platinum', 'cvgbnv'),
(84, 'League', 'cricket', 'jl', 'jklkj', NULL, 'vxc@gmail.com', '67676676', 'vikas.auspicioussoft@gmail.com', 'fdfg.fb.com', 45, '0', NULL, '2019-09-06 04:18:38', '2019-09-06 04:18:38', 'bvn', '99918', 'gold', 'nbv'),
(85, 'League', 'cricket', 'jl', 'jklkj', NULL, 'vxc@gmail.com', '67676676', 'vikas.auspicioussoft@gmail.com', 'fdfg.fb.com', 45, '0', NULL, '2019-09-06 04:20:31', '2019-09-06 04:20:31', 'bvn', '99918', 'gold', 'nbv'),
(89, 'Entire school athletic department', 'xcv', 'cbv', 'xcb', NULL, 'xcv@gmail.com', '34343', 'xcb@gmail.com', 'dfg.fb.com', 45, '0', NULL, '2019-09-06 04:25:31', '2019-09-06 04:25:31', 'xcv', 'poland', 'diamond', 'xcbvxc'),
(94, 'League', 'cricket', 'gfh', 'fgh', NULL, 'xdf@gmail.com', '3434343', 'gf@gmail.com', 'dfg.fb.com', 345, '0', NULL, '2019-09-10 00:57:19', '2019-09-10 00:57:19', 'sds', '90001', 'diamond', 'cfsds'),
(95, 'League', 'vxc', 'xzc', 'zxc', NULL, 'xcv@gmail.com', '54654654', 'xz@gmail.com', 'xvg.fb.com', 345, '0', NULL, '2019-09-10 04:40:05', '2019-09-10 04:40:05', 'xcvx', '90001', 'platinum', 'xcvxc'),
(96, 'League', 'zxc', 'cvb', 'cvb', NULL, 'zx@gmail.com', '546754654', 'cv@gmail.com', 'cbv.fb.com', 600, '0', NULL, '2019-09-10 04:41:46', '2019-09-10 04:41:46', 'zxcv', '90003', 'diamond', 'zxvc'),
(97, 'Entire travel club', 'cricket', 'xcv', 'xcv', NULL, 'dsf@gmail.com', '56465546', 'vikashverma003@gmail.com', 'dfg.fb.com', 678, '0', NULL, '2019-09-10 04:43:30', '2019-09-10 04:43:30', 'sdf', '90003', 'diamond', 'dsfds'),
(98, 'School band', 'cvbcvbcv', 'vikas', 'bvnvb', NULL, 'vb@gmail.com', '7897978', 'n@gmail.com', 'gfb.fb.com', 123, '0', NULL, '2019-09-10 04:47:46', '2019-09-10 04:47:46', 'cvbcvb', '90006', 'platinum', 'cvbcv'),
(115, 'Entire school athletic department', 'dfg', 'vb', 'cvb', NULL, 'df@gmail.com', '345345', 'cv@gmail.com', 'dfg.fb.com', 343, '0', NULL, '2019-09-12 08:22:07', '2019-09-12 08:22:07', 'gfhgf', '90001', 'platinum', 'fvgh'),
(116, 'One team', 'cricket', 'fg', 'fgh', NULL, 'ds@gmail.com', '7007526684', 'vikashverma003@gmail.com', 'tg.fb.com', 2324, '0', NULL, '2019-09-12 08:24:40', '2019-09-12 08:24:40', 'vbnvbn', '90001', 'platinum', 'ghnbv'),
(117, 'League', 'bvnm', 'dsf', 'sdf', NULL, 'f@gmail.com', '567567', 'sdf@gmail.com', 'ghj.fb.com', 234, '0', NULL, '2019-09-12 08:25:42', '2019-09-12 08:25:42', 'bnm', '90001', 'diamond', 'bnm'),
(118, 'League', 'bvnm', 'dsf', 'sdf', NULL, 'f@gmail.com', '567567', 'sdf@gmail.com', 'ghj.fb.com', 234, '0', NULL, '2019-09-12 08:26:36', '2019-09-12 08:26:36', 'bnm', '90001', 'diamond', 'bnm'),
(119, 'Entire travel club', 'cricket', 'xcv', 'xcv', NULL, 'd@gmail.com', '34343', 'x@gmail.com', 'sd.fb.com', 345, '0', NULL, '2019-09-13 05:55:18', '2019-09-13 05:55:18', 'sdfds', '90001', 'gold', 'sdf'),
(120, 'Entire school athletic department', 'vbn', 'ghj', 'ghj', NULL, 'v@gmail.com', '343434', 'gh@gmail.com', 'sdf.fb.com', 678, '0', NULL, '2019-09-13 05:56:40', '2019-09-13 05:56:40', 'vbn', '90001', 'silver', 'vbn'),
(121, 'Entire school athletic department', 'dfgdfdf', 'bvn', 'vbn', NULL, 'df@gmail.com', '45645654', 'v@gmail.com', 'dfg.fb.com', 343, '0', NULL, '2019-09-13 06:16:07', '2019-09-13 06:16:07', 'gdf', '90001', 'silver', 'dfgdf'),
(122, 'Entire travel club', 'cricket', 'cvb', 'ffgf', NULL, 'g@gmail.com', '3434534', 'f@gmail.com', 'dsf.fb.com', 444, '0', NULL, '2019-09-13 06:25:21', '2019-09-13 06:25:21', 'sdg', '90001', 'gold', 'dfsgd'),
(123, 'Entire school athletic department', 'playing', 'sdf', 'sdf', NULL, 'cv@gmail.com', '343433', 'fullstackdeveloper918@gmail.com', 'sdf.fb.com', 453, '0', NULL, '2019-09-13 06:47:22', '2019-09-13 06:47:22', 'cvb', '90001', 'platinum', 'xcbv'),
(124, 'League', 'sdf', 'b', 'cvb', NULL, 'ds@gmail.com', '345343', 'cvb@gmail.com', 'dsgf.fb.com', 345, '0', NULL, '2019-09-13 08:29:14', '2019-09-13 08:29:14', 'sdf', '90001', 'diamond', 'sdf'),
(125, 'School band', 'asd', 'cv', 'cvbn', NULL, 'as@gmail.com', '345343', 'cv@gmail.com', 'd.fb.com', 678, '0', NULL, '2019-09-13 08:30:10', '2019-09-13 08:30:10', 'asd', '90002', 'platinum', 'asd'),
(126, 'League', 'cvb', 'cvx', 'zxc', NULL, 'cvb@gmail.com', '454545', 'zxc@gmail.com', 'xscv.fb.com', 234, '0', NULL, '2019-09-13 23:14:56', '2019-09-13 23:14:56', 'cvb', '90017', 'diamond', 'cvbcv'),
(127, 'Entire school athletic department', 'cvxcc', 'df', 'df', NULL, 'cv@gmail.com', '676786', 'xcv@gmail.com', 'ghj.fb.com', 234, '0', NULL, '2019-09-16 01:05:53', '2019-09-16 01:05:53', 'xcvxc', '90001', NULL, 'xdcvf'),
(128, 'Entire travel club', 'xcvxcvxc', 'fgh', 'fghgf', NULL, 'xcv@gmail.com', '45454', 'fullstackdeveloper918@gmail.com', 'dfg.fb.com', 234, '0', NULL, '2019-09-16 01:08:55', '2019-09-16 01:08:55', 'xcvxc', '90001', 'silver', 'xcv'),
(129, 'League', 'vbnbv', 'bm', 'bnmbn', NULL, 'bvnbvnbv@gmail.com', '7007526684', 'fullstackdeveloper918@gmail.com', 'g.fb.com', 343, '0', NULL, '2019-09-16 01:10:36', '2019-09-16 01:10:36', 'vbn', '90001', 'gold', 'bvn'),
(130, 'League', 'vbnbv', 'bm', 'bnmbn', NULL, 'bvnbvnbv@gmail.com', '7007526684', 'fullstackdeveloper918@gmail.com', 'g.fb.com', 343, '0', NULL, '2019-09-16 01:12:39', '2019-09-16 01:12:39', 'vbn', '90001', 'gold', 'bvn'),
(131, 'League', 'vbnbv', 'bm', 'bnmbn', NULL, 'bvnbvnbv@gmail.com', '7007526684', 'fullstackdeveloper918@gmail.com', 'g.fb.com', 343, '0', NULL, '2019-09-16 01:13:12', '2019-09-16 01:13:12', 'vbn', '90001', 'gold', 'bvn'),
(132, 'Entire travel club', 'v', 'xcv', 'xcv', NULL, 'xc@gmail.com', '34343', 'fullstackdeveloper918@gmail.com', 'sdf.fb.com', 234, '0', NULL, '2019-09-16 01:14:00', '2019-09-16 01:14:00', 'xcvb', '90001', 'gold', 'xcbvxc'),
(133, 'Entire travel club', 'v', 'xcv', 'xcv', NULL, 'xc@gmail.com', '34343', 'fullstackdeveloper918@gmail.com', 'sdf.fb.com', 234, '0', NULL, '2019-09-16 01:15:17', '2019-09-16 01:15:17', 'xcvb', '90001', 'gold', 'xcbvxc'),
(147, 'Entire school athletic department', 'sdfsd', 'xcbv', 'xcvxc', NULL, 'd@gmail.com', '34343', 'xc@gmail.com', 'df.fb.com', 676, '0', NULL, '2019-09-16 02:59:05', '2019-09-16 02:59:05', 'sdfds', '90001', 'silver', 'fdsf');

-- --------------------------------------------------------

--
-- Table structure for table `teams_package`
--

CREATE TABLE `teams_package` (
  `id` int(11) NOT NULL,
  `tier_name` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `sponsor_amount` varchar(255) DEFAULT NULL,
  `slot_available` varchar(255) DEFAULT NULL,
  `teams_id` varchar(255) DEFAULT NULL,
  `Total` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `trip_url`
--

CREATE TABLE `trip_url` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trip_url`
--

INSERT INTO `trip_url` (`id`, `url`, `business_name`, `email`) VALUES
(1, 'https://www.tripadvisor.in/Restaurant_Review-g60823-d3617159-Reviews-Tatte_Bakery_and_Cafe-Brookline_Massachusetts.html', 'Tatte Bakery and Cafe', NULL),
(2, 'https://www.tripadvisor.in/Restaurant_Review-g60745-d1937941-Reviews-Island_Creek_Oyster_Bar-Boston_Massachusetts.html', 'Island Creek Oyster Bar', NULL),
(5, 'https://www.tripadvisor.in/Restaurant_Review-g293926-d1724500-Reviews-or50-Nina_s_Cafe-Hue_Thua_Thien_Hue_Province.html', 'Nina\'s Cafe', 'ninascafe@yahoo.com'),
(6, 'https://www.tripadvisor.in/Attraction_Review-g32655-d106164-Reviews-California_Science_Center-Los_Angeles_California.html', 'California Science Center', '4info@cscmail.org'),
(7, 'https://www.tripadvisor.in/Restaurant_Review-g32668-d4251469-Reviews-Birrieria_Jalisco-Lynwood_California.html', 'Birrieria Jalisco', 'info@birrieriajalisco.com\r\n\r\n'),
(8, 'https://www.tripadvisor.in/Search?redirect&uiOrigin=MASTHEAD&default_scope&singleSearchBox&pid=3825&searchSessionId=AA318B059363C57AA68FACE3F1CDE7341568287980404ssid&supportedSearchTypes=find_near_stand_alone_query&searchNearby&geo=32655&q=la%20casita%20m', 'La Casita Mexicana', 'info@casitamex.com\r\n'),
(9, 'https://www.tripadvisor.in/Restaurant_Review-g32655-d8299259-Reviews-The_Lobos-Los_Angeles_California.html', 'The Lobos Truck', 'info@thelobostruck.com'),
(10, NULL, 'Cafe Oaxaca', 'Info@oaxacausa.com'),
(11, NULL, 'Meat Bowl', 'info@meatbowl.in');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `yelp_address`
--

CREATE TABLE `yelp_address` (
  `id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `yelp_address`
--

INSERT INTO `yelp_address` (`id`, `location`, `city`, `business_name`, `latitude`, `longitude`, `phone`, `address`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Philippine', 'Malay', 'The Sunny Side Cafe', '11.953085', '121.929657', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(2, 'Philippine', 'Kalibo', 'Latté', '11.6947732097538', '122.374717823387', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(3, 'Philippine', 'Roxas City', 'Sprinkles Barkery & Cakes', '11.5870194280434', '122.748834304512', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(4, 'Philippine', 'Roxas City', 'Coco Veranda', '11.5998699', '122.74453', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(5, 'Philippine', 'Roxas City', 'Mang Inasal', '11.590068', '122.751778', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(6, 'Philippine', 'Malay', 'Los Indios Bravos', '11.9708009', '121.9176072', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(7, 'Philippine', 'Malay', 'The Pig Out Bistro', '11.9650773286637', '121.923854537308', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(8, 'Philippine', 'Kalibo', 'Sy Bee Tin', '11.708809', '122.361902', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(9, 'Philippine', 'Malay', 'White Beach', '11.961619', '121.924212', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(10, 'Philippine', 'Malay', 'Boracay', '11.967574', '121.924912', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(11, 'Philippine', 'Malay', 'The Ruf Resto', '11.9653462816334', '121.926760937475', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(12, 'Philippine', 'Sikat', 'Lime and Basil Thai Restaurant', '11.1126661300659', '122.509475708008', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(13, 'Philippine', 'Kalibo', 'Mang Inasal', '11.7060553934882', '122.371167875827', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(14, 'Philippine', 'Malay', 'Starbucks', '11.9634138575596', '121.923236920761', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(15, 'Philippine', 'Malay', 'Real Coffee & Tea Cafe', '11.9620434397384', '121.927229913322', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(16, 'Philippine', 'Malay', 'Mesa Filipino Moderne', '11.956914', '121.927598', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(17, 'Philippine', 'Malay', 'Cha Cha\'s Beach Cafe', '11.9575268693422', '121.92687025178', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(18, 'Philippine', 'Malay', 'Dos Mestizos', '11.9559386620961', '121.928895078599', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(19, 'Philippine', 'Boracay Island', 'Subo Boracay', '11.9563401859212', '121.930124272954', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(20, 'Philippine', 'Malay', 'Halomango', '11.962836', '121.926037', NULL, NULL, NULL, '2019-09-16 11:59:28', NULL),
(21, 'chelsea', 'Vinita', 'Clanton\'s Cafe', '36.6376226', '-95.1517914', '+19182569053', NULL, NULL, '2019-09-16 11:59:28', NULL),
(22, 'chelsea', 'Chelsea', 'Prairie Rose Grille', '36.52868', '-95.433781', '+19187895111', NULL, NULL, '2019-09-16 11:59:28', NULL),
(23, 'chelsea', 'Claremore', 'Hugo\'s Family Restaurant', '36.30711', '-95.62469', '+19183412927', NULL, NULL, '2019-09-16 11:59:28', NULL),
(24, 'chelsea', 'Langley', 'The Artichoke Restaurant & Bar', '36.4975629', '-95.0587688', '+19187829855', NULL, NULL, '2019-09-16 11:59:28', NULL),
(25, 'chelsea', 'Pryor', 'Sam & Ellas Chicken Palace', '36.2802391052246', '-95.3095855712891', '+19188256224', NULL, NULL, '2019-09-16 11:59:28', NULL),
(26, 'chelsea', 'Vinita', 'Hi-Way Cafe', '36.62753', '-95.19901', '+19182565465', NULL, NULL, '2019-09-16 11:59:28', NULL),
(27, 'chelsea', 'Claremore', 'Front Porch Bakery', '36.3454965502024', '-95.5927752703428', '+19183417505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(28, 'chelsea', 'Claremore', 'El Maguey Mexican Restaurant', '36.286544', '-95.633051', '+19183417677', NULL, NULL, '2019-09-16 11:59:28', NULL),
(29, 'chelsea', 'Owasso', 'Bricktown Brewery', '36.293466', '-95.841041', '+19183212739', NULL, NULL, '2019-09-16 11:59:28', NULL),
(30, 'chelsea', 'Claremore', 'Hammett House Restaurant', '36.31871', '-95.63015', '+19183417333', NULL, NULL, '2019-09-16 11:59:28', NULL),
(31, 'chelsea', 'Pryor', 'Mid-American Grille', '36.2521320878669', '-95.3342728567444', '+19188247625', NULL, NULL, '2019-09-16 11:59:28', NULL),
(32, 'chelsea', 'Owasso', 'Hideaway Pizza', '36.2935957706925', '-95.8288085244619', '+19189284777', NULL, NULL, '2019-09-16 11:59:28', NULL),
(33, 'chelsea', 'Claremore', 'J Farley\'s', '36.31065', '-95.63328', '+19189236130', NULL, NULL, '2019-09-16 11:59:28', NULL),
(34, 'chelsea', 'Owasso', 'Hapa Japanese Cuisine', '36.27772', '-95.8222', '+19182722727', NULL, NULL, '2019-09-16 11:59:28', NULL),
(35, 'chelsea', 'Owasso', 'Akira Sushi Bar', '36.2905010087619', '-95.8367274996492', '+19183766115', NULL, NULL, '2019-09-16 11:59:28', NULL),
(36, 'chelsea', 'Claremore', 'Asean Diner', '36.3217315', '-95.62367317', '+19183424141', NULL, NULL, '2019-09-16 11:59:28', NULL),
(37, 'chelsea', 'Claremore', 'Taco Tico', '36.3205699', '-95.61147', '+19183420050', NULL, NULL, '2019-09-16 11:59:28', NULL),
(38, 'chelsea', 'Claremore', 'Main Street Tavern - Claremore', '36.3118668907302', '-95.6150127014835', '+19182834464', NULL, NULL, '2019-09-16 11:59:28', NULL),
(39, 'chelsea', 'Pryor', 'Thomas Restaurant', '36.3026657104492', '-95.3198852539062', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(40, 'chelsea', 'Chelsea', 'Main Street Diner', '36.5357398986816', '-95.4319305419922', '+19187892001', NULL, NULL, '2019-09-16 11:59:28', NULL),
(41, 'chelsea', 'Vinita', 'Clanton\'s Cafe', '36.6376226', '-95.1517914', '+19182569053', NULL, NULL, '2019-09-16 11:59:28', NULL),
(42, 'chelsea', 'Chelsea', 'Prairie Rose Grille', '36.52868', '-95.433781', '+19187895111', NULL, NULL, '2019-09-16 11:59:28', NULL),
(43, 'chelsea', 'Claremore', 'Hugo\'s Family Restaurant', '36.30711', '-95.62469', '+19183412927', NULL, NULL, '2019-09-16 11:59:28', NULL),
(44, 'chelsea', 'Langley', 'The Artichoke Restaurant & Bar', '36.4975629', '-95.0587688', '+19187829855', NULL, NULL, '2019-09-16 11:59:28', NULL),
(45, 'chelsea', 'Pryor', 'Sam & Ellas Chicken Palace', '36.2802391052246', '-95.3095855712891', '+19188256224', NULL, NULL, '2019-09-16 11:59:28', NULL),
(46, 'chelsea', 'Vinita', 'Hi-Way Cafe', '36.62753', '-95.19901', '+19182565465', NULL, NULL, '2019-09-16 11:59:28', NULL),
(47, 'chelsea', 'Claremore', 'Front Porch Bakery', '36.3454965502024', '-95.5927752703428', '+19183417505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(48, 'chelsea', 'Claremore', 'El Maguey Mexican Restaurant', '36.286544', '-95.633051', '+19183417677', NULL, NULL, '2019-09-16 11:59:28', NULL),
(49, 'chelsea', 'Owasso', 'Bricktown Brewery', '36.293466', '-95.841041', '+19183212739', NULL, NULL, '2019-09-16 11:59:28', NULL),
(50, 'chelsea', 'Claremore', 'Hammett House Restaurant', '36.31871', '-95.63015', '+19183417333', NULL, NULL, '2019-09-16 11:59:28', NULL),
(51, 'chelsea', 'Pryor', 'Mid-American Grille', '36.2521320878669', '-95.3342728567444', '+19188247625', NULL, NULL, '2019-09-16 11:59:28', NULL),
(52, 'chelsea', 'Owasso', 'Hideaway Pizza', '36.2935957706925', '-95.8288085244619', '+19189284777', NULL, NULL, '2019-09-16 11:59:28', NULL),
(53, 'chelsea', 'Claremore', 'J Farley\'s', '36.31065', '-95.63328', '+19189236130', NULL, NULL, '2019-09-16 11:59:28', NULL),
(54, 'chelsea', 'Owasso', 'Hapa Japanese Cuisine', '36.27772', '-95.8222', '+19182722727', NULL, NULL, '2019-09-16 11:59:28', NULL),
(55, 'chelsea', 'Owasso', 'Akira Sushi Bar', '36.2905010087619', '-95.8367274996492', '+19183766115', NULL, NULL, '2019-09-16 11:59:28', NULL),
(56, 'chelsea', 'Claremore', 'Asean Diner', '36.3217315', '-95.62367317', '+19183424141', NULL, NULL, '2019-09-16 11:59:28', NULL),
(57, 'chelsea', 'Claremore', 'Taco Tico', '36.3205699', '-95.61147', '+19183420050', NULL, NULL, '2019-09-16 11:59:28', NULL),
(58, 'chelsea', 'Claremore', 'Main Street Tavern - Claremore', '36.3118668907302', '-95.6150127014835', '+19182834464', NULL, NULL, '2019-09-16 11:59:28', NULL),
(59, 'chelsea', 'Pryor', 'Thomas Restaurant', '36.3026657104492', '-95.3198852539062', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(60, 'chelsea', 'Chelsea', 'Main Street Diner', '36.5357398986816', '-95.4319305419922', '+19187892001', NULL, NULL, '2019-09-16 11:59:28', NULL),
(61, 'london', 'London', 'Dishoom', '51.512447030091', '-0.1269579217873', '+442074209320', NULL, NULL, '2019-09-16 11:59:28', NULL),
(62, 'london', 'London', 'The British Museum', '51.518298', '-0.126026', '+442073238299', NULL, NULL, '2019-09-16 11:59:28', NULL),
(63, 'london', 'London', 'The National Gallery', '51.508929', '-0.128302', '+4420077472885', NULL, NULL, '2019-09-16 11:59:28', NULL),
(64, 'london', 'London', 'Tower of London', '51.5083008269638', '-0.0760689389286426', '+442031666000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(65, 'london', 'London', 'Dishoom', '51.5129919', '-0.1397337', '+442074209322', NULL, NULL, '2019-09-16 11:59:28', NULL),
(66, 'london', 'London', 'Coca Cola London Eye', '51.503364', '-0.11957', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(67, 'london', 'London', 'Big Ben', '51.5007803427897', '-0.124601009192702', '+442072194272', NULL, NULL, '2019-09-16 11:59:28', NULL),
(68, 'london', 'London', 'Hyde Park', '51.5039538036569', '-0.152711774741523', '+443000612114', NULL, NULL, '2019-09-16 11:59:28', NULL),
(69, 'london', 'London', 'Tate Modern', '51.5078610102146', '-0.0991344451904297', '+442078878888', NULL, NULL, '2019-09-16 11:59:28', NULL),
(70, 'london', 'London', 'Victoria and Albert Museum', '51.4963940559606', '-0.171935630295101', '+442079422000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(71, 'london', 'London', 'Tower Bridge', '51.5054836850673', '-0.0754022598266602', '+442074033761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(72, 'london', 'London', 'Dishoom', '51.5245310066818', '-0.076594190862934', '+442074209324', NULL, NULL, '2019-09-16 11:59:28', NULL),
(73, 'london', 'London', 'Regency Café', '51.4940143171', '-0.13222007974201', '+442078216596', NULL, NULL, '2019-09-16 11:59:28', NULL),
(74, 'london', 'London', 'Dishoom', '51.5363182978271', '-0.125145272091882', '+442074209321', NULL, NULL, '2019-09-16 11:59:28', NULL),
(75, 'london', 'London', 'Westminster Abbey', '51.4993203344498', '-0.127374497474177', '+442072225152', NULL, NULL, '2019-09-16 11:59:28', NULL),
(76, 'london', 'London', 'The Natural History Museum', '51.4961423561293', '-0.174409105353236', '+442079425000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(77, 'london', 'London', 'Sketch', '51.5127614699071', '-0.14159163911048', '+442076594500', NULL, NULL, '2019-09-16 11:59:28', NULL),
(78, 'london', 'London', 'Gordon\'s Wine Bar', '51.5079411426091', '-0.123381614685059', '+442079301408', NULL, NULL, '2019-09-16 11:59:28', NULL),
(79, 'london', 'London', 'Camden Market', '51.541502', '-0.14573', '+442037639999', NULL, NULL, '2019-09-16 11:59:28', NULL),
(80, 'london', 'London', 'Hawksmoor Seven Dials', '51.5134998914001', '-0.12567396291297', '+442074209390', NULL, NULL, '2019-09-16 11:59:28', NULL),
(81, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(82, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(83, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(84, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(85, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(86, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(87, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(88, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(89, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(90, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(91, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(92, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(93, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(94, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(95, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(96, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(97, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(98, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(99, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(100, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(101, 'london', 'London', 'Dishoom', '51.512447030091', '-0.1269579217873', '+442074209320', NULL, NULL, '2019-09-16 11:59:28', NULL),
(102, 'london', 'London', 'The British Museum', '51.518298', '-0.126026', '+442073238299', NULL, NULL, '2019-09-16 11:59:28', NULL),
(103, 'london', 'London', 'The National Gallery', '51.508929', '-0.128302', '+4420077472885', NULL, NULL, '2019-09-16 11:59:28', NULL),
(104, 'london', 'London', 'Tower of London', '51.5083008269638', '-0.0760689389286426', '+442031666000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(105, 'london', 'London', 'Dishoom', '51.5129919', '-0.1397337', '+442074209322', NULL, NULL, '2019-09-16 11:59:28', NULL),
(106, 'london', 'London', 'Coca Cola London Eye', '51.503364', '-0.11957', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(107, 'london', 'London', 'Big Ben', '51.5007803427897', '-0.124601009192702', '+442072194272', NULL, NULL, '2019-09-16 11:59:28', NULL),
(108, 'london', 'London', 'Hyde Park', '51.5039538036569', '-0.152711774741523', '+443000612114', NULL, NULL, '2019-09-16 11:59:28', NULL),
(109, 'london', 'London', 'Tate Modern', '51.5078610102146', '-0.0991344451904297', '+442078878888', NULL, NULL, '2019-09-16 11:59:28', NULL),
(110, 'london', 'London', 'Victoria and Albert Museum', '51.4963940559606', '-0.171935630295101', '+442079422000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(111, 'london', 'London', 'Tower Bridge', '51.5054836850673', '-0.0754022598266602', '+442074033761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(112, 'london', 'London', 'Dishoom', '51.5245310066818', '-0.076594190862934', '+442074209324', NULL, NULL, '2019-09-16 11:59:28', NULL),
(113, 'london', 'London', 'Regency Café', '51.4940143171', '-0.13222007974201', '+442078216596', NULL, NULL, '2019-09-16 11:59:28', NULL),
(114, 'london', 'London', 'Dishoom', '51.5363182978271', '-0.125145272091882', '+442074209321', NULL, NULL, '2019-09-16 11:59:28', NULL),
(115, 'london', 'London', 'Westminster Abbey', '51.4993203344498', '-0.127374497474177', '+442072225152', NULL, NULL, '2019-09-16 11:59:28', NULL),
(116, 'london', 'London', 'The Natural History Museum', '51.4961423561293', '-0.174409105353236', '+442079425000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(117, 'london', 'London', 'Sketch', '51.5127614699071', '-0.14159163911048', '+442076594500', NULL, NULL, '2019-09-16 11:59:28', NULL),
(118, 'london', 'London', 'Gordon\'s Wine Bar', '51.5079411426091', '-0.123381614685059', '+442079301408', NULL, NULL, '2019-09-16 11:59:28', NULL),
(119, 'london', 'London', 'Camden Market', '51.541502', '-0.14573', '+442037639999', NULL, NULL, '2019-09-16 11:59:28', NULL),
(120, 'london', 'London', 'Hawksmoor Seven Dials', '51.5134998914001', '-0.12567396291297', '+442074209390', NULL, NULL, '2019-09-16 11:59:28', NULL),
(121, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(122, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(123, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(124, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(125, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(126, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(127, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(128, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(129, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(130, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(131, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(132, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(133, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(134, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(135, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(136, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(137, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(138, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(139, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(140, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(141, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(142, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(143, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(144, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(145, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(146, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(147, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(148, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(149, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(150, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(151, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(152, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(153, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(154, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(155, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(156, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(157, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(158, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(159, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(160, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(161, 'Austria', 'Vienna', 'Figlmüller', '48.209265260697', '16.3748370280422', '+4315126177', NULL, NULL, '2019-09-16 11:59:28', NULL),
(162, 'Austria', 'Vienna', 'Cafe Central', '48.2103618939097', '16.3654034261284', '+4315333763', NULL, NULL, '2019-09-16 11:59:28', NULL),
(163, 'Austria', 'Vienna', 'Eis-Greissler', '48.210578', '16.374913', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(164, 'Austria', 'Vienna', 'Stephansdom', '48.208788828476', '16.372702915776', '+4315137648', NULL, NULL, '2019-09-16 11:59:28', NULL),
(165, 'Austria', 'Vienna', 'Gmoa Keller', '48.200628', '16.37886', '+4317125310', NULL, NULL, '2019-09-16 11:59:28', NULL),
(166, 'Austria', 'Vienna', 'Steirereck', '48.2044781437765', '16.381318351337', '+4317133168', NULL, NULL, '2019-09-16 11:59:28', NULL),
(167, 'Austria', 'Vienna', 'Gasthaus Pöschl', '48.20668', '16.373851', '+4315135288', NULL, NULL, '2019-09-16 11:59:28', NULL),
(168, 'Austria', 'Vienna', 'Plachutta', '48.20755', '16.37867', '+4315121577', NULL, NULL, '2019-09-16 11:59:28', NULL),
(169, 'Austria', 'Vienna', 'Trzesniewski', '48.208017', '16.370197', '+4315123291', NULL, NULL, '2019-09-16 11:59:28', NULL),
(170, 'Austria', 'Vienna', 'Demel', '48.2086', '16.367215', '+43153517170', NULL, NULL, '2019-09-16 11:59:28', NULL),
(171, 'Austria', 'Vienna', 'Belvedere', '48.19126', '16.3798', '+431795570', NULL, NULL, '2019-09-16 11:59:28', NULL),
(172, 'Austria', 'Vienna', 'Schloss Schönbrunn', '48.1851487385143', '16.3123353904179', '+431811130', NULL, NULL, '2019-09-16 11:59:28', NULL),
(173, 'Austria', 'Vienna', 'Kunsthistorisches Museum', '48.2039120561157', '16.361407817614', '+431525240', NULL, NULL, '2019-09-16 11:59:28', NULL),
(174, 'Austria', 'Vienna', 'Prater', '48.216727', '16.398023', '+4317280516', NULL, NULL, '2019-09-16 11:59:28', NULL),
(175, 'Austria', 'Vienna', 'Phil', '48.20028', '16.36116', '+4315810489', NULL, NULL, '2019-09-16 11:59:28', NULL),
(176, 'Austria', 'Vienna', 'Zanoni & Zanoni', '48.20989', '16.3743899', '+4315127979', NULL, NULL, '2019-09-16 11:59:28', NULL),
(177, 'Austria', 'Vienna', 'Jonas Reindl Coffee', '48.21496', '16.36173', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(178, 'Austria', 'Vienna', 'Kolar', '48.21064', '16.36999', '+4315335225', NULL, NULL, '2019-09-16 11:59:28', NULL),
(179, 'Austria', 'Vienna', 'Motto am Fluss', '48.2120510520746', '16.3780843301925', '+4312525510', NULL, NULL, '2019-09-16 11:59:28', NULL),
(180, 'Austria', 'Vienna', 'Kaffee Alt Wien', '48.20915', '16.3761699', '+4315125222', NULL, NULL, '2019-09-16 11:59:28', NULL),
(181, 'Germany', 'Berlin', 'Brandenburg Gate', '52.516305', '13.377678', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(182, 'Germany', 'Berlin', 'Mustafas Gemüse Kebap', '52.493825', '13.387869', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(183, 'Germany', 'Berlin', 'Burgermeister', '52.5011', '13.442463', '+493023883840', NULL, NULL, '2019-09-16 11:59:28', NULL),
(184, 'Germany', 'Berlin', 'Rausch Schokoladenhaus', '52.51199', '13.3913499', '+4930757880', NULL, NULL, '2019-09-16 11:59:28', NULL),
(185, 'Germany', 'Berlin', 'Federal Diet', '52.5185658738212', '13.3759576107884', '+49302270', NULL, NULL, '2019-09-16 11:59:28', NULL),
(186, 'Germany', 'Berlin', 'German Museum of Technology', '52.4986556', '13.3768133', '+4930902540', NULL, NULL, '2019-09-16 11:59:28', NULL),
(187, 'Germany', 'Berlin', 'Gendarmenmarkt', '52.513643103492', '13.392638020576', '+493040004797', NULL, NULL, '2019-09-16 11:59:28', NULL),
(188, 'Germany', 'Berlin', 'Dolores', '52.523781', '13.409277', '+493028099597', NULL, NULL, '2019-09-16 11:59:28', NULL),
(189, 'Germany', 'Berlin', 'Monsieur Vuong', '52.526669', '13.407931', '+493099296924', NULL, NULL, '2019-09-16 11:59:28', NULL),
(190, 'Germany', 'Berlin', 'BBI Berlinburger International', '52.48652', '13.43096', '+491604826505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(191, 'Germany', 'Berlin', 'Berlin Victory Column', '52.5144972027476', '13.3500838279724', '+49303339509', NULL, NULL, '2019-09-16 11:59:28', NULL),
(192, 'Germany', 'Berlin', 'Memorial to the Murdered Jews of Europe', '52.5138909304677', '13.378671211581', '+49302639430', NULL, NULL, '2019-09-16 11:59:28', NULL),
(193, 'Germany', 'Berlin', 'Tempelhofer Feld', '52.4757443343279', '13.4018100874023', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(194, 'Germany', 'Berlin', 'Cocolo Ramen', '52.52718', '13.39934', '+493098339073', NULL, NULL, '2019-09-16 11:59:28', NULL),
(195, 'Germany', 'Berlin', '1900 Café', '52.50395', '13.32246', '+493088715871', NULL, NULL, '2019-09-16 11:59:28', NULL),
(196, 'Germany', 'Berlin', 'Yarok', '52.5283244', '13.3920916', '+493095628703', NULL, NULL, '2019-09-16 11:59:28', NULL),
(197, 'Germany', 'Berlin', 'Rembrandt-Burger', '52.52002', '13.44783', '+493089997296', NULL, NULL, '2019-09-16 11:59:28', NULL),
(198, 'Germany', 'Berlin', 'The Bird', '52.54674', '13.40575', '+493051053283', NULL, NULL, '2019-09-16 11:59:28', NULL),
(199, 'Germany', 'Berlin', 'Berlin Television Tower', '52.520815', '13.409419', '+4930247575875', NULL, NULL, '2019-09-16 11:59:28', NULL),
(200, 'Germany', 'Berlin', 'East Side Gallery', '52.505027', '13.439692', '+491723918726', NULL, NULL, '2019-09-16 11:59:28', NULL),
(201, 'Malaysia', 'Kuala Lumpur', 'Petronas Twin Towers', '3.1578', '101.711958', '+60323318080', NULL, NULL, '2019-09-16 11:59:28', NULL),
(202, 'Malaysia', 'Kuala Lumpur', 'VCR', '3.1432699', '101.70544', '+60321102330', NULL, NULL, '2019-09-16 11:59:28', NULL),
(203, 'Malaysia', 'Kuala Lumpur', 'Jalan Alor', '3.14501', '101.70808', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(204, 'Malaysia', 'Kuala Lumpur', 'Restoran Kin Kin', '3.16161', '101.70016', '+60163728069', NULL, NULL, '2019-09-16 11:59:28', NULL),
(205, 'Malaysia', 'Kuala Lumpur', 'Din Tai Fung', '3.149356', '101.712717', '+60321488292', NULL, NULL, '2019-09-16 11:59:28', NULL),
(206, 'Malaysia', 'Kuala Lumpur', 'Inside Scoop', '3.13247', '101.67091', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(207, 'Malaysia', 'Kuala Lumpur', 'Marini\'s on 57', '3.15661263795547', '101.711443863338', '+60323866030', NULL, NULL, '2019-09-16 11:59:28', NULL),
(208, 'Malaysia', 'Kuala Lumpur', 'Opium', '3.14744187614102', '101.708302362254', '+60321425670', NULL, NULL, '2019-09-16 11:59:28', NULL),
(209, 'Malaysia', 'Kuala Lumpur', 'Feeka Coffee Roasters', '3.14859', '101.70835', '+60321104599', NULL, NULL, '2019-09-16 11:59:28', NULL),
(210, 'Malaysia', 'Kuala Lumpur', 'Lot 10 Hutong', '3.14350952222992', '101.712486387743', '+60327823500', NULL, NULL, '2019-09-16 11:59:28', NULL),
(211, 'Malaysia', 'Kuala Lumpur', 'Pulp', '3.12422869813076', '101.674303433426', '+60322013650', NULL, NULL, '2019-09-16 11:59:28', NULL),
(212, 'Malaysia', 'Kuala Lumpur', 'Devi\'s Corner', '3.131416', '101.67162', '+60322827591', NULL, NULL, '2019-09-16 11:59:28', NULL),
(213, 'Malaysia', 'Kuala Lumpur', 'Perdana Botanical Garden', '3.144827', '101.684771', '+60326176404', NULL, NULL, '2019-09-16 11:59:28', NULL),
(214, 'Malaysia', 'Kuala Lumpur', 'TG\'s Nasi Kandar', '3.14543216418666', '101.707010290559', '+60321101221', NULL, NULL, '2019-09-16 11:59:28', NULL),
(215, 'Malaysia', 'Kuala Lumpur', 'KL Bird Park', '3.143099', '101.688734', '+60322721010', NULL, NULL, '2019-09-16 11:59:28', NULL),
(216, 'Malaysia', 'Kuala Lumpur', 'Sri Nirvana Maju', '3.1310101', '101.6708679', '+60322878445', NULL, NULL, '2019-09-16 11:59:28', NULL),
(217, 'Malaysia', 'Kuala Lumpur', 'KLCC Park', '3.15528825746079', '101.714752531491', '+60323809032', NULL, NULL, '2019-09-16 11:59:28', NULL),
(218, 'Malaysia', 'Kuala Lumpur', 'Fuego', '3.1580116', '101.7180583', '+60321620886', NULL, NULL, '2019-09-16 11:59:28', NULL),
(219, 'Malaysia', 'Kuala Lumpur', 'PS150', '3.1409507', '101.698111', '+60320222888', NULL, NULL, '2019-09-16 11:59:28', NULL),
(220, 'Malaysia', 'Kuala Lumpur', 'Taps Beer Bar', '3.14917723188712', '101.709046095109', '+60321101560', NULL, NULL, '2019-09-16 11:59:28', NULL),
(221, 'Malaysia', 'Kuala Lumpur', 'Petronas Twin Towers', '3.1578', '101.711958', '+60323318080', NULL, NULL, '2019-09-16 11:59:28', NULL),
(222, 'Malaysia', 'Kuala Lumpur', 'VCR', '3.1432699', '101.70544', '+60321102330', NULL, NULL, '2019-09-16 11:59:28', NULL),
(223, 'Malaysia', 'Kuala Lumpur', 'Jalan Alor', '3.14501', '101.70808', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(224, 'Malaysia', 'Kuala Lumpur', 'Restoran Kin Kin', '3.16161', '101.70016', '+60163728069', NULL, NULL, '2019-09-16 11:59:28', NULL),
(225, 'Malaysia', 'Kuala Lumpur', 'Din Tai Fung', '3.149356', '101.712717', '+60321488292', NULL, NULL, '2019-09-16 11:59:28', NULL),
(226, 'Malaysia', 'Kuala Lumpur', 'Inside Scoop', '3.13247', '101.67091', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(227, 'Malaysia', 'Kuala Lumpur', 'Marini\'s on 57', '3.15661263795547', '101.711443863338', '+60323866030', NULL, NULL, '2019-09-16 11:59:28', NULL),
(228, 'Malaysia', 'Kuala Lumpur', 'Opium', '3.14744187614102', '101.708302362254', '+60321425670', NULL, NULL, '2019-09-16 11:59:28', NULL),
(229, 'Malaysia', 'Kuala Lumpur', 'Feeka Coffee Roasters', '3.14859', '101.70835', '+60321104599', NULL, NULL, '2019-09-16 11:59:28', NULL),
(230, 'Malaysia', 'Kuala Lumpur', 'Lot 10 Hutong', '3.14350952222992', '101.712486387743', '+60327823500', NULL, NULL, '2019-09-16 11:59:28', NULL),
(231, 'Malaysia', 'Kuala Lumpur', 'Pulp', '3.12422869813076', '101.674303433426', '+60322013650', NULL, NULL, '2019-09-16 11:59:28', NULL),
(232, 'Malaysia', 'Kuala Lumpur', 'Devi\'s Corner', '3.131416', '101.67162', '+60322827591', NULL, NULL, '2019-09-16 11:59:28', NULL),
(233, 'Malaysia', 'Kuala Lumpur', 'Perdana Botanical Garden', '3.144827', '101.684771', '+60326176404', NULL, NULL, '2019-09-16 11:59:28', NULL),
(234, 'Malaysia', 'Kuala Lumpur', 'TG\'s Nasi Kandar', '3.14543216418666', '101.707010290559', '+60321101221', NULL, NULL, '2019-09-16 11:59:28', NULL),
(235, 'Malaysia', 'Kuala Lumpur', 'KL Bird Park', '3.143099', '101.688734', '+60322721010', NULL, NULL, '2019-09-16 11:59:28', NULL),
(236, 'Malaysia', 'Kuala Lumpur', 'Sri Nirvana Maju', '3.1310101', '101.6708679', '+60322878445', NULL, NULL, '2019-09-16 11:59:28', NULL),
(237, 'Malaysia', 'Kuala Lumpur', 'KLCC Park', '3.15528825746079', '101.714752531491', '+60323809032', NULL, NULL, '2019-09-16 11:59:28', NULL),
(238, 'Malaysia', 'Kuala Lumpur', 'Fuego', '3.1580116', '101.7180583', '+60321620886', NULL, NULL, '2019-09-16 11:59:28', NULL),
(239, 'Malaysia', 'Kuala Lumpur', 'PS150', '3.1409507', '101.698111', '+60320222888', NULL, NULL, '2019-09-16 11:59:28', NULL),
(240, 'Malaysia', 'Kuala Lumpur', 'Taps Beer Bar', '3.14917723188712', '101.709046095109', '+60321101560', NULL, NULL, '2019-09-16 11:59:28', NULL),
(241, 'Malaysia', 'Kuala Lumpur', 'Petronas Twin Towers', '3.1578', '101.711958', '+60323318080', NULL, NULL, '2019-09-16 11:59:28', NULL),
(242, 'Malaysia', 'Kuala Lumpur', 'VCR', '3.1432699', '101.70544', '+60321102330', NULL, NULL, '2019-09-16 11:59:28', NULL),
(243, 'Malaysia', 'Kuala Lumpur', 'Jalan Alor', '3.14501', '101.70808', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(244, 'Malaysia', 'Kuala Lumpur', 'Restoran Kin Kin', '3.16161', '101.70016', '+60163728069', NULL, NULL, '2019-09-16 11:59:28', NULL),
(245, 'Malaysia', 'Kuala Lumpur', 'Din Tai Fung', '3.149356', '101.712717', '+60321488292', NULL, NULL, '2019-09-16 11:59:28', NULL),
(246, 'Malaysia', 'Kuala Lumpur', 'Inside Scoop', '3.13247', '101.67091', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(247, 'Malaysia', 'Kuala Lumpur', 'Marini\'s on 57', '3.15661263795547', '101.711443863338', '+60323866030', NULL, NULL, '2019-09-16 11:59:28', NULL),
(248, 'Malaysia', 'Kuala Lumpur', 'Opium', '3.14744187614102', '101.708302362254', '+60321425670', NULL, NULL, '2019-09-16 11:59:28', NULL),
(249, 'Malaysia', 'Kuala Lumpur', 'Feeka Coffee Roasters', '3.14859', '101.70835', '+60321104599', NULL, NULL, '2019-09-16 11:59:28', NULL),
(250, 'Malaysia', 'Kuala Lumpur', 'Lot 10 Hutong', '3.14350952222992', '101.712486387743', '+60327823500', NULL, NULL, '2019-09-16 11:59:28', NULL),
(251, 'Malaysia', 'Kuala Lumpur', 'Pulp', '3.12422869813076', '101.674303433426', '+60322013650', NULL, NULL, '2019-09-16 11:59:28', NULL),
(252, 'Malaysia', 'Kuala Lumpur', 'Devi\'s Corner', '3.131416', '101.67162', '+60322827591', NULL, NULL, '2019-09-16 11:59:28', NULL),
(253, 'Malaysia', 'Kuala Lumpur', 'Perdana Botanical Garden', '3.144827', '101.684771', '+60326176404', NULL, NULL, '2019-09-16 11:59:28', NULL),
(254, 'Malaysia', 'Kuala Lumpur', 'TG\'s Nasi Kandar', '3.14543216418666', '101.707010290559', '+60321101221', NULL, NULL, '2019-09-16 11:59:28', NULL),
(255, 'Malaysia', 'Kuala Lumpur', 'KL Bird Park', '3.143099', '101.688734', '+60322721010', NULL, NULL, '2019-09-16 11:59:28', NULL),
(256, 'Malaysia', 'Kuala Lumpur', 'Sri Nirvana Maju', '3.1310101', '101.6708679', '+60322878445', NULL, NULL, '2019-09-16 11:59:28', NULL),
(257, 'Malaysia', 'Kuala Lumpur', 'KLCC Park', '3.15528825746079', '101.714752531491', '+60323809032', NULL, NULL, '2019-09-16 11:59:28', NULL),
(258, 'Malaysia', 'Kuala Lumpur', 'Fuego', '3.1580116', '101.7180583', '+60321620886', NULL, NULL, '2019-09-16 11:59:28', NULL),
(259, 'Malaysia', 'Kuala Lumpur', 'PS150', '3.1409507', '101.698111', '+60320222888', NULL, NULL, '2019-09-16 11:59:28', NULL),
(260, 'Malaysia', 'Kuala Lumpur', 'Taps Beer Bar', '3.14917723188712', '101.709046095109', '+60321101560', NULL, NULL, '2019-09-16 11:59:28', NULL),
(261, 'Malaysia', 'Kuala Lumpur', 'Petronas Twin Towers', '3.1578', '101.711958', '+60323318080', NULL, NULL, '2019-09-16 11:59:28', NULL),
(262, 'Malaysia', 'Kuala Lumpur', 'VCR', '3.1432699', '101.70544', '+60321102330', NULL, NULL, '2019-09-16 11:59:28', NULL),
(263, 'Malaysia', 'Kuala Lumpur', 'Jalan Alor', '3.14501', '101.70808', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(264, 'Malaysia', 'Kuala Lumpur', 'Restoran Kin Kin', '3.16161', '101.70016', '+60163728069', NULL, NULL, '2019-09-16 11:59:28', NULL),
(265, 'Malaysia', 'Kuala Lumpur', 'Din Tai Fung', '3.149356', '101.712717', '+60321488292', NULL, NULL, '2019-09-16 11:59:28', NULL),
(266, 'Malaysia', 'Kuala Lumpur', 'Inside Scoop', '3.13247', '101.67091', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(267, 'Malaysia', 'Kuala Lumpur', 'Marini\'s on 57', '3.15661263795547', '101.711443863338', '+60323866030', NULL, NULL, '2019-09-16 11:59:28', NULL),
(268, 'Malaysia', 'Kuala Lumpur', 'Opium', '3.14744187614102', '101.708302362254', '+60321425670', NULL, NULL, '2019-09-16 11:59:28', NULL),
(269, 'Malaysia', 'Kuala Lumpur', 'Feeka Coffee Roasters', '3.14859', '101.70835', '+60321104599', NULL, NULL, '2019-09-16 11:59:28', NULL),
(270, 'Malaysia', 'Kuala Lumpur', 'Lot 10 Hutong', '3.14350952222992', '101.712486387743', '+60327823500', NULL, NULL, '2019-09-16 11:59:28', NULL),
(271, 'Malaysia', 'Kuala Lumpur', 'Pulp', '3.12422869813076', '101.674303433426', '+60322013650', NULL, NULL, '2019-09-16 11:59:28', NULL),
(272, 'Malaysia', 'Kuala Lumpur', 'Devi\'s Corner', '3.131416', '101.67162', '+60322827591', NULL, NULL, '2019-09-16 11:59:28', NULL),
(273, 'Malaysia', 'Kuala Lumpur', 'Perdana Botanical Garden', '3.144827', '101.684771', '+60326176404', NULL, NULL, '2019-09-16 11:59:28', NULL),
(274, 'Malaysia', 'Kuala Lumpur', 'TG\'s Nasi Kandar', '3.14543216418666', '101.707010290559', '+60321101221', NULL, NULL, '2019-09-16 11:59:28', NULL),
(275, 'Malaysia', 'Kuala Lumpur', 'KL Bird Park', '3.143099', '101.688734', '+60322721010', NULL, NULL, '2019-09-16 11:59:28', NULL),
(276, 'Malaysia', 'Kuala Lumpur', 'Sri Nirvana Maju', '3.1310101', '101.6708679', '+60322878445', NULL, NULL, '2019-09-16 11:59:28', NULL),
(277, 'Malaysia', 'Kuala Lumpur', 'KLCC Park', '3.15528825746079', '101.714752531491', '+60323809032', NULL, NULL, '2019-09-16 11:59:28', NULL),
(278, 'Malaysia', 'Kuala Lumpur', 'Fuego', '3.1580116', '101.7180583', '+60321620886', NULL, NULL, '2019-09-16 11:59:28', NULL),
(279, 'Malaysia', 'Kuala Lumpur', 'PS150', '3.1409507', '101.698111', '+60320222888', NULL, NULL, '2019-09-16 11:59:28', NULL),
(280, 'Malaysia', 'Kuala Lumpur', 'Taps Beer Bar', '3.14917723188712', '101.709046095109', '+60321101560', NULL, NULL, '2019-09-16 11:59:28', NULL),
(281, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(282, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(283, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(284, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(285, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(286, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(287, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(288, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(289, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(290, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(291, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(292, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(293, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(294, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(295, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(296, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(297, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(298, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(299, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(300, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(301, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(302, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(303, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(304, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(305, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(306, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(307, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(308, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(309, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(310, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(311, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(312, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(313, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(314, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(315, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(316, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(317, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(318, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(319, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(320, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(321, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(322, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(323, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(324, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(325, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(326, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(327, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(328, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(329, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(330, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(331, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(332, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(333, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(334, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(335, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(336, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(337, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(338, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(339, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(340, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(341, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(342, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(343, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(344, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(345, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(346, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(347, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(348, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(349, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(350, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(351, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(352, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(353, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(354, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(355, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(356, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(357, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(358, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(359, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(360, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(361, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(362, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(363, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(364, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(365, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(366, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL);
INSERT INTO `yelp_address` (`id`, `location`, `city`, `business_name`, `latitude`, `longitude`, `phone`, `address`, `email`, `created_at`, `updated_at`) VALUES
(367, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(368, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(369, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(370, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(371, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(372, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(373, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(374, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(375, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(376, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(377, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(378, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(379, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(380, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(381, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(382, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(383, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(384, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(385, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(386, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(387, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(388, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(389, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(390, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(391, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(392, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(393, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(394, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(395, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(396, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(397, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(398, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(399, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(400, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(401, 'Brazil', '04094-050', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(402, 'Brazil', '01103-200', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(403, 'Brazil', '01411-011', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(404, 'Brazil', '05416-001', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(405, 'Brazil', '02219-001', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(406, 'Brazil', '01311-200', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(407, 'Brazil', '05404-000', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(408, 'Brazil', '01414-002', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(409, 'Brazil', '04110-120', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(410, 'Brazil', '01333-000', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(411, 'Brazil', '01310-000', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(412, 'Brazil', '05404-013', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(413, 'Brazil', '01414-000', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(414, 'Brazil', '01220-020', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(415, 'Brazil', '01012-000', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(416, 'Brazil', '05436-100', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(417, 'Brazil', '01414-000', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(418, 'Brazil', '01402-002', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(419, 'Brazil', '01426-000', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(420, 'Brazil', '01120-010', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(421, 'Brazil', '04094-050', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(422, 'Brazil', '01103-200', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(423, 'Brazil', '01411-011', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(424, 'Brazil', '05416-001', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(425, 'Brazil', '02219-001', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(426, 'Brazil', '01311-200', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(427, 'Brazil', '05404-000', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(428, 'Brazil', '01414-002', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(429, 'Brazil', '04110-120', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(430, 'Brazil', '01333-000', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(431, 'Brazil', '01310-000', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(432, 'Brazil', '05404-013', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(433, 'Brazil', '01414-000', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(434, 'Brazil', '01220-020', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(435, 'Brazil', '01012-000', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(436, 'Brazil', '05436-100', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(437, 'Brazil', '01414-000', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(438, 'Brazil', '01402-002', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(439, 'Brazil', '01426-000', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(440, 'Brazil', '01120-010', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(441, 'Brazil', '04094-050', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(442, 'Brazil', '01103-200', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(443, 'Brazil', '01411-011', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(444, 'Brazil', '05416-001', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(445, 'Brazil', '02219-001', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(446, 'Brazil', '01311-200', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(447, 'Brazil', '05404-000', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(448, 'Brazil', '01414-002', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(449, 'Brazil', '04110-120', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(450, 'Brazil', '01333-000', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(451, 'Brazil', '01310-000', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(452, 'Brazil', '05404-013', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(453, 'Brazil', '01414-000', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(454, 'Brazil', '01220-020', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(455, 'Brazil', '01012-000', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(456, 'Brazil', '05436-100', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(457, 'Brazil', '01414-000', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(458, 'Brazil', '01402-002', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(459, 'Brazil', '01426-000', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(460, 'Brazil', '01120-010', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(461, 'Brazil', '04094-050', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(462, 'Brazil', '01103-200', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(463, 'Brazil', '01411-011', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(464, 'Brazil', '05416-001', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(465, 'Brazil', '02219-001', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(466, 'Brazil', '01311-200', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(467, 'Brazil', '05404-000', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(468, 'Brazil', '01414-002', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(469, 'Brazil', '04110-120', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(470, 'Brazil', '01333-000', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(471, 'Brazil', '01310-000', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(472, 'Brazil', '05404-013', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(473, 'Brazil', '01414-000', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(474, 'Brazil', '01220-020', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(475, 'Brazil', '01012-000', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(476, 'Brazil', '05436-100', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(477, 'Brazil', '01414-000', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(478, 'Brazil', '01402-002', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(479, 'Brazil', '01426-000', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(480, 'Brazil', '01120-010', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(481, 'Brazil', '04094-050', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(482, 'Brazil', '01103-200', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(483, 'Brazil', '01411-011', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(484, 'Brazil', '05416-001', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(485, 'Brazil', '02219-001', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(486, 'Brazil', '01311-200', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(487, 'Brazil', '05404-000', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(488, 'Brazil', '01414-002', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(489, 'Brazil', '04110-120', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(490, 'Brazil', '01333-000', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(491, 'Brazil', '01310-000', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(492, 'Brazil', '05404-013', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(493, 'Brazil', '01414-000', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(494, 'Brazil', '01220-020', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(495, 'Brazil', '01012-000', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(496, 'Brazil', '05436-100', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(497, 'Brazil', '01414-000', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(498, 'Brazil', '01402-002', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(499, 'Brazil', '01426-000', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(500, 'Brazil', '01120-010', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(501, 'Brazil', 'São Paulo', 'Ibirapuera Park', '-23.5882269907679', '-46.6603459137688', '+551155745505', NULL, NULL, '2019-09-16 11:59:28', NULL),
(502, 'Brazil', 'São Paulo', 'Municipal Market of São Paulo', '-23.5418189645286', '-46.6293849796057', '+551133133365', NULL, NULL, '2019-09-16 11:59:28', NULL),
(503, 'Brazil', 'São Paulo', 'D.O.M.', '-23.5663217605966', '-46.6674552441803', '+551130880761', NULL, NULL, '2019-09-16 11:59:28', NULL),
(504, 'Brazil', 'São Paulo', 'Coffee Lab', '-23.5562', '-46.69132', '+551133757400', NULL, NULL, '2019-09-16 11:59:28', NULL),
(505, 'Brazil', 'São Paulo', 'Mocotó Bar e Restaurante', '-23.486697', '-46.581646', '+551129513056', NULL, NULL, '2019-09-16 11:59:28', NULL),
(506, 'Brazil', 'São Paulo', 'Paulista Avenue', '-23.5630733', '-46.6543584', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(507, 'Brazil', 'São Paulo', 'Frida & Mina', '-23.563214', '-46.682516', '+551125791444', NULL, NULL, '2019-09-16 11:59:28', NULL),
(508, 'Brazil', 'São Paulo', 'Figueira Rubaiyat', '-23.5653914', '-46.6695667', '+551130871399', NULL, NULL, '2019-09-16 11:59:28', NULL),
(509, 'Brazil', 'São Paulo', 'Veloso Bar', '-23.5851519028138', '-46.63527331842', '+551155720254', NULL, NULL, '2019-09-16 11:59:28', NULL),
(510, 'Brazil', 'São Paulo', 'Frank Bar', '-23.5632866', '-46.6511293', '+551131458000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(511, 'Brazil', 'São Paulo', 'MASP - São Paulo Museum of Art', '-23.561515', '-46.656008', '+551131495959', NULL, NULL, '2019-09-16 11:59:28', NULL),
(512, 'Brazil', 'São Paulo', 'King of the Fork', '-23.5640215', '-46.6837904', '+551125339391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(513, 'Brazil', 'São Paulo', 'Bella Paulista', '-23.55613', '-46.660088', '+551132143347', NULL, NULL, '2019-09-16 11:59:28', NULL),
(514, 'Brazil', 'São Paulo', 'A Casa do Porco Bar', '-23.5449496425175', '-46.6447404564487', '+551132582578', NULL, NULL, '2019-09-16 11:59:28', NULL),
(515, 'Brazil', 'São Paulo', 'Centro Cultural Banco do Brasil', '-23.5473595', '-46.6346207', '+551131133651', NULL, NULL, '2019-09-16 11:59:28', NULL),
(516, 'Brazil', 'São Paulo', 'Beco do Batman', '-23.5566032', '-46.6861476', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(517, 'Brazil', 'São Paulo', 'Z Deli Sandwiches', '-23.562986', '-46.6671329094942', '+551130830021', NULL, NULL, '2019-09-16 11:59:28', NULL),
(518, 'Brazil', 'São Paulo', 'Skye Bar & Restaurante', '-23.58158', '-46.666748', '+551130554702', NULL, NULL, '2019-09-16 11:59:28', NULL),
(519, 'Brazil', 'São Paulo', 'Bacio di Latte', '-23.5677931', '-46.6635882', '+551136622573', NULL, NULL, '2019-09-16 11:59:28', NULL),
(520, 'Brazil', 'São Paulo', 'Pinacoteca do Estado', '-23.534274941553', '-46.6339467198519', '+551133241000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(521, 'Belgium', 'Brussels', 'Grand Place de Bruxelles', '50.8443908691406', '4.35609006881714', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(522, 'Belgium', 'Brussels', 'Peck 47', '50.84849', '4.35098', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(523, 'Belgium', 'Brussels', 'Delirium Café', '50.8484899793679', '4.35389310121536', '+3225144434', NULL, NULL, '2019-09-16 11:59:28', NULL),
(524, 'Belgium', 'City of Brussels', 'Bia Mara', '50.8486199', '4.35073', '+3225020061', NULL, NULL, '2019-09-16 11:59:28', NULL),
(525, 'Belgium', 'Brussels', 'Mer du Nord', '50.8502851255317', '4.34771109657476', '+3225131192', NULL, NULL, '2019-09-16 11:59:28', NULL),
(526, 'Belgium', 'Brussels', 'Nüetnigenough', '50.845878472881', '4.349795879639', '+3225137884', NULL, NULL, '2019-09-16 11:59:28', NULL),
(527, 'Belgium', 'Brussels', 'Le Fin de Siècle', '50.84896', '4.3471', '+3225110000', NULL, NULL, '2019-09-16 11:59:28', NULL),
(528, 'Belgium', 'Brussels', 'Pasta Divina', '50.847011', '4.354942', '+3225112155', NULL, NULL, '2019-09-16 11:59:28', NULL),
(529, 'Belgium', 'Brussels', 'Moeder Lambic', '50.8451', '4.34697', '+3225036068', NULL, NULL, '2019-09-16 11:59:28', NULL),
(530, 'Belgium', 'Brussels', 'Tonton Garby', '50.845126', '4.3548487', '+32484290216', NULL, NULL, '2019-09-16 11:59:28', NULL),
(531, 'Belgium', 'Brussels', 'Pierre Marcolini Chocolatier', '50.8410751683056', '4.35460000301974', '+3225141206', NULL, NULL, '2019-09-16 11:59:28', NULL),
(532, 'Belgium', 'Brussels', 'Maison Dandoy', '50.8474625068158', '4.35169045587804', '+3225110326', NULL, NULL, '2019-09-16 11:59:28', NULL),
(533, 'Belgium', 'Ixelles', 'Osteria Bolognese', '50.8363121', '4.3661307', '+3226085154', NULL, NULL, '2019-09-16 11:59:28', NULL),
(534, 'Belgium', 'Brussels', 'Rachel', '50.84531', '4.34754', '+3225033759', NULL, NULL, '2019-09-16 11:59:28', NULL),
(535, 'Belgium', 'Brussels', 'Boulangerie Charli', '50.85006', '4.34751', '+3225136332', NULL, NULL, '2019-09-16 11:59:28', NULL),
(536, 'Belgium', 'Brussels', 'Maison Dandoy', '50.8461197', '4.3520321', '+3225126588', NULL, NULL, '2019-09-16 11:59:28', NULL),
(537, 'Belgium', 'Brussels', 'Le Poechenellekelder', '50.8447887429781', '4.35000658035278', '+3225119262', NULL, NULL, '2019-09-16 11:59:28', NULL),
(538, 'Belgium', 'Brussels', 'Winehouse Osteria', '50.8464792', '4.3467156', '+3223500921', NULL, NULL, '2019-09-16 11:59:28', NULL),
(539, 'Belgium', 'Brussels', 'Corica', '50.84849', '4.3510854', '+3225118852', NULL, NULL, '2019-09-16 11:59:28', NULL),
(540, 'Belgium', 'Brussels', 'My Little Cup', '50.848093', '4.3649574', '+3224370527', NULL, NULL, '2019-09-16 11:59:28', NULL),
(541, '90210', 'Beverly Hills', 'The Penthouse at Mastro\'s', '34.068843', '-118.398751', '+13108888782', NULL, NULL, '2019-09-16 11:59:28', NULL),
(542, '90210', 'West Hollywood', 'Dialog Cafe', '34.0905094', '-118.3828495', '+13102891630', NULL, NULL, '2019-09-16 11:59:28', NULL),
(543, '90210', 'West Hollywood', 'Gracias Madre', '34.0807951106153', '-118.386972025037', '+13239782170', NULL, NULL, '2019-09-16 11:59:28', NULL),
(544, '90210', 'Burbank', 'Porto\'s Bakery & Cafe', '34.1677', '-118.34655', '+18188469100', NULL, NULL, '2019-09-16 11:59:28', NULL),
(545, '90210', 'Los Angeles', 'Diddy Riese Cookies', '34.0631288784817', '-118.446878719117', '+13102080448', NULL, NULL, '2019-09-16 11:59:28', NULL),
(546, '90210', 'Hollywood', 'The Griddle Cafe', '34.097807', '-118.362255', '+13238740377', NULL, NULL, '2019-09-16 11:59:28', NULL),
(547, '90210', 'West Hollywood', 'BOA Steakhouse', '34.0897786576692', '-118.39275836136', '+13102782050', NULL, NULL, '2019-09-16 11:59:28', NULL),
(548, '90210', 'Los Angeles', 'The Getty Center', '34.077794218403', '-118.473945310349', '+13104407300', NULL, NULL, '2019-09-16 11:59:28', NULL),
(549, '90210', 'Beverly Hills', 'Sprinkles Cupcakes', '34.0695469', '-118.4061455', '+13102748765', NULL, NULL, '2019-09-16 11:59:28', NULL),
(550, '90210', 'Beverly Hills', 'Nate\'n Al Delicatessen', '34.0703008', '-118.402216', '+13102740101', NULL, NULL, '2019-09-16 11:59:28', NULL),
(551, '90210', 'West Hollywood', 'Fresh Corn Grill', '34.0869', '-118.38035', '+13108559592', NULL, NULL, '2019-09-16 11:59:28', NULL),
(552, '90210', 'Los Angeles', 'Saffron & Rose Ice Cream', '34.0553693', '-118.441979', '+13104775533', NULL, NULL, '2019-09-16 11:59:28', NULL),
(553, '90210', 'Beverly Hills', 'Greystone Mansion & Gardens - The Doheny Estate', '34.0926873932396', '-118.401729777774', '+13102856830', NULL, NULL, '2019-09-16 11:59:28', NULL),
(554, '90210', 'West Hollywood', 'Guisados', '34.0844498', '-118.3853226', '+13107770310', NULL, NULL, '2019-09-16 11:59:28', NULL),
(555, '90210', 'Beverly Hills', 'The Bazaar by José Andrés', '34.06997360097', '-118.376559019089', '+13102465555', NULL, NULL, '2019-09-16 11:59:28', NULL),
(556, '90210', 'Beverly Hills', 'Lawry\'s The Prime Rib - Beverly Hills', '34.0678344219814', '-118.376046', '+13106522827', NULL, NULL, '2019-09-16 11:59:28', NULL),
(557, '90210', 'Los Angeles', 'Blu Jam Café', '34.0837144354804', '-118.350571407739', '+13239519191', NULL, NULL, '2019-09-16 11:59:28', NULL),
(558, '90210', 'Beverly Hills', 'The Polo Lounge', '34.0813559581321', '-118.414256362696', '+13108872777', NULL, NULL, '2019-09-16 11:59:28', NULL),
(559, '90210', 'West Hollywood', 'Katana', '34.095141', '-118.374456', '+13236508585', NULL, NULL, '2019-09-16 11:59:28', NULL),
(560, '90210', 'Los Angeles', 'Barton G. The Restaurant Los Angeles', '34.0869539412233', '-118.376752998217', '+13103881888', NULL, NULL, '2019-09-16 11:59:28', NULL),
(561, 'Austria', 'Vienna', 'Figlmüller', '48.209265260697', '16.3748370280422', '+4315126177', NULL, NULL, '2019-09-16 11:59:28', NULL),
(562, 'Austria', 'Vienna', 'Cafe Central', '48.2103618939097', '16.3654034261284', '+4315333763', NULL, NULL, '2019-09-16 11:59:28', NULL),
(563, 'Austria', 'Vienna', 'Eis-Greissler', '48.210578', '16.374913', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(564, 'Austria', 'Vienna', 'Stephansdom', '48.208788828476', '16.372702915776', '+4315137648', NULL, NULL, '2019-09-16 11:59:28', NULL),
(565, 'Austria', 'Vienna', 'Gmoa Keller', '48.200628', '16.37886', '+4317125310', NULL, NULL, '2019-09-16 11:59:28', NULL),
(566, 'Austria', 'Vienna', 'Steirereck', '48.2044781437765', '16.381318351337', '+4317133168', NULL, NULL, '2019-09-16 11:59:28', NULL),
(567, 'Austria', 'Vienna', 'Gasthaus Pöschl', '48.20668', '16.373851', '+4315135288', NULL, NULL, '2019-09-16 11:59:28', NULL),
(568, 'Austria', 'Vienna', 'Plachutta', '48.20755', '16.37867', '+4315121577', NULL, NULL, '2019-09-16 11:59:28', NULL),
(569, 'Austria', 'Vienna', 'Trzesniewski', '48.208017', '16.370197', '+4315123291', NULL, NULL, '2019-09-16 11:59:28', NULL),
(570, 'Austria', 'Vienna', 'Demel', '48.2086', '16.367215', '+43153517170', NULL, NULL, '2019-09-16 11:59:28', NULL),
(571, 'Austria', 'Vienna', 'Belvedere', '48.19126', '16.3798', '+431795570', NULL, NULL, '2019-09-16 11:59:28', NULL),
(572, 'Austria', 'Vienna', 'Schloss Schönbrunn', '48.1851487385143', '16.3123353904179', '+431811130', NULL, NULL, '2019-09-16 11:59:28', NULL),
(573, 'Austria', 'Vienna', 'Kunsthistorisches Museum', '48.2039120561157', '16.361407817614', '+431525240', NULL, NULL, '2019-09-16 11:59:28', NULL),
(574, 'Austria', 'Vienna', 'Prater', '48.216727', '16.398023', '+4317280516', NULL, NULL, '2019-09-16 11:59:28', NULL),
(575, 'Austria', 'Vienna', 'Phil', '48.20028', '16.36116', '+4315810489', NULL, NULL, '2019-09-16 11:59:28', NULL),
(576, 'Austria', 'Vienna', 'Zanoni & Zanoni', '48.20989', '16.3743899', '+4315127979', NULL, NULL, '2019-09-16 11:59:28', NULL),
(577, 'Austria', 'Vienna', 'Jonas Reindl Coffee', '48.21496', '16.36173', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(578, 'Austria', 'Vienna', 'Kolar', '48.21064', '16.36999', '+4315335225', NULL, NULL, '2019-09-16 11:59:28', NULL),
(579, 'Austria', 'Vienna', 'Motto am Fluss', '48.2120510520746', '16.3780843301925', '+4312525510', NULL, NULL, '2019-09-16 11:59:28', NULL),
(580, 'Austria', 'Vienna', 'Kaffee Alt Wien', '48.20915', '16.3761699', '+4315125222', NULL, NULL, '2019-09-16 11:59:28', NULL),
(581, 'Itly', 'Rome', 'Colosseo', '41.8902496828181', '12.4922484062616', '+3906699841', NULL, NULL, '2019-09-16 11:59:28', NULL),
(582, 'Itly', 'Rome', 'Trevi Fountain', '41.900931', '12.48331', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(583, 'Itly', 'Rome', 'La Prosciutteria - Trevi', '41.9019303973616', '12.4845363304221', '+39066786990', NULL, NULL, '2019-09-16 11:59:28', NULL),
(584, 'Itly', 'Rome', 'Giolitti', '41.9010879651567', '12.4773127734385', '+39066991243', NULL, NULL, '2019-09-16 11:59:28', NULL),
(585, 'Itly', 'Rome', 'Frigidarium', '41.8982940871793', '12.4704499525814', '+393349951184', NULL, NULL, '2019-09-16 11:59:28', NULL),
(586, 'Itly', 'Rome', 'Sapori e Delizie', '41.8949555731952', '12.4988673196126', '+39064875450', NULL, NULL, '2019-09-16 11:59:28', NULL),
(587, 'Itly', 'Rome', 'Pantheon - Basilica di Santa Maria ad Martyres', '41.898614', '12.476869', '+390668300230', NULL, NULL, '2019-09-16 11:59:28', NULL),
(588, 'Itly', 'Rome', 'Pane e Salame', '41.9006243095738', '12.4817441403866', '+39066791352', NULL, NULL, '2019-09-16 11:59:28', NULL),
(589, 'Itly', 'Rome', 'Hostaria La Botticella', '41.89033', '12.4680199', '+39065814738', NULL, NULL, '2019-09-16 11:59:28', NULL),
(590, 'Itly', 'Rome', 'Cantina e Cucina', '41.89801', '12.47162', '+39066892574', NULL, NULL, '2019-09-16 11:59:28', NULL),
(591, 'Itly', 'Rome', 'Pizza Zizza', '41.8997788372', '12.4565518275', '+393388681227', NULL, NULL, '2019-09-16 11:59:28', NULL),
(592, 'Itly', 'Rome', 'Ai Tre Scalini', '41.8962951860604', '12.490467219049', '+390648907495', NULL, NULL, '2019-09-16 11:59:28', NULL),
(593, 'Itly', 'Rome', 'That\'s Amore', '41.9021288', '12.4858295', '+39066790302', NULL, NULL, '2019-09-16 11:59:28', NULL),
(594, 'Itly', 'Rome', 'Pane & Vino', '41.8891366', '12.4953596', '+390677207177', NULL, NULL, '2019-09-16 11:59:28', NULL),
(595, 'Itly', 'Rome', 'Osteria Da Fortunata', '41.8960926932267', '12.4717008476776', '+390660667391', NULL, NULL, '2019-09-16 11:59:28', NULL),
(596, 'Itly', 'Rome', 'La Casa del Tazza d\'Oro', '41.8994494630771', '12.4774190950948', '+39066789792', NULL, NULL, '2019-09-16 11:59:28', NULL),
(597, 'Itly', 'Rome', 'Osteria Barberini', '41.90445', '12.48753', '+39064743325', NULL, NULL, '2019-09-16 11:59:28', NULL),
(598, 'Itly', 'Rome', 'Da Enzo al 29', '41.88812', '12.47774', '+39065812260', NULL, NULL, '2019-09-16 11:59:28', NULL),
(599, 'Itly', 'Rome', 'Foro Romano', '41.891504', '12.4887375', '+390639967700', NULL, NULL, '2019-09-16 11:59:28', NULL),
(600, 'Itly', 'Rome', 'Da Francesco', '41.8993198', '12.4706596', '+39066864009', NULL, NULL, '2019-09-16 11:59:28', NULL),
(601, 'Norway', 'Oslo', 'Frognerparken', '59.9249748190225', '10.7070819153442', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(602, 'Norway', 'Oslo', 'Tim Wendelboe', '59.9233937', '10.7556375', '+4794431627', NULL, NULL, '2019-09-16 11:59:28', NULL),
(603, 'Norway', 'Oslo', 'Den Glade Gris', '59.91788', '10.73408', '+4722111710', NULL, NULL, '2019-09-16 11:59:28', NULL),
(604, 'Norway', 'Oslo', 'Illegal Burger', '59.91569', '10.74861', '+4722203302', NULL, NULL, '2019-09-16 11:59:28', NULL),
(605, 'Norway', 'Oslo', 'Døgnvill Burger Vulkan', '59.9217078926537', '10.7516727175116', '+4721385010', NULL, NULL, '2019-09-16 11:59:28', NULL),
(606, 'Norway', 'Oslo', 'Den Norske Opera & Ballett', '59.90778', '10.75206', '+4721422121', NULL, NULL, '2019-09-16 11:59:28', NULL),
(607, 'Norway', 'Oslo', 'Fiskeriet', '59.9146610446883', '10.7498409316505', '+4722424540', NULL, NULL, '2019-09-16 11:59:28', NULL),
(608, 'Norway', 'Oslo', 'Mathallen Oslo', '59.9222313947069', '10.752047905835', '+4740001209', NULL, NULL, '2019-09-16 11:59:28', NULL),
(609, 'Norway', 'Oslo', 'Maaemo', '59.910456', '10.76028', '+4791994805', NULL, NULL, '2019-09-16 11:59:28', NULL),
(610, 'Norway', 'Oslo', 'Norsk folkemuseum', '59.907478174103', '10.686789027254', '+4722123700', NULL, NULL, '2019-09-16 11:59:28', NULL),
(611, 'Norway', 'Oslo', 'Villa Paradiso Grünerløkka', '59.9235188976501', '10.7574435660154', '+4722354060', NULL, NULL, '2019-09-16 11:59:28', NULL),
(612, 'Norway', 'Oslo', 'Lille Saigon 1', '59.9164886', '10.75109', '+4721388188', NULL, NULL, '2019-09-16 11:59:28', NULL),
(613, 'Norway', 'Oslo', 'Habsak', '59.9284168', '10.7516581', '+4721949099', NULL, NULL, '2019-09-16 11:59:28', NULL),
(614, 'Norway', 'Oslo', 'Alex Sushi Solli Plass', '59.91465', '10.7208204', '+4722439999', NULL, NULL, '2019-09-16 11:59:28', NULL),
(615, 'Norway', 'Oslo', 'Supreme Roastworks', '59.927945', '10.7592549', '+4722714202', NULL, NULL, '2019-09-16 11:59:28', NULL),
(616, 'Norway', 'Oslo', 'Himkok', '59.9142608931788', '10.7516701614357', '+4722422202', NULL, NULL, '2019-09-16 11:59:28', NULL),
(617, 'Norway', 'Oslo', 'Aker Brygge', '59.9091591140499', '10.7272301507638', '+4722832680', NULL, NULL, '2019-09-16 11:59:28', NULL),
(618, 'Norway', 'Oslo', 'Rent Mel Bakeri og Pizzeria', '59.91047', '10.74673', '+4740552777', NULL, NULL, '2019-09-16 11:59:28', NULL),
(619, 'Norway', 'Oslo', 'Mesh Café', '59.9131757', '10.7363365', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(620, 'Norway', 'Oslo', 'Torggata Botaniske', '59.9161063748158', '10.752256735243', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(621, 'Austria', 'Vienna', 'Figlmüller', '48.209265260697', '16.3748370280422', '+4315126177', NULL, NULL, '2019-09-16 11:59:28', NULL),
(622, 'Austria', 'Vienna', 'Cafe Central', '48.2103618939097', '16.3654034261284', '+4315333763', NULL, NULL, '2019-09-16 11:59:28', NULL),
(623, 'Austria', 'Vienna', 'Eis-Greissler', '48.210578', '16.374913', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(624, 'Austria', 'Vienna', 'Stephansdom', '48.208788828476', '16.372702915776', '+4315137648', NULL, NULL, '2019-09-16 11:59:28', NULL),
(625, 'Austria', 'Vienna', 'Gmoa Keller', '48.200628', '16.37886', '+4317125310', NULL, NULL, '2019-09-16 11:59:28', NULL),
(626, 'Austria', 'Vienna', 'Steirereck', '48.2044781437765', '16.381318351337', '+4317133168', NULL, NULL, '2019-09-16 11:59:28', NULL),
(627, 'Austria', 'Vienna', 'Gasthaus Pöschl', '48.20668', '16.373851', '+4315135288', NULL, NULL, '2019-09-16 11:59:28', NULL),
(628, 'Austria', 'Vienna', 'Plachutta', '48.20755', '16.37867', '+4315121577', NULL, NULL, '2019-09-16 11:59:28', NULL),
(629, 'Austria', 'Vienna', 'Trzesniewski', '48.208017', '16.370197', '+4315123291', NULL, NULL, '2019-09-16 11:59:28', NULL),
(630, 'Austria', 'Vienna', 'Demel', '48.2086', '16.367215', '+43153517170', NULL, NULL, '2019-09-16 11:59:28', NULL),
(631, 'Austria', 'Vienna', 'Belvedere', '48.19126', '16.3798', '+431795570', NULL, NULL, '2019-09-16 11:59:28', NULL),
(632, 'Austria', 'Vienna', 'Schloss Schönbrunn', '48.1851487385143', '16.3123353904179', '+431811130', NULL, NULL, '2019-09-16 11:59:28', NULL),
(633, 'Austria', 'Vienna', 'Kunsthistorisches Museum', '48.2039120561157', '16.361407817614', '+431525240', NULL, NULL, '2019-09-16 11:59:28', NULL),
(634, 'Austria', 'Vienna', 'Prater', '48.216727', '16.398023', '+4317280516', NULL, NULL, '2019-09-16 11:59:28', NULL),
(635, 'Austria', 'Vienna', 'Phil', '48.20028', '16.36116', '+4315810489', NULL, NULL, '2019-09-16 11:59:28', NULL),
(636, 'Austria', 'Vienna', 'Zanoni & Zanoni', '48.20989', '16.3743899', '+4315127979', NULL, NULL, '2019-09-16 11:59:28', NULL),
(637, 'Austria', 'Vienna', 'Jonas Reindl Coffee', '48.21496', '16.36173', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(638, 'Austria', 'Vienna', 'Kolar', '48.21064', '16.36999', '+4315335225', NULL, NULL, '2019-09-16 11:59:28', NULL),
(639, 'Austria', 'Vienna', 'Motto am Fluss', '48.2120510520746', '16.3780843301925', '+4312525510', NULL, NULL, '2019-09-16 11:59:28', NULL),
(640, 'Austria', 'Vienna', 'Kaffee Alt Wien', '48.20915', '16.3761699', '+4315125222', NULL, NULL, '2019-09-16 11:59:28', NULL),
(831, '90001', 'Los Angeles', 'The Grilled Cheese Truck', '33.97908', '-118.25009', '+18183451875', '', NULL, '2019-09-16 11:59:28', NULL),
(832, '90001', 'Huntington Park', 'Rays Texas BBQ', '33.986598', '-118.229803', '', '6038 Santa Fe Ave', NULL, '2019-09-16 11:59:28', NULL),
(833, '90001', 'Los Angeles', 'Tokyo Doggie Style', '33.9788284301758', '-118.249931335449', '', '', NULL, '2019-09-16 11:59:28', NULL),
(834, '90001', 'Huntington Park', 'Avila\'s El Ranchito Mexican Restaurant', '33.978496', '-118.230545', '+13235855055', '6703 Santa Fe Ave', NULL, '2019-09-16 11:59:28', NULL),
(835, '90001', 'Huntington Park', 'The Los Angeles Banh Mi Company', '33.9746224', '-118.2280264', '+13235531710', '2479 E Florence Ave', NULL, '2019-09-16 11:59:28', NULL),
(836, '90001', 'Huntington Park', 'Nina\'s Cafe', '33.98179', '-118.21985', '+13234849803', '2805 E Gage Ave', 'ninascafe@yahoo.com', '2019-09-16 11:59:28', NULL),
(837, '90001', 'Los Angeles', 'Teddy\'s Red Tacos', '33.9894829', '-118.262014', '+13234959654', '731 East Slauson Ave', NULL, '2019-09-16 11:59:28', NULL),
(838, '90001', 'Los Angeles', 'California Science Center', '34.015789', '-118.286209', '+13237243623', '700 Exposition Park Dr', '4info@cscmail.org', '2019-09-16 11:59:28', NULL),
(839, '90001', 'Los Angeles', 'Figueroa Philly Cheese Steak', '34.014196', '-118.282417', '+12137489073', '3850 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(840, '90001', 'Los Angeles', 'Birrieria Jalisco', '33.96956', '-118.24735', '+13235839322', '7714 Compton Ave', '', '2019-09-16 11:59:28', NULL),
(841, '90001', 'Los Angeles', 'Tire Shop Taqueria', '34.0097381464074', '-118.265285901725', '', '4069 S Avalon Blvd', NULL, '2019-09-16 11:59:28', NULL),
(842, '90001', 'Huntington Park', 'Las Molenderas Restaurant', '33.981824', '-118.224245', '+13235831933', '2635 Gage Ave', NULL, '2019-09-16 11:59:28', NULL),
(843, '90001', 'Los Angeles', 'Tacos y Birria La Unica', '34.02252', '-118.21658', '+13237154025', '2840 E Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(844, '90001', 'Los Angeles', 'Tacos Los Poblanos', '33.9891021960076', '-118.265354705316', '+13237436639', '5821 Avalon Blvd', NULL, '2019-09-16 11:59:28', NULL),
(845, '90001', 'South Gate', 'El Cielito Cafe', '33.96547', '-118.22551', '+13234849944', '8015 Long Beach Blvd', NULL, '2019-09-16 11:59:28', NULL),
(846, '90001', 'South Gate', 'Meat Bowl', '33.9642198107267', '-118.224787135968', '+13235819623', '8122 Long Beach Blvd', '', '2019-09-16 11:59:28', NULL),
(847, '90001', 'Bell', 'Restaurant Mole de Los Reyes', '33.9816589', '-118.2024231', '+13235885536', '6242 Maywood Ave', NULL, '2019-09-16 11:59:28', NULL),
(848, '90001', 'Huntington Park', 'Thirty5 Degrees', '33.9915383018662', '-118.224742852699', '+13235891354', '5610 Pacific Blvd', NULL, '2019-09-16 11:59:28', NULL),
(849, '90001', 'Los Angeles', 'Lettuce Feast', '33.97853', '-118.2497', '+14242613659', NULL, NULL, '2019-09-16 11:59:28', NULL),
(850, '90001', 'Los Angeles', 'Space Shuttle Endeavour', '34.0162101142984', '-118.287373578712', '+13237243623', '700 Exposition Park Dr', NULL, '2019-09-16 11:59:28', NULL),
(851, '90002', 'Los Angeles', 'Hawkins House of Burgers', '33.9292549', '-118.2522808', '+13235631129', '11603 Slater St', NULL, '2019-09-16 11:59:28', NULL),
(852, '90002', 'Lynwood', 'Balam Mexican Kitchen', '33.9221976552512', '-118.209478348335', '+14243386762', '11700 Long Beach Blvd', NULL, '2019-09-16 11:59:28', NULL),
(853, '90002', 'Los Angeles', 'Watts Coffee House', '33.943472', '-118.239854', '+13232494343', '1827 E 103rd St', NULL, '2019-09-16 11:59:28', NULL),
(854, '90002', 'Huntington Park', 'Rays Texas BBQ', '33.986598', '-118.229803', '', '6038 Santa Fe Ave', NULL, '2019-09-16 11:59:28', NULL),
(855, '90002', 'Los Angeles', 'The Grilled Cheese Truck', '33.97908', '-118.25009', '+18183451875', '', NULL, '2019-09-16 11:59:28', NULL),
(856, '90002', 'Huntington Park', 'Nina\'s Cafe', '33.98179', '-118.21985', '+13234849803', '2805 E Gage Ave', NULL, '2019-09-16 11:59:28', NULL),
(857, '90002', 'Huntington Park', 'Avila\'s El Ranchito Mexican Restaurant', '33.978496', '-118.230545', '+13235855055', '6703 Santa Fe Ave', NULL, '2019-09-16 11:59:28', NULL),
(858, '90002', 'Los Angeles', 'Tokyo Doggie Style', '33.9788284301758', '-118.249931335449', '', '', NULL, '2019-09-16 11:59:28', NULL),
(859, '90002', 'Huntington Park', 'The Los Angeles Banh Mi Company', '33.9746224', '-118.2280264', '+13235531710', '2479 E Florence Ave', NULL, '2019-09-16 11:59:28', NULL),
(860, '90002', 'South Gate', 'Meat Bowl', '33.9642198107267', '-118.224787135968', '+13235819623', '8122 Long Beach Blvd', NULL, '2019-09-16 11:59:28', NULL),
(861, '90002', 'South Gate', 'El Cielito Cafe', '33.96547', '-118.22551', '+13234849944', '8015 Long Beach Blvd', NULL, '2019-09-16 11:59:28', NULL),
(862, '90002', 'Bell', 'Restaurant Mole de Los Reyes', '33.9816589', '-118.2024231', '+13235885536', '6242 Maywood Ave', NULL, '2019-09-16 11:59:28', NULL),
(863, '90002', 'Los Angeles', 'Tacos y Birria La Unica', '34.02252', '-118.21658', '+13237154025', '2840 E Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(864, '90002', 'Huntington Park', 'Cruzita\'s Deli and Cafe', '33.9733796', '-118.2098306', '+13238356175', '7121 State St', NULL, '2019-09-16 11:59:28', NULL),
(865, '90002', 'Los Angeles', 'Cafe Oaxaca', '33.9457849', '-118.2537301', '+13232490292', '1211 E Century Blvd', '', '2019-09-16 11:59:28', NULL),
(866, '90002', 'Los Angeles', 'Teddy\'s Red Tacos', '33.9894829', '-118.262014', '+13234959654', '731 East Slauson Ave', NULL, '2019-09-16 11:59:28', NULL),
(867, '90002', 'Bell', 'La Casita Mexicana', '33.9786', '-118.19515', '+13237731898', '4030 E Gage Ave', '', '2019-09-16 11:59:28', NULL),
(868, '90002', 'Los Angeles', 'All Flavor No Grease', '33.93804', '-118.26194', '+13233180409', '728 E 108th St', NULL, '2019-09-16 11:59:28', NULL),
(869, '90002', 'Los Angeles', 'Roscoe\'s House of Chicken & Waffles', '33.9599', '-118.27421', '+13237526211', '106 W Manchester Ave', NULL, '2019-09-16 11:59:28', NULL),
(870, '90002', 'Los Angeles', 'The Lobos Truck', '34.0583969', '-118.1912081', '+14242358562', NULL, 'info@thelobostruck.com', '2019-09-16 11:59:28', NULL),
(871, '90003', 'Los Angeles', 'Roscoe\'s House of Chicken & Waffles', '33.9599', '-118.27421', '+13237526211', '106 W Manchester Ave', NULL, '2019-09-16 11:59:28', NULL),
(872, '90003', 'Los Angeles', 'Hawkins House of Burgers', '33.9292549', '-118.2522808', '+13235631129', '11603 Slater St', NULL, '2019-09-16 11:59:28', NULL),
(873, '90003', 'Los Angeles', 'Teddy\'s Red Tacos', '33.9894829', '-118.262014', '+13234959654', '731 East Slauson Ave', NULL, '2019-09-16 11:59:28', NULL),
(874, '90003', 'Huntington Park', 'Rays Texas BBQ', '33.986598', '-118.229803', '', '6038 Santa Fe Ave', NULL, '2019-09-16 11:59:28', NULL),
(875, '90003', 'Los Angeles', 'The Grilled Cheese Truck', '33.97908', '-118.25009', '+18183451875', '', NULL, '2019-09-16 11:59:28', NULL),
(876, '90003', 'Huntington Park', 'Avila\'s El Ranchito Mexican Restaurant', '33.978496', '-118.230545', '+13235855055', '6703 Santa Fe Ave', NULL, '2019-09-16 11:59:28', NULL),
(877, '90003', 'Los Angeles', 'El Tacorin', '33.96454', '-118.27863', '+13237782818', '8215 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(878, '90003', 'Los Angeles', 'Tokyo Doggie Style', '33.9788284301758', '-118.249931335449', '', '', NULL, '2019-09-16 11:59:28', NULL),
(879, '90003', 'Los Angeles', 'Tacos Los Poblanos', '33.9891021960076', '-118.265354705316', '+13237436639', '5821 Avalon Blvd', NULL, '2019-09-16 11:59:28', NULL),
(880, '90003', 'Huntington Park', 'The Los Angeles Banh Mi Company', '33.9746224', '-118.2280264', '+13235531710', '2479 E Florence Ave', NULL, '2019-09-16 11:59:28', NULL),
(881, '90003', 'Los Angeles', 'Taqueria Tijuana', '33.974841', '-118.277428', '+13237501719', '241 W Florence Ave', NULL, '2019-09-16 11:59:28', NULL),
(882, '90003', 'Los Angeles', 'Cobblermania', '33.96341', '-118.30862', '+13233164793', '8300 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(883, '90003', 'Los Angeles', 'Granny\'s Kitchen', '33.9930975470943', '-118.256304330019', '+13232312141', '5440 S Central Ave', NULL, '2019-09-16 11:59:28', NULL),
(884, '90003', 'Los Angeles', 'Casa Noodle Teriyaki', '33.98642', '-118.27357', '+13232328200', '5930 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(885, '90003', 'Los Angeles', 'The Burger Palace', '33.9599551', '-118.2737099', '+13237504507', '100 E Manchester Ave', NULL, '2019-09-16 11:59:28', NULL),
(886, '90003', 'South Gate', 'El Cielito Cafe', '33.96547', '-118.22551', '+13234849944', '8015 Long Beach Blvd', NULL, '2019-09-16 11:59:28', NULL),
(887, '90003', 'South Gate', 'Meat Bowl', '33.9642198107267', '-118.224787135968', '+13235819623', '8122 Long Beach Blvd', NULL, '2019-09-16 11:59:28', NULL),
(888, '90003', 'Huntington Park', 'Las Molenderas Restaurant', '33.981824', '-118.224245', '+13235831933', '2635 Gage Ave', NULL, '2019-09-16 11:59:28', NULL),
(889, '90003', 'Huntington Park', 'Thirty5 Degrees', '33.9915383018662', '-118.224742852699', '+13235891354', '5610 Pacific Blvd', NULL, '2019-09-16 11:59:28', NULL),
(890, '90003', 'Los Angeles', 'Birrieria Jalisco', '33.96956', '-118.24735', '+13235839322', '7714 Compton Ave', NULL, '2019-09-16 11:59:28', NULL),
(891, '90004', 'Los Angeles', 'Kang Ho-dong Baekjeong', '34.0637349', '-118.2972751', '+12133849678', '3465 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(892, '90004', 'Los Angeles', 'Salt & Straw', '34.075825', '-118.3235051', '+13234660485', '240 N Larchmont Blvd', NULL, '2019-09-16 11:59:28', NULL),
(893, '90004', 'Los Angeles', 'Hae Jang Chon Korean BBQ Restaurant', '34.0639032', '-118.3061281', '+12133898777', '3821 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(894, '90004', 'Los Angeles', 'Slurpin\' Ramen Bar', '34.0573614429986', '-118.306769744705', '+12133888607', '3500 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(895, '90004', 'Los Angeles', 'Han Bat Sul Lung Tang', '34.065414', '-118.3095703125', '+12133839499', '4163 W 5th St', NULL, '2019-09-16 11:59:28', NULL),
(896, '90004', 'Los Angeles', 'Dave\'s Hot Chicken', '34.0880681', '-118.308962', '+13235369711', '970 N Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(897, '90004', 'Los Angeles', 'Yup Dduk La', '34.064009', '-118.3007013', '+12132632355', '3603 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(898, '90004', 'Los Angeles', 'Providence', '34.083628', '-118.330168', '+13234604170', '5955 Melrose Ave', NULL, '2019-09-16 11:59:28', NULL),
(899, '90004', 'Los Angeles', 'Monty\'s Good Burger', '34.06469', '-118.30876', '+12139150257', '516 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(900, '90004', 'Los Angeles', 'BCD Tofu House', '34.0620862485445', '-118.302658449143', '+12133826677', '3575 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(901, '90004', 'Los Angeles', 'EMC Seafood & Raw Bar', '34.063452', '-118.299046', '+12133519988', '3500 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(902, '90004', 'Los Angeles', 'The Bun Shop', '34.0740309655666', '-118.309187963605', '+13234681031', '151 N Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(903, '90004', 'Los Angeles', 'Quarters Korean BBQ', '34.0640202245113', '-118.297687050455', '+12133658111', '3465 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(904, '90004', 'Los Angeles', 'Magal BBQ', '34.057544', '-118.305579846558', '+12133831909', '3460 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(905, '90004', 'Los Angeles', 'SomiSomi', '34.062880635935', '-118.309975725759', '+12135683284', '621 Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(906, '90004', 'Los Angeles', 'M Grill', '34.061358', '-118.310453', '+12133892770', '3832 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(907, '90004', 'Los Angeles', 'Osteria La Buca', '34.0833366755519', '-118.31393718099', '+13234621900', '5210 Melrose Ave', NULL, '2019-09-16 11:59:28', NULL),
(908, '90004', 'Los Angeles', 'Hae Ha Heng Thai Bistro', '34.06876', '-118.30948', '', '301 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(909, '90004', 'Los Angeles', 'Genwa Korean BBQ', '34.062321315088', '-118.340898970219', '+13235490760', '5115 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(910, '90004', 'Los Angeles', 'Bulgogi Hut', '34.0615866318416', '-118.303241833066', '+12133881988', '3600 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(911, '90005', 'Los Angeles', 'Slurpin\' Ramen Bar', '34.0573614429986', '-118.306769744705', '+12133888607', '3500 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(912, '90005', 'Los Angeles', 'Hae Jang Chon Korean BBQ Restaurant', '34.0639032', '-118.3061281', '+12133898777', '3821 W 6th St', NULL, '2019-09-16 11:59:28', NULL);
INSERT INTO `yelp_address` (`id`, `location`, `city`, `business_name`, `latitude`, `longitude`, `phone`, `address`, `email`, `created_at`, `updated_at`) VALUES
(913, '90005', 'Los Angeles', 'Kang Ho-dong Baekjeong', '34.0637349', '-118.2972751', '+12133849678', '3465 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(914, '90005', 'Los Angeles', 'Magal BBQ', '34.057544', '-118.305579846558', '+12133831909', '3460 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(915, '90005', 'Los Angeles', 'BCD Tofu House', '34.0620862485445', '-118.302658449143', '+12133826677', '3575 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(916, '90005', 'Los Angeles', 'Han Bat Sul Lung Tang', '34.065414', '-118.3095703125', '+12133839499', '4163 W 5th St', NULL, '2019-09-16 11:59:28', NULL),
(917, '90005', 'Los Angeles', 'Yup Dduk La', '34.064009', '-118.3007013', '+12132632355', '3603 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(918, '90005', 'Los Angeles', 'M Grill', '34.061358', '-118.310453', '+12133892770', '3832 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(919, '90005', 'Los Angeles', 'Monty\'s Good Burger', '34.06469', '-118.30876', '+12139150257', '516 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(920, '90005', 'Los Angeles', 'EMC Seafood & Raw Bar', '34.063452', '-118.299046', '+12133519988', '3500 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(921, '90005', 'Los Angeles', 'SomiSomi', '34.062880635935', '-118.309975725759', '+12135683284', '621 Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(922, '90005', 'Los Angeles', 'Eight Korean BBQ', '34.0559926754254', '-118.309936813492', '+12133651750', '863 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(923, '90005', 'Los Angeles', 'Quarters Korean BBQ', '34.0640202245113', '-118.297687050455', '+12133658111', '3465 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(924, '90005', 'Los Angeles', 'Bulgogi Hut', '34.0615866318416', '-118.303241833066', '+12133881988', '3600 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(925, '90005', 'Los Angeles', 'Sul & Beans', '34.0629013806047', '-118.309997512967', '+12133855510', '621 Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(926, '90005', 'Los Angeles', 'Salt & Straw', '34.075825', '-118.3235051', '+13234660485', '240 N Larchmont Blvd', NULL, '2019-09-16 11:59:28', NULL),
(927, '90005', 'Los Angeles', 'Ssam Korean BBQ', '34.0513648986816', '-118.308692932129', '+13237379292', '1040 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(928, '90005', 'Los Angeles', 'Soowon Galbi KBBQ Restaurant', '34.0564415632956', '-118.291338516533', '+12133659292', '856 S Vermont Ave', NULL, '2019-09-16 11:59:28', NULL),
(929, '90005', 'Los Angeles', 'Langer\'s', '34.05609', '-118.27658', '+12134838050', '704 S Alvarado St', NULL, '2019-09-16 11:59:28', NULL),
(930, '90005', 'Los Angeles', 'République', '34.06415', '-118.34367', '+13103626115', '624 S La Brea Ave', NULL, '2019-09-16 11:59:28', NULL),
(931, '90006', 'Los Angeles', 'Dino\'s Chicken and Burgers', '34.047441', '-118.293926', '+12133803554', '2575 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(932, '90006', 'Los Angeles', 'Papa Cristo\'s', '34.0474029033579', '-118.299641746033', '+13237372970', '2771 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(933, '90006', 'Los Angeles', 'Langer\'s', '34.05609', '-118.27658', '+12134838050', '704 S Alvarado St', NULL, '2019-09-16 11:59:28', NULL),
(934, '90006', 'Los Angeles', 'Soowon Galbi KBBQ Restaurant', '34.0564415632956', '-118.291338516533', '+12133659292', '856 S Vermont Ave', NULL, '2019-09-16 11:59:28', NULL),
(935, '90006', 'Los Angeles', 'Slurpin\' Ramen Bar', '34.0573614429986', '-118.306769744705', '+12133888607', '3500 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(936, '90006', 'Los Angeles', 'Kang Ho-dong Baekjeong', '34.0637349', '-118.2972751', '+12133849678', '3465 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(937, '90006', 'Los Angeles', 'Beverly Soon Tofu Restaurant', '34.05286', '-118.29235', '+12133801113', '2717 W Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(938, '90006', 'Los Angeles', 'Magal BBQ', '34.057544', '-118.305579846558', '+12133831909', '3460 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(939, '90006', 'Los Angeles', 'Park\'s BBQ', '34.05381', '-118.29196', '+12133801717', '955 S Vermont Ave', NULL, '2019-09-16 11:59:28', NULL),
(940, '90006', 'Los Angeles', 'EMC Seafood & Raw Bar', '34.063452', '-118.299046', '+12133519988', '3500 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(941, '90006', 'Los Angeles', 'Yup Dduk La', '34.064009', '-118.3007013', '+12132632355', '3603 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(942, '90006', 'Los Angeles', 'BCD Tofu House', '34.0620862485445', '-118.302658449143', '+12133826677', '3575 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(943, '90006', 'Los Angeles', 'Guelaguetza Restaurante', '34.05241', '-118.30071', '+12134270608', '3014 W Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(944, '90006', 'Los Angeles', 'Hae Jang Chon Korean BBQ Restaurant', '34.0639032', '-118.3061281', '+12133898777', '3821 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(945, '90006', 'Los Angeles', 'Road To Seoul', '34.04847', '-118.30867', '+13237319292', '1230 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(946, '90006', 'Los Angeles', 'Quarters Korean BBQ', '34.0640202245113', '-118.297687050455', '+12133658111', '3465 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(947, '90006', 'Los Angeles', 'Ssam Korean BBQ', '34.0513648986816', '-118.308692932129', '+13237379292', '1040 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(948, '90006', 'Los Angeles', 'Eight Korean BBQ', '34.0559926754254', '-118.309936813492', '+12133651750', '863 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(949, '90006', 'Los Angeles', 'Hangari Bajirak Kalguksu', '34.0628602582049', '-118.297570301258', '+12133882326', '3470 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(950, '90006', 'Los Angeles', 'Kobawoo House', '34.06012', '-118.29128', '+12133897300', '698 S Vermont Ave', NULL, '2019-09-16 11:59:28', NULL),
(951, '90007', 'Los Angeles', 'Dirt Dog', '34.0282923762355', '-118.275208244705', '+12137491813', '2528 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(952, '90007', 'Los Angeles', 'Chichen Itza Restaurant', '34.01744', '-118.2783', '+12137411075', '3655 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(953, '90007', 'Los Angeles', 'Jacks N Joe', '34.02876', '-118.27517', '+12137484565', '2498 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(954, '90007', 'Los Angeles', 'Natural History Museum', '34.016972', '-118.288768', '+12137633466', '900 Exposition Blvd', NULL, '2019-09-16 11:59:28', NULL),
(955, '90007', 'Los Angeles', 'Bacari W. Adams', '34.03447', '-118.28341', '+12137487205', '2308 S Union Ave', NULL, '2019-09-16 11:59:28', NULL),
(956, '90007', 'Los Angeles', 'California Science Center', '34.015789', '-118.286209', '+13237243623', '700 Exposition Park Dr', NULL, '2019-09-16 11:59:28', NULL),
(957, '90007', 'Los Angeles', 'Figueroa Philly Cheese Steak', '34.014196', '-118.282417', '+12137489073', '3850 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(958, '90007', 'Los Angeles', 'Revolutionario: North African Tacos', '34.02523', '-118.29857', '+14242233526', '1436 W Jefferson Blvd', NULL, '2019-09-16 11:59:28', NULL),
(959, '90007', 'Los Angeles', 'Nature\'s Brew', '34.0342569', '-118.283559', '+12137419393', '2316 S Union Ave', NULL, '2019-09-16 11:59:28', NULL),
(960, '90007', 'Los Angeles', 'Holbox', '34.0171789745852', '-118.278350606561', '+12139869972', '3655 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(961, '90007', 'Los Angeles', 'Everytable', '34.0350353531902', '-118.283531060368', '+12139735095', '1101 W 23rd St', NULL, '2019-09-16 11:59:28', NULL),
(962, '90007', 'Los Angeles', 'Bird\'s Nest Cafe', '34.0344334', '-118.2916849', '+13236417986', '2403 S Vermont Ave', NULL, '2019-09-16 11:59:28', NULL),
(963, '90007', 'Los Angeles', 'Dino\'s Chicken and Burgers', '34.047441', '-118.293926', '+12133803554', '2575 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(964, '90007', 'Los Angeles', 'Papa Cristo\'s', '34.0474029033579', '-118.299641746033', '+13237372970', '2771 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(965, '90007', 'Los Angeles', 'Ignatius Cafe', '34.031914', '-118.293154', '', '1451 Dana St', NULL, '2019-09-16 11:59:28', NULL),
(966, '90007', 'Los Angeles', 'Space Shuttle Endeavour', '34.0162101142984', '-118.287373578712', '+13237243623', '700 Exposition Park Dr', NULL, '2019-09-16 11:59:28', NULL),
(967, '90007', 'Los Angeles', 'Azla', '34.0173639', '-118.278314392065', '+12137457455', '3655 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(968, '90007', 'Los Angeles', 'La Taquiza', '34.0249016337977', '-118.278697446791', '+12137419795', '3009 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(969, '90007', 'Los Angeles', 'Ebaes', '34.0344536304474', '-118.283669427037', '+12137476888', '2314 S Union Ave', NULL, '2019-09-16 11:59:28', NULL),
(970, '90007', 'Los Angeles', 'Dulce', '34.025354', '-118.285446', '+12135365609', '3096 McClintock Ave', NULL, '2019-09-16 11:59:28', NULL),
(971, '90008', 'Los Angeles', 'Taqueria Los Anaya', '34.0327911', '-118.3417282', '+13237314070', '4651 W Adams Blvd', NULL, '2019-09-16 11:59:28', NULL),
(972, '90008', 'Inglewood', 'The Serving Spoon', '33.9762855538483', '-118.363437652588', '+13104123927', '1403 Centinela Ave', NULL, '2019-09-16 11:59:28', NULL),
(973, '90008', 'Los Angeles', 'Earle\'s On Crenshaw', '34.0156233070285', '-118.334755915362', '+13232992867', '3864 Crenshaw Blvd', NULL, '2019-09-16 11:59:28', NULL),
(974, '90008', 'Los Angeles', 'République', '34.06415', '-118.34367', '+13103626115', '624 S La Brea Ave', NULL, '2019-09-16 11:59:28', NULL),
(975, '90008', 'Los Angeles', 'Bottega Louie', '34.0469300995766', '-118.256601457672', '+12138021470', '700 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(976, '90008', 'Los Angeles', 'Leo\'s Tacos Truck', '34.046438', '-118.345718', '+13233462001', '1515 S La Brea Ave', NULL, '2019-09-16 11:59:28', NULL),
(977, '90008', 'Los Angeles', 'Mike\'s Deli', '33.9880055506272', '-118.362671546638', '+13232985960', '4859 W Slauson Ave', NULL, '2019-09-16 11:59:28', NULL),
(978, '90008', 'Los Angeles', 'Father\'s Office', '34.0304642240788', '-118.384695173189', '+13107362224', '3229 Helms Ave', NULL, '2019-09-16 11:59:28', NULL),
(979, '90008', 'Culver City', 'Baldwin Hills Scenic Overlook', '34.0176', '-118.384059', '', '6300 Hetzler Rd', NULL, '2019-09-16 11:59:28', NULL),
(980, '90008', 'Los Angeles', 'Slurpin\' Ramen Bar', '34.0573614429986', '-118.306769744705', '+12133888607', '3500 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(981, '90008', 'Los Angeles', 'Genwa Korean BBQ', '34.062321315088', '-118.340898970219', '+13235490760', '5115 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(982, '90008', 'Los Angeles', 'Post & Beam', '34.009861', '-118.3390427', '+13232995599', '3767 Santa Rosalia Dr', NULL, '2019-09-16 11:59:28', NULL),
(983, '90008', 'Los Angeles', 'Orleans & York Deli', '33.988497', '-118.3537791', '+13232918800', '4454 W Slauson Ave', NULL, '2019-09-16 11:59:28', NULL),
(984, '90008', 'Los Angeles', 'Roscoe\'s House of Chicken & Waffles', '34.0474472045898', '-118.346229553223', '+13239344405', '5006 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(985, '90008', 'Los Angeles', 'Dulan\'s On Crenshaw', '33.9985785', '-118.3307743', '+13232963034', '4859 Crenshaw Blvd', NULL, '2019-09-16 11:59:28', NULL),
(986, '90008', 'Los Angeles', 'El Chato Taco Truck', '34.0571251', '-118.346074', '+13232026936', '5300 W Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(987, '90008', 'Los Angeles', 'Pasta Sisters', '34.0476', '-118.317234', '+13238705271', '3343 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(988, '90008', 'Inglewood', 'Stuff I Eat', '33.963434', '-118.3518651', '+13106710115', '114 N Market St', NULL, '2019-09-16 11:59:28', NULL),
(989, '90008', 'Los Angeles', 'Grilled Fraiche', '33.9887', '-118.33492', '+13233898888', '5800 W Blvd', NULL, '2019-09-16 11:59:28', NULL),
(990, '90008', 'Los Angeles', 'Road To Seoul', '34.04847', '-118.30867', '+13237319292', '1230 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(991, '90009', 'Los Angeles', 'Aliki\'s Greek Taverna', '33.9524703946447', '-118.385242001852', '+13106459555', '5862 Arbor Vitae St', NULL, '2019-09-16 11:59:28', NULL),
(992, '90009', 'Los Angeles', 'Cafe Vietnam Truck', '33.95804', '-118.3898', '+19496789281', '', NULL, '2019-09-16 11:59:28', NULL),
(993, '90009', 'Los Angeles', 'Shakar Bakery', '33.9722213745117', '-118.375694274902', '+18183940222', NULL, NULL, '2019-09-16 11:59:28', NULL),
(994, '90009', 'Los Angeles', 'Two Chicks in the Mix', '33.98662', '-118.36492', '', NULL, NULL, '2019-09-16 11:59:28', NULL),
(995, '90009', 'Los Angeles', 'Lattes On Location', '33.9722213745117', '-118.375694274902', '+13107567420', '', NULL, '2019-09-16 11:59:28', NULL),
(996, '90009', 'Los Angeles', 'Cheesecake de Granger', '33.9516114', '-118.3875775', '+13107746701', '', NULL, '2019-09-16 11:59:28', NULL),
(997, '90009', 'Los Angeles', 'Ohana Hawiian Grindz', '33.95123', '-118.38516', '+17472328395', NULL, NULL, '2019-09-16 11:59:28', NULL),
(998, '90009', 'Los Angeles', 'Northside Bar & Deli', '33.9432602', '-118.4021606', '+13106465252', '599 World Way', NULL, '2019-09-16 11:59:28', NULL),
(999, '90010', 'Los Angeles', 'Slurpin\' Ramen Bar', '34.0573614429986', '-118.306769744705', '+12133888607', '3500 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(1000, '90010', 'Los Angeles', 'Hae Jang Chon Korean BBQ Restaurant', '34.0639032', '-118.3061281', '+12133898777', '3821 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1001, '90010', 'Los Angeles', 'Han Bat Sul Lung Tang', '34.065414', '-118.3095703125', '+12133839499', '4163 W 5th St', NULL, '2019-09-16 11:59:28', NULL),
(1002, '90010', 'Los Angeles', 'Monty\'s Good Burger', '34.06469', '-118.30876', '+12139150257', '516 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1003, '90010', 'Los Angeles', 'M Grill', '34.061358', '-118.310453', '+12133892770', '3832 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1004, '90010', 'Los Angeles', 'SomiSomi', '34.062880635935', '-118.309975725759', '+12135683284', '621 Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1005, '90010', 'Los Angeles', 'Kang Ho-dong Baekjeong', '34.0637349', '-118.2972751', '+12133849678', '3465 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1006, '90010', 'Los Angeles', 'Magal BBQ', '34.057544', '-118.305579846558', '+12133831909', '3460 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(1007, '90010', 'Los Angeles', 'BCD Tofu House', '34.0620862485445', '-118.302658449143', '+12133826677', '3575 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1008, '90010', 'Los Angeles', 'Yup Dduk La', '34.064009', '-118.3007013', '+12132632355', '3603 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1009, '90010', 'Los Angeles', 'Sul & Beans', '34.0629013806047', '-118.309997512967', '+12133855510', '621 Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1010, '90010', 'Los Angeles', 'Eight Korean BBQ', '34.0559926754254', '-118.309936813492', '+12133651750', '863 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1011, '90010', 'Los Angeles', 'EMC Seafood & Raw Bar', '34.063452', '-118.299046', '+12133519988', '3500 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1012, '90010', 'Los Angeles', 'Salt & Straw', '34.075825', '-118.3235051', '+13234660485', '240 N Larchmont Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1013, '90010', 'Los Angeles', 'Bulgogi Hut', '34.0615866318416', '-118.303241833066', '+12133881988', '3600 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1014, '90010', 'Los Angeles', 'Quarters Korean BBQ', '34.0640202245113', '-118.297687050455', '+12133658111', '3465 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1015, '90010', 'Los Angeles', 'Hae Ha Heng Thai Bistro', '34.06876', '-118.30948', '', '301 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1016, '90010', 'Los Angeles', 'Gol Tong Chicken', '34.0674543', '-118.3096191', '+12137166116', '361 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1017, '90010', 'Los Angeles', 'Ahgassi Gopchang', '34.0634067908259', '-118.30388175744', '+12132499678', '3744 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1018, '90010', 'Los Angeles', 'Ssam Korean BBQ', '34.0513648986816', '-118.308692932129', '+13237379292', '1040 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1039, '90011', 'Los Angeles', 'Bottega Louie', '34.0469300995766', '-118.256601457672', '+12138021470', '700 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1040, '90011', 'Los Angeles', 'Bestia', '34.03402', '-118.22919', '+12135145724', '2121 E 7th Pl', NULL, '2019-09-16 11:59:28', NULL),
(1041, '90011', 'Los Angeles', 'Wurstküche', '34.0456047058105', '-118.236061096191', '+12136874444', '800 E 3rd St', NULL, '2019-09-16 11:59:28', NULL),
(1042, '90011', 'Los Angeles', 'Dirt Dog', '34.0282923762355', '-118.275208244705', '+12137491813', '2528 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(1043, '90011', 'Los Angeles', 'Daikokuya Little Tokyo', '34.05008090944', '-118.2401804513', '+12136261680', '327 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1044, '90011', 'Los Angeles', 'Chichen Itza Restaurant', '34.01744', '-118.2783', '+12137411075', '3655 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1045, '90011', 'Los Angeles', 'Tire Shop Taqueria', '34.0097381464074', '-118.265285901725', '', '4069 S Avalon Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1046, '90011', 'Los Angeles', 'Perch', '34.04897', '-118.2514', '+12138021770', '448 S Hill St', NULL, '2019-09-16 11:59:28', NULL),
(1047, '90011', 'Los Angeles', 'Urth Caffé- Downtown LA', '34.041974', '-118.235426', '+12137974534', '451 S Hewitt St', NULL, '2019-09-16 11:59:28', NULL),
(1048, '90011', 'Los Angeles', 'Marugame Monzo', '34.050023', '-118.239935', '+12133469762', '329 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1049, '90011', 'Los Angeles', 'Sushi Gen', '34.0470000646326', '-118.238502456345', '+12136170552', '422 E 2nd St', NULL, '2019-09-16 11:59:28', NULL),
(1050, '90011', 'Los Angeles', 'KazuNori  | The Original Hand Roll Bar', '34.0476390576719', '-118.247747561303', '+12134936956', '421 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(1051, '90011', 'Los Angeles', 'Eggslut', '34.0505289', '-118.2486189', '+12136250292', '317 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1052, '90011', 'Los Angeles', 'Mex Perú Gipsy', '34.035217', '-118.25591', '+12137481773', '414 E 12th St', NULL, '2019-09-16 11:59:28', NULL),
(1053, '90011', 'Los Angeles', 'Tea Master Matcha Cafe & Green Tea Shop', '34.0471823589909', '-118.238639755523', '+12136801006', '450 E 2nd St', NULL, '2019-09-16 11:59:28', NULL),
(1054, '90011', 'Los Angeles', 'Natural History Museum', '34.016972', '-118.288768', '+12137633466', '900 Exposition Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1055, '90011', 'Los Angeles', 'California Science Center', '34.015789', '-118.286209', '+13237243623', '700 Exposition Park Dr', NULL, '2019-09-16 11:59:28', NULL),
(1056, '90011', 'Los Angeles', 'Figueroa Philly Cheese Steak', '34.014196', '-118.282417', '+12137489073', '3850 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(1057, '90011', 'Los Angeles', 'BROKEN MOUTH | Lee\'s Homestyle', '34.0404035', '-118.2535117', '+12134189588', '231 E 9th St', NULL, '2019-09-16 11:59:28', NULL),
(1058, '90011', 'Los Angeles', 'Jacks N Joe', '34.02876', '-118.27517', '+12137484565', '2498 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(1059, '90012', 'Los Angeles', 'Howlin\' Ray\'s', '34.061517', '-118.239716', '+12139358399', '727 N Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1060, '90012', 'Los Angeles', 'Philippe the Original', '34.0597229003906', '-118.237022399902', '+12136283781', '1001 N Alameda St', NULL, '2019-09-16 11:59:28', NULL),
(1061, '90012', 'Los Angeles', 'Daikokuya Little Tokyo', '34.05008090944', '-118.2401804513', '+12136261680', '327 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1062, '90012', 'Los Angeles', 'Bottega Louie', '34.0469300995766', '-118.256601457672', '+12138021470', '700 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1063, '90012', 'Los Angeles', 'Guisados', '34.0702395145121', '-118.250448424643', '+12132507600', '1261 W Sunset Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1064, '90012', 'Los Angeles', 'Marugame Monzo', '34.050023', '-118.239935', '+12133469762', '329 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1065, '90012', 'Los Angeles', 'Yang Chow', '34.06301', '-118.2384', '+12136250811', '819 N Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1066, '90012', 'Los Angeles', 'Little Jewel of New Orleans', '34.060099', '-118.238083', '+12136200461', '207 Ord St', NULL, '2019-09-16 11:59:28', NULL),
(1067, '90012', 'Los Angeles', 'Pho 87', '34.0672573', '-118.2356333', '+13232270758', '1019 N Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1068, '90012', 'Los Angeles', 'Eastside Market Italian Deli', '34.0650500417879', '-118.246493308503', '+12132502464', '1013 Alpine St', NULL, '2019-09-16 11:59:28', NULL),
(1069, '90012', 'Los Angeles', 'Eggslut', '34.0505289', '-118.2486189', '+12136250292', '317 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1070, '90012', 'Los Angeles', 'Masa of Echo Park', '34.077585', '-118.259599', '+12139891558', '1800 W Sunset Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1071, '90012', 'Los Angeles', 'Perch', '34.04897', '-118.2514', '+12138021770', '448 S Hill St', NULL, '2019-09-16 11:59:28', NULL),
(1072, '90012', 'Los Angeles', 'Sushi Gen', '34.0470000646326', '-118.238502456345', '+12136170552', '422 E 2nd St', NULL, '2019-09-16 11:59:28', NULL),
(1073, '90012', 'Los Angeles', 'The Broad', '34.054472', '-118.250557', '+12132326200', '221 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1074, '90012', 'Los Angeles', 'KazuNori  | The Original Hand Roll Bar', '34.0476390576719', '-118.247747561303', '+12134936956', '421 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(1075, '90012', 'Los Angeles', 'Tea Master Matcha Cafe & Green Tea Shop', '34.0471823589909', '-118.238639755523', '+12136801006', '450 E 2nd St', NULL, '2019-09-16 11:59:28', NULL),
(1076, '90012', 'Los Angeles', 'The Park\'s Finest', '34.0665313022035', '-118.254266053011', '+12134812800', '1267 W Temple St', NULL, '2019-09-16 11:59:28', NULL),
(1077, '90012', 'Los Angeles', 'Maccheroni Republic', '34.050039', '-118.248552', '+12133469725', '332 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1078, '90012', 'Los Angeles', 'Nick\'s Cafe', '34.066072', '-118.233223', '+13232221450', '1300 N Spring St', NULL, '2019-09-16 11:59:28', NULL),
(1079, '90013', 'Los Angeles', 'Wurstküche', '34.0456047058105', '-118.236061096191', '+12136874444', '800 E 3rd St', NULL, '2019-09-16 11:59:28', NULL),
(1080, '90013', 'Los Angeles', 'Daikokuya Little Tokyo', '34.05008090944', '-118.2401804513', '+12136261680', '327 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1081, '90013', 'Los Angeles', 'Sushi Gen', '34.0470000646326', '-118.238502456345', '+12136170552', '422 E 2nd St', NULL, '2019-09-16 11:59:28', NULL),
(1082, '90013', 'Los Angeles', 'Tea Master Matcha Cafe & Green Tea Shop', '34.0471823589909', '-118.238639755523', '+12136801006', '450 E 2nd St', NULL, '2019-09-16 11:59:28', NULL),
(1083, '90013', 'Los Angeles', 'Marugame Monzo', '34.050023', '-118.239935', '+12133469762', '329 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1084, '90013', 'Los Angeles', 'Urth Caffé- Downtown LA', '34.041974', '-118.235426', '+12137974534', '451 S Hewitt St', NULL, '2019-09-16 11:59:28', NULL),
(1085, '90013', 'Los Angeles', 'KazuNori  | The Original Hand Roll Bar', '34.0476390576719', '-118.247747561303', '+12134936956', '421 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(1086, '90013', 'Los Angeles', 'The Pie Hole', '34.0453201', '-118.2362393', '+12135370115', '714 Traction Ave', NULL, '2019-09-16 11:59:28', NULL),
(1087, '90013', 'Los Angeles', 'Shojin Downtown', '34.0443222', '-118.2382339', '+12136170305', '333 S Alameda St', NULL, '2019-09-16 11:59:28', NULL),
(1088, '90013', 'Los Angeles', 'Cafe Dulce', '34.048899', '-118.2397866', '+12133469910', '134 Japanese Village Plz', NULL, '2019-09-16 11:59:28', NULL),
(1089, '90013', 'Los Angeles', 'Shin-Sen-Gumi Hakata Ramen - Little Tokyo', '34.0484525', '-118.2390921', '+12136877108', '132 S Central Ave', NULL, '2019-09-16 11:59:28', NULL),
(1090, '90013', 'Los Angeles', 'Eggslut', '34.0505289', '-118.2486189', '+12136250292', '317 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1091, '90013', 'Los Angeles', 'Perch', '34.04897', '-118.2514', '+12138021770', '448 S Hill St', NULL, '2019-09-16 11:59:28', NULL),
(1092, '90013', 'Los Angeles', 'Komasa Sushi', '34.0484675', '-118.2402491', '+12136801792', '351 E 2nd St', NULL, '2019-09-16 11:59:28', NULL),
(1093, '90013', 'Los Angeles', 'Salt & Straw', '34.0459209829671', '-118.235575879235', '+12139887070', '829 E 3rd St', NULL, '2019-09-16 11:59:28', NULL),
(1094, '90013', 'Los Angeles', 'Bäco Mercat', '34.0477539', '-118.2473573', '+12136878808', '408 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(1095, '90013', 'Los Angeles', 'Sushi Enya', '34.049705', '-118.239652', '', '343 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1096, '90013', 'Los Angeles', 'Maccheroni Republic', '34.050039', '-118.248552', '+12133469725', '332 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1097, '90013', 'Los Angeles', 'Mikawaya', '34.0489170317053', '-118.239830732346', '+12136241681', '118 Japanese Village Plaza Mall', NULL, '2019-09-16 11:59:28', NULL),
(1098, '90013', 'Los Angeles', 'Bae', '34.04844', '-118.23987', '', '369 E 2nd St', NULL, '2019-09-16 11:59:28', NULL),
(1099, '90014', 'Los Angeles', 'Bottega Louie', '34.0469300995766', '-118.256601457672', '+12138021470', '700 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1100, '90014', 'Los Angeles', 'Perch', '34.04897', '-118.2514', '+12138021770', '448 S Hill St', NULL, '2019-09-16 11:59:28', NULL),
(1101, '90014', 'Los Angeles', 'KazuNori  | The Original Hand Roll Bar', '34.0476390576719', '-118.247747561303', '+12134936956', '421 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(1102, '90014', 'Los Angeles', 'Guisados DTLA', '34.0465305975394', '-118.250679851854', '+12136277656', '541 S Spring St', NULL, '2019-09-16 11:59:28', NULL),
(1103, '90014', 'Los Angeles', 'Eggslut', '34.0505289', '-118.2486189', '+12136250292', '317 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1104, '90014', 'Los Angeles', 'BROKEN MOUTH | Lee\'s Homestyle', '34.0404035', '-118.2535117', '+12134189588', '231 E 9th St', NULL, '2019-09-16 11:59:28', NULL),
(1105, '90014', 'Los Angeles', 'Poppy + Rose', '34.04067', '-118.2500946', '+12139957799', '765 Wall St', NULL, '2019-09-16 11:59:28', NULL),
(1106, '90014', 'Los Angeles', 'Daikokuya Little Tokyo', '34.05008090944', '-118.2401804513', '+12136261680', '327 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1107, '90014', 'Los Angeles', 'Maccheroni Republic', '34.050039', '-118.248552', '+12133469725', '332 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1108, '90014', 'Los Angeles', 'Bäco Mercat', '34.0477539', '-118.2473573', '+12136878808', '408 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(1109, '90014', 'Los Angeles', 'The Black Sheep', '34.0447654724121', '-118.249443054199', '+12136895022', '126 E 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1110, '90014', 'Los Angeles', 'Nickel Diner', '34.046219', '-118.248992', '+12136238301', '524 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(1111, '90014', 'Los Angeles', 'Gelateria Uli', '34.0466413015739', '-118.250713186508', '+12135370931', '541 S Spring St', NULL, '2019-09-16 11:59:28', NULL),
(1112, '90014', 'Los Angeles', 'SUGARFISH by sushi nozawa', '34.0473871154639', '-118.257194872353', '+12136273000', '600 W 7th St', NULL, '2019-09-16 11:59:28', NULL),
(1113, '90014', 'Los Angeles', 'Marugame Monzo', '34.050023', '-118.239935', '+12133469762', '329 E 1st St', NULL, '2019-09-16 11:59:28', NULL),
(1114, '90014', 'Los Angeles', 'Sonoratown', '34.0416441', '-118.2522657', '+12136283710', '208 E 8th St', NULL, '2019-09-16 11:59:28', NULL),
(1115, '90014', 'Los Angeles', 'Cole\'s French Dip', '34.044846', '-118.249564', '+12136224090', '118 E 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1116, '90014', 'Los Angeles', 'The Varnish', '34.044893158169', '-118.24979702707', '+12132657089', '118 E 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1117, '90014', 'Los Angeles', 'Grand Central Market', '34.0506285480471', '-118.248635262566', '+12136242378', '317 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1118, '90014', 'Los Angeles', 'Water Grill - Los Angeles', '34.0490371292754', '-118.254690932541', '+12138910900', '544 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1119, '90015', 'Los Angeles', 'Bottega Louie', '34.0469300995766', '-118.256601457672', '+12138021470', '700 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1120, '90015', 'Los Angeles', 'Perch', '34.04897', '-118.2514', '+12138021770', '448 S Hill St', NULL, '2019-09-16 11:59:28', NULL),
(1121, '90015', 'Los Angeles', 'Dirt Dog', '34.0282923762355', '-118.275208244705', '+12137491813', '2528 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(1122, '90015', 'Los Angeles', 'Langer\'s', '34.05609', '-118.27658', '+12134838050', '704 S Alvarado St', NULL, '2019-09-16 11:59:28', NULL),
(1123, '90015', 'Los Angeles', 'KazuNori  | The Original Hand Roll Bar', '34.0476390576719', '-118.247747561303', '+12134936956', '421 S Main St', NULL, '2019-09-16 11:59:28', NULL),
(1124, '90015', 'Los Angeles', 'Mex Perú Gipsy', '34.035217', '-118.25591', '+12137481773', '414 E 12th St', NULL, '2019-09-16 11:59:28', NULL),
(1125, '90015', 'Los Angeles', 'Eggslut', '34.0505289', '-118.2486189', '+12136250292', '317 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1126, '90015', 'Los Angeles', 'Birdies', '34.041836309712', '-118.259046916196', '+12135365720', '314 W Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1127, '90015', 'Los Angeles', 'BROKEN MOUTH | Lee\'s Homestyle', '34.0404035', '-118.2535117', '+12134189588', '231 E 9th St', NULL, '2019-09-16 11:59:28', NULL),
(1128, '90015', 'Los Angeles', 'SUGARFISH by sushi nozawa', '34.0473871154639', '-118.257194872353', '+12136273000', '600 W 7th St', NULL, '2019-09-16 11:59:28', NULL),
(1129, '90015', 'Los Angeles', 'Faith & Flower', '34.046195', '-118.261698', '+12132390642', '705 W 9th St', NULL, '2019-09-16 11:59:28', NULL),
(1130, '90015', 'Los Angeles', 'Philz Coffee', '34.0465343', '-118.2592814', '+12132132616', '801 S Hope St', NULL, '2019-09-16 11:59:28', NULL),
(1131, '90015', 'Los Angeles', 'Guisados DTLA', '34.0465305975394', '-118.250679851854', '+12136277656', '541 S Spring St', NULL, '2019-09-16 11:59:28', NULL),
(1132, '90015', 'Los Angeles', 'Maccheroni Republic', '34.050039', '-118.248552', '+12133469725', '332 S Broadway', NULL, '2019-09-16 11:59:28', NULL),
(1133, '90015', 'Los Angeles', 'Panini Kabob Grill', '34.0450795388029', '-118.260710767695', '+12134894200', '600 W 9th St', NULL, '2019-09-16 11:59:28', NULL),
(1134, '90015', 'Los Angeles', 'Poppy + Rose', '34.04067', '-118.2500946', '+12139957799', '765 Wall St', NULL, '2019-09-16 11:59:28', NULL),
(1135, '90015', 'Los Angeles', 'Original Pantry Cafe', '34.0464117322053', '-118.262845804944', '+12139729279', '877 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(1136, '90015', 'Los Angeles', 'Fleming\'s Prime Steakhouse & Wine Bar', '34.0446963342719', '-118.26536453203', '+12137459911', '800 W Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1137, '90015', 'Los Angeles', 'Yard House', '34.0449339896765', '-118.265804750686', '+12137459273', '800 W Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1138, '90015', 'Los Angeles', 'Colori Kitchen', '34.045168', '-118.256526', '+12136225950', '429 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(1139, '90016', 'Los Angeles', 'République', '34.06415', '-118.34367', '+13103626115', '624 S La Brea Ave', NULL, '2019-09-16 11:59:28', NULL),
(1140, '90016', 'Los Angeles', 'Leo\'s Tacos Truck', '34.046438', '-118.345718', '+13233462001', '1515 S La Brea Ave', NULL, '2019-09-16 11:59:28', NULL),
(1141, '90016', 'Los Angeles', 'Taqueria Los Anaya', '34.0327911', '-118.3417282', '+13237314070', '4651 W Adams Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1142, '90016', 'Los Angeles', 'Father\'s Office', '34.0304642240788', '-118.384695173189', '+13107362224', '3229 Helms Ave', NULL, '2019-09-16 11:59:28', NULL),
(1143, '90016', 'Los Angeles', 'Genwa Korean BBQ', '34.062321315088', '-118.340898970219', '+13235490760', '5115 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1144, '90016', 'Los Angeles', 'Roscoe\'s House of Chicken & Waffles', '34.0474472045898', '-118.346229553223', '+13239344405', '5006 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1145, '90016', 'Los Angeles', 'El Chato Taco Truck', '34.0571251', '-118.346074', '+13232026936', '5300 W Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1146, '90016', 'Los Angeles', 'SK Donuts & Croissant', '34.06895', '-118.34747', '+13239352409', '5850 W 3rd St', NULL, '2019-09-16 11:59:28', NULL),
(1147, '90016', 'Los Angeles', 'My Two Cents', '34.0498186', '-118.3596124', '+13238799881', '5583 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1148, '90016', 'Beverly Hills', 'Lawry\'s The Prime Rib - Beverly Hills', '34.0678344219814', '-118.376046', '+13106522827', '100 N La Cienega Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1149, '90016', 'Culver City', 'Baldwin Hills Scenic Overlook', '34.0176', '-118.384059', '', '6300 Hetzler Rd', NULL, '2019-09-16 11:59:28', NULL),
(1150, '90016', 'Los Angeles', 'A Food Affair', '34.051909', '-118.3843212', '+13105579795', '1513 S Robertson Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1151, '90016', 'Los Angeles', 'Milk Jar Cookies', '34.0621217190808', '-118.347790289087', '+13236349800', '5466 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1152, '90016', 'Los Angeles', 'Los Angeles County Museum of Art', '34.063931', '-118.35923', '+13238576000', '5905 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1153, '90016', 'Los Angeles', 'Powerplant Superfood Cafe', '34.050409', '-118.361676', '+13239652233', '5671 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1154, '90016', 'Los Angeles', 'Yuko Kitchen', '34.0621807', '-118.348153', '+13239334020', '5484 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1155, '90016', 'Beverly Hills', 'The Stinking Rose', '34.06642', '-118.37659', '+13106527673', '55 N La Cienega Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1156, '90016', 'Culver City', 'Coolhaus', '34.0302095984202', '-118.381282072168', '+13108385559', '8588 Washington Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1157, '90016', 'Los Angeles', 'Undergrind Cafe', '34.03734', '-118.38892', '+13107306392', '2713 S Robertson Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1158, '90016', 'Los Angeles', 'Met Her At A Bar', '34.0609448', '-118.3446759', '+13238475013', '759 S La Brea Ave', NULL, '2019-09-16 11:59:28', NULL),
(1159, '90017', 'Los Angeles', 'Bottega Louie', '34.0469300995766', '-118.256601457672', '+12138021470', '700 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1160, '90017', 'Los Angeles', 'Langer\'s', '34.05609', '-118.27658', '+12134838050', '704 S Alvarado St', NULL, '2019-09-16 11:59:28', NULL),
(1161, '90017', 'Los Angeles', 'Plan Check Kitchen & Bar', '34.052601', '-118.263447', '+12132217529', '1111 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1162, '90017', 'Los Angeles', 'SUGARFISH by sushi nozawa', '34.0473871154639', '-118.257194872353', '+12136273000', '600 W 7th St', NULL, '2019-09-16 11:59:28', NULL),
(1163, '90017', 'Los Angeles', 'Faith & Flower', '34.046195', '-118.261698', '+12132390642', '705 W 9th St', NULL, '2019-09-16 11:59:28', NULL),
(1164, '90017', 'Los Angeles', 'Mendocino Farms', '34.049318846845', '-118.260798042992', '+12134309040', '735 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(1165, '90017', 'Los Angeles', 'Philz Coffee', '34.0465343', '-118.2592814', '+12132132616', '801 S Hope St', NULL, '2019-09-16 11:59:28', NULL),
(1166, '90017', 'Los Angeles', 'Original Pantry Cafe', '34.0464117322053', '-118.262845804944', '+12139729279', '877 S Figueroa St', NULL, '2019-09-16 11:59:28', NULL),
(1167, '90017', 'Los Angeles', 'Water Grill - Los Angeles', '34.0490371292754', '-118.254690932541', '+12138910900', '544 S Grand Ave', NULL, '2019-09-16 11:59:28', NULL),
(1168, '90017', 'Los Angeles', 'Takami Sushi & Robata Restaurant', '34.0498199', '-118.25819', '+12132369600', '811 Wilshire Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1169, '90017', 'Los Angeles', 'Seven Grand', '34.047132', '-118.2558135', '+12136140736', '515 W 7th St', NULL, '2019-09-16 11:59:28', NULL),
(1170, '90017', 'Los Angeles', 'DRAGO Centro', '34.051017473398', '-118.257885974904', '+12132288998', '525 S Flower St', NULL, '2019-09-16 11:59:28', NULL),
(1171, '90017', 'Los Angeles', 'Panini Kabob Grill', '34.0450795388029', '-118.260710767695', '+12134894200', '600 W 9th St', NULL, '2019-09-16 11:59:28', NULL),
(1172, '90017', 'Los Angeles', 'Mendocino Farms', '34.05165', '-118.2552', '+12136273262', '444 S Flower St', NULL, '2019-09-16 11:59:28', NULL),
(1173, '90017', 'Los Angeles', 'Library Bar', '34.049497477234', '-118.256755477119', '+12136141900', '630 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1174, '90017', 'Los Angeles', 'Marie\'s Coffee & Deli', '34.0484021', '-118.2580705', '+12136225283', '731 W 7th St', NULL, '2019-09-16 11:59:28', NULL),
(1175, '90017', 'Los Angeles', 'Pacific Dining Car', '34.0553', '-118.26596', '+12134836000', '1310 W 6th St', NULL, '2019-09-16 11:59:28', NULL),
(1176, '90017', 'Los Angeles', '71 Above', '34.0511203', '-118.2543221', '+12137122683', '633 W 5th St', NULL, '2019-09-16 11:59:28', NULL),
(1177, '90017', 'Los Angeles', 'Colori Kitchen', '34.045168', '-118.256526', '+12136225950', '429 W 8th St', NULL, '2019-09-16 11:59:28', NULL),
(1178, '90017', 'Los Angeles', 'Yard House', '34.0449339896765', '-118.265804750686', '+12137459273', '800 W Olympic Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1179, '90018', 'Los Angeles', 'Pasta Sisters', '34.0476', '-118.317234', '+13238705271', '3343 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1180, '90018', 'Los Angeles', 'Road To Seoul', '34.04847', '-118.30867', '+13237319292', '1230 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1181, '90018', 'Los Angeles', 'Papa Cristo\'s', '34.0474029033579', '-118.299641746033', '+13237372970', '2771 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1182, '90018', 'Los Angeles', 'Revolutionario: North African Tacos', '34.02523', '-118.29857', '+14242233526', '1436 W Jefferson Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1183, '90018', 'Los Angeles', 'Taqueria Los Anaya', '34.0327911', '-118.3417282', '+13237314070', '4651 W Adams Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1184, '90018', 'Los Angeles', 'Gus\'s World Famous Fried Chicken', '34.0481071472168', '-118.326278686523', '+13234020232', '1262 Crenshaw Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1185, '90018', 'Los Angeles', 'The Grain Cafe', '34.04762', '-118.32758', '+13239314034', '4222 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1186, '90018', 'Los Angeles', 'Dino\'s Chicken and Burgers', '34.047441', '-118.293926', '+12133803554', '2575 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1187, '90018', 'Los Angeles', 'La Cevicheria', '34.04768', '-118.32254', '+13237321253', '3809 W Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1188, '90018', 'Los Angeles', 'Earle\'s On Crenshaw', '34.0156233070285', '-118.334755915362', '+13232992867', '3864 Crenshaw Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1189, '90018', 'Los Angeles', 'Ignatius Cafe', '34.031914', '-118.293154', '', '1451 Dana St', NULL, '2019-09-16 11:59:28', NULL),
(1190, '90018', 'Los Angeles', 'Mateo\'s Ice Cream & Fruit Bars', '34.0475632532972', '-118.327980390877', '+13239315500', '4234 Pico Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1191, '90018', 'Los Angeles', 'Harold & Belle\'s', '34.0254551', '-118.327966', '+13237359918', '2920 W Jefferson Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1192, '90018', 'Los Angeles', 'Peace Awareness Labyrinth & Gardens', '34.0318', '-118.3226', '+13237374055', '3500 W Adams Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1193, '90018', 'Los Angeles', 'HaSunSaeng - MasterHA', '34.0497189', '-118.3091849', '+13239980427', '1147 S Western Ave', NULL, '2019-09-16 11:59:28', NULL),
(1194, '90018', 'Los Angeles', 'Papi Tacos & Churros', '34.02531', '-118.32445', '+13233739671', '2622 W Jefferson Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1195, '90018', 'Los Angeles', 'Blu Elefant Cafe', '34.0397656487423', '-118.30389931798', '+13236410466', '2024 W Washington Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1196, '90018', 'Los Angeles', 'Phillips Barbecue', '34.03191', '-118.3352549', '+13237314772', '2619 Crenshaw Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1197, '90018', 'Los Angeles', 'Natraliart Jamaican Restaurant & Market', '34.03955', '-118.32226', '+13237379277', '3426 W Washington Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1198, '90018', 'Los Angeles', 'Himalayan House', '34.0256549', '-118.294352', '+13237669775', '1277 W Jefferson Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1199, '90018', 'Los Angeles', 'Himalayan House', '34.0256549', '-118.294352', '+13237669775', '1277 W Jefferson Blvd', NULL, '2019-09-16 11:59:28', NULL),
(1200, '90018', 'Los Angeles', 'Himalayan House', '34.0256549', '-118.294352', '+13237669775', '1277 W Jefferson Blvd', NULL, '2019-09-16 11:59:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `yelp_test`
--

CREATE TABLE `yelp_test` (
  `id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `yelp_test`
--

INSERT INTO `yelp_test` (`id`, `location`, `city`, `business_name`, `latitude`, `longitude`, `phone`, `address`) VALUES
(1, '90001', 'Los Angeles', 'The Grilled Cheese Truck', '33.97908', '-118.25009', '+18183451875', ''),
(2, '90001', 'Huntington Park', 'Rays Texas BBQ', '33.986598', '-118.229803', '', '6038 Santa Fe Ave'),
(3, '90001', 'Los Angeles', 'Tokyo Doggie Style', '33.9788284301758', '-118.249931335449', '', ''),
(4, '90001', 'Huntington Park', 'Avila\'s El Ranchito Mexican Restaurant', '33.978496', '-118.230545', '+13235855055', '6703 Santa Fe Ave'),
(5, '90001', 'Huntington Park', 'The Los Angeles Banh Mi Company', '33.9746224', '-118.2280264', '+13235531710', '2479 E Florence Ave'),
(6, '90001', 'Huntington Park', 'Nina\'s Cafe', '33.98179', '-118.21985', '+13234849803', '2805 E Gage Ave'),
(7, '90001', 'Los Angeles', 'Teddy\'s Red Tacos', '33.9894829', '-118.262014', '+13234959654', '731 East Slauson Ave'),
(8, '90001', 'Los Angeles', 'California Science Center', '34.015789', '-118.286209', '+13237243623', '700 Exposition Park Dr'),
(9, '90001', 'Los Angeles', 'Figueroa Philly Cheese Steak', '34.014196', '-118.282417', '+12137489073', '3850 S Figueroa St'),
(10, '90001', 'Los Angeles', 'Birrieria Jalisco', '33.96956', '-118.24735', '+13235839322', '7714 Compton Ave'),
(11, '90001', 'Los Angeles', 'Tire Shop Taqueria', '34.0097381464074', '-118.265285901725', '', '4069 S Avalon Blvd'),
(12, '90001', 'Huntington Park', 'Las Molenderas Restaurant', '33.981824', '-118.224245', '+13235831933', '2635 Gage Ave'),
(13, '90001', 'Los Angeles', 'Tacos y Birria La Unica', '34.02252', '-118.21658', '+13237154025', '2840 E Olympic Blvd'),
(14, '90001', 'Los Angeles', 'Tacos Los Poblanos', '33.9891021960076', '-118.265354705316', '+13237436639', '5821 Avalon Blvd'),
(15, '90001', 'South Gate', 'El Cielito Cafe', '33.96547', '-118.22551', '+13234849944', '8015 Long Beach Blvd'),
(16, '90001', 'South Gate', 'Meat Bowl', '33.9642198107267', '-118.224787135968', '+13235819623', '8122 Long Beach Blvd'),
(17, '90001', 'Bell', 'Restaurant Mole de Los Reyes', '33.9816589', '-118.2024231', '+13235885536', '6242 Maywood Ave'),
(18, '90001', 'Huntington Park', 'Thirty5 Degrees', '33.9915383018662', '-118.224742852699', '+13235891354', '5610 Pacific Blvd'),
(19, '90001', 'Los Angeles', 'Lettuce Feast', '33.97853', '-118.2497', '+14242613659', NULL),
(20, '90001', 'Los Angeles', 'Space Shuttle Endeavour', '34.0162101142984', '-118.287373578712', '+13237243623', '700 Exposition Park Dr'),
(21, '90002', 'Los Angeles', 'Hawkins House of Burgers', '33.9292549', '-118.2522808', '+13235631129', '11603 Slater St'),
(22, '90002', 'Lynwood', 'Balam Mexican Kitchen', '33.9221976552512', '-118.209478348335', '+14243386762', '11700 Long Beach Blvd'),
(23, '90002', 'Los Angeles', 'Watts Coffee House', '33.943472', '-118.239854', '+13232494343', '1827 E 103rd St'),
(24, '90002', 'Huntington Park', 'Rays Texas BBQ', '33.986598', '-118.229803', '', '6038 Santa Fe Ave'),
(25, '90002', 'Los Angeles', 'The Grilled Cheese Truck', '33.97908', '-118.25009', '+18183451875', ''),
(26, '90002', 'Huntington Park', 'Nina\'s Cafe', '33.98179', '-118.21985', '+13234849803', '2805 E Gage Ave'),
(27, '90002', 'Huntington Park', 'Avila\'s El Ranchito Mexican Restaurant', '33.978496', '-118.230545', '+13235855055', '6703 Santa Fe Ave'),
(28, '90002', 'Los Angeles', 'Tokyo Doggie Style', '33.9788284301758', '-118.249931335449', '', ''),
(29, '90002', 'Huntington Park', 'The Los Angeles Banh Mi Company', '33.9746224', '-118.2280264', '+13235531710', '2479 E Florence Ave'),
(30, '90002', 'South Gate', 'Meat Bowl', '33.9642198107267', '-118.224787135968', '+13235819623', '8122 Long Beach Blvd'),
(31, '90002', 'South Gate', 'El Cielito Cafe', '33.96547', '-118.22551', '+13234849944', '8015 Long Beach Blvd'),
(32, '90002', 'Bell', 'Restaurant Mole de Los Reyes', '33.9816589', '-118.2024231', '+13235885536', '6242 Maywood Ave'),
(33, '90002', 'Los Angeles', 'Tacos y Birria La Unica', '34.02252', '-118.21658', '+13237154025', '2840 E Olympic Blvd'),
(34, '90002', 'Huntington Park', 'Cruzita\'s Deli and Cafe', '33.9733796', '-118.2098306', '+13238356175', '7121 State St'),
(35, '90002', 'Los Angeles', 'Teddy\'s Red Tacos', '33.9894829', '-118.262014', '+13234959654', '731 East Slauson Ave'),
(36, '90002', 'Los Angeles', 'Cafe Oaxaca', '33.9457849', '-118.2537301', '+13232490292', '1211 E Century Blvd'),
(37, '90002', 'Bell', 'La Casita Mexicana', '33.9786', '-118.19515', '+13237731898', '4030 E Gage Ave'),
(38, '90002', 'Los Angeles', 'All Flavor No Grease', '33.93804', '-118.26194', '+13233180409', '728 E 108th St'),
(39, '90002', 'Los Angeles', 'Roscoe\'s House of Chicken & Waffles', '33.9599', '-118.27421', '+13237526211', '106 W Manchester Ave'),
(40, '90002', 'Los Angeles', 'The Lobos Truck', '34.0583969', '-118.1912081', '+14242358562', NULL),
(41, '90003', 'Los Angeles', 'Roscoe\'s House of Chicken & Waffles', '33.9599', '-118.27421', '+13237526211', '106 W Manchester Ave'),
(42, '90003', 'Los Angeles', 'Hawkins House of Burgers', '33.9292549', '-118.2522808', '+13235631129', '11603 Slater St'),
(43, '90003', 'Los Angeles', 'Teddy\'s Red Tacos', '33.9894829', '-118.262014', '+13234959654', '731 East Slauson Ave'),
(44, '90003', 'Huntington Park', 'Rays Texas BBQ', '33.986598', '-118.229803', '', '6038 Santa Fe Ave'),
(45, '90003', 'Los Angeles', 'The Grilled Cheese Truck', '33.97908', '-118.25009', '+18183451875', ''),
(46, '90003', 'Huntington Park', 'Avila\'s El Ranchito Mexican Restaurant', '33.978496', '-118.230545', '+13235855055', '6703 Santa Fe Ave'),
(47, '90003', 'Los Angeles', 'El Tacorin', '33.96454', '-118.27863', '+13237782818', '8215 S Broadway'),
(48, '90003', 'Los Angeles', 'Tokyo Doggie Style', '33.9788284301758', '-118.249931335449', '', ''),
(49, '90003', 'Los Angeles', 'Tacos Los Poblanos', '33.9891021960076', '-118.265354705316', '+13237436639', '5821 Avalon Blvd'),
(50, '90003', 'Huntington Park', 'The Los Angeles Banh Mi Company', '33.9746224', '-118.2280264', '+13235531710', '2479 E Florence Ave'),
(51, '90003', 'Los Angeles', 'Taqueria Tijuana', '33.974841', '-118.277428', '+13237501719', '241 W Florence Ave'),
(52, '90003', 'Los Angeles', 'Cobblermania', '33.96341', '-118.30862', '+13233164793', '8300 S Western Ave'),
(53, '90003', 'Los Angeles', 'Casa Noodle Teriyaki', '33.98642', '-118.27357', '+13232328200', '5930 S Main St'),
(54, '90003', 'Los Angeles', 'Granny\'s Kitchen', '33.9930975470943', '-118.256304330019', '+13232312141', '5440 S Central Ave'),
(55, '90003', 'Los Angeles', 'The Burger Palace', '33.9599551', '-118.2737099', '+13237504507', '100 E Manchester Ave'),
(56, '90003', 'South Gate', 'El Cielito Cafe', '33.96547', '-118.22551', '+13234849944', '8015 Long Beach Blvd'),
(57, '90003', 'South Gate', 'Meat Bowl', '33.9642198107267', '-118.224787135968', '+13235819623', '8122 Long Beach Blvd'),
(58, '90003', 'Huntington Park', 'Las Molenderas Restaurant', '33.981824', '-118.224245', '+13235831933', '2635 Gage Ave'),
(59, '90003', 'Huntington Park', 'Thirty5 Degrees', '33.9915383018662', '-118.224742852699', '+13235891354', '5610 Pacific Blvd'),
(60, '90003', 'Los Angeles', 'Birrieria Jalisco', '33.96956', '-118.24735', '+13235839322', '7714 Compton Ave'),
(61, '90004', 'Los Angeles', 'Kang Ho-dong Baekjeong', '34.0637349', '-118.2972751', '+12133849678', '3465 W 6th St'),
(62, '90004', 'Los Angeles', 'Hae Jang Chon Korean BBQ Restaurant', '34.0639032', '-118.3061281', '+12133898777', '3821 W 6th St'),
(63, '90004', 'Los Angeles', 'Salt & Straw', '34.075825', '-118.3235051', '+13234660485', '240 N Larchmont Blvd'),
(64, '90004', 'Los Angeles', 'Slurpin\' Ramen Bar', '34.0573614429986', '-118.306769744705', '+12133888607', '3500 W 8th St'),
(65, '90004', 'Los Angeles', 'Han Bat Sul Lung Tang', '34.065414', '-118.3095703125', '+12133839499', '4163 W 5th St'),
(66, '90004', 'Los Angeles', 'Dave\'s Hot Chicken', '34.0880681', '-118.308962', '+13235369711', '970 N Western Ave'),
(67, '90004', 'Los Angeles', 'Yup Dduk La', '34.064009', '-118.3007013', '+12132632355', '3603 W 6th St'),
(68, '90004', 'Los Angeles', 'Providence', '34.083628', '-118.330168', '+13234604170', '5955 Melrose Ave'),
(69, '90004', 'Los Angeles', 'Monty\'s Good Burger', '34.06469', '-118.30876', '+12139150257', '516 S Western Ave'),
(70, '90004', 'Los Angeles', 'BCD Tofu House', '34.0620862485445', '-118.302658449143', '+12133826677', '3575 Wilshire Blvd'),
(71, '90004', 'Los Angeles', 'EMC Seafood & Raw Bar', '34.063452', '-118.299046', '+12133519988', '3500 W 6th St'),
(72, '90004', 'Los Angeles', 'The Bun Shop', '34.0740309655666', '-118.309187963605', '+13234681031', '151 N Western Ave'),
(73, '90004', 'Los Angeles', 'Quarters Korean BBQ', '34.0640202245113', '-118.297687050455', '+12133658111', '3465 W 6th St'),
(74, '90004', 'Los Angeles', 'Magal BBQ', '34.057544', '-118.305579846558', '+12133831909', '3460 W 8th St'),
(75, '90004', 'Los Angeles', 'SomiSomi', '34.062880635935', '-118.309975725759', '+12135683284', '621 Western Ave'),
(76, '90004', 'Los Angeles', 'M Grill', '34.061358', '-118.310453', '+12133892770', '3832 Wilshire Blvd'),
(77, '90004', 'Los Angeles', 'Osteria La Buca', '34.0833366755519', '-118.31393718099', '+13234621900', '5210 Melrose Ave'),
(78, '90004', 'Los Angeles', 'Hae Ha Heng Thai Bistro', '34.06876', '-118.30948', '', '301 S Western Ave'),
(79, '90004', 'Los Angeles', 'Genwa Korean BBQ', '34.062321315088', '-118.340898970219', '+13235490760', '5115 Wilshire Blvd'),
(80, '90004', 'Los Angeles', 'Bulgogi Hut', '34.0615866318416', '-118.303241833066', '+12133881988', '3600 Wilshire Blvd');

-- --------------------------------------------------------

--
-- Table structure for table `yelp_url`
--

CREATE TABLE `yelp_url` (
  `id` int(255) NOT NULL,
  `key` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `yelp_url`
--

INSERT INTO `yelp_url` (`id`, `key`, `url`) VALUES
(1, 'iLJyFLlgCPav_xnH9IIMs0Cu6vI6-dUzaIAnxktK_SJeWSSLgXzMCItZeu2-wBhU0dvvJh5yTS8A5K38WJiRmiqklRbliISnywUjzn7dWQvmFoHdP_1wAVxMG6pRXXYx', 'https://api.yelp.com/v3/businesses/search');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_members`
--
ALTER TABLE `add_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crawls`
--
ALTER TABLE `crawls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsor_package`
--
ALTER TABLE `sponsor_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsor_package_option`
--
ALTER TABLE `sponsor_package_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sponsor_payment`
--
ALTER TABLE `sponsor_payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `created_at` (`id`,`grouptype`);

--
-- Indexes for table `teams_package`
--
ALTER TABLE `teams_package`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trip_url`
--
ALTER TABLE `trip_url`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `yelp_address`
--
ALTER TABLE `yelp_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yelp_test`
--
ALTER TABLE `yelp_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yelp_url`
--
ALTER TABLE `yelp_url`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_members`
--
ALTER TABLE `add_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crawls`
--
ALTER TABLE `crawls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2308;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `sponsor_package`
--
ALTER TABLE `sponsor_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sponsor_package_option`
--
ALTER TABLE `sponsor_package_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sponsor_payment`
--
ALTER TABLE `sponsor_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT for table `teams_package`
--
ALTER TABLE `teams_package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trip_url`
--
ALTER TABLE `trip_url`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `yelp_address`
--
ALTER TABLE `yelp_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1201;

--
-- AUTO_INCREMENT for table `yelp_test`
--
ALTER TABLE `yelp_test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `yelp_url`
--
ALTER TABLE `yelp_url`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
