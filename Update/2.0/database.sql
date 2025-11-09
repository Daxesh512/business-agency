-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2024 at 03:44 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `finbiz_empty`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@example.com', 'admin', NULL, '65e99820d987b1709807648.png', '$2y$10$ZOWPSwbB7098UQHq/GZX5uGq43wfuDDjMBNASktSNK55T/4jC/xvy', 'lv3Cki4tuTdowaJgjYCVGKxOBKwzjAcabl3xymToxLyOnXkkgXp4pyeTJSlM', NULL, '2024-03-07 08:04:09');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trx` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `plan_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Live Chat(Tawk.to)', 'Key location is shown bellow', 'chat-png.png', '<script>\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\n                        (function(){\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\n                        s1.async=true;\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\n                        s1.charset=\"UTF-8\";\n                        s1.setAttribute(\"crossorigin\",\"*\");\n                        s0.parentNode.insertBefore(s1,s0);\n                        })();\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2023-04-03 01:49:14'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha2.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2022-05-08 04:01:36'),
(7, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\n                <script>\n                  window.dataLayer = window.dataLayer || [];\n                  function gtag(){dataLayer.push(arguments);}\n                  gtag(\"js\", new Date());\n                \n                  gtag(\"config\", \"{{app_key}}\");\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"G-JGB5GZ3G69\"}}', 'ganalytics.png', 0, NULL, '2019-10-18 23:16:05', '2024-02-27 07:14:13');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"website\",\"services\",\"agency\",\"corporate\",\"subscriptions\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"Minstack Limited\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"64429bcdb16aa1682086861.jpg\"}', '2020-07-04 23:42:52', '2023-04-21 11:51:01'),
(24, 'about.content', '{\"has_image\":\"1\",\"top_heading\":\"About Us\",\"heading\":\"What\'s So Special About Agency?\",\"description\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75% of the worldwide telecom limit.\\r\\n\\r\\nDispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75%.\",\"experience\":\"15\",\"about_image_1\":\"643517f4c3e7e1681201140.jpg\",\"about_image_2\":\"643517f4ce5f61681201140.png\"}', '2020-10-28 00:51:20', '2024-02-24 04:44:07'),
(25, 'blog.content', '{\"top_heading\":\"Blog\",\"heading\":\"Latest News\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age just 10 nations have facilitated .\"}', '2020-10-28 00:51:34', '2023-03-28 06:31:48'),
(26, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Photoshop Create Path From Image.\",\"description\":\"<p>This is a Blog Post<strong>Lorem Ipsum<\\/strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><p>\\u00a0<\\/p><h3>Why do we use it?<\\/h3><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><p>\\u00a0<\\/p><h3>Where does it come from?<\\/h3><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p>\",\"blog_image\":\"6422b22586f7a1679995429.jpg\"}', '2020-10-28 00:57:19', '2024-03-05 06:23:03'),
(27, 'contact_us.content', '{\"has_image\":\"1\",\"title\":\"Contact Us\",\"short_description\":\"Let\'s make something great together. We are trusted by over 5000+ clients. Join them by using our services and grow your business.\",\"email_address\":\"admin@test.com\",\"contact_details\":\"15205 North Kierland Blvd\",\"contact_number\":\"5657647672\",\"latitude\":\"52.5069386\",\"longitude\":\"13.2599276\",\"website_footer\":\"<p>Copyright 2024. All rights reserved.<\\/p>\",\"contact_image\":\"643bca29c29ed1681639977.jpg\",\"theme_four_contact_image\":\"65e6b703508551709618947.png\",\"theme_five_contact_image\":\"65e86c36cb5f61709730870.png\"}', '2020-10-28 00:59:19', '2024-03-06 10:44:31'),
(28, 'counter.content', '{\"top_heading\":\"Our Experience\",\"heading\":\"A Proven 10-Year History Of Success In Web Development Technology\"}', '2020-10-28 01:04:02', '2023-03-28 00:54:40'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', '2020-11-12 04:07:30', '2023-03-27 05:30:25'),
(33, 'feature.content', '{\"heading\":\"asdf\",\"sub_heading\":\"asdf\"}', '2021-01-03 23:40:54', '2021-01-03 23:40:55'),
(34, 'feature.element', '{\"title\":\"asdf\",\"description\":\"asdf\",\"feature_icon\":\"asdf\"}', '2021-01-03 23:41:02', '2021-01-03 23:41:02'),
(35, 'service.element', '{\"service_icon\":\"<i class=\\\"fas fa-desktop\\\"><\\/i>\",\"title\":\"Mobile Developments\",\"description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus odit beatae illo labore harum eaque neque quasi a similique qui!\",\"service_btn\":\"Read More\"}', '2021-03-06 01:12:10', '2023-03-27 07:25:03'),
(36, 'service.content', '{\"top_heading\":\"What We Do\",\"heading\":\"Our Creative Services\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age just 10 nations have facilitated .\"}', '2021-03-06 01:27:34', '2023-03-27 07:23:15'),
(39, 'banner.content', '{\"has_image\":\"1\",\"top_heading\":\"A trusted Digital agency\",\"heading\":\"WELCOME TO CREATIVE DIGITAL AGENCY\",\"sub_heading\":\"Transform your ideas into reality with our expert software development services. From concept to deployment, we deliver custom solutions that meet your unique business needs.\",\"banner_btn_1\":\"Get Started\",\"banner_btn_2\":\"Contact Us\",\"banner_image\":\"64351ff45a3851681203188.png\"}', '2021-05-02 06:09:30', '2023-04-11 06:23:08'),
(41, 'cookie.data', '{\"short_desc\":\"We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \\\"Accept\\\", you consent to our use of cookies.\",\"description\":\"<h4>GDPR, cookies, and compliance&nbsp;<\\/h4><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p><ul><li>Natus error sit voluptatem accusantium doloremque<\\/li><li>Architecto beatae accusantium doloremque<\\/li><li>Voluptatem accusantium doloremque<\\/li><li>Sed quia consequuntur magni doloremque<\\/li><\\/ul><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est. natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p><p>&nbsp;<\\/p><p>consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est. natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p>\",\"status\":0}', '2020-07-04 23:42:52', '2023-04-24 07:29:49'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h4><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h4><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?di consequatur<\\/p><p>\\u00a0<\\/p><h4><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h4><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h4><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h4><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p>\"}', '2021-06-09 08:50:42', '2024-02-26 03:02:39'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<h4><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h4><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?di consequatur<\\/p><p>\\u00a0<\\/p><h4><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h4><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h4><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h4><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p>\"}', '2021-06-09 08:51:18', '2024-02-26 03:03:03'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', '2020-07-04 23:42:52', '2022-05-11 03:57:17'),
(45, 'feature.element', '{\"title\":\"sytry\",\"description\":\"ertyerty\",\"feature_icon\":\"<i class=\\\"fas fa-address-book\\\"><\\/i>\"}', '2022-10-17 10:23:22', '2022-10-17 10:23:22'),
(46, 'feature.element', '{\"title\":\"sytry\",\"description\":\"ertyerty\",\"feature_icon\":\"<i class=\\\"fas fa-address-book\\\"><\\/i>\"}', '2022-10-17 10:23:22', '2022-10-17 10:23:22'),
(51, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Color match perfectly to impress your customers\",\"description\":\"<p><strong>Lorem Ipsum<\\/strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><p>\\u00a0<\\/p><h3>Why do we use it?<\\/h3><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><p>\\u00a0<\\/p><h3>Where does it come from?<\\/h3><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p>\",\"blog_image\":\"6423d54ec0f671680069966.jpg\"}', '2023-03-21 08:45:08', '2023-04-13 01:45:39'),
(53, 'faq.content', '{\"has_image\":\"1\",\"top_heading\":\"FAQ\",\"heading\":\"Frequently Asked Question.\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age just 10 nations have facilitated .\",\"faq_image\":\"6435197486d9a1681201524.jpg\"}', '2023-03-22 08:21:28', '2023-04-11 05:55:24'),
(54, 'faq.element', '{\"question\":\"4. Custom software development services ?\",\"answer\":\"<p>\\u00a0 Yes, we offer custom software development services tailored to the specific needs of our clients. We work closely with our clients to understand their requirements and develop solutions that meet their unique needs.<\\/p>\"}', '2023-03-22 08:21:35', '2023-03-29 03:52:55'),
(56, 'social_icon.element', '{\"title\":\"Twitter\",\"social_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/twitter.com\\/i\\/flow\\/login\"}', '2023-03-27 05:30:56', '2023-03-27 05:30:56'),
(57, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', '2023-03-27 05:31:32', '2023-03-27 05:31:32'),
(58, 'social_icon.element', '{\"title\":\"LinkedIn\",\"social_icon\":\"<i class=\\\"fab fa-linkedin\\\"><\\/i>\",\"url\":\"https:\\/\\/www.linkedin.com\\/\"}', '2023-03-27 05:32:17', '2023-03-27 05:32:17'),
(59, 'about.element', '{\"content_list\":\"Clients Focused\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla incidunt quo\"}', '2023-03-27 06:48:37', '2023-04-11 05:58:51'),
(60, 'about.element', '{\"content_list\":\"After Sales support.\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla incidunt quo\"}', '2023-03-27 06:48:43', '2023-04-11 05:59:26'),
(61, 'about.element', '{\"content_list\":\"We Can Save Your Money.\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla incidunt quo\"}', '2023-03-27 06:48:50', '2023-04-11 05:59:35'),
(62, 'service.element', '{\"service_icon\":\"<i class=\\\"fas fa-mobile-alt\\\"><\\/i>\",\"title\":\"Product Managements\",\"description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus odit beatae illo labore harum eaque neque quasi a similique qui!\",\"service_btn\":\"Read More\"}', '2023-03-27 07:25:57', '2023-03-27 07:25:57'),
(63, 'service.element', '{\"service_icon\":\"<i class=\\\"fas fa-pen-nib\\\"><\\/i>\",\"title\":\"UI\\/UX Design\",\"description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus odit beatae illo labore harum eaque neque quasi a similique qui!\",\"service_btn\":\"Read More\"}', '2023-03-27 07:26:30', '2023-03-27 07:26:30'),
(64, 'service.element', '{\"service_icon\":\"<i class=\\\"fas fa-laptop\\\"><\\/i>\",\"title\":\"Social Marketing\",\"description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus odit beatae illo labore harum eaque neque quasi a similique qui!\",\"service_btn\":\"Read More\"}', '2023-03-27 07:27:19', '2023-03-27 07:27:19'),
(65, 'service.element', '{\"service_icon\":\"<i class=\\\"fas fa-landmark\\\"><\\/i>\",\"title\":\"Digital Marketing\",\"description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus odit beatae illo labore harum eaque neque quasi a similique qui!\",\"service_btn\":\"Read More\"}', '2023-03-27 07:28:10', '2023-03-27 07:28:10'),
(66, 'service.element', '{\"service_icon\":\"<i class=\\\"fas fa-headset\\\"><\\/i>\",\"title\":\"Content Writing\",\"description\":\"Lorem ipsum dolor sit, amet consectetur adipisicing elit. Accusamus odit beatae illo labore harum eaque neque quasi a similique qui!\",\"service_btn\":\"Read More\"}', '2023-03-27 07:28:37', '2023-03-27 07:28:37'),
(67, 'choose_us.content', '{\"has_image\":\"1\",\"top_heading\":\"Why Choose Us\",\"heading\":\"Our Digital Agency Delivers Extraordinary Business Value.\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75% of the worldwide telecom limit.\",\"top_heading_2\":\"Experienced digital agency in Rejon. Innovative solutions for business success.\",\"sub_heading_2\":\"Rather than focusing solely on technology platforms, it is important to also prioritize leadership skills and the seamless integration of wireless bandwidth to achieve optimal results. This approach allows for efficient and effective communication without any obstacles or barriers.\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=LXb3EKWsInQ\",\"choose_image\":\"643518fa1c34c1681201402.png\"}', '2023-03-27 07:45:16', '2023-04-11 05:53:22'),
(68, 'choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Fresh Business Thinking\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-03-27 07:55:53', '2023-03-27 07:55:53'),
(69, 'choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Risk-Free Satisfaction\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-03-27 07:56:15', '2023-03-27 07:56:15'),
(70, 'choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"24\\/7 Helpdesk Availability\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-03-27 07:56:39', '2023-03-27 07:56:39'),
(71, 'counter.element', '{\"title\":\"Themes\",\"counter_digit\":\"30\"}', '2023-03-28 00:55:16', '2023-03-28 00:55:16'),
(72, 'counter.element', '{\"title\":\"Projects\",\"counter_digit\":\"500\"}', '2023-03-28 00:55:31', '2023-03-28 00:55:31'),
(73, 'counter.element', '{\"title\":\"UI\\/UX Designs\",\"counter_digit\":\"400\"}', '2023-03-28 00:55:56', '2023-03-28 00:55:56'),
(74, 'counter.element', '{\"title\":\"Clients\",\"counter_digit\":\"90\"}', '2023-03-28 00:56:07', '2023-03-28 00:56:07'),
(75, 'plan.content', '{\"top_heading\":\"Our Pricing Plan\",\"heading\":\"Pricing We\'re Offering\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age just 10 nations have facilitated .\"}', '2023-03-28 00:58:41', '2023-03-28 00:58:41'),
(76, 'portfolio.content', '{\"top_heading\":\"Our Portfolio\",\"heading\":\"Let\\u2019s See Our Best Work\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75% of the worldwide telecom limit.\"}', '2023-03-28 01:18:17', '2023-03-28 01:37:00'),
(82, 'team_member.content', '{\"top_heading\":\"Our Team Member\",\"heading\":\"Meet Our Team\",\"subheading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age just 10 nations have facilitated .\"}', '2023-03-28 02:01:43', '2023-03-28 02:01:43'),
(83, 'team_member.element', '{\"has_image\":\"1\",\"title\":\"Leslie Alexander\",\"email\":\"lesliealexander@gmail.com\",\"description\":\"HR Manager\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"agent_image\":\"64226e6bb53f61679978091.png\"}', '2023-03-28 02:04:51', '2023-03-28 02:04:51'),
(84, 'team_member.element', '{\"has_image\":\"1\",\"title\":\"John Doe\",\"email\":\"john@gmail.com\",\"description\":\"Senior Developer\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"agent_image\":\"64226ec84dddc1679978184.png\"}', '2023-03-28 02:06:24', '2023-03-28 02:06:24'),
(85, 'team_member.element', '{\"has_image\":\"1\",\"title\":\"Lamar Jackson\",\"email\":\"jackson@gmail.com\",\"description\":\"CEO\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"agent_image\":\"64226f1f3bffa1679978271.png\"}', '2023-03-28 02:07:51', '2023-03-28 02:07:51'),
(86, 'team_member.element', '{\"has_image\":\"1\",\"title\":\"Frank Khalid\",\"email\":\"khalid@gmail.com\",\"description\":\"HR Manager\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"agent_image\":\"64226f678a0ab1679978343.png\"}', '2023-03-28 02:09:03', '2023-03-28 02:09:03'),
(87, 'testimonial.content', '{\"top_heading\":\"Testimonials\",\"heading\":\"What Clients Say About Us.\",\"subheading\":\"We are passionate about creating an incredible client experience.\"}', '2023-03-28 02:22:21', '2024-02-24 06:17:45'),
(88, 'testimonial.element', '{\"has_image\":\"1\",\"title\":\"Javicerillos\",\"designation\":\"CEO and Founder\",\"description\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequuntur culpa magni, recusandae beatae provident nesciunt, quam corrupti rerum quod voluptatibus alias id!\",\"star_count\":\"3\",\"testimonial_image\":\"6422792c056da1679980844.png\"}', '2023-03-28 02:25:46', '2023-03-28 02:50:44'),
(89, 'testimonial.element', '{\"has_image\":\"1\",\"title\":\"Javicerillos\",\"designation\":\"CEO and Founder\",\"description\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequuntur culpa magni, recusandae beatae provident nesciunt, quam corrupti rerum quod voluptatibus alias id!\",\"star_count\":\"4\",\"testimonial_image\":\"642279331b63b1679980851.png\"}', '2023-03-28 02:26:12', '2023-03-28 02:50:51'),
(90, 'testimonial.element', '{\"has_image\":\"1\",\"title\":\"Javicerillos\",\"designation\":\"CEO and Founder\",\"description\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequuntur culpa magni, recusandae beatae provident nesciunt, quam corrupti rerum quod voluptatibus alias id!\",\"star_count\":\"5\",\"testimonial_image\":\"642279026ed641679980802.png\"}', '2023-03-28 02:27:53', '2023-03-28 02:50:02'),
(91, 'testimonial.element', '{\"has_image\":\"1\",\"title\":\"Javicerillos\",\"designation\":\"CEO and Founder\",\"description\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consequuntur culpa magni, recusandae beatae provident nesciunt, quam corrupti rerum quod voluptatibus alias id!\",\"star_count\":\"5\",\"testimonial_image\":\"6422790db661d1679980813.png\"}', '2023-03-28 02:28:18', '2023-03-28 02:50:13'),
(92, 'subscribe.content', '{\"has_image\":\"1\",\"top_heading\":\"News Letter\",\"heading\":\"Subscribe Our Newsletter\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age just.\",\"subscribe_image\":\"6422a391e4a451679991697.jpg\"}', '2023-03-28 05:47:20', '2023-03-28 05:51:37'),
(93, 'faq.element', '{\"question\":\"3. How long does it take to develop software?\",\"answer\":\"<p>\\u00a0 \\u00a0 Yes, we offer custom software development services tailored to the specific needs of our clients. We work closely with our clients to understand their requirements and develop solutions that meet their unique needs.<\\/p>\"}', '2023-03-28 05:56:40', '2023-03-29 03:53:06'),
(94, 'faq.element', '{\"question\":\"2. How much does it cost to develop software?\",\"answer\":\"<p>\\u00a0Yes, we offer custom software development services tailored to the specific needs of our clients. We work closely with our clients to understand their requirements and develop solutions that meet their unique needs.<\\/p>\"}', '2023-03-28 05:56:53', '2023-03-29 03:53:13'),
(95, 'faq.element', '{\"question\":\"1. What kind of industries do you work with?\",\"answer\":\"<p>\\u00a0Yes, we offer custom software development services tailored to the specific needs of our clients. We work closely with our clients to understand their requirements and develop solutions that meet their unique needs.<\\/p>\"}', '2023-03-28 05:57:05', '2023-03-29 03:53:20'),
(96, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Photoshop Create Path From Image.\",\"description\":\"<p><strong>Lorem Ipsum<\\/strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><p>\\u00a0<\\/p><h3>Why do we use it?<\\/h3><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><p>\\u00a0<\\/p><h3>Where does it come from?<\\/h3><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p>\",\"blog_image\":\"6422b254567971679995476.jpg\"}', '2023-03-28 06:52:22', '2023-04-13 01:45:58'),
(97, 'brand.element', '{\"has_image\":[\"1\"],\"url\":\"https:\\/\\/www.google.com\\/\",\"brand_image\":\"6422b3fa015c51679995898.png\"}', '2023-03-28 07:01:38', '2023-03-28 07:01:38'),
(98, 'brand.element', '{\"has_image\":[\"1\"],\"url\":\"https:\\/\\/www.google.com\\/\",\"brand_image\":\"6422b40140bc21679995905.png\"}', '2023-03-28 07:01:45', '2023-03-28 07:01:45'),
(99, 'brand.element', '{\"has_image\":[\"1\"],\"url\":\"https:\\/\\/www.google.com\\/\",\"brand_image\":\"6422b4073bea91679995911.png\"}', '2023-03-28 07:01:51', '2023-03-28 07:01:51'),
(100, 'brand.element', '{\"has_image\":[\"1\"],\"url\":\"https:\\/\\/www.google.com\\/\",\"brand_image\":\"6422b40d1aa2f1679995917.png\"}', '2023-03-28 07:01:57', '2023-03-28 07:01:57'),
(101, 'brand.element', '{\"has_image\":[\"1\"],\"url\":\"https:\\/\\/www.google.com\\/\",\"brand_image\":\"6422b412bef981679995922.png\"}', '2023-03-28 07:02:02', '2023-03-28 07:02:02'),
(102, 'brand.element', '{\"has_image\":[\"1\"],\"url\":\"https:\\/\\/www.google.com\\/\",\"brand_image\":\"6422b42528ada1679995941.png\"}', '2023-03-28 07:02:21', '2023-03-28 07:02:21'),
(103, 'brand.element', '{\"has_image\":[\"1\"],\"url\":\"https:\\/\\/www.google.com\\/\",\"brand_image\":\"6422b4eadf40d1679996138.png\"}', '2023-03-28 07:05:38', '2023-03-28 07:05:38'),
(105, 'footer_company_links.element', '{\"title\":\"Portfolio\",\"url\":\"\\/portfolio\"}', '2023-03-28 07:22:20', '2024-02-27 06:50:11'),
(108, 'theme_two_banner.content', '{\"top_heading\":\"A trusted Digital agency\",\"heading\":\"WELCOME TO CREATIVE DIGITAL AGENCY\",\"sub_heading\":\"Transform your ideas into reality with our expert software development services. From concept to deployment, we deliver custom solutions that meet your unique business needs.\",\"banner_btn_1\":\"Get Started\",\"banner_btn_2\":\"Contact Us\"}', '2023-04-11 06:28:31', '2023-04-11 06:28:31'),
(109, 'theme_two_about.content', '{\"has_image\":\"1\",\"top_heading\":\"About Us\",\"heading\":\"What\'s So Special About Agency?\",\"description\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75% of the worldwide telecom limit.\\r\\n\\r\\nDispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75%.\",\"experience\":\"15\",\"about_btn_icon\":\"<i class=\\\"fas fa-arrow-right\\\"><\\/i>\",\"about_btn\":\"View More\",\"about_image_1\":\"6435247663b8f1681204342.jpg\",\"about_image_2\":\"643524766c1151681204342.png\"}', '2023-04-11 06:35:47', '2023-04-11 06:42:22'),
(110, 'theme_two_about.element', '{\"content_list\":\"Clients Focused\"}', '2023-04-11 06:35:59', '2023-04-11 06:35:59'),
(111, 'theme_two_about.element', '{\"content_list\":\"After Sales support.\"}', '2023-04-11 06:36:07', '2023-04-11 06:36:07'),
(112, 'theme_two_about.element', '{\"content_list\":\"We Can Save Your Money.\"}', '2023-04-11 06:36:13', '2023-04-11 06:36:13'),
(113, 'theme_two_choose_us.content', '{\"has_image\":\"1\",\"top_heading\":\"Why Choose Us\",\"heading\":\"Our Digital Agency Delivers Extraordinary Business Value.\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75% of the worldwide telecom limit.\",\"top_heading_2\":\"Experienced digital agency in Rejon. Innovative solutions for business success.\",\"sub_heading_2\":\"Rather than focusing solely on technology platforms, it is important to also prioritize leadership skills and the seamless integration of wireless bandwidth to achieve optimal results. This approach allows for efficient and effective communication without any obstacles or barriers.\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=l-jBcewRW70\",\"choose_image\":\"643525f6166fc1681204726.png\"}', '2023-04-11 06:48:32', '2023-04-11 06:48:46'),
(114, 'theme_two_choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Fresh Business Thinking\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-04-11 06:49:11', '2023-04-11 06:49:11'),
(115, 'theme_two_choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Risk-Free Satisfaction\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-04-11 06:49:29', '2023-04-11 06:49:29'),
(116, 'theme_two_choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"24\\/7 Helpdesk Availability\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-04-11 06:50:02', '2023-04-11 06:50:02'),
(117, 'theme_two_portfolio.content', '{\"top_heading\":\"Our Portfolio\",\"heading\":\"Let\\u2019s See Our Best Work\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75% of the worldwide telecom limit.\"}', '2023-04-11 06:53:02', '2023-04-11 06:53:02'),
(124, 'theme_three_banner.content', '{\"has_image\":\"1\",\"top_heading\":\"We Solve Their Problems\",\"heading\":\"AWARD-WINNING DIGITAL AGENCY IN THE WORLD.\",\"sub_heading\":\"Transform your ideas into reality with our expert software development services. From concept to deployment, we deliver custom solutions that meet your unique business needs\",\"experience\":\"15\",\"banner_btn_1\":\"Get Started\",\"banner_btn_2\":\"Contact Us\",\"banner_image\":\"6435294576fd51681205573.png\"}', '2023-04-11 07:02:53', '2023-04-11 07:02:53'),
(125, 'theme_three_about.content', '{\"has_image\":\"1\",\"top_heading\":\"About Us\",\"heading\":\"We Divide Our Working Process Into 4 Ways.\",\"about_btn\":\"View More\",\"about_image\":\"64352a2481a851681205796.png\"}', '2023-04-11 07:06:36', '2023-04-11 07:06:36'),
(126, 'theme_three_about.element', '{\"content_list\":\"Planing\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla incidunt quo\"}', '2023-04-11 07:06:48', '2023-04-11 07:06:48'),
(127, 'theme_three_about.element', '{\"content_list\":\"Evaluate\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla incidunt quo\"}', '2023-04-11 07:06:59', '2023-04-11 07:06:59'),
(128, 'theme_three_about.element', '{\"content_list\":\"Execute\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla incidunt quo\"}', '2023-04-11 07:07:18', '2023-04-11 07:07:18'),
(129, 'theme_three_about.element', '{\"content_list\":\"Improve\",\"description\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Nulla incidunt quo\"}', '2023-04-11 07:07:28', '2023-04-11 07:07:28'),
(130, 'theme_three_choose_us.content', '{\"has_image\":\"1\",\"top_heading\":\"Why Choose Us\",\"heading\":\"Our Digital Agency Delivers Extraordinary Business Value.\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75% of the worldwide telecom limit.\",\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=EQOarcurXfY\",\"choose_image\":\"64352b731796d1681206131.png\"}', '2023-04-11 07:12:11', '2023-04-11 07:12:11'),
(131, 'theme_three_choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Fresh Business Thinking\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-04-11 07:12:31', '2023-04-11 07:12:31'),
(132, 'theme_three_choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"Risk-Free Satisfaction\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-04-11 07:12:58', '2023-04-11 07:12:58'),
(133, 'theme_three_choose_us.element', '{\"service_icon\":\"<i class=\\\"fas fa-check\\\"><\\/i>\",\"title\":\"24\\/7 Helpdesk Availability\",\"description\":\"Revamp your business strategy with fresh thinking that drives innovation.\"}', '2023-04-11 07:13:22', '2023-04-11 07:13:22'),
(134, 'theme_three_portfolio.content', '{\"top_heading\":\"Our Portfolio\",\"heading\":\"Let\\u2019s See Our Best Work\",\"sub_heading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age. Generally just 10 nations have facilitated 70-75% of the worldwide telecom limit.\"}', '2023-04-11 07:15:33', '2023-04-11 07:15:33'),
(141, 'footer_important_links.element', '{\"title\":\"Services\",\"url\":\"\\/services\"}', '2023-05-18 05:05:05', '2023-05-18 05:05:05'),
(142, 'footer_important_links.element', '{\"title\":\"Blog\",\"url\":\"\\/blog\"}', '2023-05-18 05:05:28', '2024-02-27 06:11:01'),
(143, 'footer_important_links.element', '{\"title\":\"Plans\",\"url\":\"\\/plan\"}', '2023-05-18 05:06:37', '2023-05-18 05:06:37'),
(145, 'theme_four_banner.content', '{\"has_image\":\"1\",\"top_heading\":\"Agencies Platform\",\"heading\":\"Business Goals Achieved with Design\",\"highlighted_heading_text\":\"Goals\",\"sub_heading\":\"Lorem ipsum dolor sit amet consectetur, adipisicing elit. Vel quos praesentium perspiciatis, omnis ex doloribus totam voluptatum\",\"users_count\":\"1500+\",\"users_title\":\"Satisfied Clients\",\"embedded_link\":\"https:\\/\\/www.youtube.com\\/watch?v=G-rsmbK7gdY\",\"banner_image\":\"65e5d9d65dd471709562326.png\",\"users_image\":\"65d1da15ba13a1708251669.png\"}', '2024-02-18 07:35:38', '2024-03-04 11:55:26'),
(146, 'theme_four_about.content', '{\"has_image\":\"1\",\"top_heading\":\"Know About us\",\"heading\":\"We Divide Our Working Process Into 3 Ways.\",\"short_description\":\"Maecenas nec odio etante tincidunt tempus. Donec vitae sapien libero venenatis faucibus\",\"about_image\":\"65d1def810c181708252920.png\"}', '2024-02-18 08:12:00', '2024-02-18 08:12:00'),
(147, 'theme_four_about.element', '{\"title\":\"Improve\",\"content\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure qui molli\",\"icon\":\"<i class=\\\"fas fa-wrench\\\"><\\/i>\"}', '2024-02-18 08:12:23', '2024-02-18 08:12:23'),
(148, 'theme_four_about.element', '{\"title\":\"Evaluate\",\"content\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure qui molli\",\"icon\":\"<i class=\\\"fas fa-search-dollar\\\"><\\/i>\"}', '2024-02-18 08:12:48', '2024-02-18 08:12:48'),
(149, 'theme_four_about.element', '{\"title\":\"Planing\",\"content\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Iure qui molli\",\"icon\":\"<i class=\\\"fas fa-chart-line\\\"><\\/i>\"}', '2024-02-18 08:13:06', '2024-02-18 08:13:06'),
(150, 'theme_four_counter.content', '{\"heading\":\"1000+ Customers Choose Our Best Services\",\"sub_heading\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Asperiores deserunt voluptatibus eveniet hic nam et optio aperiam rem excepturi.\"}', '2024-02-18 08:44:39', '2024-02-18 08:44:39'),
(151, 'theme_four_counter.element', '{\"title\":\"Happy Customer\",\"counter_digit\":\"30K +\"}', '2024-02-18 08:44:52', '2024-02-18 08:50:14'),
(152, 'theme_four_counter.element', '{\"title\":\"Awards Won\",\"counter_digit\":\"20 +\"}', '2024-02-18 08:45:17', '2024-02-18 08:50:54'),
(153, 'theme_four_counter.element', '{\"title\":\"Experience\",\"counter_digit\":\"2K +\"}', '2024-02-18 08:45:31', '2024-02-18 08:51:11'),
(154, 'theme_four_counter.element', '{\"title\":\"Total Employee\",\"counter_digit\":\"5K +\"}', '2024-02-18 08:45:45', '2024-02-18 08:51:24'),
(155, 'theme_four_choose_us.content', '{\"top_heading\":\"why choose us\",\"heading\":\"Our Digital Agency Provide Best Services.\",\"sub_heading\":\"Maecenas nec odio etante tincidunt tempus. Donec vitae sapien libero venenatis faucibus\"}', '2024-02-18 08:58:39', '2024-02-18 08:58:39'),
(156, 'theme_four_choose_us.element', '{\"title\":\"24\\/7 Helpdesk Availability\",\"icon\":\"<i class=\\\"fas fa-headset\\\"><\\/i>\"}', '2024-02-18 08:59:05', '2024-02-18 08:59:05'),
(157, 'theme_four_choose_us.element', '{\"title\":\"24\\/7 Helpdesk Availability\",\"icon\":\"<i class=\\\"fas fa-headset\\\"><\\/i>\"}', '2024-02-18 08:59:33', '2024-02-18 08:59:33'),
(158, 'theme_four_choose_us.element', '{\"title\":\"24\\/7 Helpdesk Availability\",\"icon\":\"<i class=\\\"fas fa-headset\\\"><\\/i>\"}', '2024-02-18 08:59:47', '2024-02-18 08:59:47'),
(159, 'theme_four_choose_us.element', '{\"title\":\"24\\/7 Helpdesk Availability\",\"icon\":\"<i class=\\\"fas fa-headset\\\"><\\/i>\"}', '2024-02-18 09:00:08', '2024-02-18 09:00:08'),
(160, 'theme_four_testimonial.content', '{\"top_heading\":\"Feedback\",\"heading\":\"our Client Feedback\",\"sub_heading\":\"Maecenas nec odio etante tincidunt tempus. Donec vitae sapien libero venenatis faucibus\",\"has_image\":\"1\",\"testimonial_image\":\"65e5ca12b6cb41709558290.png\"}', '2024-02-19 03:35:17', '2024-03-04 10:48:10'),
(161, 'theme_four_testimonial.element', '{\"has_image\":\"1\",\"name\":\"Wade Warren\",\"designation\":\"CEO and Founder\",\"short_description\":\"Tincidunt curae ex mollis tellus maximus accumsan arcu augue blandit commodo. Curae dolor\",\"star_count\":\"5\",\"client_image\":\"65d2f09ab6a6a1708322970.png\"}', '2024-02-19 03:39:30', '2024-02-19 03:39:30'),
(162, 'theme_four_testimonial.element', '{\"has_image\":\"1\",\"name\":\"Sayed Molla\",\"designation\":\"Sr. Desinger\",\"short_description\":\"incidunt curae ex mollis tellus maximus accumsan arcu augue blandit commodo. Curae dolor\",\"star_count\":\"5\",\"client_image\":\"65d2f2d77b9021708323543.png\"}', '2024-02-19 03:40:45', '2024-02-19 03:49:03'),
(163, 'theme_four_testimonial.element', '{\"has_image\":\"1\",\"name\":\"Md. Rayhan Kobir\",\"designation\":\"Sr. Web Developer\",\"short_description\":\"Tincidunt curae ex mollis tellus maximus accumsan arcu augue blandit commodo. Curae dolor\",\"star_count\":\"5\",\"client_image\":\"65d2f195d16581708323221.jpg\"}', '2024-02-19 03:43:41', '2024-02-19 03:43:41'),
(164, 'theme_four_team_member.content', '{\"top_heading\":\"Our Team Member\",\"heading\":\"Meet Our Team\",\"subheading\":\"Data transfer capacity has generally been inconsistent dispersed around the world, with expanding focus in the advanced age just 10 nations have facilitated .\"}', '2024-02-19 05:51:00', '2024-02-19 05:51:00'),
(165, 'theme_four_team_member.element', '{\"has_image\":\"1\",\"name\":\"Mindi E. Smithers\",\"designation\":\"Web Design\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65d3115989dd51708331353.png\"}', '2024-02-19 05:59:13', '2024-02-19 05:59:13'),
(166, 'theme_four_team_member.element', '{\"has_image\":\"1\",\"name\":\"Mindi E. Smithers\",\"designation\":\"Developer\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65d311b9b5d9d1708331449.png\"}', '2024-02-19 06:00:49', '2024-02-19 06:00:49');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(167, 'theme_four_team_member.element', '{\"has_image\":\"1\",\"name\":\"Md. Rayhan Kobir\",\"designation\":\"Software Engineer\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65d3121389d511708331539.jpg\"}', '2024-02-19 06:02:19', '2024-02-19 06:02:19'),
(168, 'theme_four_team_member.element', '{\"has_image\":\"1\",\"name\":\"Ayla Baker\",\"designation\":\"Business Man\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65d3140113b9d1708332033.png\"}', '2024-02-19 06:10:33', '2024-02-19 06:10:33'),
(169, 'theme_four_team_member.element', '{\"has_image\":\"1\",\"name\":\"Thomas James\",\"designation\":\"Business Man\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65d3144e5f3d31708332110.png\"}', '2024-02-19 06:11:50', '2024-02-19 06:11:50'),
(170, 'theme_four_team_member.element', '{\"has_image\":\"1\",\"name\":\"Elizabeth Green\",\"designation\":\"Singer\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65d31499502821708332185.png\"}', '2024-02-19 06:13:05', '2024-02-19 06:13:05'),
(171, 'footer_important_links.element', '{\"title\":\"Portfolio\",\"url\":\"\\/portfolio\"}', '2024-02-24 10:35:09', '2024-02-24 10:35:09'),
(172, 'footer_company_links.element', '{\"title\":\"Cookie Policy\",\"url\":\"\\/cookie-policy\"}', '2024-02-24 10:35:47', '2024-02-24 10:36:19'),
(173, 'theme_five_banner.content', '{\"has_image\":\"1\",\"top_heading\":\"A Trusted Digital Agency\",\"heading\":\"Welcome To Creative Digital Agency\",\"highlighted_heading_text\":\"Digital\",\"banner_image\":\"65db03fc752c91708852220.png\"}', '2024-02-25 06:40:20', '2024-02-25 11:47:06'),
(174, 'theme_five_about.content', '{\"has_image\":\"1\",\"top_heading\":\"About Us\",\"heading\":\"What\'s So Special About Agency?\",\"experience_count\":\"25\",\"short_description\":\"Exercitation llamco laboris nis aliquip sed conseqrure dolorn repreh deris luptate velit excepteur duis aute irure dolor voluptate consequat ante. Fusce auctor porttitor lobortis purus sit amet nunc tempu\",\"about_image\":\"65db06d3cefe41708852947.png\"}', '2024-02-25 06:52:27', '2024-02-25 06:52:27'),
(175, 'theme_five_about.element', '{\"content\":\"We Can Save Your Money.\",\"icon\":\"<i class=\\\"far fa-check-circle\\\"><\\/i>\"}', '2024-02-25 06:53:16', '2024-02-25 06:53:16'),
(176, 'theme_five_about.element', '{\"content\":\"After Sales support.\",\"icon\":\"<i class=\\\"far fa-check-circle\\\"><\\/i>\"}', '2024-02-25 06:53:30', '2024-02-25 06:53:30'),
(177, 'theme_five_about.element', '{\"content\":\"We Can Save Your Money.\",\"icon\":\"<i class=\\\"far fa-check-circle\\\"><\\/i>\"}', '2024-02-25 06:53:44', '2024-02-25 06:53:44'),
(178, 'theme_five_choose_us.content', '{\"has_image\":\"1\",\"top_heading\":\"Why Choose Us\",\"heading\":\"We Are Ready To Help Your Business Grow\",\"sub_heading\":\"Exercitation llamco laboris nis aliquip sed conseqrure dolorn repreh deris luptate velit excepteur duis aute irure dolor voluptate\",\"link\":\"https:\\/\\/www.youtube.com\\/embed\\/eEqCEFuQqF8?si=odfmXeURVHM9sHjR\",\"choose_image\":\"65e6bdae98f171709620654.png\"}', '2024-02-25 07:15:29', '2024-03-05 04:07:34'),
(179, 'theme_five_choose_us.element', '{\"title\":\"24\\/7 Helpdesk Availability\",\"content\":\"Exercitation llamco laboris nis aliquip sed conseqrure dolorn repreh deris luptate\",\"icon\":\"<i class=\\\"fas fa-cog\\\"><\\/i>\"}', '2024-02-25 07:16:35', '2024-02-25 07:16:35'),
(180, 'theme_five_choose_us.element', '{\"title\":\"Risk-Free Satisfaction\",\"content\":\"Exercitation llamco laboris nis aliquip sed conseqrure dolorn repreh deris luptate\",\"icon\":\"<i class=\\\"fas fa-dolly\\\"><\\/i>\"}', '2024-02-25 07:17:03', '2024-02-25 07:17:03'),
(181, 'theme_five_choose_us.element', '{\"title\":\"Fresh Business Thinking\",\"content\":\"Exercitation llamco laboris nis aliquip sed conseqrure dolorn repreh deris luptate\",\"icon\":\"<i class=\\\"fas fa-chart-line\\\"><\\/i>\"}', '2024-02-25 07:17:23', '2024-02-25 07:17:24'),
(182, 'theme_five_counter.element', '{\"title\":\"HAPPY CUSTOMER\",\"counter_digit\":\"90\",\"symbol\":\"+\"}', '2024-02-25 07:33:07', '2024-02-25 07:37:16'),
(183, 'theme_five_counter.element', '{\"title\":\"AWARDS WON\",\"counter_digit\":\"500\",\"symbol\":\"+\"}', '2024-02-25 07:33:26', '2024-02-25 07:37:21'),
(184, 'theme_five_counter.element', '{\"title\":\"EXPERIENCE\",\"counter_digit\":\"25\",\"symbol\":\"+\"}', '2024-02-25 07:33:39', '2024-02-25 07:37:30'),
(185, 'theme_five_counter.element', '{\"title\":\"TOTAL EMPLOYEE\",\"counter_digit\":\"3000\",\"symbol\":\"K\"}', '2024-02-25 07:34:01', '2024-02-25 07:37:36'),
(186, 'theme_five_team_member.content', '{\"top_heading\":\"Our Team\",\"heading\":\"Our Expert Team\",\"subheading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio provident vitae aut totam molestiae.\"}', '2024-02-25 07:55:01', '2024-02-25 07:55:01'),
(187, 'theme_five_team_member.element', '{\"has_image\":\"1\",\"name\":\"Brooklyn Simmons\",\"designation\":\"CTO, G Group\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65db1668b613b1708856936.png\"}', '2024-02-25 07:58:56', '2024-02-25 07:58:56'),
(188, 'theme_five_team_member.element', '{\"has_image\":\"1\",\"name\":\"Brooklyn Simmons\",\"designation\":\"Web Developer\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65db16e1e14ce1708857057.png\"}', '2024-02-25 08:00:57', '2024-02-25 08:00:57'),
(189, 'theme_five_team_member.element', '{\"has_image\":\"1\",\"name\":\"Rayhan Kobir\",\"designation\":\"Sr. Software Engineer\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65db171f0a1241708857119.png\"}', '2024-02-25 08:01:59', '2024-02-25 08:01:59'),
(190, 'theme_five_team_member.element', '{\"has_image\":\"1\",\"name\":\"Brooklyn Simmons\",\"designation\":\"CTO, G Group\",\"facebook_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"facebook_link\":\"https:\\/\\/www.facebook.com\\/\",\"twitter_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"twitter_link\":\"https:\\/\\/twitter.com\\/?lang=en\",\"instagram_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"instagram_link\":\"https:\\/\\/www.instagram.com\\/\",\"agent_image\":\"65db176c4535b1708857196.png\"}', '2024-02-25 08:03:16', '2024-02-25 08:03:16'),
(191, 'theme_five_faq.content', '{\"has_image\":\"1\",\"top_heading\":\"FAQ\",\"heading\":\"Most Popular Questions\",\"sub_heading\":\"Maecenas nec odio etante tincidunt tempus. Donec vitae sapien libero venenatis faucibus\",\"faq_image\":\"65db1b46d818a1708858182.png\"}', '2024-02-25 08:19:42', '2024-02-25 08:19:43'),
(192, 'theme_five_faq.element', '{\"question\":\"What kind of industries do you work with?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias.<br \\/>Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-02-25 08:20:08', '2024-02-25 08:20:08'),
(193, 'theme_five_faq.element', '{\"question\":\"What kind of industries do you work with?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-02-25 08:20:24', '2024-02-25 08:20:24'),
(194, 'theme_five_faq.element', '{\"question\":\"What kind of industries do you work with?\",\"answer\":\"<p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi, numquam alias. \\u00a0 Laborum maiores non iure, laudantium odio, ipsa magni a ducimus nobis consequuntur<\\/p>\"}', '2024-02-25 08:20:37', '2024-02-25 08:20:37'),
(195, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Agency Amplified: Igniting Your Potential\",\"description\":\"<p><strong>Lorem Ipsum<\\/strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h3>Why Do We Use It?<\\/h3><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><h3>Where Does It Come From?<\\/h3><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p>\",\"blog_image\":\"65e5a07f4c0a11709547647.png\"}', '2024-03-04 07:50:47', '2024-03-04 07:50:47'),
(196, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Unlocking Agency: Your Path to Empowerment\",\"description\":\"<p><strong>Lorem Ipsum<\\/strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h3>Why Do We Use It?<\\/h3><p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p><h3>Where Does It Come From?<\\/h3><p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \\\"de Finibus Bonorum et Malorum\\\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \\\"Lorem ipsum dolor sit amet..\\\", comes from a line in section 1.10.32.<\\/p><p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \\\"de Finibus Bonorum et Malorum\\\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.<\\/p>\",\"blog_image\":\"65e5a09428e7d1709547668.png\"}', '2024-03-04 07:51:08', '2024-03-04 07:51:08');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-58ira22618401@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:03:45'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"---------------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:01'),
(3, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"-----------\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"--------------------\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"example.com\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:10:37'),
(4, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"--------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2022-11-26 07:49:18'),
(5, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"-------------------\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:14'),
(6, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(7, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"------------\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"--------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(8, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"------------\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"---------\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"-------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:00:15'),
(9, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:51'),
(10, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:48'),
(11, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"------------\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"-----------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(12, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51M8Ks2CL65BWuH7eCBcWsLP2yPfWaLtfJVxG3zfii7cCWJE1izM4jkhucmBSm6izmVtSGZyp0JDYYCVmx9E4WmQY004gfnctzD\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51M8Ks2CL65BWuH7eju6khGxJMpeeFuw2Rwrjr8UYCz6ZnQ3PiFxb1gVu1i1dBto9MQrnjkBimHkFJgNcqsrJHTak0010kCY41h\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"abcd\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2022-12-18 08:28:03'),
(49, 22, 1000, 'Manual', 'manual', 1, '[]', '[]', 0, NULL, '<p>Please Provide your information</p>', '2024-02-24 09:40:34', '2024-02-24 09:40:40');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_two_base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_three_base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_four_base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_five_base_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_five_secondary_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_shortcodes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `socialite_credentials` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rtl` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `theme_two_base_color`, `theme_three_base_color`, `theme_four_base_color`, `theme_five_base_color`, `theme_five_secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `socialite_credentials`, `agree`, `registration`, `active_template`, `system_info`, `rtl`, `created_at`, `updated_at`) VALUES
(1, 'FinBiz', 'USD', '$', 'info@example.com', '<p>Hi {{fullname}} ({{username}}),&nbsp;</p><p>{{message}}</p>', 'hi {{fullname}} ({{username}}), {{message}}', 'FinBiz', '673ee5', 'fab700', 'f78c47', '90ee90', 'e42032', 'ffb41d', '{\"name\":\"smtp\",\"host\":\"smtp.mailtrap.io\",\"port\":\"2525\",\"enc\":\"ssl\",\"username\":\"bcbcc6239f7a0e\",\"password\":\"c5d10803bef9b1\"}', '{\"name\":\"messageBird\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 0, 0, 0, 0, 0, 0, '{\"google\":{\"client_id\":\"959894800111-743odo92gdre71v9vt1u6pqkc5vo9v3g.apps.googleusercontent.com\",\"client_secret\":\"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\",\"status\":1},\"facebook\":{\"client_id\":\"---------\",\"client_secret\":\"---------\",\"status\":1}}', 1, 1, 'themesFive', '[]', 2, NULL, '2024-03-07 07:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 1, '2020-07-06 03:47:55', '2022-09-29 10:36:14'),
(14, 'Spanish', 'es', NULL, 0, 0, '2023-02-15 11:06:57', '2023-02-15 11:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-09-21 13:04:13'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'PLAN SUBSCRIBE', 'Subscribed Plan', 'You\'ve subscribed successfully', '<p>You\'ve subscribed to <strong>{{plan_name}}</strong> plan. The price <strong>{{amount}} {{currency}}</strong>. The transaction number is #<strong>{{trx}}</strong>. Your current is<strong> {{post_balance}} {{currency}}</strong></p>', 'You\'ve subscribed to {{plan_name}} plan. The price {{amount}} {{currency}}. The transaction number is #{{trx}}. Your current is {{post_balance}} {{currency}}', '{\"amount\":\"Price of the plan\",\"plan_name\":\"Name of plan\",\"trx\":\"Transaction number\",\"post_balance\":\"Balance after transactions\"}', 1, 1, '2023-03-30 05:06:32', '2023-03-30 05:06:32'),
(18, 'ORDER PLACE', 'order place', 'You\'ve order place successfully', '<p>Order Placement Details:</p>\r\n<p>Order Number: <strong>{{order_number}}</strong></p>\r\n<p>Price: <strong>{{amount}} {{currency}}</strong></p>\r\n<p>Transaction Number: #<strong>{{trx}}</strong></p>\r\n<p>Your Current Balance: <strong>{{post_balance}} {{currency}}</strong></p>', '<p>Order Placement Details:</p>\r\n<p>Order Number: <strong>{{order_number}}</strong></p>\r\n<p>Price: <strong>{{amount}} {{currency}}</strong></p>\r\n<p>Transaction Number: #<strong>{{trx}}</strong></p>\r\n<p>Your Current Balance: <strong>{{post_balance}} {{currency}}</strong></p>', '{\"amount\":\"Price of the product\",\"order_number\":\"Order number\",\"trx\":\"Transaction number\",\"post_balance\":\"Balance after transactions\"}', 1, 1, '2023-03-30 05:06:32', '2023-03-30 05:06:32'),
(19, 'ORDER REQUEST', 'order request', 'You\'ve order request successfully', '<p>Order Placement Details:</p>\r\n<p>Order Number: <strong>{{order_number}}</strong></p>\r\n<p>Price: <strong>{{amount}} {{currency}}</strong></p>\r\n<p>Transaction Number: #<strong>{{trx}}</strong></p>\r\n<p>Your Current Balance: <strong>{{post_balance}} {{currency}}</strong></p>', '<p>Order Placement Details:</p>\r\n<p>Order Number: <strong>{{order_number}}</strong></p>\r\n<p>Price: <strong>{{amount}} {{currency}}</strong></p>\r\n<p>Transaction Number: #<strong>{{trx}}</strong></p>\r\n<p>Your Current Balance: <strong>{{post_balance}} {{currency}}</strong></p>', '{\"amount\":\"Price of the product\",\"order_number\":\"Order number\",\"trx\":\"Transaction number\",\"post_balance\":\"Balance after transactions\"}', 1, 1, '2023-03-30 05:06:32', '2023-03-30 05:06:32');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `service_id` int(11) NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `service_price` decimal(28,8) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0= pending, 1=approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'Home', '/', 'presets.default.', '[\"about\",\"service\",\"choose_us\",\"counter\",\"plan\",\"portfolio\",\"team_member\",\"testimonial\",\"subscribe\",\"faq\",\"blog\",\"brand\"]', 1, '2020-07-11 06:23:58', '2023-03-27 05:06:43'),
(4, 'Plan', 'plan', 'presets.default.', '[\"service\"]', 1, '2020-10-22 01:14:43', '2023-04-01 04:03:31'),
(5, 'Services', 'services', 'presets.default.', '[\"plan\"]', 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53'),
(19, 'Blog', 'blog', 'presets.default.', '[\"faq\",\"subscribe\"]', 0, '2023-03-27 05:49:41', '2023-04-01 04:02:58'),
(20, 'About', 'about', 'presets.default.', '[\"about\",\"faq\",\"subscribe\"]', 0, '2023-03-30 07:34:41', '2023-04-01 04:03:59'),
(21, 'Contact', 'contact', 'presets.default.', NULL, 0, '2023-04-01 01:09:56', '2023-04-01 01:10:16'),
(22, 'Home', '/', 'presets.themesTwo.', '[\"about\",\"service\",\"choose_us\",\"counter\",\"plan\",\"portfolio\",\"team_member\",\"testimonial\",\"subscribe\",\"faq\",\"blog\",\"brand\"]', 1, '2023-04-06 02:44:34', '2023-04-08 06:24:17'),
(23, 'Plan', 'plan', 'presets.themesTwo.', '[\"service\"]', 0, '2023-04-08 01:25:57', '2023-04-08 01:26:15'),
(24, 'Services', 'services', 'presets.themesTwo.', '[\"plan\"]', 0, '2023-04-08 01:28:49', '2023-04-08 01:31:28'),
(26, 'About', 'about', 'presets.themesTwo.', '[\"about\",\"faq\",\"subscribe\"]', 0, '2023-04-08 01:29:15', '2023-04-08 01:34:45'),
(27, 'Contact', 'contact', 'presets.themesTwo.', NULL, 0, '2023-04-08 01:29:25', '2023-04-08 01:29:25'),
(28, 'Home', '/', 'presets.themesThree.', '[\"about\",\"service\",\"choose_us\",\"counter\",\"plan\",\"portfolio\",\"subscribe\",\"team_member\",\"testimonial\",\"faq\",\"blog\",\"brand\"]', 1, '2023-04-11 01:52:59', '2023-04-11 04:37:58'),
(29, 'Plan', 'plan', 'presets.themesThree.', NULL, 0, '2023-04-11 04:12:17', '2023-04-11 04:12:17'),
(30, 'Services', 'services', 'presets.themesThree.', NULL, 0, '2023-04-11 04:13:04', '2023-04-11 04:13:04'),
(31, 'Blog', 'blog', 'presets.themesThree.', NULL, 0, '2023-04-11 04:13:15', '2023-04-11 04:13:15'),
(32, 'About', 'about', 'presets.themesThree.', '[\"about\",\"faq\",\"subscribe\"]', 0, '2023-04-11 04:13:27', '2023-04-11 04:23:17'),
(33, 'Contact', 'contact', 'presets.themesThree.', NULL, 0, '2023-04-11 04:13:44', '2023-04-11 04:13:44'),
(34, 'Home', '/', 'presets.themesFour.', '[\"brand\",\"service\",\"theme_four_about\",\"plan\",\"portfolio\",\"theme_four_counter\",\"theme_four_choose_us\",\"faq\",\"theme_four_team_member\",\"subscribe\",\"theme_four_testimonial\",\"blog\"]', 1, '2023-04-06 02:44:34', '2024-02-26 03:48:25'),
(35, 'About', 'about', 'presets.themesFour.', '[\"theme_four_about\",\"faq\"]', 0, '2024-02-19 04:33:49', '2024-02-19 06:46:14'),
(36, 'Services', 'services', 'presets.themesFour.', NULL, 1, '2024-02-19 04:33:59', '2024-02-19 04:33:59'),
(37, 'Portfolio', 'portfolio', 'presets.themesFour.', '[\"portfolio\"]', 0, '2024-02-19 04:34:12', '2024-02-19 06:46:28'),
(38, 'Contact', 'contact', 'presets.themesFour.', NULL, 1, '2024-02-19 04:34:25', '2024-02-19 04:34:25'),
(41, 'Home', '/', 'presets.themesFive.', '[\"theme_five_about\",\"service\",\"plan\",\"portfolio\",\"theme_five_choose_us\",\"theme_five_counter\",\"theme_five_team_member\",\"testimonial\",\"theme_five_faq\",\"subscribe\",\"blog\",\"brand\"]', 1, '2020-07-11 06:23:58', '2024-02-26 02:31:33'),
(42, 'Services', 'services', 'presets.themesFive.', NULL, 1, '2024-02-26 02:22:24', '2024-02-26 02:23:59'),
(43, 'Pricing', 'plan', 'presets.themesFive.', NULL, 0, '2024-02-26 02:23:00', '2024-02-26 02:28:37'),
(44, 'Contact', 'contact', 'presets.themesFive.', NULL, 1, '2024-02-26 02:23:19', '2024-02-26 02:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` decimal(28,8) NOT NULL,
  `content` text DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '0= month, 1= year',
  `month` varchar(40) DEFAULT NULL,
  `year` varchar(40) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `portfolios`
--

CREATE TABLE `portfolios` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `icon` varchar(40) NOT NULL,
  `price` decimal(28,8) NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `amount` decimal(28,8) DEFAULT 0.00000000,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `reg_step` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
