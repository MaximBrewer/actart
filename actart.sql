-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 20 2020 г., 06:44
-- Версия сервера: 8.0.21
-- Версия PHP: 7.3.19-1~deb10u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `actart`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auctions`
--

CREATE TABLE `auctions` (
  `id` bigint UNSIGNED NOT NULL,
  `status` enum('coming','started','finished','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '500',
  `sublime` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attr` enum('regular','special') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'regular',
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `header_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `announce_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `announce_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_announce` tinyint(1) NOT NULL DEFAULT '0',
  `to_gallery` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `auctions`
--

INSERT INTO `auctions` (`id`, `status`, `title`, `sort`, `sublime`, `text`, `attr`, `date`, `created_at`, `updated_at`, `header_image`, `announce_image`, `header_text`, `announce_text`, `to_announce`, `to_gallery`) VALUES
(2, 'coming', 'Тест текущий аукцион', 100, '<p>Краткое описание Тест текущий аукцион</p>', '<p>Развернутое описание Тест текущий аукцион ТРАНСЛЯЦИЯ <iframe src=\"https://www.youtube.com/embed/3kH8uTX43Ss\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>', 'regular', '2020-09-28 13:00:00', '2020-07-21 00:45:50', '2020-10-02 09:32:31', 'auctions/July2020/u3u1484pEJEc1CbiWnYf.jpeg', 'auctions/July2020/sNbRURTIuEEUkq5K9w4O.jpeg', 'Текст шапки 1', 'Анонс текущий аукцион', 0, 0),
(3, 'started', 'Тестовый аукцион с трансляцией 3', 200, '<p>Краткое описание первого аукциона</p>', '<p>Развернутое описание ru</p>\n<h4>ТРАНСЛЯЦИЯ</h4>\n<p><iframe src=\"https://www.youtube.com/embed/h3GX4aBkVsM\" width=\"100%\" height=\"320\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>', 'regular', '2020-10-06 08:10:00', '2020-07-21 00:45:50', '2020-10-06 05:07:39', 'auctions/July2020/zPYctApV4zjDGsFjyacj.jpeg', 'auctions/July2020/6ka84FmGif2lyPWlYHXG.jpeg', 'Лучшие работы. Не упусти! (текст шапки)', 'Первый аукцион. Лоты от 1000 руб!', 0, 0),
(4, 'coming', 'Название ru', 300, 'Краткое описание ru', 'Развернутое описание ru', 'regular', '2020-08-28 06:45:00', '2020-07-21 00:45:50', '2020-08-09 13:01:51', 'auctions/July2020/vscKBTPx0D7Y7WQWX0ZI.jpeg', 'auctions/July2020/WDHQyosxJzdXM6KSyvGQ.jpeg', 'Текст шапки', 'Текст анонса', 0, 0),
(5, 'coming', 'Название ru', 400, 'Краткое описание ru', 'Развернутое описание ru', 'regular', '2020-08-27 06:45:00', '2020-07-21 00:45:50', '2020-08-09 13:02:00', 'auctions/July2020/vscKBTPx0D7Y7WQWX0ZI.jpeg', 'auctions/July2020/WDHQyosxJzdXM6KSyvGQ.jpeg', 'Текст шапки ru', 'Текст анонса ru', 0, 0),
(6, 'coming', 'Название ru 6', 250, '<p>Продаём лучшие картины Давида</p>', '<p><span style=\"color: #222222; font-family: \'YS Text\', \'Helvetica Neue\', Arial, sans-serif; font-size: 16px;\">Комитет Госдумы по информполитике, информационным технологиям и связи разрабатывает законопроект, ужесточающий ответственность иностранных интернет-компаний за неисполнение законодательства РФ по хранению персональных данных, удалению противоправного контента и неуплате налогов с деятельности на территории страны, сообщает газета \"Коммерсантъ\" со ссылкой на собственные источники.</span></p>', 'regular', '2020-10-29 06:45:00', '2020-07-21 00:45:50', '2020-09-29 07:49:25', 'auctions/July2020/vscKBTPx0D7Y7WQWX0ZI.jpeg', 'auctions/July2020/WDHQyosxJzdXM6KSyvGQ.jpeg', 'Текст шапки 6', 'Текст анонса 6', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bets`
--

CREATE TABLE `bets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lot_id` bigint UNSIGNED NOT NULL,
  `bet` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `bets`
--

INSERT INTO `bets` (`id`, `user_id`, `lot_id`, `bet`, `created_at`, `updated_at`) VALUES
(1, 1, 30, 3010000, '2020-10-19 10:38:06', '2020-10-19 10:38:06'),
(2, 1, 31, 3010000, '2020-10-19 10:42:53', '2020-10-19 10:42:53');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `sort` int NOT NULL DEFAULT '500',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `sort`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 100, 'Живопись', 'categories/August2020/IomQFXiIPf2yuZwXkPsE.jpeg', '2020-06-12 08:48:45', '2020-08-14 23:19:32'),
(2, 200, 'Графика', 'categories/August2020/vKpnrCHyloQlgWGGjIKF.jpeg', '2020-08-14 23:20:53', '2020-08-14 23:20:53'),
(3, 300, 'Инсталяции', 'categories/August2020/gF253c73ETYRx9eLbgss.jpeg', '2020-08-14 23:21:27', '2020-08-14 23:21:27'),
(4, 400, 'Скульптура', 'categories/August2020/BWnB7Oyzguejh8njLQv7.jpeg', '2020-08-14 23:22:17', '2020-08-14 23:22:17'),
(5, 500, 'Прикладное', 'categories/August2020/k7nS6x6UKpXOkoio9NJG.jpeg', '2020-08-14 23:22:57', '2020-08-14 23:22:57'),
(6, 600, 'Другое', 'categories/August2020/H59G1IBPutYde4FooQUM.jpeg', '2020-08-14 23:23:34', '2020-08-14 23:23:34');

-- --------------------------------------------------------

--
-- Структура таблицы `category_lot`
--

CREATE TABLE `category_lot` (
  `lot_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category_lot`
--

INSERT INTO `category_lot` (`lot_id`, `category_id`) VALUES
(37, 1),
(28, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 1, 1, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Имя', 1, 1, 1, 1, 1, 1, '{}', 6),
(3, 1, 'email', 'text', 'E-mail', 1, 1, 1, 1, 1, 1, '{}', 3),
(4, 1, 'password', 'password', 'Пароль', 1, 0, 0, 1, 1, 0, '{}', 17),
(5, 1, 'remember_token', 'text', 'Токен восстановления', 0, 0, 0, 0, 0, 0, '{}', 18),
(6, 1, 'created_at', 'timestamp', 'Дата создания', 0, 0, 0, 0, 0, 0, '{}', 19),
(7, 1, 'updated_at', 'timestamp', 'Дата обновления', 0, 0, 0, 0, 0, 0, '{}', 21),
(8, 1, 'avatar', 'image', 'Аватар', 0, 0, 0, 1, 1, 1, '{}', 22),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Роль', 0, 1, 1, 1, 1, 0, '{\"default\":\"3\",\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 24),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Имя', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Дата создания', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Дата обновления', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Имя', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Дата создания', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Дата обновления', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Отображаемое имя', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Роль', 0, 1, 1, 1, 1, 1, '{\"default\":\"3\"}', 23),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(27, 4, 'created_at', 'timestamp', 'Дата создания', 0, 0, 1, 0, 0, 0, '{}', 6),
(28, 4, 'updated_at', 'timestamp', 'Дата обновления', 0, 0, 0, 0, 0, 0, '{}', 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(32, 5, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 4),
(33, 5, 'excerpt', 'text_area', 'Отрывок', 1, 0, 1, 1, 1, 1, '{}', 5),
(34, 5, 'body', 'rich_text_box', 'Содержимое', 1, 0, 1, 1, 1, 1, '{}', 6),
(35, 5, 'image', 'image', 'Изображение Статьи', 0, 1, 1, 1, 1, 1, '{\"jpeg\":true,\"thumbnails\":[{\"name\":\"waterfall\",\"resize\":{\"width\":\"500\",\"height\":null}},{\"name\":\"preview\",\"crop\":{\"width\":\"320\",\"height\":\"200\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug (ЧПУ)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, '{}', 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '{}', 10),
(39, 5, 'status', 'select_dropdown', 'Статус', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Дата создания', 0, 0, 0, 0, 0, 0, '{}', 12),
(41, 5, 'updated_at', 'timestamp', 'Дата обновления', 0, 0, 0, 0, 0, 0, '{}', 13),
(42, 5, 'seo_title', 'text', 'SEO Название', 0, 0, 1, 1, 1, 1, '{}', 14),
(43, 5, 'featured', 'checkbox', 'Рекомендовано', 1, 0, 1, 1, 1, 1, '{}', 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(45, 6, 'author_id', 'text', 'Автор', 1, 0, 0, 0, 0, 0, '{}', 2),
(46, 6, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 3),
(47, 6, 'excerpt', 'text_area', 'Отрывок', 0, 0, 1, 1, 1, 1, '{}', 4),
(48, 6, 'body', 'rich_text_box', 'Содержимое', 0, 0, 1, 1, 1, 1, '{}', 5),
(49, 6, 'slug', 'text', 'Slug (ЧПУ)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 0, 0, 1, 1, 1, 1, '{}', 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 0, 0, 1, 1, 1, 1, '{}', 8),
(52, 6, 'status', 'select_dropdown', 'Статус', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Дата создания', 0, 1, 1, 0, 0, 0, '{}', 10),
(54, 6, 'updated_at', 'timestamp', 'Дата обновления', 0, 0, 0, 0, 0, 0, '{}', 11),
(55, 6, 'image', 'image', 'Изображение Страницы', 0, 1, 1, 1, 1, 1, '{}', 12),
(56, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 20),
(59, 1, 'surname', 'text', 'Фамилия', 0, 1, 1, 1, 1, 1, '{}', 5),
(60, 1, 'year', 'text', 'Год рождения', 0, 0, 0, 1, 1, 1, '{}', 8),
(61, 1, 'text', 'rich_text_box', 'Об авторе', 0, 0, 0, 1, 1, 1, '{}', 13),
(62, 1, 'fb', 'text', 'FaceBook', 0, 0, 0, 1, 1, 1, '{}', 14),
(63, 1, 'inst', 'text', 'Instagram', 0, 0, 0, 1, 1, 1, '{}', 15),
(64, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 11, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 2),
(66, 11, 'sublime', 'rich_text_box', 'Краткое описание', 0, 0, 1, 1, 1, 1, '{}', 4),
(67, 11, 'text', 'rich_text_box', 'Развернутое описание', 0, 0, 1, 1, 1, 1, '{}', 5),
(68, 11, 'attr', 'radio_btn', 'Атрибут', 1, 1, 1, 1, 1, 1, '{\"options\":{\"regular\":\"\\u0420\\u0435\\u0433\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439\",\"special\":\"\\u0421\\u043f\\u0435\\u0446\\u0438\\u0430\\u043b\\u044c\\u043d\\u044b\\u0439\"}}', 6),
(69, 11, 'date', 'timestamp', 'Дата проведения', 0, 1, 1, 1, 1, 1, '{}', 7),
(70, 11, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 14),
(71, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(89, 13, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(90, 13, 'title', 'text', 'Наименование', 1, 1, 1, 1, 1, 1, '{}', 3),
(91, 13, 'status', 'select_dropdown', 'Статус', 1, 0, 0, 1, 1, 1, '{\"options\":{\"empty\":\"\\u041d\\u0435 \\u0443\\u0441\\u0442\\u0430\\u043d\\u043e\\u0432\\u043b\\u0435\\u043d\",\"auction\":\"\\u0423\\u0447\\u0430\\u0432\\u0441\\u0442\\u0432\\u0443\\u0435\\u0442 \\u0432 \\u0430\\u0443\\u043a\\u0446\\u0438\\u043e\\u043d\\u0435\",\"gallery\":\"\\u0422\\u043e\\u0440\\u0433\\u0443\\u0435\\u0442\\u0441\\u044f \\u0432 \\u0433\\u0430\\u043b\\u0435\\u0440\\u0435\\u0435\",\"sold\":\"\\u041f\\u0440\\u043e\\u0434\\u0430\\u043d\\u043e\",\"discounted\":\"\\u0421\\u043d\\u044f\\u0442\\u043e \\u0441 \\u0442\\u043e\\u0440\\u0433\\u043e\\u0432\"}}', 7),
(92, 13, 'photo', 'image', 'Основное фото', 1, 1, 1, 1, 1, 1, '{\"jpeg\":true,\"thumbnails\":[{\"name\":\"waterfall\",\"resize\":{\"width\":\"500\",\"height\":\"null\"}},{\"name\":\"gallery\",\"resize\":{\"width\":\"500\",\"height\":\"500\"}},{\"name\":\"preview\",\"resize\":{\"width\":\"320\",\"height\":\"null\"}}]}', 5),
(93, 13, 'price', 'number', 'Стартовая цена', 1, 1, 1, 1, 1, 1, '{}', 10),
(98, 13, 'year', 'number', 'Год', 0, 0, 1, 1, 1, 1, '{}', 14),
(106, 13, 'text', 'rich_text_box', 'Описание', 0, 0, 1, 1, 1, 1, '{}', 15),
(107, 13, 'auction_id', 'text', 'Аукцион', 0, 0, 0, 1, 1, 1, '{}', 19),
(108, 13, 'user_id', 'text', 'Автор', 1, 0, 0, 1, 1, 1, '{}', 18),
(109, 13, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 1, 1, 1, '{}', 16),
(110, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 1, 1, 1, '{}', 17),
(111, 13, 'lot_belongsto_auction_relationship', 'relationship', 'Аукцион', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Auction\",\"table\":\"auctions\",\"type\":\"belongsTo\",\"column\":\"auction_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"auctions\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(113, 14, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(114, 14, 'title', 'text', 'Текст', 1, 1, 1, 1, 1, 1, '{}', 2),
(115, 14, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(116, 14, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(117, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(118, 15, 'title', 'text', 'Наименование', 1, 1, 1, 1, 1, 1, '{}', 2),
(119, 15, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(120, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(121, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(122, 16, 'title', 'text', 'Наименование', 1, 1, 1, 1, 1, 1, '{}', 2),
(123, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(124, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(125, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(126, 17, 'title', 'text', 'Наименование', 1, 1, 1, 1, 1, 1, '{}', 2),
(127, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(128, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(133, 1, 'middlename', 'text', 'Отчество', 0, 1, 1, 1, 1, 1, '{}', 7),
(134, 13, 'blitz', 'number', 'Блиц цена', 0, 1, 1, 1, 1, 1, '{}', 11),
(135, 13, 'width', 'number', 'Ширина, см', 0, 0, 1, 1, 1, 1, '{}', 13),
(136, 13, 'height', 'number', 'Высота, см', 0, 0, 1, 1, 1, 1, '{}', 12),
(137, 13, 'lot_belongsto_user_relationship', 'relationship', 'Автор', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"surname\",\"pivot_table\":\"users\",\"pivot\":\"0\",\"taggable\":\"0\"}', 2),
(138, 13, 'until', 'date', 'В галерее до', 0, 0, 0, 1, 1, 1, '{}', 9),
(141, 1, 'user_hasmany_user_exhibit_relationship', 'relationship', 'Выставки', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Exhibit\",\"table\":\"exhibits\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"exhibit_user\",\"pivot\":\"1\",\"taggable\":\"on\"}', 10),
(146, 1, 'user_belongstomany_group_relationship', 'relationship', 'Группировки', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Group\",\"table\":\"groups\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"group_user\",\"pivot\":\"1\",\"taggable\":\"on\"}', 12),
(147, 1, 'user_belongstomany_study_relationship', 'relationship', 'Обучение', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Study\",\"table\":\"studies\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"study_user\",\"pivot\":\"1\",\"taggable\":\"on\"}', 9),
(148, 1, 'user_belongstomany_profession_relationship', 'relationship', 'Профессии', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Profession\",\"table\":\"professions\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"profession_user\",\"pivot\":\"1\",\"taggable\":\"on\"}', 11),
(149, 1, 'beh', 'text', 'Beh', 0, 0, 0, 1, 1, 1, '{}', 16),
(150, 1, 'phone', 'text', 'Phone', 0, 1, 1, 1, 1, 1, '{}', 4),
(151, 13, 'photos', 'multiple_images', 'Доп.фото', 0, 0, 0, 1, 1, 1, '{\"jpeg\":true,\"thumbnails\":[{\"name\":\"waterfall\",\"resize\":{\"width\":\"500\",\"height\":\"null\"}},{\"name\":\"gallery\",\"resize\":{\"width\":\"500\",\"height\":\"500\"}},{\"name\":\"preview\",\"resize\":{\"width\":\"320\",\"height\":\"null\"}}]}', 6),
(152, 13, 'lot_belongstomany_technique_relationship', 'relationship', 'Техники', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Technique\",\"table\":\"techniques\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"technique_lot\",\"pivot\":\"1\",\"taggable\":\"on\"}', 20),
(153, 13, 'lot_belongstomany_category_relationship', 'relationship', 'Категории', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Category\",\"table\":\"categories\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"category_lot\",\"pivot\":\"1\",\"taggable\":\"on\"}', 21),
(154, 13, 'lot_belongstomany_frame_relationship', 'relationship', 'Оформление', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Frame\",\"table\":\"frames\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"frame_lot\",\"pivot\":\"1\",\"taggable\":\"on\"}', 22),
(155, 13, 'lot_belongstomany_material_relationship', 'relationship', 'Материалы', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Material\",\"table\":\"materials\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"material_lot\",\"pivot\":\"1\",\"taggable\":\"on\"}', 23),
(156, 13, 'lot_belongstomany_style_relationship', 'relationship', 'Стили', 0, 0, 0, 1, 1, 1, '{\"model\":\"App\\\\Style\",\"table\":\"styles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"style_lot\",\"pivot\":\"1\",\"taggable\":\"on\"}', 24),
(157, 11, 'auction_hasmany_lot_relationship', 'relationship', 'Лоты', 0, 0, 1, 1, 1, 1, '{\"sortable\":true,\"sort\":{\"field\":\"sort\",\"direction\":\"asc\"},\"model\":\"App\\\\Lot\",\"table\":\"lots\",\"type\":\"hasMany\",\"column\":\"auction_id\",\"key\":\"id\",\"label\":\"photo\",\"pivot_table\":\"auctions\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(158, 13, 'sort', 'number', 'Sort', 1, 0, 0, 0, 0, 0, '{}', 4),
(159, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(160, 19, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(161, 19, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(162, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(163, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(164, 20, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(165, 20, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(166, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(167, 18, 'id', 'number', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(168, 18, 'title', 'text', 'Название', 1, 1, 1, 1, 1, 1, '{}', 2),
(169, 18, 'seo_title', 'text', 'SEO Название', 0, 1, 1, 1, 1, 1, '{}', 12),
(170, 18, 'excerpt', 'text_area', 'Отрывок', 1, 0, 1, 1, 1, 1, '{}', 3),
(171, 18, 'body', 'rich_text_box', 'Содержимое', 1, 0, 1, 1, 1, 1, '{}', 4),
(172, 18, 'image', 'image', 'Изображение Статьи', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 5),
(173, 18, 'slug', 'text', 'Slug (ЧПУ)', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 6),
(174, 18, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, '{}', 7),
(175, 18, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '{}', 8),
(176, 18, 'status', 'select_dropdown', 'Статус', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 9),
(177, 18, 'featured', 'checkbox', 'Рекомендовано', 1, 1, 1, 1, 1, 1, '{}', 13),
(178, 18, 'created_at', 'timestamp', 'Дата создания', 0, 1, 1, 0, 0, 0, '{}', 10),
(179, 18, 'updated_at', 'timestamp', 'Дата обновления', 0, 0, 0, 0, 0, 0, '{}', 11),
(180, 5, 'category', 'select_dropdown', 'Категория', 1, 1, 1, 1, 1, 1, '{\"default\":\"BLOG\",\"options\":{\"BLOG\":\"blog\",\"NEWS\":\"news\"}}', 10),
(181, 5, 'post_belongstomany_tag_relationship', 'relationship', 'Теги', 0, 0, 1, 1, 1, 1, '{\"model\":\"App\\\\Tag\",\"table\":\"tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"post_tag\",\"pivot\":\"1\",\"taggable\":\"on\"}', 16),
(182, 21, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(183, 21, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(184, 21, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(185, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(186, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(187, 22, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(188, 22, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(189, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(190, 23, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(191, 23, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(192, 23, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(193, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(194, 5, 'images', 'multiple_images', 'Галерея', 0, 0, 1, 1, 1, 1, '{\"jpeg\":true,\"thumbnails\":[{\"name\":\"waterfall\",\"resize\":{\"width\":\"500\",\"height\":null}},{\"name\":\"preview\",\"crop\":{\"width\":\"320\",\"height\":\"200\"}}]}', 7),
(198, 11, 'header_image', 'image', 'Изображение шапки', 0, 0, 1, 1, 1, 1, '{\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"big\",\"crop\":{\"width\":\"1920\",\"height\":\"600\"},\"upsize\":true},{\"name\":\"narrow\",\"crop\":{\"width\":\"1920\",\"height\":\"300\"},\"upsize\":true},{\"name\":\"narrowest\",\"crop\":{\"width\":\"1920\",\"height\":\"200\"},\"upsize\":true},{\"name\":\"bigxs\",\"crop\":{\"width\":\"302\",\"height\":\"280\"},\"upsize\":true},{\"name\":\"narrowxs\",\"crop\":{\"width\":\"302\",\"height\":\"280\"},\"upsize\":true},{\"name\":\"narrowestxs\",\"crop\":{\"width\":\"302\",\"height\":\"280\"},\"upsize\":true}]}', 8),
(202, 11, 'header_text', 'text', 'Текст шапки', 0, 0, 1, 1, 1, 1, '{}', 9),
(205, 11, 'announce_text', 'text', 'Текст анонса', 0, 0, 1, 1, 1, 1, '{}', 13),
(206, 11, 'announce_image', 'image', 'Изображение анонса', 0, 0, 1, 1, 1, 1, '{\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"xxxl\",\"crop\":{\"width\":\"920\",\"height\":\"480\"},\"upsize\":true},{\"name\":\"xxl\",\"crop\":{\"width\":\"920\",\"height\":\"480\"},\"upsize\":true},{\"name\":\"xl\",\"crop\":{\"width\":\"736\",\"height\":\"480\"},\"upsize\":true},{\"name\":\"lg\",\"crop\":{\"width\":\"736\",\"height\":\"480\"},\"upsize\":true},{\"name\":\"md\",\"crop\":{\"width\":\"752\",\"height\":\"360\"},\"upsize\":true},{\"name\":\"sm\",\"crop\":{\"width\":\"752\",\"height\":\"360\"},\"upsize\":true},{\"name\":\"xs\",\"crop\":{\"width\":\"302\",\"height\":\"280\"},\"upsize\":true}]}', 12),
(207, 11, 'to_announce', 'checkbox', 'Анонсировать', 1, 0, 0, 1, 1, 1, '{}', 11),
(208, 24, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(209, 24, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"options\":{\"workshop\":\"\\u041c\\u0430\\u0441\\u0442\\u0435\\u0440\\u0441\\u043a\\u0430\\u044f\",\"exhibition\":\"\\u0412\\u044b\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\"}}', 2),
(210, 24, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 3),
(211, 24, 'address', 'text', 'Address', 1, 1, 1, 1, 1, 1, '{}', 4),
(212, 24, 'coords', 'coordinates', 'Coords', 1, 1, 1, 1, 1, 1, '{}', 5),
(213, 24, 'zoom', 'number', 'Zoom', 1, 0, 1, 1, 1, 1, '{}', 6),
(214, 24, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 7),
(215, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(216, 5, 'date', 'timestamp', 'Date', 0, 1, 1, 1, 1, 1, '{}', 2),
(217, 11, 'sort', 'number', 'Сортировка', 1, 1, 1, 1, 1, 1, '{}', 3),
(218, 11, 'to_gallery', 'checkbox', 'В галерее', 1, 0, 0, 1, 1, 1, '{}', 10),
(219, 25, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(220, 25, 'title', 'text', 'Заголовок', 1, 1, 1, 1, 1, 1, '{}', 2),
(221, 25, 'seo_title', 'text', 'Seo Заголовок', 1, 0, 1, 1, 1, 1, '{}', 3),
(222, 25, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, '{}', 4),
(223, 25, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, '{}', 5),
(224, 25, 'start', 'timestamp', 'Начало', 0, 1, 1, 1, 1, 1, '{}', 6),
(225, 25, 'finish', 'timestamp', 'Окончание', 0, 1, 1, 1, 1, 1, '{}', 7),
(226, 25, 'excerpt', 'text', 'Анонс', 1, 0, 1, 1, 1, 1, '{}', 8),
(227, 25, 'body', 'rich_text_box', 'Описание', 1, 0, 1, 1, 1, 1, '{}', 9),
(228, 25, 'image', 'image', 'Изображение', 0, 1, 1, 1, 1, 1, '{\"jpeg\":true,\"thumbnails\":[{\"name\":\"waterfall\",\"resize\":{\"width\":\"500\",\"height\":null}},{\"name\":\"preview440\",\"crop\":{\"width\":\"440\",\"height\":\"360\"}},{\"name\":\"preview\",\"crop\":{\"width\":\"320\",\"height\":\"200\"}}]}', 10),
(229, 25, 'images', 'multiple_images', 'Галерея', 0, 0, 1, 1, 1, 1, '{\"jpeg\":true,\"thumbnails\":[{\"name\":\"waterfall\",\"resize\":{\"width\":\"500\",\"height\":null}},{\"name\":\"preview440\",\"crop\":{\"width\":\"440\",\"height\":\"360\"}},{\"name\":\"preview\",\"crop\":{\"width\":\"320\",\"height\":\"200\"}}]}', 11),
(230, 25, 'status', 'select_dropdown', 'Статус', 1, 0, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 12),
(231, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 13),
(232, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(233, 25, 'event_belongsto_space_relationship', 'relationship', 'Пространство', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Space\",\"table\":\"spaces\",\"type\":\"belongsTo\",\"column\":\"space_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"auctions\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(235, 26, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(237, 26, 'description', 'text_area', 'Анонс', 1, 0, 1, 1, 1, 1, '{}', 4),
(238, 26, 'image', 'image', 'Фото', 1, 1, 1, 1, 1, 1, '{\"jpeg\":true,\"thumbnails\":[{\"name\":\"preview\",\"crop\":{\"width\":\"200\",\"height\":\"200\"}}]}', 5),
(239, 26, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 1, 0, 1, '{}', 6),
(240, 26, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(241, 26, 'name', 'text', 'Имя', 1, 1, 1, 1, 1, 1, '{}', 2),
(242, 26, 'lastname', 'text', 'Фамилия', 1, 1, 1, 1, 1, 1, '{}', 3),
(243, 4, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(244, 4, 'image', 'image', 'Image', 0, 1, 1, 1, 1, 1, '{\"jpeg\":true,\"thumbnails\":[{\"name\":\"preview\",\"crop\":{\"width\":\"200\",\"height\":\"200\"}}]}', 5),
(245, 25, 'space_id', 'text', 'Space Id', 1, 1, 1, 1, 1, 1, '{}', 3),
(246, 11, 'status', 'select_dropdown', 'Статус', 1, 1, 1, 1, 1, 1, '{\"options\":{\"coming\":\"\\u041f\\u0440\\u0435\\u0434\\u0441\\u0442\\u043e\\u044f\\u0449\\u0438\\u0439\",\"started\":\"\\u0422\\u0435\\u043a\\u0443\\u0449\\u0438\\u0439\",\"finished\":\"\\u0417\\u0430\\u0432\\u0435\\u0440\\u0448\\u0435\\u043d\",\"canceled\":\"\\u041e\\u0442\\u043c\\u0435\\u043d\\u0435\\u043d\"}}', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'Пользователь', 'Пользователи', 'voyager-person', 'App\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '\\App\\Http\\Controllers\\Voyager\\VoyagerUserController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-05-21 04:06:59', '2020-07-09 11:57:11'),
(2, 'menus', 'menus', 'Меню', 'Меню', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(3, 'roles', 'roles', 'Роль', 'Роли', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(4, 'categories', 'categories', 'Категория', 'Категории', 'voyager-categories', 'App\\Category', NULL, '\\App\\Http\\Controllers\\Voyager\\VoyagerLotController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-05-21 04:07:11', '2020-08-15 02:14:48'),
(5, 'posts', 'posts', 'Статья', 'Статьи', 'voyager-news', 'App\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '\\App\\Http\\Controllers\\Voyager\\VoyagerBaseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-05-21 04:07:11', '2020-07-31 08:27:35'),
(6, 'pages', 'pages', 'Страница', 'Страницы', 'voyager-file-text', 'App\\Page', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-05-21 04:07:11', '2020-07-20 10:39:33'),
(11, 'auctions', 'auctions', 'Аукцион', 'Аукционы', 'voyager-pie-chart', 'App\\Auction', NULL, '\\App\\Http\\Controllers\\Voyager\\VoyagerBaseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-09 10:32:51', '2020-09-29 03:05:09'),
(13, 'lots', 'lots', 'Лот', 'Лоты', 'voyager-images', 'App\\Lot', NULL, '\\App\\Http\\Controllers\\Voyager\\VoyagerLotController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":\"id\",\"scope\":null}', '2020-06-09 10:35:48', '2020-07-31 08:19:40'),
(14, 'frames', 'frames', 'Оформление картины', 'Frames', NULL, 'App\\Frame', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-11 04:13:46', '2020-06-11 06:48:29'),
(15, 'materials', 'materials', 'Материал', 'Materials', NULL, 'App\\Material', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-11 04:14:10', '2020-06-11 06:48:07'),
(16, 'styles', 'styles', 'Стиль', 'Styles', NULL, 'App\\Style', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-11 04:14:36', '2020-06-11 06:47:51'),
(17, 'techniques', 'techniques', 'Техника', 'Techniques', NULL, 'App\\Technique', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-11 04:15:05', '2020-06-11 06:47:39'),
(18, 'news', 'news', 'Новость', 'Новости', 'voyager-news', 'App\\News', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-06-28 20:10:25', '2020-06-29 06:38:30'),
(19, 'professions', 'professions', 'Profession', 'Professions', NULL, 'App\\Profession', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-29 05:02:44', '2020-06-29 05:02:44'),
(20, 'exhibits', 'exhibits', 'Exhibit', 'Exhibits', NULL, 'App\\Exhibit', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-06-29 05:02:54', '2020-06-29 05:02:54'),
(21, 'tags', 'tags', 'Tag', 'Tags', NULL, 'App\\Tag', NULL, NULL, NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-09 11:52:50', '2020-07-09 11:52:50'),
(22, 'studies', 'studies', 'Study', 'Studies', NULL, 'App\\Study', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-09 11:54:40', '2020-07-09 11:54:40'),
(23, 'groups', 'groups', 'Group', 'Groups', NULL, 'App\\Group', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-07-09 11:54:54', '2020-07-09 11:54:54'),
(24, 'spaces', 'spaces', 'Space', 'Spaces', NULL, 'App\\Space', NULL, '\\App\\Http\\Controllers\\Voyager\\VoyagerBaseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-07-26 12:14:30', '2020-08-03 10:27:35'),
(25, 'events', 'events', 'Событие', 'События', NULL, 'App\\Event', NULL, '\\App\\Http\\Controllers\\Voyager\\VoyagerBaseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-03 04:53:54', '2020-08-23 05:30:03'),
(26, 'experts', 'experts', 'Expert', 'Experts', NULL, 'App\\Expert', NULL, '\\App\\Http\\Controllers\\Voyager\\VoyagerBaseController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-08-03 06:36:40', '2020-08-03 06:40:24');

-- --------------------------------------------------------

--
-- Структура таблицы `events`
--

CREATE TABLE `events` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `space_id` bigint UNSIGNED NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `finish` timestamp NULL DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `events`
--

INSERT INTO `events` (`id`, `title`, `space_id`, `seo_title`, `meta_description`, `meta_keywords`, `start`, `finish`, `excerpt`, `body`, `image`, `images`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Выставка посвященная дню железнодорожника', 1, '', '', '', '2020-07-31 11:00:00', '2020-08-12 13:00:00', 'Живопись. Графика. Плакат.', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">Живопись. Графика. Плакат. Посвящённо истории железнодорожного транспорта.</span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">Открытие состоялось 31 июля в 14:00.</span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">&nbsp;</span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">Выставка работает по будням с 12 до 16 часов.<br />Вход бесплатный.</span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">ДК РУТ (МИИТ) 2 этаж, Белый зал.</span></p>', 'events/August2020/8jfOTLKJqwYEVnQXs8uR.jpg', '[\"events\\/August2020\\/7FpjYKKrRAqLFUX4WydC.jpg\",\"events\\/August2020\\/z8D96PZrQBRxLLNDqkbz.jpg\"]', 'PUBLISHED', '2020-08-03 10:10:00', '2020-08-23 05:31:08'),
(2, 'V ежегодный международный фестиваль «Абстракция без границ»', 1, '', '', '', '2020-08-15 15:00:00', '2020-09-01 15:00:00', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Открытие состоится 15 августа во Дворце культуры РУТ (МИИТ)<br style=\"box-sizing: border-box;\" />Сбор гостей в 18.00<br style=\"box-sizing: border-box;\" />Открытие: в 19.00<br style=\"box-sizing: border-box;\" />Перформанс: в 20.00<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; color: #ff0000;\"><strong style=\"box-sizing: border-box;\">Маски и перчатки обязательно!</strong></span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Фестиваль проводится при содействии: IMDR art gallery, &laquo;David Ru Foundation&raquo;, ТСХР, Галерея современного искусства ГМИИ РТ, Координационный центр Поволжского отделения Российской академии художеств, газета ТСХР<br style=\"box-sizing: border-box;\" />При поддержке: журналов, газет, телерадиокомпаний</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Наблюдая последние тенденции в науке и жизни, приходишь к выводу, что практически нет ничего невозможного для современного человека. Он уже может менять свою внешность практически до полной неузнаваемости. Лепит своё тело и пространство вокруг него. Вот тут и возникает вопрос. Что же останется стержнем-остовом, соединяющим нас, ныне живущих, с прошлыми и будущими поколениями? Что будет определять наше сознание и поступки? Символы веры и слова останутся навечно. Может, названия их будут меняться, но графические изображения-символы останутся, и сквозь них будет продолжать вещать эталонный поток знаний. Символ не только узнаваемый силуэт &mdash; это и цвет, и фактура, и запах, и звук. Вообще это средство, с помощью которого можно универсально понятно и полно донести информацию до адресата. Сообщение о чувствах и переживаниях. Картину, отображающую внутреннюю, духовную жизнь. От одного создания к другому, обогащая его внутренне, привнося новые краски в настоящее. Весь нынешний прогресс науки ведет к более качественным сверхчувствительным способам передачи информации. Но что может сравниться с человеческими чувствами и способностью сопереживать? Так, самое главное &mdash; развивать эту способность, а самый верный способ &mdash; это участвовать в творческом процессе посредством переживания-осмысления творчества художников. Строить неразрывную структуру связи духа.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Мир, где мы живем, &mdash; просто коллективная визуализация.</strong></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Собственно говоря, это то, единственное, что одно поколение передает другому. Но какие бы формы ни были нам предписаны прошлым, на самом деле, каждый из нас все равно видит в жизни только отражение своего собственного я.<br style=\"box-sizing: border-box;\" />Абстракция &mdash; это та система координат, которая позволяет отталкиваться в пространстве и возвращаться обратно новом качестве, при этом меняясь, остается абстрактной.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">ТЕАТР ЖИВОПИСИ в рамках проекта &laquo;Абстракция без границ&raquo;:</strong><br style=\"box-sizing: border-box;\" />Куратор проекта Давид Ру, Ирина Матинян (США),<br style=\"box-sizing: border-box;\" />Николай Попов (Россия)<br style=\"box-sizing: border-box;\" />Участники проекта: Давид Ру. Эндрю Квин (Италия). Ирина Матинян (США). Евгений Ципулин. Ирина Уварова. Николай Попов. Грант Гарибян. Мария Градова, Александр Соколов, Федор Архипов.<br style=\"box-sizing: border-box;\" />Музыка: Николай Попов.<br style=\"box-sizing: border-box;\" />Видеохудожники: Эндрю Квинн (Италия),<br style=\"box-sizing: border-box;\" />Ирина Матинян (США), Рэм Квадрига (Россия)<br style=\"box-sizing: border-box;\" />Художник, перформер: Давид Ру, Ирина Матинян (США), Мария Градова.<br style=\"box-sizing: border-box;\" />Музыканты:<br style=\"box-sizing: border-box;\" />Алексей Наджаров (клавишные, электроника) (Россия)<br style=\"box-sizing: border-box;\" />Юрий Яремчук (саксофон) (Россия)<br style=\"box-sizing: border-box;\" />Алексей Потапов (гитара) (Россия)<br style=\"box-sizing: border-box;\" />Басем Аль &mdash; Ашкар (скрипка, уд) (Россия)</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">При поддержке: центра электроакустической музыки Московской консерватории и центра современной музыки Московской консерватории</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">По итогам фестиваля выпускается бюллетень фестиваля, включающий обзоры событий, аналитику, избранные работы художников, тенденции.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Участники проекта:</strong><br style=\"box-sizing: border-box;\" />Мюриэль Массан (Франция),<br style=\"box-sizing: border-box;\" />Сигал Рон (Израиль),<br style=\"box-sizing: border-box;\" />Мириана Савова (Болгария),<br style=\"box-sizing: border-box;\" />Марино Россетти (Италия),<br style=\"box-sizing: border-box;\" />Светла Радулова (Болгария),<br style=\"box-sizing: border-box;\" />Трейси Хэнсон (США),<br style=\"box-sizing: border-box;\" />Кванг Мо Гу (Южная Корея),<br style=\"box-sizing: border-box;\" />Давид Бабаян (Россия)<br style=\"box-sizing: border-box;\" />Алексей Кузнецов (Россия)<br style=\"box-sizing: border-box;\" />Франко Шиуско (Италия),<br style=\"box-sizing: border-box;\" />Чезаре Сачченти (Италия),<br style=\"box-sizing: border-box;\" />Мамабрил Фуэревентура (Испания),<br style=\"box-sizing: border-box;\" />Ирина Уварова (Россия)<br style=\"box-sizing: border-box;\" />Вивьен Груйе (Канада),<br style=\"box-sizing: border-box;\" />Елена Драгулелей (Румыния),<br style=\"box-sizing: border-box;\" />Евгений Ципулин (Россия),<br style=\"box-sizing: border-box;\" />Джина Нинкович (Турция),<br style=\"box-sizing: border-box;\" />Вольфганг Кале (Германия),<br style=\"box-sizing: border-box;\" />Константин Худяков (Россия)<br style=\"box-sizing: border-box;\" />Артуро Пачеко Луго (Мексика),<br style=\"box-sizing: border-box;\" />Антонио Сан Мартин (Испания),<br style=\"box-sizing: border-box;\" />Ричард Форстер (США),<br style=\"box-sizing: border-box;\" />Кенрио Хара (Япония),<br style=\"box-sizing: border-box;\" />Грант Гарибян (Россия),<br style=\"box-sizing: border-box;\" />Федор Архипов (Россия),<br style=\"box-sizing: border-box;\" />Ирина Матинян (США),<br style=\"box-sizing: border-box;\" />Александр Соколов (Россия),<br style=\"box-sizing: border-box;\" />Давид Ру (Россия),<br style=\"box-sizing: border-box;\" />Юра Арутюнян (Армения),<br style=\"box-sizing: border-box;\" />Николай Попов (Россия),<br style=\"box-sizing: border-box;\" />Эндрю Квин (Италия),<br style=\"box-sizing: border-box;\" />Николай Куняев (Россия),<br style=\"box-sizing: border-box;\" />Максим Демин (Россия),<br style=\"box-sizing: border-box;\" />Эччи Ааберг (Швеция),<br style=\"box-sizing: border-box;\" />Шахнила Мугиз (Оман),<br style=\"box-sizing: border-box;\" />Рашид Бахри (Испания),<br style=\"box-sizing: border-box;\" />Евгений Моргунов (Россия)<br style=\"box-sizing: border-box;\" />Руслан Гудиев (Россия)<br style=\"box-sizing: border-box;\" />Юрий Ланглебен (Россия)<br style=\"box-sizing: border-box;\" />Артурас Акопянс (Латвия)<br style=\"box-sizing: border-box;\" />Валерий Колотвин(Россия)<br style=\"box-sizing: border-box;\" />Константин Марков (Россия)<br style=\"box-sizing: border-box;\" />Марина Колотвина (Россия)<br style=\"box-sizing: border-box;\" />Константин Егоров (Россия)</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Телефон для справок: +7 958 803 16 30<br style=\"box-sizing: border-box;\" />ru-david@yandex.ru<br style=\"box-sizing: border-box;\" />Адрес: Новосущевский пер., д.,6, стр.1.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Фестиваль продлится до 31 августа 2020 года,&nbsp;<strong style=\"box-sizing: border-box;\">вход свободный</strong>.<br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box;\">*При посещении выставки организаторы мероприятия обращают внимание на необходимость использования индивидуальных средств защиты.</em></p>', 'events/August2020/QYTvOjBe6uWGReaMwW2C.jpg', NULL, 'PUBLISHED', '2020-08-18 05:54:00', '2020-08-23 05:30:49'),
(3, '«Неизвестный Горяев»', 1, '', '', '', '2020-09-10 19:00:00', '2020-09-28 17:00:00', '', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Н.Ф. &laquo;МУЗЕЙ ХУДОЖНИКА ВИТАЛИЯ ГОРЯЕВА&raquo; и ГАЛЕРЕЯ &laquo;ВСЕКОХУДОЖНИК&raquo;</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Приглашают 10 сентября 2020 года в 18:00<br style=\"box-sizing: border-box;\" />в выставочный зал Дома художника<br style=\"box-sizing: border-box;\" />Московского института инженеров транспорта</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">на торжественное открытие выставки &laquo;Неизвестный Горяев&raquo;,<br style=\"box-sizing: border-box;\" />посвященную 110-летию со дня рождения<br style=\"box-sizing: border-box;\" />народного художника СССР, лауреата государственной премии СССР.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Выставка работает</strong><br style=\"box-sizing: border-box;\" />с 10 по 28 сентября<br style=\"box-sizing: border-box;\" />с 13:00 до 20:00<br style=\"box-sizing: border-box;\" />ВЫХОДНОЙ ДЕНЬ ПОНЕДЕЛЬНИК</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">ВЫСТАВОЧНЫЙ ЗАЛ ДХ МИИТ<br style=\"box-sizing: border-box;\" />НОВОСУЩЕВСКИЙ ПЕРЕУЛОК, Дом 6, СТРОЕНИЕ 1</p>', 'events/September2020/DL4jdQgLz7wwQ0O31KUm.jpg', '[\"events\\/September2020\\/GphkUNBpuoLeQ0v3a1X8.jpg\"]', 'PUBLISHED', '2020-09-01 02:50:44', '2020-09-01 02:50:44'),
(5, 'Выставка художницы-керамистки Ольги Артемовой', 2, '', '', '', '2020-09-24 15:00:00', '2020-09-28 15:00:00', 'Что привлекает нас в произведениях искусства? Что заставляет рассматривать мельчайшие детали, желая прикоснуться к формам, изгибам и тонкому цветовому решению?', '<p><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">Что привлекает нас в произведениях искусства? Что заставляет рассматривать мельчайшие детали, желая прикоснуться к формам, изгибам и тонкому цветовому решению?</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">Есть замечательные слова: &laquo;Искусство заключается в том, чтобы найти необыкновенное в обыкновенном и обыкновенное в необыкновенном&raquo;. Кажется, именно они соответствуют работам известной московской художницы-керамистки Ольги Артемовой.</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">24 сентября в выставочном пространстве Мастер-класс галереи ВСЕКОХУДОЖНИК при поддержке Культурного Центра Мосарт открывается персональная выставка художницы, в чьем творчестве сочетаются душевная теплота лубочных сюжетов и богатые традиции русского фаянса.</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">Работы Ольги Васильевны находятся в фондах Государственного музея-заповедника Царицыно, Брянского художественного музея, Союза художников России, Музея русского искусства в Японии, частных коллекциях в России и за рубежом. И везде они заслужили высокое признание и любовь публики. Все, к чему прикасается рука художника, становится самобытным произведением искусства. Брутальность, яркий пластический язык, оптимистический настрой, мягкая ирония, шутливость &ndash; отличительные черты работ мастера.</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">На выставке будут представлены скульптуры малых форм, декоративные тарелки и предметы быта.</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">Выставка открыта для посетителей с 24 сентября по 8 октября 2020 года.</span></p>', 'events/September2020/DkL801S2A5kJlhJ6rhn0.jpg', '[\"events\\/September2020\\/3fXGE7VViurXSfjOO4Tk.jpg\",\"events\\/September2020\\/XCSv8UvrXm9d5z9EXR3l.jpg\",\"events\\/September2020\\/u2BiswrWsZ6wFUCGKJF3.jpg\",\"events\\/September2020\\/oB0HDWv6xolC5GE76Vhp.jpg\",\"events\\/September2020\\/AI1dAZtGy506YSCxDaSA.jpg\"]', 'PUBLISHED', '2020-09-25 10:48:00', '2020-09-25 10:53:01');

-- --------------------------------------------------------

--
-- Структура таблицы `exhibits`
--

CREATE TABLE `exhibits` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exhibits`
--

INSERT INTO `exhibits` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'dfsbvsdfvsdfv', '2020-06-11 11:28:04', '2020-06-11 11:28:04'),
(2, 'dfvsdfvss', '2020-06-11 11:28:14', '2020-06-11 11:28:14'),
(3, 'adsasdfasdfsdfadsf', '2020-06-12 06:33:17', '2020-06-12 06:33:17'),
(4, 'sdfsdfsdfwref3ewfw', '2020-06-12 06:36:19', '2020-06-12 06:36:19'),
(5, 'asdgasdgasdggasdgasd', '2020-06-12 06:36:41', '2020-06-12 06:36:41'),
(6, 'gsdfgasdgasdgasdgsdfgsdghf', '2020-06-12 06:37:10', '2020-06-12 06:37:10'),
(7, 'adfasdfa fadsfas dfasdf a', '2020-06-12 06:39:02', '2020-06-12 06:39:02'),
(8, 'asdfasdfaDFSASDFASDFSFDG', '2020-06-12 06:39:05', '2020-06-12 06:39:05'),
(9, 'ыупывап', '2020-06-12 06:56:31', '2020-06-12 06:56:31'),
(10, 'sadfgvbsdfzgdasdfasdfasdf', '2020-06-12 07:28:34', '2020-06-12 07:28:34'),
(11, 'asfasf', '2020-06-15 05:32:58', '2020-06-15 05:32:58'),
(12, 'sdfvdsf', '2020-06-15 09:52:15', '2020-06-15 09:52:15'),
(13, '1992 – Редакция журнала «Юность», Москва.', '2020-06-15 10:19:09', '2020-06-15 10:19:09'),
(14, '1995 – Международная ассоциация  «Мир через культуру», Москва.', '2020-06-15 10:19:17', '2020-06-15 10:19:17'),
(15, '1996 – Государственный институт Искусствознания МК РФ, Москва.', '2020-06-15 10:19:36', '2020-06-15 10:19:36'),
(16, '1996 – «Восточная галерея», Москва.', '2020-06-15 10:19:43', '2020-06-15 10:19:43'),
(17, '1997 –«Mandorla» Асшаффенбург, Германия.', '2020-06-15 10:19:50', '2020-06-15 10:19:50'),
(18, '1999 – «Восточная галерея», Москва.', '2020-06-15 10:19:57', '2020-06-15 10:19:57'),
(19, '1999 – Театр Маяковского, Москва.', '2020-06-15 10:20:06', '2020-06-15 10:20:06'),
(20, '2000 – Галерея «Парадиз», Москва.', '2020-06-15 10:20:16', '2020-06-15 10:20:16'),
(21, '2006 – «Herbarium», при поддержке журнала «Русское искусство», Государственный институт Искусствознания МК РФ, Москва.', '2020-06-15 10:20:23', '2020-06-15 10:20:23'),
(22, '2008 – «Облако, дерево, дом»  галерея «Древо», Москва', '2020-06-15 10:20:30', '2020-06-15 10:20:30'),
(23, '2009 – «Осень-AMBIENT» галерея «Светланы Сажиной», Москва.', '2020-06-15 10:20:38', '2020-06-15 10:20:38'),
(24, '2011 – «О чем не расскажешь словами» галерея «Светланы Сажиной», Москва.', '2020-06-15 10:20:46', '2020-06-15 10:20:46'),
(25, '2014 – «Странствия в не суетном мире», галерея «Отокомае», Москва.', '2020-06-15 10:20:56', '2020-06-15 10:20:56'),
(26, '2014 – «КАМЕНЬ и ХОЛСТ» совместно со скульптором Борисом Черствым, галерея Светланы Сажиной, Москва.', '2020-06-15 10:21:07', '2020-06-15 10:21:07'),
(27, '2015 - Архитектурная студия «ЛАДиФ». Москва.', '2020-06-15 10:21:16', '2020-06-15 10:21:16'),
(28, '2015 - Галерея «Dio Art Consalting», совместно с галереей «Gran Thornton».  Москва.', '2020-06-15 10:21:26', '2020-06-15 10:21:26'),
(29, '2016 - Галерея Dio Art Consulting в офисе компании Freshfields Bruckhaus Deringer. Москва.', '2020-06-15 10:21:33', '2020-06-15 10:21:33'),
(30, '2016 – «Светлое пространство»галерея 9/1, Усадьба Зубовых. Москва.', '2020-06-15 10:21:43', '2020-06-15 10:21:43'),
(31, '2017 – «ESSE» галерея Светланы Сажиной, Москва.', '2020-06-15 10:21:52', '2020-06-15 10:21:52'),
(32, '2018 – «Шаги» Мемориальный музей «Творческая мастерская С.Т. Коненкова». Москва.', '2020-06-15 10:22:03', '2020-06-15 10:22:03'),
(33, '2019 – «Ветер, ангелы и птицы». Галерея Светланы Сажиной. Москва.', '2020-06-15 10:22:12', '2020-06-15 10:22:12'),
(34, '2019 – «Белое облако». Фрунзенская наб., дом 10. Москва.', '2020-06-15 10:22:19', '2020-06-15 10:22:19'),
(35, '2020 – «Белое облако». Городская Художественная галерея. Город Саров.', '2020-06-15 10:22:26', '2020-06-15 10:22:26'),
(36, '1999 - выставка в выставочном зале «На Каширке»', '2020-06-15 10:27:57', '2020-06-15 10:27:57'),
(37, '2003 - Арт-Манеж проект «Город», Восточная галерея', '2020-06-15 10:28:04', '2020-06-15 10:28:04'),
(38, '2004 - Люкс Арт салон, Восточная  галерея', '2020-06-15 10:28:10', '2020-06-15 10:28:10'),
(39, '2004 - «Золотая кисть2004». XIV Московская выставки современного искусства', '2020-06-15 10:28:23', '2020-06-15 10:28:23'),
(40, '2004 - «Золотая кисть 2004». XIV Московская выставки современного искусства', '2020-06-15 10:28:38', '2020-06-15 10:28:38'),
(41, '2005 - «Золотая кисть 2005». ХV Московская  выставки современного искусства', '2020-06-15 10:28:44', '2020-06-15 10:28:44'),
(42, '2019 год – «Москва.Прорыв в будущие». МОСХ.', '2020-06-15 10:28:58', '2020-06-15 10:28:58'),
(43, '1985 - 16-я выставка молодых художников Москвы,  Дом Художника, Кузнецкий мост, 11, Москва', '2020-06-15 11:06:50', '2020-06-15 11:06:50'),
(44, '1986 - Весенняя выставка живописи,  Дом Художника, Кузнецкий мост, 11, Москва', '2020-06-15 11:06:57', '2020-06-15 11:06:57'),
(45, '1988 - 18-я выставка молодых художников Москвы,  Дом Художника,  Кузнецкий мост, 11, Москва', '2020-06-15 11:07:05', '2020-06-15 11:07:05'),
(46, '1988 - Весенняя выставка живописи,  Дом Художника, Кузнецкий мост, 11, Москва', '2020-06-15 11:07:13', '2020-06-15 11:07:13'),
(47, '1989 - «Вне жанра» (Манеж), Москва', '2020-06-15 11:07:20', '2020-06-15 11:07:20'),
(48, '1989 - Республиканская художественная выставка «Молодость России», ЦДХ, Москва', '2020-06-15 11:07:27', '2020-06-15 11:07:27'),
(49, '1991 - Республиканская выставка «Молодые художники России 1981-1991»,  Центральный выставочный зал, Краснодар', '2020-06-15 11:07:34', '2020-06-15 11:07:34'),
(50, '1997 - «Молодежная 97»,  Дом Художника, Кузнецкий мост, 11, Москва', '2020-06-15 11:07:41', '2020-06-15 11:07:41'),
(51, '1997 - «Солнечный квадрат», Египет', '2020-06-15 11:07:48', '2020-06-15 11:07:48'),
(52, '1998 - Выставка группы «Kunstкамера», ЦДХ, Москва', '2020-06-15 11:07:55', '2020-06-15 11:07:55'),
(53, '1998 - К. Опухлый,  С. Яшин, Натюрморт, ЦДХ, Москва', '2020-06-15 11:08:03', '2020-06-15 11:08:03'),
(54, '2002 - «Прогулки по берегу»  А. Гневушев – К. Опухлый, Реутов', '2020-06-15 11:08:10', '2020-06-15 11:08:10'),
(55, '2004 - Выставка графики МОСХ, Кузнецкий мост, 11, Москва', '2020-06-15 11:08:17', '2020-06-15 11:08:17'),
(56, '2005 - Международная выставка «60 лет Победы», ЦДХ, Москва', '2020-06-15 11:08:24', '2020-06-15 11:08:24'),
(57, '2005 - «Реальность и знак» А. Гневушев – К. Опухлый, «Галерея 21 века», Москва', '2020-06-15 11:08:33', '2020-06-15 11:08:33'),
(58, '2006 - «Солнечный квадрат», ЦДХ, Москва', '2020-06-15 11:08:41', '2020-06-15 11:08:41'),
(59, '2006 - Галерея «Ар-Сима» (групповая), Париж', '2020-06-15 11:08:47', '2020-06-15 11:08:47'),
(60, '2007 - «Солнечный квадрат», ЦДХ, Москва', '2020-06-15 11:08:54', '2020-06-15 11:08:54'),
(61, '2009 - Выставка графики МОСХ, ЦДХ, Москва', '2020-06-15 11:09:00', '2020-06-15 11:09:00'),
(62, '2009 - «Солнечный квадрат», ЦДХ, Москва', '2020-06-15 11:09:05', '2020-06-15 11:09:05'),
(63, '2009 - «Арт-Салон», Малый Манеж, Москва', '2020-06-15 11:09:13', '2020-06-15 11:09:13'),
(64, '2010 - «Искусство рисунка» (секция графики МСХ), Кузнецкий мост, 11, Москва', '2020-06-15 11:09:23', '2020-06-15 11:09:23'),
(65, '2011 - VI-я выставка секции графики МСХ, Кузнецкий мост, 11, Москва', '2020-06-15 11:09:30', '2020-06-15 11:09:30'),
(66, '2011 - Выставка «Среди миров», «Галерея 21 века», Москва', '2020-06-15 11:09:38', '2020-06-15 11:09:38'),
(67, '2012 - «Между прошлым и будущим» В. Архипов – К. Опухлый, Кузнецкий мост, 11, Москва', '2020-06-15 11:09:45', '2020-06-15 11:09:45'),
(68, '2012 - «De Rerum Natura», (персональная),  Галерея «Злата», Москва', '2020-06-15 11:09:53', '2020-06-15 11:09:53'),
(69, '2014 - Выставка МОСХ (Манеж), Москва', '2020-06-15 11:10:01', '2020-06-15 11:10:01'),
(70, '2015 - «Беззаботное скитание» А. Гневушев – К. Опухлый, Москва', '2020-06-15 11:10:08', '2020-06-15 11:10:08'),
(71, '2015 - Юбилей МГАХУ (групповая), Беговая, 7/9, Москва', '2020-06-15 11:10:14', '2020-06-15 11:10:14'),
(72, '2016 - Книга Трав и Деревьев (персональная) Галерея Вересов, Москва', '2020-06-15 11:10:20', '2020-06-15 11:10:20'),
(73, '1979 - квартирная выставка «Театрализация пространства»   «Русские в Ludlou». Великобритания, клуб художников Лондон. «Аукцион Druot». Париж. Франция.', '2020-06-15 11:30:53', '2020-06-15 11:30:53'),
(74, '1990 – Аукцион Philips, Son& Neal. Лондон. Великобритания «Contemprorari Russian Art». Ho-Am Gallery. Сеул Южная Корея.', '2020-06-15 11:31:12', '2020-06-15 11:31:12'),
(75, '1979 - квартирная выставка «Театрализация пространства»   «Русские в Ludlou». Великобритания, клуб художников Лондон. «Аукцион Druot». Париж. Франция.', '2020-06-15 11:31:50', '2020-06-15 11:31:50'),
(76, '1990 – Аукцион Philips, Son& Neal. Лондон. Великобритания  «Contemprorari Russian Art». Ho-Am Gallery. Сеул Южная Корея.', '2020-06-15 11:32:03', '2020-06-15 11:32:03'),
(77, '1991 – Выставка русских и датских художников «Проект 56-я параллель». ЦДХ Москва. Выставка русских и датских художников «Проект 56 –я параллель». Helliganshuset. Копенгаген. Дания.  Выставка русских художников. галерея Uggerbru. Ёринг. Дания.', '2020-06-15 11:32:52', '2020-06-15 11:32:52'),
(78, '1991 – Выставка русских художников, галерея OST I West. Копенгаген, Дания.  Персональная выставка адвокатская фирма «Bondo Svane» Копенгаген. Дания.', '2020-06-15 11:33:32', '2020-06-15 11:33:32'),
(79, '1991 - Выставка русских художников  (Упсалу, Швеция) Персональная выставка «Gvadalahara vista pure uno Russo». Expo-Plaza Taratia. Гвадалахара. Мексика.', '2020-06-15 11:33:46', '2020-06-15 11:33:46'),
(80, '1992 – Персональная выставка « Библия». ЦДХ, галерея СовАрт, Москва. Выставка русских художников. Expo Plaza de Tolego. Мадрид Испания.', '2020-06-15 11:33:54', '2020-06-15 11:33:54'),
(81, '1994 – Международный пленэр. Власино. Сербия. Выставка и аукцион в пользу детей Чернобыля. «Русский дом» - Пушкинский центр. Париж. Франция.', '2020-06-15 11:34:03', '2020-06-15 11:34:03'),
(82, '1995 – Персональная выставка под патронажем «Зонта клуб», Москва-2, ЦДЛ Москва. Выставка русских художников «Dacha Gallery» Ванкувер, Канада. Творческая командировка от Министерства культуры России. Торре Канавезе, Италия.', '2020-06-15 11:34:12', '2020-06-15 11:34:12'),
(83, '1997 – Персональная выставка Петровка 12. Москва. Благотворительный проект «Мир – 2000» Бахрейнская ассоциация художников, ЮНЕСКО. Останкинская башня. Москва. Лейпцигская ярмарка, Германия.', '2020-06-15 11:35:38', '2020-06-15 11:35:38'),
(84, '1997 - «Déjà vu» юбилейная выставка к 40-летию художника и 20-летию творческой деятельности. Галерея А-3, Москва.', '2020-06-15 11:35:52', '2020-06-15 11:35:52'),
(85, '2000-2004  «Операция улыбка» Благотворительный аукцион. Phillips de Pury & Luxembourg. Москва. 2001 – персональная  юбилейная выставка «Цветная неделя» МОСХ России', '2020-06-15 11:36:03', '2020-06-15 11:36:03'),
(86, '2005 - Персональная выставка. « Summer at the dacha». МОСХ России.', '2020-06-15 11:36:13', '2020-06-15 11:36:13'),
(87, '2006 - Благотворительный аукцион в пользу тарусской больнице. Москва', '2020-06-15 11:36:20', '2020-06-15 11:36:20'),
(88, '2007 - «Москва-Таруса» Таруса.', '2020-06-15 11:36:27', '2020-06-15 11:36:27'),
(89, '2007 - «Арт-Манеж» Москва', '2020-06-15 11:36:38', '2020-06-15 11:36:38'),
(90, '2008 - Благотворительная  выставка фонд  «Семья для каждого ребёнка» в Доме-Музее Марины Цветаевой', '2020-06-15 11:36:49', '2020-06-15 11:36:49'),
(91, '2008 - Благотворительный аукцион  «аrt-Сундук» (благотворительное общество «Адреса милосердия».', '2020-06-15 11:36:56', '2020-06-15 11:36:56'),
(92, '2009 - Пасхальная выставка совместно с Ольгой Волгиной – Эппле. «Пасхальные дары» дом Нащёкина.', '2020-06-15 11:37:14', '2020-06-15 11:37:14'),
(93, '2009 - Персональная  юбилейная выставка  г. Таруса', '2020-06-15 11:42:09', '2020-06-15 11:42:09'),
(94, '2009 - «Персональная выставка к 50-летию». Центр «Открытые проекты» Москва', '2020-06-15 11:42:16', '2020-06-15 11:42:16'),
(95, '2009 - дипломант выставки- конкурса им. В. Попкова.', '2020-06-15 11:42:24', '2020-06-15 11:42:24'),
(96, '2010 - «Москва- Таруса» г. Таруса. август.', '2020-06-15 11:42:31', '2020-06-15 11:42:31'),
(97, '2010 - Рождество на Беговой МОСХ России.', '2020-06-15 11:42:39', '2020-06-15 11:42:39'),
(98, '2010 - «Diema s dreams» Благотворительный аукцион. Красная площадь ГУМ.', '2020-06-15 11:42:47', '2020-06-15 11:42:47'),
(99, '2011 -  «Москва- Таруса» август г. Таруса.', '2020-06-15 11:42:55', '2020-06-15 11:42:55'),
(100, '2011 - «Diema s dreams» Благотворительный аукцион. Красная площадь ГУМ.', '2020-06-15 11:43:02', '2020-06-15 11:43:02'),
(101, '2011 - «Квадрат» выставка клуба «Творческие среды» ЦДХ.', '2020-06-15 11:43:07', '2020-06-15 11:43:07'),
(102, '2012- Дипломант выставки-конкурса им. В. Попкова.', '2020-06-15 11:43:14', '2020-06-15 11:43:14'),
(103, '2013-2014 - Рождество на Беговой.', '2020-06-15 11:43:20', '2020-06-15 11:43:20'),
(104, '2014 - Москва и москвичи.', '2020-06-15 11:43:26', '2020-06-15 11:43:26'),
(105, '2014 - Персональная выставка «Плоды трудов» галерея  «Веллум». Москва.', '2020-06-15 11:43:33', '2020-06-15 11:43:33'),
(106, '2014 - Персональная выставка к 55-летию. МОСХ России. Награждён медалью МОСХа России.', '2020-06-15 11:43:47', '2020-06-15 11:43:47'),
(107, '2015 - Рождество на Беговой МОСХ. «Ко дню города».', '2020-06-15 11:43:54', '2020-06-15 11:43:54'),
(108, '2017 - «Москва» Открытый клуб.', '2020-06-15 11:44:01', '2020-06-15 11:44:01'),
(109, '2018 - «Метро» Открытый клуб.', '2020-06-15 11:44:08', '2020-06-15 11:44:08'),
(110, '2018 - Передвижная выставка по городам России. Куратор М. Рошняк.', '2020-06-15 11:44:17', '2020-06-15 11:44:17'),
(111, '2019 - Персональная выставка  (день музеев) «Крымский пейзаж» музей А. Толстого.', '2020-06-15 11:44:24', '2020-06-15 11:44:24'),
(112, '2019 - Благотворительный аукцион в пользу детей с церебральным поражением центральной нервной системы «diema s dreams» отель Хайат. Москва.', '2020-06-15 11:44:35', '2020-06-15 11:44:35'),
(113, '2019 - Всероссийская выставка МОСХ.', '2020-06-15 11:44:42', '2020-06-15 11:44:42'),
(114, '2019 - «Семья» семейный проект в выставочном пространстве МК. Фрунзенская наб. д.10', '2020-06-15 11:45:03', '2020-06-15 11:45:03'),
(115, '2019 - Москва-Таруса', '2020-06-15 11:45:13', '2020-06-15 11:45:13'),
(116, '2019 - «Красная Шапочка» Открытый клуб.', '2020-06-15 11:45:21', '2020-06-15 11:45:21'),
(117, '2019 - «Традиции и современность» Конференция музейных работников»', '2020-06-15 11:45:30', '2020-06-15 11:45:30'),
(118, '2019 - «Дары» галерейный центр на Садово-Кудринской.', '2020-06-15 11:45:38', '2020-06-15 11:45:38'),
(119, '2020 - «Возвращение в родную гавань» совместная выставка с В. Флоренским. Зверевский центр.', '2020-06-15 11:45:49', '2020-06-15 11:45:49'),
(120, '1999 г. - Всероссийский фестиваль графического дизайна и компьютерной анимации «Граффит»', '2020-06-15 11:54:16', '2020-06-15 11:54:16'),
(121, '2000 г. - Выставка-продажа (серии графических работ, «авторских декоративных бутылок » в помещении кофейни «Kofe in».', '2020-06-15 11:54:32', '2020-06-15 11:54:32'),
(122, '2004 г. - Выставка МОСХ «Молодёжная-24» Москва', '2020-06-15 11:54:54', '2020-06-15 11:54:54'),
(123, '2007 г. - Выставка « Женские образы» Москва', '2020-06-15 11:55:04', '2020-06-15 11:55:04'),
(124, '2007 г. 2008 г. 20010 г. 2011 г. – Выставка «Москва-Таруса» г. Таруса', '2020-06-15 11:55:14', '2020-06-15 11:55:14'),
(125, '2008 г. - Благотворительная выставка фонд «Семья для каждого ребёнка» в Доме-Музее Марины Цветаевой', '2020-06-15 11:55:38', '2020-06-15 11:55:38'),
(126, '2008 г. - Благотворительный аукцион «аrtСундук » (благотворительное общество «Адреса милосердия».', '2020-06-15 11:55:50', '2020-06-15 11:55:50'),
(127, '2009 г. – пасхальная выставка совместно Леонидом Эппле. «Пасхальные дары»', '2020-06-15 11:56:03', '2020-06-15 11:56:03'),
(128, '2009 г.- дипломант VII-ой выставки-конкурса им. В. Попкова (организованного Международным Художественным Фондом)', '2020-06-15 11:56:14', '2020-06-15 11:56:14'),
(129, '2010 г. - Серия авторских открыток под названием «tёtki» и новогодний проект «Новогодняя открытка» в помещении ресторана «Сёстры Гримм»', '2020-06-15 11:56:26', '2020-06-15 11:56:26'),
(130, '2010 г .- Благотворительный Аукцион и Выставка. Благотворительный фонд «Детская больница» Посольство Ирландии', '2020-06-15 11:56:38', '2020-06-15 11:56:38'),
(131, '2011 г. - «Розовое - зелёное, жёлтое – голубое , красное - синее». ЦДХ выставка клуба «Творческие среды»', '2020-06-15 11:57:12', '2020-06-15 11:57:12'),
(132, '2011 г.- Персональная выставка. Галерейный центр «Артефакт» галерея «Веллум» Пречистенка', '2020-06-15 11:57:20', '2020-06-15 11:57:20'),
(133, '2011 г.- «Квадрат» выставка клуба «Творческие среды» ЦДХ.', '2020-06-15 11:57:35', '2020-06-15 11:57:35'),
(134, '2011 г. - «Портрет художника» ЦДХ.', '2020-06-15 11:57:41', '2020-06-15 11:57:41'),
(135, '2012 г. - «Творческие среды» ЦДХ.', '2020-06-15 11:57:50', '2020-06-15 11:57:50'),
(136, '2012 г. - Награждена Дипломом от правления МСХ и председателя клуба «Творческие среды» за лучшую работу выставки', '2020-06-15 11:58:04', '2020-06-15 11:58:04'),
(137, '2013 г.- «100лет 8 марта» клуб «Творческие среды» ЦДХ.', '2020-06-15 11:58:16', '2020-06-15 11:58:16'),
(138, '2014 г. – «Город-Рай» персональная выставка. Галерейный центр «Артефакт» галерея «Веллум»', '2020-06-15 11:58:24', '2020-06-15 11:58:24'),
(139, '2014 г. - «Любовь. Любовь! .Любовь?» галерея «Веллум».', '2020-06-15 11:58:41', '2020-06-15 11:58:41'),
(140, '2014 г. – «Живопись» Персональная выставка ЦДХ.', '2020-06-15 11:58:49', '2020-06-15 11:58:49'),
(141, '2015 г. - «40-это не больно!» персональная выставка в IL PALAZZO', '2020-06-15 11:59:18', '2020-06-15 11:59:18'),
(142, '2017 г. - персональная выставка «То чувство, когда...» выставочное пространство АРТ-ШКОЛА «Детали»', '2020-06-15 12:00:00', '2020-06-15 12:00:00'),
(143, '2019 г. - «Семья» семейная выставка в Арт-пространстве Мастер-Класс галерея ВСЕКОХУДОЖНИК.', '2020-06-15 12:00:20', '2020-06-15 12:00:20'),
(144, '2016 г. - участник Первого всероссийского форума молодежных творческих мастерских АРТ-МАСТЕРСКАЯ XXI Проект «ПРИРОДА БИНАРНОСТИ» (мастерская Свобода и вседозволенность) и Первого международного фестиваля «Абстракция без границ» (Москва/Казань)', '2020-06-15 12:20:26', '2020-06-15 12:20:26'),
(145, '2016 г. - участник международных выставок “ART FOR PEACE” и “MARTELLATO” (Италия)', '2020-06-15 12:21:00', '2020-06-15 12:21:00'),
(146, '1977 Групповая выставка: Н.Нестерова, И.Старженецкая, И.Мещерекова, Л.Гадаев. Москва', '2020-06-15 13:24:00', '2020-06-15 13:24:00'),
(147, '1977 VII биеннале стран Балтийского моря. Росток. Германия', '2020-06-15 13:24:12', '2020-06-15 13:24:12'),
(148, '1977 Автопортрет в русском и советском искусстве. Государственная Третьяковская галерея. Москва; Государственный Русский музей. С.-Петербург', '2020-06-15 13:24:21', '2020-06-15 13:24:21'),
(149, '1979 Пейзаж в русском и советском искусстве. Государственная Третьяковская галерея. Москва', '2020-06-15 13:24:31', '2020-06-15 13:24:31'),
(150, '1980 Советский пейзаж. Париж', '2020-06-15 13:24:40', '2020-06-15 13:24:40'),
(151, '1982 VL биеннале в Венеции. Итали', '2020-06-15 13:24:48', '2020-06-15 13:24:48'),
(152, '1982 Аспекты современного советского искусства. Музей П.Людвига. Кельн, Аахен. Германия', '2020-06-15 13:24:56', '2020-06-15 13:24:56'),
(153, '1986 Д. Шостакович и его время. Дуйсбург. Германия', '2020-06-15 13:25:07', '2020-06-15 13:25:07'),
(154, '1986 Аспекты современного советского искусства. Музей П.Людвига. Аахен. Германия', '2020-06-15 13:25:17', '2020-06-15 13:25:17'),
(155, '1987 Выставка, посвященная 150-летию со дня гибели А.С.Пушкина. Москва', '2020-06-15 13:25:27', '2020-06-15 13:25:27'),
(156, '1987 Персональная выставка совместно с А.Комелиным. Подольск. Россия', '2020-06-15 13:25:35', '2020-06-15 13:25:35'),
(157, '1987 Личный взгляд. Эдинбург, Лондон. Великобритания', '2020-06-15 13:25:44', '2020-06-15 13:25:44'),
(158, '1990 Персональная выставка. Манеж. С.-Петербург', '2020-06-15 13:25:54', '2020-06-15 13:25:54'),
(159, '1990-91 Вашингтон - Москва. Государственная Третьяковская галерея. Москва; Библиотека Карнеги. Вашингтон', '2020-06-15 13:26:08', '2020-06-15 13:26:08'),
(160, '1991 Выставка московских живописцев. Тампа. Флорида. США', '2020-06-15 13:26:16', '2020-06-15 13:26:16'),
(161, '1991 Аукцион в помощь Чернобылю. Флоренция. Италия', '2020-06-15 13:26:25', '2020-06-15 13:26:25'),
(162, '1992 Персональная выставка совместно с А.Комелиным. Осло. Норвегия', '2020-06-15 13:26:34', '2020-06-15 13:26:34'),
(163, '1993-94 Персональная выставка совместно с А.Комелиным. Государственная Третьяковская галерея. Москва', '2020-06-15 13:26:44', '2020-06-15 13:26:44'),
(164, '1994 Персональная выставка совместно с А.Комелиным. Калининград. Россия', '2020-06-15 13:26:53', '2020-06-15 13:26:53'),
(165, '1994 Московский музей \"Плеяды\". Центральный Дом художника. Москва', '2020-06-15 13:27:01', '2020-06-15 13:27:01'),
(166, '1985 - Музей современного искусства, Ереван, Армения.', '2020-06-16 06:37:45', '2020-06-16 06:37:45'),
(167, '1986 - Участник аукциона ДРЮО, Франция.', '2020-06-16 06:37:59', '2020-06-16 06:37:59'),
(168, '1990 - Музей современного искусства, Ереван, Армения.', '2020-06-16 06:38:07', '2020-06-16 06:38:07'),
(169, '1992 - Персональная выставка, Вена, Австрия.', '2020-06-16 06:38:17', '2020-06-16 06:38:17'),
(170, '1993 - Персональная выставка, Берлин, Германия.', '2020-06-16 06:38:27', '2020-06-16 06:38:27'),
(171, '1995 - Графика Армении, ЦДХ, Москва.', '2020-06-16 06:38:38', '2020-06-16 06:38:38'),
(172, '1996 - Автор проектов «Слияние Муз», «Экологические сны», Москва.', '2020-06-16 06:38:49', '2020-06-16 06:38:49'),
(173, '1997 - Выставка в Лас-Вегасе, США.', '2020-06-16 06:38:59', '2020-06-16 06:38:59'),
(174, '1997 - Персональная выставка, ЦДХ, Москва.', '2020-06-16 06:39:11', '2020-06-16 06:39:11'),
(175, '1998 - «Иная реальность», ЦДХ, Москва.', '2020-06-16 06:39:25', '2020-06-16 06:39:25'),
(176, '1998 - Первый Московский международный художественный салон, «Студия-13», ЦДХ, Москва.', '2020-06-16 06:39:40', '2020-06-16 06:39:40'),
(177, '1999 - Галерея ”Grant Gallery” (Сохо, Нью-Йорк, США), “The Other”(«Другое») с участием классиков нонконформизма и их последователей.', '2020-06-16 06:40:15', '2020-06-16 06:40:15'),
(178, '1999 - Выставка в Гамбурге, Германия.', '2020-06-16 06:40:25', '2020-06-16 06:40:25'),
(179, '2000 - Персональная выставка, Гоголевский б-р, 10, Москва.', '2020-06-16 06:40:33', '2020-06-16 06:40:33'),
(180, '2003 - 2004 - Участник и организатор всех выставок «Вернисаж 1+20»', '2020-06-16 06:40:44', '2020-06-16 06:40:44'),
(181, '2005 - Участник Фестиваля современного искусства - «АванГрад» в Магнитогорске.', '2020-06-16 06:40:54', '2020-06-16 06:40:54'),
(182, '2005 - 2006 - Участник Московского международного художественного салона в ЦДХ.', '2020-06-16 06:41:05', '2020-06-16 06:41:05'),
(183, '2006 - Участник 5 арт-ярмарки «Лучшие художественные галереи», галерея DavidGroup – «Вернисаж 1+20», Москва.', '2020-06-16 06:41:14', '2020-06-16 06:41:14'),
(184, '2006 - Организатор и участник юбилейной выставки «Вернисаж 1+20» – DavidGroup, Галерея на Солянке, Москва.', '2020-06-16 06:41:26', '2020-06-16 06:41:26'),
(185, '2006 - Участник Благотворительного Аукциона Современного Российского искусства «Операция Надежда», галерея DavidGroup, Посольство Европейского Союза, Москва.', '2020-06-16 06:41:49', '2020-06-16 06:41:49'),
(186, '2007 - МВЗ \"Галерея АЗ\" (Москва) - выставка \"Давид Ру – Владислав Зубарев\"', '2020-06-16 06:41:59', '2020-06-16 06:41:59'),
(187, '2007 - Проект \"Невозможные соединения\" \"Impossible combinations\", в Центральном выставочном зале \"PACKHOF\", г. Ханн.Мюнден, Германия.', '2020-06-16 06:42:07', '2020-06-16 06:42:07'),
(188, '2008 – \"Классики экспрессивного абстракционизма середины XX начала XXI века» (18 июля - 10 сентября 2008 г.), работы современных художников творческой группы «DAVIDGROUP». г.Сергиев-Посад.', '2020-06-16 06:42:15', '2020-06-16 06:42:15'),
(189, '2008 - Автор проекта «Джаз и его современники».', '2020-06-16 06:42:40', '2020-06-16 06:42:40'),
(190, '2008 - автор Выставочно-издательского международного проекта \"DavidGroup\" & \"Vernisage1-20\", Москва, Сергиев-Посад, Магнитогорск, Ереван, Санкт-Петербург, Кассель, Лос-Анджелес', '2020-06-16 06:42:49', '2020-06-16 06:42:49'),
(191, '2009 - Музей Нонконформистского Искусства, совместно с творческой студией «DavidGroup» и журналом-каталогом.', '2020-06-16 06:44:03', '2020-06-16 06:44:03'),
(192, '2011 - Российская академия художеств, Творческий союз художников России, Творческая студия «DAVIDGROUP» представляют выставочно-издательский проект «НЕ КВАДРАТ – ИНАЯ РЕАЛЬНОСТЬ», Экспрессивный абстракционизм второй половины XX - начала XXI вв.', '2020-06-16 06:44:19', '2020-06-16 06:44:19'),
(193, '2012 - Выставка «Над и за плоскостью», куратор Давид Ру.', '2020-06-16 06:44:30', '2020-06-16 06:44:30'),
(194, '2013 - Проект «МИФ И РЕАЛЬНОСТЬ», \"DavidGroup\" совместно с ливанским скульптором Раффи Токатляном, куратор проекта Давид Ру.', '2020-06-16 06:44:45', '2020-06-16 06:44:45'),
(195, '2013 - участие в проекте АТТРАКЦИОН ИСКУССТВА «ТЕТРАКСИС» в пространстве завода МОСХАОС (в рамках 5-й московской биеннале современного искусства).', '2020-06-16 06:44:53', '2020-06-16 06:44:53'),
(196, '2012, 2013, 2014 гг. - I, II, III - Международный проект «Абстрактное искусство в современной России», куратор проекта Давид Ру.', '2020-06-16 06:45:08', '2020-06-16 06:45:08'),
(197, '2014 - ПРОЕКТ «КЛАССИКА АБСТРАКЦИИ», выставка «Среда Абстракции». Центр дизайна ARTPLAY. Москва.', '2020-06-16 06:45:19', '2020-06-16 06:45:19'),
(198, '2014 - выставка \"Забытая Война\" (комментарии), масштабный арт-проект, посвящённый 100-летию Первой мировой войны. Винзавод, Москва.', '2020-06-16 06:45:30', '2020-06-16 06:45:30'),
(199, '2014 - Персональная выставка Давида Ру \"Музыка и абстракция\", Поволжское Отделение Российской Академии Художеств «ЛАВРУШИНСКИЙ 15», Москва', '2020-06-16 06:45:48', '2020-06-16 06:45:48'),
(200, '«Три путешествия. События и люди», галерея «Роза Азора», Москва (2019)', '2020-06-16 06:50:46', '2020-06-16 06:50:46'),
(201, '«Форма отношений», галерея «Красный мост», Вологда (2018)', '2020-06-16 06:50:55', '2020-06-16 06:50:55'),
(202, '«Рыба ждёт», галерея «Роза Азора», Москва (2018)', '2020-06-16 06:51:03', '2020-06-16 06:51:03'),
(203, '“été avec du caractère” («Лето с характером»), галерея “Galérie De lʼest”, Компьень, Франция (2018)', '2020-06-16 06:51:11', '2020-06-16 06:51:11'),
(204, '«Организованный оптимизм», музей Эрарта, Санкт-Петербург (2018)', '2020-06-16 06:51:19', '2020-06-16 06:51:19'),
(205, '«Южный ветер», Краснодарский художественный музей им. Коваленко (2017)', '2020-06-16 06:51:27', '2020-06-16 06:51:27'),
(206, '«Пляж», галерея «Роза Азора», Москва (2017)', '2020-06-16 06:51:35', '2020-06-16 06:51:35'),
(207, '“Counterpoints”, Wolfson College, Кембридж, Великобритания (2017 – 2016)', '2020-06-16 06:51:43', '2020-06-16 06:51:43'),
(208, '«Сборная по волейболу села Береговое», галерея «Роза Азора», Москва (2016)', '2020-06-16 06:51:51', '2020-06-16 06:51:51'),
(209, '«Диалог с Миро», Испанский культурный центр им. Сервантеса, Москва (2016)', '2020-06-16 06:51:58', '2020-06-16 06:51:58'),
(210, '«Атлас», галерея «Роза Азора», Москва (2015)', '2020-06-16 06:52:12', '2020-06-16 06:52:12'),
(211, '“Reflective Forms”, галерея ArtSpace, Кембридж, Великобритания (2013)', '2020-06-16 06:52:21', '2020-06-16 06:52:21'),
(212, 'Персональная выставка, Галерея «Марс», Москва (2008)', '2020-06-16 06:52:30', '2020-06-16 06:52:30'),
(213, 'Персональная выставка, галерея “Mimesis”, Женева, Швейцария (2007)', '2020-06-16 06:52:37', '2020-06-16 06:52:37'),
(214, 'Персональная выставка “Galerie Ncadrement”, Франция (2006)', '2020-06-16 06:52:46', '2020-06-16 06:52:46'),
(215, 'Персональная выставка, посольство Исландии (2006)', '2020-06-16 06:52:54', '2020-06-16 06:52:54'),
(216, 'Персональная выставка, галерея “Zee stone” + EastMeetsWestGallery, Гонконг (2001)', '2020-06-16 06:53:02', '2020-06-16 06:53:02'),
(217, 'Персональная выставка, галерея “Les Oreades”, Москва (1999) Избранные групповые выставки и проекты', '2020-06-16 06:53:11', '2020-06-16 06:53:11'),
(218, 'II Новосибирская Международная Триеннале графики (2018)', '2020-06-16 06:53:19', '2020-06-16 06:53:19'),
(219, 'Совместная выставка с Наталией Хохловой, галерея «Meinlchmidt», Баленген, Германия (2016)', '2020-06-16 06:53:27', '2020-06-16 06:53:27'),
(220, '«Закрытый сад», галерея А3 (2015)', '2020-06-16 06:53:34', '2020-06-16 06:53:34'),
(221, 'Участие в российско-германском проекте, галерея «Meinlchmidt», Баленген, Германия (2014)', '2020-06-16 06:53:41', '2020-06-16 06:53:41'),
(222, 'Совместная выставка с Н.Хохловой-Ланцевой и Екатериной Ермиловой, галерея «Открытый клуб», Москва (2014)', '2020-06-16 06:53:51', '2020-06-16 06:53:51'),
(223, 'Проект “Cité Internationale des Arts”, Париж, Франция (2013, 2014)', '2020-06-16 06:54:00', '2020-06-16 06:54:00'),
(224, 'Проект EastMeetsWestGallery «Сила воды», Политехнический музей, Москва (2012)', '2020-06-16 06:54:13', '2020-06-16 06:54:13'),
(225, '“Fluid Dynamics”, галерея ArtSpace, Кембридж, Великобритания (2012)', '2020-06-16 06:54:19', '2020-06-16 06:54:19'),
(226, '“Metageo”, посвященная К. Малевичу, Nadja Brykina Gallery AG, Цюрих, Швейцария (2012)', '2020-06-16 06:54:29', '2020-06-16 06:54:29'),
(227, '«Худграф», EastMeetsWestGallery, Новый Манеж, Москва (2011, 2010, 2009, 2007)', '2020-06-16 06:54:37', '2020-06-16 06:54:37'),
(228, 'Совместная выставка с Хансом Мендлером, галерея Saby Lazi, Штутгарт, Германия (2011)', '2020-06-16 06:54:45', '2020-06-16 06:54:45'),
(229, 'Совместная выставка с Наталией Хохловой, Констанц, Германия (2009)', '2020-06-16 06:54:52', '2020-06-16 06:54:52'),
(230, '“Art Deco”, Новый Манеж, Москва (2008)', '2020-06-16 06:54:59', '2020-06-16 06:54:59'),
(231, '«Лето в Ореадах», ЦДХ, Москва (2008)', '2020-06-16 06:55:06', '2020-06-16 06:55:06'),
(232, '“Euro-Art”, Женева, Швейцария (2005)', '2020-06-16 06:55:14', '2020-06-16 06:55:14'),
(233, 'I Международная Триеннале современной графики, Новосибирск (2001)', '2020-06-16 06:55:21', '2020-06-16 06:55:21'),
(234, '“Arte-2001”, Базель, Швейцария (2001)', '2020-06-16 06:55:28', '2020-06-16 06:55:28'),
(235, '«Пётр I в Англии», Лондон, Великобритания (1998)', '2020-06-16 06:55:36', '2020-06-16 06:55:36'),
(236, '2010 - персональная выставка в Русском музее', '2020-06-16 08:24:57', '2020-06-16 08:24:57'),
(237, '2012 - персональная выставка в Центральном доме художника', '2020-06-16 08:25:21', '2020-06-16 08:25:21'),
(238, '1983  Групповая выставка М.Андронова, И Калинина, П.Степанов, А.Царенков', '2020-06-16 08:40:11', '2020-06-16 08:40:11'),
(239, '1990  Групповая выставка 18-ти московских художников, Дом Художника на Кузнецком мосту, 20', '2020-06-16 08:40:18', '2020-06-16 08:40:18'),
(240, '1991 VII Триенале живописи в Индии', '2020-06-16 08:40:26', '2020-06-16 08:40:26'),
(241, '1997   Фестиваль живописи в Москве, ЦДХ', '2020-06-16 08:40:33', '2020-06-16 08:40:33'),
(242, '2001   Презентация альбома «Современные художники Москвы»', '2020-06-16 08:40:44', '2020-06-16 08:40:44'),
(243, '2001 Выставка «Однокурсники» в Московском доме скульптора', '2020-06-16 08:40:51', '2020-06-16 08:40:51'),
(244, '2002 70 лет МОСХ, ЦВЗ «Манеж»', '2020-06-16 08:40:59', '2020-06-16 08:40:59'),
(245, '2004, 2007, 2010 «Мир Живописи» в ЦДХ', '2020-06-16 08:41:08', '2020-06-16 08:41:08'),
(246, '2006 Международная выставка «Приношение Врубелю», г.Омск', '2020-06-16 08:41:14', '2020-06-16 08:41:14'),
(247, '2008 Выставка «Художники без границ», Музей современного искусства, Москва', '2020-06-16 08:41:21', '2020-06-16 08:41:21'),
(248, '2008 Групповая выставка  «Долгий день,  Дом Художника на Кузнецком мосту', '2020-06-16 08:41:27', '2020-06-16 08:41:27'),
(249, '2009  Групповая выставка  «Красное», Галерея А3', '2020-06-16 08:41:51', '2020-06-16 08:41:51'),
(250, '2010   Групповая выставка в музее Нонконформизма С.-Петербург', '2020-06-16 08:41:58', '2020-06-16 08:41:58'),
(251, '2010   Первая корейско-российская выставка изобразительного искусства', '2020-06-16 08:42:08', '2020-06-16 08:42:08'),
(252, '2020  Персональная выставка в Художественной галерее г.Энгельса', '2020-06-16 08:42:16', '2020-06-16 08:42:16'),
(253, '1942 — Фрунзе', '2020-06-16 11:13:11', '2020-06-16 11:13:11'),
(254, '1943 — Выставка акварели, Москва', '2020-06-16 11:13:20', '2020-06-16 11:13:20'),
(255, '1948 — Москва', '2020-06-16 11:13:30', '2020-06-16 11:13:30'),
(256, '1987 — «Александр Павлович Могилевский (1885—1980)», Москва', '2020-06-16 11:13:39', '2020-06-16 11:13:39'),
(257, '2015 — Выставка графики Александра Могилевского (к 130-летию со дня рождения), Мариупольский художественный музей имени Куинджи', '2020-06-16 11:14:26', '2020-06-16 11:14:26'),
(258, '1910 — 2-я выставка «Нового мюнхенского художественного общества», Мюнхен', '2020-06-16 11:14:40', '2020-06-16 11:14:40'),
(259, '1910—1911 — 3-я выставка «Нового мюнхенского художественного общества», Мюнхен', '2020-06-16 11:14:58', '2020-06-16 11:14:58'),
(260, '1912 — «Международная художественная выставка», Кёльн', '2020-06-16 11:15:06', '2020-06-16 11:15:06'),
(261, '1912 — «Новое искусство», Мюнхен, май-сентябрь', '2020-06-16 11:15:16', '2020-06-16 11:15:16'),
(262, '1912 — 2-я выставка «Новое искусство», Мюнхен, октябрь', '2020-06-16 11:15:25', '2020-06-16 11:15:25'),
(263, '1913 — Выставка «Бубнового валета», Санкт-Петербург, апрель-май', '2020-06-16 11:15:34', '2020-06-16 11:15:34'),
(264, '1913 — Первый немецкий осенний салон, Берлин, сентябрь-декабрь', '2020-06-16 11:15:43', '2020-06-16 11:15:43'),
(265, '1914 — «Новая живопись» («Экспрессионистская живопись»), Дрезден, январь', '2020-06-16 11:15:54', '2020-06-16 11:15:54'),
(266, '1914 — Выставка «Бубнового валета», Москва, февраль-март', '2020-06-16 11:16:03', '2020-06-16 11:16:03'),
(267, '1923 — «Русский книжный знак», Казань', '2020-06-16 11:16:15', '2020-06-16 11:16:15'),
(268, '1925 — «Русский книжный знак в гравюре», Ленинград', '2020-06-16 11:16:24', '2020-06-16 11:16:24'),
(269, '1926 — 1-я выставка графики, Москва', '2020-06-16 11:16:33', '2020-06-16 11:16:33'),
(270, '1927 — 2-я выставка графики, Москва', '2020-06-16 11:16:41', '2020-06-16 11:16:41'),
(271, '1927 — «Искусство книги», Лейпциг—Нюрнберг', '2020-06-16 11:16:50', '2020-06-16 11:16:50'),
(272, '1928 — 3-я выставка графики, Москва', '2020-06-16 11:17:00', '2020-06-16 11:17:00'),
(273, '1928 — Выставка общества «4 искусства», Москва', '2020-06-16 11:17:11', '2020-06-16 11:17:11'),
(274, '1928 — Международная выставка «Пресса», Кёльн', '2020-06-16 11:17:20', '2020-06-16 11:17:20'),
(275, '1930 — «Современное русское искусство», Вена', '2020-06-16 11:17:34', '2020-06-16 11:17:34'),
(276, '1930 — Выставка советского искусства, Берлин', '2020-06-16 11:17:44', '2020-06-16 11:17:44'),
(277, '2015 — Выставка графики Александра Могилевского (к 130-летию со дня рождения), Мариупольский художественный музей имени Куинджи', '2020-06-16 11:17:56', '2020-06-16 11:17:56'),
(278, '2014 / Выставка художественных работ ART.WHO.ART (ВДНХ)', '2020-06-16 11:30:12', '2020-06-16 11:30:12'),
(279, '2015 / Выставка художественных работ (МСХ)', '2020-06-16 11:30:18', '2020-06-16 11:30:18'),
(280, '2016 / Выставка художественных работ (МСХ)', '2020-06-16 11:30:24', '2020-06-16 11:30:24'),
(281, '2019 / Персональная выставка в культурном центре COME-IN', '2020-06-16 11:30:32', '2020-06-16 11:30:32'),
(282, '1991 - •	I персональная выставка живописи и графики.  Областной художественный музей, г. Курган', '2020-06-16 11:57:51', '2020-06-16 11:57:51'),
(283, '1991 - I персональная выставка живописи и графики.  Областной художественный музей, г. Курган', '2020-06-16 11:58:07', '2020-06-16 11:58:07'),
(284, '1992 - VII региональная выставка \"Урал\".  Областной художественный музей, г. Курган II персональная выставка.  Областная библиотека, г. Курган', '2020-06-16 11:58:45', '2020-06-16 11:58:45'),
(285, '1992 - VII региональная выставка \"Урал\".  Областной художественный музей, г. Курган', '2020-06-16 11:59:04', '2020-06-16 11:59:04'),
(286, '1992 - II персональная выставка.  Областная библиотека, г. Курган', '2020-06-16 11:59:15', '2020-06-16 11:59:15'),
(287, '1993 - \"Курганской области — 50 лет\".  Областной художественный музей, г. Курган', '2020-06-16 11:59:27', '2020-06-16 11:59:27'),
(288, '1993 - III персональная выставка.  Областной художественный музей, г. Курган', '2020-06-16 11:59:39', '2020-06-16 11:59:39'),
(289, '1994 - \"25 лет Курганской организации Союза художников России\".   г. Курган', '2020-06-16 11:59:53', '2020-06-16 11:59:53'),
(290, '1994 - \"Молодые художники Москвы\".  Выставочный зал \"Кузнецкий мост\", г. Москва', '2020-06-16 12:00:02', '2020-06-16 12:00:02'),
(291, '1995 - Персональная  выставка  живописи  и  графики.  Посольство США, г. Москва', '2020-06-16 12:00:12', '2020-06-16 12:00:12'),
(292, '1996 - IV персональная выставка.  Областная библиотека, г. Курган', '2020-06-16 12:00:24', '2020-06-16 12:00:24'),
(293, '1997 - I международное квадриеннале графики.  ЦДХ, г. Москва', '2020-06-16 12:00:33', '2020-06-16 12:00:33'),
(294, '1997 - \"Цветы и бабочки\".  Галерея \"Классика будущего\", г. Москва', '2020-06-16 12:00:42', '2020-06-16 12:00:42'),
(295, '1997 - I салон Московский дизайнер.  \"Галерея на Песчаной\", г. Москва', '2020-06-16 12:00:54', '2020-06-16 12:00:54'),
(296, '1997 - \"Художники России — 850-летию Москвы\".  ЦДХ, г. Москва', '2020-06-16 12:01:03', '2020-06-16 12:01:03'),
(297, '1998 - \"Художники в Переславль-Залесском\".  Областной краеведческий музей, г. Курган', '2020-06-16 12:01:20', '2020-06-16 12:01:20'),
(298, '1998 - I Фестиваль декоративно-прикладного искусства.  Выставочный зал \"Тушино\", г. Москва', '2020-06-16 12:01:32', '2020-06-16 12:01:32'),
(299, '1998 - VII региональная выставка «Урал» .  г.Уфа', '2020-06-16 12:01:41', '2020-06-16 12:01:41'),
(300, '1998 - Персональная выставка живописи.  г. Челябинск', '2020-06-16 12:01:52', '2020-06-16 12:01:52'),
(301, '1999 - IX республиканская выставка «Россия».  Выставочный зал \"Манеж\", г. Москва', '2020-06-16 12:02:01', '2020-06-16 12:02:01'),
(302, '1999 - Молодежная выставка.  Выставочный зал «Кузнецкий мост»,  г. Москва', '2020-06-16 12:02:44', '2020-06-16 12:02:44'),
(303, '1999 - Осенняя выставка Московских художников.  Выставочный зал «Кузнецкий мост», г. Москва', '2020-06-16 12:02:55', '2020-06-16 12:02:55'),
(304, '2000 - Молодежная выставка.  Выставочный зал «Кузнецкий мост»,  г. Москва', '2020-06-16 12:03:04', '2020-06-16 12:03:04'),
(305, '2000 - Республиканская выставка к 1000-летию Христианства, Манеж, г. Москва', '2020-06-16 12:03:12', '2020-06-16 12:03:12'),
(306, '2000 - Весенняя выставка Московских художников.  Выставочный зал «Кузнецкий мост», г. Москва', '2020-06-16 12:03:21', '2020-06-16 12:03:21'),
(307, '2001 - Молодежная выставка.  Выставочный зал «Кузнецкий мост»,  г. Москва', '2020-06-16 12:03:30', '2020-06-16 12:03:30'),
(308, '2000 - «Москва глазами молодых» Выставочный зал Префектуры ЦАО, г. Москва', '2020-06-16 12:03:41', '2020-06-16 12:03:41'),
(309, '2001 - «Москва глазами молодых» Выставочный зал Префектуры ЦАО, г. Москва', '2020-06-16 12:03:51', '2020-06-16 12:03:51'),
(310, '2001 - Осенняя выставка Московских художников.  Выставочный зал «Кузнецкий мост», г.. Москва', '2020-06-16 12:04:01', '2020-06-16 12:04:01'),
(311, '2002 - «Москва глазами молодых», Выставочный  зал Малый Манеж  г. Москва', '2020-06-16 12:04:11', '2020-06-16 12:04:11'),
(312, '2002 - Юбилейная выставка к 70-летию Московского Союза Художников «Мир живописи» ЦДХ.', '2020-06-16 12:04:29', '2020-06-16 12:04:29'),
(313, '2002 - Выставка молодых художников. г. Лима. Перу.', '2020-06-16 12:04:51', '2020-06-16 12:04:51'),
(314, '2002 - Выставка молодых художников. г. Сантьяго-де-Чили, Чили.', '2020-06-16 12:05:00', '2020-06-16 12:05:00'),
(315, '2003  «Космос глазами молодых», республика Куба.', '2020-06-16 12:05:10', '2020-06-16 12:05:10'),
(316, '2003 - «Космос глазами молодых», республика Куба.', '2020-06-16 12:05:16', '2020-06-16 12:05:16'),
(317, '2004 - X Всероссийская выставка «Россия», ЦДХ, г. Москва.', '2020-06-16 12:05:37', '2020-06-16 12:05:37'),
(318, '2004 - Персональная выставка живописи, ЦДХ, г. Москва.', '2020-06-16 12:05:45', '2020-06-16 12:05:45'),
(319, '2004 - «Москва глазами молодых», ЦДХ,  г. Москва', '2020-06-16 12:05:53', '2020-06-16 12:05:53'),
(320, '2004 - Выставка Московских художников к  Дню Города.  г. Москва', '2020-06-16 12:06:02', '2020-06-16 12:06:02'),
(321, '2004 - Групповая выставка к выходу 3-го альманаха «Художники Москвы», г. Москва', '2020-06-16 12:06:11', '2020-06-16 12:06:11'),
(322, '2005 - Международная выставка к 60-летию Победы «Победа», ЦДХ,  г. Москва', '2020-06-16 12:06:28', '2020-06-16 12:06:28'),
(323, '2005 - Выставка «Время быть вместе», г. Берлин, Германия.', '2020-06-16 12:06:48', '2020-06-16 12:06:48'),
(324, '2005 - Выставка «Время быть вместе», зал Тверская, 14,  г. Москва.', '2020-06-16 12:07:05', '2020-06-16 12:07:05'),
(325, '2006 - Выставка «Мир живописи и скульптуры», ЦДХ, г. Москва', '2020-06-16 12:07:17', '2020-06-16 12:07:17'),
(326, '2006 - Выставка живописи, Люксембург.', '2020-06-16 12:07:25', '2020-06-16 12:07:25'),
(327, '2006 - Выставка к Дню города, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:07:35', '2020-06-16 12:07:35'),
(328, '2006 - Молодежная выставка к Дню города, зал библиотеки, ул. Каретный ряд, г. Москва', '2020-06-16 12:07:44', '2020-06-16 12:07:44'),
(329, '2007 - Выставка «Мир живописи», ЦДХ, г. Москва', '2020-06-16 12:07:53', '2020-06-16 12:07:53'),
(330, '2007 - Выставка к Дню города, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:08:01', '2020-06-16 12:08:01'),
(331, '2007 - Молодежная выставка к Дню города, зал библиотеки, ул. Каретный ряд, г. Москва', '2020-06-16 12:08:09', '2020-06-16 12:08:09'),
(332, '2008 - Выставка к Дню города, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:08:19', '2020-06-16 12:08:19'),
(333, '2009 - Выставка к Дню города, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:08:29', '2020-06-16 12:08:29'),
(334, '2009 - Молодежная выставка к Дню города, зал библиотеки, ул. Каретный ряд, г. Москва', '2020-06-16 12:08:39', '2020-06-16 12:08:39'),
(335, '2010 - Выставка «Ню и натюрморт», Выставочный зал \"Кузнецкий мост\", г. Москва', '2020-06-16 12:08:49', '2020-06-16 12:08:49'),
(336, '2010 - Выставка к Дню города, зал на Тверской-Ямской, 20, г. Москва', '2020-06-16 12:09:14', '2020-06-16 12:09:14'),
(337, '2011 - Выставка Летний сезон, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:09:28', '2020-06-16 12:09:28'),
(338, '2011 - Выставка пленэрных работ на родине Есенина, с. Константиново, Рязанской обл.', '2020-06-16 12:09:37', '2020-06-16 12:09:37'),
(339, '2012 - Выставка к Дню города, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:09:46', '2020-06-16 12:09:46'),
(340, '2013 - Выставка к Дню города, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:09:56', '2020-06-16 12:09:56'),
(341, '2014 - Весенняя выставка московских художников, ЦДХ, г. Москва', '2020-06-16 12:10:07', '2020-06-16 12:10:07'),
(342, '2014 - Выставка к Дню города, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:10:16', '2020-06-16 12:10:16'),
(343, '2014 - IV Всероссийская выставка акварели, г. Курган, Областной художественный музей', '2020-06-16 12:10:29', '2020-06-16 12:10:29'),
(344, '2015 - Выставка Летний сезон, зал на Тверской-Ямской, 20, г. Москва.', '2020-06-16 12:10:38', '2020-06-16 12:10:38'),
(345, '2018 - V Всероссийская выставка акварели, г. Курган, Областной художественный музей', '2020-06-16 12:10:55', '2020-06-16 12:10:55'),
(346, '2000 – Арт Манеж (V Московская художественная ярмарка)', '2020-06-17 05:51:14', '2020-06-17 05:51:14'),
(347, '2001 – первая премия на 25, юбилейной молодежной выставке (МСХ)', '2020-06-17 05:51:26', '2020-06-17 05:51:26'),
(348, '2001 – диплом за участие во всероссийской выставке, «Молодые художники России»', '2020-06-17 05:51:32', '2020-06-17 05:51:32'),
(349, '2001 – «Новый Манеж», «Золотая кисть 2001»', '2020-06-17 05:51:38', '2020-06-17 05:51:38'),
(350, '2001 – диплом за участие в выставке – «Москва глазами молодых» (МСХ)', '2020-06-17 05:51:45', '2020-06-17 05:51:45'),
(351, '2002 – участие в благотворительной выставке, посвященной 70-летию Раисы Максимовны Горбачевой (Горбачев – Фонд)', '2020-06-17 05:51:53', '2020-06-17 05:51:53'),
(352, '2003 – Московский международный художественный салон «ЦДХ – 2003»; проект «Преемственность традиций. Шестидесятники и их ученики»', '2020-06-17 05:52:00', '2020-06-17 05:52:00'),
(353, '2003 – Диплом за участие на 27 молодежной выставке (МСХ)', '2020-06-17 05:52:07', '2020-06-17 05:52:07'),
(354, '2006 - Участие в выставке МСХ, в ЦДХ («Живопись и скульптура»)', '2020-06-17 05:52:18', '2020-06-17 05:52:18'),
(355, '2006 - Выставка в Праге', '2020-06-17 05:52:25', '2020-06-17 05:52:25'),
(356, '2006 - Выставка в здании МСХ', '2020-06-17 05:52:34', '2020-06-17 05:52:34'),
(357, '2006-2007 – Премия (стипендия)от Российского Союза Художников', '2020-06-17 05:52:43', '2020-06-17 05:52:43'),
(358, '2006 - Участие в выставке МСХ «Перспектива»', '2020-06-17 05:52:49', '2020-06-17 05:52:49'),
(359, '2007 - Участие во всероссийской молодёжной выставке МСХ', '2020-06-17 05:52:57', '2020-06-17 05:52:57'),
(360, '2007 - Молодёжная выставка МСХ.29-я', '2020-06-17 05:53:06', '2020-06-17 05:53:06'),
(361, '2007 - Выставки молодых художников в Хохловском переулке', '2020-06-17 05:53:13', '2020-06-17 05:53:13'),
(362, '2007 - Грамота от МСХ за активное участие в выставках(2006-2007гг)', '2020-06-17 05:53:21', '2020-06-17 05:53:21'),
(363, '2007 - Медаль от Академии художеств', '2020-06-17 05:53:27', '2020-06-17 05:53:27'),
(364, '2007 – Участие в выставке 250 лет Академии Художеств. Малый манеж', '2020-06-17 05:53:35', '2020-06-17 05:53:35'),
(365, '2008 – Выставка ЦДРИ', '2020-06-17 05:53:43', '2020-06-17 05:53:43'),
(366, '2008 – Участие в юбилейной выставке МСХ. Большой манеж', '2020-06-17 05:53:51', '2020-06-17 05:53:51'),
(367, '2008 - проект \"Аккумуляция\" в рамках 1 Московской международной биеннале молодого искусства \"Стой! Кто идет?\"', '2020-06-17 05:54:22', '2020-06-17 05:54:22'),
(368, '2007-2008 - Художник - постановщик на кинокартине \"Дау\", реж. И. Хржановский', '2020-06-17 05:54:32', '2020-06-17 05:54:32'),
(369, '2009 - участие в 30-ой выставке молодых художников в малом Манеже', '2020-06-17 05:54:40', '2020-06-17 05:54:40'),
(370, '2009 - проект \"Городки\" в рамках международной акции \"Ночь в музее\", площадка ГТГ', '2020-06-17 05:54:48', '2020-06-17 05:54:48'),
(371, '2009 - диплом и медаль от Московского Союза художников \"За заслуги в развитии изобразительного искусства\"', '2020-06-17 05:54:55', '2020-06-17 05:54:55'),
(372, '2010 - участие в выставке МСХ \"Мир живописи\" (ЦДХ)', '2020-06-17 05:55:04', '2020-06-17 05:55:04'),
(373, '2010- участие в выставке \"Диалог. Павел Никонов и молодые художники\" (Академия художеств)', '2020-06-17 05:55:10', '2020-06-17 05:55:10'),
(374, '2011 - участие в выставке МСХ \"Пробный шар\" (Музей В.И. Мухиной)', '2020-06-17 05:55:17', '2020-06-17 05:55:17'),
(375, '2011 - участие в выставке МСХ \" Юбилей Московского союза художников\" (Музей В.И. Мухиной)', '2020-06-17 05:55:24', '2020-06-17 05:55:24'),
(376, '2012 – участие в юбилейной выставке МСХ, МСХ-80 (Большой манеж)', '2020-06-17 05:55:30', '2020-06-17 05:55:30'),
(377, '2013 - участие в выставке Арт-коктейль (российско-бельгийская галерея D.E.V.A.)', '2020-06-17 05:55:36', '2020-06-17 05:55:36'),
(378, '2013 - Московский международный художественный салон \"ЦДХ-2013\" \" Проект \"Кому еще расти, тот поймет\"', '2020-06-17 05:55:43', '2020-06-17 05:55:43'),
(379, '2013 - участие в выставке \"Москва. Новое время\" (Галерея живописного искусства, ул. Тверская-Ямская, 20)', '2020-06-17 05:55:50', '2020-06-17 05:55:50'),
(380, '2013 - Выставочный проект «Чистое пространство большого города» \" в рамках биеннале «Москва. Пространство для жизни - пространство для творчества»\"', '2020-06-17 05:56:00', '2020-06-17 05:56:00'),
(381, '2014 - участие в выставке \"ВРЕМЯ ВПЕРЕД!\",в рамках проекта \"Цитаты\"', '2020-06-17 05:56:07', '2020-06-17 05:56:07'),
(382, '2014 - участие в выставке \"Клуб молодых живописцев\" , галлерея \"Ковчег\"', '2020-06-17 05:56:16', '2020-06-17 05:56:16'),
(383, '2015 - участие в выставке \"Клуб молодых живописцев\" в рамках выставки \"Знак, символ\" , галерея \"Ковчег \"', '2020-06-17 05:56:23', '2020-06-17 05:56:23'),
(384, '2015 - участие в проекте ТСХР  \"Гостиный Двор\", Visions Fine Art Gallery', '2020-06-17 05:56:31', '2020-06-17 05:56:31'),
(385, '2015 - участие в выставке МСХ \" 70 лет победы\" ( Дом художника на Кузнецком мосту, 11)', '2020-06-17 05:56:37', '2020-06-17 05:56:37'),
(386, '2015 - участие в выставке \"Клуб молодых живописцев\" в рамках выставки \"Атмосфера\" , галерея \"Ковчег\"', '2020-06-17 05:56:45', '2020-06-17 05:56:45'),
(387, '2015 - участие в выставке-мастерской «ХУДОЖНИКИДЕТИ», галерея \"А3\"', '2020-06-17 05:56:52', '2020-06-17 05:56:52'),
(388, '2016 - вступила в Творческий союз художников России', '2020-06-17 05:56:58', '2020-06-17 05:56:58'),
(389, '2016 - участие в выставке Клуба живописцев \"Чужая идея/ Цитата\" , галерея \"Ковчег\"', '2020-06-17 05:57:05', '2020-06-17 05:57:05'),
(390, '2016 - совместный медиа-проект с Натальей Ситниковой \"Реликтовый Свет\", галерея А3', '2020-06-17 05:57:12', '2020-06-17 05:57:12'),
(391, '2016 - персональная выставка в Российской Академии Искусств', '2020-06-17 05:57:19', '2020-06-17 05:57:19'),
(392, '2016 - участие в выставке \"Возвращение картины\", МСХ', '2020-06-17 05:57:27', '2020-06-17 05:57:27'),
(393, '2016 - участие в международном академическом выставочном проекте «Июнь 22. На стороне человека» в Братиславе', '2020-06-17 05:57:35', '2020-06-17 05:57:35'),
(394, '2016 - участие в выставке \"Красное и черное. Часть вторая.\", ЦДХ', '2020-06-17 05:57:52', '2020-06-17 05:57:52'),
(395, '2016 - диплом и медаль Международного Фонда \" Культурное достояние\"', '2020-06-17 05:57:59', '2020-06-17 05:57:59'),
(396, '2016 - участие в выставке Клуба московских живописцев, галерея \"Ковчег\"', '2020-06-17 05:58:05', '2020-06-17 05:58:05'),
(397, '2016 - участие в проекте Андрея Волкова и Натальи Георгадзе \"ЦветоАзбука от А до Я\". Галерея А3. ЦДХ', '2020-06-17 05:58:11', '2020-06-17 05:58:11'),
(398, '2017 - участие в выставке \"ИЮНЬ 22. На стороне человека\", галерея \"ЗДЕСЬ на Таганке\"', '2020-06-17 05:58:17', '2020-06-17 05:58:17');
INSERT INTO `exhibits` (`id`, `title`, `created_at`, `updated_at`) VALUES
(399, '2017 - участие в выставке \"ПУТЕШЕСТВИЯ\" Клуба московских живописцев, галерея \"Ковчег\"', '2020-06-17 05:58:23', '2020-06-17 05:58:23'),
(400, '2017 - участие в благотворительном аукционе \"Искусство ради жизни\" в поддержку центра реабилитации инвалидов \"Чайка\"', '2020-06-17 05:58:30', '2020-06-17 05:58:30'),
(401, '2017 - участие в медиа-проекте \"Горизонт событий\". ЦТИ Фабрика', '2020-06-17 05:58:36', '2020-06-17 05:58:36'),
(402, '2017-2018 - роспись переговорной театра де Шатле (THÉÂTRE DU CHÂTELET) в Париже', '2020-06-17 05:58:43', '2020-06-17 05:58:43'),
(403, '2018 - участие в выставке \"Московские художники - регионам\", выставочный зал на Кузнецком мосту', '2020-06-17 05:58:51', '2020-06-17 05:58:51'),
(404, '2018 - участие в медиа-проекте «Динамический Хаос», Государственный Дарвиновский музей', '2020-06-17 05:59:06', '2020-06-17 05:59:06'),
(405, '2018 - участие в выставке « Бестиарий» Государственный Дарвиновский музей', '2020-06-17 05:59:14', '2020-06-17 05:59:14'),
(406, '2018 - участие в выставке МСХ «Москва -любовь моя», Кузнецкий мост,11', '2020-06-17 05:59:27', '2020-06-17 05:59:27'),
(407, '2018 - участие в выставке «Хорошо на московском просторе», Культурный центр «Митино»', '2020-06-17 05:59:36', '2020-06-17 05:59:36'),
(408, '2018 - участие в выставке «Святые и художники: диалоги времён», Московский Дом художника', '2020-06-17 05:59:43', '2020-06-17 05:59:43'),
(409, '2018 - участие в выставке МСХ «Мир детства» в ЦДХ', '2020-06-17 05:59:49', '2020-06-17 05:59:49'),
(410, '2018 - участие в выставке «Архитектура. Время и География». Галерея «На Каширке»', '2020-06-17 05:59:56', '2020-06-17 05:59:56'),
(411, '2019 - участие в выставке «Архитектура. Время и География». Саратов. Радищевский музей', '2020-06-17 06:00:02', '2020-06-17 06:00:02'),
(412, '2019 - персональная выставка «#Поморям» в выставочном зале Товарищества живописцев МСХ', '2020-06-17 06:00:09', '2020-06-17 06:00:09'),
(413, '2019  - участие в выставке «Москва – прорыв в будущее». Арткомбинат', '2020-06-17 06:00:15', '2020-06-17 06:00:15'),
(414, '2019 -  участник выставки  «Ночь музеев» на Кузнецком мосту', '2020-06-17 06:08:13', '2020-06-17 06:08:13'),
(415, '2020 - персональная выставка в музее истории Москвы', '2020-06-17 06:08:21', '2020-06-17 06:08:21'),
(416, '2005 - Молодежная выставка Выставочный зал, Кузнецкий мост, д. 11', '2020-06-17 06:36:20', '2020-06-17 06:36:20'),
(417, '2005 - Молодежная выставка Выставочный зал Московского Союза художников МОСХ на Беговой', '2020-06-17 06:36:29', '2020-06-17 06:36:29'),
(418, '2006 - Групповая выставка «Неактуальное искусство» Выставочный зал, Кузнецкий мост, д. 11)', '2020-06-17 06:36:47', '2020-06-17 06:36:47'),
(419, '2006 - Выставка «Настоящее время», галерея «Ковчег»', '2020-06-17 06:36:56', '2020-06-17 06:36:56'),
(420, '2006 - Выставка МОСХ России «Молодежная XXVI .Любовь и семья» Выставочный зал МОСХ на Беговой', '2020-06-17 06:37:06', '2020-06-17 06:37:06'),
(421, '2007 -  Выставка МОСХ России «Молодежная XXVII» Выставочный зал МОСХ на Беговой', '2020-06-17 06:38:11', '2020-06-17 06:38:11'),
(422, '2007 - Выставка ТЖМСХ в выставочном зале «Беляево»', '2020-06-17 06:38:27', '2020-06-17 06:38:27'),
(423, '2007 - Выставка «Молодежь.-29» в выставочных залах «Кузнецкий мост, 11», секция живописи', '2020-06-17 06:38:36', '2020-06-17 06:38:36'),
(424, '2007 - Выставочный проект «Друзья и боевые подруги» в Московском купеческом обществе', '2020-06-17 06:38:49', '2020-06-17 06:38:49'),
(425, '2007 - Выставка «Дары московских художников музею МСХ» Дом художника на Кузнецком мосту', '2020-06-17 06:38:57', '2020-06-17 06:38:57'),
(426, '2007 - Рождественская выставка. Выставочный зал МСХ, 1-я Тверская-Ямская ул., д. 20', '2020-06-17 06:39:08', '2020-06-17 06:39:08'),
(427, '2007 - Персональная выставка . Выставочный зал МСХ,1-я Тверская-Ямская ул., д. 20', '2020-06-17 06:39:20', '2020-06-17 06:39:20'),
(428, '2007 - Рождественская выставка «Рождество», Выставочный зал МОСХ на Беговой', '2020-06-17 06:39:28', '2020-06-17 06:39:28'),
(429, '2007 - Выставка, посвященная 75-летию МСХ «Мир живописи». Центральный Дом художника', '2020-06-17 06:39:38', '2020-06-17 06:39:38'),
(430, '2007 - Выставка Фонда помощи отечественному искусству, Дипакадемия', '2020-06-17 06:39:48', '2020-06-17 06:39:48'),
(431, '2008 - Выставка МОСХ России «Молодежная XXVIII» .Выставочный зал МОСХ на Беговой', '2020-06-17 06:40:00', '2020-06-17 06:40:00'),
(432, '2008 -  Групповая выставка, посвященная дню музеев. Выставочный зал Кузнецкий мост, д. 11', '2020-06-17 06:40:09', '2020-06-17 06:40:09'),
(433, '2008 - Групповая выставка в Выставочном зале Тульского музея изобразительных искусств', '2020-06-17 06:40:19', '2020-06-17 06:40:19'),
(434, '2008 - Дипломант групповой выставки \"Молодые таланты Москвы\" Галерея   \"Замоскворечье\"', '2020-06-17 06:40:29', '2020-06-17 06:40:29'),
(435, '2008 - Дипломант выставки  \"День города\". Галерея живописного искусства', '2020-06-17 06:40:36', '2020-06-17 06:40:36'),
(436, '2008 - Рождественская выставка. Галерея живописного искусства', '2020-06-17 06:40:45', '2020-06-17 06:40:45'),
(437, '2009 - Выставка, посвященная  8 Марта, Галерея живописного искусства', '2020-06-17 06:40:56', '2020-06-17 06:40:56'),
(438, '2009 - Пленер-2008, Кузнецкий мост, 20', '2020-06-17 06:41:04', '2020-06-17 06:41:04'),
(439, '2009 - Зональная  выставка \"50 лет МОСХ\", Новый манеж', '2020-06-17 06:41:13', '2020-06-17 06:41:13'),
(440, '2009 - 30-я молодежная выставка, Малый манеж,  МСХ', '2020-06-17 06:41:21', '2020-06-17 06:41:21'),
(441, '2009 - 30-я молодежная выставка , Кузнецкий мост, 11, МСХ', '2020-06-17 06:41:29', '2020-06-17 06:41:29'),
(442, '2009 - Дипломант 29-й молодежной выставке, МОСХ России', '2020-06-17 06:41:38', '2020-06-17 06:41:38'),
(443, '2009 - День города. МОСХ России', '2020-06-17 06:41:48', '2020-06-17 06:41:48'),
(444, '2009 -  День города. Кузнецкий мост, 11', '2020-06-17 06:41:56', '2020-06-17 06:41:56'),
(445, '2009 - Дипломант молодежной выставки в галерее \"Замоскворечье\"', '2020-06-17 06:42:07', '2020-06-17 06:42:07'),
(446, '2009 - Областная выставка этюдов МОО СХР', '2020-06-17 06:42:16', '2020-06-17 06:42:16'),
(447, '2009 - Групповая выставка \"Личное знакомство\" Галерея \"Ковчег\", в рамках 3-го    Московского Биеннале современного искусства', '2020-06-17 06:42:28', '2020-06-17 06:42:28'),
(448, '2009 - Дипломант рождественской выставки. Галерея живописного искусства', '2020-06-17 06:42:38', '2020-06-17 06:42:38'),
(449, '2010 - Выставка \"Пленер\", м. Кузнецкий мост, 20', '2020-06-17 06:42:52', '2020-06-17 06:42:52'),
(450, '2010 - Мир живописи и скульптуры,  ЦДХ, 2-й этаж', '2020-06-17 06:43:01', '2020-06-17 06:43:01'),
(451, '2010 - 30-я Молодежная выставка (МОСХ России) в выставочном зале СХР', '2020-06-17 06:43:10', '2020-06-17 06:43:10'),
(452, '2010 -  Групповая выставка \"Молодая Москва\". Малый манеж', '2020-06-17 06:46:05', '2020-06-17 06:46:05'),
(453, '2010 - Дипломант Молодежной выставки, галерея \"Замоскворечье\", Санкт-Петербург', '2020-06-17 06:46:17', '2020-06-17 06:46:17'),
(454, '2010 - Осенняя выставка \"Мир живописи\",  МСХ на Поклонной горе', '2020-06-17 06:46:26', '2020-06-17 06:46:26'),
(455, '2010 - \"Пленер 2010\", выставочный зал \"Выхино\"', '2020-06-17 06:46:36', '2020-06-17 06:46:36'),
(456, '2010 - Всероссийская молодежная выставка, ЦДХ', '2020-06-17 06:46:44', '2020-06-17 06:46:44'),
(457, '2010 - Павел Никонов \"Диалог с молодыми художниками\", залы РАХ', '2020-06-17 06:46:55', '2020-06-17 06:46:55'),
(458, '2010 - \"Белый цвет\". Клуб живописцев, галерея \"Ковчег\"', '2020-06-17 06:47:04', '2020-06-17 06:47:04'),
(459, '2010 - «Рождество на Беговой»', '2020-06-17 06:47:14', '2020-06-17 06:47:14'),
(460, '2010 - Кадр \"Фрагмент\". Галерея \"Ковчег\"', '2020-06-17 06:47:22', '2020-06-17 06:47:22'),
(461, '2011 - 31-я молодежная выставка. МОСХ России', '2020-06-17 06:47:36', '2020-06-17 06:47:36'),
(462, '2011 - И. Привознова, П.Боркунов, А.Сабанов, Е.Зотов.  Групповая ая выставка. Кузнецкий мост, д.20', '2020-06-17 06:47:51', '2020-06-17 06:47:51'),
(463, '2011 - Художники городу. Кузнецкий мост, 11', '2020-06-17 06:48:00', '2020-06-17 06:48:00'),
(464, '2011 - \"День города\". Галерея живописного искусства', '2020-06-17 06:48:09', '2020-06-17 06:48:09'),
(465, '2011 -  Выставка в музее \"Рабочий и колхозница\", ВДНХ, \"Пробный шар\"', '2020-06-17 06:48:18', '2020-06-17 06:48:18'),
(466, '2011 - Поверхность и глубина. Галерея \"Ковчег\"', '2020-06-17 06:48:26', '2020-06-17 06:48:26'),
(467, '2011 - Рождественская выставка. Галерея живописного искусства', '2020-06-17 06:48:33', '2020-06-17 06:48:33'),
(468, '2012 - Галерея \"Ковчег\", выставка  \"Нет чёрному\"', '2020-06-17 06:48:45', '2020-06-17 06:48:45'),
(469, '2012 - Выставка \"Русская провинция\". Выставочный зал \"Выхино\"', '2020-06-17 06:48:54', '2020-06-17 06:48:54'),
(470, '2012 - \"Предчувствие весны\"-  80 лет МСХ музейно-выставочный комплекс \"Рабочий и  колхозница\"', '2020-06-17 06:49:05', '2020-06-17 06:49:05'),
(471, '2012 - \"Назад в будущее\" галерея \"Беляево\"- 80 лет МСХ', '2020-06-17 06:49:13', '2020-06-17 06:49:13'),
(472, '2012 - Выставка  \"Жанр натюрморта\", галерея \"Ковчег\"', '2020-06-17 06:49:24', '2020-06-17 06:49:24'),
(473, '2012 - Юбилейная выставка 80 лет МСХ,  ЦВЗ \"Манеж\"', '2020-06-17 06:49:32', '2020-06-17 06:49:32'),
(474, '2012 - Юбилейная выставка МСХ-80 лет в ЦДХ', '2020-06-17 06:49:40', '2020-06-17 06:49:40'),
(475, '2012 - \"Два пространства\". Галерея \"Ковчег\"', '2020-06-17 06:49:49', '2020-06-17 06:49:49'),
(476, '2013 - \"Формат\". Галерея \"Ковчег\"', '2020-06-17 06:50:00', '2020-06-17 06:50:00'),
(477, '2013 - Выставка «Случайная работа». Галерея \"Ковчег\"', '2020-06-17 06:50:11', '2020-06-17 06:50:11'),
(478, '2014 - Персональная выставка «Городские метаморфозы». Выставочный зал «Культурный центр «Вдохновение»', '2020-06-17 06:50:23', '2020-06-17 06:50:23'),
(479, '2014 -  Выставка «Мир живописи». Культурный центр Зеленоград', '2020-06-17 06:50:32', '2020-06-17 06:50:32'),
(480, '2014 - Выставка «Автопортрет». Галерея \"Ковчег\"', '2020-06-17 06:50:42', '2020-06-17 06:50:42'),
(481, '2014 - Выставка «Время вперед». ЦДХ', '2020-06-17 06:50:52', '2020-06-17 06:50:52'),
(482, '2014 - Выставка «Бумага, на бумаге, из бумаги». Галерея \"Ковчег\"', '2020-06-17 06:51:00', '2020-06-17 06:51:00'),
(483, '2014 - Выставка «Не ясно». Галерея \"Ковчег\"', '2020-06-17 06:51:09', '2020-06-17 06:51:09'),
(484, '2015 - Выставка «Знак. Символ» . Галерея \"Ковчег\"', '2020-06-17 06:51:19', '2020-06-17 06:51:19'),
(485, '2015 - Молодежная выставка МСХ «Мирное небо над головой», посвященная 70-летию Великой Отечественной войны. Выставочный зал, Кузнецкий мост, д. 11', '2020-06-17 06:51:32', '2020-06-17 06:51:32'),
(486, '2015 - Выставка «Игра в постиндивидуальность». Галерея «А3». В соавторстве  с Анастасией Денеш', '2020-06-17 06:51:46', '2020-06-17 06:51:46'),
(487, '2015 - 17-й завершающийся сезон московских художников. Выставка «Лучшая работа». Галерея «А3»', '2020-06-17 06:51:58', '2020-06-17 06:51:58'),
(488, '2015 - Персональная выставка «Периферия». Ресторан «Терраса»', '2020-06-17 06:52:09', '2020-06-17 06:52:09'),
(489, '2016 - Групповая выставка «Атмосфера» в клубе живописцев в Галерее «Ковчег»', '2020-06-17 06:52:32', '2020-06-17 06:52:32'),
(490, '2016 - Выставка «Натюрморт - жанр в развитии».Выставочный зал, Кузнецкий мост, д. 20', '2020-06-17 06:52:40', '2020-06-17 06:52:40'),
(491, '2', '2020-06-17 06:52:54', '2020-06-17 06:52:54'),
(492, '2016 - Выставка клуба живописцев в Галерее «Ковчег» «Чужая работа. Цитата».', '2020-06-17 06:53:02', '2020-06-17 06:53:02'),
(493, '2016 - Групповая выставка «Ось равновесия» в МВК «Дом Голицына» Арт-группы «Лука»', '2020-06-17 06:54:09', '2020-06-17 06:54:09'),
(494, '2016 - Центр современного искусства «Винзавод» «Цех Красного». Участие в съемке авторского фильма Елены Пискаревой', '2020-06-17 06:54:17', '2020-06-17 06:54:17'),
(495, '2016 - Выставка «Возвращение к картине». Выставочные залы, Кузнецкий мост, д. 11; д. 20', '2020-06-17 06:54:25', '2020-06-17 06:54:25'),
(496, '2016 - Совместная выставка с Леной Красотиной в Галерее «Открытый клуб» «Экзистенциальное»', '2020-06-17 06:54:42', '2020-06-17 06:54:42'),
(497, '2016 - Персональная выставка «Павел Боркунов. Ретроспектива» в Культурном центре «Вдохновение»', '2020-06-17 06:54:51', '2020-06-17 06:54:51'),
(498, '2016 -  Группа «Лука». Проект «Верность». Музейно-выставочный комплекс «МАХЛ РАХ»', '2020-06-17 06:55:02', '2020-06-17 06:55:02'),
(499, '2016 - Групповая выставка «Случайных грез портрет случайный» в МБУК,  «Картинная галерея» г. Балашиха', '2020-06-17 06:55:11', '2020-06-17 06:55:11'),
(500, '2016 - Групповая выставка «Приглашение в лабиринт» в рамках ночи искусств в МБУК «Картинная галерея» г. Балашиха', '2020-06-17 06:55:23', '2020-06-17 06:55:23'),
(501, '2016 - Выставка клуба живописцев в Галерее «Ковчег» «Голые»', '2020-06-17 06:55:34', '2020-06-17 06:55:34'),
(502, '2017 - Выставка педагогов ИЗО в Муниципальном автономном учреждении дополнительного образования городского округа «Железнодорожный» (микрорайон Павлино)', '2020-06-17 06:55:50', '2020-06-17 06:55:50'),
(503, '2017 - Выставка клуба живописцев в Галерее «Ковчег» «Путешествие»', '2020-06-17 06:55:58', '2020-06-17 06:55:58'),
(504, '2017 - Юбилейная выставка в ЦДХ «85 лет МСХ»', '2020-06-17 06:56:08', '2020-06-17 06:56:08'),
(505, '2017 - Павел Боркунов. Дарья Павлунина - выставка «Не холст, не масло» в Культурном центре «Вдохновение»', '2020-06-17 06:56:21', '2020-06-17 06:56:21'),
(506, '2017 -  Выставка «Балашихинцы – ко дню города» в МБУК «Картинная галерея» г. Балашиха', '2020-06-17 06:56:34', '2020-06-17 06:56:34'),
(507, '2017 - Галерея «Арка» «Круг культобзора» (Брюсов пер.). Выставка приурочена к пятилетнему юбилею портала', '2020-06-17 06:56:42', '2020-06-17 06:56:42'),
(508, '2017 - Выставочные залы Москвы «Галерея Измайлово» «Белые дни» совместно с Леной Красотиной', '2020-06-17 06:56:50', '2020-06-17 06:56:50'),
(509, '2018 - Выставка педагогов ИЗО и их учеников «Учителя. Ученики» в Муниципальном автономном учреждении дополнительного образования городского округа «Железнодорожный»,  микрорайон Павлино', '2020-06-17 06:57:24', '2020-06-17 06:57:24'),
(510, '2018 - Участие в международном фестивале «Славянские встречи» в МБУК «Картинная галерея» г. Балашиха. Выставка «Славянское древо»', '2020-06-17 06:57:39', '2020-06-17 06:57:39'),
(511, '2018 - Персональная выставка с участием учеников «Лето» в ДЦ «Северный», Балашихинский район', '2020-06-17 06:57:47', '2020-06-17 06:57:47'),
(512, '2018 - Персональная выставка «МногоЛИКо» в галерее «Измайлово»', '2020-06-17 06:58:02', '2020-06-17 06:58:02'),
(513, '2018 -  Выставка «Наследие», посвященная 40-летию МБУК «Картинная галерея» г. Балашиха', '2020-06-17 06:58:16', '2020-06-17 06:58:16'),
(514, '2018 - Галерея «Измайлово» «Метро. Синий»', '2020-06-17 06:58:24', '2020-06-17 06:58:24'),
(515, '2018 -  Галерея «Измайлово» «Круглое в городе»', '2020-06-17 06:58:37', '2020-06-17 06:58:37'),
(516, '2019 - Групповая выставка проекта «Икона после иконы». Санкт-Петербург в Анненкирхе в рамках ночи в музеях', '2020-06-17 06:58:47', '2020-06-17 06:58:47'),
(517, '2019 -  Персональная выставка «Отражение в воде» в Российской Академии искусств', '2020-06-17 06:58:56', '2020-06-17 06:58:56'),
(518, 'Персональная выставка в галерее \"Ворота\"', '2020-06-17 07:29:28', '2020-06-17 07:29:28'),
(519, 'Калининград 2016, Проект \"0905\"', '2020-06-17 07:29:40', '2020-06-17 07:29:40'),
(520, 'ММОМА Гоголевский,10, - \"ДАР\"', '2020-06-17 07:32:37', '2020-06-17 07:32:37'),
(521, '2019-2020 - ММОМА Гоголевский,10, - \"ДАР\", персональная выставка,', '2020-06-17 07:33:06', '2020-06-17 07:33:06'),
(522, '2019 - STONEOVENHOUSE, Рора, Италия - \"ЗАСТОЛЬЕ\", персональная выставка', '2020-06-17 07:33:16', '2020-06-17 07:33:16'),
(523, '2019 - MMOMA, Петровка, 25 - \"Потри нос бронзовой собаки\"', '2020-06-17 07:33:29', '2020-06-17 07:33:29'),
(524, '2019 - Москва, Выставка \"МотоВесна-2019\"', '2020-06-17 07:35:27', '2020-06-17 07:35:27'),
(525, '2020, Выставка открытие галлереи поп-ап пространства Zozazes', '2020-06-17 07:40:12', '2020-06-17 07:40:12'),
(526, '2019 Sensor Exhibition, Center M’ARS, Moscow, Russia', '2020-06-17 07:44:34', '2020-06-17 07:44:34'),
(527, '2019 ∅ Festival, Mutabor, Moscow, Russia', '2020-06-17 07:44:40', '2020-06-17 07:44:40'),
(528, '2019 Stenograffia Festival, Yekaterinburg, Russia', '2020-06-17 07:44:49', '2020-06-17 07:44:49'),
(529, '2019 Platonov Arts Festival, Voronezh, Russia', '2020-06-17 07:44:55', '2020-06-17 07:44:55'),
(530, '2019 4GB Festival, Saguramo, Georgia', '2020-06-17 07:45:01', '2020-06-17 07:45:01'),
(531, '2019 Urvakan Festival, Yerevan, Armenia', '2020-06-17 07:45:08', '2020-06-17 07:45:08'),
(532, '2019 Epizode Festival, Phu Quoc, Vietnam', '2020-06-17 07:45:14', '2020-06-17 07:45:14'),
(533, '2018 Public art program \"The Tale of the Golden Apples\", Almetyevsk, Russia', '2020-06-17 07:45:25', '2020-06-17 07:45:25'),
(534, '2018 Exhibition \"Wall Elements 2”, RuArts Gallery, Moscow, Russia', '2020-06-17 07:45:32', '2020-06-17 07:45:32'),
(535, '2018 871 Years Moscow Anniversary Festival, Gorky Park, Moscow, Russia', '2020-06-17 07:45:39', '2020-06-17 07:45:39'),
(536, '2018 Exhibition \"Wall Elements”, Manege Central Exhibition Hall, Saint Petersburg, Russia', '2020-06-17 07:45:46', '2020-06-17 07:45:46'),
(537, '2018 Present Perfect Festival, Sevkabel Port, Saint Petersburg, Russia', '2020-06-17 07:45:54', '2020-06-17 07:45:54'),
(538, '2018 Slowdance 10 YRS Festival, Moscow, Russia', '2020-06-17 07:45:59', '2020-06-17 07:45:59'),
(539, '2018 Moonland Festival, Rummu, Estonia', '2020-06-17 07:46:05', '2020-06-17 07:46:05'),
(540, '2018 Project \"100 Years Of Georgia\'s First Democratic Republic\", Tbilisi, Georgia', '2020-06-17 07:46:14', '2020-06-17 07:46:14'),
(541, '2018 Project \"History of Champions\", Samara, Russia', '2020-06-17 07:46:19', '2020-06-17 07:46:19'),
(542, '2017 Long Stories of Perm Festival, Perm, Russia', '2020-06-17 07:46:25', '2020-06-17 07:46:25'),
(543, '2017 Long Stories of Perm Festival, Perm, Russia  2017 GEM Festival, Anaklia, Georgia', '2020-06-17 07:46:33', '2020-06-17 07:46:33'),
(544, '2017 Long Stories of Perm Festival, Perm, Russia', '2020-06-17 07:46:49', '2020-06-17 07:46:49'),
(545, '2017 GEM Festival, Anaklia, Georgia', '2020-06-17 07:46:55', '2020-06-17 07:46:55'),
(546, '2017 4GB Festival, Saguramo, Georgia', '2020-06-17 07:47:01', '2020-06-17 07:47:01'),
(547, '2016 Exhibition \"30 Faces of Honesty\", Muzeon Park, Moscow, Russia', '2020-06-17 07:47:07', '2020-06-17 07:47:07'),
(548, '2016 Outline Festival, Moscow, Russia', '2020-06-17 07:47:13', '2020-06-17 07:47:13'),
(549, '2016 Save Festival, Moscow, Russia', '2020-06-17 07:47:18', '2020-06-17 07:47:18'),
(550, '2016 4GB Festival, Tbilisi, Georgia', '2020-06-17 07:47:24', '2020-06-17 07:47:24'),
(551, '2015 Save Festival, Moscow, Russia', '2020-06-17 07:47:30', '2020-06-17 07:47:30'),
(552, '2015 Pune Street Art Festival, Pune, India', '2020-06-17 07:47:37', '2020-06-17 07:47:37'),
(553, '2015 Exhibition \"Wall Elements\", Neurotitan Gallery, Berlin, Germany', '2020-06-17 07:47:48', '2020-06-17 07:47:48'),
(554, '2015 Freigeist Festival, Bamberg, Germany', '2020-06-17 07:47:53', '2020-06-17 07:47:53'),
(555, '2015 Exhibition \"City is Area of Love\", Fine Art Gallery, Moscow, Russia', '2020-06-17 07:47:59', '2020-06-17 07:47:59'),
(556, '2015 Outline Festival, Moscow, Russia', '2020-06-17 07:48:05', '2020-06-17 07:48:05'),
(557, '2015 Exhibition \"Remember Tomorrow\", Street Art Museum, Saint Petersburg, Russia', '2020-06-17 07:48:11', '2020-06-17 07:48:11'),
(558, '2015 Genesis Festival, Bauman Garden, Moscow, Russia', '2020-06-17 07:48:16', '2020-06-17 07:48:16'),
(559, '2015 O’Gorod Festival, Alexander Gardens, Nizhnij Novgorod, Russia', '2020-06-17 07:48:22', '2020-06-17 07:48:22'),
(560, '2015 Exhibition \"Reflective\", ArtyFarty Artspace, Kolhn, Germany', '2020-06-17 07:48:29', '2020-06-17 07:48:29'),
(561, '2018, Коллективная выставка в Доме-музее М.С. Щепкина \"Вечеринка у Щепкина дома\"', '2020-06-17 08:12:24', '2020-06-17 08:12:24'),
(562, '2019, Pluton.Спектр.Кинематика', '2020-06-17 08:12:32', '2020-06-17 08:12:32'),
(563, '2020, ДК МИИТ, \"Открытие пространства ZOZAZES\"', '2020-06-17 08:12:38', '2020-06-17 08:12:38'),
(564, '2018, Коллективная выставка в Доме-музее М.С. Щепкина \"Вечеринка у Щепкина дома\"', '2020-06-17 08:15:48', '2020-06-17 08:15:48'),
(565, '2019, Pluton.Спектр.Кинематика', '2020-06-17 08:15:54', '2020-06-17 08:15:54'),
(566, '2020, ДК МИИТ, \"Открытие пространства ZOZAZES\"', '2020-06-17 08:16:00', '2020-06-17 08:16:00'),
(567, '2018, Коллективная выставка в Доме-музее М.С. Щепкина', '2020-06-17 08:27:16', '2020-06-17 08:27:16'),
(568, '2019, Pluton.Спектр.Кинематика', '2020-06-17 08:27:22', '2020-06-17 08:27:22'),
(569, '2019, выставка \"Чердак\", инсталляция \"THE ROOMS\"', '2020-06-17 08:27:27', '2020-06-17 08:27:27'),
(570, '2020, выставка \"ДНО\"  инсталляция совместно с Арсением Поповым', '2020-06-17 08:27:35', '2020-06-17 08:27:35'),
(571, '2020, выставка арт-группы Zozazes, коллажи', '2020-06-17 08:27:41', '2020-06-17 08:27:41'),
(572, '2018 - Участник групповых плакатных выставок «Parade-100» , \"Zych\" 2018, «Jazz»  Москва, ГЦСИ,  Музей Бахрушина,  Пермь, Perm-centr', '2020-06-17 08:31:06', '2020-06-17 08:31:06'),
(573, '2017 - Арт-объект «Баология», посвященный немецкому художнику Курту Швиттерсу и его творению Мерц Бао  2017, ГЦСИ', '2020-06-17 08:31:26', '2020-06-17 08:31:26'),
(574, '2018 - «Parade-100»', '2020-06-17 08:31:49', '2020-06-17 08:31:49'),
(575, '2018 - «Zych» 2018', '2020-06-17 08:32:04', '2020-06-17 08:32:04'),
(576, '2018 - «Jazz»  Москва', '2020-06-17 08:32:20', '2020-06-17 08:32:20'),
(577, '2018 - ГЦСИ', '2020-06-17 08:32:26', '2020-06-17 08:32:26'),
(578, '2018 - Музей Бахрушина', '2020-06-17 08:32:33', '2020-06-17 08:32:33'),
(579, '2018 - Perm-centr, Пермь', '2020-06-17 08:32:48', '2020-06-17 08:32:48'),
(580, '2020 - Групповая выставка Сдвигология и ежегодный семинар \"Зыч зовет\", посвященный поэту-футуристу Алексею Крученых «Хронофотоника» 2016,  Москва, ГЦСИ', '2020-06-17 08:33:11', '2020-06-17 08:33:11'),
(581, '2020 - Персональная выставка фотопроекта  «IHaveMyRoots»  2020 КЦ им.  И.М. Астахова', '2020-06-17 08:33:22', '2020-06-17 08:33:22'),
(582, 'Фестиваль «Rosa Mira», Москва, Россия, 2007', '2020-06-17 08:37:38', '2020-06-17 08:37:38'),
(583, 'Фестиваль «Stenografia’10», Екатеринбург, Россия, 2010', '2020-06-17 08:37:44', '2020-06-17 08:37:44'),
(584, 'Фестиваль «Sretenka Design Week», Москва, Россия, 2010', '2020-06-17 08:37:51', '2020-06-17 08:37:51'),
(585, 'Фестиваль «Black River’11», Вена, Австрия, 2011', '2020-06-17 08:37:57', '2020-06-17 08:37:57'),
(586, 'Групповая выставка «Urban Contest», Рим, Италия, 2012', '2020-06-17 08:38:05', '2020-06-17 08:38:05'),
(587, 'Фестиваль «Black River’12» ,Вена, Австрия, 2012', '2020-06-17 08:38:12', '2020-06-17 08:38:12'),
(588, 'Групповая выставка «Transition zone» in PERMM museum, Пермь, Россия, 2014', '2020-06-17 08:38:24', '2020-06-17 08:38:24'),
(589, 'Групповая выставка «#streetart», Swatch & MMOMA Pop-Up Gallery, Москва, Россия, 2015', '2020-06-17 08:38:34', '2020-06-17 08:38:34'),
(590, 'Выставка «Reflective» ArtyFarty gallery, Кельн, Германия, 2015', '2020-06-17 08:38:40', '2020-06-17 08:38:40'),
(591, 'Групповая выставка«Remember tomorrow», SAW museum, Санкт-Петербург, Россия, 2015', '2020-06-17 08:38:46', '2020-06-17 08:38:46'),
(592, 'Фестиваль«Freigeist», Бамберг, Германия, 2015', '2020-06-17 08:38:52', '2020-06-17 08:38:52'),
(593, 'Выставка «Something happening»,Brewhouse project Москва, Россия, 2015', '2020-06-17 08:38:57', '2020-06-17 08:38:57'),
(594, 'Проект Паблик арта«Geometry for all» Парк Горького, Москва, Россия, 2017', '2020-06-17 08:39:06', '2020-06-17 08:39:06'),
(595, 'Фестиваль «Into the Valley», Таллинн, Эстония, 2017', '2020-06-17 08:39:14', '2020-06-17 08:39:14'),
(596, 'Резиденция «Glo’art», Ланакен, Бельгия 2017', '2020-06-17 08:39:20', '2020-06-17 08:39:20'),
(597, '2015, @Kuryokhin contemporary art center. Group show. Saint-Petersburg', '2020-06-17 08:40:57', '2020-06-17 08:40:57'),
(598, '2020, «Нелишний человек» . @Manege Saint-Petersburg', '2020-06-17 08:41:05', '2020-06-17 08:41:05'),
(599, '2020, «Nothing Box» Group show. @Basmanniy Dvor. Moscow', '2020-06-17 08:41:11', '2020-06-17 08:41:11'),
(600, '2017 - Стрит-арт экспозиция “7th Floor”. Tel Aviv Central Bus Station. Тель Авив. Израиль.', '2020-06-17 08:45:18', '2020-06-17 08:45:18'),
(601, '2017 - IV Уральская Индустриальная Биеннале Современного Искусства. Уральский Приборостроительный Завод. Екатеринбург. Россия.', '2020-06-17 08:45:29', '2020-06-17 08:45:29'),
(602, '2018 - V Выставка Экспериментального Искусства”. Свердловское Региональное Отделение Союза Художников. Дом Художника. Екатеринбург. Россия.', '2020-06-17 08:45:42', '2020-06-17 08:45:42'),
(603, '2018 - “Части Стен”. Манеж. Санкт-Петербург. Россия.', '2020-06-17 08:45:55', '2020-06-17 08:45:55'),
(604, '2019 - 2019, Передвижная выставка \"Природа Бинарности\", руководитель Давид Ру, финальные экспозиции', '2020-06-17 08:46:29', '2020-06-17 08:46:29'),
(605, '2019 - Передвижная выставка \"Природа Бинарности\", руководитель Давид Ру, финальные экспозиции', '2020-06-17 08:46:41', '2020-06-17 08:46:41'),
(606, '2019 - II Триеннале Декоративного Искусства, Екатеринбург', '2020-06-17 08:46:51', '2020-06-17 08:46:51'),
(607, '2019 - Выставка Уличного Современного Искусства “Просто”, Flacon', '2020-06-17 08:47:01', '2020-06-17 08:47:01'),
(608, '2017, Групповая выставка «Конфликт/Испытание», МИСП, Санкт-Петербург', '2020-06-17 08:52:23', '2020-06-17 08:52:23'),
(609, '2018, Групповая выставка «OFFLINE», 3я Биеннале уличного искусства  «Артмосфера», Винзавод, Москва', '2020-06-17 08:52:31', '2020-06-17 08:52:31'),
(610, '2018, Предаукционная групповая выставка искусства уличной волны, галерея RuArts, Москва', '2020-06-17 08:52:40', '2020-06-17 08:52:40'),
(611, '2018, Ярмарка современного искусства «Cosmoscow», Москва', '2020-06-17 08:52:48', '2020-06-17 08:52:48'),
(612, '2019, Групповая выставка «OVERLOAD», Москва', '2020-06-17 08:52:55', '2020-06-17 08:52:55'),
(613, '2019, Ярмарка современного искусства «Cosmoscow», Москва', '2020-06-17 08:53:06', '2020-06-17 08:53:06'),
(614, '2019, Ярмарка современного искусства «Art Fair 14C», Нью-Джерси', '2020-06-17 08:53:31', '2020-06-17 08:53:31'),
(615, '2017 - \"Чилим\", Астрахань', '2020-06-17 09:04:11', '2020-06-17 09:04:11'),
(616, '2018 - \"Сияние\", Невинномысск', '2020-06-17 09:04:26', '2020-06-17 09:04:26'),
(617, '2018 - \"История Чемпионов\", Самара', '2020-06-17 09:04:46', '2020-06-17 09:04:46'),
(618, '2018 - \"VK fest\", Санкт-Петербург', '2020-06-17 09:05:21', '2020-06-17 09:05:21'),
(619, '2018 - \"Место\", Москва', '2020-06-17 09:05:31', '2020-06-17 09:05:31'),
(620, '2018 - \"Mural Fest\", Алма-Ата, Казахстан', '2020-06-17 09:06:01', '2020-06-17 09:06:01'),
(621, '2019 - \"Urban Art Fest\", Нур-султан, Казахстан', '2020-06-17 09:06:34', '2020-06-17 09:06:34'),
(622, '2019 - \"Pasila Street-Art District\", Хельсинки, Финляндия', '2020-06-17 09:07:18', '2020-06-17 09:07:18'),
(623, '2019 - \"Bright People\", Москва', '2020-06-17 09:07:45', '2020-06-17 09:07:45'),
(624, '2019 - Персональная выставка \"Weakly Linked Data\", Urban Art Gallery, Хельсинки, Финляндия', '2020-06-17 09:08:42', '2020-06-17 09:08:42'),
(625, '2108 - Групповая выставка \"Москва Маргинальная\", Москва', '2020-06-17 09:09:11', '2020-06-17 09:09:11'),
(626, '2018 - Групповая выставка \"Москва Маргинальная\", Москва', '2020-06-17 09:09:22', '2020-06-17 09:09:22'),
(627, '2019 - Групповая выставка \"Urban Art Fair\", Москва', '2020-06-17 09:09:56', '2020-06-17 09:09:56'),
(628, '2019 - Групповая выставка \"Арт-Мастерские XXI\", Москва, Санкт-петербург, Тольятти, Симферополь, Калининград', '2020-06-17 09:10:52', '2020-06-17 09:10:52'),
(629, '2019 - Групповая выставка \"Overload\", Москва', '2020-06-17 09:11:16', '2020-06-17 09:11:16'),
(630, '2020 - Групповая онлайн выставка \"StayHome\", zhavner.com', '2020-06-17 09:12:00', '2020-06-17 09:12:00'),
(631, '2016 – “Ирония как ландшафт”, Галерея братьев Люмьер, Москва', '2020-06-17 09:16:36', '2020-06-17 09:16:36'),
(632, '2017 – “Art of Mystery” галерея МАРТ, Екатеринбург', '2020-06-17 09:16:43', '2020-06-17 09:16:43'),
(633, '2019 – “Гендерный баланс”, галерея Cube, Москва', '2020-06-17 09:16:54', '2020-06-17 09:16:54'),
(634, '2016, Москва, Россия - Московский музей современного искусства, Одноэтажная Америка: Основано на реальных событиях.', '2020-06-17 09:19:24', '2020-06-17 09:19:24'),
(635, '2013 - Проект \"Русский Авангард\", Москва', '2020-06-17 09:20:22', '2020-06-17 09:20:22'),
(636, '2014 - Проект \"Наследие\" , Москва', '2020-06-17 09:20:36', '2020-06-17 09:20:36'),
(637, '2014 - Роспись скейтпарка в Лугано, Швейцария', '2020-06-17 09:21:00', '2020-06-17 09:21:00'),
(638, '2014 - Стихограмма Пригова \"АЯ\", Москва', '2020-06-17 09:21:14', '2020-06-17 09:21:14'),
(639, '2015 - Проект \"Клетка\", Санкт Петербург', '2020-06-17 09:21:29', '2020-06-17 09:21:29'),
(640, '2016 - Московский музей современного искусства, Одноэтажная Америка: Основано на реальных событиях.', '2020-06-17 09:21:47', '2020-06-17 09:21:47'),
(641, '2017 - Проект в здании тетра Гоголь центр', '2020-06-17 09:22:07', '2020-06-17 09:22:07'),
(642, '2017 - Дом-музей Цветаевой Выставка \"ОТ РУКИ\", , Москва', '2020-06-17 09:22:31', '2020-06-17 09:22:31'),
(643, '2018 - Deus temple gallery. Персональная выставка: Stranger things, Бали, Индонезия', '2020-06-17 09:22:54', '2020-06-17 09:22:54'),
(644, '2019 - Выставка \"Части Стен\", ЦВЗ Манеж', '2020-06-17 09:23:10', '2020-06-17 09:23:10'),
(645, '2020 - Выставка Илья Ильф одесский москвич, центр Гиляровского', '2020-06-17 09:23:31', '2020-06-17 09:23:31'),
(646, '2016 - Печа-Куча, Северо-Чешский музей, Либерец, Чешская Республика', '2020-06-17 09:25:16', '2020-06-17 09:25:16'),
(647, '2017 - Планета Маленького принца, Национальный музей им. Пальмова, Элиста, Россия', '2020-06-17 09:25:28', '2020-06-17 09:25:28'),
(648, '2017 - Арт-Экспресс. Дорогами Кавказа, Музей современного искусства им.Ткаченко, Нальчик, Россия', '2020-06-17 09:26:00', '2020-06-17 09:26:00'),
(649, '2018 - Интернациональная Арт-Выставка.Юг России  –XII, Ростов-на-Дону, Россия', '2020-06-17 09:26:12', '2020-06-17 09:26:12'),
(650, '2020 - Веселая карусель, Галерея \"Здесь\", Москва, Россия', '2020-06-17 09:26:24', '2020-06-17 09:26:24'),
(651, '2014, “Артмоссфера / Московская биеннале уличного искусства”. Artplay. Москва', '2020-06-17 09:31:02', '2020-06-17 09:31:02'),
(652, '2016, “Метаформы”. Центр МАРС, Москва', '2020-06-17 09:31:09', '2020-06-17 09:31:09'),
(653, '2018, “Части стен”. Центральный манеж. Санкт-Петербург', '2020-06-17 09:31:16', '2020-06-17 09:31:16'),
(654, 'Лувр', '2020-06-18 11:09:48', '2020-06-18 11:09:48'),
(655, '1984 – групповая выставка в зале молодежного объединения Союза художников, ул. Жолтовского, 17', '2020-06-23 09:06:13', '2020-06-23 09:06:13'),
(656, '1984 - групповая выставка стипендиатов СХ СССР в Центральном Доме художника, Крымский вал, 10', '2020-06-23 09:06:20', '2020-06-23 09:06:20'),
(657, '1991 – групповая выставка в Париже, в галерее «Эруэ», Рю дю Тампль', '2020-06-23 09:06:27', '2020-06-23 09:06:27'),
(658, '1992 – выставка совместно с Г. Уваровым в Москве, Галерея А-3, Староконюшенный, 39', '2020-06-23 09:06:36', '2020-06-23 09:06:36'),
(659, '1996 – выставка совместно с Г. Уваровым в московском Болгарском культурном центре, Ленинградский проспект, 20', '2020-06-23 09:06:42', '2020-06-23 09:06:42'),
(660, '1999 – выставка в московском Доме Скульпторов (совместно с В.Циммерлингом) Спасоналивковский, 4', '2020-06-23 09:06:50', '2020-06-23 09:06:50'),
(661, '2000 – выставка в Сербии, г. Вальево совместно с Натальей Баженовой', '2020-06-23 09:06:58', '2020-06-23 09:06:58'),
(662, '2005 –персональная выставка в Москве, в галерее «Киселев», Тверская, 9', '2020-06-23 09:07:07', '2020-06-23 09:07:07'),
(663, '2005 – выставка московских латышей в Риге, в Латышском Обществе, ул. Меркелю, 13', '2020-06-23 09:07:14', '2020-06-23 09:07:14'),
(664, '2007 – выставка в музее «Кална зиеды» г. Айзкраукле, в Латвии', '2020-06-23 09:07:23', '2020-06-23 09:07:23'),
(665, '2008 – групповая выставка «МОСТ» в залах МСХ, Кузнецкий мост, 11', '2020-06-23 09:07:30', '2020-06-23 09:07:30'),
(666, '2010 – выставка московских латышей в Юрмале, в Доме Аспазии, Дубулты', '2020-06-23 09:07:37', '2020-06-23 09:07:37'),
(667, '2011 –выставка «В поисках оправдания» совместно с Г. Уваровым в залах МСХ, Кузнецкий мост, 20', '2020-06-23 09:07:49', '2020-06-23 09:07:49'),
(668, '2012 – групповая выставка «Магический квадрат» в залах МСХ Кузнецкий мост, 20', '2020-06-23 09:07:57', '2020-06-23 09:07:57'),
(669, '2013 –групповая выставка «За линией горизонта» в залах МСХ Кузнецкий мост, 20', '2020-06-23 09:08:05', '2020-06-23 09:08:05'),
(670, '2015 – групповая выставка «Реальность мифа» в залах МСХ Кузнецкий мост, 20', '2020-06-23 09:08:12', '2020-06-23 09:08:12'),
(671, '2016 – групповая выставка «Единство света» в залах МСХ Кузнецкий мост, 11', '2020-06-23 09:08:18', '2020-06-23 09:08:18'),
(672, '2017 – выставка совместно с Г. Уваровым в Товариществе московских живописцев, 1ая Тверская-Ямская, 20', '2020-06-23 09:08:25', '2020-06-23 09:08:25'),
(673, '2017 – выставка совместно с Г. Уваровым в Министерстве Культуры России', '2020-06-23 09:08:34', '2020-06-23 09:08:34'),
(674, '2017 – персональная выставка «Поэзия и правда» в галерее «Чертаново»', '2020-06-23 09:08:42', '2020-06-23 09:08:42'),
(675, '2017 – групповая выставка «Среда обитания» в залах МСХ кузнецкий мост, 20', '2020-06-23 09:08:51', '2020-06-23 09:08:51'),
(676, '2018 – групповая выставка «Крым» в залах МСХ Кузнецкий мост, 20', '2020-06-23 09:08:58', '2020-06-23 09:08:58'),
(677, '2018 – групповая выставка московских художников латышского происхождения «Родной источник» в галерее «Тушино»', '2020-06-23 09:09:05', '2020-06-23 09:09:05'),
(678, '2018 – групповая выставка «Без покровов» в залах МСХ Кузнецкий мост, 20', '2020-06-23 09:09:12', '2020-06-23 09:09:12'),
(679, '2019- групповая выставка «Силуэты Европы» в залах МСХ Кузнецкий мост, 20', '2020-06-23 09:09:19', '2020-06-23 09:09:19'),
(680, '2019 – групповая выставка «Пешеходы твои – люди невеликие…» в залах МСХ Кузнецкий мост, 20', '2020-06-23 09:09:36', '2020-06-23 09:09:36'),
(681, '2020 – выставка совместно с Г. Уваровым «Беседы со Старыми мастерами» в «Галерее на Чистых прудах». Чистопрудный б., 4', '2020-06-23 09:09:44', '2020-06-23 09:09:44'),
(682, '1991 – групповая выставка в Париже, в галерее «Эруэ», Рю дю Тампль', '2020-06-25 07:52:12', '2020-06-25 07:52:12'),
(683, '1992 – выставка совместно с Г. Уваровым в Москве, Галерея А-3, Староконюшенный, 39', '2020-06-25 07:52:20', '2020-06-25 07:52:20'),
(684, '1996 – выставка совместно с Г. Уваровым в московском Болгарском культурном центре, Ленинградский проспект, 20', '2020-06-25 07:52:59', '2020-06-25 07:52:59'),
(685, '1999 – выставка в московском Доме Скульпторов (совместно с В.Циммерлингом) Спасоналивковский, 4', '2020-06-25 07:53:05', '2020-06-25 07:53:05'),
(686, '2000 – выставка в Сербии, г. Вальево совместно с Натальей Баженовой', '2020-06-25 07:53:12', '2020-06-25 07:53:12'),
(687, '2005 –персональная выставка в Москве, в галерее «Киселев», Тверская, 9', '2020-06-25 07:53:19', '2020-06-25 07:53:19'),
(688, '2005 – выставка московских латышей в Риге, в Латышском Обществе, ул. Меркелю, 13', '2020-06-25 07:53:26', '2020-06-25 07:53:26'),
(689, '2007 – выставка в музее «Кална зиеды» г. Айзкраукле, в Латвии', '2020-06-25 07:53:33', '2020-06-25 07:53:33'),
(690, '2008 – групповая выставка «МОСТ» в залах МСХ, Кузнецкий мост, 11', '2020-06-25 07:53:41', '2020-06-25 07:53:41'),
(691, '2010 – выставка московских латышей в Юрмале, в Доме Аспазии, Дубулты', '2020-06-25 07:53:49', '2020-06-25 07:53:49'),
(692, '2011 –выставка «В поисках оправдания» совместно с Г. Уваровым в залах МСХ, Кузнецкий мост, 20', '2020-06-25 07:53:57', '2020-06-25 07:53:57'),
(693, '2012 – групповая выставка «Магический квадрат» в залах МСХ Кузнецкий мост, 20', '2020-06-25 07:54:06', '2020-06-25 07:54:06'),
(694, '2015 – групповая выставка «Реальность мифа» в залах МСХ Кузнецкий мост, 20', '2020-06-25 07:54:21', '2020-06-25 07:54:21'),
(695, '2016 – групповая выставка «Единство света» в залах МСХ Кузнецкий мост, 11', '2020-06-25 07:54:29', '2020-06-25 07:54:29'),
(696, '2017 – выставка совместно с Г. Уваровым в Товариществе московских живописцев, 1ая Тверская-Ямская, 20', '2020-06-25 07:54:35', '2020-06-25 07:54:35'),
(697, '2017 – персональная выставка «Поэзия и правда» в галерее «Чертаново»', '2020-06-25 07:54:50', '2020-06-25 07:54:50'),
(698, '2017 – групповая выставка «Среда обитания» в залах МСХ кузнецкий мост, 20', '2020-06-25 07:54:59', '2020-06-25 07:54:59'),
(699, '2018 – групповая выставка «Крым» в залах МСХ Кузнецкий мост, 20', '2020-06-25 07:55:07', '2020-06-25 07:55:07'),
(700, '2018 – групповая выставка московских художников латышского происхождения «Родной источник» в галерее «Тушино»', '2020-06-25 07:55:14', '2020-06-25 07:55:14'),
(701, '2018 – групповая выставка «Без покровов» в залах МСХ Кузнецкий мост, 20', '2020-06-25 07:55:25', '2020-06-25 07:55:25'),
(702, '2019- групповая выставка «Силуэты Европы» в залах МСХ Кузнецкий мост, 20', '2020-06-25 07:55:32', '2020-06-25 07:55:32'),
(703, '2019 – групповая выставка «Пешеходы твои – люди невеликие…» в залах МСХ Кузнецкий мост, 20', '2020-06-25 07:55:39', '2020-06-25 07:55:39'),
(704, '2002 - галерея ГВЗ \"На Каширке\"', '2020-06-30 10:06:08', '2020-06-30 10:06:08'),
(705, '2004 - галерея ГВЗ \"Выхино\"', '2020-06-30 10:06:37', '2020-06-30 10:06:37'),
(706, '2006 - галерея ГВЗ \"На Песчаной\"', '2020-06-30 10:06:56', '2020-06-30 10:06:56'),
(707, '2004 - первое место в конкурсе молодых художников, организованным муниципалитетом  Брюсселя', '2020-06-30 10:07:08', '2020-06-30 10:07:08'),
(708, '2000 - 2010 - ежегодное участие в выставках МСХ на Кузнецком мосту и в ЦДХ', '2020-06-30 10:07:46', '2020-06-30 10:07:46'),
(709, '2002 – 2008 – ежегодное участие  в выставках РСХ', '2020-06-30 10:07:54', '2020-06-30 10:07:54'),
(710, '2002 -первое место в конкурсе молодых художников за серию графических работ , организованном компанией \" РR image land\", г. Москва', '2020-06-30 10:08:01', '2020-06-30 10:08:01'),
(711, '2008, 2010,  2014, 2016  - выставки в галерее  \"Ситуация\",  Антверпен', '2020-06-30 10:08:15', '2020-06-30 10:08:15'),
(712, '2010 - совместная с Павлом Боркуновым в галереи МСХ на Тверской-Ямской', '2020-06-30 10:11:09', '2020-06-30 10:11:09'),
(713, '2011 - совместная с Виктором Звягинцевым и Татьяной Малюковой в галереи МСХ на Старосадском, 5', '2020-06-30 10:11:24', '2020-06-30 10:11:24'),
(714, '2015 выставки - галерея ГВЗ \" Ковчег\", галерея \" ЕХРО-88\"', '2020-06-30 10:11:38', '2020-06-30 10:11:38');

-- --------------------------------------------------------

--
-- Структура таблицы `exhibit_user`
--

CREATE TABLE `exhibit_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `exhibit_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `exhibit_user`
--

INSERT INTO `exhibit_user` (`user_id`, `exhibit_id`) VALUES
(7, 13),
(7, 14),
(7, 15),
(7, 16),
(7, 17),
(7, 18),
(7, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(7, 24),
(7, 25),
(7, 26),
(7, 27),
(7, 28),
(7, 29),
(7, 30),
(7, 31),
(7, 32),
(7, 33),
(7, 34),
(7, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 40),
(8, 41),
(8, 42),
(9, 43),
(9, 44),
(9, 45),
(9, 46),
(9, 47),
(9, 48),
(9, 49),
(9, 50),
(9, 51),
(9, 52),
(9, 53),
(9, 54),
(9, 55),
(9, 56),
(9, 57),
(9, 58),
(9, 59),
(9, 60),
(9, 61),
(9, 62),
(9, 63),
(9, 64),
(9, 65),
(9, 66),
(9, 67),
(9, 68),
(9, 69),
(9, 70),
(9, 71),
(9, 72),
(11, 75),
(11, 76),
(11, 77),
(11, 78),
(11, 79),
(11, 80),
(11, 81),
(11, 82),
(11, 83),
(11, 84),
(11, 85),
(11, 86),
(11, 87),
(11, 88),
(11, 89),
(11, 90),
(11, 91),
(11, 92),
(11, 93),
(11, 94),
(11, 95),
(11, 96),
(11, 97),
(11, 98),
(11, 99),
(11, 100),
(11, 101),
(11, 102),
(11, 103),
(11, 104),
(11, 105),
(11, 106),
(11, 107),
(11, 108),
(11, 109),
(11, 110),
(11, 111),
(11, 112),
(11, 113),
(11, 114),
(11, 115),
(11, 116),
(11, 117),
(11, 118),
(11, 119),
(12, 120),
(12, 121),
(12, 122),
(12, 123),
(12, 124),
(12, 125),
(12, 126),
(12, 127),
(12, 128),
(12, 129),
(12, 130),
(12, 131),
(12, 132),
(12, 133),
(12, 134),
(12, 135),
(12, 136),
(12, 137),
(12, 138),
(12, 139),
(12, 140),
(12, 141),
(12, 142),
(12, 143),
(13, 144),
(13, 145),
(18, 146),
(18, 147),
(18, 148),
(18, 149),
(18, 150),
(18, 151),
(18, 152),
(18, 153),
(18, 154),
(18, 155),
(18, 156),
(18, 157),
(18, 158),
(18, 159),
(18, 160),
(18, 161),
(18, 162),
(18, 163),
(18, 164),
(18, 165),
(20, 166),
(20, 167),
(20, 168),
(20, 169),
(20, 170),
(20, 171),
(20, 172),
(20, 173),
(20, 174),
(20, 175),
(20, 176),
(20, 177),
(20, 178),
(20, 179),
(20, 180),
(20, 181),
(20, 182),
(20, 183),
(20, 184),
(20, 185),
(20, 186),
(20, 187),
(20, 188),
(20, 189),
(20, 190),
(20, 191),
(20, 192),
(20, 193),
(20, 194),
(20, 195),
(20, 196),
(20, 197),
(20, 198),
(20, 199),
(21, 200),
(21, 201),
(21, 202),
(21, 203),
(21, 204),
(21, 205),
(21, 206),
(21, 207),
(21, 208),
(21, 209),
(21, 210),
(21, 211),
(21, 212),
(21, 213),
(21, 214),
(21, 215),
(21, 216),
(21, 217),
(21, 218),
(21, 219),
(21, 220),
(21, 221),
(21, 222),
(21, 223),
(21, 224),
(21, 225),
(21, 226),
(21, 227),
(21, 228),
(21, 229),
(21, 230),
(21, 231),
(21, 232),
(21, 233),
(21, 234),
(21, 235),
(22, 236),
(22, 237),
(23, 238),
(23, 239),
(23, 240),
(23, 241),
(23, 242),
(23, 243),
(23, 244),
(23, 245),
(23, 246),
(23, 247),
(23, 248),
(23, 249),
(23, 250),
(23, 251),
(23, 252),
(26, 253),
(26, 254),
(26, 255),
(26, 256),
(26, 258),
(26, 259),
(26, 260),
(26, 261),
(26, 262),
(26, 263),
(26, 264),
(26, 265),
(26, 266),
(26, 267),
(26, 268),
(26, 269),
(26, 270),
(26, 271),
(26, 272),
(26, 273),
(26, 274),
(26, 275),
(26, 276),
(26, 277),
(27, 278),
(27, 279),
(27, 280),
(27, 281),
(30, 283),
(30, 285),
(30, 286),
(30, 287),
(30, 288),
(30, 289),
(30, 290),
(30, 291),
(30, 292),
(30, 293),
(30, 294),
(30, 295),
(30, 296),
(30, 297),
(30, 298),
(30, 299),
(30, 300),
(30, 301),
(30, 302),
(30, 303),
(30, 304),
(30, 305),
(30, 306),
(30, 307),
(30, 309),
(30, 310),
(30, 311),
(30, 312),
(30, 313),
(30, 314),
(30, 316),
(30, 317),
(30, 318),
(30, 319),
(30, 320),
(30, 321),
(30, 322),
(30, 323),
(30, 324),
(30, 325),
(30, 326),
(30, 327),
(30, 328),
(30, 329),
(30, 330),
(30, 331),
(30, 332),
(30, 333),
(30, 334),
(30, 335),
(30, 336),
(30, 337),
(30, 338),
(30, 339),
(30, 340),
(30, 341),
(30, 342),
(30, 343),
(30, 344),
(30, 345),
(35, 346),
(35, 347),
(35, 348),
(35, 349),
(35, 350),
(35, 351),
(35, 352),
(35, 353),
(35, 354),
(35, 355),
(35, 356),
(35, 357),
(35, 358),
(35, 359),
(35, 360),
(35, 361),
(35, 362),
(35, 363),
(35, 364),
(35, 365),
(35, 366),
(35, 367),
(35, 368),
(35, 369),
(35, 370),
(35, 371),
(35, 372),
(35, 373),
(35, 374),
(35, 375),
(35, 376),
(35, 377),
(35, 378),
(35, 379),
(35, 380),
(35, 381),
(35, 382),
(35, 383),
(35, 384),
(35, 385),
(35, 386),
(35, 387),
(35, 388),
(35, 389),
(35, 390),
(35, 391),
(35, 392),
(35, 393),
(35, 394),
(35, 395),
(35, 396),
(35, 397),
(35, 398),
(35, 399),
(35, 400),
(35, 401),
(35, 402),
(35, 403),
(35, 404),
(35, 405),
(35, 406),
(35, 407),
(35, 408),
(35, 409),
(35, 410),
(35, 411),
(35, 412),
(35, 413),
(36, 414),
(36, 415),
(38, 416),
(38, 417),
(38, 418),
(38, 419),
(38, 420),
(38, 421),
(38, 422),
(38, 423),
(38, 424),
(38, 425),
(38, 426),
(38, 427),
(38, 428),
(38, 429),
(38, 430),
(38, 431),
(38, 432),
(38, 433),
(38, 434),
(38, 435),
(38, 436),
(38, 437),
(38, 438),
(38, 439),
(38, 440),
(38, 441),
(38, 442),
(38, 443),
(38, 444),
(38, 445),
(38, 446),
(38, 447),
(38, 448),
(38, 449),
(38, 450),
(38, 451),
(38, 452),
(38, 453),
(38, 454),
(38, 455),
(38, 456),
(38, 457),
(38, 458),
(38, 459),
(38, 460),
(38, 461),
(38, 462),
(38, 463),
(38, 464),
(38, 465),
(38, 466),
(38, 467),
(38, 468),
(38, 469),
(38, 470),
(38, 471),
(38, 472),
(38, 473),
(38, 474),
(38, 475),
(38, 476),
(38, 477),
(38, 478),
(38, 479),
(38, 480),
(38, 481),
(38, 482),
(38, 483),
(38, 484),
(38, 485),
(38, 486),
(38, 487),
(38, 488),
(38, 489),
(38, 490),
(38, 492),
(38, 493),
(38, 494),
(38, 495),
(38, 496),
(38, 497),
(38, 498),
(38, 499),
(38, 500),
(38, 501),
(38, 502),
(38, 503),
(38, 504),
(38, 505),
(38, 506),
(38, 507),
(38, 508),
(38, 509),
(38, 510),
(38, 511),
(38, 512),
(38, 513),
(38, 514),
(38, 515),
(38, 516),
(38, 517),
(43, 518),
(43, 519),
(44, 521),
(44, 522),
(44, 523),
(45, 524),
(46, 525),
(47, 526),
(47, 527),
(47, 528),
(47, 529),
(47, 530),
(47, 531),
(47, 532),
(47, 533),
(47, 534),
(47, 535),
(47, 536),
(47, 537),
(47, 538),
(47, 539),
(47, 540),
(47, 541),
(47, 542),
(47, 544),
(47, 545),
(47, 546),
(47, 547),
(47, 548),
(47, 549),
(47, 550),
(47, 551),
(47, 552),
(47, 553),
(47, 554),
(47, 555),
(47, 556),
(47, 557),
(47, 558),
(47, 559),
(47, 560),
(48, 564),
(48, 565),
(48, 566),
(52, 567),
(52, 568),
(52, 569),
(52, 570),
(52, 571),
(53, 573),
(53, 574),
(53, 575),
(53, 576),
(53, 577),
(53, 578),
(53, 579),
(53, 580),
(53, 581),
(54, 582),
(54, 583),
(54, 584),
(54, 585),
(54, 586),
(54, 587),
(54, 588),
(54, 589),
(54, 590),
(54, 591),
(54, 592),
(54, 593),
(54, 594),
(54, 595),
(54, 596),
(55, 597),
(55, 598),
(55, 599),
(56, 600),
(56, 601),
(56, 602),
(56, 603),
(56, 605),
(56, 606),
(56, 607),
(57, 608),
(57, 609),
(57, 610),
(57, 611),
(57, 612),
(57, 613),
(57, 614),
(58, 615),
(58, 616),
(58, 617),
(58, 618),
(58, 619),
(58, 620),
(58, 621),
(58, 622),
(58, 623),
(58, 624),
(58, 626),
(58, 627),
(58, 628),
(58, 629),
(58, 630),
(60, 631),
(60, 632),
(60, 633),
(61, 635),
(61, 636),
(61, 637),
(61, 638),
(61, 639),
(61, 640),
(61, 641),
(61, 642),
(61, 643),
(61, 644),
(61, 645),
(62, 646),
(62, 647),
(62, 648),
(62, 649),
(62, 650),
(63, 651),
(63, 652),
(63, 653),
(64, 655),
(64, 656),
(64, 682),
(64, 683),
(64, 684),
(64, 685),
(64, 686),
(64, 687),
(64, 688),
(64, 689),
(64, 690),
(64, 691),
(64, 692),
(64, 693),
(64, 669),
(64, 694),
(64, 695),
(64, 696),
(64, 673),
(64, 697),
(64, 698),
(64, 699),
(64, 700),
(64, 701),
(64, 702),
(64, 703),
(64, 681),
(65, 704),
(65, 705),
(65, 707),
(65, 706),
(65, 708),
(65, 709),
(65, 710),
(65, 711),
(65, 712),
(65, 713),
(65, 714);

-- --------------------------------------------------------

--
-- Структура таблицы `experts`
--

CREATE TABLE `experts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `experts`
--

INSERT INTO `experts` (`id`, `name`, `lastname`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(2, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(3, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(4, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(5, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(6, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(7, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(8, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(9, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(10, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(11, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(12, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(13, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(14, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(15, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(16, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(17, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(18, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(19, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15'),
(20, 'Юрий', 'Львович', 'Реставратор, художник, председатель совета делающего дела', 'experts/August2020/TP7Tfzb4th4jSSBCjqcy.jpg', '2020-08-12 00:15:15', '2020-08-12 00:15:15');

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `lot_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `lot_id`, `created_at`, `updated_at`) VALUES
(13, 1, 30, NULL, NULL),
(14, 66, 26, NULL, NULL),
(15, 66, 27, NULL, NULL),
(16, 66, 37, NULL, NULL),
(17, 66, 29, NULL, NULL),
(18, 66, 30, NULL, NULL),
(19, 66, 31, NULL, NULL),
(22, 1, 47, NULL, NULL),
(27, 1, 2, NULL, NULL),
(29, 1, 7, NULL, NULL),
(30, 1, 8, NULL, NULL),
(32, 1, 16, NULL, NULL),
(33, 1, 5, NULL, NULL),
(34, 1, 6, NULL, NULL),
(35, 1, 14, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `frames`
--

CREATE TABLE `frames` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `frame_lot`
--

CREATE TABLE `frame_lot` (
  `lot_id` bigint UNSIGNED NOT NULL,
  `frame_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'фуыолбнпнгареыпвкп', '2020-06-12 06:56:10', '2020-06-12 06:56:10'),
(2, 'ы', '2020-06-12 07:28:43', '2020-06-12 07:28:43'),
(3, 'sdfgdfg', '2020-06-15 05:33:03', '2020-06-15 05:33:03'),
(4, 'dfvsdfv', '2020-06-15 09:52:21', '2020-06-15 09:52:21'),
(5, '1981-1990 член Молодежного Объединения СХ СССР, секция живописи', '2020-06-15 10:01:32', '2020-06-15 10:01:32'),
(6, '1994 член Ассоциации искусствоведов', '2020-06-15 10:01:54', '2020-06-15 10:01:54'),
(7, '1997 член СХ РФ', '2020-06-15 10:02:12', '2020-06-15 10:02:12'),
(8, '1991 член Московского Союза художников', '2020-06-15 10:15:56', '2020-06-15 10:15:56'),
(9, 'Член Московского Союза художников', '2020-06-15 10:46:51', '2020-06-15 10:46:51'),
(10, 'Член МХФ с 1993 г.', '2020-06-15 11:13:12', '2020-06-15 11:13:12'),
(11, 'МОСХ России с 1999 г.', '2020-06-15 11:13:24', '2020-06-15 11:13:24'),
(12, 'Член МОСХ России с 1999 г .', '2020-06-15 11:13:55', '2020-06-15 11:13:55'),
(13, 'С 2007 г. - Член женского делового клуба «Женщины будущей России»', '2020-06-15 11:55:27', '2020-06-15 11:55:27'),
(14, 'Член Творческого союза художников России (секция «Абстрактное искусство»)', '2020-06-15 12:14:52', '2020-06-15 12:14:52'),
(15, 'В 1995 г. Стал член-корреспондентом Международной Академии Информатики', '2020-06-15 12:24:49', '2020-06-15 12:24:49'),
(16, 'В 1996 г. Получил звания доктора технических наук, доктора экономических наук высшей степени, профессор Международной Академии Наук Сан-Марино. Все звания легализованы в России.', '2020-06-15 12:25:06', '2020-06-15 12:25:06'),
(17, 'В 2000 г. Стал академиком Международной Академии Наук и Искусства', '2020-06-15 12:25:18', '2020-06-15 12:25:18'),
(18, 'В 2002г.  Стал академиком Академии проблем безопасности, обороны и правопорядка', '2020-06-15 12:25:30', '2020-06-15 12:25:30'),
(19, 'С 2016 г. Член Творческого Союза Художников России и Международной Федерации Художников, секция абстрактного искусства.', '2020-06-15 12:25:52', '2020-06-15 12:25:52'),
(20, 'С 2014 г. член Московского Союза художников', '2020-06-15 13:01:54', '2020-06-15 13:01:54'),
(21, 'С 2012 г. член Московского Союза художников', '2020-06-15 13:08:47', '2020-06-15 13:08:47'),
(22, 'В 1969 году вступила в Союз художников СССР.', '2020-06-15 13:27:45', '2020-06-15 13:27:45'),
(23, 'С 1948 г. член Союза художников СССР', '2020-06-15 13:34:18', '2020-06-15 13:34:18'),
(24, '1994 - Вступил в Творческий союз художников России и Международную федерацию художников.', '2020-06-16 06:30:42', '2020-06-16 06:30:42'),
(25, 'Член Московского союза художников', '2020-06-16 06:49:51', '2020-06-16 06:49:51'),
(26, '1974 - вступление в Союз художников СССР', '2020-06-16 08:13:15', '2020-06-16 08:13:15'),
(27, '2001 - избран член-корреспондентом Российской академии художеств', '2020-06-16 08:15:27', '2020-06-16 08:15:27'),
(28, 'С 2002 - член правления Товарищества московских живописцев', '2020-06-16 08:16:02', '2020-06-16 08:16:02'),
(29, 'С 2006 - член правления Московского союза художников. Председатель выставочной комиссии МСХ.', '2020-06-16 08:16:58', '2020-06-16 08:16:58'),
(30, '2007 - избран действительным членом Российской академии художеств', '2020-06-16 08:17:41', '2020-06-16 08:17:41'),
(31, '1984 - Вступила в члены СХ', '2020-06-16 08:39:21', '2020-06-16 08:39:21'),
(32, 'Член Московского Союза Художников', '2020-06-16 08:44:18', '2020-06-16 08:44:18'),
(33, 'Член Международной Федерации Художников ЮНЕСКО', '2020-06-16 08:44:27', '2020-06-16 08:44:27'),
(34, 'Член Ассоциации Культуры L’Anello (Италия, Рим)', '2020-06-16 08:44:37', '2020-06-16 08:44:37'),
(35, 'Член Московского Союза Художников', '2020-06-16 08:56:05', '2020-06-16 08:56:05'),
(36, 'Член Международной Федерации Художников ЮНЕСКО', '2020-06-16 08:56:11', '2020-06-16 08:56:11'),
(37, 'Член Ассоциации Культуры L’Anello (Италия, Рим)', '2020-06-16 08:56:22', '2020-06-16 08:56:22'),
(38, 'Член «Нового Мюнхенского художественного объединения»', '2020-06-16 09:36:34', '2020-06-16 09:36:34'),
(39, 'В 1926—1929 годах входил в правление Ассоциации художников-графиков при Доме печати.', '2020-06-16 11:07:31', '2020-06-16 11:07:31'),
(40, 'В 1932 году вступил в Союз художников СССР.', '2020-06-16 11:07:44', '2020-06-16 11:07:44'),
(41, 'Член общества «4 искусства»', '2020-06-16 11:12:38', '2020-06-16 11:12:38'),
(42, 'Почётный член Московского клуба экслибриса.', '2020-06-16 11:12:53', '2020-06-16 11:12:53'),
(43, 'С 2015 Член Московского Союза Художников', '2020-06-16 11:30:47', '2020-06-16 11:30:47'),
(44, 'С 1982 года – член живописной секции Московского союза художников.', '2020-06-16 11:33:19', '2020-06-16 11:33:19'),
(45, 'С 1993 г. - член Международной ассоциации арт-педагогов и арт-терапевтов «Метаморфоза»', '2020-06-16 11:36:09', '2020-06-16 11:36:09'),
(46, 'С 2001 г. – член Профессиональной психотерапевтической лиги (ППЛ)', '2020-06-16 11:36:27', '2020-06-16 11:36:27'),
(47, 'В 1999 году вступила в Московский Союз художников', '2020-06-16 11:51:54', '2020-06-16 11:51:54'),
(48, 'В 1986 был принят в Союз художников', '2020-06-17 05:12:13', '2020-06-17 05:12:13'),
(49, 'В 1971 вступила в Союз художников', '2020-06-17 05:19:45', '2020-06-17 05:19:45'),
(50, 'С 1978 г. член Молодежного объединения при Союзе Художников СССР', '2020-06-17 05:26:40', '2020-06-17 05:26:40'),
(51, 'С 1987 г. член Союза Художников СССР', '2020-06-17 05:26:56', '2020-06-17 05:26:56'),
(52, 'Член Союза Художников', '2020-06-17 05:35:13', '2020-06-17 05:35:13'),
(53, 'Член Московского Союза Художников', '2020-06-17 05:43:35', '2020-06-17 05:43:35'),
(54, 'Член Творческого Союза Художников России', '2020-06-17 05:49:06', '2020-06-17 05:49:06'),
(55, 'Член МХФ', '2020-06-17 06:06:48', '2020-06-17 06:06:48'),
(56, 'Член МОСХ', '2020-06-17 06:07:00', '2020-06-17 06:07:00'),
(57, 'Член Союза Художников при ЮНЕСКО', '2020-06-17 06:07:16', '2020-06-17 06:07:16'),
(58, '2008 - член Московского союза художников', '2020-06-17 06:35:59', '2020-06-17 06:35:59'),
(59, 'С 2007 г. член Московского Союза Художников', '2020-06-17 07:01:55', '2020-06-17 07:01:55'),
(60, 'С 2013 г. член Diversité Artistique Montréal', '2020-06-17 07:02:07', '2020-06-17 07:02:07'),
(61, 'С 2007 г. член Московского Союза Художников', '2020-06-17 07:04:28', '2020-06-17 07:04:28'),
(62, 'С 2013 член Diversité Artistique Montréal', '2020-06-17 07:04:41', '2020-06-17 07:04:41'),
(63, 'С 2017 г. Regroupement des artistes en arts visuels RAAV', '2020-06-17 07:04:49', '2020-06-17 07:04:49'),
(64, 'Почетный член Российской Академии Художеств', '2020-06-17 07:07:36', '2020-06-17 07:07:36'),
(65, 'Заслуженный художник Российской Федерации', '2020-06-17 07:07:44', '2020-06-17 07:07:44'),
(66, 'Член Российского Союза Художников', '2020-06-17 07:07:51', '2020-06-17 07:07:51'),
(67, 'Член Московского Союза Художников', '2020-06-17 07:08:01', '2020-06-17 07:08:01'),
(68, 'Член Творческого Союза Художников России', '2020-06-17 07:08:12', '2020-06-17 07:08:12'),
(69, 'Член Международного Художественного Фонда', '2020-06-17 07:08:19', '2020-06-17 07:08:19'),
(70, '1966 - вступил в Союз художников СССР', '2020-06-17 07:18:20', '2020-06-17 07:18:20'),
(71, 'Резидент арт-группы ZOZAZES', '2020-06-17 08:12:11', '2020-06-17 08:12:11'),
(72, 'Резидент арт-группы ZOZAZES', '2020-06-17 08:13:36', '2020-06-17 08:13:36'),
(73, 'Резидент арт-группы ZOZAZES', '2020-06-17 08:15:37', '2020-06-17 08:15:37'),
(74, 'Участник Московской группы дизайнеров и типографов «Группа Т»', '2020-06-17 08:29:42', '2020-06-17 08:29:42'),
(75, 'Резидент творческих мастерских в ДХ МИИТ', '2020-06-17 08:29:59', '2020-06-17 08:29:59'),
(76, 'Организатор Школы графического дизайна и современных художественных практик «Т2»', '2020-06-17 08:30:11', '2020-06-17 08:30:11'),
(77, 'Куратор проекта «Медиарезиденция»', '2020-06-17 08:30:34', '2020-06-17 08:30:34'),
(78, 'ТСХР', '2020-06-17 08:36:14', '2020-06-17 08:36:14'),
(79, 'Участник граффити-команда RAYONS с 2010 года', '2020-06-17 08:44:09', '2020-06-17 08:44:09'),
(80, 'ТСХР', '2020-06-17 08:51:47', '2020-06-17 08:51:47'),
(81, 'ТСХР', '2020-06-17 08:56:53', '2020-06-17 08:56:53'),
(82, 'Член стрит-арт группы Zuk Club с 2016 г.', '2020-06-17 08:58:35', '2020-06-17 08:58:35'),
(83, 'Член Союза Художников России', '2020-06-17 08:59:38', '2020-06-17 08:59:38'),
(84, 'Член Союза художников Академии художеств', '2020-06-17 09:19:02', '2020-06-17 09:19:02'),
(85, 'С 1982 по 1984 годы   – стипендиат Союза художников СССР', '2020-06-23 09:05:27', '2020-06-23 09:05:27'),
(86, 'В 1984 году вступила в Союз художников СССР', '2020-06-23 09:05:37', '2020-06-23 09:05:37'),
(87, 'С 1982 по 1984 годы   – стипендиат Союза художников СССР', '2020-06-25 07:51:20', '2020-06-25 07:51:20');

-- --------------------------------------------------------

--
-- Структура таблицы `group_user`
--

CREATE TABLE `group_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `group_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `group_user`
--

INSERT INTO `group_user` (`user_id`, `group_id`) VALUES
(10, 5),
(10, 6),
(10, 7),
(7, 8),
(9, 9),
(11, 10),
(11, 12),
(12, 13),
(13, 14),
(14, 15),
(14, 16),
(14, 17),
(14, 18),
(14, 19),
(16, 20),
(17, 21),
(18, 22),
(19, 23),
(20, 24),
(21, 25),
(22, 26),
(22, 27),
(22, 28),
(22, 29),
(22, 30),
(23, 31),
(25, 35),
(25, 36),
(25, 37),
(26, 38),
(26, 39),
(26, 40),
(26, 41),
(26, 42),
(27, 43),
(28, 44),
(28, 45),
(28, 46),
(30, 47),
(31, 48),
(32, 49),
(33, 50),
(33, 51),
(34, 52),
(34, 11),
(35, 53),
(35, 54),
(36, 55),
(36, 56),
(36, 57),
(38, 58),
(39, 59),
(39, 60),
(40, 61),
(40, 62),
(40, 63),
(41, 64),
(41, 65),
(41, 66),
(41, 67),
(41, 68),
(41, 69),
(42, 70),
(46, 72),
(48, 73),
(52, 71),
(53, 74),
(53, 75),
(53, 76),
(53, 77),
(54, 78),
(56, 79),
(57, 80),
(58, 81),
(58, 82),
(58, 83),
(61, 84),
(64, 87),
(64, 86);

-- --------------------------------------------------------

--
-- Структура таблицы `lots`
--

CREATE TABLE `lots` (
  `id` bigint UNSIGNED NOT NULL,
  `sort` int UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('auction','gallery','sold','discontinued','empty') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'empty',
  `until` date DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `photos` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `price` int NOT NULL,
  `blitz` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `width` int DEFAULT NULL,
  `height` int DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `auction_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `lots`
--

INSERT INTO `lots` (`id`, `sort`, `title`, `status`, `until`, `photo`, `photos`, `price`, `blitz`, `year`, `width`, `height`, `text`, `auction_id`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 'Зимний лес. Охотник.', 'auction', '2020-12-31', 'lots/July2020/B1fHXduAuIZXf7HXH3lF.jpg', NULL, 300000, 0, 2010, 102, 100, '', 2, 10, NULL, '2020-07-30 22:10:00'),
(3, 0, 'Деревья', 'gallery', '2020-12-31', 'lots/June2020/AnqCAr6D9wRXMpsVH1jh.png', NULL, 200000, 0, 2018, 130, 100, '', NULL, 10, NULL, '2020-07-31 07:21:00'),
(4, 2, 'Деревья', 'auction', '2020-12-31', 'lots/June2020/W1wUNLLAeGflfNA96jq9.png', NULL, 250000, 0, 2010, 133, 100, '', 2, 10, NULL, '2020-07-21 00:32:00'),
(5, 3, 'Туман. Криушкино.', 'auction', NULL, 'lots/June2020/j9unDz9JdZ0Yz59I1RD9.jpg', NULL, 150000, 0, 2016, 65, 33, '', 2, 10, NULL, '2020-07-21 00:32:00'),
(6, 4, 'Склеенная амфора', 'auction', '2020-12-31', 'lots/July2020/eSXhnkmgrXUugkCIq0eV.jpeg', NULL, 4500000, 0, 2012, 50, 70, '', 2, 9, NULL, '2020-07-21 00:32:00'),
(7, 5, 'Радуга', 'auction', '2020-12-31', 'lots/July2020/n5nP2NcLSc4nrZOoeZFU.jpeg', NULL, 5000000, 0, 2010, 80, 65, '', 2, 9, NULL, '2020-07-27 08:51:27'),
(8, 6, 'Большая белая', 'auction', '2020-12-31', 'lots/July2020/lORbv6VL0YXqnmq7IQKI.jpeg', NULL, 4500000, 0, 2015, 80, 60, '', 2, 9, NULL, '2020-07-21 00:32:18'),
(9, 7, 'Февраль', 'auction', '2020-12-31', 'lots/July2020/wI91f7lsAzFVtbwOOmaX.jpeg', NULL, 5000000, 0, 2011, 80, 65, '', 2, 9, NULL, '2020-07-21 00:32:18'),
(10, 8, 'В кафе', 'auction', '2020-12-31', 'lots/July2020/iXfgayb04jcptNsi03P6.jpeg', NULL, 35000000, 0, 2007, 85, 90, '', 3, 12, NULL, '2020-07-21 00:32:00'),
(11, 9, 'Сладкий стол', 'auction', '2020-12-31', 'lots/July2020/jkAa2QaXo0KVRk0fv2Uw.jpeg', NULL, 30000000, 0, 2011, 96, 86, '', 3, 12, NULL, '2020-07-21 00:32:00'),
(12, 10, 'Я и дети на реке', 'auction', '2020-12-31', 'lots/July2020/AYUf1MF6GiA5SjU0ITDL.jpeg', NULL, 31000000, 0, 2011, 85, 100, '', 3, 12, NULL, '2020-07-21 00:32:00'),
(13, 11, 'Источник', 'auction', '2020-12-31', 'lots/July2020/SAOIVhYatghlVxUH0HtW.jpeg', NULL, 12000000, 0, 2014, 75, 65, '', 3, 12, NULL, '2020-07-21 00:32:00'),
(14, 12, 'Пудра', 'auction', '2020-12-31', 'lots/July2020/2Vjh72gYXHSFXdeKlVky.jpeg', NULL, 15000000, 0, 2017, 80, 75, '', 2, 12, NULL, '2020-07-21 00:32:18'),
(15, 13, 'Утренний кофе', 'auction', '2020-12-31', 'lots/July2020/Apf7dlufIs6Rz9fMi1Az.jpeg', NULL, 15000000, 0, 2018, 70, 65, '', 2, 12, NULL, '2020-07-21 00:32:18'),
(16, 14, 'Композиция 1', 'auction', '2020-12-31', 'lots/July2020/QZ1jralKXUdlJFSTH35d.jpeg', NULL, 3000000, 0, NULL, 30, 42, '', 2, 13, NULL, '2020-07-21 00:32:18'),
(17, 15, 'Композиция 2', 'auction', '2020-12-31', 'lots/July2020/BPvEGfU5e7RIe9GjT8oe.jpeg', NULL, 3000000, 0, NULL, 30, 42, '', 2, 13, NULL, '2020-07-21 00:32:18'),
(18, 16, 'Композиция 3', 'auction', '2020-12-31', 'lots/July2020/cIIqk67JtEUlVCQ3zWoM.jpeg', NULL, 3000000, 0, NULL, 30, 42, '', 2, 13, NULL, '2020-07-21 00:32:18'),
(19, 17, 'Композиция 4', 'auction', '2020-12-31', 'lots/July2020/PZdpgZGkJ219vrj4A6j0.jpg', NULL, 3000000, 0, NULL, 30, 42, '', 2, 13, NULL, '2020-07-21 00:32:18'),
(20, 18, 'Композиция 5', 'auction', '2020-12-31', 'lots/July2020/riMBDhXNUil1YHH8Nozc.jpg', NULL, 3000000, 0, NULL, 30, 42, '', 2, 13, NULL, '2020-07-21 00:32:18'),
(21, 19, 'Композиция 6', 'auction', '2020-12-31', 'lots/July2020/pg83D5sVz9jp7cyb8Xv9.jpg', NULL, 3000000, 0, NULL, 30, 42, '', 2, 13, NULL, '2020-07-21 00:32:18'),
(22, 20, 'Без названия 1', 'auction', '2020-12-31', 'lots/July2020/rbXMQu7UttRNsP7RotXj.jpeg', NULL, 5000000, 0, NULL, 62, 83, '', 2, 16, NULL, '2020-07-21 00:32:18'),
(23, 21, 'Без названия 2', 'auction', '2020-12-31', 'lots/July2020/FlFXD2O5gPf7iJUgNfuM.jpeg', NULL, 7000000, 0, NULL, 62, 83, '', 2, 16, NULL, '2020-07-21 00:32:00'),
(24, 22, 'Без названия 1', 'auction', '2020-12-31', 'lots/July2020/D8Ofqk1bwbjxCSPVBqZb.jpeg', NULL, 35000000, 0, 2017, 90, 200, '', 2, 14, NULL, '2020-07-21 00:32:18'),
(25, 23, 'Без названия 2', 'auction', '2020-12-31', 'lots/July2020/3WCmG1gZ9dS9yd52th8T.jpeg', NULL, 5500000, 0, 2019, 50, 50, '', 2, 14, NULL, '2020-07-21 00:32:18'),
(26, 24, 'Без названия 3', 'auction', '2020-12-31', 'lots/July2020/j15SRQQipjhtHoX2lhYk.jpeg', NULL, 5500000, 0, 2020, 50, 50, '', 2, 14, NULL, '2020-07-21 00:32:18'),
(27, 25, 'Серый шум 1', 'auction', '2020-12-31', 'lots/July2020/gImBCQCeKs0BGyp6hS6I.jpg', NULL, 1500000, 0, NULL, 30, 42, '', 2, 17, NULL, '2020-07-21 00:32:18'),
(28, 26, 'Серый шум 2 ', 'auction', '2020-12-31', 'lots/July2020/neRBZtg13J3JVRb0nxE3.jpeg', NULL, 1500000, 0, NULL, 30, 42, '', 2, 17, NULL, '2020-07-21 00:32:00'),
(29, 27, 'Серый шум 3', 'auction', '2020-12-31', 'lots/July2020/aDzl11UnOcMes4cMOwOC.jpeg', NULL, 1500000, 0, NULL, 30, 42, '', 2, 17, NULL, '2020-07-21 00:32:18'),
(30, 28, 'Серый шум 4 ', 'gallery', '2020-12-31', 'lots/July2020/CARqb4F73LrtJLSOKVns.jpeg', NULL, 3000000, 0, NULL, 42, 59, '', 2, 17, NULL, '2020-07-21 00:32:00'),
(31, 29, 'Серый шум 5', 'gallery', '2020-12-31', 'lots/July2020/ADw0nCCc23T3zy8Yh1Sn.jpg', NULL, 3000000, 0, NULL, 42, 59, '', 2, 17, NULL, '2020-07-21 00:32:00'),
(32, 30, 'Без названия 1', 'auction', '2020-12-31', 'lots/July2020/8jE7SVi8Szf2g1D45TmI.jpeg', NULL, 35000000, 0, NULL, 150, 150, '', 6, 20, NULL, '2020-07-21 00:32:00'),
(33, 31, 'Без названия 2', 'auction', '2020-12-31', 'lots/July2020/HxQaCLsVP1GzgtoSoFZF.jpg', NULL, 35000000, 0, NULL, 150, 150, '', 6, 20, NULL, '2020-07-21 00:32:00'),
(34, 32, 'Без названия 3', 'auction', '2020-12-31', 'lots/July2020/uUh8kC3Ug8PEmyEYrbMh.jpg', NULL, 48000000, 0, NULL, 130, 168, '', 2, 20, NULL, '2020-07-21 00:32:18'),
(35, 33, 'Предметы на синем фоне', 'auction', '2020-12-31', 'lots/July2020/XaKFHcZnGdKhINQrBjQk.jpeg', NULL, 500000, 0, 2001, 50, 60, '', 2, 23, NULL, '2020-07-21 00:32:18'),
(36, 34, '', 'auction', '2020-12-31', 'lots/July2020/wnfDV9QxTTZU1eZp27mZ.jpeg', NULL, 800000, 0, 2005, 80, 90, '', 2, 23, NULL, '2020-07-21 00:32:18'),
(37, 35, 'Красная композиция', 'gallery', '2020-12-31', 'lots/July2020/h4NuxeCTVJZrICqzjYiM.jpeg', NULL, 750000, 0, 2005, 60, 80, '', NULL, 23, NULL, '2020-09-17 09:17:31'),
(38, 36, '', 'auction', '2020-12-31', 'lots/July2020/nZZLypzIsK7I4ZLpG7Gg.jpeg', NULL, 700000, 0, 1990, 60, 80, '', 2, 23, NULL, '2020-07-21 00:32:18'),
(39, 37, 'Букет в мае и кайф от сирении', 'auction', '2020-12-31', 'lots/July2020/XT5ygI9zlBB6GAzkjhT8.jpg', NULL, 200000, 0, 2015, 70, 50, '', 2, 25, NULL, '2020-07-21 00:32:18'),
(40, 38, 'Букет ', 'auction', '2020-12-31', 'lots/July2020/TniwwKrkJxA2yQYqJyto.jpg', NULL, 130000, 0, 2013, 40, 80, '', 2, 25, NULL, '2020-07-21 00:32:18'),
(41, 39, 'Белые пионы', 'auction', '2020-12-31', 'lots/July2020/dJxyPS4d11ZpjWAoFv3a.jpg', NULL, 250000, 0, NULL, 50, 100, '', 2, 25, NULL, '2020-07-21 00:32:18'),
(42, 0, 'Букет на зеленом фоне', 'auction', NULL, 'lots/August2020/mOlrYpyPc5q7luv6xnud.jpg', NULL, 400000, 0, NULL, 100, 90, '', 2, 25, NULL, '2020-08-03 09:56:00'),
(43, 0, 'Веселая зима', 'auction', NULL, 'lots/August2020/YrisUeAYa1bF27nZrkoC.jpg', NULL, 70000, 0, 2017, 25, 20, '', NULL, 25, NULL, NULL),
(44, 0, 'Веселись! Апрель! ', 'auction', NULL, 'lots/August2020/U57BT88OAGdCTGG6v95c.jpg', NULL, 150000, 0, 2016, 70, 50, '', NULL, 25, NULL, NULL),
(45, 0, 'Весна идет! ', 'auction', NULL, 'lots/August2020/beAnE2AYBYOBrlXx4veq.jpg', NULL, 40000, 0, 2018, 27, 19, '', NULL, 25, NULL, NULL),
(46, 0, 'Вечер в Страхова', 'auction', NULL, 'lots/August2020/85ufpUTGrRssy3ncql0k.jpg', NULL, 400000, 0, 2016, 123, 75, '', NULL, 25, NULL, NULL),
(47, 0, 'Все равно хорошо', 'auction', NULL, 'lots/August2020/ncMgvHyYm2TL3oziVmI0.jpg', NULL, 230000, 0, 2012, 60, 50, '', NULL, 25, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `lot_images`
--

CREATE TABLE `lot_images` (
  `id` bigint UNSIGNED NOT NULL,
  `lot_id` bigint UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `materials`
--

CREATE TABLE `materials` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `materials`
--

INSERT INTO `materials` (`id`, `title`, `created_at`, `updated_at`) VALUES
(2, 'Картон', '2020-06-18 05:26:42', '2020-06-18 05:26:42'),
(3, 'Холст', '2020-06-18 05:27:00', '2020-06-18 05:27:00'),
(4, 'Акрил', '2020-07-03 08:44:17', '2020-07-03 08:44:17'),
(5, 'Бумага', '2020-07-03 09:06:38', '2020-07-03 09:06:38'),
(6, 'Пастель', '2020-07-03 09:06:55', '2020-07-03 09:06:55'),
(7, 'Картон', '2020-07-03 11:19:26', '2020-07-03 11:19:26'),
(8, 'Холст', '2020-07-03 11:19:31', '2020-07-03 11:19:31'),
(9, 'Масло', '2020-07-03 11:19:35', '2020-07-03 11:19:35');

-- --------------------------------------------------------

--
-- Структура таблицы `material_lot`
--

CREATE TABLE `material_lot` (
  `lot_id` bigint UNSIGNED NOT NULL,
  `material_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `material_lot`
--

INSERT INTO `material_lot` (`lot_id`, `material_id`) VALUES
(2, 2),
(4, 2),
(5, 2),
(10, 3),
(11, 3),
(11, 4),
(10, 4),
(12, 3),
(12, 4),
(13, 3),
(13, 4),
(14, 3),
(14, 4),
(15, 3),
(15, 4),
(16, 5),
(16, 6),
(17, 5),
(17, 6),
(18, 5),
(18, 6),
(19, 5),
(19, 6),
(20, 5),
(20, 6),
(21, 5),
(21, 6),
(22, 5),
(23, 5),
(24, 3),
(24, 4),
(25, 3),
(25, 4),
(26, 3),
(26, 4),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 5),
(32, 3),
(32, 4),
(33, 3),
(33, 4),
(34, 3),
(34, 4),
(39, 2),
(39, 3),
(39, 9),
(40, 3),
(40, 9),
(41, 3),
(41, 9),
(42, 3),
(42, 9),
(43, 2),
(43, 3),
(43, 9),
(44, 2),
(44, 3),
(44, 9),
(45, 2),
(45, 9),
(47, 3),
(47, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-05-21 01:06:59', '2020-05-21 01:06:59'),
(2, 'topmost', '2020-06-09 06:13:42', '2020-06-09 06:13:42'),
(3, 'top1', '2020-06-28 17:24:23', '2020-06-28 17:24:23'),
(4, 'top2', '2020-06-28 17:24:28', '2020-06-28 17:24:28'),
(5, 'top3', '2020-06-28 17:24:33', '2020-06-28 17:24:33'),
(6, 'top4', '2020-06-28 17:24:39', '2020-06-28 17:24:39'),
(7, 'footer-left', '2020-06-28 17:54:35', '2020-06-28 17:54:35'),
(8, 'footer-right', '2020-06-28 17:54:42', '2020-06-28 17:54:42'),
(9, 'copyright', '2020-06-28 17:54:49', '2020-06-28 17:54:49'),
(10, 'mobile', '2020-07-13 03:59:46', '2020-07-13 03:59:46'),
(11, 'mobile2', '2020-07-13 04:05:15', '2020-07-13 04:05:15'),
(12, 'mobile3', '2020-07-13 04:06:31', '2020-07-13 04:06:31');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(2, 1, 'Медиа', '', '_self', 'voyager-images', NULL, NULL, 7, '2020-05-21 01:06:59', '2020-08-03 03:42:33', 'voyager.media.index', NULL),
(3, 1, 'Пользователи', '', '_self', 'voyager-person', '#000000', 80, 1, '2020-05-21 01:06:59', '2020-08-03 03:42:20', 'voyager.users.index', 'null'),
(4, 1, 'Роли', '', '_self', 'voyager-lock', '#000000', 5, 3, '2020-05-21 01:06:59', '2020-06-11 01:26:01', 'voyager.roles.index', 'null'),
(5, 1, 'Инструменты', '', '_self', 'voyager-settings', '#000000', NULL, 8, '2020-05-21 01:06:59', '2020-08-03 03:42:33', NULL, ''),
(6, 1, 'Конструктор Меню', '', '_self', 'voyager-list', NULL, 5, 1, '2020-05-21 01:06:59', '2020-06-11 01:26:01', 'voyager.menus.index', NULL),
(7, 1, 'База данных', '', '_self', 'voyager-data', NULL, 5, 4, '2020-05-21 01:06:59', '2020-06-11 01:25:52', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 7, '2020-05-21 01:06:59', '2020-06-11 01:26:09', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 5, '2020-05-21 01:06:59', '2020-06-11 01:26:09', 'voyager.bread.index', NULL),
(10, 1, 'Настройки', '', '_self', 'voyager-settings', NULL, 5, 2, '2020-05-21 01:06:59', '2020-06-11 01:26:01', 'voyager.settings.index', NULL),
(11, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 6, '2020-05-21 01:06:59', '2020-06-11 01:26:09', 'voyager.hooks', NULL),
(15, 2, 'Как купить', '/how-to-buy', '_self', NULL, '#000000', NULL, 15, '2020-06-09 06:14:44', '2020-06-09 06:14:44', NULL, ''),
(16, 1, 'Аукционы', '', '_self', 'voyager-pie-chart', '#000000', 29, 1, '2020-06-09 07:32:51', '2020-06-29 02:01:27', 'voyager.auctions.index', 'null'),
(17, 1, 'Лоты', '', '_self', 'voyager-images', '#000000', 29, 2, '2020-06-09 07:35:48', '2020-06-29 02:01:30', 'voyager.lots.index', 'null'),
(18, 1, 'Оформления', '', '_self', 'voyager-certificate', '#000000', 29, 4, '2020-06-11 01:13:46', '2020-08-14 23:18:42', 'voyager.frames.index', 'null'),
(19, 1, 'Материалы', '', '_self', 'voyager-lab', '#000000', 29, 5, '2020-06-11 01:14:10', '2020-08-14 23:18:42', 'voyager.materials.index', 'null'),
(20, 1, 'Стили', '', '_self', 'voyager-wand', '#000000', 29, 6, '2020-06-11 01:14:36', '2020-08-14 23:18:42', 'voyager.styles.index', 'null'),
(21, 1, 'Техники', '', '_self', 'voyager-tools', '#000000', 29, 7, '2020-06-11 01:15:05', '2020-08-14 23:18:42', 'voyager.techniques.index', 'null'),
(23, 1, 'Страницы', '/admin/pages', '_self', 'voyager-file-text', '#000000', NULL, 5, '2020-06-14 13:52:52', '2020-08-03 03:42:46', NULL, ''),
(24, 2, 'Как продать', '/how-to-sell', '_self', NULL, '#000000', NULL, 16, '2020-06-14 13:55:10', '2020-07-13 04:06:11', NULL, ''),
(25, 2, 'Правила', '/rules', '_self', NULL, '#000000', NULL, 17, '2020-06-14 13:55:36', '2020-10-13 14:05:37', NULL, ''),
(26, 2, 'Доставка', '/delivery', '_self', NULL, '#000000', NULL, 18, '2020-06-14 13:55:52', '2020-07-13 04:07:19', NULL, ''),
(28, 1, 'Блог/Новости', '', '_self', 'voyager-news', '#000000', NULL, 4, '2020-06-28 17:15:47', '2020-08-03 03:42:46', 'voyager.posts.index', 'null'),
(29, 1, 'Аукционы / Лоты', '', '_self', 'voyager-pie-chart', '#000000', NULL, 2, '2020-06-28 17:17:37', '2020-08-03 03:42:50', NULL, ''),
(30, 3, 'Аукционы', '/auctions', '_self', NULL, '#000000', NULL, 1, '2020-06-28 17:25:32', '2020-08-27 03:26:19', NULL, ''),
(31, 3, 'Регулярные', '/auctions/regular', '_self', NULL, '#000000', NULL, 2, '2020-06-28 17:26:29', '2020-10-13 10:11:39', NULL, ''),
(32, 3, 'Тематические', '/auctions/special', '_self', NULL, '#000000', NULL, 3, '2020-06-28 17:27:25', '2020-10-13 10:11:46', NULL, ''),
(33, 3, 'Архив', '/auctions/archive', '_self', NULL, '#000000', NULL, 4, '2020-06-28 17:27:53', '2020-08-27 03:26:19', NULL, ''),
(34, 4, 'Онлайн-галерея', '/gallery', '_self', NULL, '#000000', NULL, 23, '2020-06-28 17:35:31', '2020-09-28 09:09:07', NULL, ''),
(35, 4, 'Работы в продаже', '/gallery', '_self', NULL, '#000000', NULL, 24, '2020-06-28 17:36:58', '2020-06-28 17:36:58', NULL, ''),
(36, 4, 'Авторы', '/authors', '_self', NULL, '#000000', NULL, 25, '2020-06-28 17:37:29', '2020-06-28 17:37:29', NULL, ''),
(37, 4, 'Архив', '/gallery/archive', '_self', NULL, '#000000', NULL, 26, '2020-06-28 17:38:03', '2020-09-07 01:56:29', NULL, ''),
(38, 5, 'ПРОСТРАНСТВА', '/events', '_self', NULL, '#000000', NULL, 27, '2020-06-28 17:39:01', '2020-10-13 10:12:25', NULL, ''),
(39, 5, 'Выставки', '/events/exhibitions', '_self', NULL, '#000000', NULL, 28, '2020-06-28 17:39:27', '2020-10-13 10:12:30', NULL, ''),
(40, 5, 'Мастерские', '/events/workshops', '_self', NULL, '#000000', NULL, 29, '2020-06-28 17:39:57', '2020-10-13 10:12:33', NULL, ''),
(41, 6, 'ПЛАТФОРМА', '/about', '_self', NULL, '#000000', NULL, 30, '2020-06-28 17:40:45', '2020-10-13 10:12:48', NULL, ''),
(42, 6, 'О проекте', '/about', '_self', NULL, '#000000', NULL, 31, '2020-06-28 17:41:13', '2020-06-28 17:41:13', NULL, ''),
(43, 6, 'Сотрудничество', '/partnership', '_self', NULL, '#000000', NULL, 32, '2020-06-28 17:41:57', '2020-06-28 17:41:57', NULL, ''),
(44, 6, 'Блог', '/blog', '_self', NULL, '#000000', NULL, 33, '2020-06-28 17:42:32', '2020-08-22 20:48:14', NULL, ''),
(45, 7, 'Как купить?', '/how-to-buy', '_self', NULL, '#000000', NULL, 34, '2020-06-28 17:55:39', '2020-06-28 18:57:15', NULL, ''),
(46, 7, 'Как продать?', '/how-to-sell', '_self', NULL, '#000000', NULL, 35, '2020-06-28 17:56:09', '2020-06-28 18:57:20', NULL, ''),
(47, 7, 'Правила Аукционов', '/rules', '_self', NULL, '#000000', NULL, 36, '2020-06-28 17:56:54', '2020-06-28 17:56:54', NULL, ''),
(48, 7, 'Оплата', '/payment', '_self', NULL, '#000000', NULL, 37, '2020-06-28 17:57:28', '2020-06-28 17:57:28', NULL, ''),
(49, 7, 'Доставка', '/delivery', '_self', NULL, '#000000', NULL, 38, '2020-06-28 17:58:00', '2020-06-28 17:58:00', NULL, ''),
(50, 8, 'Аукционы', '/auctions', '_self', NULL, '#000000', NULL, 1, '2020-06-28 17:58:32', '2020-08-22 20:47:37', NULL, ''),
(51, 8, 'онлайн-галерея', '/gallery', '_self', NULL, '#000000', NULL, 2, '2020-06-28 17:59:04', '2020-08-22 20:47:37', NULL, ''),
(52, 8, 'Авторы', '/authors', '_self', NULL, '#000000', NULL, 3, '2020-06-28 17:59:26', '2020-08-22 20:47:37', NULL, ''),
(53, 8, 'Выставки', '/events/exhibitions', '_self', NULL, '#000000', NULL, 4, '2020-06-28 17:59:50', '2020-10-13 10:13:21', NULL, ''),
(54, 8, 'Мастерские', '/events/workshops', '_self', NULL, '#000000', NULL, 5, '2020-06-28 18:00:11', '2020-10-13 10:13:25', NULL, ''),
(55, 8, 'НОВОСТИ', '/news', '_self', NULL, '#000000', NULL, 6, '2020-06-28 18:00:36', '2020-08-22 20:47:37', NULL, ''),
(56, 8, 'КОНТАКТЫ', '/contacts', '_self', NULL, '#000000', NULL, 8, '2020-06-28 18:00:58', '2020-08-22 20:47:37', NULL, ''),
(58, 9, 'Персональные данные', '/personal', '_self', NULL, '#000000', NULL, 46, '2020-06-28 18:01:39', '2020-07-20 07:43:37', NULL, ''),
(59, 9, 'Договор оферты', '/offer', '_self', NULL, '#000000', NULL, 47, '2020-06-28 18:01:56', '2020-07-20 07:44:04', NULL, ''),
(60, 1, 'Professions', '', '_self', NULL, NULL, 80, 3, '2020-06-29 02:02:44', '2020-08-03 03:42:31', 'voyager.professions.index', NULL),
(61, 1, 'Exhibits', '', '_self', NULL, NULL, 80, 4, '2020-06-29 02:02:54', '2020-08-03 03:42:31', 'voyager.exhibits.index', NULL),
(62, 1, 'Tags', '', '_self', NULL, NULL, 80, 5, '2020-07-09 08:52:50', '2020-08-03 03:42:32', 'voyager.tags.index', NULL),
(63, 1, 'Studies', '', '_self', NULL, NULL, 80, 6, '2020-07-09 08:54:40', '2020-08-03 03:42:32', 'voyager.studies.index', NULL),
(64, 1, 'Groups', '', '_self', NULL, NULL, 80, 2, '2020-07-09 08:54:54', '2020-08-03 03:42:20', 'voyager.groups.index', NULL),
(65, 10, 'Аукционы', '/auctions', '_self', NULL, '#000000', NULL, 1, '2020-07-13 04:00:50', '2020-09-22 03:35:25', NULL, ''),
(66, 10, 'Онлайн-галерея', '/gallery', '_self', NULL, '#000000', NULL, 2, '2020-07-13 04:01:22', '2020-09-22 03:35:36', NULL, ''),
(67, 10, 'Авторы', '/authors', '_self', NULL, '#000000', NULL, 3, '2020-07-13 04:01:54', '2020-08-22 20:47:02', NULL, ''),
(68, 10, 'Выставки', '/events/exhibitions', '_self', NULL, '#000000', NULL, 4, '2020-07-13 04:02:31', '2020-10-13 10:13:55', NULL, ''),
(69, 10, 'Мастерские', '/events/workshops', '_self', NULL, '#000000', NULL, 5, '2020-07-13 04:03:30', '2020-10-13 10:14:01', NULL, ''),
(70, 10, 'Новости', '/news', '_self', NULL, '#000000', NULL, 6, '2020-07-13 04:04:04', '2020-08-22 20:47:02', NULL, ''),
(71, 10, 'Контакты', '/contacts', '_self', NULL, '#000000', NULL, 8, '2020-07-13 04:04:38', '2020-08-22 20:47:02', NULL, ''),
(72, 11, 'Как купить', '/how-to-buy', '_self', NULL, '#000000', NULL, 60, '2020-07-13 04:05:44', '2020-07-13 04:05:44', NULL, ''),
(73, 11, 'Как продать', '/how-to-sell', '_self', NULL, '#000000', NULL, 61, '2020-07-13 04:06:18', '2020-07-13 04:06:18', NULL, ''),
(74, 12, 'Правила Аукционов', '/rules', '_self', NULL, '#000000', NULL, 62, '2020-07-13 04:06:57', '2020-07-13 04:07:58', NULL, ''),
(75, 12, 'Доставка', '/delivery', '_self', NULL, '#000000', NULL, 63, '2020-07-13 04:07:25', '2020-07-13 04:07:25', NULL, ''),
(76, 1, 'Адреса', '', '_self', 'voyager-location', '#000000', 77, 2, '2020-07-26 09:14:30', '2020-08-03 01:56:31', 'voyager.spaces.index', 'null'),
(77, 1, 'Пространства', '', '_self', 'voyager-calendar', '#000000', NULL, 3, '2020-07-26 20:42:56', '2020-08-03 03:42:50', NULL, ''),
(78, 1, 'События', '', '_self', 'voyager-calendar', '#000000', 77, 1, '2020-08-03 01:53:54', '2020-08-03 01:57:24', 'voyager.events.index', 'null'),
(79, 1, 'Эксперты', '', '_self', 'voyager-group', '#000000', NULL, 6, '2020-08-03 03:36:40', '2020-08-03 03:42:33', 'voyager.experts.index', 'null'),
(80, 1, 'Пользователи', '', '_self', 'voyager-people', '#000000', NULL, 1, '2020-08-03 03:41:40', '2020-08-03 03:42:50', NULL, ''),
(81, 1, 'Категории', '', '_self', 'voyager-categories', '#000000', 29, 3, '2020-08-14 23:18:35', '2020-08-14 23:18:42', 'voyager.categories.index', NULL),
(82, 10, 'Блог', '/blog', '_self', NULL, '#000000', NULL, 7, '2020-08-22 20:47:00', '2020-08-22 20:47:02', NULL, ''),
(83, 8, 'Блог', '/blog', '_self', NULL, '#000000', NULL, 7, '2020-08-22 20:47:35', '2020-08-22 20:47:37', NULL, ''),
(84, 5, 'Новости', '/news', '_self', NULL, '#000000', NULL, 64, '2020-08-22 20:48:39', '2020-08-22 20:48:39', NULL, '');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(50, '2020_06_09_130608_create_auctions_table', 3),
(51, '2020_06_09_131010_create_lots_table', 3),
(52, '2020_06_09_161319_create_lot_images_table', 3),
(53, '2020_06_09_162123_update_users_table', 3),
(90, '2020_06_09_162459_create_studies_table', 4),
(91, '2020_06_09_162518_create_exhibits_table', 4),
(92, '2020_06_09_162602_create_professions_table', 4),
(93, '2020_06_09_162610_create_groups_table', 4),
(94, '2020_06_11_095822_create_techniques_table', 4),
(95, '2020_06_11_095931_create_materials_table', 4),
(96, '2020_06_11_100116_create_frames_table', 4),
(97, '2020_06_11_100143_create_styles_table', 4),
(98, '2020_06_11_100543_create_categories_table', 4),
(99, '2020_06_11_172016_create_exhibit_user_table', 4),
(100, '2020_06_11_172028_create_group_user_table', 4),
(101, '2020_06_11_172050_create_profession_user_table', 4),
(102, '2020_06_11_172102_create_study_user_table', 4),
(103, '2020_06_12_140339_create_material_lot_table', 5),
(104, '2020_06_12_140408_create_technique_lot_table', 5),
(105, '2020_06_12_140419_create_style_lot_table', 5),
(106, '2020_06_12_140428_create_frame_lot_table', 5),
(107, '2020_06_12_140446_create_category_lot_table', 5),
(108, '2020_06_14_222244_create_pages_table', 6),
(109, '2020_06_18_071347_create_experts_table', 7),
(110, '2020_06_29_045416_create_news_table', 7),
(111, '2020_06_29_045637_create_posts_table', 7),
(112, '2020_07_09_171140_create_tags_table', 8),
(113, '2020_07_09_173751_create_post_tag_table', 8),
(114, '2020_07_26_174103_create_spaces_table', 9),
(115, '2020_07_31_104839_create_sessions_table', 10),
(120, '2020_08_03_092251_create_events_table', 11),
(121, '2020_08_03_092252_create_experts_table', 11),
(124, '2020_08_12_123241_create_bets_table', 12),
(125, '2020_08_12_123318_create_favorites_table', 12),
(126, '2020_08_27_071229_create_user_auction_table', 13);

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `author_id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Как купить', 'Как купить', '<p><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить&nbsp;</a><a style=\"box-sizing: border-box; color: #ffffff; text-decoration-line: none; background-color: #1e2b32; font-family: \'Roboto Condensed\', sans-serif; font-size: 18px; letter-spacing: 0.9px;\" href=\"http://act-art.loc/how-to-buy\">Как купить </a></p>', NULL, 'how-to-buy', 'Как купить ﻿', 'Как купить ﻿', 'ACTIVE', '2020-06-14 16:25:41', '2020-06-14 16:26:04'),
(2, 1, 'Как продать', 'Как продать', '<p>Как продать</p>', NULL, 'how-to-sell', 'Как продать', 'Как продать', 'ACTIVE', '2020-06-14 16:43:06', '2020-06-14 16:43:06'),
(3, 1, 'Правила', 'Правила', '<p>Правила</p>', NULL, 'rules', 'Правила', 'Правила', 'ACTIVE', '2020-06-14 16:43:28', '2020-06-14 16:43:28'),
(4, 1, 'Доставка', 'Delivery новости благотворительный аукцион на площадке состоится в субботу, это анонс лаготворительный аукцион на площадке состоится в суббот  аукцион на площадке состоится в субботу. Благотворительный аукцион на площадке состоится в субботу. Благотворительный аукцион на площадке состоится в субботу.', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-weight: bold; font-size: 18px;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка, сборка и установка мебели осуществляется единовременно.</span></span></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Узнать стоимость услуг подъема, сборки и установки мебели можно по&nbsp;<a style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; background-color: transparent; color: #3066be; line-height: inherit; cursor: pointer; border: none;\" href=\"https://mebel-v-omske.ru/uslugi\">ссылке</a>.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">При согласовании заказа с менеджером укажите, какие дополнительные услуги Вам необходимы.&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><img src=\"http://act-art.loc/storage/pages/July2020/3938b9fb451a3f8226293ce2c9907e19 (1).jpeg\" alt=\"\" /></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff0000;\">ВНИМАНИЕ!</span></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Мебель с механическими повреждениями поднятая на этаж, собранная и установленная покупателем самостоятельно обмену и возврату не подлежит.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #008000; font-weight: bold; font-size: 18px;\">Режим работы службы доставки и сборки:</span></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Только будние дни.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Первая половина дня &ndash; с 10.00 до 15.00</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Вторая половина дня &ndash; с 15.00 до 19.00 (возможно позднее в зависимости от загруженности службы доставки).</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #008000; font-weight: bold; font-size: 18px;\">Сроки и стоимость доставки до подъезда</span><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\" /><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка мебели из наличия,</span>&nbsp;возможна в течение трех дней с момента оформления заказа.&nbsp;Дату и время доставки с покупателем согласовывает продавец в момент покупки товара. В день доставки продавец делает предварительный контрольный звонок по телефону, если покупатель не отвечает то доставка переносится на другой день.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\" /><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка&nbsp;заказной мебели,</span>&nbsp;возможна в течение трех дней с момента готовности изделия. Срок изготовления мебели от 1 до 45&nbsp;дней. В момент готовности товара продавец информирует покупателя по телефону и согласовывает дату и время доставки.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка по Омской области:</span>&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">от магазина на расстояние до 35 км =&nbsp;30 руб/км.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">от магазина на расстояние&nbsp;35-80 км =&nbsp;40 руб/км. + 400 руб.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">от магазина на расстояние&nbsp;80-100&nbsp;км =&nbsp;45&nbsp;руб/км.&nbsp;+ 400 руб.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Доставка на расстояние более 100&nbsp;км.&nbsp;осуществляются через транспортные компании (см. доставка по России).</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><a style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; background-color: transparent; color: #3066be; line-height: inherit; cursor: pointer; border: none;\" href=\"https://yandex.ru/maps/?um=constructor%3A4ec29df074bed7dab6c9282e0c621364f3675018dbd567e1de199a3afd68ce6c&amp;source=constructorLink\" target=\"_blank\" rel=\"noopener noreferrer\">Найти себя на карте&nbsp;доставки по Омской области.</a></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-style: italic;\">*При оформлении заказа следует указать способ доставки: \"Другое\". Мы сделаем перерасчёт заказа с учётом доставки и свяжемся с Вами для согласования.</span></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка по России,</span>&nbsp;осуществляется с помощью транспортных компаний.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Покупатель самостоятельно выбирает транспортную компанию, выясняет стоимость грузоперевозки и оплачивает услугу.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-style: italic;\">*При оформлении заказа следует указать способ доставки: \"до транспортной компании\" и в комментарии к заказу написать адрес приемного пункта выбранной Вами транспортной компании, а так же данные получателя которые требует ТК.</span></p>', 'pages/July2020/bShcZkrqaMu61evcsqdi.jpeg', 'delivery', 'Доставка', 'Доставка', 'ACTIVE', '2020-06-14 16:43:53', '2020-07-20 02:22:52'),
(5, 1, 'Сотрудничество', 'Сотрудничество', '<p>Сотрудничество</p>', NULL, 'partnership', 'Сотрудничество', 'Сотрудничество', 'ACTIVE', '2020-07-20 10:36:17', '2020-07-20 10:36:55'),
(6, 1, 'Оплата', 'Оплата', '', NULL, 'payment', 'Оплата', 'Оплата', 'ACTIVE', '2020-07-20 10:40:34', '2020-07-20 10:41:44'),
(7, 1, 'Контакты', 'Контакты', '<p>Контакты</p>', NULL, 'contacts', 'Контакты', 'Контакты', 'ACTIVE', '2020-07-20 10:42:25', '2020-07-20 10:42:43'),
(8, 1, 'Договор оферты', 'Договор оферты', '<p>Договор оферты</p>', NULL, 'offer', 'Договор оферты', 'Договор оферты', 'ACTIVE', '2020-07-20 10:44:34', '2020-07-20 10:44:34'),
(9, 1, 'Персональные данные', 'Персональные данные', '<p><a style=\"box-sizing: border-box; color: #d6d6d6; background-color: #1e2b32; font-family: Roboto, sans-serif; letter-spacing: 0.54px; white-space: nowrap;\" href=\"http://act-art.loc/personal\">Персональные данные</a></p>', NULL, 'personal', 'Персональные данные', 'Персональные данные', 'ACTIVE', '2020-07-20 10:45:22', '2020-07-20 10:45:22'),
(10, 1, 'О проекте', 'О проекте', '<p>О проекте</p>', NULL, 'about', 'О проекте', 'О проекте', 'ACTIVE', '2020-07-20 10:46:23', '2020-07-20 10:46:23');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(2, 'browse_bread', NULL, '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(3, 'browse_database', NULL, '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(4, 'browse_media', NULL, '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(5, 'browse_compass', NULL, '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(6, 'browse_menus', 'menus', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(7, 'read_menus', 'menus', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(8, 'edit_menus', 'menus', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(9, 'add_menus', 'menus', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(10, 'delete_menus', 'menus', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(11, 'browse_roles', 'roles', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(12, 'read_roles', 'roles', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(13, 'edit_roles', 'roles', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(14, 'add_roles', 'roles', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(15, 'delete_roles', 'roles', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(16, 'browse_users', 'users', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(17, 'read_users', 'users', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(18, 'edit_users', 'users', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(19, 'add_users', 'users', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(20, 'delete_users', 'users', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(21, 'browse_settings', 'settings', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(22, 'read_settings', 'settings', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(23, 'edit_settings', 'settings', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(24, 'add_settings', 'settings', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(25, 'delete_settings', 'settings', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(26, 'browse_hooks', NULL, '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(27, 'browse_categories', 'categories', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(28, 'read_categories', 'categories', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(29, 'edit_categories', 'categories', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(30, 'add_categories', 'categories', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(31, 'delete_categories', 'categories', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(32, 'browse_posts', 'posts', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(33, 'read_posts', 'posts', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(34, 'edit_posts', 'posts', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(35, 'add_posts', 'posts', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(36, 'delete_posts', 'posts', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(37, 'browse_pages', 'pages', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(38, 'read_pages', 'pages', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(39, 'edit_pages', 'pages', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(40, 'add_pages', 'pages', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(41, 'delete_pages', 'pages', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(42, 'browse_auctions', 'auctions', '2020-06-09 10:32:51', '2020-06-09 10:32:51'),
(43, 'read_auctions', 'auctions', '2020-06-09 10:32:51', '2020-06-09 10:32:51'),
(44, 'edit_auctions', 'auctions', '2020-06-09 10:32:51', '2020-06-09 10:32:51'),
(45, 'add_auctions', 'auctions', '2020-06-09 10:32:51', '2020-06-09 10:32:51'),
(46, 'delete_auctions', 'auctions', '2020-06-09 10:32:51', '2020-06-09 10:32:51'),
(47, 'browse_lots', 'lots', '2020-06-09 10:35:48', '2020-06-09 10:35:48'),
(48, 'read_lots', 'lots', '2020-06-09 10:35:48', '2020-06-09 10:35:48'),
(49, 'edit_lots', 'lots', '2020-06-09 10:35:48', '2020-06-09 10:35:48'),
(50, 'add_lots', 'lots', '2020-06-09 10:35:48', '2020-06-09 10:35:48'),
(51, 'delete_lots', 'lots', '2020-06-09 10:35:48', '2020-06-09 10:35:48'),
(52, 'browse_frames', 'frames', '2020-06-11 04:13:46', '2020-06-11 04:13:46'),
(53, 'read_frames', 'frames', '2020-06-11 04:13:46', '2020-06-11 04:13:46'),
(54, 'edit_frames', 'frames', '2020-06-11 04:13:46', '2020-06-11 04:13:46'),
(55, 'add_frames', 'frames', '2020-06-11 04:13:46', '2020-06-11 04:13:46'),
(56, 'delete_frames', 'frames', '2020-06-11 04:13:46', '2020-06-11 04:13:46'),
(57, 'browse_materials', 'materials', '2020-06-11 04:14:10', '2020-06-11 04:14:10'),
(58, 'read_materials', 'materials', '2020-06-11 04:14:10', '2020-06-11 04:14:10'),
(59, 'edit_materials', 'materials', '2020-06-11 04:14:10', '2020-06-11 04:14:10'),
(60, 'add_materials', 'materials', '2020-06-11 04:14:10', '2020-06-11 04:14:10'),
(61, 'delete_materials', 'materials', '2020-06-11 04:14:10', '2020-06-11 04:14:10'),
(62, 'browse_styles', 'styles', '2020-06-11 04:14:36', '2020-06-11 04:14:36'),
(63, 'read_styles', 'styles', '2020-06-11 04:14:36', '2020-06-11 04:14:36'),
(64, 'edit_styles', 'styles', '2020-06-11 04:14:36', '2020-06-11 04:14:36'),
(65, 'add_styles', 'styles', '2020-06-11 04:14:36', '2020-06-11 04:14:36'),
(66, 'delete_styles', 'styles', '2020-06-11 04:14:36', '2020-06-11 04:14:36'),
(67, 'browse_techniques', 'techniques', '2020-06-11 04:15:05', '2020-06-11 04:15:05'),
(68, 'read_techniques', 'techniques', '2020-06-11 04:15:05', '2020-06-11 04:15:05'),
(69, 'edit_techniques', 'techniques', '2020-06-11 04:15:05', '2020-06-11 04:15:05'),
(70, 'add_techniques', 'techniques', '2020-06-11 04:15:05', '2020-06-11 04:15:05'),
(71, 'delete_techniques', 'techniques', '2020-06-11 04:15:05', '2020-06-11 04:15:05'),
(77, 'browse_professions', 'professions', '2020-06-29 05:02:44', '2020-06-29 05:02:44'),
(78, 'read_professions', 'professions', '2020-06-29 05:02:44', '2020-06-29 05:02:44'),
(79, 'edit_professions', 'professions', '2020-06-29 05:02:44', '2020-06-29 05:02:44'),
(80, 'add_professions', 'professions', '2020-06-29 05:02:44', '2020-06-29 05:02:44'),
(81, 'delete_professions', 'professions', '2020-06-29 05:02:44', '2020-06-29 05:02:44'),
(82, 'browse_exhibits', 'exhibits', '2020-06-29 05:02:54', '2020-06-29 05:02:54'),
(83, 'read_exhibits', 'exhibits', '2020-06-29 05:02:54', '2020-06-29 05:02:54'),
(84, 'edit_exhibits', 'exhibits', '2020-06-29 05:02:54', '2020-06-29 05:02:54'),
(85, 'add_exhibits', 'exhibits', '2020-06-29 05:02:54', '2020-06-29 05:02:54'),
(86, 'delete_exhibits', 'exhibits', '2020-06-29 05:02:54', '2020-06-29 05:02:54'),
(87, 'browse_news', 'news', '2020-06-29 06:14:26', '2020-06-29 06:14:26'),
(88, 'read_news', 'news', '2020-06-29 06:14:26', '2020-06-29 06:14:26'),
(89, 'edit_news', 'news', '2020-06-29 06:14:26', '2020-06-29 06:14:26'),
(90, 'add_news', 'news', '2020-06-29 06:14:26', '2020-06-29 06:14:26'),
(91, 'delete_news', 'news', '2020-06-29 06:14:26', '2020-06-29 06:14:26'),
(92, 'browse_tags', 'tags', '2020-07-09 11:52:50', '2020-07-09 11:52:50'),
(93, 'read_tags', 'tags', '2020-07-09 11:52:50', '2020-07-09 11:52:50'),
(94, 'edit_tags', 'tags', '2020-07-09 11:52:50', '2020-07-09 11:52:50'),
(95, 'add_tags', 'tags', '2020-07-09 11:52:50', '2020-07-09 11:52:50'),
(96, 'delete_tags', 'tags', '2020-07-09 11:52:50', '2020-07-09 11:52:50'),
(97, 'browse_studies', 'studies', '2020-07-09 11:54:40', '2020-07-09 11:54:40'),
(98, 'read_studies', 'studies', '2020-07-09 11:54:40', '2020-07-09 11:54:40'),
(99, 'edit_studies', 'studies', '2020-07-09 11:54:40', '2020-07-09 11:54:40'),
(100, 'add_studies', 'studies', '2020-07-09 11:54:40', '2020-07-09 11:54:40'),
(101, 'delete_studies', 'studies', '2020-07-09 11:54:40', '2020-07-09 11:54:40'),
(102, 'browse_groups', 'groups', '2020-07-09 11:54:54', '2020-07-09 11:54:54'),
(103, 'read_groups', 'groups', '2020-07-09 11:54:54', '2020-07-09 11:54:54'),
(104, 'edit_groups', 'groups', '2020-07-09 11:54:54', '2020-07-09 11:54:54'),
(105, 'add_groups', 'groups', '2020-07-09 11:54:54', '2020-07-09 11:54:54'),
(106, 'delete_groups', 'groups', '2020-07-09 11:54:54', '2020-07-09 11:54:54'),
(107, 'browse_spaces', 'spaces', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(108, 'read_spaces', 'spaces', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(109, 'edit_spaces', 'spaces', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(110, 'add_spaces', 'spaces', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(111, 'delete_spaces', 'spaces', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(112, 'browse_events', 'events', '2020-08-03 04:53:54', '2020-08-03 04:53:54'),
(113, 'read_events', 'events', '2020-08-03 04:53:54', '2020-08-03 04:53:54'),
(114, 'edit_events', 'events', '2020-08-03 04:53:54', '2020-08-03 04:53:54'),
(115, 'add_events', 'events', '2020-08-03 04:53:54', '2020-08-03 04:53:54'),
(116, 'delete_events', 'events', '2020-08-03 04:53:54', '2020-08-03 04:53:54'),
(117, 'browse_experts', 'experts', '2020-08-03 06:36:40', '2020-08-03 06:36:40'),
(118, 'read_experts', 'experts', '2020-08-03 06:36:40', '2020-08-03 06:36:40'),
(119, 'edit_experts', 'experts', '2020-08-03 06:36:40', '2020-08-03 06:36:40'),
(120, 'add_experts', 'experts', '2020-08-03 06:36:40', '2020-08-03 06:36:40'),
(121, 'delete_experts', 'experts', '2020-08-03 06:36:40', '2020-08-03 06:36:40');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(121, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` enum('BLOG','NEWS') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'BLOG',
  `status` enum('PUBLISHED','DRAFT','PENDING') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`id`, `date`, `title`, `seo_title`, `excerpt`, `body`, `image`, `images`, `slug`, `meta_description`, `meta_keywords`, `category`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(3, '2020-06-29 06:29:00', '«В стране приключений» Богачева', 'нигам серии «Страна прикл', '29 марта в 18:00 при поддержке Управы района Хамовники г. Москвы, РОО «МАСТЕР-КЛАСС» и Московского отделения ВТОО «Союза художников России» состоялось открытие выставки Юрия Богачева «В стране приключений».\n\n• Юрий Николаевич Богачёв родился в 1956 году в г. Электростали Московской области.\n• В 1975 году окончил Московское государственное академическое художественное училище «Памяти 1905 года».', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">29 марта в 18:00 при поддержке Управы района Хамовники г. Москвы, РОО &laquo;МАСТЕР-КЛАСС&raquo; и Московского отделения ВТОО &laquo;Союза художников России&raquo; состоялось открытие выставки Юрия Богачева &laquo;В стране приключений&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">&bull; Юрий Николаевич Богачёв родился в 1956 году в г. Электростали Московской области.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; В 1975 году окончил Московское государственное академическое художественное училище &laquo;Памяти 1905 года&raquo;.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; В 1975-1977 гг. служил в Советской армии.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; В 1986 году окончил с отличием факультет художественного оформления печатной продукции Московского полиграфического института.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; Член Союза художников России.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; Член Союза журналистов России.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">С 1984 года Ю.Н. Богачёв работает в книжной графике. Оформил и проиллюстрировал более 60 книг для издательств: &laquo;Молодая гвардия&raquo;, &laquo;Малыш&raquo;, &laquo;Красноярское книжное издательство&raquo;, &laquo;Прометей&raquo;, &laquo;Центр детской книги&raquo;, &laquo;Московские учебники и картолитография&raquo;, &laquo;Москвоведение&raquo;, &laquo;Лазурь&raquo;, &laquo;Русский язык&raquo;, &laquo;Лазаревское&raquo;, &laquo;Азбука-Аттикус&raquo;, &laquo;Махаон&raquo;, &laquo;Аудитория&raquo;, &laquo;Нигма&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">&bull; Художник нескольких диафильмов Студии &laquo;Диафильм&raquo; Госкино СССР, 1987-1989 гг.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; Участник городских, областных, зональных, региональных, всероссийских, международных художественных выставок и книжных выставок-ярмарок: ММКВЯ, &laquo;Книги России&raquo;, &laquo;Красная плащадь&raquo;, &laquo;Иоп-бсйоп&raquo;, выставок художников книги в Нюрнберге и Барселоне.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; Неоднократно награждён знаками отличия, дипломами, почётными грамотами и благодарственными письмами государственных, федеральных, региональных, муниципальных структур и общественных организаций.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Рисовать для детей как для взрослых, разговаривать с ребёнком на равных, уважать в нём зрителя и собеседника &mdash; вот принципы иллюстратора Ю. Богачёва. Многие годы он работал над изданиями детской, учебной и просветительской литературы, учебниками по москвоведению и краеведению, книгами, посвящёнными истории нашей столицы и Подмосковья, истории обороны российских рубежей, родословию А.С. Пушкина.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">С начала 2010-х годов иллюстрирует классику мировой художественной и приключенческой литературы.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">В данную экспозицию вошли иллюстрации к книгам разных лет (1994-2019):<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><em style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Л. Яхнин &laquo;Колокола&raquo;, издательство &laquo;Малыш&raquo;, О. Иванов &laquo;Герои ратных дел Отчизны&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />В. Муравьёв &laquo;История Москвы в пословицах и поговорках&raquo;, изд. &laquo;Москвоведение&raquo;.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Л. Черкашина &laquo;Тайны Пушкинского древа&raquo;, изд. &laquo;Лазурь&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />П. Краснов &laquo;Таинственный часовой&raquo;, изд. &laquo;Лазаревское&raquo;; к книгам серий &laquo;Мировая классика для детей&raquo; и &laquo;Классная классика&raquo; изд. &laquo;Махаон&raquo;: &laquo;Слово о полку Игореве&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />М. Сервантес &laquo;Дон Кихот&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Э. Портер &laquo;Поллианна выросла&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />О. Тихормиров &laquo;На страже Руси&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Э. По &laquo;Золотой жук&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Ж. Рони-Сташий &laquo;Борьба за огонь&raquo;; к книгам серии &laquo;Страна приключений&raquo; изд. &laquo;Нигма&raquo;:<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />В. Обручев &laquo;Плутония&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Т. Майн Рид &laquo;Белый вождь&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Г. Эмар &laquo;Твёрдая рука&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Т. Майн Рид &laquo;Всадник без головы&raquo; и др.</em></p>', 'posts/July2020/JL8r050f8BYs3BxvYL4X.jpg', '[\"posts\\/July2020\\/AdypTQIseI4AUWF14fkH.jpg\",\"posts\\/July2020\\/uhRUCmfsNFcuGNXHQUJe.jpg\",\"posts\\/July2020\\/1wMl6IK4bgaNiUCqxzSe.jpg\",\"posts\\/July2020\\/sXu9mazjQw42BkYchmGb.jpg\"]', 'v-strane-priklyuchenij-bogacheva', 'ший «Борьба за огонь»; к книгам серии «Страна приключений» изд. «Нигма»:\nВ. Обручев «Плутония»,\nТ. Майн Рид «Белый вож', 'ший «Борьба за огонь»; к книгам серии «Страна приключений» изд. «Нигма»:\nВ. Обручев «Плутония»,\nТ. Майн Рид «Белый вож', 'NEWS', 'PUBLISHED', 0, '2020-06-29 06:29:37', '2020-08-06 05:20:34'),
(5, '2020-06-29 01:16:00', '«АнтиБудни» современных художников', '', '14 апреля в арт-пространстве «Мастер-класс» (Фрунзенская набережная, 10) состоялось открытие коллективной выставки современных художников.', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">14 апреля в арт-пространстве &laquo;Мастер-класс&raquo; (Фрунзенская набережная, 10) состоялось открытие коллективной выставки современных художников. Экспозиция с символичным названием &laquo;<em style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">АнтиБудни</em>&raquo; продлится до 27 апреля. Посетить её совершенно бесплатно может любой желающий. А увидеть работы молодых художников своими глазами определённо стоит!&nbsp;<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Дело в том, что эта маленькая, но вполне уже &laquo;могучая кучка&raquo; творцов, состоящая из восьми человек, решила посвятить себя художественному ремеслу совсем недавно: люди, некоторое время назад получившие дипломы филологов, инженеров, экономистов, бухгалтеров, маркетологов, инженеров, учителей физики и математики &ndash; кардинально сменили сферу деятельности, заставили работать свои правые полушария и поступили в Московский государственный академический художественный институт имени В. И. Сурикова.&nbsp;<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Итак, три года назад было принято непростое решение, а уже сегодня у молодых живописцев состоялся маленький триумф. И пусть их работы пока не выставляются в Метрополитен-музее, но определённый шаг на пути творческой реализации эти люди точно сделали. В течение двух недель мы будем ближе знакомить вас с &laquo;героями&raquo; нашей выставки. Начнём с человека со звучной и очень аристократичной фамилией &ndash; Алексея Саввина. Журналист по первому образованию, кандидат филологических наук, Алексей в 30 лет сменил перо на кисть. В своем дипломном проекте &ndash; &laquo;Гольф-клуб зимой&raquo; &ndash; он объединил два больших увлечения: спорт и живопись.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Эти картины, ещё пахнущие маслом, вы сможете оценить, придя в галерею. А сегодня полюбуйтесь другой работой Алексея: &laquo;Деревенская проза&raquo; (2018 г.). От одного взгляда на полотно становится очень уютно. На нём, пусть и гиперболизированно, но всё же собраны главные атрибуты деревенского быта и избы: &laquo;курочка Ряба&raquo;, немагазинные яйца, краюшка свежеиспеченного хлеба, самовар, корзинка с яркими, разноцветными яблоками, колосья, серп&hellip; В эти предпасхальные недели такой натюрморт (за исключение Рябы, конечно) буквально наполняет теплотой и светом грядущего праздника&hellip;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Участники выставки &ndash; люди, состоявшиеся в первой профессии, но не разучившиеся мечтать и стремиться к новым вершинам, все они познакомились, в МГАХИ им. Сурикова на отделении дополнительного профессионального образования.&nbsp; Первый в 2019 году выпуск ДПО МГАХИ им. Сурикова подарил новую специальность филологу, бухгалтеру, экономисту, маркетологу, инженеру, математику и учителюфизику.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\"><em style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Участники выставки:</em></strong></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Кебал Екатерина</strong>&nbsp;не случайно выбрала тему дипломной работы &laquo;Старый сад&raquo; &mdash; почти все свое свободное время Екатерина проводит на пленэрах, черпая вдохновение в окружающей природе. Все пейзажи Екатерины выполнены в общей узнаваемой стилистике, которой присущи теплые тона, гармоничные сочетания красок и густой мазок.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Полунина Елена</strong>&nbsp;нашла свое вдохновение в поэзии московских улочек и, сама не успела заметить как, влюбилась в городской пейзаж. На выставке будут представлены ее работы на тему &laquo;Прогулки по Москве&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Саввин Алексей</strong>&nbsp;&mdash; журналист, кандидат филологических наук. В 30 лет решил, что пора сменить перо на кисть и поступил в МГАХИ имени Сурикова, где смог объединить два своих увлечения: спорт и живопись в дипломной работе &laquo;Гольф-клуб зимой&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Лаврентьева Анна</strong>&nbsp;стала &laquo;певцом&raquo; профессии мужа-пианиста. Наблюдение и зарисовки за процессом подготовки любимого человека к концертам в домашней обстановке переродились в попытку передать торжественную атмосферу концертного зала и одиночество солиста на сцене.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Кузнецова Марина</strong>&nbsp;занималась живописью любительски, но желание учиться и совершенствоваться в любимом деле привели ее в МГАХИ им. Сурикова, и не зря. Ее работы о повседневной городской жизни умиротворяют, как будто ведут со зрителем спокойный диалог, рассказывая о своем сюжете.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Карабаш Екатерина</strong>&nbsp;&ndash; математик. Но разве скажешь это по ее работам? Скорее, наоборот, в работах отсутствует холодный расчет, все место занимает живопись.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Вязников Кирилл</strong>&nbsp;с самого раннего детства родители стремились привить Кириллу навыки рисования и тягу к искусству, но бунтарский отпрыск никак не желал идти по этому пути. Спустя время, что-то внутри перемкнуло и на последних курсах горно-инженерного образования, появилась тяга к искусству. Начав с рисунков гелевыми ручками и &laquo;заболев&raquo; иллюстрацией и графикой, взялся за живопись и на данный момент продолжает совершенствоваться во всех художественных техниках.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Сосина Милана&nbsp;</strong>родилась и выросла в Москве. Диплом МГАХИ им. Сурикова стал ярким дополнением к дипломам Финансовой академии при Правительстве РФ и МГИМО. Её дипломная работа посвящена редким моментам рефлексии жителей в суете большого города.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Участники выставки совершенно разные люди из разных поколений, разных специальностей, но всех их объединяет одна дорога к творчеству.</p>', 'posts/July2020/dDVBhOlQQcGrAWA0QFQp.jpg', NULL, 'antibudni-sovremennyh-hudozhnikov', '', '', 'NEWS', 'PUBLISHED', 0, '2020-06-29 01:16:39', '2020-07-28 13:22:10'),
(6, '2020-06-29 01:18:00', '«А мой дедушка на войну ездил»', '', 'В простых привычных вещах художник научился видеть подчас скрытый, но великий смысл. В его пейзажах наиболее полно раскрывается поэтическая основа его таланта. За долгие годы художник приобрел свою особую мягкую лирическую остроту и свежесть восприятия жизни.', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">7 мая, в преддверии Дня Победы, прошло открытие выставки картин Александра Евгеньевича Степанок.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Александр участник московских, зональных, республиканских и зарубежных выставок. Работы закупленные художественным фондом СССР, находятся в музеях и картинных галереях бывшего СССР, Германии, Австрии, а так же в частных собраниях коллекционеров Израиля, США, Австрии и др. Окончил художественно &mdash; графический факультет МГЗПИ. Работает в жанре пейзажа. В Союз художников вступил в 1984 году.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Александр Евгеньевич &mdash; участник Отечественной войны. Награжден Орденом Отечественной войны 1 степени и медалью за &laquo;За боевые заслуги&raquo;. Годы сражений и потерь обострили в нем чувство привязанности к родной земле. В простых привычных вещах художник научился видеть подчас скрытый, но великий смысл. В его пейзажах наиболее полно раскрывается поэтическая основа его таланта. За долгие годы художник приобрел свою особую мягкую лирическую остроту и свежесть восприятия жизни. Художник удивительно работоспособен. Он много работает в мастерской за мольбертом и на планере с этюдами.</p>', 'posts/July2020/2wLbV9Puls2ppHNJgRhr.jpg', NULL, 'a-moj-dedushka-na-vojnu-ezdil', '', '', 'NEWS', 'PUBLISHED', 0, '2020-06-29 01:18:08', '2020-07-28 13:20:53'),
(7, '2020-06-29 01:19:00', 'Выставка «Пушкин наш, и всё!»', '', 'Многие художники обращались и обращаются к образу поэта, его творчеству, пытаются постичь феномен влияния гения Пушкина на русскую культуру, русскую жизнь. Выставка — наглядная иллюстрация того, как разные поколения художников осмысляют пушкинское наследие.', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">6 июня в медиастудии павильона &laquo;Медиацентр&raquo; парка &laquo;Зарядье&raquo; прошла выставка&nbsp;&laquo;Пушкин наш, и&nbsp;всё!&raquo;, посвященная 220-летию со&nbsp;дня рождения А.&nbsp;С.&nbsp;Пушкина.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Многие художники обращались и обращаются к образу поэта, его творчеству, пытаются постичь феномен влияния гения Пушкина на русскую культуру, русскую жизнь. Выставка &mdash; наглядная иллюстрация того, как разные поколения художников осмысляют пушкинское наследие.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Свыше 70 работ 20-ти московских художников разных поколений, которых объединяет любовь к творчеству великого русского поэта и интерес к его личности.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Интересно, что в своих работах художники ведут прямой диалог с Пушкиным, моделируют различные жизненные ситуации, где поэт присутствует среди людей нашего времени.</p>', 'posts/July2020/MMw9vN0dREh9Xf5FScRU.jpg', NULL, 'vystavka-pushkin-nash-i-vsyo', '', '', 'NEWS', 'PUBLISHED', 0, '2020-06-29 01:19:00', '2020-07-28 13:21:17'),
(8, '2020-06-29 01:20:00', 'Таинственная плесень на стене', '', 'Современное искусство – это вам не «Утро в сосновом бору» Шишкина и даже не «Чёрный квадрат» Малевича, его далеко не каждый поймёт. Да что уж там, его не каждый распознает. Стоит на выставке забор с нецензурным словом и не известно ещё, хулиганство это или экспонат.', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Современное искусство &ndash; это вам не &laquo;Утро в сосновом бору&raquo; Шишкина и даже не &laquo;Чёрный квадрат&raquo; Малевича, его далеко не каждый поймёт. Да что уж там, его не каждый распознает. Стоит на выставке забор с нецензурным словом и не известно ещё, хулиганство это или экспонат.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Знаменитый теоретик искусства Эрнст Гомбрих высказывал мнение, что корректно определить художественную ценность какого-либо произведения можно лишь спустя 50 лет после его создания, а до того даже профессиональный искусствовед может ошибаться. Куда уж там простым любителям прекрасного, когда далеко не каждый знает, что &laquo;Утро в сосновом бору&raquo; написано Шишкиным совместно с Константином Савицким, а &laquo;Чёрных супрематических квадратов&raquo; у Малевича, как минимум, четыре, не считая ещё красного и белого, причём первый из чёрных долгое время висел в Третьяковской галерее вверх ногами.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">К современному искусству зачастую относятся с недоумением, с пренебрежением, со снисхождением или даже с усмешкой. Это нормально. Не к сожалению и не к счастью, просто нормально. Творческая мысль настоящего художника и должна лететь впереди других. Привычные и знакомые большинству людей культура и искусство &ndash; это хвост кометы настоящего художника. Мы в хвосте порой просто не можем представить себе, какой космос открывается перед глазами авангардного творца. Но ведь это не значит, что не должны даже пытаться представить. Тем более, что художник изо всех сил стремится этот свой космический взгляд передать в форме своих работ. Приди и смотри.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">2 сентября во Дворце культуры Российского университета транспорта прошло торжественное открытие арт-кластера</strong>, предварительно названного &laquo;Домом художника&raquo;. Да, гостей было не много. Да, ещё не все этажи работают. И да, не все из работающих помещений до конца отремонтированы. Но &laquo;когда б вы знали, из какого сора&raquo;&hellip; Великие произведения искусства уже очень давно рождаются не только и не столько в академических мастерских. Дворец культуры РУТ (МИИТ) открыл абсолютно уникальное арт-пространство. Ничего подобного в других вузах Москвы просто нет. И пока выпускники нашего университета строят пути земные и бороздят физические пространства, учащиеся и сотрудники могут свободно приобщиться к прокладыванию дорог вечности и постараться охватить космические объёмы духа. Описывать здесь экспозиции и мастерские не имеет смысла. Это как раз тот случай, когда надо хотя бы один раз увидеть. Но одна из работ содержит в себе фразу, которая отлично характеризует и культурную значимость, и авангардное направление, и качественное содержание, и сам старт работы арт-кластера: &laquo;Во имя Отца, и Сына, и Святого Духа. Огонь!&raquo;</p>\n<p><iframe src=\"https://www.youtube.com/embed/mQVruSjNH0E\" width=\"100%\" height=\"360\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>', 'posts/July2020/plyocU7KI3ut4ak9MkXj.jpg', NULL, 'tainstvennaya-plesen-na-stene', '', '', 'NEWS', 'PUBLISHED', 0, '2020-06-29 01:20:49', '2020-07-28 13:21:45'),
(9, '2020-06-29 01:22:00', '«Из подбора»', '', '«Из подбора» — театральный термин, означающий, что, если к новому спектаклю не хватает чего-либо из реквизита или костюмов, то можно подобрать из коллекции прошлых постановок, идущих или уже сошедших со сцены. Для художника смысл термина раскрывается шире — в нём и смысл, и концепция, и метод.', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Мария Калмыкова, Максим Проценко, Полина Земскова</strong><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">12 сентября 2019г. в выставочном пространстве Мастер-Класс</strong><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">галерея ВСЕКОХУДОЖНИК представили выставку &laquo;Из подбора&raquo;, посвящённую Году театра.</strong></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">&laquo;Из подбора&raquo; &mdash; театральный термин, означающий, что, если к новому спектаклю не хватает чего-либо из реквизита или костюмов, то можно подобрать из коллекции прошлых постановок, идущих или уже сошедших со сцены. Для художника смысл термина раскрывается шире &mdash; в нём и смысл, и концепция, и метод. Подобрать можно и с пола, и из мусора, получить в подарок от друзей или выбрать в магазине некоторый предмет, который станет частью нового произведения.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Художники Мария Калмыкова и Максим Проценко (М+М) часто используют этот художественный приём, вводя использованные уже предметы в свои работы, будь то старая доска, сломанная швейная машинка, пружинный матрас, &laquo;дворники&raquo; от автомобиля и т.д.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">На выставке представлены объекты, скульптура, инсталляции, созданные именно по этому принципу. Дополнят экспозицию фотоработы Полины Земсковой, зафиксировавшей своей камерой рабочие моменты оформления спектакля в театре &laquo;Современник&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Выставка проходит в Год театра. Мария Калмыкова и Максим Проценко много работают как театральные художники, хорошо знают этот мир изнутри и раскрывают маленькие секреты профессии художника.</p>', 'posts/July2020/AgxqKnjOgFPl8kaMFYx6.jpg', NULL, 'iz-podbora', '', '', 'NEWS', 'PUBLISHED', 0, '2020-06-29 01:22:06', '2020-07-28 13:21:33'),
(24, '2020-06-29 06:26:00', '«СЕМЬЯ» Эппле', '', 'Художник без публики состояться не сможет. Открытие нашего пространства выставкой с символичным названием Семья не случайна. Семья - это не только общность людей, связанных кровными узами, а более емкое понятие.', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Художник без публики состояться не сможет. Открытие нашего пространства выставкой с символичным названием Семья не случайна. Семья - это не только общность людей, связанных кровными узами, а более емкое понятие. Семья &mdash; это группа людей, объединенных одной общей идеей, общим делом, одним общим домом, где всем вместе хорошо и уютно, где каждый член семьи поддерживает другого, в нужный момент протягивает руку помощи. Эта дружеская поддержка позволяет уверенно идти по жизни, покорять новые вершины в профессиональном и житейском плане. Этими нехитрыми принципами мы и будем<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />руководствоваться в нашей предстоящей работе.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">В семье художников Леонида Эппле и Ольги Волгиной-Эппле подрастают четыре замечательные дочери &mdash; Софья, Евгения, Елизавета и Анна. Дети унаследовали заразительный ген творчества. Старшая Софья &mdash; студентка кино колледжа, осваивает профессию фотографа, кинорежиссера. Евгения &mdash; одна из лучших учениц Московского Академического художественного лицея при институте им. Сурикова. Елизавета и Анна выступают в фольклорном танцевальном ансамбле. Отец семейства &mdash; Леонид Эппле учился в художественно-промышленной академии им. Строганова, известный московский живописец, реставратор, резчик по дереву, участник многочисленных выставок в России и за рубежом, его работы находятся в личных коллекциях по всему миру &mdash; Германии, Дании, Израиле, США, Мексике, Испании и др. странах. Мама &mdash; Ольга Волгина-Эппле &mdash; по образованию художник-график. Занимается оформление книг, преподавательской деятельностью. В последнее время уделяет много времени живописи. Вырабатывает свой неповторимый художественный почерк. Работы пользуются большой популярностью у публики Евгения делает первые шаги в искусстве. Многие специалисты отмечают ее незаурядные способности, ее графические листы по-взрослому профессиональны, отличаются любовью к<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />изображению деталей, образны, композиционно целостны.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Все члены этой большой и дружной семьи не мыслят себя вне искусства.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; text-align: right; margin: 0px 0px 1rem !important 0px;\"><em style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Ю. Ланглебен</em></p>', 'posts/July2020/aZOGtk3CwKMB2LxdS6sg.jpg', NULL, 'sem-ya-epple8', '', '', 'NEWS', 'PUBLISHED', 0, '2020-06-29 06:26:07', '2020-08-06 05:19:00'),
(32, '2020-08-05 09:49:00', 'Репортаж с открытия тематической росписи фасадной стены и выставки', '', 'Небольшой репортаж с открытия тематической росписи фасадной стены административного корпуса и выставки, посвящённой истории железнодорожного транспорта', '<p>Небольшой репортаж с открытия тематической росписи фасадной стены административного корпуса и выставки, посвящённой истории железнодорожного транспорта во Дворце культуры Российского университета транспорта.<br /><br /><iframe src=\"//vk.com/video_ext.php?oid=-159&amp;id=456239263&amp;hash=705e03a04e62932a&amp;hd=1\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>', 'posts/August2020/PTNMTtU1CZsScRop0aKs.jpg', NULL, 'reportazh-s-otkrytiya-tematicheskoj-rospisi-fasadnoj-steny-i-vystavki', '', '', 'BLOG', 'PUBLISHED', 0, '2020-08-06 06:51:35', '2020-08-19 05:31:47'),
(33, '2020-08-18 09:28:00', 'Наше арт-пространство глазами выпускниц британской высшей школы дизайна', '', 'Это одно крыло Двореца культуры РУТ (МИИТ), на Новосущевском переулке. 6 этажей были отданы нам на растерзание под создание арт-пространства.', '<p>Проект для создания нового арт-пространства \"Арт-кластер \"Дом художника\".</p>\n<p>Авторы: <strong>Anna Golovina и Ola Chumakova</strong>.</p>\n<p>&nbsp;</p>\n<p><em>Это одно крыло Двореца культуры РУТ (МИИТ), на Новосущевском переулке.&nbsp;</em></p>\n<p><em>6 этажей были отданы нам на растерзание под создание арт-пространства.</em></p>\n<p>&nbsp;</p>\n<p><strong>1 этаж.</strong> Бар-галерея с офисом, где можно провести неформальную встречу и приобрести произведения искусства.</p>\n<p>&nbsp;</p>\n<p><strong>2 этаж.</strong> Выставочная галерея. С конструкциями собственного дизайна из перфорированного металла.&nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>3 и 4 этажи.</strong> Отданы под мастерские резидентам Арт-кластера. Мы представили пример одной из них, считая, что каждый - художник, и сможет внести в свое пространство частицу себя и своего вдохновения.</p>\n<p>&nbsp;</p>\n<p><strong>5 и 6 этажи.</strong> Мини театр. Где можно всё, всё что угодно.</p>', 'posts/August2020/9gD8opqUnOY3y5ND1f56.jpg', '[\"posts\\/August2020\\/AxYINWeA1DfipszqSmr6.jpg\",\"posts\\/August2020\\/1luxMVMrvTwbfmcJdZfE.jpg\",\"posts\\/August2020\\/CEHXVtwFldu5SPvQm5qA.jpg\",\"posts\\/August2020\\/NNY9THlokpHWZDrfJxyV.jpg\",\"posts\\/August2020\\/i58eCMEzjep4pGoe2UFm.jpg\",\"posts\\/August2020\\/9XwiQjBLdoMA519Yoyck.jpg\",\"posts\\/August2020\\/wZDsuI31C4d5KKVSKJxm.jpg\",\"posts\\/August2020\\/4aErZ0UhcT9GZoZzbmF1.jpg\",\"posts\\/August2020\\/ti8a6ApAMJlp1p2kYYLJ.jpg\",\"posts\\/August2020\\/iYKW95mVc3EYr9GqZRl6.jpg\",\"posts\\/August2020\\/zFISFRPIcKxv5B5CrmWd.jpg\",\"posts\\/August2020\\/pBVoHrWHvkNeNJ3JR6xa.jpg\",\"posts\\/August2020\\/BjDyGLOJ8LXoS3d1OVcE.jpg\",\"posts\\/August2020\\/QiTpiHoLNjjyMJixYWRE.jpg\",\"posts\\/August2020\\/2MZH72LJ9moqpEQTsWZ7.jpg\",\"posts\\/August2020\\/DcWfXxgW8VaROqLPI86p.jpg\",\"posts\\/August2020\\/ROOIwBRfLhE2W9XfleeG.jpg\",\"posts\\/August2020\\/x8F78Vu6nfPyHDehmqyo.jpg\"]', 'nashe-art-prostranstvo-glazami-vypusknic-britanskoj-vysshej-shkoly-dizajna', '', '', 'BLOG', 'PUBLISHED', 0, '2020-08-18 06:24:57', '2020-08-18 06:28:20'),
(34, '2020-08-12 08:32:00', 'ФОТО-отчёт с выставки, посвящённой истории железнодорожного транспорта', '', 'Фото с открытия выставки, посвящённой истории железнодорожного транспорта, где представлены разделы живописи, графики, плаката.', '<p>Фото с открытия выставки, посвящённой истории железнодорожного транспорта, где представлены разделы живописи, графики, плаката.</p>\n<p><span style=\"color: #545454; font-family: \'Istok Web\', sans-serif; font-size: 18px;\">[carousel entity=\"post\" id=\"34\"]</span></p>', 'posts/August2020/9U1xKSNBl5GYJbjQYTka.jpg', '[\"posts\\/August2020\\/sRsRWFL8GQzCmNSLwsPd.jpg\",\"posts\\/August2020\\/gn0CjAeGqa9ZPZpC0eEs.jpg\",\"posts\\/August2020\\/ddmxtkIUAjNjnzOGopY1.jpg\",\"posts\\/August2020\\/WxymPzb41SuNpT4I4HWY.jpg\",\"posts\\/August2020\\/kFdTNpu6Nury87ggTQ1i.jpg\",\"posts\\/August2020\\/mTtgJFuQe4q8QQbgfGzK.jpg\",\"posts\\/August2020\\/XBzSmw5XJ1zoY32qngrO.jpg\",\"posts\\/August2020\\/KaeSQASsMlQ9EJ5IZigx.jpg\",\"posts\\/August2020\\/WKGB4ErPww1mm0bcoJ8W.jpg\",\"posts\\/August2020\\/Cpf79c8lVpLYXAsBqGXo.jpg\",\"posts\\/August2020\\/lmLJCyxMYV2DnBqiP4Ie.jpg\",\"posts\\/August2020\\/FfBiCvc9fbOOBCQARY8S.jpg\",\"posts\\/August2020\\/uGowcCCWJXjLCmsXFpLv.jpg\",\"posts\\/August2020\\/2nbd7oiQpTPoNvW9koxI.jpg\",\"posts\\/August2020\\/vTkvAwPLXtqFUeJxYyFB.jpg\",\"posts\\/August2020\\/qAZST9setVGRwllETyAy.jpg\",\"posts\\/August2020\\/z1jf5AYVftkKFtWABy57.jpg\"]', 'foto-otchyot-s-vystavki-posvyashyonnoj-istorii-zheleznodorozhnogo-transporta', '', '', 'NEWS', 'PUBLISHED', 0, '2020-08-19 05:36:57', '2020-09-29 02:27:01');

-- --------------------------------------------------------

--
-- Структура таблицы `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `post_tag`
--

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(3, 1),
(3, 3),
(3, 4),
(34, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `professions`
--

CREATE TABLE `professions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `professions`
--

INSERT INTO `professions` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'ыыукпеивапмфывапмы', '2020-06-12 07:28:40', '2020-06-12 07:28:40'),
(2, 'ыываываываываыва', '2020-06-12 07:30:36', '2020-06-12 07:30:36'),
(3, 'фацуыавфывафы', '2020-06-12 07:30:51', '2020-06-12 07:30:51'),
(4, 'ыыфвафывафываф', '2020-06-12 07:31:04', '2020-06-12 07:31:04'),
(5, 'dfsfgasdfrsdfa', '2020-06-12 07:31:46', '2020-06-12 07:31:46'),
(6, 'sdfgdfg', '2020-06-15 05:33:00', '2020-06-15 05:33:00'),
(7, 'sdfvsdfv', '2020-06-15 09:52:19', '2020-06-15 09:52:19'),
(8, 'Художник-реставратор', '2020-06-15 10:00:10', '2020-06-15 10:00:10'),
(9, 'Искусствовед', '2020-06-15 10:00:19', '2020-06-15 10:00:19'),
(10, 'Живописец', '2020-06-15 10:00:28', '2020-06-15 10:00:28'),
(11, 'График', '2020-06-15 10:00:33', '2020-06-15 10:00:33'),
(12, 'Куратор выставочных проектов', '2020-06-15 10:00:49', '2020-06-15 10:00:49'),
(13, 'Конструктор-технолог радиоэлектронной аппаратуры', '2020-06-15 12:26:11', '2020-06-15 12:26:11'),
(14, 'Скульптор', '2020-06-15 13:10:06', '2020-06-15 13:10:06'),
(15, 'Дизайнер-график', '2020-06-16 11:29:08', '2020-06-16 11:29:08'),
(16, 'Фотограф', '2020-06-17 07:29:03', '2020-06-17 07:29:03'),
(17, 'Режиссер видео', '2020-06-17 07:29:12', '2020-06-17 07:29:12'),
(18, 'Скульптор', '2020-06-17 07:32:26', '2020-06-17 07:32:26'),
(19, 'Живописец', '2020-06-17 07:39:53', '2020-06-17 07:39:53'),
(20, 'Монументальная живопись', '2020-06-17 07:44:26', '2020-06-17 07:44:26'),
(21, 'CGI', '2020-06-17 08:11:24', '2020-06-17 08:11:24'),
(22, 'Фотограф', '2020-06-17 08:11:39', '2020-06-17 08:11:39'),
(23, 'Графический дизайнер', '2020-06-17 08:11:50', '2020-06-17 08:11:50'),
(24, 'CGI', '2020-06-17 08:15:08', '2020-06-17 08:15:08'),
(25, 'Фотограф', '2020-06-17 08:15:18', '2020-06-17 08:15:18'),
(26, 'Графика', '2020-06-17 08:18:15', '2020-06-17 08:18:15'),
(27, 'Дизайн', '2020-06-17 08:18:19', '2020-06-17 08:18:19'),
(28, 'Живописец', '2020-06-17 08:23:30', '2020-06-17 08:23:30'),
(29, 'Перформер', '2020-06-17 08:26:38', '2020-06-17 08:26:38'),
(30, 'Художник', '2020-06-17 08:26:46', '2020-06-17 08:26:46'),
(31, 'Гримёр', '2020-06-17 08:27:01', '2020-06-17 08:27:01'),
(32, 'Искусствоведение', '2020-06-17 08:40:44', '2020-06-17 08:40:44'),
(33, 'Инженер-технолог полиграфического производства', '2020-06-17 08:51:52', '2020-06-17 08:51:52'),
(34, 'Коллажист', '2020-06-17 09:16:22', '2020-06-17 09:16:22'),
(35, 'Стрит-арт', '2020-06-17 09:18:43', '2020-06-17 09:18:43'),
(36, 'Художник-график', '2020-06-23 09:05:11', '2020-06-23 09:05:11'),
(37, 'Инженер радиосвязи, радиовещания и ТВ', '2020-06-30 10:01:22', '2020-06-30 10:01:22');

-- --------------------------------------------------------

--
-- Структура таблицы `profession_user`
--

CREATE TABLE `profession_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `profession_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `profession_user`
--

INSERT INTO `profession_user` (`user_id`, `profession_id`) VALUES
(10, 8),
(10, 9),
(10, 10),
(10, 11),
(10, 12),
(9, 8),
(9, 11),
(14, 13),
(17, 14),
(27, 15),
(33, 10),
(38, 10),
(43, 16),
(43, 17),
(44, 18),
(46, 19),
(46, 11),
(46, 14),
(47, 20),
(48, 24),
(48, 25),
(48, 23),
(49, 26),
(49, 27),
(50, 16),
(51, 28),
(51, 11),
(51, 16),
(52, 29),
(52, 30),
(52, 31),
(53, 10),
(53, 11),
(53, 14),
(53, 16),
(54, 10),
(54, 14),
(55, 32),
(56, 10),
(56, 11),
(56, 14),
(57, 33),
(60, 34),
(61, 10),
(61, 11),
(61, 35),
(62, 10),
(63, 10),
(63, 11),
(63, 14),
(65, 37),
(65, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Администратор', '2020-05-21 04:06:59', '2020-05-21 04:06:59'),
(2, 'user', 'Покупатель', '2020-05-21 04:06:59', '2020-06-11 10:44:40'),
(3, 'author', 'Автор', '2020-06-11 10:45:01', '2020-06-11 10:45:01'),
(4, 'observer', 'Наблюдатель', '2020-06-11 10:45:19', '2020-06-11 10:45:19');

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('xuAr19ZRYr8NECQRpIlFAi21ZGmhw9FX9DHEfZ7Y', 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYUtjNkNWZlZSSFNnQVYyeEsyYlpXSHF2S09jckwyenBiYm5LZW5vQyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjEzOiJwYXNzd29yZF9oYXNoIjtzOjYwOiIkMnkkMTAkMFRNWERrRHYzVHo5RzhhdDNkaldMLlo4NHMxZDZmMFMwS1BQM0d5MUE2cm9GTzY1YWI0UlMiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vYWN0LWFydC5sb2MvYWRtaW4vYXVjdGlvbnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1596454987);

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Название Сайта', 'act-art.ru', '', 'text', 1, 'Site'),
(2, 'site.description', 'Описание Сайта', 'Описание Сайта', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Логотип Сайта', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Фоновое Изображение для Админки', 'settings/June2020/DyM2oViGJVjKjUDlJCgV.jpeg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Название Админки', 'Act-Art', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Описание Админки', NULL, '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Загрузчик Админки', 'settings/July2020/GbShnIAdtEoedGRiITzF.gif', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Иконка Админки', 'settings/July2020/0gRK5Gqur2ooR04kPM2K.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (используется для панели администратора)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `spaces`
--

CREATE TABLE `spaces` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('workshop','exhibition') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'workshop',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoom` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `spaces`
--

INSERT INTO `spaces` (`id`, `type`, `title`, `address`, `coords`, `zoom`, `created_at`, `updated_at`) VALUES
(1, 'exhibition', 'Дом художника РУТ (МИИТ)', 'Новосущевский пер., д. 6 стр. 1', '37.605858061791 55.789988573744', 12, '2020-07-26 12:25:00', '2020-09-25 10:55:36'),
(2, 'exhibition', 'Галерея ВСЕКОХУДОЖНИК', 'Фрунзенская набережная, 10', '37.594541921613 55.732771155329', 12, '2020-07-26 23:34:00', '2020-09-25 10:55:08'),
(3, 'workshop', 'Арт-кластер на Покровке', 'ул. Покровка, д. 1/13/6 стр.2', '37.639016970394 55.758563954309', 12, '2020-07-26 23:46:00', '2020-09-28 09:40:21'),
(4, 'exhibition', 'Акт-Арт Солянка ', 'Россия, Москва, улица Петровка, 2', '37.619486465454 55.76058075451', 12, '2020-07-26 23:46:51', '2020-07-26 23:46:51'),
(5, 'exhibition', 'Акт-Арт Пречистенка', 'Россия, Москва, Новая площадь, 10', '37.64 55.76', 12, '2020-07-26 23:47:00', '2020-08-03 10:28:48');

-- --------------------------------------------------------

--
-- Структура таблицы `studies`
--

CREATE TABLE `studies` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `studies`
--

INSERT INTO `studies` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'ывнаопьвкыверпфапм', '2020-06-12 06:56:12', '2020-06-12 06:56:12'),
(2, 'ыверптавпывап', '2020-06-12 06:56:16', '2020-06-12 06:56:16'),
(3, 'asdasd', '2020-06-15 05:32:55', '2020-06-15 05:32:55'),
(4, 'wasdfcvsf', '2020-06-15 09:52:13', '2020-06-15 09:52:13'),
(5, '1976-1980 Московское Академическое художественное училище памяти 1905 года', '2020-06-15 09:59:02', '2020-06-15 09:59:02'),
(6, '1987-1993 Институт живописи, скульптуры и архитектуры им. И.Е. Репина Академии Художеств РФ, Санкт-Петербург', '2020-06-15 09:59:49', '2020-06-15 09:59:49'),
(7, 'Учился в студии художника Ю.Л.Ланглебена с 1978 по 1981 год.', '2020-06-15 10:13:48', '2020-06-15 10:13:48'),
(8, 'В 1985 году окончил Московское Художественное училище памяти 1905 года.', '2020-06-15 10:14:06', '2020-06-15 10:14:06'),
(9, '1979-1981 Училась в Московской художественной школе №5', '2020-06-15 10:25:09', '2020-06-15 10:25:09'),
(10, '1983 -1987 Училась в Московском художественном училище памяти 1905 года', '2020-06-15 10:25:21', '2020-06-15 10:25:21'),
(11, 'В 1982 окончил Московское художественное училище памяти 1905 года', '2020-06-15 10:46:29', '2020-06-15 10:46:29'),
(12, 'Московская государственная художественно-промышленная академия имени С. Г. Строганова (МГХПА им. Строганова)', '2020-06-15 11:12:50', '2020-06-15 11:12:50'),
(13, '1993 г. окончила МКХР (Московский художественный колледж)', '2020-06-15 11:51:35', '2020-06-15 11:51:35'),
(14, '1993 - 1994г. Училась в ИСИ (Моск. Институт Современного Искусства)', '2020-06-15 11:51:45', '2020-06-15 11:51:45'),
(15, '1993 - МКХР (Московский художественный колледж)', '2020-06-15 11:52:23', '2020-06-15 11:52:23'),
(16, '1993 – 1994 г. Училась в ИСИ (Моск. Институт Современного Искусства).', '2020-06-15 11:52:29', '2020-06-15 11:52:29'),
(17, '1993 – 1994 г. Училась в ИСИ (Моск. Институт Современного Искусства)', '2020-06-15 11:52:46', '2020-06-15 11:52:46'),
(18, '1999 г. - МГУП («полиграф»)', '2020-06-15 11:52:55', '2020-06-15 11:52:55'),
(19, 'Уфимская академия искусств им. З. Исмагилова', '2020-06-15 12:14:02', '2020-06-15 12:14:02'),
(20, 'Московская консерватория им П.И. Чайковского', '2020-06-15 12:14:20', '2020-06-15 12:14:20'),
(21, '1973 г. окончил ЛЭИС им. профессора Бонч-Бруевича', '2020-06-15 12:24:15', '2020-06-15 12:24:15'),
(22, 'Московский государственный академический институт искусств им. В.И. Сурикова', '2020-06-15 12:45:27', '2020-06-15 12:45:27'),
(23, 'Московский Государственный Академический Художественный Институт Им. В.И. Сурикова', '2020-06-15 13:07:37', '2020-06-15 13:07:37'),
(24, 'Московская средняя художественная школа при Московском государственном художественном институте им. В.И.Сурикова.', '2020-06-15 13:22:13', '2020-06-15 13:22:13'),
(25, 'Московский Государственный художественный институт им. В.И.Сурикова.', '2020-06-15 13:22:23', '2020-06-15 13:22:23'),
(26, 'Институт имени И.Е. Репина', '2020-06-15 13:33:54', '2020-06-15 13:33:54'),
(27, '1976 -1981 -  Ереванский государственный художественно-театральный институт', '2020-06-16 06:29:29', '2020-06-16 06:29:29'),
(28, 'Краснодарское художественное училище', '2020-06-16 06:49:17', '2020-06-16 06:49:17'),
(29, 'Московский Государственный Академический Художественный Институт им. В.И. Сурикова', '2020-06-16 06:49:30', '2020-06-16 06:49:30'),
(30, '1960-1962 - учеба в Художественном училище им. В.И. Сурикова в г. Красноярске', '2020-06-16 08:10:31', '2020-06-16 08:10:31'),
(31, '1962-1965 - учеба в Художественном училище в Нижнем Новогороде', '2020-06-16 08:11:00', '2020-06-16 08:11:00'),
(32, '1969-1971 - учеба в Высшем художественно-промышленном училище (б. Строгановское)', '2020-06-16 08:12:40', '2020-06-16 08:12:40'),
(33, 'Московское высшее художественно-промышленное училище (б.Строгановское)', '2020-06-16 08:39:04', '2020-06-16 08:39:04'),
(34, 'Детская школа эстетического воспитания Государственного Музея Изобразительных Искусств им А.С.Пушкина', '2020-06-16 08:43:48', '2020-06-16 08:43:48'),
(35, 'Художественная студия В.И.Козлова', '2020-06-16 08:43:57', '2020-06-16 08:43:57'),
(36, 'Московское Государственное Художественно-Промышленное Училище им. Г.С.Строганова', '2020-06-16 08:44:04', '2020-06-16 08:44:04'),
(37, 'Детская школа эстетического воспитания Государственного Музея Изобразительных Искусств им А.С.Пушкина', '2020-06-16 08:48:38', '2020-06-16 08:48:38'),
(38, 'Московское Государственное Художественно-Промышленное Училище им. Г.С.Строганова', '2020-06-16 08:55:50', '2020-06-16 08:55:50'),
(39, 'Частная академия Шимона Холлоши', '2020-06-16 09:35:18', '2020-06-16 09:35:18'),
(40, '2005-2008 / Издательско-полиграфический колледж им. И. Федорова.', '2020-06-16 11:29:23', '2020-06-16 11:29:23'),
(41, '2008-2012 / Московский Государственный Гуманитарный Университет им. М.А. Шолохова', '2020-06-16 11:29:36', '2020-06-16 11:29:36'),
(42, '2013 / Школа интерактивных коммуникаций IKRA. Квалификация Digital арт-директор', '2020-06-16 11:29:45', '2020-06-16 11:29:45'),
(43, '2014 / Школа интерактивных коммуникаций IKRA. Квалификация Digital-продюсер', '2020-06-16 11:29:59', '2020-06-16 11:29:59'),
(44, 'Средняя художественная школа (МСХШ)', '2020-06-16 11:32:45', '2020-06-16 11:32:45'),
(45, 'Государственный художественный институт имени В.И. Сурикова', '2020-06-16 11:32:55', '2020-06-16 11:32:55'),
(46, '1971 - Крымское художественное училище им Самокиша.', '2020-06-16 11:42:09', '2020-06-16 11:42:09'),
(47, '!971-1977  ВГИК', '2020-06-16 11:42:34', '2020-06-16 11:42:34'),
(48, '1993 - 1999 г.г. - Московский Художественно-Промышленный Университет им.С.Г.Строганова.', '2020-06-16 11:51:41', '2020-06-16 11:51:41'),
(49, 'Саратовское художественное училище', '2020-06-17 05:11:47', '2020-06-17 05:11:47'),
(50, 'Текстильный институт (факультет прикладного искусства)', '2020-06-17 05:19:28', '2020-06-17 05:19:28'),
(51, 'Московское Художественное училище памяти 1905 года', '2020-06-17 05:25:59', '2020-06-17 05:25:59'),
(52, 'Московскоое Государственное Академическое училище памяти 1905 года', '2020-06-17 05:49:17', '2020-06-17 05:49:17'),
(53, 'Московский Государственный Академический Художественный институт имени В.И.Сурикова', '2020-06-17 05:49:24', '2020-06-17 05:49:24'),
(54, 'Школа искусств им.Рихтера', '2020-06-17 06:05:55', '2020-06-17 06:05:55'),
(55, 'Московское художественное училище памяти 1905 года', '2020-06-17 06:06:24', '2020-06-17 06:06:24'),
(56, 'МГАХИ им. В.И.Сурикова', '2020-06-17 06:06:32', '2020-06-17 06:06:32'),
(57, '1994-1995 - Лицей искусств Московского академического художественного училища «Памяти 1905-го года»', '2020-06-17 06:35:16', '2020-06-17 06:35:16'),
(58, '1995-1999 - Московское академическое художественное училище «Памяти 1905-го года», факультет живописи', '2020-06-17 06:35:24', '2020-06-17 06:35:24'),
(59, '1995-1999 - Московское академическое художественное училище «Памяти 1905-го года»', '2020-06-17 06:35:39', '2020-06-17 06:35:39'),
(60, '1999-2007 - Московский государственный академический художественный институт имени В.И. Сурикова', '2020-06-17 06:35:48', '2020-06-17 06:35:48'),
(61, 'МГАХИ им. В. И. Сурикова', '2020-06-17 07:00:45', '2020-06-17 07:00:45'),
(62, 'С 2014 по 2016 гг. проходил обучение с изучением техник видео, фотографии, скульптуры и истории современного искусства в École des arts visuels et médiatiques, Университета Квебека в Монреале (UQAM)', '2020-06-17 07:01:02', '2020-06-17 07:01:02'),
(63, 'МГАХИ им. В. И. Сурикова', '2020-06-17 07:03:58', '2020-06-17 07:03:58'),
(64, '2010 - 2014  обучалась литографии, шелкографии, живописи, рисунку и фотографии École des arts visuels et médiatiques Университета Квебека в Монреале, Канада', '2020-06-17 07:04:09', '2020-06-17 07:04:09'),
(65, 'Московский Государственный Педагогический институт им. В.И. Ленина', '2020-06-17 07:08:40', '2020-06-17 07:08:40'),
(66, '1951-1954 – окончил художественно-ремесленное училище по альфрейной живописи', '2020-06-17 07:17:56', '2020-06-17 07:17:56'),
(67, '1951-1961 – учился в Училище памяти 1905 года', '2020-06-17 07:19:13', '2020-06-17 07:19:13'),
(68, 'Британская Высшая Школа Дизайна; Институт Проблем Современного Искусства', '2020-06-17 07:26:19', '2020-06-17 07:26:19'),
(69, 'Британская Высшая Школа Дизайна', '2020-06-17 07:26:36', '2020-06-17 07:26:36'),
(70, 'Институт Проблем Современного Искусства', '2020-06-17 07:26:44', '2020-06-17 07:26:44'),
(71, 'Московская школа нового кино', '2020-06-17 07:26:50', '2020-06-17 07:26:50'),
(72, '2000-2006 Московский Институт Электронной Техники', '2020-06-17 07:31:18', '2020-06-17 07:31:18'),
(73, '2017-2018 \"Свободные Мастерские\" при ММОМА', '2020-06-17 07:31:33', '2020-06-17 07:31:33'),
(74, '2018-2020 ИСИ им. Бахштейна (Институт Проблем Современного Исскусства)', '2020-06-17 07:31:49', '2020-06-17 07:31:49'),
(75, '2016 и 2018 Burg Universität Halle - симпозиумы', '2020-06-17 07:32:05', '2020-06-17 07:32:05'),
(76, '2013 Симпозиум Байкал Керамистика', '2020-06-17 07:32:17', '2020-06-17 07:32:17'),
(77, '2005-2011 РГГРУ', '2020-06-17 07:35:15', '2020-06-17 07:35:15'),
(78, '2011-2017, ВГИК', '2020-06-17 07:39:34', '2020-06-17 07:39:34'),
(79, '2005-2011, МИЭМ НИУ ВШЭ', '2020-06-17 07:44:17', '2020-06-17 07:44:17'),
(80, '2012-2018, МГУТУ им. К.Г. Разумовского', '2020-06-17 08:11:05', '2020-06-17 08:11:05'),
(81, '2012-2018, МГУТУ им. К.Г. Разумовского', '2020-06-17 08:14:58', '2020-06-17 08:14:58'),
(82, '2015-2019, МАХУ памяти 1905 года', '2020-06-17 08:23:19', '2020-06-17 08:23:19'),
(83, '2014-2015 МШНК', '2020-06-17 08:25:56', '2020-06-17 08:25:56'),
(84, '2017-2020  1-й МОК', '2020-06-17 08:26:08', '2020-06-17 08:26:08'),
(85, '2009-2015, МГГУ им. М.А. Шолохова', '2020-06-17 08:29:04', '2020-06-17 08:29:04'),
(86, '2005-2010, МИИТ', '2020-06-17 08:35:49', '2020-06-17 08:35:49'),
(87, '2017-2019, ИПСИ', '2020-06-17 08:35:57', '2020-06-17 08:35:57'),
(88, '2018, РГГУ-ХПМТ', '2020-06-17 08:36:05', '2020-06-17 08:36:05'),
(89, '2007-2009, СПБГИК', '2020-06-17 08:40:30', '2020-06-17 08:40:30'),
(90, '1999-2004, ДШИ N1, г. Сухой лог', '2020-06-17 08:42:57', '2020-06-17 08:42:57'),
(91, '2006-2012, УрГАХА г. Екатеринбург', '2020-06-17 08:43:07', '2020-06-17 08:43:07'),
(92, '2006-2012, М. А. Мамедов, рисунок', '2020-06-17 08:43:24', '2020-06-17 08:43:24'),
(93, '2006-2012, В. Ю. Косьянковская, живопись', '2020-06-17 08:43:32', '2020-06-17 08:43:32'),
(94, '2006-2010, С. В. Прохоренко, скульптура', '2020-06-17 08:43:39', '2020-06-17 08:43:39'),
(95, '2010-2014, КИИПТ', '2020-06-17 08:51:38', '2020-06-17 08:51:38'),
(96, '2010-2014 РЭУ', '2020-06-17 08:56:29', '2020-06-17 08:56:29'),
(97, '2019-2020 ММСИ', '2020-06-17 08:56:38', '2020-06-17 08:56:38'),
(98, 'Гуманитарный институт телевидения и радиовещания', '2020-06-17 09:14:14', '2020-06-17 09:14:14'),
(99, '2005-2011 Университет Печати', '2020-06-17 09:16:05', '2020-06-17 09:16:05'),
(100, '2012-2013 ИПСИ', '2020-06-17 09:16:12', '2020-06-17 09:16:12'),
(101, '2005-2011, МИЭМ', '2020-06-17 09:18:15', '2020-06-17 09:18:15'),
(102, '2013 - Проект \"Русский Авангард\", Москва', '2020-06-17 09:20:04', '2020-06-17 09:20:04'),
(103, '2000-2006 МГУГиК', '2020-06-17 09:30:31', '2020-06-17 09:30:31'),
(104, '2010-2011 ИПСИ', '2020-06-17 09:30:37', '2020-06-17 09:30:37'),
(105, 'Московский полиграфический институт', '2020-06-23 09:04:51', '2020-06-23 09:04:51'),
(106, '1986 г.- окончил художественную школу им. А.Ф.Фойницкого', '2020-06-30 10:00:20', '2020-06-30 10:00:20'),
(107, '1994 г. - окончил Академию Связи', '2020-06-30 10:00:39', '2020-06-30 10:00:39'),
(108, '1999 г. - окончил художественное училище им. МБ. Грекова', '2020-06-30 10:00:48', '2020-06-30 10:00:48'),
(109, '2006 г. - окончил МГХАИ им. В.И. Сурикова', '2020-06-30 10:00:56', '2020-06-30 10:00:56'),
(110, '2006-2011 - обучение в аспирантуре МГХАИ им. В.И.Сурикова', '2020-06-30 10:02:00', '2020-06-30 10:02:00');

-- --------------------------------------------------------

--
-- Структура таблицы `study_user`
--

CREATE TABLE `study_user` (
  `user_id` bigint UNSIGNED NOT NULL,
  `study_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `study_user`
--

INSERT INTO `study_user` (`user_id`, `study_id`) VALUES
(10, 5),
(10, 6),
(7, 7),
(7, 8),
(8, 9),
(8, 10),
(9, 11),
(11, 12),
(12, 15),
(12, 17),
(12, 18),
(13, 19),
(13, 20),
(14, 21),
(16, 22),
(17, 23),
(18, 24),
(18, 25),
(19, 26),
(20, 27),
(21, 28),
(21, 29),
(22, 30),
(22, 31),
(22, 32),
(23, 33),
(25, 34),
(25, 35),
(25, 38),
(26, 39),
(27, 40),
(27, 41),
(27, 42),
(27, 43),
(28, 44),
(28, 45),
(29, 46),
(29, 47),
(30, 48),
(31, 49),
(32, 50),
(33, 51),
(35, 52),
(35, 53),
(36, 54),
(36, 55),
(36, 56),
(38, 57),
(38, 59),
(38, 60),
(39, 61),
(39, 62),
(40, 63),
(40, 64),
(41, 65),
(42, 66),
(42, 67),
(43, 69),
(43, 70),
(43, 71),
(44, 72),
(44, 73),
(44, 74),
(44, 75),
(44, 76),
(45, 77),
(46, 78),
(47, 79),
(48, 81),
(51, 82),
(52, 83),
(52, 84),
(53, 85),
(54, 86),
(54, 87),
(54, 88),
(55, 89),
(56, 90),
(56, 91),
(56, 92),
(56, 93),
(56, 94),
(57, 95),
(58, 96),
(58, 97),
(59, 98),
(60, 99),
(60, 100),
(61, 101),
(63, 103),
(63, 104),
(64, 105),
(65, 106),
(65, 107),
(65, 108),
(65, 109),
(65, 110);

-- --------------------------------------------------------

--
-- Структура таблицы `styles`
--

CREATE TABLE `styles` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `styles`
--

INSERT INTO `styles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(2, 'Темпера', '2020-06-18 05:26:48', '2020-06-18 05:26:48'),
(3, 'Акрил', '2020-07-03 08:42:10', '2020-07-03 08:42:10');

-- --------------------------------------------------------

--
-- Структура таблицы `style_lot`
--

CREATE TABLE `style_lot` (
  `lot_id` bigint UNSIGNED NOT NULL,
  `style_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `style_lot`
--

INSERT INTO `style_lot` (`lot_id`, `style_id`) VALUES
(37, 3),
(28, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'zdvsdv', '2020-07-09 11:52:59', '2020-07-09 11:52:59'),
(2, 'zcvsvf', '2020-07-09 11:53:00', '2020-07-09 11:53:00'),
(3, 'dfvdfvdfv', '2020-07-09 11:53:02', '2020-07-09 11:53:02'),
(4, 'zcczczcz', '2020-07-09 11:53:10', '2020-07-09 11:53:10'),
(5, 'фото', '2020-08-19 05:34:24', '2020-08-19 05:34:24');

-- --------------------------------------------------------

--
-- Структура таблицы `techniques`
--

CREATE TABLE `techniques` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `techniques`
--

INSERT INTO `techniques` (`id`, `title`, `created_at`, `updated_at`) VALUES
(3, 'Смешанная техника', '2020-07-03 09:44:18', '2020-07-03 09:44:18'),
(4, 'Темпера', '2020-07-03 10:21:13', '2020-07-03 10:21:13');

-- --------------------------------------------------------

--
-- Структура таблицы `technique_lot`
--

CREATE TABLE `technique_lot` (
  `lot_id` bigint UNSIGNED NOT NULL,
  `technique_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `technique_lot`
--

INSERT INTO `technique_lot` (`lot_id`, `technique_id`) VALUES
(22, 3),
(23, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(35, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(36, 4),
(37, 4),
(38, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(22, 'menu_items', 'title', 13, 'pt', 'Publicações', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(24, 'menu_items', 'title', 12, 'pt', 'Categorias', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(25, 'menu_items', 'title', 14, 'pt', 'Páginas', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-05-21 04:07:11', '2020-05-21 04:07:11'),
(32, 'menu_items', 'title', 4, 'en', 'Roles', '2020-06-09 09:12:10', '2020-06-09 09:12:10'),
(33, 'menu_items', 'title', 3, 'en', 'Users', '2020-06-09 09:12:22', '2020-06-09 09:12:22'),
(34, 'menu_items', 'title', 15, 'en', 'How to buy', '2020-06-09 09:14:44', '2020-06-09 09:14:44'),
(35, 'data_rows', 'display_name', 1, 'en', 'ID', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(36, 'data_rows', 'display_name', 21, 'en', 'Роль', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(37, 'data_rows', 'display_name', 2, 'en', 'Имя', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(38, 'data_rows', 'display_name', 3, 'en', 'Email', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(39, 'data_rows', 'display_name', 8, 'en', 'Аватар', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(40, 'data_rows', 'display_name', 4, 'en', 'Пароль', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(41, 'data_rows', 'display_name', 5, 'en', 'Токен восстановления', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(42, 'data_rows', 'display_name', 11, 'en', 'Settings', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(43, 'data_rows', 'display_name', 6, 'en', 'Дата создания', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(44, 'data_rows', 'display_name', 7, 'en', 'Дата обновления', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(45, 'data_rows', 'display_name', 9, 'en', 'Роль', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(46, 'data_rows', 'display_name', 10, 'en', 'Roles', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(47, 'data_types', 'display_name_singular', 1, 'en', 'Пользователь', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(48, 'data_types', 'display_name_plural', 1, 'en', 'Пользователи', '2020-06-09 10:29:49', '2020-06-09 10:29:49'),
(49, 'data_rows', 'display_name', 89, 'en', 'Id', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(50, 'data_rows', 'display_name', 90, 'en', 'Title', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(51, 'data_rows', 'display_name', 91, 'en', 'Status', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(52, 'data_rows', 'display_name', 92, 'en', 'Photo', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(53, 'data_rows', 'display_name', 93, 'en', 'Price', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(54, 'data_rows', 'display_name', 94, 'en', 'Price Up', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(55, 'data_rows', 'display_name', 95, 'en', 'Price Fin', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(56, 'data_rows', 'display_name', 96, 'en', 'Price Step', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(57, 'data_rows', 'display_name', 97, 'en', 'Price Blic', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(58, 'data_rows', 'display_name', 98, 'en', 'Year', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(59, 'data_rows', 'display_name', 99, 'en', 'Auction Number', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(60, 'data_rows', 'display_name', 100, 'en', 'Tech', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(61, 'data_rows', 'display_name', 101, 'en', 'Matherial', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(62, 'data_rows', 'display_name', 102, 'en', 'Size', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(63, 'data_rows', 'display_name', 103, 'en', 'Border', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(64, 'data_rows', 'display_name', 104, 'en', 'Category', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(65, 'data_rows', 'display_name', 105, 'en', 'Style', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(66, 'data_rows', 'display_name', 106, 'en', 'Text', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(67, 'data_rows', 'display_name', 107, 'en', 'Auction Id', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(68, 'data_rows', 'display_name', 108, 'en', 'User Id', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(69, 'data_rows', 'display_name', 109, 'en', 'Created At', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(70, 'data_rows', 'display_name', 110, 'en', 'Updated At', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(71, 'data_rows', 'display_name', 111, 'en', 'auctions', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(72, 'data_rows', 'display_name', 112, 'en', 'lot_images', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(73, 'data_types', 'display_name_singular', 13, 'en', 'Lot', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(74, 'data_types', 'display_name_plural', 13, 'en', 'Lots', '2020-06-09 10:38:32', '2020-06-09 10:38:32'),
(75, 'menu_items', 'title', 17, 'en', 'Lots', '2020-06-11 04:16:14', '2020-06-11 04:16:14'),
(76, 'menu_items', 'title', 16, 'en', 'Auctions', '2020-06-11 04:16:29', '2020-06-11 04:16:29'),
(77, 'menu_items', 'title', 18, 'en', 'Frames', '2020-06-11 04:17:11', '2020-06-11 04:17:11'),
(78, 'menu_items', 'title', 19, 'en', 'Materials', '2020-06-11 04:17:19', '2020-06-11 04:17:19'),
(79, 'menu_items', 'title', 20, 'en', 'Styles', '2020-06-11 04:17:26', '2020-06-11 04:17:26'),
(80, 'menu_items', 'title', 21, 'en', 'Techniques', '2020-06-11 04:17:34', '2020-06-11 04:17:34'),
(81, 'menu_items', 'title', 5, 'en', 'Инструменты', '2020-06-11 04:21:39', '2020-06-11 04:21:39'),
(82, 'data_rows', 'display_name', 56, 'en', 'Email Verified At', '2020-06-11 04:33:11', '2020-06-11 04:33:11'),
(83, 'data_rows', 'display_name', 57, 'en', 'Firstname', '2020-06-11 04:33:11', '2020-06-11 04:33:11'),
(84, 'data_rows', 'display_name', 58, 'en', 'Secondname', '2020-06-11 04:33:11', '2020-06-11 04:33:11'),
(85, 'data_rows', 'display_name', 59, 'en', 'Surname', '2020-06-11 04:33:11', '2020-06-11 04:33:11'),
(86, 'data_rows', 'display_name', 60, 'en', 'Year', '2020-06-11 04:33:11', '2020-06-11 04:33:11'),
(87, 'data_rows', 'display_name', 61, 'en', 'Text', '2020-06-11 04:33:11', '2020-06-11 04:33:11'),
(88, 'data_rows', 'display_name', 62, 'en', 'Fb', '2020-06-11 04:33:11', '2020-06-11 04:33:11'),
(89, 'data_rows', 'display_name', 63, 'en', 'Inst', '2020-06-11 04:33:11', '2020-06-11 04:33:11'),
(90, 'data_rows', 'display_name', 129, 'en', 'Exhibits', '2020-06-11 04:35:59', '2020-06-11 04:35:59'),
(91, 'data_rows', 'display_name', 130, 'en', 'Studies', '2020-06-11 04:35:59', '2020-06-11 04:35:59'),
(92, 'data_rows', 'display_name', 131, 'en', 'Professions', '2020-06-11 04:35:59', '2020-06-11 04:35:59'),
(93, 'data_rows', 'display_name', 132, 'en', 'Groups', '2020-06-11 04:35:59', '2020-06-11 04:35:59'),
(94, 'data_rows', 'display_name', 133, 'en', 'Отчество', '2020-06-11 04:52:37', '2020-06-11 04:52:37'),
(95, 'data_rows', 'display_name', 64, 'en', 'Id', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(96, 'data_rows', 'display_name', 65, 'en', 'Title', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(97, 'data_rows', 'display_name', 66, 'en', 'Sublime', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(98, 'data_rows', 'display_name', 67, 'en', 'Text', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(99, 'data_rows', 'display_name', 68, 'en', 'Attr', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(100, 'data_rows', 'display_name', 69, 'en', 'Date', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(101, 'data_rows', 'display_name', 70, 'en', 'Created At', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(102, 'data_rows', 'display_name', 71, 'en', 'Updated At', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(103, 'data_types', 'display_name_singular', 11, 'en', 'Auction', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(104, 'data_types', 'display_name_plural', 11, 'en', 'Auctions', '2020-06-11 05:01:10', '2020-06-11 05:01:10'),
(105, 'data_rows', 'display_name', 134, 'en', 'Блиц цена', '2020-06-11 05:19:58', '2020-06-11 05:19:58'),
(106, 'data_rows', 'display_name', 135, 'en', 'Ширина, см', '2020-06-11 05:23:35', '2020-06-11 05:23:35'),
(107, 'data_rows', 'display_name', 136, 'en', 'Высота, см', '2020-06-11 05:23:35', '2020-06-11 05:23:35'),
(108, 'data_rows', 'display_name', 137, 'en', 'users', '2020-06-11 05:23:35', '2020-06-11 05:23:35'),
(109, 'data_rows', 'display_name', 138, 'en', 'В галерее до', '2020-06-11 05:39:37', '2020-06-11 05:39:37'),
(110, 'data_rows', 'display_name', 125, 'en', 'Id', '2020-06-11 06:47:39', '2020-06-11 06:47:39'),
(111, 'data_rows', 'display_name', 126, 'en', 'Наименование', '2020-06-11 06:47:39', '2020-06-11 06:47:39'),
(112, 'data_rows', 'display_name', 127, 'en', 'Created At', '2020-06-11 06:47:39', '2020-06-11 06:47:39'),
(113, 'data_rows', 'display_name', 128, 'en', 'Updated At', '2020-06-11 06:47:39', '2020-06-11 06:47:39'),
(114, 'data_types', 'display_name_singular', 17, 'en', 'Техника', '2020-06-11 06:47:39', '2020-06-11 06:47:39'),
(115, 'data_types', 'display_name_plural', 17, 'en', 'Techniques', '2020-06-11 06:47:39', '2020-06-11 06:47:39'),
(116, 'data_rows', 'display_name', 121, 'en', 'Id', '2020-06-11 06:47:51', '2020-06-11 06:47:51'),
(117, 'data_rows', 'display_name', 122, 'en', 'Наименование', '2020-06-11 06:47:51', '2020-06-11 06:47:51'),
(118, 'data_rows', 'display_name', 123, 'en', 'Created At', '2020-06-11 06:47:51', '2020-06-11 06:47:51'),
(119, 'data_rows', 'display_name', 124, 'en', 'Updated At', '2020-06-11 06:47:51', '2020-06-11 06:47:51'),
(120, 'data_types', 'display_name_singular', 16, 'en', 'Стиль', '2020-06-11 06:47:51', '2020-06-11 06:47:51'),
(121, 'data_types', 'display_name_plural', 16, 'en', 'Styles', '2020-06-11 06:47:51', '2020-06-11 06:47:51'),
(122, 'data_rows', 'display_name', 117, 'en', 'Id', '2020-06-11 06:48:07', '2020-06-11 06:48:07'),
(123, 'data_rows', 'display_name', 118, 'en', 'Наименование', '2020-06-11 06:48:07', '2020-06-11 06:48:07'),
(124, 'data_rows', 'display_name', 119, 'en', 'Created At', '2020-06-11 06:48:07', '2020-06-11 06:48:07'),
(125, 'data_rows', 'display_name', 120, 'en', 'Updated At', '2020-06-11 06:48:07', '2020-06-11 06:48:07'),
(126, 'data_types', 'display_name_singular', 15, 'en', 'Материал', '2020-06-11 06:48:07', '2020-06-11 06:48:07'),
(127, 'data_types', 'display_name_plural', 15, 'en', 'Materials', '2020-06-11 06:48:07', '2020-06-11 06:48:07'),
(128, 'data_rows', 'display_name', 113, 'en', 'Id', '2020-06-11 06:48:29', '2020-06-11 06:48:29'),
(129, 'data_rows', 'display_name', 114, 'en', 'Текст', '2020-06-11 06:48:29', '2020-06-11 06:48:29'),
(130, 'data_rows', 'display_name', 115, 'en', 'Created At', '2020-06-11 06:48:29', '2020-06-11 06:48:29'),
(131, 'data_rows', 'display_name', 116, 'en', 'Updated At', '2020-06-11 06:48:29', '2020-06-11 06:48:29'),
(132, 'data_types', 'display_name_singular', 14, 'en', 'Оформление картины', '2020-06-11 06:48:29', '2020-06-11 06:48:29'),
(133, 'data_types', 'display_name_plural', 14, 'en', 'Frames', '2020-06-11 06:48:29', '2020-06-11 06:48:29'),
(134, 'data_rows', 'display_name', 139, 'en', 'roles', '2020-06-11 06:54:39', '2020-06-11 06:54:39'),
(135, 'data_rows', 'display_name', 140, 'en', 'roles', '2020-06-11 06:55:31', '2020-06-11 06:55:31'),
(136, 'techniques', 'title', 1, 'en', 'oil', '2020-06-11 04:26:24', '2020-06-11 04:26:24'),
(137, 'users', 'name', 1, 'en', 'Max', '2020-06-11 07:53:33', '2020-06-11 08:13:24'),
(138, 'materials', 'title', 1, 'en', 'холст', '2020-06-11 04:55:02', '2020-06-11 04:55:02'),
(139, 'users', 'surname', 1, 'en', 'Ivanov', '2020-06-11 08:13:24', '2020-06-11 08:13:24'),
(140, 'users', 'middlename', 1, 'en', 'Ivanovich', '2020-06-11 08:13:40', '2020-06-11 08:13:40'),
(141, 'data_rows', 'display_name', 141, 'en', 'user_exhibits', '2020-06-11 11:26:01', '2020-06-11 11:26:01'),
(142, 'data_rows', 'display_name', 146, 'en', 'groups', '2020-06-12 06:51:14', '2020-06-12 06:51:14'),
(143, 'data_rows', 'display_name', 147, 'en', 'studies', '2020-06-12 06:51:14', '2020-06-12 06:51:14'),
(144, 'data_rows', 'display_name', 148, 'en', 'professions', '2020-06-12 07:18:29', '2020-06-12 07:18:29'),
(145, 'data_rows', 'display_name', 149, 'en', 'Beh', '2020-06-12 07:25:34', '2020-06-12 07:25:34'),
(146, 'data_rows', 'display_name', 150, 'en', 'Phone', '2020-06-12 10:46:45', '2020-06-12 10:46:45'),
(147, 'data_rows', 'display_name', 151, 'en', 'Photos', '2020-06-12 11:15:31', '2020-06-12 11:15:31'),
(148, 'data_rows', 'display_name', 152, 'en', 'techniques', '2020-06-12 11:15:31', '2020-06-12 11:15:31'),
(149, 'data_rows', 'display_name', 153, 'en', 'categories', '2020-06-12 11:16:54', '2020-06-12 11:16:54'),
(150, 'data_rows', 'display_name', 154, 'en', 'frames', '2020-06-12 11:16:54', '2020-06-12 11:16:54'),
(151, 'data_rows', 'display_name', 155, 'en', 'materials', '2020-06-12 11:18:06', '2020-06-12 11:18:06'),
(152, 'data_rows', 'display_name', 156, 'en', 'styles', '2020-06-12 11:18:06', '2020-06-12 11:18:06'),
(153, 'lots', 'title', 1, 'en', 'ыавываы', '2020-06-12 11:51:03', '2020-06-12 11:51:03'),
(154, 'menu_items', 'title', 23, 'en', 'Pages', '2020-06-14 16:52:52', '2020-06-14 16:52:52'),
(155, 'menu_items', 'title', 24, 'en', 'How to sell', '2020-06-14 16:55:10', '2020-06-14 16:55:10'),
(156, 'menu_items', 'title', 25, 'en', 'Rules', '2020-06-14 16:55:36', '2020-06-14 16:55:36'),
(157, 'menu_items', 'title', 26, 'en', 'Delivery', '2020-06-14 16:55:52', '2020-06-14 16:55:52'),
(158, 'data_rows', 'display_name', 157, 'en', 'lots', '2020-06-15 01:08:34', '2020-06-15 01:08:34'),
(159, 'lots', 'text', 1, 'en', '<p>fdyhn dydfyh dfhydf</p>', '2020-06-15 02:23:58', '2020-06-15 02:23:58'),
(160, 'users', 'surname', 10, 'en', 'Ланглебен', '2020-06-15 10:10:29', '2020-06-15 10:10:29'),
(161, 'users', 'name', 10, 'en', 'Юрий ', '2020-06-15 10:10:29', '2020-06-15 10:10:29'),
(162, 'users', 'middlename', 10, 'en', 'Львович', '2020-06-15 10:10:29', '2020-06-15 10:10:29'),
(163, 'users', 'text', 10, 'en', '<p>Участие в выставках рахличного уровня с 1980 г.</p>\n<p>Работы находятся в Госфонде РФ, частных собраниях России, Дании, Израиля, США.</p>\n<p>1980-1982 - художник-реставратор Дирекции выставок Московского отделения Художественного фонда РСФСР.</p>\n<p>1982-04.2019 - заведующий сектором реставрации ВНПО СХ СССР, художник-реставратор ООО \"ВО\"ЦДХ\"</p>\n<p>Выполнил реставрацию работ русских и советских художников для музеев РФ и частных галерей.</p>\n<p>Автор ряда публикаций и выставочных проектов.</p>\n<p>С 03.2019 по настоящее время художественный руководитель галереии ВСЕКОХУДОЖНИК, Дома художника МИИТ (ДК РУТ).</p>\n<p>&nbsp;</p>', '2020-06-15 10:10:29', '2020-06-15 10:10:29'),
(164, 'users', 'surname', 7, 'en', 'Дедушев', '2020-06-15 10:22:33', '2020-06-15 10:22:33'),
(165, 'users', 'name', 7, 'en', 'Александр', '2020-06-15 10:22:33', '2020-06-15 10:22:33'),
(166, 'users', 'surname', 8, 'en', 'Дедушева', '2020-06-15 10:33:29', '2020-06-15 10:33:29'),
(167, 'users', 'name', 8, 'en', 'Ирина', '2020-06-15 10:33:29', '2020-06-15 10:33:29'),
(168, 'users', 'surname', 9, 'en', 'Опухлый', '2020-06-15 10:45:49', '2020-06-15 10:45:49'),
(169, 'users', 'name', 9, 'en', 'К', '2020-06-15 10:45:49', '2020-06-15 10:45:49'),
(170, 'users', 'text', 7, 'en', '<pre class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Участник более 100 выставок в России и за рубежом. Провел двадцать три персональных выставки. Принимал участие в аукционах Arkol (Франция), Совком (Москва), а так же в благотворительных аукционах &laquo;Operation Smile&raquo;, &laquo;Dreams&raquo;,&nbsp;&nbsp;&laquo;Operations Hope&raquo; при поддержке &laquo;Sotheby&rsquo;s&raquo;,&nbsp;&nbsp;&laquo;Christie&rsquo;s&raquo;, &laquo;de Pury &amp; Luxembourg&raquo;. Неоднократно участвовал в &laquo;Арт-Манеж&raquo;, &laquo;Арт-Москва&raquo;.<br /><br />Работы художника находятся в собрании : Тамбовского художественного музея, Худ. Фонд РФ, коллекции &laquo;Усадьбы Зубовых&raquo;, &laquo;Восточной&nbsp;&nbsp;галерее&raquo; (Москва), галерее &laquo;Герцева&raquo; (Москва), галерее &laquo;Статус Кросна&raquo; (Москва),&nbsp;&nbsp;частной&nbsp;&nbsp;коллекции&nbsp;&nbsp;Manning Goodwin (Лондон); корпоративных коллекциях: &laquo;Price Waterhouse Coopers&raquo;, &laquo;Hotel Estrel&raquo; (Berlin), &laquo;Газпром&raquo;, &laquo;Русал&raquo; и в других частных коллекциях России, Германии, Англии, Бельгии, Франции, США.<br /><br /><span class=\"color11\">ГРУППОВЫЕ ВЫСТАВКИ</span><br /><span class=\"color11\">1989 &ndash; 18-я&nbsp; выставка&nbsp; молодых&nbsp; художников, Манеж, Москва.</span><br /><span class=\"color11\">1989 &ndash; &laquo;Весна 89&raquo;, Кузнецкий мост,&nbsp; Москва.</span><br /><span class=\"color11\">1991 &ndash;&nbsp; &laquo;Молодость&nbsp; России&raquo;, ЦДХ, Москва.</span><br /><span class=\"color11\">1992 &ndash; &laquo;Арт- Базель&raquo;, Швейцария, галерея &laquo;Фактура&raquo; (Москва),&nbsp; галерея&nbsp; &laquo;Николай и сын&raquo;&nbsp; (Германия).</span><br /><span class=\"color11\">1993 &ndash; Галерея &laquo;Атриум&raquo;. ЦДХ. Москва.</span><br /><span class=\"color11\">1993 &ndash; &laquo;Арт- Франкфурт&raquo;,&nbsp; галерея &laquo;Фактура&raquo;,&nbsp; (Москва),&nbsp; галерея&nbsp;&nbsp; &laquo;Николай&nbsp; и&nbsp; сын&raquo;, (Германия).&nbsp;</span><br /><span class=\"color11\">1993 &ndash; Аукцион &laquo;Арколь&raquo;,&nbsp; галерея&nbsp; &laquo;Нормандия&raquo;,&nbsp; Канн,&nbsp; Байо,&nbsp; Руан,&nbsp; Франция.</span><br /><span class=\"color11\">1994 &ndash; Из&nbsp; коллекции&nbsp; галереи&nbsp; &laquo;Герцев&raquo;, ЦДХ,&nbsp; Москва.</span><br /><span class=\"color11\">1994 &ndash; &laquo;Осень 94&raquo;,&nbsp; Кузнецкий мост, Москва.</span><br /><span class=\"color11\">1994 &ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">1996 &ndash; Проект&nbsp;&nbsp; &laquo;Hotel Estrel&raquo;,&nbsp; Берлин. (живопись, графика).</span><br /><span class=\"color11\">1996 &ndash; Выставка&nbsp; совместно&nbsp; с&nbsp; В. Шелеховым&nbsp; в&nbsp; Rathaus&nbsp; Goldbach,&nbsp; Германия.</span><br /><span class=\"color11\">1996 &ndash; Международный &laquo;Арт-салон&raquo;,&nbsp; ЦДХ,&nbsp;&nbsp; Москва.</span><br /><span class=\"color11\">1996</span><span class=\"color11\"><span lang=\"EN-US\">&nbsp;-&nbsp;</span>&nbsp;&laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">1994 &ndash;&nbsp; &laquo;Над&nbsp; небом&nbsp; голубым&raquo;,&nbsp; гостиница&nbsp; &laquo;Рэдиссон-Славянская&raquo;, Москва.</span><br /><span class=\"color11\">1988 &ndash; &laquo;Сон Венеры&raquo;, Восточная&nbsp; галерея,&nbsp; Москва.</span><br /><span class=\"color11\">1998 &ndash; Международный&nbsp; &laquo;Арт - салон&raquo;,&nbsp; ЦДХ,&nbsp;&nbsp; Москва.</span><br /><span class=\"color11\">1998 &ndash; &laquo;Пестрый&nbsp; Мир&raquo;,&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">1999&ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">1999&nbsp; &ndash; &laquo;Арт-салон&raquo;,&nbsp; проект&nbsp; &laquo;Чай&raquo;,&nbsp; ЦДХ, Москва.</span><br /><span class=\"color11\">1999&ndash; Аукцион &laquo;Operation Smile&raquo;, при поддрежке &laquo;Sotheby&rsquo;s&raquo;, Малый&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">1999 &ndash; &laquo;Тет-а-тет&raquo;,&nbsp; ЦДХ,&nbsp; Москва.</span><br /><span class=\"color11\">2000</span><span class=\"color11\">&nbsp;&ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">2001 &ndash; &laquo;Территория&nbsp; счастья&raquo;,&nbsp; ЦДХ, Москва.</span><br /><span class=\"color11\">2001 &ndash; Аукцион &laquo;Operation Smile&raquo; при&nbsp; поддержке&nbsp; &laquo;de Pury &amp; Luxembourg&raquo;,&nbsp; Малый&nbsp;&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">2001 &ndash; &laquo;25-я&nbsp; молодежная&raquo;,&nbsp;&nbsp; Кузнецкий&nbsp;&nbsp;&nbsp; мост,&nbsp;&nbsp; Москва.</span><br /><span class=\"color11\">2002 &ndash; Аукцион &laquo;Operation Smile&raquo; при&nbsp; поддержке&nbsp; &laquo;de Pury &amp; Luxembourg&raquo;,&nbsp; Малый&nbsp;&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">2003 &ndash; &laquo;Антитеррор&raquo; Галерея Кентавр, Москва.</span><br /><span class=\"color11\">2003&ndash; Аукцион &laquo;Operation Smile&raquo;, при поддрежке &laquo;Sotheby&rsquo;s&raquo;, Малый&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">2003 &ndash; &laquo;Лучшие художественные галереи&raquo;, Инфо-пространство, Москва.</span><br /><span class=\"color11\">2003&ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">2004 &ndash; Lux Art-Salon , Т-Модуль Тишинка, Москва.</span><br /><span class=\"color11\">2004&ndash; Аукцион &laquo;Operation Smile&raquo;, при поддрежке &laquo;Sotheby&rsquo;s&raquo;, Малый&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">2004 &ndash; Art Moscow, ЦДХ, Москва.</span><br /><span class=\"color11\">2004 &ndash; &laquo;Лучшие художественные галереи&raquo;, Инфо-пространство, Москва.</span><br /><span class=\"color11\">2004 &ndash;&nbsp; &laquo;Золотая кисть&raquo;, Малый манеж, Москва.</span><br /><span class=\"color11\">2005 &ndash; Art Moscow, ЦДХ, Москва.</span><br /><span class=\"color11\">2005&nbsp;&nbsp;&ndash; Благотворительный аукцион &laquo; Operation Smile &raquo;, при поддержке &laquo;Christie&rsquo;s&raquo;, Москва.&nbsp;</span><br /><span class=\"color11\">2006&nbsp;&nbsp;&ndash; Благотворительный аукцион &laquo;Операция надежда&raquo;,&nbsp; Москва.</span><br /><span class=\"color11\">2006&nbsp;&nbsp;&ndash; &laquo;Мир живописи&raquo;. ЦДХ. Москва.</span><br /><span class=\"color11\">2006 &ndash; &laquo;Обнаженная Россия&raquo;. ТВЦ-Тишинка. Москва.</span><br /><span class=\"color11\">2007&ndash; Благотворительный аукцион &laquo;Dreams&raquo; при поддержке &laquo;BBC&raquo; Москва.</span><br /><span class=\"color11\">2007 &ndash;&nbsp; &laquo;Четверо из Москвы&raquo; Sun Valley Idaho, Charlotte, North Carolina, Америка.</span><br /><span class=\"color11\">2007 &ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">2007 &ndash; Аукцион &laquo;Совком&raquo; №46 &laquo;50/50. Соцреализм - другое искусство&raquo;, Москва.&nbsp;</span><br /><span class=\"color11\">2008 &ndash; Аукцион &laquo;Совком&raquo; №67 &laquo;50/50. Соцреализм - другое искусство&raquo;, Москва.</span><br /><span class=\"color11\">2008 - Благотворительный аукцион &laquo;Dreams&raquo; при поддержке &laquo;BBC&raquo; Москва.</span><br /><span class=\"color11\">2010 &ndash; &laquo;Худ-Граф&raquo; Малый манеж. Москва.</span><br /><span class=\"color11\">2010&ndash; Благотворительный аукцион &laquo; Operation Smile &raquo;, при поддержке &laquo;Christie&rsquo;s&raquo;, Москва.&nbsp;</span><br /><span class=\"color11\">2010 &ndash; &laquo;Мир живописи&raquo;. ЦДХ. Москва.</span><br /><span class=\"color11\">2010 &ndash; &laquo;Свет Ангелов&raquo; Галерея Светланы Сажиной. Москва.</span><br /><span class=\"color11\">2010 &ndash; Аукцион &laquo;The St. Andrew Society&raquo;, Отель Марриотт. Москва.</span><br /><span class=\"color11\">2011&ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">2011 &ndash; Благотворительный аукцион &laquo; Operation Smile &raquo;, при поддержке &laquo;Christie&rsquo;s&raquo;, Москва.&nbsp;</span><br /><span class=\"color11\">2011 &ndash; Благотворительный аукцион &laquo;Операция надежда&raquo;,&nbsp; Москва.</span><br /><span class=\"color11\">2011 &ndash; &laquo;Выставка новых поступлений&raquo;, Государственный художественный музей. г.Тамбов.</span><br /><span class=\"color11\">2012 &ndash; &laquo;Возвращение домой&raquo;, Галерея Светланы Сажиной. Москва.</span><br /><span class=\"color11\">2013 &ndash; &laquo;80-лет МСХ&raquo;. Кузнецкий мост. Москва.&nbsp;</span><br /><span class=\"color11\">2013 &ndash; &laquo;Новогодняя выставка&raquo;, Галерея Светланы Сажиной. Москва</span><br /><span class=\"color11\">2013 &ndash; &laquo;Рождественская выставка&raquo;, Московский Союз Художников,&nbsp; Москва.</span><br /><span class=\"color11\">2014 &ndash; &laquo;Мир живописи&raquo;, МСХ, д/к г.Зеленоград.</span><br /><span class=\"color11\">2014 - Аукцион живописи и графики &laquo;Nika&raquo;.</span><br /><span class=\"color11\">2014- &laquo;Dreams&raquo; Благотворительный аукцион при поддержке &laquo;Christie\'s&raquo;, Москва.</span><br /><span class=\"color11\">2015 -Аукцион живописи и графики &laquo;Nika&raquo;.</span><br /><span class=\"color11\">2015 &ndash; &laquo;EQUUS&raquo;, Галерея 9/1, Москва.</span><br /><span class=\"color11\">2015 &ndash; &laquo;Выставка посвященная 90-летию МХУ памяти 1905г.&raquo; МОСХ России, Москва.</span><br /><span class=\"color11\">2016 - Аукцион живописи и графики &laquo;Nika&raquo;.</span><br /><span class=\"color11\">2016 &ndash; &laquo;Подарки к Рождеству&raquo;. Totibadze gallery. Винзавод</span><span class=\"color11\"><span lang=\"EN-US\">.&nbsp;</span>Москва</span><span class=\"color11\"><span lang=\"EN-US\">.</span></span><br /><span class=\"color11\"><span lang=\"EN-US\">2017 - Asia Contemporary Art Show.&nbsp;</span>Гонконг</span><span class=\"color11\"><span lang=\"EN-US\">.</span></span><br /><span class=\"color11\">2017 - Благотворительный аукцион &laquo;12 стульев&raquo;, в поддержку Благотворительного фонда &laquo;Жизнь, как чудо!&raquo;. Аукционный дом №1. Москва.</span><br /><span class=\"color11\">2017 - К&nbsp;</span>100-летию Октябрьской революции &laquo;Под лупой времени 1917-2017&raquo;. Галерея Светланы Сажиной. Москва.<br /><span lang=\"EN-US\">2018 &ndash; Affordable Art Hong Kong. Гонконг.</span><br />2018 &ndash; &laquo;Святые и художники&raquo;. Кузнецкий мост. Москва.<br />2018 &ndash; &laquo;Подарки к Рождеству&raquo;.&nbsp;<span class=\"color11\">Totibadze gallery. Винзавод. Москва.</span><br /><span class=\"color11\">2019 &ndash; Юбилейная выставка, посвященная 10-летию галереи Светланы Сажиной. Москва.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Культурные каникулы&raquo;. Галерея &laquo;Экспо-88&raquo;. Москва. ЦДХ.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Путешествия по снам&raquo;. Галерея Art Story. Москва.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Пушкин наш и все&hellip;&raquo; Галерея Всекохудожник. Медиацентр Зарядье. Москва.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Пушкин наш и все&hellip;&raquo; Галерея Всекохудожник. Выставочный зал. Переславль-Залесский.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Бестиарий&raquo;.&nbsp; Дарвиновский музей. Москва.</span></pre>\n<p>&nbsp;</p>', '2020-06-15 10:46:02', '2020-06-15 10:46:02'),
(171, 'users', 'surname', 13, 'en', 'Попов', '2020-06-15 12:22:47', '2020-06-15 12:22:47'),
(172, 'users', 'name', 13, 'en', 'Николай', '2020-06-15 12:22:47', '2020-06-15 12:22:47'),
(173, 'users', 'text', 13, 'en', '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; white-space: normal;\"><span style=\"font-family: Times;\">В настоящий момент Николай Попов - композитор, педагог, исследователь, член союза композиторов России, научный сотрудник центра электроакустической музыки Московской консерватории, преподаватель кафедры истории и теории музыки Российского университета театрального искусства (ГИТИС).&nbsp;</span><span style=\"font-size: 11pt; font-family: Times;\"><br /></span><span style=\"font-family: Times;\">Николай Попов &ndash; член Творческого союза художников России, секция &laquo;Абстрактное искусство&raquo;, тесно сотрудничает с ее председателем - Бабаяном Д.А. (Давид Ру).&nbsp;</span></p>\n<pre><span style=\"caret-color: #000000; color: #000000; font-size: 11pt; line-height: 15.693333625793457px; font-family: Calibri, sans-serif;\">&nbsp;</span></pre>', '2020-06-15 12:22:47', '2020-06-15 12:22:47'),
(174, 'users', 'surname', 25, 'en', 'Даньшин', '2020-06-16 08:56:51', '2020-06-16 08:56:51'),
(175, 'users', 'name', 25, 'en', 'Илья', '2020-06-16 08:56:51', '2020-06-16 08:56:51'),
(176, 'users', 'text', 25, 'en', '<p><span style=\"caret-color: #000000; color: black; font-size: 10.5pt; line-height: 14.979999542236328px; font-family: \'Times New Roman\', serif;\">Работы находятся в фондах Союза Художников РФ, Министерства культуры РФ, в Музее-усадьбе В.Д.Поленова, историко-архивном музее &laquo;Новый Иерусалим&raquo;, Государственном Художественном Музее Барнаула, Государственной Тарусской Картинной Галерее, Художественной галерее города Саров.</span></p>', '2020-06-16 08:57:39', '2020-06-16 08:57:39'),
(177, 'users', 'surname', 30, 'en', 'Травникова', '2020-06-16 14:03:17', '2020-06-16 14:03:17'),
(178, 'users', 'name', 30, 'en', 'Юлия ', '2020-06-16 14:03:17', '2020-06-16 14:03:17'),
(179, 'users', 'middlename', 30, 'en', 'Германовна', '2020-06-16 14:03:17', '2020-06-16 14:03:17'),
(180, 'users', 'text', 30, 'en', '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">С 1991 года принимает участие в выставках.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Участник более 30 региональных, всероссийских и международных выставок, в том числе 7 персональных, в г. Кургане, Челябинске, 1991-1993, 1996, 1998 гг., персональная выставка живописи и графики в Посольстве США, Москва, 1995 г.,&nbsp;&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">персональная выставка живописи в ЦДХ, г. Москва, 2004 г.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Стипендиат Союза художников и Министерства культуры Российской Федерации, 2000 г.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Лауреат художественной выставки &laquo;Москва глазами молодых&raquo;, 2001 г.&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Работы находятся в Областном художественном музее г. Кургана, музее г. Петрозаводска, в галереях и частных собраниях России, США, Франции, Германии.</span></p>', '2020-06-16 14:03:17', '2020-06-16 14:03:17'),
(181, 'users', 'surname', 46, 'en', 'Попов', '2020-06-17 08:13:39', '2020-06-17 08:13:39'),
(182, 'users', 'name', 46, 'en', 'Арсений', '2020-06-17 08:13:39', '2020-06-17 08:13:39'),
(183, 'users', 'surname', 50, 'en', 'Филатов', '2020-06-17 08:24:52', '2020-06-17 08:24:52'),
(184, 'users', 'name', 50, 'en', 'Евгения', '2020-06-17 08:24:52', '2020-06-17 08:24:52'),
(185, 'users', 'middlename', 50, 'en', 'Дмитриевна', '2020-06-17 08:24:52', '2020-06-17 08:24:52'),
(186, 'lots', 'title', 2, 'en', 'Зимний лес. Охотник.', '2020-06-18 05:27:38', '2020-06-18 05:27:38'),
(187, 'data_rows', 'display_name', 158, 'en', 'Sort', '2020-06-18 12:33:00', '2020-06-18 12:33:00'),
(188, 'users', 'surname', 64, 'en', 'Даугавиете', '2020-06-25 07:55:48', '2020-06-25 07:55:48'),
(189, 'users', 'name', 64, 'en', 'Мара', '2020-06-25 07:55:48', '2020-06-25 07:55:48'),
(190, 'lots', 'title', 3, 'en', 'Trees', '2020-06-26 09:09:26', '2020-07-31 07:21:25'),
(191, 'lots', 'title', 4, 'en', 'Деревья', '2020-06-26 09:10:40', '2020-06-26 09:10:40'),
(192, 'menu_items', 'title', 30, 'en', 'Auctions', '2020-06-28 20:25:32', '2020-06-28 20:25:32'),
(193, 'menu_items', 'title', 31, 'en', 'Regular', '2020-06-28 20:26:29', '2020-06-28 20:26:29'),
(194, 'menu_items', 'title', 32, 'en', 'Thematic', '2020-06-28 20:27:25', '2020-06-28 20:27:25'),
(195, 'menu_items', 'title', 33, 'en', 'Archive', '2020-06-28 20:27:53', '2020-06-28 20:27:53'),
(196, 'menu_items', 'title', 34, 'en', 'Online-gallery', '2020-06-28 20:35:31', '2020-06-28 20:35:31'),
(197, 'menu_items', 'title', 35, 'en', 'Art on sale', '2020-06-28 20:36:58', '2020-06-28 20:36:58'),
(198, 'menu_items', 'title', 36, 'en', 'Authors', '2020-06-28 20:37:29', '2020-06-28 20:37:29'),
(199, 'menu_items', 'title', 37, 'en', 'Archive', '2020-06-28 20:38:03', '2020-06-28 20:38:03'),
(200, 'menu_items', 'title', 38, 'en', 'SPACES', '2020-06-28 20:39:01', '2020-06-28 20:39:01'),
(201, 'menu_items', 'title', 39, 'en', 'Exhibitions', '2020-06-28 20:39:27', '2020-06-28 20:39:27'),
(202, 'menu_items', 'title', 40, 'en', 'Workshops', '2020-06-28 20:39:57', '2020-06-28 20:39:57'),
(203, 'menu_items', 'title', 41, 'en', 'PLATFORM', '2020-06-28 20:40:45', '2020-06-28 20:40:45'),
(204, 'menu_items', 'title', 42, 'en', 'About us', '2020-06-28 20:41:13', '2020-06-28 20:41:13'),
(205, 'menu_items', 'title', 43, 'en', 'Partnership', '2020-06-28 20:41:57', '2020-06-28 20:41:57'),
(206, 'menu_items', 'title', 44, 'en', 'Blog', '2020-06-28 20:42:33', '2020-08-03 11:11:10'),
(207, 'menu_items', 'title', 45, 'en', 'How to buy?', '2020-06-28 20:55:39', '2020-06-28 21:57:15'),
(208, 'menu_items', 'title', 46, 'en', 'How to sell?', '2020-06-28 20:56:09', '2020-06-28 21:57:20'),
(209, 'menu_items', 'title', 47, 'en', 'Auction Rules', '2020-06-28 20:56:54', '2020-06-28 20:56:54'),
(210, 'menu_items', 'title', 48, 'en', 'Payment', '2020-06-28 20:57:28', '2020-06-28 20:57:28'),
(211, 'menu_items', 'title', 49, 'en', 'Delivery', '2020-06-28 20:58:00', '2020-06-28 20:58:00'),
(212, 'menu_items', 'title', 50, 'en', 'Auctions', '2020-06-28 20:58:32', '2020-06-28 20:58:32'),
(213, 'menu_items', 'title', 51, 'en', 'online-gallery', '2020-06-28 20:59:04', '2020-06-28 20:59:04'),
(214, 'menu_items', 'title', 52, 'en', 'Authors', '2020-06-28 20:59:26', '2020-06-28 20:59:26'),
(215, 'menu_items', 'title', 53, 'en', 'Exhibitions', '2020-06-28 20:59:50', '2020-06-28 20:59:50'),
(216, 'menu_items', 'title', 54, 'en', 'Workshops', '2020-06-28 21:00:11', '2020-06-28 21:00:11'),
(217, 'menu_items', 'title', 55, 'en', 'NEWS', '2020-06-28 21:00:36', '2020-08-23 02:45:39'),
(218, 'menu_items', 'title', 56, 'en', 'Contacts', '2020-06-28 21:00:58', '2020-06-28 21:00:58'),
(220, 'menu_items', 'title', 58, 'en', 'Персональные данные', '2020-06-28 21:01:39', '2020-06-28 21:01:39'),
(221, 'menu_items', 'title', 59, 'en', 'Договор оферты', '2020-06-28 21:01:56', '2020-06-28 21:01:56'),
(222, 'data_rows', 'display_name', 29, 'en', 'ID', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(223, 'data_rows', 'display_name', 32, 'en', 'Название', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(224, 'data_rows', 'display_name', 42, 'en', 'SEO Название', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(225, 'data_rows', 'display_name', 33, 'en', 'Отрывок', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(226, 'data_rows', 'display_name', 34, 'en', 'Содержимое', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(227, 'data_rows', 'display_name', 35, 'en', 'Изображение Статьи', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(228, 'data_rows', 'display_name', 36, 'en', 'Slug (ЧПУ)', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(229, 'data_rows', 'display_name', 37, 'en', 'Meta Description', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(230, 'data_rows', 'display_name', 38, 'en', 'Meta Keywords', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(231, 'data_rows', 'display_name', 39, 'en', 'Статус', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(232, 'data_rows', 'display_name', 43, 'en', 'Рекомендовано', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(233, 'data_rows', 'display_name', 40, 'en', 'Дата создания', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(234, 'data_rows', 'display_name', 41, 'en', 'Дата обновления', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(235, 'data_types', 'display_name_singular', 5, 'en', 'Статья', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(236, 'data_types', 'display_name_plural', 5, 'en', 'Статьи', '2020-06-29 06:13:12', '2020-06-29 06:13:12'),
(237, 'data_types', 'display_name_singular', 18, 'en', 'Новость', '2020-06-29 06:14:26', '2020-06-29 06:14:26'),
(238, 'data_types', 'display_name_plural', 18, 'en', 'Новости', '2020-06-29 06:14:26', '2020-06-29 06:14:26'),
(239, 'menu_items', 'title', 28, 'en', 'Blog/News', '2020-06-29 06:17:11', '2020-07-09 11:24:15'),
(240, 'data_rows', 'display_name', 167, 'en', 'Id', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(241, 'data_rows', 'display_name', 168, 'en', 'Title', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(242, 'data_rows', 'display_name', 169, 'en', 'Seo Title', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(243, 'data_rows', 'display_name', 170, 'en', 'Excerpt', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(244, 'data_rows', 'display_name', 171, 'en', 'Body', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(245, 'data_rows', 'display_name', 172, 'en', 'Image', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(246, 'data_rows', 'display_name', 173, 'en', 'Slug', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(247, 'data_rows', 'display_name', 174, 'en', 'Meta Description', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(248, 'data_rows', 'display_name', 175, 'en', 'Meta Keywords', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(249, 'data_rows', 'display_name', 176, 'en', 'Status', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(250, 'data_rows', 'display_name', 177, 'en', 'Featured', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(251, 'data_rows', 'display_name', 178, 'en', 'Created At', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(252, 'data_rows', 'display_name', 179, 'en', 'Updated At', '2020-06-29 06:21:42', '2020-06-29 06:21:42'),
(253, 'lots', 'title', 5, 'en', 'Туман. Криушкино.', '2020-07-03 07:51:21', '2020-07-03 07:51:21'),
(254, 'lots', 'title', 7, 'en', 'Радуга', '2020-07-03 08:09:09', '2020-07-03 08:09:09'),
(255, 'lots', 'title', 10, 'en', 'В кафе', '2020-07-03 08:44:43', '2020-07-03 08:44:43'),
(256, 'lots', 'title', 12, 'en', 'Я и дети на реке', '2020-07-03 08:52:38', '2020-07-03 08:52:38'),
(257, 'lots', 'title', 18, 'en', 'Композиция 3', '2020-07-03 09:11:18', '2020-07-03 09:11:18'),
(258, 'lots', 'title', 28, 'en', 'Серый шум 2 ', '2020-07-03 09:56:41', '2020-07-03 09:56:41'),
(259, 'lots', 'title', 35, 'en', 'Предметы на синем фоне', '2020-07-03 10:21:30', '2020-07-03 10:21:30'),
(260, 'styles', 'title', 2, 'en', 'Темпера', '2020-07-03 10:21:39', '2020-07-03 10:21:39'),
(261, 'lots', 'title', 36, 'en', 'Птица', '2020-07-03 10:31:26', '2020-07-03 10:31:26'),
(262, 'lots', 'title', 37, 'en', 'Красная композиция', '2020-07-03 10:34:22', '2020-07-03 10:34:22'),
(263, 'lots', 'title', 38, 'en', 'Зазывание весны (белое) ', '2020-07-03 10:36:01', '2020-07-03 10:36:01'),
(264, 'lots', 'title', 39, 'en', 'Букет в мае и кайф от сирени', '2020-07-03 11:28:45', '2020-07-03 11:29:55'),
(265, 'lots', 'title', 40, 'en', 'Букет ', '2020-07-03 11:33:07', '2020-07-03 11:33:07'),
(266, 'lots', 'title', 41, 'en', 'Белые пионы', '2020-07-03 11:38:18', '2020-07-03 11:38:18'),
(267, 'posts', 'title', 3, 'en', '«В стране приключений» Богачева', '2020-07-09 11:34:57', '2020-07-09 11:34:57'),
(268, 'posts', 'body', 3, 'en', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">29 марта в 18:00 при поддержке Управы района Хамовники г. Москвы, РОО &laquo;МАСТЕР-КЛАСС&raquo; и Московского отделения ВТОО &laquo;Союза художников России&raquo; состоялось открытие выставки Юрия Богачева &laquo;В стране приключений&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">&bull; Юрий Николаевич Богачёв родился в 1956 году в г. Электростали Московской области.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; В 1975 году окончил Московское государственное академическое художественное училище &laquo;Памяти 1905 года&raquo;.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; В 1975-1977 гг. служил в Советской армии.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; В 1986 году окончил с отличием факультет художественного оформления печатной продукции Московского полиграфического института.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; Член Союза художников России.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; Член Союза журналистов России.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">С 1984 года Ю.Н. Богачёв работает в книжной графике. Оформил и проиллюстрировал более 60 книг для издательств: &laquo;Молодая гвардия&raquo;, &laquo;Малыш&raquo;, &laquo;Красноярское книжное издательство&raquo;, &laquo;Прометей&raquo;, &laquo;Центр детской книги&raquo;, &laquo;Московские учебники и картолитография&raquo;, &laquo;Москвоведение&raquo;, &laquo;Лазурь&raquo;, &laquo;Русский язык&raquo;, &laquo;Лазаревское&raquo;, &laquo;Азбука-Аттикус&raquo;, &laquo;Махаон&raquo;, &laquo;Аудитория&raquo;, &laquo;Нигма&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">&bull; Художник нескольких диафильмов Студии &laquo;Диафильм&raquo; Госкино СССР, 1987-1989 гг.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; Участник городских, областных, зональных, региональных, всероссийских, международных художественных выставок и книжных выставок-ярмарок: ММКВЯ, &laquo;Книги России&raquo;, &laquo;Красная плащадь&raquo;, &laquo;Иоп-бсйоп&raquo;, выставок художников книги в Нюрнберге и Барселоне.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />&bull; Неоднократно награждён знаками отличия, дипломами, почётными грамотами и благодарственными письмами государственных, федеральных, региональных, муниципальных структур и общественных организаций.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Рисовать для детей как для взрослых, разговаривать с ребёнком на равных, уважать в нём зрителя и собеседника &mdash; вот принципы иллюстратора Ю. Богачёва. Многие годы он работал над изданиями детской, учебной и просветительской литературы, учебниками по москвоведению и краеведению, книгами, посвящёнными истории нашей столицы и Подмосковья, истории обороны российских рубежей, родословию А.С. Пушкина.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">С начала 2010-х годов иллюстрирует классику мировой художественной и приключенческой литературы.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">В данную экспозицию вошли иллюстрации к книгам разных лет (1994-2019):<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><em style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Л. Яхнин &laquo;Колокола&raquo;, издательство &laquo;Малыш&raquo;, О. Иванов &laquo;Герои ратных дел Отчизны&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />В. Муравьёв &laquo;История Москвы в пословицах и поговорках&raquo;, изд. &laquo;Москвоведение&raquo;.<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Л. Черкашина &laquo;Тайны Пушкинского древа&raquo;, изд. &laquo;Лазурь&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />П. Краснов &laquo;Таинственный часовой&raquo;, изд. &laquo;Лазаревское&raquo;; к книгам серий &laquo;Мировая классика для детей&raquo; и &laquo;Классная классика&raquo; изд. &laquo;Махаон&raquo;: &laquo;Слово о полку Игореве&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />М. Сервантес &laquo;Дон Кихот&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Э. Портер &laquo;Поллианна выросла&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />О. Тихормиров &laquo;На страже Руси&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Э. По &laquo;Золотой жук&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Ж. Рони-Сташий &laquo;Борьба за огонь&raquo;; к книгам серии &laquo;Страна приключений&raquo; изд. &laquo;Нигма&raquo;:<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />В. Обручев &laquo;Плутония&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Т. Майн Рид &laquo;Белый вождь&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Г. Эмар &laquo;Твёрдая рука&raquo;,<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Т. Майн Рид &laquo;Всадник без головы&raquo; и др.</em></p>', '2020-07-09 11:34:57', '2020-07-09 11:34:57'),
(269, 'posts', 'slug', 3, 'en', 'v-strane-priklyuchenij-bogacheva', '2020-07-09 11:34:57', '2020-07-09 11:34:57'),
(273, 'posts', 'slug', 1, 'en', 'sem-ya-epple', '2020-07-09 11:35:04', '2020-07-09 11:35:04'),
(274, 'data_rows', 'display_name', 180, 'en', 'Категория', '2020-07-09 11:44:55', '2020-07-09 11:44:55');
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(275, 'data_rows', 'display_name', 181, 'en', 'tags', '2020-07-09 11:44:55', '2020-07-09 11:44:55'),
(276, 'menu_items', 'title', 65, 'en', 'Auctions', '2020-07-13 07:00:50', '2020-07-13 07:00:50'),
(277, 'menu_items', 'title', 66, 'en', 'Online-gallery', '2020-07-13 07:01:22', '2020-07-13 07:01:22'),
(278, 'menu_items', 'title', 67, 'en', 'Authors', '2020-07-13 07:01:54', '2020-07-13 07:01:54'),
(279, 'menu_items', 'title', 68, 'en', 'Exhibitions', '2020-07-13 07:02:31', '2020-07-13 07:02:31'),
(280, 'menu_items', 'title', 69, 'en', 'Workshops', '2020-07-13 07:03:30', '2020-07-13 07:03:30'),
(281, 'menu_items', 'title', 70, 'en', 'News', '2020-07-13 07:04:04', '2020-08-23 02:46:41'),
(282, 'menu_items', 'title', 71, 'en', 'Contacts', '2020-07-13 07:04:38', '2020-07-13 07:04:38'),
(283, 'menu_items', 'title', 72, 'en', 'How to buy', '2020-07-13 07:05:44', '2020-07-13 07:05:44'),
(284, 'menu_items', 'title', 73, 'en', 'How to sell', '2020-07-13 07:06:18', '2020-07-13 07:06:18'),
(285, 'menu_items', 'title', 74, 'en', 'Rules of Auction', '2020-07-13 07:06:57', '2020-07-13 07:07:58'),
(286, 'menu_items', 'title', 75, 'en', 'Delivery', '2020-07-13 07:07:25', '2020-07-13 07:07:25'),
(287, 'pages', 'title', 4, 'en', 'Delivery', '2020-07-19 23:40:39', '2020-07-20 01:27:39'),
(288, 'pages', 'body', 4, 'en', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-weight: bold; font-size: 18px;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Delivery, сборка и установка мебели осуществляется единовременно.</span></span></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Узнать стоимость услуг подъема, сборки и установки мебели можно по&nbsp;<a style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; background-color: transparent; color: #3066be; line-height: inherit; cursor: pointer; border: none;\" href=\"https://mebel-v-omske.ru/uslugi\">ссылке</a>.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">При согласовании заказа с менеджером укажите, какие дополнительные услуги Вам необходимы.&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff0000;\">ВНИМАНИЕ!</span></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Мебель с механическими повреждениями поднятая на этаж, собранная и установленная покупателем самостоятельно обмену и возврату не подлежит.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #008000; font-weight: bold; font-size: 18px;\">Режим работы службы доставки и сборки:</span></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Только будние дни.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Первая половина дня &ndash; с 10.00 до 15.00</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Вторая половина дня &ndash; с 15.00 до 19.00 (возможно позднее в зависимости от загруженности службы доставки).</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #008000; font-weight: bold; font-size: 18px;\">Сроки и стоимость доставки до подъезда</span><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\" /><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка мебели из наличия,</span>&nbsp;возможна в течение трех дней с момента оформления заказа.&nbsp;Дату и время доставки с покупателем согласовывает продавец в момент покупки товара. В день доставки продавец делает предварительный контрольный звонок по телефону, если покупатель не отвечает то доставка переносится на другой день.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent;\" /><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка&nbsp;заказной мебели,</span>&nbsp;возможна в течение трех дней с момента готовности изделия. Срок изготовления мебели от 1 до 45&nbsp;дней. В момент готовности товара продавец информирует покупателя по телефону и согласовывает дату и время доставки.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка по Омской области:</span>&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">от магазина на расстояние до 35 км =&nbsp;30 руб/км.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">от магазина на расстояние&nbsp;35-80 км =&nbsp;40 руб/км. + 400 руб.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">от магазина на расстояние&nbsp;80-100&nbsp;км =&nbsp;45&nbsp;руб/км.&nbsp;+ 400 руб.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Доставка на расстояние более 100&nbsp;км.&nbsp;осуществляются через транспортные компании (см. доставка по России).</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><a style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; background-color: transparent; color: #3066be; line-height: inherit; cursor: pointer; border: none;\" href=\"https://yandex.ru/maps/?um=constructor%3A4ec29df074bed7dab6c9282e0c621364f3675018dbd567e1de199a3afd68ce6c&amp;source=constructorLink\" target=\"_blank\" rel=\"noopener noreferrer\">Найти себя на карте&nbsp;доставки по Омской области.</a></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-style: italic;\">*При оформлении заказа следует указать способ доставки: \"Другое\". Мы сделаем перерасчёт заказа с учётом доставки и свяжемся с Вами для согласования.</span></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; color: #ff006e;\">Доставка по России,</span>&nbsp;осуществляется с помощью транспортных компаний.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">Покупатель самостоятельно выбирает транспортную компанию, выясняет стоимость грузоперевозки и оплачивает услугу.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\">&nbsp;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; margin: 0px; padding: 0px; font-size: 16px; line-height: 1.58; text-rendering: optimizelegibility; letter-spacing: 0.01em; word-spacing: 1.6px; word-break: break-word; overflow-wrap: break-word; hyphens: manual; color: rgba(0, 0, 0, 0.8); font-family: FontParagraph, Roboto, \'Helvetica Neue\', Helvetica, Arial, sans-serif; overflow: initial !important;\"><span style=\"box-sizing: inherit; -webkit-tap-highlight-color: transparent; font-style: italic;\">*При оформлении заказа следует указать способ доставки: \"до транспортной компании\" и в комментарии к заказу написать адрес приемного пункта выбранной Вами транспортной компании, а так же данные получателя которые требует ТК.</span></p>', '2020-07-19 23:40:39', '2020-07-20 01:27:39'),
(289, 'pages', 'slug', 4, 'en', 'delivery', '2020-07-19 23:40:39', '2020-07-19 23:40:39'),
(290, 'posts', 'excerpt', 3, 'en', '29 марта в 18:00 при поддержке Управы района Хамовники г. Москвы, РОО «МАСТЕР-КЛАСС» и Московского отделения ВТОО «Союза художников России» состоялось открытие выставки Юрия Богачева «В стране приключений».\n\n• Юрий Николаевич Богачёв родился в 1956 году в г. Электростали Московской области.\n• В 1975 году окончил Московское государственное академическое художественное училище «Памяти 1905 года».', '2020-07-20 02:28:24', '2020-07-20 02:28:24'),
(291, 'posts', 'meta_description', 3, 'en', 'ший «Борьба за огонь»; к книгам серии «Страна приключений» изд. «Нигма»:\nВ. Обручев «Плутония»,\nТ. Майн Рид «Белый вож', '2020-07-20 02:28:24', '2020-07-20 02:28:24'),
(292, 'posts', 'meta_keywords', 3, 'en', 'ший «Борьба за огонь»; к книгам серии «Страна приключений» изд. «Нигма»:\nВ. Обручев «Плутония»,\nТ. Майн Рид «Белый вож', '2020-07-20 02:28:24', '2020-07-20 02:28:24'),
(293, 'posts', 'seo_title', 3, 'en', 'нигам серии «Страна прикл', '2020-07-20 02:28:24', '2020-07-20 02:28:24'),
(294, 'data_rows', 'display_name', 194, 'en', 'Images', '2020-07-20 02:29:39', '2020-07-20 02:29:39'),
(295, 'pages', 'title', 5, 'en', 'Сотрудничество', '2020-07-20 10:36:24', '2020-07-20 10:36:24'),
(296, 'pages', 'body', 5, 'en', '<p>Сотрудничество</p>', '2020-07-20 10:36:24', '2020-07-20 10:36:24'),
(297, 'pages', 'slug', 5, 'en', 'partnership', '2020-07-20 10:36:24', '2020-07-20 10:36:55'),
(298, 'data_rows', 'display_name', 44, 'en', 'ID', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(299, 'data_rows', 'display_name', 45, 'en', 'Автор', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(300, 'data_rows', 'display_name', 46, 'en', 'Название', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(301, 'data_rows', 'display_name', 47, 'en', 'Отрывок', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(302, 'data_rows', 'display_name', 48, 'en', 'Содержимое', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(303, 'data_rows', 'display_name', 55, 'en', 'Изображение Страницы', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(304, 'data_rows', 'display_name', 49, 'en', 'Slug (ЧПУ)', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(305, 'data_rows', 'display_name', 50, 'en', 'Meta Description', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(306, 'data_rows', 'display_name', 51, 'en', 'Meta Keywords', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(307, 'data_rows', 'display_name', 52, 'en', 'Статус', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(308, 'data_rows', 'display_name', 53, 'en', 'Дата создания', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(309, 'data_rows', 'display_name', 54, 'en', 'Дата обновления', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(310, 'data_types', 'display_name_singular', 6, 'en', 'Страница', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(311, 'data_types', 'display_name_plural', 6, 'en', 'Страницы', '2020-07-20 10:39:33', '2020-07-20 10:39:33'),
(312, 'pages', 'title', 6, 'en', 'Оплата', '2020-07-20 10:41:44', '2020-07-20 10:41:44'),
(313, 'pages', 'title', 7, 'en', 'Контакты', '2020-07-20 10:42:43', '2020-07-20 10:42:43'),
(314, 'pages', 'excerpt', 7, 'en', 'Контакты', '2020-07-20 10:42:43', '2020-07-20 10:42:43'),
(315, 'pages', 'body', 7, 'en', '<p>Контакты</p>', '2020-07-20 10:42:43', '2020-07-20 10:42:43'),
(316, 'auctions', 'title', 2, 'en', 'asdasd', '2020-07-21 00:45:50', '2020-07-21 00:45:50'),
(317, 'auctions', 'sublime', 2, 'en', 'asdasd', '2020-07-21 00:45:50', '2020-07-21 00:45:50'),
(318, 'data_rows', 'display_name', 198, 'en', 'Изображение шапки', '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(319, 'data_rows', 'display_name', 199, 'en', 'Изображение узкой шапки', '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(320, 'data_rows', 'display_name', 200, 'en', 'Изображение самой узкой шапки', '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(321, 'data_rows', 'display_name', 202, 'en', 'Текст шапки', '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(322, 'data_rows', 'display_name', 203, 'en', 'Текст узкой шапки', '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(323, 'data_rows', 'display_name', 204, 'en', 'Текст самой узкой шапки', '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(324, 'data_rows', 'display_name', 205, 'en', 'Текст анонса', '2020-07-21 01:16:08', '2020-07-21 01:16:08'),
(325, 'auctions', 'text', 2, 'en', 'ываыва', '2020-07-21 01:16:51', '2020-07-21 01:16:51'),
(326, 'data_rows', 'display_name', 206, 'en', 'Изображение анонса', '2020-07-21 01:23:34', '2020-07-21 01:23:34'),
(327, 'data_rows', 'display_name', 207, 'en', 'Анонсировать', '2020-07-21 02:03:09', '2020-07-21 02:03:09'),
(328, 'auctions', 'header_text', 2, 'en', 'Текст шапки en', '2020-07-21 02:05:37', '2020-07-21 02:05:37'),
(329, 'auctions', 'announce_text', 2, 'en', 'Текст анонса en', '2020-07-21 02:05:37', '2020-07-21 02:05:37'),
(330, 'auctions', 'title', 3, 'en', 'Название ru', '2020-07-21 02:26:44', '2020-07-21 02:26:44'),
(331, 'auctions', 'sublime', 3, 'en', 'Краткое описание ru', '2020-07-21 02:26:44', '2020-07-21 02:26:44'),
(332, 'auctions', 'text', 3, 'en', 'Развернутое описание ru', '2020-07-21 02:26:44', '2020-07-21 02:26:44'),
(333, 'auctions', 'header_text', 3, 'en', 'Текст шапки', '2020-07-21 02:26:44', '2020-07-21 02:26:44'),
(334, 'auctions', 'announce_text', 3, 'en', 'Текст анонса', '2020-07-21 02:26:44', '2020-07-21 02:26:44'),
(335, 'auctions', 'title', 4, 'en', 'Название ru', '2020-07-21 02:26:59', '2020-07-21 02:26:59'),
(336, 'auctions', 'sublime', 4, 'en', 'Краткое описание ru', '2020-07-21 02:26:59', '2020-07-21 02:26:59'),
(337, 'auctions', 'text', 4, 'en', 'Развернутое описание ru', '2020-07-21 02:26:59', '2020-07-21 02:26:59'),
(338, 'auctions', 'header_text', 4, 'en', 'Текст шапки', '2020-07-21 02:26:59', '2020-07-21 02:26:59'),
(339, 'auctions', 'announce_text', 4, 'en', 'Текст анонса', '2020-07-21 02:26:59', '2020-07-21 02:26:59'),
(340, 'auctions', 'title', 5, 'en', 'Название ru', '2020-07-21 03:25:15', '2020-07-21 03:25:15'),
(341, 'auctions', 'sublime', 5, 'en', 'Краткое описание ru', '2020-07-21 03:25:15', '2020-07-21 03:25:15'),
(342, 'auctions', 'text', 5, 'en', 'Развернутое описание ru', '2020-07-21 03:25:15', '2020-07-21 03:25:15'),
(343, 'auctions', 'header_text', 5, 'en', 'Текст шапки en', '2020-07-21 03:25:15', '2020-07-21 09:25:21'),
(344, 'auctions', 'announce_text', 5, 'en', 'Текст анонса en', '2020-07-21 03:25:15', '2020-07-21 09:25:21'),
(345, 'data_rows', 'display_name', 208, 'en', 'Id', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(346, 'data_rows', 'display_name', 209, 'en', 'Type', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(347, 'data_rows', 'display_name', 210, 'en', 'Title', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(348, 'data_rows', 'display_name', 211, 'en', 'Address', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(349, 'data_rows', 'display_name', 212, 'en', 'Coords', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(350, 'data_rows', 'display_name', 213, 'en', 'Zoom', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(351, 'data_rows', 'display_name', 214, 'en', 'Created At', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(352, 'data_rows', 'display_name', 215, 'en', 'Updated At', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(353, 'data_types', 'display_name_singular', 24, 'en', 'Space', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(354, 'data_types', 'display_name_plural', 24, 'en', 'Spaces', '2020-07-26 12:14:56', '2020-07-26 12:14:56'),
(355, 'spaces', 'title', 1, 'en', 'Акт-Арт Фрунзенская', '2020-07-26 13:34:40', '2020-07-26 13:34:40'),
(356, 'menu_items', 'title', 77, 'en', 'Spaces', '2020-07-26 23:42:56', '2020-07-26 23:42:56'),
(357, 'menu_items', 'title', 76, 'en', 'Spaces', '2020-07-26 23:43:29', '2020-07-26 23:43:29'),
(358, 'data_rows', 'display_name', 216, 'en', 'Date', '2020-07-27 00:44:34', '2020-07-27 00:44:34'),
(359, 'posts', 'title', 9, 'en', '«Из подбора»', '2020-07-27 00:54:25', '2020-07-27 00:54:25'),
(360, 'posts', 'excerpt', 9, 'en', '«Из подбора» — театральный термин, означающий, что, если к новому спектаклю не хватает чего-либо из реквизита или костюмов, то можно подобрать из коллекции прошлых постановок, идущих или уже сошедших со сцены. Для художника смысл термина раскрывается шире — в нём и смысл, и концепция, и метод.', '2020-07-27 00:54:25', '2020-07-27 00:54:25'),
(361, 'posts', 'body', 9, 'en', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Мария Калмыкова, Максим Проценко, Полина Земскова</strong><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">12 сентября 2019г. в выставочном пространстве Мастер-Класс</strong><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">галерея ВСЕКОХУДОЖНИК представили выставку &laquo;Из подбора&raquo;, посвящённую Году театра.</strong></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">&laquo;Из подбора&raquo; &mdash; театральный термин, означающий, что, если к новому спектаклю не хватает чего-либо из реквизита или костюмов, то можно подобрать из коллекции прошлых постановок, идущих или уже сошедших со сцены. Для художника смысл термина раскрывается шире &mdash; в нём и смысл, и концепция, и метод. Подобрать можно и с пола, и из мусора, получить в подарок от друзей или выбрать в магазине некоторый предмет, который станет частью нового произведения.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Художники Мария Калмыкова и Максим Проценко (М+М) часто используют этот художественный приём, вводя использованные уже предметы в свои работы, будь то старая доска, сломанная швейная машинка, пружинный матрас, &laquo;дворники&raquo; от автомобиля и т.д.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">На выставке представлены объекты, скульптура, инсталляции, созданные именно по этому принципу. Дополнят экспозицию фотоработы Полины Земсковой, зафиксировавшей своей камерой рабочие моменты оформления спектакля в театре &laquo;Современник&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Выставка проходит в Год театра. Мария Калмыкова и Максим Проценко много работают как театральные художники, хорошо знают этот мир изнутри и раскрывают маленькие секреты профессии художника.</p>', '2020-07-27 00:54:25', '2020-07-27 00:54:25'),
(362, 'posts', 'slug', 9, 'en', 'iz-podbora', '2020-07-27 00:54:25', '2020-07-27 00:54:25'),
(363, 'data_rows', 'display_name', 217, 'en', 'Сортировка', '2020-07-27 08:15:22', '2020-07-27 08:15:22'),
(364, 'lots', 'title', 6, 'en', 'Склеенная амфора', '2020-07-27 08:51:15', '2020-07-27 08:51:15'),
(365, 'data_rows', 'display_name', 218, 'en', 'В галерее', '2020-07-28 13:14:41', '2020-07-28 13:14:41'),
(366, 'posts', 'title', 6, 'en', '«А мой дедушка на войну ездил»', '2020-07-28 13:19:03', '2020-07-28 13:19:03'),
(367, 'posts', 'excerpt', 6, 'en', 'В простых привычных вещах художник научился видеть подчас скрытый, но великий смысл. В его пейзажах наиболее полно раскрывается поэтическая основа его таланта. За долгие годы художник приобрел свою особую мягкую лирическую остроту и свежесть восприятия жизни.', '2020-07-28 13:19:03', '2020-07-28 13:19:03'),
(368, 'posts', 'body', 6, 'en', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">7 мая, в преддверии Дня Победы, прошло открытие выставки картин Александра Евгеньевича Степанок.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Александр участник московских, зональных, республиканских и зарубежных выставок. Работы закупленные художественным фондом СССР, находятся в музеях и картинных галереях бывшего СССР, Германии, Австрии, а так же в частных собраниях коллекционеров Израиля, США, Австрии и др. Окончил художественно &mdash; графический факультет МГЗПИ. Работает в жанре пейзажа. В Союз художников вступил в 1984 году.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Александр Евгеньевич &mdash; участник Отечественной войны. Награжден Орденом Отечественной войны 1 степени и медалью за &laquo;За боевые заслуги&raquo;. Годы сражений и потерь обострили в нем чувство привязанности к родной земле. В простых привычных вещах художник научился видеть подчас скрытый, но великий смысл. В его пейзажах наиболее полно раскрывается поэтическая основа его таланта. За долгие годы художник приобрел свою особую мягкую лирическую остроту и свежесть восприятия жизни. Художник удивительно работоспособен. Он много работает в мастерской за мольбертом и на планере с этюдами.</p>', '2020-07-28 13:19:03', '2020-07-28 13:19:03'),
(369, 'posts', 'slug', 6, 'en', 'a-moj-dedushka-na-vojnu-ezdil', '2020-07-28 13:19:03', '2020-07-28 13:19:03'),
(370, 'posts', 'title', 7, 'en', 'Выставка «Пушкин наш, и всё!»', '2020-07-28 13:21:17', '2020-07-28 13:21:17'),
(371, 'posts', 'excerpt', 7, 'en', 'Многие художники обращались и обращаются к образу поэта, его творчеству, пытаются постичь феномен влияния гения Пушкина на русскую культуру, русскую жизнь. Выставка — наглядная иллюстрация того, как разные поколения художников осмысляют пушкинское наследие.', '2020-07-28 13:21:17', '2020-07-28 13:21:17'),
(372, 'posts', 'body', 7, 'en', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">6 июня в медиастудии павильона &laquo;Медиацентр&raquo; парка &laquo;Зарядье&raquo; прошла выставка&nbsp;&laquo;Пушкин наш, и&nbsp;всё!&raquo;, посвященная 220-летию со&nbsp;дня рождения А.&nbsp;С.&nbsp;Пушкина.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Многие художники обращались и обращаются к образу поэта, его творчеству, пытаются постичь феномен влияния гения Пушкина на русскую культуру, русскую жизнь. Выставка &mdash; наглядная иллюстрация того, как разные поколения художников осмысляют пушкинское наследие.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Свыше 70 работ 20-ти московских художников разных поколений, которых объединяет любовь к творчеству великого русского поэта и интерес к его личности.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Интересно, что в своих работах художники ведут прямой диалог с Пушкиным, моделируют различные жизненные ситуации, где поэт присутствует среди людей нашего времени.</p>', '2020-07-28 13:21:17', '2020-07-28 13:21:17'),
(373, 'posts', 'slug', 7, 'en', 'vystavka-pushkin-nash-i-vsyo', '2020-07-28 13:21:17', '2020-07-28 13:21:17'),
(374, 'posts', 'title', 8, 'en', 'Таинственная плесень на стене', '2020-07-28 13:21:45', '2020-07-28 13:21:45'),
(375, 'posts', 'excerpt', 8, 'en', 'Современное искусство – это вам не «Утро в сосновом бору» Шишкина и даже не «Чёрный квадрат» Малевича, его далеко не каждый поймёт. Да что уж там, его не каждый распознает. Стоит на выставке забор с нецензурным словом и не известно ещё, хулиганство это или экспонат.', '2020-07-28 13:21:45', '2020-07-28 13:21:45'),
(376, 'posts', 'body', 8, 'en', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Современное искусство &ndash; это вам не &laquo;Утро в сосновом бору&raquo; Шишкина и даже не &laquo;Чёрный квадрат&raquo; Малевича, его далеко не каждый поймёт. Да что уж там, его не каждый распознает. Стоит на выставке забор с нецензурным словом и не известно ещё, хулиганство это или экспонат.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Знаменитый теоретик искусства Эрнст Гомбрих высказывал мнение, что корректно определить художественную ценность какого-либо произведения можно лишь спустя 50 лет после его создания, а до того даже профессиональный искусствовед может ошибаться. Куда уж там простым любителям прекрасного, когда далеко не каждый знает, что &laquo;Утро в сосновом бору&raquo; написано Шишкиным совместно с Константином Савицким, а &laquo;Чёрных супрематических квадратов&raquo; у Малевича, как минимум, четыре, не считая ещё красного и белого, причём первый из чёрных долгое время висел в Третьяковской галерее вверх ногами.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">К современному искусству зачастую относятся с недоумением, с пренебрежением, со снисхождением или даже с усмешкой. Это нормально. Не к сожалению и не к счастью, просто нормально. Творческая мысль настоящего художника и должна лететь впереди других. Привычные и знакомые большинству людей культура и искусство &ndash; это хвост кометы настоящего художника. Мы в хвосте порой просто не можем представить себе, какой космос открывается перед глазами авангардного творца. Но ведь это не значит, что не должны даже пытаться представить. Тем более, что художник изо всех сил стремится этот свой космический взгляд передать в форме своих работ. Приди и смотри.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">2 сентября во Дворце культуры Российского университета транспорта прошло торжественное открытие арт-кластера</strong>, предварительно названного &laquo;Домом художника&raquo;. Да, гостей было не много. Да, ещё не все этажи работают. И да, не все из работающих помещений до конца отремонтированы. Но &laquo;когда б вы знали, из какого сора&raquo;&hellip; Великие произведения искусства уже очень давно рождаются не только и не столько в академических мастерских. Дворец культуры РУТ (МИИТ) открыл абсолютно уникальное арт-пространство. Ничего подобного в других вузах Москвы просто нет. И пока выпускники нашего университета строят пути земные и бороздят физические пространства, учащиеся и сотрудники могут свободно приобщиться к прокладыванию дорог вечности и постараться охватить космические объёмы духа. Описывать здесь экспозиции и мастерские не имеет смысла. Это как раз тот случай, когда надо хотя бы один раз увидеть. Но одна из работ содержит в себе фразу, которая отлично характеризует и культурную значимость, и авангардное направление, и качественное содержание, и сам старт работы арт-кластера: &laquo;Во имя Отца, и Сына, и Святого Духа. Огонь!&raquo;</p>\n<p><iframe src=\"https://www.youtube.com/embed/mQVruSjNH0E\" width=\"100%\" height=\"360\" frameborder=\"0\" allowfullscreen=\"\"></iframe></p>', '2020-07-28 13:21:45', '2020-07-28 13:21:45'),
(377, 'posts', 'slug', 8, 'en', 'tainstvennaya-plesen-na-stene', '2020-07-28 13:21:45', '2020-07-28 13:21:45'),
(378, 'posts', 'title', 5, 'en', '«АнтиБудни» современных художников', '2020-07-28 13:22:10', '2020-07-28 13:22:10'),
(379, 'posts', 'excerpt', 5, 'en', '14 апреля в арт-пространстве «Мастер-класс» (Фрунзенская набережная, 10) состоялось открытие коллективной выставки современных художников.', '2020-07-28 13:22:10', '2020-07-28 13:22:10');
INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(380, 'posts', 'body', 5, 'en', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">14 апреля в арт-пространстве &laquo;Мастер-класс&raquo; (Фрунзенская набережная, 10) состоялось открытие коллективной выставки современных художников. Экспозиция с символичным названием &laquo;<em style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">АнтиБудни</em>&raquo; продлится до 27 апреля. Посетить её совершенно бесплатно может любой желающий. А увидеть работы молодых художников своими глазами определённо стоит!&nbsp;<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Дело в том, что эта маленькая, но вполне уже &laquo;могучая кучка&raquo; творцов, состоящая из восьми человек, решила посвятить себя художественному ремеслу совсем недавно: люди, некоторое время назад получившие дипломы филологов, инженеров, экономистов, бухгалтеров, маркетологов, инженеров, учителей физики и математики &ndash; кардинально сменили сферу деятельности, заставили работать свои правые полушария и поступили в Московский государственный академический художественный институт имени В. И. Сурикова.&nbsp;<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" /><br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />Итак, три года назад было принято непростое решение, а уже сегодня у молодых живописцев состоялся маленький триумф. И пусть их работы пока не выставляются в Метрополитен-музее, но определённый шаг на пути творческой реализации эти люди точно сделали. В течение двух недель мы будем ближе знакомить вас с &laquo;героями&raquo; нашей выставки. Начнём с человека со звучной и очень аристократичной фамилией &ndash; Алексея Саввина. Журналист по первому образованию, кандидат филологических наук, Алексей в 30 лет сменил перо на кисть. В своем дипломном проекте &ndash; &laquo;Гольф-клуб зимой&raquo; &ndash; он объединил два больших увлечения: спорт и живопись.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Эти картины, ещё пахнущие маслом, вы сможете оценить, придя в галерею. А сегодня полюбуйтесь другой работой Алексея: &laquo;Деревенская проза&raquo; (2018 г.). От одного взгляда на полотно становится очень уютно. На нём, пусть и гиперболизированно, но всё же собраны главные атрибуты деревенского быта и избы: &laquo;курочка Ряба&raquo;, немагазинные яйца, краюшка свежеиспеченного хлеба, самовар, корзинка с яркими, разноцветными яблоками, колосья, серп&hellip; В эти предпасхальные недели такой натюрморт (за исключение Рябы, конечно) буквально наполняет теплотой и светом грядущего праздника&hellip;</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Участники выставки &ndash; люди, состоявшиеся в первой профессии, но не разучившиеся мечтать и стремиться к новым вершинам, все они познакомились, в МГАХИ им. Сурикова на отделении дополнительного профессионального образования.&nbsp; Первый в 2019 году выпуск ДПО МГАХИ им. Сурикова подарил новую специальность филологу, бухгалтеру, экономисту, маркетологу, инженеру, математику и учителюфизику.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\"><em style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Участники выставки:</em></strong></p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Кебал Екатерина</strong>&nbsp;не случайно выбрала тему дипломной работы &laquo;Старый сад&raquo; &mdash; почти все свое свободное время Екатерина проводит на пленэрах, черпая вдохновение в окружающей природе. Все пейзажи Екатерины выполнены в общей узнаваемой стилистике, которой присущи теплые тона, гармоничные сочетания красок и густой мазок.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Полунина Елена</strong>&nbsp;нашла свое вдохновение в поэзии московских улочек и, сама не успела заметить как, влюбилась в городской пейзаж. На выставке будут представлены ее работы на тему &laquo;Прогулки по Москве&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Саввин Алексей</strong>&nbsp;&mdash; журналист, кандидат филологических наук. В 30 лет решил, что пора сменить перо на кисть и поступил в МГАХИ имени Сурикова, где смог объединить два своих увлечения: спорт и живопись в дипломной работе &laquo;Гольф-клуб зимой&raquo;.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Лаврентьева Анна</strong>&nbsp;стала &laquo;певцом&raquo; профессии мужа-пианиста. Наблюдение и зарисовки за процессом подготовки любимого человека к концертам в домашней обстановке переродились в попытку передать торжественную атмосферу концертного зала и одиночество солиста на сцене.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Кузнецова Марина</strong>&nbsp;занималась живописью любительски, но желание учиться и совершенствоваться в любимом деле привели ее в МГАХИ им. Сурикова, и не зря. Ее работы о повседневной городской жизни умиротворяют, как будто ведут со зрителем спокойный диалог, рассказывая о своем сюжете.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Карабаш Екатерина</strong>&nbsp;&ndash; математик. Но разве скажешь это по ее работам? Скорее, наоборот, в работах отсутствует холодный расчет, все место занимает живопись.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Вязников Кирилл</strong>&nbsp;с самого раннего детства родители стремились привить Кириллу навыки рисования и тягу к искусству, но бунтарский отпрыск никак не желал идти по этому пути. Спустя время, что-то внутри перемкнуло и на последних курсах горно-инженерного образования, появилась тяга к искусству. Начав с рисунков гелевыми ручками и &laquo;заболев&raquo; иллюстрацией и графикой, взялся за живопись и на данный момент продолжает совершенствоваться во всех художественных техниках.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\"><strong style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Сосина Милана&nbsp;</strong>родилась и выросла в Москве. Диплом МГАХИ им. Сурикова стал ярким дополнением к дипломам Финансовой академии при Правительстве РФ и МГИМО. Её дипломная работа посвящена редким моментам рефлексии жителей в суете большого города.</p>\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Участники выставки совершенно разные люди из разных поколений, разных специальностей, но всех их объединяет одна дорога к творчеству.</p>', '2020-07-28 13:22:10', '2020-07-28 13:22:10'),
(381, 'posts', 'slug', 5, 'en', 'antibudni-sovremennyh-hudozhnikov', '2020-07-28 13:22:10', '2020-07-28 13:22:10'),
(385, 'posts', 'slug', 17, 'en', 'sem-ya-epple7', '2020-08-03 01:44:31', '2020-08-03 01:44:31'),
(386, 'menu_items', 'title', 78, 'en', 'Events', '2020-08-03 04:57:24', '2020-08-03 04:57:24'),
(387, 'data_rows', 'display_name', 219, 'en', 'Id', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(388, 'data_rows', 'display_name', 220, 'en', 'Title', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(389, 'data_rows', 'display_name', 221, 'en', 'Seo Title', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(390, 'data_rows', 'display_name', 222, 'en', 'Meta Description', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(391, 'data_rows', 'display_name', 223, 'en', 'Meta Keywords', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(392, 'data_rows', 'display_name', 224, 'en', 'Start', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(393, 'data_rows', 'display_name', 225, 'en', 'Finish', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(394, 'data_rows', 'display_name', 226, 'en', 'Excerpt', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(395, 'data_rows', 'display_name', 227, 'en', 'Body', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(396, 'data_rows', 'display_name', 228, 'en', 'Image', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(397, 'data_rows', 'display_name', 229, 'en', 'Images', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(398, 'data_rows', 'display_name', 230, 'en', 'Status', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(399, 'data_rows', 'display_name', 231, 'en', 'Created At', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(400, 'data_rows', 'display_name', 232, 'en', 'Updated At', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(401, 'data_rows', 'display_name', 233, 'en', 'spaces', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(402, 'data_types', 'display_name_singular', 25, 'en', 'Event', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(403, 'data_types', 'display_name_plural', 25, 'en', 'Events', '2020-08-03 05:19:00', '2020-08-03 05:19:00'),
(404, 'data_rows', 'display_name', 234, 'en', 'Space Id', '2020-08-03 05:20:59', '2020-08-03 05:20:59'),
(405, 'menu_items', 'title', 79, 'en', 'Experts', '2020-08-03 06:37:56', '2020-08-03 06:37:56'),
(406, 'data_rows', 'display_name', 235, 'en', 'Id', '2020-08-03 06:39:27', '2020-08-03 06:39:27'),
(407, 'data_rows', 'display_name', 237, 'en', 'Анонс', '2020-08-03 06:39:27', '2020-08-03 06:39:27'),
(408, 'data_rows', 'display_name', 238, 'en', 'Фото', '2020-08-03 06:39:27', '2020-08-03 06:39:27'),
(409, 'data_rows', 'display_name', 239, 'en', 'Created At', '2020-08-03 06:39:27', '2020-08-03 06:39:27'),
(410, 'data_rows', 'display_name', 240, 'en', 'Updated At', '2020-08-03 06:39:27', '2020-08-03 06:39:27'),
(411, 'data_types', 'display_name_singular', 26, 'en', 'Expert', '2020-08-03 06:39:27', '2020-08-03 06:39:27'),
(412, 'data_types', 'display_name_plural', 26, 'en', 'Experts', '2020-08-03 06:39:27', '2020-08-03 06:39:27'),
(413, 'data_rows', 'display_name', 241, 'en', 'Name', '2020-08-03 06:39:54', '2020-08-03 06:39:54'),
(414, 'data_rows', 'display_name', 242, 'en', 'Lastname', '2020-08-03 06:39:54', '2020-08-03 06:39:54'),
(415, 'menu_items', 'title', 80, 'en', 'Users', '2020-08-03 06:41:40', '2020-08-03 06:41:40'),
(416, 'lots', 'title', 42, 'en', 'Букет на зеленом фоне', '2020-08-03 09:56:22', '2020-08-03 09:56:22'),
(417, 'lots', 'title', 43, 'en', 'Веселая зима', '2020-08-03 10:26:36', '2020-08-03 10:26:36'),
(419, 'spaces', 'title', 5, 'en', 'Акт-Арт Пречистенка', '2020-08-03 10:28:48', '2020-08-03 10:28:48'),
(420, 'spaces', 'title', 2, 'en', 'Акт-Арт Пречистенка', '2020-08-03 10:29:42', '2020-08-03 10:29:42'),
(421, 'menu_items', 'title', 81, 'en', 'News', '2020-08-03 11:10:43', '2020-08-03 11:10:43'),
(422, 'events', 'title', 1, 'en', 'Выставка посвященная дню железнодорожника', '2020-08-04 04:04:23', '2020-08-04 04:04:23'),
(423, 'events', 'excerpt', 1, 'en', 'Живопись. Графика. Плакат.', '2020-08-04 04:04:23', '2020-08-04 04:04:23'),
(424, 'events', 'body', 1, 'en', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">Живопись. Графика. Плакат. Посвящённо истории железнодорожного транспорта.</span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">Открытие состоялось 31 июля в 14:00.</span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">&nbsp;</span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">Выставка работает по будням с 12 до 16 часов.<br />Вход бесплатный.</span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit;\"><span style=\"color: #000000; font-family: Open Sans Condensed Light, Arial, sans-serif;\">ДК РУТ (МИИТ) 2 этаж, Белый зал.</span></p>', '2020-08-04 04:04:23', '2020-08-04 04:04:23'),
(425, 'posts', 'title', 24, 'en', '«СЕМЬЯ» Эппле', '2020-08-06 05:19:00', '2020-08-06 05:19:00'),
(426, 'posts', 'excerpt', 24, 'en', 'Художник без публики состояться не сможет. Открытие нашего пространства выставкой с символичным названием Семья не случайна. Семья - это не только общность людей, связанных кровными узами, а более емкое понятие.', '2020-08-06 05:19:00', '2020-08-06 05:19:00'),
(427, 'posts', 'body', 24, 'en', '<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Художник без публики состояться не сможет. Открытие нашего пространства выставкой с символичным названием Семья не случайна. Семья - это не только общность людей, связанных кровными узами, а более емкое понятие. Семья &mdash; это группа людей, объединенных одной общей идеей, общим делом, одним общим домом, где всем вместе хорошо и уютно, где каждый член семьи поддерживает другого, в нужный момент протягивает руку помощи. Эта дружеская поддержка позволяет уверенно идти по жизни, покорять новые вершины в профессиональном и житейском плане. Этими нехитрыми принципами мы и будем<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />руководствоваться в нашей предстоящей работе.</p>\r\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">В семье художников Леонида Эппле и Ольги Волгиной-Эппле подрастают четыре замечательные дочери &mdash; Софья, Евгения, Елизавета и Анна. Дети унаследовали заразительный ген творчества. Старшая Софья &mdash; студентка кино колледжа, осваивает профессию фотографа, кинорежиссера. Евгения &mdash; одна из лучших учениц Московского Академического художественного лицея при институте им. Сурикова. Елизавета и Анна выступают в фольклорном танцевальном ансамбле. Отец семейства &mdash; Леонид Эппле учился в художественно-промышленной академии им. Строганова, известный московский живописец, реставратор, резчик по дереву, участник многочисленных выставок в России и за рубежом, его работы находятся в личных коллекциях по всему миру &mdash; Германии, Дании, Израиле, США, Мексике, Испании и др. странах. Мама &mdash; Ольга Волгина-Эппле &mdash; по образованию художник-график. Занимается оформление книг, преподавательской деятельностью. В последнее время уделяет много времени живописи. Вырабатывает свой неповторимый художественный почерк. Работы пользуются большой популярностью у публики Евгения делает первые шаги в искусстве. Многие специалисты отмечают ее незаурядные способности, ее графические листы по-взрослому профессиональны, отличаются любовью к<br style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\" />изображению деталей, образны, композиционно целостны.</p>\r\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; margin: 0px 0px 1rem !important 0px;\">Все члены этой большой и дружной семьи не мыслят себя вне искусства.</p>\r\n<p style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; font-size: 18px; line-height: 1.5; text-rendering: optimizelegibility; font-family: \'Istok Web\', sans-serif; color: #545454; text-align: right; margin: 0px 0px 1rem !important 0px;\"><em style=\"box-sizing: inherit; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); line-height: inherit;\">Ю. Ланглебен</em></p>', '2020-08-06 05:19:00', '2020-08-06 05:19:00'),
(428, 'posts', 'title', 32, 'en', '1', '2020-08-06 06:53:32', '2020-08-06 06:53:32'),
(429, 'posts', 'body', 32, 'en', '<p>1</p>', '2020-08-06 06:53:32', '2020-08-06 06:53:32'),
(430, 'auctions', 'title', 6, 'en', 'Название ru', '2020-08-09 13:02:12', '2020-08-09 13:02:12'),
(431, 'auctions', 'sublime', 6, 'en', 'Краткое описание ru', '2020-08-09 13:02:12', '2020-08-09 13:02:12'),
(432, 'auctions', 'text', 6, 'en', 'Развернутое описание ru', '2020-08-09 13:02:12', '2020-08-09 13:02:12'),
(433, 'auctions', 'header_text', 6, 'en', 'Текст шапки', '2020-08-09 13:02:12', '2020-08-09 13:02:12'),
(434, 'auctions', 'announce_text', 6, 'en', 'Текст анонса', '2020-08-09 13:02:12', '2020-08-09 13:02:12'),
(435, 'posts', 'excerpt', 32, 'en', 'Небольшой репортаж с открытия тематической росписи фасадной стены административного корпуса и выставки, посвящённой истории железнодорожного транспорта', '2020-08-09 13:10:51', '2020-08-09 13:10:51'),
(436, 'data_rows', 'display_name', 22, 'en', 'ID', '2020-08-15 01:54:25', '2020-08-15 01:54:25'),
(437, 'data_rows', 'display_name', 27, 'en', 'Дата создания', '2020-08-15 01:54:25', '2020-08-15 01:54:25'),
(438, 'data_rows', 'display_name', 28, 'en', 'Дата обновления', '2020-08-15 01:54:25', '2020-08-15 01:54:25'),
(439, 'data_types', 'display_name_singular', 4, 'en', 'Категория', '2020-08-15 01:54:25', '2020-08-15 01:54:25'),
(440, 'data_types', 'display_name_plural', 4, 'en', 'Категории', '2020-08-15 01:54:25', '2020-08-15 01:54:25'),
(441, 'data_rows', 'display_name', 243, 'en', 'Title', '2020-08-15 01:56:36', '2020-08-15 01:56:36'),
(442, 'data_rows', 'display_name', 244, 'en', 'Image', '2020-08-15 01:56:36', '2020-08-15 01:56:36'),
(443, 'categories', 'title', 1, 'en', 'Painting', '2020-08-15 02:15:22', '2020-08-15 02:15:22'),
(444, 'events', 'title', 2, 'en', 'V ежегодный международный фестиваль «Абстракция без границ»', '2020-08-18 05:55:33', '2020-08-18 05:55:33'),
(445, 'posts', 'title', 33, 'en', 'Наше арт-пространство глазами выпускниц британской высшей школы дизайна', '2020-08-18 06:25:33', '2020-08-18 06:25:33'),
(446, 'posts', 'excerpt', 33, 'en', 'Это одно крыло Двореца культуры РУТ (МИИТ), на Новосущевском переулке. 6 этажей были отданы нам на растерзание под создание арт-пространства.', '2020-08-18 06:25:33', '2020-08-18 06:25:33'),
(447, 'posts', 'body', 33, 'en', '<p>Проект для создания нового арт-пространства \"Арт-кластер \"Дом художника\".</p>\n<p>Авторы: <strong>Anna Golovina и Ola Chumakova</strong>.</p>\n<p>&nbsp;</p>\n<p><em>Это одно крыло Двореца культуры РУТ (МИИТ), на Новосущевском переулке.&nbsp;</em></p>\n<p><em>6 этажей были отданы нам на растерзание под создание арт-пространства.</em></p>\n<p>&nbsp;</p>\n<p><strong>1 этаж.</strong> Бар-галерея с офисом, где можно провести неформальную встречу и приобрести произведения искусства.</p>\n<p>&nbsp;</p>\n<p><strong>2 этаж.</strong> Выставочная галерея. С конструкциями собственного дизайна из перфорированного металла.&nbsp;</p>\n<p>&nbsp;</p>\n<p><strong>3 и 4 этажи.</strong> Отданы под мастерские резидентам Арт-кластера. Мы представили пример одной из них, считая, что каждый - художник, и сможет внести в свое пространство частицу себя и своего вдохновения.</p>\n<p>&nbsp;</p>\n<p><strong>5 и 6 этажи.</strong> Мини театр. Где можно всё, всё что угодно.</p>', '2020-08-18 06:25:33', '2020-08-18 06:25:33'),
(448, 'posts', 'title', 34, 'en', 'ФОТО-отчёт с выставки, посвящённой истории железнодорожного транспорта', '2020-08-19 05:37:42', '2020-08-19 05:37:42'),
(449, 'posts', 'excerpt', 34, 'en', 'Фото с открытия выставки, посвящённой истории железнодорожного транспорта, где представлены разделы живописи, графики, плаката.', '2020-08-19 05:37:42', '2020-08-19 05:37:42'),
(450, 'posts', 'body', 34, 'en', '<p>Фото с открытия выставки, посвящённой истории железнодорожного транспорта, где представлены разделы живописи, графики, плаката.</p>', '2020-08-19 05:37:42', '2020-08-19 05:37:42'),
(451, 'menu_items', 'title', 83, 'en', 'Blog', '2020-08-23 02:44:57', '2020-08-23 02:44:57'),
(452, 'menu_items', 'title', 84, 'en', 'Blog', '2020-08-23 02:45:54', '2020-08-23 02:45:54'),
(453, 'data_rows', 'display_name', 245, 'en', 'Space Id', '2020-08-23 05:30:03', '2020-08-23 05:30:03'),
(454, 'events', 'body', 2, 'en', '<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Открытие состоится 15 августа во Дворце культуры РУТ (МИИТ)<br style=\"box-sizing: border-box;\" />Сбор гостей в 18.00<br style=\"box-sizing: border-box;\" />Открытие: в 19.00<br style=\"box-sizing: border-box;\" />Перформанс: в 20.00<br style=\"box-sizing: border-box;\" /><span style=\"box-sizing: border-box; color: #ff0000;\"><strong style=\"box-sizing: border-box;\">Маски и перчатки обязательно!</strong></span></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Фестиваль проводится при содействии: IMDR art gallery, &laquo;David Ru Foundation&raquo;, ТСХР, Галерея современного искусства ГМИИ РТ, Координационный центр Поволжского отделения Российской академии художеств, газета ТСХР<br style=\"box-sizing: border-box;\" />При поддержке: журналов, газет, телерадиокомпаний</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Наблюдая последние тенденции в науке и жизни, приходишь к выводу, что практически нет ничего невозможного для современного человека. Он уже может менять свою внешность практически до полной неузнаваемости. Лепит своё тело и пространство вокруг него. Вот тут и возникает вопрос. Что же останется стержнем-остовом, соединяющим нас, ныне живущих, с прошлыми и будущими поколениями? Что будет определять наше сознание и поступки? Символы веры и слова останутся навечно. Может, названия их будут меняться, но графические изображения-символы останутся, и сквозь них будет продолжать вещать эталонный поток знаний. Символ не только узнаваемый силуэт &mdash; это и цвет, и фактура, и запах, и звук. Вообще это средство, с помощью которого можно универсально понятно и полно донести информацию до адресата. Сообщение о чувствах и переживаниях. Картину, отображающую внутреннюю, духовную жизнь. От одного создания к другому, обогащая его внутренне, привнося новые краски в настоящее. Весь нынешний прогресс науки ведет к более качественным сверхчувствительным способам передачи информации. Но что может сравниться с человеческими чувствами и способностью сопереживать? Так, самое главное &mdash; развивать эту способность, а самый верный способ &mdash; это участвовать в творческом процессе посредством переживания-осмысления творчества художников. Строить неразрывную структуру связи духа.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Мир, где мы живем, &mdash; просто коллективная визуализация.</strong></p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Собственно говоря, это то, единственное, что одно поколение передает другому. Но какие бы формы ни были нам предписаны прошлым, на самом деле, каждый из нас все равно видит в жизни только отражение своего собственного я.<br style=\"box-sizing: border-box;\" />Абстракция &mdash; это та система координат, которая позволяет отталкиваться в пространстве и возвращаться обратно новом качестве, при этом меняясь, остается абстрактной.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">ТЕАТР ЖИВОПИСИ в рамках проекта &laquo;Абстракция без границ&raquo;:</strong><br style=\"box-sizing: border-box;\" />Куратор проекта Давид Ру, Ирина Матинян (США),<br style=\"box-sizing: border-box;\" />Николай Попов (Россия)<br style=\"box-sizing: border-box;\" />Участники проекта: Давид Ру. Эндрю Квин (Италия). Ирина Матинян (США). Евгений Ципулин. Ирина Уварова. Николай Попов. Грант Гарибян. Мария Градова, Александр Соколов, Федор Архипов.<br style=\"box-sizing: border-box;\" />Музыка: Николай Попов.<br style=\"box-sizing: border-box;\" />Видеохудожники: Эндрю Квинн (Италия),<br style=\"box-sizing: border-box;\" />Ирина Матинян (США), Рэм Квадрига (Россия)<br style=\"box-sizing: border-box;\" />Художник, перформер: Давид Ру, Ирина Матинян (США), Мария Градова.<br style=\"box-sizing: border-box;\" />Музыканты:<br style=\"box-sizing: border-box;\" />Алексей Наджаров (клавишные, электроника) (Россия)<br style=\"box-sizing: border-box;\" />Юрий Яремчук (саксофон) (Россия)<br style=\"box-sizing: border-box;\" />Алексей Потапов (гитара) (Россия)<br style=\"box-sizing: border-box;\" />Басем Аль &mdash; Ашкар (скрипка, уд) (Россия)</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">При поддержке: центра электроакустической музыки Московской консерватории и центра современной музыки Московской консерватории</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">По итогам фестиваля выпускается бюллетень фестиваля, включающий обзоры событий, аналитику, избранные работы художников, тенденции.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\"><strong style=\"box-sizing: border-box;\">Участники проекта:</strong><br style=\"box-sizing: border-box;\" />Мюриэль Массан (Франция),<br style=\"box-sizing: border-box;\" />Сигал Рон (Израиль),<br style=\"box-sizing: border-box;\" />Мириана Савова (Болгария),<br style=\"box-sizing: border-box;\" />Марино Россетти (Италия),<br style=\"box-sizing: border-box;\" />Светла Радулова (Болгария),<br style=\"box-sizing: border-box;\" />Трейси Хэнсон (США),<br style=\"box-sizing: border-box;\" />Кванг Мо Гу (Южная Корея),<br style=\"box-sizing: border-box;\" />Давид Бабаян (Россия)<br style=\"box-sizing: border-box;\" />Алексей Кузнецов (Россия)<br style=\"box-sizing: border-box;\" />Франко Шиуско (Италия),<br style=\"box-sizing: border-box;\" />Чезаре Сачченти (Италия),<br style=\"box-sizing: border-box;\" />Мамабрил Фуэревентура (Испания),<br style=\"box-sizing: border-box;\" />Ирина Уварова (Россия)<br style=\"box-sizing: border-box;\" />Вивьен Груйе (Канада),<br style=\"box-sizing: border-box;\" />Елена Драгулелей (Румыния),<br style=\"box-sizing: border-box;\" />Евгений Ципулин (Россия),<br style=\"box-sizing: border-box;\" />Джина Нинкович (Турция),<br style=\"box-sizing: border-box;\" />Вольфганг Кале (Германия),<br style=\"box-sizing: border-box;\" />Константин Худяков (Россия)<br style=\"box-sizing: border-box;\" />Артуро Пачеко Луго (Мексика),<br style=\"box-sizing: border-box;\" />Антонио Сан Мартин (Испания),<br style=\"box-sizing: border-box;\" />Ричард Форстер (США),<br style=\"box-sizing: border-box;\" />Кенрио Хара (Япония),<br style=\"box-sizing: border-box;\" />Грант Гарибян (Россия),<br style=\"box-sizing: border-box;\" />Федор Архипов (Россия),<br style=\"box-sizing: border-box;\" />Ирина Матинян (США),<br style=\"box-sizing: border-box;\" />Александр Соколов (Россия),<br style=\"box-sizing: border-box;\" />Давид Ру (Россия),<br style=\"box-sizing: border-box;\" />Юра Арутюнян (Армения),<br style=\"box-sizing: border-box;\" />Николай Попов (Россия),<br style=\"box-sizing: border-box;\" />Эндрю Квин (Италия),<br style=\"box-sizing: border-box;\" />Николай Куняев (Россия),<br style=\"box-sizing: border-box;\" />Максим Демин (Россия),<br style=\"box-sizing: border-box;\" />Эччи Ааберг (Швеция),<br style=\"box-sizing: border-box;\" />Шахнила Мугиз (Оман),<br style=\"box-sizing: border-box;\" />Рашид Бахри (Испания),<br style=\"box-sizing: border-box;\" />Евгений Моргунов (Россия)<br style=\"box-sizing: border-box;\" />Руслан Гудиев (Россия)<br style=\"box-sizing: border-box;\" />Юрий Ланглебен (Россия)<br style=\"box-sizing: border-box;\" />Артурас Акопянс (Латвия)<br style=\"box-sizing: border-box;\" />Валерий Колотвин(Россия)<br style=\"box-sizing: border-box;\" />Константин Марков (Россия)<br style=\"box-sizing: border-box;\" />Марина Колотвина (Россия)<br style=\"box-sizing: border-box;\" />Константин Егоров (Россия)</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Телефон для справок: +7 958 803 16 30<br style=\"box-sizing: border-box;\" />ru-david@yandex.ru<br style=\"box-sizing: border-box;\" />Адрес: Новосущевский пер., д.,6, стр.1.</p>\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; line-height: inherit; color: #000000; font-family: \'Open Sans Condensed Light\', Arial, sans-serif;\">Фестиваль продлится до 31 августа 2020 года,&nbsp;<strong style=\"box-sizing: border-box;\">вход свободный</strong>.<br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box;\">*При посещении выставки организаторы мероприятия обращают внимание на необходимость использования индивидуальных средств защиты.</em></p>', '2020-08-23 05:30:49', '2020-08-23 05:30:49'),
(455, 'lots', 'title', 23, 'en', 'Без названия 2', '2020-08-27 06:18:13', '2020-08-27 06:18:13'),
(456, 'spaces', 'address', 2, 'en', 'Пречистенка, 24', '2020-09-25 10:51:07', '2020-09-25 10:51:07'),
(457, 'events', 'title', 5, 'en', 'Выставка художницы-керамистки Ольги Артемовой', '2020-09-25 10:52:01', '2020-09-25 10:52:01'),
(458, 'events', 'excerpt', 5, 'en', 'Что привлекает нас в произведениях искусства? Что заставляет рассматривать мельчайшие детали, желая прикоснуться к формам, изгибам и тонкому цветовому решению?', '2020-09-25 10:52:01', '2020-09-25 10:52:01'),
(459, 'events', 'body', 5, 'en', '<p><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">Что привлекает нас в произведениях искусства? Что заставляет рассматривать мельчайшие детали, желая прикоснуться к формам, изгибам и тонкому цветовому решению?</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">Есть замечательные слова: &laquo;Искусство заключается в том, чтобы найти необыкновенное в обыкновенном и обыкновенное в необыкновенном&raquo;. Кажется, именно они соответствуют работам известной московской художницы-керамистки Ольги Артемовой.</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">24 сентября в выставочном пространстве Мастер-класс галереи ВСЕКОХУДОЖНИК при поддержке Культурного Центра Мосарт открывается персональная выставка художницы, в чьем творчестве сочетаются душевная теплота лубочных сюжетов и богатые традиции русского фаянса.</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">Работы Ольги Васильевны находятся в фондах Государственного музея-заповедника Царицыно, Брянского художественного музея, Союза художников России, Музея русского искусства в Японии, частных коллекциях в России и за рубежом. И везде они заслужили высокое признание и любовь публики. Все, к чему прикасается рука художника, становится самобытным произведением искусства. Брутальность, яркий пластический язык, оптимистический настрой, мягкая ирония, шутливость &ndash; отличительные черты работ мастера.</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">На выставке будут представлены скульптуры малых форм, декоративные тарелки и предметы быта.</span><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><br style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\" /><span style=\"color: #000000; font-family: -apple-system, BlinkMacSystemFont, Roboto, \'Open Sans\', \'Helvetica Neue\', \'Noto Sans Armenian\', \'Noto Sans Bengali\', \'Noto Sans Cherokee\', \'Noto Sans Devanagari\', \'Noto Sans Ethiopic\', \'Noto Sans Georgian\', \'Noto Sans Hebrew\', \'Noto Sans Kannada\', \'Noto Sans Khmer\', \'Noto Sans Lao\', \'Noto Sans Osmanya\', \'Noto Sans Tamil\', \'Noto Sans Telugu\', \'Noto Sans Thai\', sans-serif; font-size: 13px;\">Выставка открыта для посетителей с 24 сентября по 8 октября 2020 года.</span></p>', '2020-09-25 10:52:01', '2020-09-25 10:52:01'),
(460, 'spaces', 'address', 1, 'en', 'Новосущевский пер., дом 6 стр. 1', '2020-09-25 10:55:36', '2020-09-25 10:55:36'),
(461, 'spaces', 'title', 3, 'en', 'Акт-Арт Солянка ', '2020-09-28 09:40:21', '2020-09-28 09:40:21'),
(462, 'spaces', 'address', 3, 'en', 'Россия, Москва, улица Новый Арбат, 32', '2020-09-28 09:40:21', '2020-09-28 09:40:21'),
(463, 'data_rows', 'display_name', 246, 'en', 'Статус', '2020-09-29 03:05:09', '2020-09-29 03:05:09'),
(464, 'lots', 'title', 11, 'en', 'Сладкий стол', '2020-09-29 07:34:58', '2020-09-29 07:34:58'),
(465, 'lots', 'title', 13, 'en', 'Источник', '2020-09-29 07:35:12', '2020-09-29 07:35:12'),
(466, 'lots', 'title', 30, 'en', 'Серый шум 4 ', '2020-09-29 07:36:31', '2020-09-29 07:36:31'),
(467, 'lots', 'title', 31, 'en', 'Серый шум 5', '2020-09-29 07:36:43', '2020-09-29 07:36:43'),
(468, 'lots', 'title', 32, 'en', 'Без названия 1', '2020-09-29 07:45:36', '2020-09-29 07:45:36'),
(469, 'lots', 'title', 33, 'en', 'Без названия 2', '2020-09-29 07:45:48', '2020-09-29 07:45:48');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `middlename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `fb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inst` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `beh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ban` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `phone`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `middlename`, `surname`, `year`, `text`, `fb`, `inst`, `beh`, `ban`) VALUES
(1, 1, 'Максим', 'pimax1978@icloud.com', NULL, 'users/June2020/Rm3o7CSfhn8BQDVjvMqV.jpg', NULL, '$2y$10$0TMXDkDv3Tz9G8at3djWL.Z84s1d6f0S0KPP3Gy1A6roFO65ab4RS', '0t2YjzYy7DKhMu9vpaniggLnxoIiCPqmw7dWbLQixI1rzUu4elokuuhEElyJ', '{\"locale\":\"ru\"}', '2020-05-21 04:07:49', '2020-06-12 07:38:45', 'Иванович', 'Иванов', 2342, '<p>фыкпаиывапмывам</p>', 'asdgfnhdfgf', 'sdfgsdfgsd', 'fgsdfgsdfgsdfg', 0),
(7, 3, 'Александр', 'author2@act-art.ru', NULL, 'users/June2020/i0rmTN6W8AfErS6P5yvW.jpeg', NULL, '$2y$10$WKvc.pRjJAkJRBXYPp2fd.Clb0SHY0Xp/yhghnfs5Fxf3yMq7wpvy', NULL, '{\"locale\":\"ru\"}', '2020-06-15 10:03:45', '2020-06-15 10:46:02', '', 'Дедушев', 1966, '<pre class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Участник более 100 выставок в России и за рубежом. Провел двадцать три персональных выставки. Принимал участие в аукционах Arkol (Франция), Совком (Москва), а так же в благотворительных аукционах &laquo;Operation Smile&raquo;, &laquo;Dreams&raquo;,&nbsp;&nbsp;&laquo;Operations Hope&raquo; при поддержке &laquo;Sotheby&rsquo;s&raquo;,&nbsp;&nbsp;&laquo;Christie&rsquo;s&raquo;, &laquo;de Pury &amp; Luxembourg&raquo;. Неоднократно участвовал в &laquo;Арт-Манеж&raquo;, &laquo;Арт-Москва&raquo;.<br /><br />Работы художника находятся в собрании : Тамбовского художественного музея, Худ. Фонд РФ, коллекции &laquo;Усадьбы Зубовых&raquo;, &laquo;Восточной&nbsp;&nbsp;галерее&raquo; (Москва), галерее &laquo;Герцева&raquo; (Москва), галерее &laquo;Статус Кросна&raquo; (Москва),&nbsp;&nbsp;частной&nbsp;&nbsp;коллекции&nbsp;&nbsp;Manning Goodwin (Лондон); корпоративных коллекциях: &laquo;Price Waterhouse Coopers&raquo;, &laquo;Hotel Estrel&raquo; (Berlin), &laquo;Газпром&raquo;, &laquo;Русал&raquo; и в других частных коллекциях России, Германии, Англии, Бельгии, Франции, США.<br /><br /><span class=\"color11\">ГРУППОВЫЕ ВЫСТАВКИ</span><br /><span class=\"color11\">1989 &ndash; 18-я&nbsp; выставка&nbsp; молодых&nbsp; художников, Манеж, Москва.</span><br /><span class=\"color11\">1989 &ndash; &laquo;Весна 89&raquo;, Кузнецкий мост,&nbsp; Москва.</span><br /><span class=\"color11\">1991 &ndash;&nbsp; &laquo;Молодость&nbsp; России&raquo;, ЦДХ, Москва.</span><br /><span class=\"color11\">1992 &ndash; &laquo;Арт- Базель&raquo;, Швейцария, галерея &laquo;Фактура&raquo; (Москва),&nbsp; галерея&nbsp; &laquo;Николай и сын&raquo;&nbsp; (Германия).</span><br /><span class=\"color11\">1993 &ndash; Галерея &laquo;Атриум&raquo;. ЦДХ. Москва.</span><br /><span class=\"color11\">1993 &ndash; &laquo;Арт- Франкфурт&raquo;,&nbsp; галерея &laquo;Фактура&raquo;,&nbsp; (Москва),&nbsp; галерея&nbsp;&nbsp; &laquo;Николай&nbsp; и&nbsp; сын&raquo;, (Германия).&nbsp;</span><br /><span class=\"color11\">1993 &ndash; Аукцион &laquo;Арколь&raquo;,&nbsp; галерея&nbsp; &laquo;Нормандия&raquo;,&nbsp; Канн,&nbsp; Байо,&nbsp; Руан,&nbsp; Франция.</span><br /><span class=\"color11\">1994 &ndash; Из&nbsp; коллекции&nbsp; галереи&nbsp; &laquo;Герцев&raquo;, ЦДХ,&nbsp; Москва.</span><br /><span class=\"color11\">1994 &ndash; &laquo;Осень 94&raquo;,&nbsp; Кузнецкий мост, Москва.</span><br /><span class=\"color11\">1994 &ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">1996 &ndash; Проект&nbsp;&nbsp; &laquo;Hotel Estrel&raquo;,&nbsp; Берлин. (живопись, графика).</span><br /><span class=\"color11\">1996 &ndash; Выставка&nbsp; совместно&nbsp; с&nbsp; В. Шелеховым&nbsp; в&nbsp; Rathaus&nbsp; Goldbach,&nbsp; Германия.</span><br /><span class=\"color11\">1996 &ndash; Международный &laquo;Арт-салон&raquo;,&nbsp; ЦДХ,&nbsp;&nbsp; Москва.</span><br /><span class=\"color11\">1996</span><span class=\"color11\"><span lang=\"EN-US\">&nbsp;-&nbsp;</span>&nbsp;&laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">1994 &ndash;&nbsp; &laquo;Над&nbsp; небом&nbsp; голубым&raquo;,&nbsp; гостиница&nbsp; &laquo;Рэдиссон-Славянская&raquo;, Москва.</span><br /><span class=\"color11\">1988 &ndash; &laquo;Сон Венеры&raquo;, Восточная&nbsp; галерея,&nbsp; Москва.</span><br /><span class=\"color11\">1998 &ndash; Международный&nbsp; &laquo;Арт - салон&raquo;,&nbsp; ЦДХ,&nbsp;&nbsp; Москва.</span><br /><span class=\"color11\">1998 &ndash; &laquo;Пестрый&nbsp; Мир&raquo;,&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">1999&ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">1999&nbsp; &ndash; &laquo;Арт-салон&raquo;,&nbsp; проект&nbsp; &laquo;Чай&raquo;,&nbsp; ЦДХ, Москва.</span><br /><span class=\"color11\">1999&ndash; Аукцион &laquo;Operation Smile&raquo;, при поддрежке &laquo;Sotheby&rsquo;s&raquo;, Малый&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">1999 &ndash; &laquo;Тет-а-тет&raquo;,&nbsp; ЦДХ,&nbsp; Москва.</span><br /><span class=\"color11\">2000</span><span class=\"color11\">&nbsp;&ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">2001 &ndash; &laquo;Территория&nbsp; счастья&raquo;,&nbsp; ЦДХ, Москва.</span><br /><span class=\"color11\">2001 &ndash; Аукцион &laquo;Operation Smile&raquo; при&nbsp; поддержке&nbsp; &laquo;de Pury &amp; Luxembourg&raquo;,&nbsp; Малый&nbsp;&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">2001 &ndash; &laquo;25-я&nbsp; молодежная&raquo;,&nbsp;&nbsp; Кузнецкий&nbsp;&nbsp;&nbsp; мост,&nbsp;&nbsp; Москва.</span><br /><span class=\"color11\">2002 &ndash; Аукцион &laquo;Operation Smile&raquo; при&nbsp; поддержке&nbsp; &laquo;de Pury &amp; Luxembourg&raquo;,&nbsp; Малый&nbsp;&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">2003 &ndash; &laquo;Антитеррор&raquo; Галерея Кентавр, Москва.</span><br /><span class=\"color11\">2003&ndash; Аукцион &laquo;Operation Smile&raquo;, при поддрежке &laquo;Sotheby&rsquo;s&raquo;, Малый&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">2003 &ndash; &laquo;Лучшие художественные галереи&raquo;, Инфо-пространство, Москва.</span><br /><span class=\"color11\">2003&ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">2004 &ndash; Lux Art-Salon , Т-Модуль Тишинка, Москва.</span><br /><span class=\"color11\">2004&ndash; Аукцион &laquo;Operation Smile&raquo;, при поддрежке &laquo;Sotheby&rsquo;s&raquo;, Малый&nbsp; Манеж,&nbsp; Москва.</span><br /><span class=\"color11\">2004 &ndash; Art Moscow, ЦДХ, Москва.</span><br /><span class=\"color11\">2004 &ndash; &laquo;Лучшие художественные галереи&raquo;, Инфо-пространство, Москва.</span><br /><span class=\"color11\">2004 &ndash;&nbsp; &laquo;Золотая кисть&raquo;, Малый манеж, Москва.</span><br /><span class=\"color11\">2005 &ndash; Art Moscow, ЦДХ, Москва.</span><br /><span class=\"color11\">2005&nbsp;&nbsp;&ndash; Благотворительный аукцион &laquo; Operation Smile &raquo;, при поддержке &laquo;Christie&rsquo;s&raquo;, Москва.&nbsp;</span><br /><span class=\"color11\">2006&nbsp;&nbsp;&ndash; Благотворительный аукцион &laquo;Операция надежда&raquo;,&nbsp; Москва.</span><br /><span class=\"color11\">2006&nbsp;&nbsp;&ndash; &laquo;Мир живописи&raquo;. ЦДХ. Москва.</span><br /><span class=\"color11\">2006 &ndash; &laquo;Обнаженная Россия&raquo;. ТВЦ-Тишинка. Москва.</span><br /><span class=\"color11\">2007&ndash; Благотворительный аукцион &laquo;Dreams&raquo; при поддержке &laquo;BBC&raquo; Москва.</span><br /><span class=\"color11\">2007 &ndash;&nbsp; &laquo;Четверо из Москвы&raquo; Sun Valley Idaho, Charlotte, North Carolina, Америка.</span><br /><span class=\"color11\">2007 &ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">2007 &ndash; Аукцион &laquo;Совком&raquo; №46 &laquo;50/50. Соцреализм - другое искусство&raquo;, Москва.&nbsp;</span><br /><span class=\"color11\">2008 &ndash; Аукцион &laquo;Совком&raquo; №67 &laquo;50/50. Соцреализм - другое искусство&raquo;, Москва.</span><br /><span class=\"color11\">2008 - Благотворительный аукцион &laquo;Dreams&raquo; при поддержке &laquo;BBC&raquo; Москва.</span><br /><span class=\"color11\">2010 &ndash; &laquo;Худ-Граф&raquo; Малый манеж. Москва.</span><br /><span class=\"color11\">2010&ndash; Благотворительный аукцион &laquo; Operation Smile &raquo;, при поддержке &laquo;Christie&rsquo;s&raquo;, Москва.&nbsp;</span><br /><span class=\"color11\">2010 &ndash; &laquo;Мир живописи&raquo;. ЦДХ. Москва.</span><br /><span class=\"color11\">2010 &ndash; &laquo;Свет Ангелов&raquo; Галерея Светланы Сажиной. Москва.</span><br /><span class=\"color11\">2010 &ndash; Аукцион &laquo;The St. Andrew Society&raquo;, Отель Марриотт. Москва.</span><br /><span class=\"color11\">2011&ndash;&nbsp; &laquo;Арт-Манеж&raquo;,&nbsp; Манеж, Москва.</span><br /><span class=\"color11\">2011 &ndash; Благотворительный аукцион &laquo; Operation Smile &raquo;, при поддержке &laquo;Christie&rsquo;s&raquo;, Москва.&nbsp;</span><br /><span class=\"color11\">2011 &ndash; Благотворительный аукцион &laquo;Операция надежда&raquo;,&nbsp; Москва.</span><br /><span class=\"color11\">2011 &ndash; &laquo;Выставка новых поступлений&raquo;, Государственный художественный музей. г.Тамбов.</span><br /><span class=\"color11\">2012 &ndash; &laquo;Возвращение домой&raquo;, Галерея Светланы Сажиной. Москва.</span><br /><span class=\"color11\">2013 &ndash; &laquo;80-лет МСХ&raquo;. Кузнецкий мост. Москва.&nbsp;</span><br /><span class=\"color11\">2013 &ndash; &laquo;Новогодняя выставка&raquo;, Галерея Светланы Сажиной. Москва</span><br /><span class=\"color11\">2013 &ndash; &laquo;Рождественская выставка&raquo;, Московский Союз Художников,&nbsp; Москва.</span><br /><span class=\"color11\">2014 &ndash; &laquo;Мир живописи&raquo;, МСХ, д/к г.Зеленоград.</span><br /><span class=\"color11\">2014 - Аукцион живописи и графики &laquo;Nika&raquo;.</span><br /><span class=\"color11\">2014- &laquo;Dreams&raquo; Благотворительный аукцион при поддержке &laquo;Christie\'s&raquo;, Москва.</span><br /><span class=\"color11\">2015 -Аукцион живописи и графики &laquo;Nika&raquo;.</span><br /><span class=\"color11\">2015 &ndash; &laquo;EQUUS&raquo;, Галерея 9/1, Москва.</span><br /><span class=\"color11\">2015 &ndash; &laquo;Выставка посвященная 90-летию МХУ памяти 1905г.&raquo; МОСХ России, Москва.</span><br /><span class=\"color11\">2016 - Аукцион живописи и графики &laquo;Nika&raquo;.</span><br /><span class=\"color11\">2016 &ndash; &laquo;Подарки к Рождеству&raquo;. Totibadze gallery. Винзавод</span><span class=\"color11\"><span lang=\"EN-US\">.&nbsp;</span>Москва</span><span class=\"color11\"><span lang=\"EN-US\">.</span></span><br /><span class=\"color11\"><span lang=\"EN-US\">2017 - Asia Contemporary Art Show.&nbsp;</span>Гонконг</span><span class=\"color11\"><span lang=\"EN-US\">.</span></span><br /><span class=\"color11\">2017 - Благотворительный аукцион &laquo;12 стульев&raquo;, в поддержку Благотворительного фонда &laquo;Жизнь, как чудо!&raquo;. Аукционный дом №1. Москва.</span><br /><span class=\"color11\">2017 - К&nbsp;</span>100-летию Октябрьской революции &laquo;Под лупой времени 1917-2017&raquo;. Галерея Светланы Сажиной. Москва.<br /><span lang=\"EN-US\">2018 &ndash; Affordable Art Hong Kong. Гонконг.</span><br />2018 &ndash; &laquo;Святые и художники&raquo;. Кузнецкий мост. Москва.<br />2018 &ndash; &laquo;Подарки к Рождеству&raquo;.&nbsp;<span class=\"color11\">Totibadze gallery. Винзавод. Москва.</span><br /><span class=\"color11\">2019 &ndash; Юбилейная выставка, посвященная 10-летию галереи Светланы Сажиной. Москва.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Культурные каникулы&raquo;. Галерея &laquo;Экспо-88&raquo;. Москва. ЦДХ.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Путешествия по снам&raquo;. Галерея Art Story. Москва.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Пушкин наш и все&hellip;&raquo; Галерея Всекохудожник. Медиацентр Зарядье. Москва.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Пушкин наш и все&hellip;&raquo; Галерея Всекохудожник. Выставочный зал. Переславль-Залесский.</span><br /><span class=\"color11\">2019 &ndash; &laquo;Бестиарий&raquo;.&nbsp; Дарвиновский музей. Москва.</span></pre>\n<p>&nbsp;</p>', 'https://www.facebook.com/alexander.dedushev', 'https://www.instagram.com/alexander_dedushev/', NULL, 0),
(8, 3, 'Ирина', 'author3@act-art.ru', NULL, 'users/June2020/gBAk3DJze53ojIQBo8nJ.jpeg', NULL, '$2y$10$8ZY1kBHcxIFkUAH4HMZRl.x6j.lqgsYCqeOHPmfzAErwAa96EhW/e', NULL, '{\"locale\":\"ru\"}', '2020-06-15 10:04:35', '2020-06-15 10:33:29', '', 'Дедушева', NULL, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 18.399999618530273px; font-family: Times;\">С 1990 года постоянный участник Московских и Российских выставок.&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 18.399999618530273px; font-family: Times;\">Работы находятся в частных коллекциях России и за рубежом.&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 18.399999618530273px; font-family: Times;\">Сотрудничает с издательствами :&nbsp;&laquo;ВИТА-ПРЕСС&raquo;, &laquo;АЙРИС-пресс&raquo;,&nbsp; &laquo;Рид Медиа&raquo;,&nbsp; &laquo;ЭДИПРЕСС-КОНЛИГА&raquo;,&nbsp;ООО &laquo;Юнайтед Пресс&raquo;.&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 10pt; line-height: 16.866666793823242px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 18.399999618530273px; font-family: Times;\">Иллюстрации напечатаны в журналах : &laquo;МАМА это Я&raquo;, &laquo;МАМА и МАЛЫШ&raquo;, &laquo;Она&raquo;,&nbsp;&laquo;Beauty&raquo;, &laquo;Play boy&raquo;,&nbsp;&laquo;XXL&raquo;, &laquo;Медведь&raquo;,&nbsp;&laquo;Мама&raquo;,&nbsp;&laquo;Арбат престиж&raquo;,&nbsp;&laquo;Time Out&raquo;, &laquo;Вещь&raquo;, &laquo;Conneсt&raquo;, &laquo;Здоровье от природы&raquo;.</span></p>', NULL, 'https://www.instagram.com/asparagus_art/', NULL, 0),
(9, 3, 'Кирилл', 'author4@act-art.ru', NULL, 'users/June2020/RW8MjMoswDneocFVPGcT.png', NULL, '$2y$10$OCyaE0moRN2O154FFmyjw.vvzvY1/lJjbs0iUMbZPJ7tAHPz49s1K', NULL, '{\"locale\":\"ru\"}', '2020-06-15 10:06:05', '2020-06-15 11:10:48', '', 'Опухлый', 1961, '<p><span style=\"font-size: 14pt; font-family: Times; color: #222222;\">Участник многочисленных московских, российских и зарубежных выставок.<br />Работы находятся в частных коллекциях в России и за рубежом, а также в собрании Художественного Фонда РФ.<br />Живет и работает в Москве.<br /><br /></span></p>', NULL, NULL, NULL, 0),
(10, 3, 'Юрий ', 'ylangleben@gmail.com', NULL, 'users/June2020/CQmmk4PLutzeb1QK7nAg.jpeg', NULL, '$2y$10$kPA/4DsxHtiGgFpx32nN8u9R4aY51rzq4NfTMqJE7UpKG0/j44gNG', NULL, '{\"locale\":\"ru\"}', '2020-06-15 10:08:13', '2020-06-15 10:10:29', 'Львович', 'Ланглебен', 1955, '<p>Участие в выставках рахличного уровня с 1980 г.</p>\n<p>Работы находятся в Госфонде РФ, частных собраниях России, Дании, Израиля, США.</p>\n<p>1980-1982 - художник-реставратор Дирекции выставок Московского отделения Художественного фонда РСФСР.</p>\n<p>1982-04.2019 - заведующий сектором реставрации ВНПО СХ СССР, художник-реставратор ООО \"ВО\"ЦДХ\"</p>\n<p>Выполнил реставрацию работ русских и советских художников для музеев РФ и частных галерей.</p>\n<p>Автор ряда публикаций и выставочных проектов.</p>\n<p>С 03.2019 по настоящее время художественный руководитель галереии ВСЕКОХУДОЖНИК, Дома художника МИИТ (ДК РУТ).</p>\n<p>&nbsp;</p>', NULL, NULL, NULL, 0),
(11, 3, 'Леонид', 'author5@act-art.ru', NULL, 'users/June2020/56xNONlTXP4SGeUQK9Ia.png', NULL, '$2y$10$hpU4rZNN0Ohi2vjos1oX..JJjHlpmXRuZ/Ocx35r2cmLtTWvqqZlu', NULL, '{\"locale\":\"ru\"}', '2020-06-15 11:46:25', '2020-06-15 11:46:25', 'Сергеевич', 'Эппле', 1959, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify; line-height: 16.2pt;\"><span style=\"font-size: 14pt; font-family: Times; color: #333333;\">Картины художника находятся в государственных и частных коллекциях мира.</span></p>', 'https://www.facebook.com/leonid.epple', NULL, NULL, 0),
(12, 3, 'Ольга ', 'author6@act-art.ru', NULL, 'users/June2020/xglNrp5nSg2hlk8KdXby.jpeg', NULL, '$2y$10$7oU/G55vCHG943eNG/Sbde1HjRx851rqIOLBREv/5eAiXx4MMgf4S', NULL, '{\"locale\":\"ru\"}', '2020-06-15 12:03:47', '2020-06-15 12:03:47', '', 'Волгина - Эппле', 1975, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 14pt; font-family: Times; color: #333333;\">Работы автора находятся в частных коллекциях в России и за рубежом.<br />с 2007 г. - преподаватель в детской творческой изостудии &laquo;Детская-Арт-Студия&raquo; (группа детей участник московских выставок и конкурсов.) Так же проводит мастер-классы для взрослых и детей.</span></p>', NULL, NULL, NULL, 0),
(13, 3, 'Николай', 'author7@act-art.ru', NULL, 'users/June2020/SMrHYBFl2udluLItYJhQ.jpeg', NULL, '$2y$10$w6hp5Jjf30GhSaEb3iNjgu.FE6cS3wJEI2qAed/OXlTHZPM9e2rOq', NULL, '{\"locale\":\"ru\"}', '2020-06-15 12:22:36', '2020-06-15 12:22:47', '', 'Попов', 1986, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; white-space: normal;\"><span style=\"font-family: Times;\">В настоящий момент Николай Попов - композитор, педагог, исследователь, член союза композиторов России, научный сотрудник центра электроакустической музыки Московской консерватории, преподаватель кафедры истории и теории музыки Российского университета театрального искусства (ГИТИС).&nbsp;</span><span style=\"font-size: 11pt; font-family: Times;\"><br /></span><span style=\"font-family: Times;\">Николай Попов &ndash; член Творческого союза художников России, секция &laquo;Абстрактное искусство&raquo;, тесно сотрудничает с ее председателем - Бабаяном Д.А. (Давид Ру).&nbsp;</span></p>\n<pre><span style=\"caret-color: #000000; color: #000000; font-size: 11pt; line-height: 15.693333625793457px; font-family: Calibri, sans-serif;\">&nbsp;</span></pre>', NULL, NULL, NULL, 0),
(14, 3, 'Александр', 'author8@act-art.ru', NULL, 'users/June2020/9eLugBDCAzivbFYuhMPX.jpeg', NULL, '$2y$10$2m4mOVS4YPbzapF5aswT.eiwiLH9xtX4fAYOdjtpFB9g0RfEPFLB.', NULL, '{\"locale\":\"ru\"}', '2020-06-15 12:29:31', '2020-06-15 12:29:31', 'Леонидович', 'Соколов', 1951, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В рамках институтской программы обучался основам художественного конструирования. За время с 1973 г. по 1977г.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">Работал в Ленинграде на различных предприятиях и прошел путь от инженера-конструктора до конструктора 1 категории. В это время занимался художественно-конструкторской разработкой ряда изделий связи.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">С 1977 по 1979 г. конструктор 1категории ЦНИИС. Начиная с 1979 по 1991 год работал в ЭНИМСе и прошел путь от заведующего сектором до заведующего лабораторией, занимался художественно- конструкторской разработкой систем числового программного управления ПК1, &laquo;Электроника- 31&raquo;,&nbsp;&laquo;Электроника 80-31&raquo; и др.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В 1987 г. там же получил звание кандидата технических наук.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">Все эти годы занимался преподавательской деятельностью и живописью.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">1992-2007г. Руководил дизайнерско-конструкторской разработкой линеек&nbsp;изделий &laquo;Октет&raquo;, &laquo;Гудвин&raquo; и др.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">2011- 2016г.г. Публиковал статьи об искусстве по заказу различных глянцевых&nbsp;журналов.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В&nbsp;2016-2019г.г. Участвовал в проектах &laquo;Абстракция без границ&raquo;&nbsp;</span></p>', NULL, NULL, NULL, 0),
(16, 3, 'Федор', 'author9@act-art.ru', NULL, 'users/June2020/kIGEa2RHdN9UmcDkt8o3.jpeg', NULL, '$2y$10$AsnqE6MfGAXkShsUxo73uOAiIjzCVvEOLzThcOqglfH2QvnywM5Fq', NULL, '{\"locale\":\"ru\"}', '2020-06-15 13:05:25', '2020-06-15 13:05:25', 'Викторович', 'Архипов', 1986, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 15.693333625793457px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 17.1200008392334px; font-family: Times;\">Поставил, как сценограф более 30 спектаклей в Москве и городах России. С 2013 г. по 2016 г. проходил практику в Творческих мастерских Академии художеств. С 2015 г. по 2019 г. разрабатывал художественно-технологическое решение&nbsp;и руководил производством 8-ми спектаклей в различных театрах Москвы. Как дизайнер выставочного пространства с 2015-го года сотрудничал с ГосЛитМузеем, оформив лично и в соавторстве долее 10-ти выставок. С 2015-го года в составе арт-группы с Грантом Гарибяном осуществил ряд переферансов, выставочных и художественных проектов.&nbsp; С 2017 года преподает рисунок, живопись, пластическую анатомию в РАТИ (ГИТИС) на факультете кукольников. Работы художника находятся в частных коллекциях в России и за рубежом.&nbsp;&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 15.693333625793457px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 17.1200008392334px; font-family: Times;\">Участник более 15-ти групповых и трех персональных выставочных проектов.&nbsp;</span></p>', NULL, NULL, NULL, 0),
(17, 3, 'Грант', 'author10@act-art.ru', NULL, 'users/June2020/LMuUU8UxdzMK8mmHdG1P.jpeg', NULL, '$2y$10$50ipcRYVlFrTAlQemGB3VedEvxGvW2/bj0z9XK3pYldzuks9Nbvr6', NULL, '{\"locale\":\"ru\"}', '2020-06-15 13:10:50', '2020-06-15 13:10:50', '', 'Гарибян', 1988, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 15.693333625793457px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 17.1200008392334px; font-family: Times;\">С 2016 г. по 2019 г. проходил практику в Творческих мастерских Академии художеств. С 2016 года участвовал в работе ряда творческих коллективов по созданию памятников в Москве и России. Участник&nbsp;трех творческих конкурсов на создание памятников в Москве, в одном из которых получил второе место. С 2015-го года в составе арт-группы с Федором Архиповым осуществил ряд перформансов, выставочных и художественных проектов.&nbsp; Участвовал в создании декораций к различным театральным постановкам и киносъемкам.<br />Работы находятся в частных коллекциях в России и за рубежом.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 15.693333625793457px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 17.1200008392334px; font-family: Times;\">Участник более 15-ти групповых и пяти персональных выставочных проектов.</span></p>', NULL, NULL, NULL, 0),
(18, 3, 'Ирина ', 'author11@act-art.ru', NULL, 'users/June2020/GYT2Yg2vDW9ZleqyNUEa.jpg', NULL, '$2y$10$QMQVf5sTLivlQww64jEZNeMKZIL7i/AO.E8rt9sHVeNHP465F4sam', NULL, '{\"locale\":\"ru\"}', '2020-06-15 13:30:13', '2020-06-15 13:30:13', 'Александровна', 'Старженецкая', 1943, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В 1962&mdash;1985 годах занимается сценографией, работает художником-постановщиком в театрах Москвы, Куйбышева, Саратова и других.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">С 1989 года пишет иконы и расписывает храмы, в том числе храм Воскресения Христова в Тарусе и церковь Малое Воскресение в Москве.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В 2000 году удостоена&nbsp;Государственной премии РФ.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В 2001 году стала членом-корреспондентом&nbsp;Российской академии художеств.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В 2003 году награждена медалью преподобного Сергия Радонежского Русской православной церкви.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В 2004 году награждена золотой медалью Российской академии художеств.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">С 2007 года действительный член Российской академии художеств.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">Педагог кафедры режиссуры драмы в&nbsp;ГИТИС.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">В 2015 году удостоена Благодарности Президента Российской Федерации.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">Работы находятся в Государственной Третьяковской галерее в Москве;&nbsp;Государственном Русском музее в С.-Петербурге;<br />Музее музыкальной культуры им. М.И.Глинки в Москве;&nbsp;собрании П. Людвига в Аахене, Кельне, Германия;&nbsp;Словацкой национальной галерее;&nbsp;Художественном музее г. Тампа, США; Галереях и частных собраниях Германии, Великобритании, Франции, Испании, Португалии, США.&nbsp;</span></p>', NULL, NULL, NULL, 0),
(19, 3, 'Тамара', 'author12@act-art.ru', NULL, 'users/June2020/JhTSayBCLuWp8rI12LmD.jpg', NULL, '$2y$10$qxznep6.VyQ81oeCD.BjwODsPDXe4qG9TIiX4/Vn9SztdkoWNmTZi', NULL, '{\"locale\":\"ru\"}', '2020-06-15 13:37:12', '2020-06-15 13:37:12', 'Георгиевна ', 'Старженецкая', 1912, '<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Выдающийся художник театра и кино.&nbsp;</p>\n<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">В предвоенные годы работала в Архитектурно-проектной мастерской А. и В. Весниных, занималась в студии живописи. В 1940 году поступила в Институт живописи, скульптуры и архитектуры в Ленинграде. Блокадную зиму 1941&ndash;1942 годов Тамара Старженецкая провела в Ленинграде. В феврале 1942 года вместе с институтом была эвакуирована в Самарканд. В 1944 году вернулась в Ленинград, где в 1948 году закончила с отличием Институт имени И.Е. Репина (театральная мастерская М.П. Бобышева). В том же году вступила в Союз художников СССР, начала участвовать в выставках.</p>\n<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">В 1949 году во Всесоюзном конкурсе Большого театра на оформление балета &laquo;Спящая красавица&raquo; Тамара Старженецкая заняла второе место. С 1952 по 1956 годы она работала художником-постановщиком ГАБТ СССР. За семь лет Тамара Старженецкая поставила в Большом театре шесть спектаклей и подготовила две неосуществлённые постановки. Она вошла в историю театрального искусства как художник-постановщик оперы Дж. Верди &laquo;Аида&raquo; (режиссёр Б. Покровский), к которой она создавала декорации и эскизы костюмов. Также она рисовала на сцене иллюстрации к музыкальным произведениям Э. Грига, П. Чайковского, Н. Римского-Корсакова, В. А. Моцарта, Д. Шостаковича, Р. Вагнера. Сама Тамара Старженецкая комментировала свою работу так: &laquo;Музыку я чувствую в цвете, а цвет &mdash; в музыке&raquo;.</p>\n<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">В 1957 году была главным художником VI Всемирного фестиваля молодежи и студентов в Москве.</p>\n<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">После 1956 года Тамара Старженецкая работала над оформлением спектаклей во многих оперных, музыкальных, драматических театрах страны, над циклом произведений, созданных по результатам поездок по СССР и за рубеж. Всякий раз отправляясь в путешествие Тамара Старженецкая не расставалась с этюдником. В течение тридцати лет она была художником-постановщиком во многих оперных, драматических, музыкальных театрах страны (Воронеж, Саратов, Ереван, Тбилиси, Одесса, Донецк, Сыктывкар, Волгоград и др.).</p>', NULL, NULL, NULL, 0),
(20, 3, 'Давид', 'author13@act-art.ru', NULL, 'users/June2020/odmaD0elBr8TUSj6d0aP.jpeg', NULL, '$2y$10$Zw2d6peyItQn62zteB/OLeUwooxv0l5mX3CGq/.dVPbCvoGKV6sMW', NULL, '{\"locale\":\"ru\"}', '2020-06-16 06:46:42', '2020-06-16 06:46:42', '', 'Ру.', 1950, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; font-family: yandex-sans, serif;\">1983&nbsp;-&nbsp;1985&nbsp;Руководитель&nbsp;выставочного&nbsp;отдела,&nbsp;Музей&nbsp;современного&nbsp;искусства,&nbsp;Ереван.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; font-family: yandex-sans, serif;\">1993&nbsp;-&nbsp;1995&nbsp;Главный&nbsp;художник&nbsp;галереи&nbsp;&laquo;Экспресс&nbsp;Авангард&raquo;,&nbsp;Москва.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; font-family: yandex-sans, serif;\">1995&nbsp;-&nbsp;Основал&nbsp;галерею&nbsp;&laquo;Студия-13&raquo;.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; font-family: yandex-sans, serif;\">2003&nbsp;-&nbsp;2004&nbsp;Основал&nbsp;галерею&nbsp;&laquo;Вернисаж&nbsp;1+20&raquo;, и&nbsp;одноимённый&nbsp;журнал&nbsp;&laquo;Вернисаж&nbsp;1+20&raquo;.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; font-family: yandex-sans, serif;\">2005&nbsp;-&nbsp;2006&nbsp;Основал&nbsp;галерею&nbsp;&laquo;DavidGroup&raquo;.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">2011&nbsp;-&nbsp;Вице-президент ТСХ России по масс-медиа, главный редактор издания &laquo;ТСХР&raquo;, Председатель секции &laquo;Абстрактное искусство&raquo; ТСХ России Почетный член Российской академии художеств. Руководитель&nbsp;творческой&nbsp;студии&nbsp;&laquo;DavidGroup&raquo;.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">2014 - почетный член Российской Академии Художеств.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 8pt; line-height: 15.693333625793457px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; line-height: 15.693333625793457px; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; line-height: 17.1200008392334px; font-family: yandex-sans, serif;\">Работы&nbsp;находятся&nbsp;в&nbsp;музеях&nbsp;и&nbsp;частных&nbsp;коллекциях:</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; line-height: normal; font-size: 11pt; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-size: 12pt; font-family: yandex-sans, serif;\">Армении,&nbsp;России,&nbsp;США,&nbsp;Германии,&nbsp;Франции,&nbsp;Польши,&nbsp;Финляндии,&nbsp;Австрии,&nbsp;Швеции,&nbsp;</span><span style=\"font-size: 12pt; font-family: yandex-sans, serif;\">Японии.</span></p>', 'https://www.facebook.com/david.ru.908', NULL, NULL, 0),
(21, 3, 'Алексей', 'author14@act-art.ru', NULL, 'users/June2020/S72ewjVvxH4gMiic4myl.jpeg', NULL, '$2y$10$AL4UvvHMiO7VwxukBMksM.zosYtwqpPKKv0FvPlV3/DZOCsMyy7iW', NULL, '{\"locale\":\"ru\"}', '2020-06-16 06:57:08', '2020-06-16 06:57:08', '', 'Ланцев', 1970, '<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Провел более 20 персональных выставок в России, Франции, Германии, Великобритании, Швейцарии и Гонконге. С 1996 г. участвовал в многочисленных выставках в Москве и за рубежом. Автор 10 монументальных проектов-росписей в Москве и на Чукотке. Работы находятся в Новосибирском художественном музее, музее Абрамцево, ГЦСИ Владикавказ, National Bank of Iceland, Raiffeisen Bank, Clifford Chans, Deutsche Bank, Standard&amp;Poor`s, а также в частных коллекциях Исландии, Японии, США, Франции, Швейцарии, Германии, Гонконга, Израиля, Англии, России. Творчество Алексея Ланцева отличает яркий колорит в духе произведений фовизма. Его композиции находятся на стыке между фигуративностью и абстракцией и заставляют зрителя по- новому взглянуть на привычные вещи.&nbsp;</span></p>', NULL, NULL, NULL, 0),
(22, 3, 'Виктор', 'author15@act-art.ru', NULL, 'users/June2020/FhCAd9MpDihweRPypDSf.jpeg', NULL, '$2y$10$r24FImQmBQ4fcwLQnL4EzerbZdjUAxwfhhFMNLbG8zPZ8cEGmAqv2', NULL, '{\"locale\":\"ru\"}', '2020-06-16 08:26:22', '2020-06-16 08:26:22', '', 'Калинин', 1946, '<p>с 1966 - принимает участие в московских, республиканских, всесоюзных и международных художественных выставках</p>\n<p>1995 - начал преподавать на кафедре академической живописи в МВХПУ (б. Строгановском)</p>\n<p>Участник международных художественных симпозиумов в Англии, Венгрии, Дании, Норвегии, Польше, США и Франции.</p>\n<p>Участник международных художественных арт-салонов в Англии, Венгрии, Польше и Швейцарии.</p>\n<p>Участник групповых выставок более чем в 30 странах мира, в том числе в Англии, Германии, Дании, Испании, США, Франции, Швейцарии, Японии.</p>\n<p>В России и за рубежом прошли более 20 персональных высиавок художника.</p>\n<p>В 2001 г. награжден серебряной, в 2007 г. - золотой медалью Российской академии художеств.&nbsp;</p>', NULL, NULL, NULL, 0),
(23, 3, 'Ирина', 'author16@act-art.ru', NULL, 'users/June2020/baA5zVY60OUve6M6e82H.jpeg', NULL, '$2y$10$ZswCkZIib52TDBKEG2NKSeolfDkAC9mfqUZ9kVmCT5RAo08.ZJ3T.', NULL, '{\"locale\":\"ru\"}', '2020-06-16 08:42:24', '2020-06-16 08:42:24', 'Павловна', 'Калинина', 1948, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1972 Впервые участвовала на Всесоюзной выставке молодых художников, Москва</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1971-2003 Преподавала в ДХШ №2&nbsp;&nbsp;г. Москвы</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">2005&nbsp;&nbsp;Премия живописи им. П.П.Кончаловского</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">2008&nbsp;&nbsp;Серебряная медаль Российской академии художеств</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">2014&nbsp;&nbsp;Золотая медаль Российской академии художеств</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">2016 Член-корреспондент Российской академии художеств</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\"><strong>Работы Ирины Калининой&nbsp;</strong>находятся в художественных музеях Переславля-Залесского, Омска, Барнаула, Ульяновска, Саратова, Рязани, Энгельса, в Новом &ndash;Иерусалиме Московкой области</p>', NULL, NULL, NULL, 0),
(25, 3, 'Илья', 'author17@act-art.ru', NULL, 'users/June2020/oRO36h1LURgHuZW9M7uZ.jpg', NULL, '$2y$10$q.T/zByOZLWhqhxwKtPcCe4WxRhCJA6hxG3M5QOiD9h808g.9PjgW', NULL, '{\"locale\":\"ru\"}', '2020-06-16 08:52:09', '2020-06-16 09:32:09', '', 'Даньшин', 1958, '<p><span style=\"caret-color: #000000; color: black; font-size: 10.5pt; line-height: 14.979999542236328px; font-family: \'Times New Roman\', serif;\">Работы находятся в фондах Союза Художников РФ, Министерства культуры РФ, в Музее-усадьбе В.Д.Поленова, историко-архивном музее &laquo;Новый Иерусалим&raquo;, Государственном Художественном Музее Барнаула, Государственной Тарусской Картинной Галерее, Художественной галерее города Саров.</span></p>', NULL, NULL, NULL, 0),
(26, 3, 'Александр ', 'author18@act-art.ru', NULL, 'users/June2020/hmDERvZn0V23jcNGOfFU.jpg', NULL, '$2y$10$55FCml7sPTkgE0PNnDn3FenHzZzWXTHwh70GOzrDcqVFUk2H4oZHu', NULL, '{\"locale\":\"ru\"}', '2020-06-16 11:26:20', '2020-06-16 11:26:20', 'Павлович', 'Могилевский', 1885, '<p class=\"MsoNormal\" style=\"margin: 6pt 0cm; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">При иллюстрировании детских книг Александр Могилевский применял различные технические приёмы, используя в том числе тушь, перо, карандаш, но, будучи одним из лучших акварелистов своего времени, чаще всего работал с цветной и чёрной акварелью.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 6pt 0cm; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Следуя давней традиции в иллюстрации детских книг, Могилевский шёл, прежде всего, от текста. В иллюстрациях к японской народной сказке &laquo;Длинное имя&raquo; (1929) художник использовал нежные краски, характерные для японского рисунка, и придал им занимательность и мягкий юмор. Одновременно в этих иллюстрациях переданы присущие японцам национальные особенности. Столь же достоверны его иллюстрации к книге стихов &laquo;Зима&raquo; (1933)&nbsp;Зинаиды Александровой, но в их яркости прочитывается уже не Япония, а Россия<sup><a href=\"https://ru.wikipedia.org/wiki/%D0%9C%D0%BE%D0%B3%D0%B8%D0%BB%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9,_%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80_%D0%9F%D0%B0%D0%B2%D0%BB%D0%BE%D0%B2%D0%B8%D1%87#cite_note-_65487fc0dc1bc9de-21\"><span style=\"color: black; text-decoration: none;\">[18]</span></a></sup>.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 6pt 0cm; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">В 1940-е годы Александр Могилевский стал одним из основных советских иллюстраторов&nbsp;андерсеновских&nbsp;и&nbsp;пушкинских&nbsp;сказок. Среди проиллюстрированных им произведений Ханса Кристиана Андерсена&nbsp;&mdash; &laquo;Соловей&raquo;, &laquo;Снежная королева&raquo;, &laquo;Дикие лебеди&raquo;, &laquo;Новое платье короля&raquo;.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 6pt 0cm; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Иллюстрируя &laquo;Новое платье короля&raquo;, Могилевский &laquo;представил портных не жуликами, обманывающими простодушного короля, а умными и хитрыми мастеровыми, которые, не упустив случаи хорошо заработать, зло посмеялись над тупым, самодовольным самодержцем и раболепствующей перед ним знатью&raquo;. В заключительной сцене художник использовал оптический приём, поместив зрителей на балконе дома, а королевскую процессию далеко под ними. Потеряв в масштабе, она делает естественным и ожидаемым восклицание мальчика &laquo;А король-то голый!&raquo;.&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 6pt 0cm; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Среди пушкинских произведений, которые иллюстрировал Александр Могилевский&nbsp;&mdash; &laquo;Бахчисарайский фонтан&raquo;, &laquo;Сказка о золотом петушке&raquo;, &laquo;Сказка о рыбаке и рыбке&raquo;, &laquo;Сказка о царе Салтане&raquo;, &laquo;Руслан и Людмила&raquo;. Особенность акварельных иллюстраций Могилевского к &laquo;Руслану и Людмиле&raquo;&nbsp;&mdash; их принципиальная недорисованность, позволяющая маленьким читателям дорисовывать иллюстрации самим, следуя собственному воображению<sup><a href=\"https://ru.wikipedia.org/wiki/%D0%9C%D0%BE%D0%B3%D0%B8%D0%BB%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9,_%D0%90%D0%BB%D0%B5%D0%BA%D1%81%D0%B0%D0%BD%D0%B4%D1%80_%D0%9F%D0%B0%D0%B2%D0%BB%D0%BE%D0%B2%D0%B8%D1%87#cite_note-_65487fc0dc1bc9df-22\"><span style=\"color: black; text-decoration: none;\">[19]</span></a></sup>.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 6pt 0cm; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Одной из лучших оформленных Александром Могилевским книг считается детское издание &laquo;Жан-Кристофа&raquo; (1930)&nbsp;Ромена Роллана. Для иллюстраций к этой книге художник использовал тушь и сухую кисть, передавая, по наблюдению&nbsp;Михаила Панова, одной-двумя линиями и несколькими прикосновениями кисти &laquo;всю гамму переживаний талантливого мальчика, трогательного в хрупкой беззащитности, его любовь к музыке и отвращение к бесконечным экзерсисам, увлечение театром и робость на сцене перед заполнившими зал зрителями&raquo;.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 6pt 0cm; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">В 1920-е годы Могилевский чаще иллюстрировал книги своих современников. Повесть&nbsp;Сергея Розанова&nbsp;&laquo;Приключения Травки&raquo; была впервые издана в 1928 году с иллюстрациями Александра Могилевского и выдержала в СССР до&nbsp;Второй мировой войны&nbsp;двенадцать изданий без смены иллюстратора. Также вышли три издания &laquo;Приключений Травки&raquo; на иностранных языках, и английское издание получило премию на выставке детской книги в&nbsp;Чикаго. Для знакомства маленьких читателей с окружающим миром (основной посыл автора книги) Могилевский делал зарисовки с натуры, в том числе зарисовки упомянутого в повести вокзала с паровозом и вагонами у перрон.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 6pt 0cm; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">В 1947 году Александр Могилевский принял участие в иллюстрировании сборника басен&nbsp;Ивана Крылова&nbsp;для &laquo;Объединения государственных книжно-журнальных издательств&raquo; в числе лучших графиков того времени во главе с&nbsp;Владимиром Фаворским&nbsp;&mdash; с которым Могилевский в 1906&mdash;1907 годах вместе учился в&nbsp;Мюнхене&nbsp;у&nbsp;Шимона Холлоши.&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">&nbsp;</span></p>', NULL, NULL, NULL, 0),
(27, 3, 'Динара', 'author19@act-art.ru', NULL, 'users/June2020/tc8zTxZ0EUnrGWtSifX4.jpg', NULL, '$2y$10$WOBHbLRkAYSnBgWc.PUtFevzCCVSWkUJN9NzJuf6KfRvYcyv0ih8K', NULL, '{\"locale\":\"ru\"}', '2020-06-16 11:31:06', '2020-06-16 11:31:06', '', 'Уварова', 1987, '<div class=\"page\" style=\"caret-color: #000000; color: #000000;\" title=\"Page 1\">\n<div class=\"layoutArea\">\n<div class=\"column\">\n<p><span style=\"font-size: 12pt; font-family: TimesNewRomanPSMT;\">Работы находятся в частных коллекциях</span><span style=\"font-size: 12pt; font-family: TimesNewRomanPSMT;\">.</span></p>\n</div>\n</div>\n</div>', NULL, NULL, NULL, 0);
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `phone`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `middlename`, `surname`, `year`, `text`, `fb`, `inst`, `beh`, `ban`) VALUES
(28, 3, 'Мария', 'author20@act-art.ru', NULL, 'users/June2020/0WRxT1c8ef6b4uMkZncC.jpg', NULL, '$2y$10$mkeKsKi7jP858.BP3P06De/T0.1wzAcux2mgwMFiPlo4Rgkzp5sUi', NULL, '{\"locale\":\"ru\"}', '2020-06-16 11:37:28', '2020-06-16 11:37:28', 'Григорьевна', 'Дрезнина ', NULL, '<p><span style=\"caret-color: #000000; color: #000000; font-size: 12pt; font-family: \'Times New Roman\', serif;\">На протяжении нескольких лет она активно работала в качестве художника-постановщика и автора костюмов в театрах Москвы, Пензы, Вены, участвовала в московских, республиканских и всесоюзных молодежных выставок.<br /><br />Работает как живописец и театральный художник, выступая автором выставочных проектов и социально-художественных акций для детей и родителей. Занимается дизайном женских украшений. Участвует в выставках в России и за рубежом. Работы М.Г. Дрезниной находятся в частных собраниях России, Австрии, Бельгии, Израиля, Германии, США.<br /></span></p>\n<p><span style=\"caret-color: #000000; color: #000000; font-size: 12pt; font-family: \'Times New Roman\', serif;\">В 1975 году начала педагогическую деятельность. Мария Григорьевна преподает в детских студиях, в Краснопресненской художественной школе в Москве, начинает работать в детских психологических центрах.<br /><br />С 1988 проводит занятия по изобразительному искусству с детьми в пионерском лагере &laquo;Артек&raquo; в Крыму. Создает серию живописных работ в парках Артека.&nbsp;</span><span style=\"caret-color: #000000; color: #000000; font-family: \'Times New Roman\', serif; font-size: 12pt;\">В 1993 году в Центральном доме художника на Крымском валу проходит выставка авторской студии М.Г. Дрезниной &laquo;Домашний театр&raquo;. На выставке были показаны оригинальные произведения, созданные детьми на основе старых ненужных вещей домашнего обихода.</span><span style=\"caret-color: #000000; color: #000000; font-family: \'Times New Roman\', serif; font-size: 12pt;\">&nbsp;</span></p>\n<p><span style=\"caret-color: #000000; color: #000000; font-size: 12pt; font-family: \'Times New Roman\', serif;\"><br />Работы детей, сделанные в рамках программы, в дальнейшем широко экспонировались на всероссийских и международных выставках, были освещены в средствах массовой информации.<br /><br /></span></p>\n<p><span style=\"caret-color: #000000; color: #000000; font-size: 12pt; font-family: \'Times New Roman\', serif;\">В середине 90-х годов Мария Григорьевна создает методику &laquo;Ориентация в пространстве&raquo; для обучения маленьких детей 5&ndash;10 лет изобразительному искусству. Основная цель программы &ndash; раскрытие индивидуальных возможностей каждого начинающего заниматься изобразительным творчеством, научить детей говорить на языке искусства с помощью формы, цвета, линии, ритма, композиции.&nbsp;<br /><br />С 1997-2000 г. М.Г. Дрезнина совместно с Фондом &laquo;Экология детства&raquo; проводит серию крупномасштабных социально-художественных программ для детей и родителей на ежегодной международной выставке &laquo;Мир детства&raquo;. (Москва, в Экспоцентре на Красной Пресне). В 2000 году проект Мария Григорьевна &laquo;Панорама Московской жизни руками детей&raquo;, созданный совместно с Э. Поляковой, побеждает в конкурсе на грант Фонда &laquo;Московский благотворительный резерв&raquo; в номинации &laquo;Каникулы в городе&raquo;.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">С 2006 года проводит занятия по арт-терапии для детей с ограниченными возможностями и детьми, попавшими в трудную жизненную ситуацию в Центре эстетического воспитания детей и юношества &laquo;Мусейон&raquo; ГМИИ имени А.С. Пушкина.<br /><br />В последние годы Мария Григорьевна ведет просветительскую работу с педагогами, психологами, социальными работниками по обучению новым эффективным методам работы с современной молодежью средствами искусства. В 2010 году М.Г. Дрезнина стала победителем конкурсного отбора на соискание гранта Департамента образования г.Москвы в сфере образования.&nbsp;</p>', NULL, NULL, NULL, 0),
(29, 3, 'Валентина', 'author21@act-art.ru', NULL, 'users/June2020/hiyFpAOQPXXVlHIirrg0.jpg', NULL, '$2y$10$Zw1sNe9Un7R3mwBJWIi3Ku3iqKgRKCifX9OmNngPQ6Sq5VUhz67/W', NULL, '{\"locale\":\"ru\"}', '2020-06-16 11:44:58', '2020-06-16 11:44:58', '', 'Кочурова', NULL, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1977-1978 работала ассистентом художника-постановщика П.С.Пашкевича на съемках телесериала &laquo;Карл Маркс- молодые годы&raquo;, режиссер Л.А.Кулиджанов. Работала ассистентом режиссера&nbsp;&nbsp;на Ялтинской киностудии.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1978-1991 Работала художником &ndash;иллюстратором в издательствах &laquo;Детская литература&raquo;, &laquo;Малыш&raquo;, &laquo;Просвещение&raquo;, &laquo;Современник&raquo;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1980 Начало участия в молодежных&nbsp;&nbsp;выставках.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Первая публикация в журнале &laquo;Искусство кино&raquo;, работа &laquo;Табак&raquo;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1981-1982 Выполняла рисунки&nbsp;&nbsp;для Большой Советской Энциклопедии.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1983 Командировка в Севастополь для выполнения творческих работ по договору с Академией Художеств СССР</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">С 2002 по настоящее время работает преподавателем в ДХШ №6 СВАО Москввы&nbsp;</p>', NULL, NULL, NULL, 0),
(30, 3, 'Юлия ', 'author22@act-art.ru', NULL, 'users/June2020/dYVnbxENuhm02I7ooWos.png', NULL, '$2y$10$x/0Y99RZFNB2CkEj1z7Soeyr2EZzScKK37liH0T.DS6KFH0cOeYsy', NULL, '{\"locale\":\"ru\"}', '2020-06-16 12:11:26', '2020-06-16 14:03:17', 'Германовна', 'Травникова', 1975, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">С 1991 года принимает участие в выставках.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Участник более 30 региональных, всероссийских и международных выставок, в том числе 7 персональных, в г. Кургане, Челябинске, 1991-1993, 1996, 1998 гг., персональная выставка живописи и графики в Посольстве США, Москва, 1995 г.,&nbsp;&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">персональная выставка живописи в ЦДХ, г. Москва, 2004 г.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Стипендиат Союза художников и Министерства культуры Российской Федерации, 2000 г.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Лауреат художественной выставки &laquo;Москва глазами молодых&raquo;, 2001 г.&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Работы находятся в Областном художественном музее г. Кургана, музее г. Петрозаводска, в галереях и частных собраниях России, США, Франции, Германии.</span></p>', NULL, NULL, NULL, 0),
(31, 3, 'Анатолий', 'author23@act-art.ru', NULL, 'users/June2020/g1LHDUW2kaRT9RQmqpwY.jpg', NULL, '$2y$10$Bd8CGhY8kh./j.oJ6qJk5.2uf2I5mQTnSbtKwuI.9Vkvf6a77GnP6', NULL, '{\"locale\":\"ru\"}', '2020-06-17 05:16:36', '2020-06-17 05:16:36', 'Николаевич', 'Морев', 1942, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">С конца 1970-х годов начал ездить в дома творчества: на &laquo;академическую дачу&raquo; им. И. Е. Репина, &laquo;Горячий Ключ&raquo; в краснодарском крае.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Появилась мастерская. Начались творческие командировки от живописного комбината по Средней Азии, Уралу, Белоруссии, Ставропольскому краю.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Позднее с женой&nbsp;&nbsp;- художником Е.А.Тавьевой осуществляли поездки в Кисловодск, Грузию,&nbsp;&nbsp;Армению, Венгрию, Италию,&nbsp;&nbsp;Францию. Результатом стали циклы работ по этим поездкам.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Вместе в Е.А.Тавьевой участвовал в выставках Клуба Живописцев на Кузнецком мосту, 20, а с 1993 года в Галерее &laquo;Ковчег&raquo;, в которую переместился Клуб Живописцев.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">В этом же году в галерее &laquo;Ковчег&raquo; состоялась совместная выставка с Е.А. Тавьевой.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Награжден знаком Министерства культуры Российской Федерации &laquo;За достижения в культуре&raquo;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Работы художника находятся в музейных собраниях:</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Государственный музей искусства народов Востока, Москва</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Музей фресок Дионисия, с. Ферапонтово</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Вологодская картинная галерея</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Общероссийская общественная организация &laquo;Ассоциация искусствоведов&raquo; АИС, Москва&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">В частных коллекциях: Франции, Италии, США, Югославии, Польши. Японии</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">В российских частных коллекциях, в том числе: Инны Ковальской, Михаила Красилина, Егра Маркевича, Люсинэ Перосян, Юрия Петухова, Василия Ракова, Татьяны Скринской, Ирины Стёжки, Оксаны Филипповой, Юрия Шибанова, Бориса и Ирины Шумяцких</p>', NULL, NULL, NULL, 0),
(32, 3, 'Евгения', 'author24@act-art.ru', NULL, 'users/June2020/U0W9VsXknQJExKUYD2mY.JPG', NULL, '$2y$10$psyg/ylsmtQ.rP8FOxy/bOix48HxhA.QrzLsavC8nsaWihddsOi36', NULL, '{\"locale\":\"ru\"}', '2020-06-17 05:21:20', '2020-06-17 05:21:20', 'Александровна', 'Тавьева', 1940, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">С 1980-х годов&nbsp;&nbsp;&nbsp;поездки в Кисловодск, Грузию,&nbsp;&nbsp;Армению, Венгрию, Италию,&nbsp;&nbsp;Францию и создала&nbsp;&nbsp;&nbsp;циклы работ по этим поездкам.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Вместе с мужем художников А.Н.Моревым&nbsp;&nbsp;участвовала в выставках Клуба Живописцев на Кузнецком мосту, 20, а с 1993 года в Галерее &laquo;Ковчег&raquo;, в которую переместился Клуб Живописцев.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">В этом же году в галерее &laquo;Ковчег&raquo; состоялась совместная выставка с А.Н. Моревым.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Награждена знаком Министерства культуры Российской федерации &laquo;За достижения в культуре&raquo;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">&nbsp;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><strong>Работы находятся в музейных собраниях:</strong></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Государственный музей искусства народов Востока. Всероссийский музей декоративно-прикладного и народного искусства. Москва</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Музей фресок Дионисия, с. Ферапонтово</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Томский областной художественный музей</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Новокузнецкий художественный музей</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Государственный историко-архитектурный&nbsp;&nbsp;и художественный музей &laquo;Новый Иерусалим&raquo; г.истра</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Международная конфедерация Союз художников</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Союз художников России</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Московский Союз художников</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Общественная организация &laquo;Ассоциация искусствоведов&raquo;.&nbsp;&nbsp;Москва</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">В частных коллекциях Франции, Италии, Испании, германии, США, Японии, Ирана</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">В российских собраниях, в том числе: Инны Ковальской, Михаила Красилина, Юрия Петухова, Татьяны Скринской, Ирины Стёжки, Оксаны Филипповой, Бориса и Ирины Шумяцких</p>', NULL, NULL, NULL, 0),
(33, 3, 'Александр', 'author25@act-art.ru', NULL, 'users/June2020/eodJn8L2naE0DmbcdNIU.jpg', NULL, '$2y$10$NZHQ.rNpfZXs5Yi9N1nVmO1VIDijtIHPzpZGvOzVNdwk9RTbn37hm', NULL, '{\"locale\":\"ru\"}', '2020-06-17 05:31:34', '2020-06-17 05:31:34', 'Сергеевич', 'Гневушев', 1950, '<p>Работы находятся в художественном фонде Союза Художников, в частных собраниях в России и за рубежом.</p>\n<p>Большую часть времени проводит в путешествих. Вода и окружающий пейзаж - постоянные спутники.Образ жизни отчасти опредеялет тематику картин. Запахи талой воды, водорослей, крики чаек, звуки такелажа парусника - это особый мир, зыбкое, часто мимолетное ощущение, в котором проявляется вся суть предмета. Внешняя сторона - лишь необходимый элемент для решения эстетических задач.</p>\n<p>Взаимоотношения больших линий, диалог общего и частного, реального и нереального определяют круг моих живописных задач.</p>', NULL, NULL, NULL, 0),
(34, 3, 'Мария', 'author26@act-art.ru', NULL, 'users/June2020/P0Ub0UHrkA0Hk0xQuj4k.jpg', NULL, '$2y$10$F4mml3griYbuwk41SqCYT.bJqZh158DtSwDTokHJbAJm9F7xI81.S', NULL, '{\"locale\":\"ru\"}', '2020-06-17 05:42:00', '2020-06-17 05:42:00', 'Александровна', 'Колесникова', 1960, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Родилась в семье архитектора, художника А. А. Великанова. Училась в школе, в театральной студии. До рождения первого ребёнка занималась росписью по ткани, шитьём, работала в театрах, в бутафорских и пошивочных цехах. В 1991 г. сделала, как художник спектакль в МХТ &laquo;Нечаянная радость&raquo;, в 1996 г. Художник по костюмам 10 серийного фильма &laquo;Чехов и Ко&raquo;. Работала в антрепризе, как художник по костюмам. Художник-оформитель спектаклей (костюмы для спектаклей \"Нечаянная радость\", \"Кармен\"). Работала на телевидении и в кино.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">С 2000 г работает как свободный художник.&nbsp;</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">В данный момент организатор Мастерской &laquo;КРАСИВЫЕ ВЕЩИ&raquo;. Работы находятся в частных коллекциях в России и по всему миру.</span></p>', NULL, NULL, NULL, 0),
(35, 3, 'Ольга', 'author27@act-art.ru', NULL, 'users/June2020/bKQtBYImhCMrmlmWlh4d.jpg', NULL, '$2y$10$2kwu.9W0JQsn7NAXyvVbBeGcO/gdv2uYHs.VK9PAcKwknxtErA.2y', NULL, '{\"locale\":\"ru\"}', '2020-06-17 06:02:43', '2020-06-17 06:02:43', '', 'Гуревич', 1977, '<p><span style=\"caret-color: #000000; color: #000000; font-size: 12pt; line-height: 18.399999618530273px; font-family: Times;\">Выставляется с 2000года. Медаль от Российской Академии художеств, диплом и медаль от Московского Союза художников &ldquo;За заслуги в развити изобразительного искусства&rdquo;, обладатель многочисленных дипломов художественных выставок. Произведения находятся в музеях, корпоративных и частных коллекциях.&nbsp;</span></p>', 'https://www.facebook.com/olga.gurevich.927', 'https://www.instagram.com/gurevich_olga_art/', NULL, 0),
(36, 3, 'Мария', 'author28@act-art.ru', NULL, 'users/June2020/x3zRw0Dc0zRPRWO5EA5o.JPG', NULL, '$2y$10$mIsB5YplmszJcbRBVXbtNesr27qRbFXl6XtYTAiMkCPsMGVcu5AM.', NULL, '{\"locale\":\"ru\"}', '2020-06-17 06:08:50', '2020-06-17 06:08:50', 'Евгеньевна', 'Суворова', 1973, '<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">С 2001 года преподаватель рисунка в МГАХИ им. В.И.Сурикова.&nbsp;</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">С 2003 года преподаватель рисунка в Академической Школе Дизайна.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Участник выставок МСХ,&nbsp;&nbsp;выставки &laquo;Никонов и ученики&raquo; в Академии художеств,&nbsp;</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Лауреат премии &laquo;Триумф&raquo;</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Участник биеннале современного искусства.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">&nbsp;</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Работы художника находятся: в частных коллекциях России, Канады, Франции, Нидерландов, США, Финляндии, Бельгии, Кипра, Италии, Испании, Южной Кореи, Монако, а также \"Горбачев-фонда\", корпорации \"Северсталь\", банка \"Зенит\", в собрании Государственного центрального музея современной истории России.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">&nbsp;</p>', NULL, NULL, NULL, 0),
(38, 3, 'Павел', 'author29@act-art.ru', NULL, 'users/June2020/GwVb3QCn7FfHajETko7h.jpg', NULL, '$2y$10$sUA1MdRTejAc5AJZGhAEr.qyS8MOzq1py49WgM.EmqGI/xT1v96qe', NULL, '{\"locale\":\"ru\"}', '2020-06-17 06:59:43', '2020-06-17 06:59:43', 'Андреевич', 'Боркунов', 1980, '<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Участие в работе над мозаикой и росписями для храма пр. Нектария Бежецкого, &nbsp;&nbsp;г. Бежецк Тверская область совместно с А.Трегуб, Е. Плотниковым и Е. Буравлевой.&nbsp;</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Участие в работе над мозаиками для храма 5-ти Святителей Московских Дивеевского подворья,&nbsp;г. Нижний Новгород под руководством &nbsp;П. Отдельнова</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Участие в росписях нижнего храма Христа Спасителя, бригада В.Н. Демидова, южный предел, крестильня, бригада В.М. Ананьева, западный предел.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><a name=\"Bookmark\"></a>Работа над мозаиками &nbsp;для резиденции патриарха , Геленджик, под руководством А. Сахарова).<br />Работа над мозаикой Святитель Варсонофий для Свято-Варсонофьевского монастыря<strong><span style=\"font-family: \'Book Antiqua\', serif;\">&nbsp;&nbsp;</span></strong>в Мордовии в сотрудничестве с Анастасией Денеш.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Работа над мозаикой в Храме Покрова Пресвятой Богородицы в Ясеневе под руководством А.Мальцева и А.Денеш. Награжден знаком почета Архимандритом Мелхиседеком в честь освящения Храма Покрова Пресвятой Богородицы в Ясеневе.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Награжден медалью Московского союза художников за заслуги в развитии изобразительного искусства.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Многочисленные работы находятся в&nbsp;&nbsp;музеях изобразительного искусства Российской Федерации: Нижний Тагил, Тула и г. Балашиха. Работы из серии &laquo;Религиозный мистицизм&raquo; включены в государственный каталог Российской Федерации.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><strong>Участие в конкурсах:</strong></p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><strong>Два диплома за участие:</strong></p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">В 2006 и 2007 году в конкурсах под названиями &laquo;Поэзия в искусстве&raquo; и &laquo;Города России&raquo;, организованные Институтом реставрации и Фондом помощи отечественному искусству;</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">&laquo;Кисть как оружие&raquo; от Галереи современного шедевра.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Лауреат&nbsp;<span lang=\"EN-US\">X</span>&nbsp;и&nbsp;<span lang=\"EN-US\">XI</span>&nbsp;юбилейных фестивалей прикладного искусства для детей и молодежи с ограниченными возможностями &laquo;Мы вместе&raquo;, диплом и медаль)</p>', NULL, NULL, NULL, 0),
(39, 3, 'Михаил', 'author30@act-art.ru', NULL, 'users/June2020/eeZpxoYojkiWdkgN3dl2.jpg', NULL, '$2y$10$M.p5Nk4L2d/ZzI31eeJbhO.k0SGS2jTn.ucXYS3DMmA0G8SIqGLr.', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:02:53', '2020-06-17 07:02:53', '', 'Смирнов', NULL, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">С 2017 г. преподает живопись, рисунок и композицию на отделении дополнительного образования МГАХИ им. В. И. Сурикова. С 2018 г. преподает рисунок на факультете живописи в мастерской Ю. А. Шишкова в МГАХИ им. В. И. Сурикова. Также, с 2019 г. ведет курс композиции, интерьерной живописи, а также проводит наброски в студии &laquo;Рукав&raquo;.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">С 1999 года организовывает персональные выставки и принимает участие в групповых выставочных проектах.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Работы художника находятся в коллекциях Московского Союза Художников, МОММА, Grande biblioth&egrave;que,&nbsp;<span lang=\"EN-US\">Diversi</span><span lang=\"EN-US\">&nbsp;</span><span lang=\"EN-US\">t</span>&eacute;&nbsp;<span lang=\"EN-US\">Art</span><span lang=\"EN-US\">&nbsp;</span><span lang=\"EN-US\">ist</span><span lang=\"EN-US\">&nbsp;</span><span lang=\"EN-US\">ique</span><span lang=\"EN-US\">&nbsp;</span><span lang=\"EN-US\">Montr</span>&eacute;<span lang=\"EN-US\">al</span>&nbsp;, Тульского музея.</p>', NULL, NULL, NULL, 0),
(40, 3, 'Айгерим', 'author31@act-art.ru', NULL, 'users/June2020/p2vfYdyvfTy0JR0QVLFM.JPG', NULL, '$2y$10$vf2zq6bn/z/9/FiyEJ4El..wtf588WyZLt9mf4I2.VwN/ok0iuqLG', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:06:42', '2020-06-17 07:06:42', '', 'Сыздыкова ', NULL, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">В 2014 получила грант от Совета изобразительного искусства и литературы Квебека (Conseil des arts et des lettres du Qu&eacute;bec) на создание живописного проекта &laquo;Степь&raquo;. В данный момент работает над серией живописных и графических работ, а также шелкографий &laquo;Оставленные&raquo; &laquo; Abandonn&eacute;s &raquo; осуществляемой благодаря гранту Vivacit&eacute; Montr&eacute;al от Совета изобразительного и литературного искусства Квебека CALQ.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">С 2007 занимается преподавательской деятельностью. С 2017&nbsp;&nbsp;преподает живопись, рисунок и композицию на отделении дополнительного образования МГАХИ им. В. И. Сурикова.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">С 2019&nbsp;&nbsp;ведет курсы по рисунку, живописи и наброску а Арт студии Рукав.</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\">Работы Айгерим, находятся в коллекциях Московского Союза Художников, МОММА, Grande biblioth&egrave;que, Тульского музея изобразительных искусств, галереи Artoth&egrave;que, Музея изобразительных искусств Нижнего Тагила, Atelier Circulaire, а также в частных коллекциях России, Канады, Соединённых штатов и Казахстана.</p>', NULL, NULL, NULL, 0),
(41, 3, 'Елена', 'author32@act-art.ru', NULL, 'users/June2020/pigQn7WrmUczrfXdXXKV.jpg', NULL, '$2y$10$uPFlZRPPXst567.0w0kPseFEWqE8cXv3YKo1YBIbJ24u.DdJdjaZC', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:09:58', '2020-06-17 07:09:58', '', 'Болотских', 1952, '<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><strong><span style=\"font-family: Times;\">Профессор,<br />Кандидат педагогических наук&nbsp;</span></strong></p>\n<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Училась у В.П. Ефанова и В.А. Дрезниной, А.П. Суровцева. С 1978 года участвует в выставках в России и за рубежом.&nbsp;</span></p>\n<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Работает в разных техниках монументально-декоративного искусства: живопись, гобелен, роспись ткани, арт-объекты, объемные композиции, инсталляции. Занимается оформлением интерьеров жилых и общественных зданий.&nbsp;</span></p>\n<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Провела более 100 выставок. Живописные и графические работы находятся в коллекциях российских и зарубежных музеев: США, Франции, Норвегии.</span></p>\n<p style=\"margin-right: 0cm; margin-left: 0cm; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000; text-align: justify;\"><strong><span style=\"font-family: Times;\">Награды:&nbsp;</span></strong><span style=\"font-family: Times;\">Орден Петра Великого первой степени (2006), Золотая медаль Творческого Союза художников России (2008), Лауреат конкурса им. Виктора Попкова международного художественного фонда (2009), Диплом Российской Академии Художеств (2011), Лауреат международного конкурса дизайна &laquo;Грани большого города&raquo; (2012, 2014), Лауреат III Международной выставки современного дизайна &laquo;Non Stop&raquo; при поддержке РАХ в номинации &laquo;Дизайн элементов оформления интерьера&raquo; (2015), Золотая медаль посольства Чили в Москве (2016).&nbsp;</span></p>', NULL, NULL, NULL, 0),
(42, 3, 'Виктор', 'author33@act-art.ru', NULL, 'users/June2020/Zkg6MK7ziYDbgLsBTzYv.jpg', NULL, '$2y$10$43jzMq3AR81RZovTxUZZwuoOA02N5UyhfWmg51q3n4tIlYSKqkeQy', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:24:36', '2020-06-17 07:24:36', 'Савич', 'Куколь', 1936, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1954 &ndash; встреча с В.Н.Бакшеевым определила выбор пути</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">1958 - первое участие на&nbsp;<span lang=\"EN-US\">IV</span>&nbsp;выставке молодых художников&nbsp;&nbsp;Москвы</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">2010 &ndash; награжден Российской академией художеств медалью &laquo;Шувалов&raquo;</p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">2019 - присвоено звание Заслуженный художник РСФСР</p>', NULL, NULL, NULL, 0),
(43, 3, 'Александра', 'author34@act-art.ru', NULL, 'users/June2020/C94kKJTMlD0Od49SbbE1.jpg', NULL, '$2y$10$QbL3NcnaLkxUWxWTntExXOT4WLsLoqXu2YmF7WuGxDJ23y5Ohq0n6', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:30:16', '2020-06-17 07:30:16', '', 'Карелина', 1988, '', 'https://www.facebook.com/ssh.krln', 'https://www.instagram.com/aeaa_aeia', NULL, 0),
(44, 3, 'Анастасия', 'author35@act-art.ru', NULL, 'users/June2020/6K8cGT4COpLlSFaEDgdu.png', NULL, '$2y$10$Lt57cKJke5IikgutZSv8F.PydPf.w4iyWB/zx5ZPpl451k.GoJkIa', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:34:13', '2020-06-17 07:34:13', '', 'Сухарева-Морозова', 1982, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Работы в музейных собраниях, частных коллекциях: BENETTON Foundation, Фонд Лучано Бенеттона, в рамках выставки \"looking eastward\", Тревизо, Италия&nbsp;</span></p>', 'https://www.facebook.com/anastas.morozova', 'https://www.instagram.com/morozova.net.sukhareva/', NULL, 0),
(45, 3, 'Анна', 'author36@act-art.ru', NULL, 'users/June2020/foaeKeKXvFt7Opj7a4zr.jpg', NULL, '$2y$10$TqytZqxtpSZUy3dAbX4bVO2QhwIVn0AQHIYQSEVG8S4h85o6pDaMW', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:36:24', '2020-06-17 07:36:24', '', 'Стоянова', 1985, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Лоскутное одеяло. Каждый, кто его рассматривал, хоть раз задумывался о происхождении</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">кусочков материи. Десятки, а то и сотни тряпиц, у каждой &ndash; своя судьба и особенный путь, каждая из них стала частью целого. Затейливое переплетение пестрых лоскутов рождает неповторимый узор, захватывающий дух и притягивающий взгляды. Случайно попавшие под руку, крошечные клочки превращаются в произведение искусства.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Как часто мы задумываемся о сути вещей, отживших свое? Почему мы так привязываемся к старому хламу и куда девается эта мелочёвка? Пуговицы, транзисторы, лоскуты кожи и обрезки материи, гайки и шестеренки, иголки, наперстки &ndash; все, что мы привыкли беречь в дальнем ящике, приобретает новый смысл в руках художника. Из них Анна Стоянова создает свои удивительные и захватывающие картины.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000; text-align: justify;\"><span style=\"font-family: Times;\">Калейдоскоп мелких деталей, вихрь крупиц чьих-то историй закручивается в настоящее произведение искусства. Главные герои Анны &ndash; мотоциклы, ставшие точкой сборки для самых разных людей. Круизеры и чёпперы, спортбайки и эндуро, дорожные и&nbsp;&nbsp;классические байки &ndash; выбирайте любой. Помимо уже готовых картин, каждый сможет заказать что-то особенное для себя или в подарок близкому человеку.</span></p>', NULL, 'https://www.instagram.com/banofart/?igshid=1fnvovbjwh6eb', NULL, 0),
(46, 3, 'Арсений', 'author37@act-art.ru', NULL, 'users/June2020/GjF16rJmv7ZY8bVVGMky.png', NULL, '$2y$10$qr4hShReBXyYacFygchdh.tPLaoXiigqe/NiLyECW5..gsWwb4z52', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:43:21', '2020-06-17 08:13:39', '', 'Попов', NULL, '', 'https://m.facebook.com/hippiedolphinworld', 'https://www.instagram.com/arsenypopov_', NULL, 0),
(47, 3, 'Артем', 'author38@act-art.ru', NULL, 'users/June2020/aQ09s46wyaEV0HvAcZhE.jpg', NULL, '$2y$10$B18Y5qqfSEG4Ow620HM/HeMuIgPN3aswifITuzQfTV2elYS9HcF86', NULL, '{\"locale\":\"ru\"}', '2020-06-17 07:49:11', '2020-06-17 07:49:11', 'Александрович', 'Стефанов', 1988, '', 'https://www.facebook.com/britva75kg', 'https://www.instagram.com/artem_stefanov/', NULL, 0),
(48, 3, 'Даниил ', 'author39@act-art.ru', NULL, 'users/June2020/TvjDqu0x7B8EKDYTGPpE.jpg', NULL, '$2y$10$V6Pwh5/hjlSurruam01fy./QeuhPKx2LcGsjaMJ4wYIzPqlRfmCvq', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:16:53', '2020-06-17 08:16:53', '1994', 'Хайрутдинов', NULL, '', 'http://www.facebook.com/dadaniil', 'http://www.instagram.com/rafflesia.amorphophallus', NULL, 0),
(49, 3, 'Денис', 'author40@act-art.ru', NULL, 'users/June2020/YqtYB2h6EmDcOyOWExAx.png', NULL, '$2y$10$dNpi.tY5cklC2TYSSdzLv.NfJluHBSF/ycREL8U5zXR4MIWSfgThW', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:18:58', '2020-06-17 08:18:58', 'Андреевич', 'Аверьянов', 1981, '', 'http://www.facebook.com/dzeniktruestilo', 'https://www.instagram.com/denisaveryanow/', NULL, 0),
(50, 3, 'Евгения', 'author41@act-art.ru', NULL, 'users/June2020/2h8CT26fvXufH1u8k2rr.jpg', NULL, '$2y$10$0NfRAqcuD/hns/7EqPHScu.vvS/hEoHOOid.Z4jYe..IbZ3d6IqTi', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:22:32', '2020-06-17 08:24:52', 'Дмитриевна', 'Филатов', 1988, '', NULL, NULL, NULL, 0),
(51, 3, 'Екатерина', 'author42@act-art.ru', NULL, 'users/June2020/e0sUCqkf9zsvTVKGHZba.jpg', NULL, '$2y$10$lgRT.LwB2OWrbtBIGUMo/O.iIAAdreoiwlQ5ZDJ0Otw9YjAVz/CfK', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:24:42', '2020-06-17 08:24:42', 'Викторовна', 'Олысыч', 1988, '', 'https://www.facebook.com/ekaterina.olysych', 'https://www.instagram.com/line.line_point/', NULL, 0),
(52, 3, 'Екатерина', 'author43@act-art.ru', NULL, 'users/June2020/8MtawPL5OMINPme2XUVQ.jpg', NULL, '$2y$10$6WW2D6qFFsN6yVo16HmBWee/1sNuUmAc/5ML5tfX25LadUNL78Huu', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:28:19', '2020-06-17 08:28:19', 'Михайловна', 'Ястребова', 1997, '', 'http://www.facebook.com/katekyastrebova', 'http://www.instagram.com/suki_saan/', NULL, 0),
(53, 3, 'Зарина', 'author44@act-art.ru', NULL, 'users/June2020/FfCy2WwKaKjlv0EFoqR4.png', NULL, '$2y$10$S6BACXR7Z1tqS459bHwfOeKAPQws2dm.VoARKR2SwB7hFwraucZga', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:34:43', '2020-06-17 08:34:43', 'Ришатовна', 'Габдрахманова', 1992, '', 'https://www.facebook.com/ZareRahmanova', 'https://www.instagram.com/o.zarenie/', NULL, 0),
(54, 3, 'Кирилл', 'author45@act-art.ru', NULL, 'users/June2020/8Qlfx7WkzETO3q4s4EPs.jpg', NULL, '$2y$10$rWstnpl0WzASjdRRwL1sKOgn9R6xyC/6EfxAY0VAMm.d63hcC7Lpi', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:39:40', '2020-06-17 08:39:40', '', 'Стефанов', 1987, '<div class=\"page\" style=\"caret-color: #000000; color: #000000;\" title=\"Page 1\">\n<div class=\"section\">\n<div class=\"layoutArea\">\n<div class=\"column\">\n<p><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">Меня&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">как художника</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">захватывает мир незримого</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">связей и случайных взаимодействий</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">как в публичном пространстве</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">так и в галерейном</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">.&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">Если говорить про галерею</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">как про место для подготовленного зрителя</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">то особенно интересно наблюдать за зрительским вниманием и его распределением</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">фильтрацией поступающих образов</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">.&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">Вот эта конкуренция объектов и образов в их странном понимании мне кажется местом встречи</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">связи и напряжения</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">т</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">.</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">е</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">.&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">основных сюжетных состояний</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">,&nbsp;</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">составленных в моих работах</span><span style=\"font-size: 10pt; font-family: ArialMT; color: #222222;\">.</span></p>\n</div>\n</div>\n</div>\n</div>', 'https://www.facebook.com/kirill.stefanov', 'https://www.instagram.com/well_known_artist/', NULL, 0),
(55, 3, 'Кирилл', 'author46@act-art.ru', NULL, 'users/June2020/WjXvI2cvlWlQFa6wW9eH.jpg', NULL, '$2y$10$8bAsjbf1doBrv32sVCrI2eZyZEiP8U0VoSRMS45ksJoJhRqnKQsHu', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:42:00', '2020-06-17 08:42:00', '', 'Ashesteen', 1989, '', 'https://www.facebook.com/profile.php?id=100001495071826', 'http://instagram.com/ashesteen', NULL, 0),
(56, 3, 'Иван', 'author47@act-art.ru', NULL, 'users/June2020/sGmtFXXs6uxlyYqhsPA5.png', NULL, '$2y$10$JWo2xmRSbr/D/NTX.ZL6bel7.8FYQKxA5VrxEBHn2GmVapA1YZI1e', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:48:16', '2020-06-17 08:48:16', 'Сергеевич', 'Максимов', 1989, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">2019 - \"Энциклопедия российского уличного искусства\". Артмосфера.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">2019 - Каталог II Уральской Триеннале Декоративного Искусства. Екатеринбург. Издательство \"Архитектон\".</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">2018 - Альбом &ldquo;Части Стен 2&rdquo;. Автор Алексей Партола. Издательство Ось.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">2018 - Книга &ldquo;Части Стен&rdquo;. Автор Алексей Партола. Издательство Ось.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">2018 - Международный арт-проект с каллиграфами - книга &ldquo;Маша пишет&rdquo;. Автор Мария Осипова.</span></p>\n<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">2017 - Документальный Фильм &ldquo;В Открытую&rdquo;. Автор Никита Nomerz.</span></p>', 'https://www.facebook.com/ivan.astro.maximov', 'https://www.instagram.com/astroscamp/', NULL, 0),
(57, 3, 'Назарий', 'author48@act-art.ru', NULL, 'users/June2020/TZb3DSclAVBe75fqOmF6.jpg', NULL, '$2y$10$AnuBEQUh7dNeRLoDDJXabez7SU7yDTmU/QzV80BVXo8HTXz.4iAgS', NULL, '{\"locale\":\"ru\"}', '2020-06-17 08:55:17', '2020-06-17 08:55:17', 'Викторович', 'Кульчицкий', 1990, '<p><span style=\"caret-color: #000000; color: #000000; font-size: 12pt; font-family: Times;\">Назар ISSUE &mdash; граффити художник, создающий шрифтовые композиции и абстрактно-геометрические сюжеты, экспериментируя с материалом, техникой и носителем, работающий как в пространстве улицы, так&nbsp;&nbsp;и в студийном формате. Стилистика и подход&nbsp;&nbsp;отображает интерес к современным технологиям, типографике, диджитал эстетике и новым визуальным решениям, находясь в постоянном поиске сочетания цвета с формой, естественных и небрежных текстур с геометрическими объектами, отдавая значительную долю импровизации в процессе работы.</span></p>', NULL, 'https://instagram.com/_iss.ue', NULL, 0),
(58, 3, 'Никита', 'author49@act-art.ru', NULL, 'users/June2020/l6W4noL444AhRJNRDjZL.jpg', NULL, '$2y$10$HtA9CTSXqI490NhmWxmSHelvsmAH9SzrJebYoVMP37wM3oQuYzaVS', NULL, '{\"locale\":\"ru\"}', '2020-06-17 09:13:07', '2020-06-17 09:13:07', 'Максимович', 'Ходак', 1992, '<p>Художественную карьеру начал с рисования граффити в 2006 году. Участник различных фестивалей мьюрал-арта в России и странах СНГ. Активно занимается живописью и трафаретной печатью.</p>\n<p>С 2017 года Никита сфокусирован на поиске совершенных вариантов сочетания пост-цифрового визуального дизайна с изобразительным искусством для создания полусинтетических артефактов.</p>\n<p>Художник внедряет машинное обучение, печать, AR-анимацию в классическую живописную среду, чтобы достичь новой визуальной формы и эстетического опыта.</p>\n<p>Смешивая концептуальную ироническую философию постмодернизма с современными идеями пост-правды, художник пытается задавать актуальные вопросы относительно проблем, касающихся темной стороны технологического прогресса.</p>', 'https://www.facebook.com/khodak.nikita', 'https://www.instagram.com/khodaknikita/', NULL, 0);
INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `phone`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `middlename`, `surname`, `year`, `text`, `fb`, `inst`, `beh`, `ban`) VALUES
(59, 3, 'Николай', 'author50@act-art.ru', NULL, 'users/June2020/jzCoipmw637es5p4ow9p.jpg', NULL, '$2y$10$eR5yuCpzn2NMT26eFH2mX.pBJw0odBNlwTrc8lXnGoKRDrbV.au.y', NULL, '{\"locale\":\"ru\"}', '2020-06-17 09:15:21', '2020-06-17 09:15:21', '', 'Ладо', 1996, '', 'https://www.facebook.com/milk.lumpen', 'https://instagram.com/lado.nicolas?igshid=pl57hh3hk64i', NULL, 0),
(60, 3, 'Олег', 'author51@act-art.ru', NULL, 'users/June2020/aX1Upar9yvJ0FbRbZOxL.jpg', NULL, '$2y$10$99LWcg7yxmsO8PIvnpdQwuBEMQQl31d2XkSGtZ1VVkoazu29/ZHX6', NULL, '{\"locale\":\"ru\"}', '2020-06-17 09:17:25', '2020-06-17 09:17:25', 'Владимирович', 'Бородин', 1988, '', 'https://www.facebook.com/olegborodincollages/', 'https://www.instagram.com/olegborodincollages/', NULL, 0),
(61, 3, 'Сергей', 'author52@act-art.ru', NULL, 'users/June2020/L2gSnSrwkjsCHxmYCTet.jpg', NULL, '$2y$10$q.dIKFZZ4QiWYOoXzY.Hl.WjcZl4Hv7yZAVf2RhC7GolpJz7Yaml.', NULL, '{\"locale\":\"ru\"}', '2020-06-17 09:24:17', '2020-06-17 09:24:17', 'Юрьевич', 'Овсейкин', 1988, '', 'https://web.facebook.com/zukclub?ref=bookmarks', 'http://zukclub.com', NULL, 0),
(62, 3, 'Сюгир', 'author53@act-art.ru', NULL, 'users/June2020/9AJJJMX1r8r6VuZO29sw.jpg', NULL, '$2y$10$2cXc4WIxIS0Fe592mpVpsOPJe2CahBWoq6lNsUZnprubg1OhDMTHO', NULL, '{\"locale\":\"ru\"}', '2020-06-17 09:28:19', '2020-06-17 09:28:19', '', 'Булуктаев', 1994, '<p class=\"MsoNormal\" style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: Calibri, sans-serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">Работы художника находятся в&nbsp;Национальном музее им. Пальмова, Элиста, Калмыкия.</span></p>', NULL, 'https://www.instagram.com/su.igir/', NULL, 0),
(63, 3, 'Alexey ', 'author54@act-art.ru', NULL, 'users/June2020/0cfkzbAeKtYSwSrSWpWs.', NULL, '$2y$10$QmbF5pUn1eJEj4rBT1vBXOZvomW8FoFQgLUIImr0xMGani1S8rkXK', NULL, '{\"locale\":\"ru\"}', '2020-06-17 09:31:47', '2020-06-17 09:31:47', '', 'Kio', 1983, '', 'https://www.facebook.com/alexey.gurov11', 'https://www.instagram.com/lesha_kio', NULL, 0),
(64, 3, 'Мара', 'author55@act-art.ru', NULL, 'users/June2020/rf2DtPbJ4LTriw7jIczN.JPG', NULL, '$2y$10$0eLjjPtdwWFbfcimUYMHIeq9xqu6bnpdSQqUGHwLc6c8Yn.emKaYO', NULL, '{\"locale\":\"ru\"}', '2020-06-25 07:50:54', '2020-06-25 07:55:48', '', 'Даугавиете', 1955, '<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Мара Даугавиете - участник зарубежных выставок в Польше, Финляндии, Китае, Сербии, Латвии, других странах.</p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\">Произведения художника находятся в собраниях музеев республик бывшего Союза, в частных коллекциях в России, на Кипре, в Финляндии, ФРГ, Франции, Австрии, Испании, Италии, Дании, Швеции, Латвии.</p>', NULL, NULL, NULL, 0),
(65, 3, 'Виталий', 'author56@act-art.ru', NULL, 'users/June2020/amhKjR5lGRz7eAGhU5w9.jpg', NULL, '$2y$10$QSzpjN0RYQDWy6vfOsEi9uBJFIpiH0MnTcFiOmovvZIjI7yWMMVei', NULL, '{\"locale\":\"ru\"}', '2020-06-30 10:18:51', '2020-06-30 10:18:51', 'Владимирович', 'Беспятый', NULL, '<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">Участие в различных российских и международных пленэрах.</span></p>\n<p style=\"margin: 0cm 0cm 0.0001pt; font-size: medium; font-family: \'Times New Roman\', serif; caret-color: #000000; color: #000000;\"><span style=\"font-family: Times;\">Преподавательская деятельность в МИЭМ, ВШЭ, МГАХИ им. В.И.Сурикова.<br />Работы находятся в Тульском государственном музее, в частных коллекциях России, Европы.</span></p>', NULL, NULL, NULL, 0),
(66, 2, 'petr', 'petr6@bk.ru', NULL, 'users/default.png', NULL, '$2y$10$hf2dg/wRa22mtwVXiKP7h.H1Y7kyYfGRaKR/m94aViwJ6s.6VsUT6', NULL, NULL, '2020-08-27 13:51:32', '2020-08-27 13:51:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(67, 2, 'Radik', 'kvner.ru@yandex.ru', NULL, 'users/default.png', NULL, '$2y$10$TZW47gwy0TPpb5VBwwl8meeH.2Noehhfh602zGfDyOEtHPNi.6iAu', NULL, NULL, '2020-09-28 09:48:07', '2020-09-28 09:48:07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(68, 2, 'Вовка', 'info@dkmiit.ru', NULL, 'users/default.png', NULL, '$2y$10$me1VNEVLBqdUq5o1aK2F/.Jexmdgjv6ifhCJ.GAqDXpCV4GiLl922', NULL, NULL, '2020-10-06 05:05:57', '2020-10-06 05:05:57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_auction`
--

CREATE TABLE `user_auction` (
  `user_id` bigint UNSIGNED NOT NULL,
  `auction_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_auction`
--

INSERT INTO `user_auction` (`user_id`, `auction_id`) VALUES
(1, 2),
(1, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `auctions`
--
ALTER TABLE `auctions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bets`
--
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bets_user_id_foreign` (`user_id`),
  ADD KEY `bets_lot_id_foreign` (`lot_id`);

--
-- Индексы таблицы `category_lot`
--
ALTER TABLE `category_lot`
  ADD KEY `category_lot_lot_id_foreign` (`lot_id`),
  ADD KEY `category_lot_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `exhibits`
--
ALTER TABLE `exhibits`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `exhibit_user`
--
ALTER TABLE `exhibit_user`
  ADD KEY `exhibit_user_user_id_foreign` (`user_id`),
  ADD KEY `exhibit_user_exhibit_id_foreign` (`exhibit_id`);

--
-- Индексы таблицы `experts`
--
ALTER TABLE `experts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_user_id_foreign` (`user_id`),
  ADD KEY `favorites_lot_id_foreign` (`lot_id`);

--
-- Индексы таблицы `frames`
--
ALTER TABLE `frames`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `frame_lot`
--
ALTER TABLE `frame_lot`
  ADD KEY `frame_lot_lot_id_foreign` (`lot_id`),
  ADD KEY `frame_lot_frame_id_foreign` (`frame_id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_user`
--
ALTER TABLE `group_user`
  ADD KEY `group_user_user_id_foreign` (`user_id`),
  ADD KEY `group_user_group_id_foreign` (`group_id`);

--
-- Индексы таблицы `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lots_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `lot_images`
--
ALTER TABLE `lot_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lot_images_lot_id_foreign` (`lot_id`);

--
-- Индексы таблицы `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `material_lot`
--
ALTER TABLE `material_lot`
  ADD KEY `material_lot_lot_id_foreign` (`lot_id`),
  ADD KEY `material_lot_material_id_foreign` (`material_id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Индексы таблицы `post_tag`
--
ALTER TABLE `post_tag`
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Индексы таблицы `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `profession_user`
--
ALTER TABLE `profession_user`
  ADD KEY `profession_user_user_id_foreign` (`user_id`),
  ADD KEY `profession_user_profession_id_foreign` (`profession_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `spaces`
--
ALTER TABLE `spaces`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `studies`
--
ALTER TABLE `studies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `study_user`
--
ALTER TABLE `study_user`
  ADD KEY `study_user_user_id_foreign` (`user_id`),
  ADD KEY `study_user_study_id_foreign` (`study_id`);

--
-- Индексы таблицы `styles`
--
ALTER TABLE `styles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `style_lot`
--
ALTER TABLE `style_lot`
  ADD KEY `style_lot_lot_id_foreign` (`lot_id`),
  ADD KEY `style_lot_style_id_foreign` (`style_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `techniques`
--
ALTER TABLE `techniques`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `technique_lot`
--
ALTER TABLE `technique_lot`
  ADD KEY `technique_lot_lot_id_foreign` (`lot_id`),
  ADD KEY `technique_lot_technique_id_foreign` (`technique_id`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_auction`
--
ALTER TABLE `user_auction`
  ADD KEY `user_auction_user_id_foreign` (`user_id`),
  ADD KEY `user_auction_auction_id_foreign` (`auction_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auctions`
--
ALTER TABLE `auctions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `bets`
--
ALTER TABLE `bets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `exhibits`
--
ALTER TABLE `exhibits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=715;

--
-- AUTO_INCREMENT для таблицы `experts`
--
ALTER TABLE `experts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `frames`
--
ALTER TABLE `frames`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `lots`
--
ALTER TABLE `lots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `lot_images`
--
ALTER TABLE `lot_images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `professions`
--
ALTER TABLE `professions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `spaces`
--
ALTER TABLE `spaces`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `studies`
--
ALTER TABLE `studies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT для таблицы `styles`
--
ALTER TABLE `styles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `techniques`
--
ALTER TABLE `techniques`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=470;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bets`
--
ALTER TABLE `bets`
  ADD CONSTRAINT `bets_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `exhibit_user`
--
ALTER TABLE `exhibit_user`
  ADD CONSTRAINT `exhibit_user_exhibit_id_foreign` FOREIGN KEY (`exhibit_id`) REFERENCES `exhibits` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exhibit_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `favorites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `frame_lot`
--
ALTER TABLE `frame_lot`
  ADD CONSTRAINT `frame_lot_frame_id_foreign` FOREIGN KEY (`frame_id`) REFERENCES `frames` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `frame_lot_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `group_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lots`
--
ALTER TABLE `lots`
  ADD CONSTRAINT `lots_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lot_images`
--
ALTER TABLE `lot_images`
  ADD CONSTRAINT `lot_images_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `material_lot`
--
ALTER TABLE `material_lot`
  ADD CONSTRAINT `material_lot_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `material_lot_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `profession_user`
--
ALTER TABLE `profession_user`
  ADD CONSTRAINT `profession_user_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `profession_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `study_user`
--
ALTER TABLE `study_user`
  ADD CONSTRAINT `study_user_study_id_foreign` FOREIGN KEY (`study_id`) REFERENCES `studies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `study_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `style_lot`
--
ALTER TABLE `style_lot`
  ADD CONSTRAINT `style_lot_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `style_lot_style_id_foreign` FOREIGN KEY (`style_id`) REFERENCES `styles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `technique_lot`
--
ALTER TABLE `technique_lot`
  ADD CONSTRAINT `technique_lot_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `technique_lot_technique_id_foreign` FOREIGN KEY (`technique_id`) REFERENCES `techniques` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_auction`
--
ALTER TABLE `user_auction`
  ADD CONSTRAINT `user_auction_auction_id_foreign` FOREIGN KEY (`auction_id`) REFERENCES `auctions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_auction_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
