-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 24 2024 г., 17:38
-- Версия сервера: 8.0.19
-- Версия PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `talent`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1704429843),
('user', '5', 1705984198),
('user', '1', 1712722551),
('user', '6', 1712815857),
('author', '6', 1712818868);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/rbac/*', 2, NULL, NULL, NULL, 1704429516, 1704429516),
('/debug/*', 2, NULL, NULL, NULL, 1704429516, 1704429516),
('/gii/*', 2, NULL, NULL, NULL, 1704429516, 1704429516),
('accessAdmin', 2, NULL, NULL, NULL, 1704429528, 1704429528),
('admin', 1, NULL, NULL, NULL, 1704429565, 1704429565),
('user', 1, NULL, NULL, NULL, 1705984099, 1705984099),
('/user/*', 2, NULL, NULL, NULL, 1707730275, 1707730275),
('/api/*', 2, NULL, NULL, NULL, 1707732290, 1707732290),
('/my/*', 2, NULL, NULL, NULL, 1712722517, 1712722517),
('accessUser', 2, NULL, NULL, NULL, 1712722532, 1712722532),
('/cabinet/*', 2, NULL, NULL, NULL, 1712722593, 1712722593),
('accessAuthor', 2, NULL, NULL, NULL, 1712722625, 1712722625),
('author', 1, NULL, NULL, NULL, 1712818857, 1712818857);

-- --------------------------------------------------------

--
-- Структура таблицы `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('accessAdmin', '/debug/*'),
('accessAdmin', '/gii/*'),
('accessAdmin', '/rbac/*'),
('admin', 'accessAdmin'),
('accessAdmin', '/admin/*'),
('accessAdmin', '/cabinet/*'),
('accessMy', '/my/*'),
('accessAdmin', '/api/*'),
('accessUser', '/my/*'),
('user', 'accessUser'),
('accessAuthor', '/cabinet/*'),
('admin', 'accessAuthor'),
('author', 'accessAuthor');

-- --------------------------------------------------------

--
-- Структура таблицы `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int DEFAULT NULL,
  `updated_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE `menu` (
  `id` int NOT NULL,
  `name` varchar(128) NOT NULL,
  `parent` int DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `sort`, `name`, `date_create`, `active`) VALUES
(1, 1, 'I believe that no matter what happens to me I will inevitably bounce back', '2024-04-16 17:27:41', 0),
(2, 2, 'I am energized when I help someone experience success', '2024-04-16 17:27:41', 0),
(3, 3, 'I am excited every time I act spontaneously', '2024-04-16 17:27:41', 0),
(4, 4, 'I believe in lifelong learning', '2024-04-16 17:27:41', 0),
(5, 5, 'I love taking control of situations that seem to be out of control', '2024-04-16 17:27:41', 0),
(6, 6, 'I am energized every time I cross another item off my to-do list', '2024-04-16 17:27:41', 0),
(7, 7, 'I love taking necessary risks', '2024-04-16 17:27:41', 0),
(8, 8, 'I am excited when I get people to sacrifice their egos for the benefit of the group', '2024-04-16 17:27:41', 0),
(9, 9, 'I believe the time is too precious to be wasted by being disorganized', '2024-04-16 17:27:41', 0),
(10, 10, 'I get a jolt of energy when I get to act altruistically', '2024-04-16 17:27:41', 0),
(11, 11, 'I enjoy my time alone when I can muse and reflect undisturbed', '2024-04-16 17:27:41', 0),
(12, 12, 'The freedom to express all of my emotions from laughing to crying is important to me', '2024-04-16 17:27:41', 0),
(13, 13, 'I naturally see patterns where others see complexity', '2024-04-16 17:27:41', 0),
(14, 14, 'I believe that everyone needs a coach in their life', '2024-04-16 17:27:41', 0),
(15, 15, 'I naturally take mental ownership and responsibility for even the smallest things I commit to', '2024-04-16 17:27:41', 0),
(16, 16, 'I love restoring things and bringing them back to life', '2024-04-16 17:27:41', 0),
(17, 17, 'I am energized when I get to speak in front of the audience', '2024-04-16 17:27:41', 0),
(18, 18, 'I am thrilled every time I get to compete with others', '2024-04-16 17:27:41', 0),
(19, 19, 'It is important for me to collect as much data as possible to make an informed decision', '2024-04-16 17:27:41', 0),
(20, 20, 'It is natural for me to look for common ground among people', '2024-04-16 17:27:41', 0),
(21, 21, 'I am excited every time I get to turn a new idea into action', '2024-04-16 17:27:41', 0),
(22, 22, 'I believe it is important to tell the truth to others, even if this truth is bitter', '2024-04-16 17:27:41', 0),
(23, 23, 'I love connecting dots that seemingly have nothing in common', '2024-04-16 17:27:41', 0),
(24, 24, 'I enjoy challenging people to prove their points of view', '2024-04-16 17:27:41', 0),
(25, 25, 'I value flexibility today more than long-term commitments', '2024-04-16 17:27:41', 0),
(26, 26, 'I am thrilled to celebrate even the smallest of achievements', '2024-04-16 17:27:41', 0),
(27, 27, 'It is natural for me to get lost in thoughts', '2024-04-16 17:27:41', 0),
(28, 28, 'I believe if you can’t do it right, don’t do it', '2024-04-16 17:27:41', 0),
(29, 29, 'I enjoy putting myself into other people’s shoes to understand what they are going through', '2024-04-16 17:27:41', 0),
(30, 30, 'It is natural for me to figure out what\'s wrong and find solutions to it', '2024-04-16 17:27:41', 0),
(31, 31, 'I believe there is more of what unites people rather than what divides them', '2024-04-16 17:27:41', 0),
(32, 32, 'I believe there is always more than one way to reach the same goal', '2024-04-16 17:27:41', 0),
(33, 33, 'I enjoy setting goals and defining priorities to achieve them', '2024-04-16 17:27:41', 0),
(34, 34, 'I believe the gold medal is the only medal to aim for', '2024-04-16 17:27:41', 0),
(35, 35, 'It is important for me to have no limits to creative expression', '2024-04-16 17:27:41', 0),
(36, 36, 'I believe there are no conditions under which personal values can be sacrificed', '2024-04-16 17:27:41', 0),
(37, 37, 'I love turning clutter and chaos into order and structure', '2024-04-16 17:27:41', 0),
(38, 38, 'I believe the best way of learning is by doing', '2024-04-16 17:27:41', 0),
(39, 39, 'I believe no problems resolve by themselves', '2024-04-16 17:27:41', 0),
(40, 40, 'I enjoy thinking about \"what if\" scenarios', '2024-04-16 17:27:41', 0),
(41, 41, 'Delivering upon what I promised gives me a great dose of satisfaction', '2024-04-16 17:27:41', 0),
(42, 42, 'I believe multitasking is ineffective for achieving meaningful results', '2024-04-16 17:27:41', 0),
(43, 43, 'I believe that work not only can but also should be fun', '2024-04-16 17:27:41', 0),
(44, 44, 'It is natural for me to be genuinely interested in other people’s growth', '2024-04-16 17:27:41', 0),
(45, 45, 'I am good at staying objective and logical when dealing with emotional issues', '2024-04-16 17:27:41', 0),
(46, 46, 'I am energized by mental activity', '2024-04-16 17:27:41', 0),
(47, 47, 'I am excited every time I get to follow my natural curiosity', '2024-04-16 17:27:41', 0),
(48, 48, 'I feel excited when I manage to build a bridge between people with diverging opinions', '2024-04-16 17:27:41', 0),
(49, 49, 'It is natural for me to trust myself, my strengths, and my instinct in any situation', '2024-04-16 17:27:41', 0),
(50, 50, 'It\'s natural for me to find the positive in every situation', '2024-04-16 17:27:41', 0),
(51, 51, 'I get excited convincing others just for the sake of winning the argument', '2024-04-16 17:27:41', 0),
(52, 52, 'I believe life happens one day at a time, there is no need to plan it', '2024-04-16 17:27:41', 0),
(53, 53, 'It\'s natural for me to sense the feelings of people around me', '2024-04-16 17:27:41', 0),
(54, 54, 'I get excited when analyzing & dealing with numbers', '2024-04-16 17:27:41', 0),
(55, 55, 'It is natural for me to come up with a million new ideas a day', '2024-04-16 17:27:41', 0),
(56, 56, 'It is natural for me to quickly adjust to changing circumstances', '2024-04-16 17:27:41', 0),
(57, 57, 'I naturally find a sense of greater purpose in everything that I do', '2024-04-16 17:27:41', 0),
(58, 58, 'I love getting things done by doing one thing at a time', '2024-04-16 17:27:41', 0),
(59, 59, 'I feel excited when I find a solution to a problem others cannot solve', '2024-04-16 17:27:41', 0),
(60, 60, 'It is natural for me to voice my opinion, even if it is contrary to others', '2024-04-16 17:27:41', 0),
(61, 61, 'I am energized by stimulating other people to go a step further', '2024-04-16 17:27:41', 0),
(62, 62, 'I enjoy following a specific step-by-step plan to get things done on time', '2024-04-16 17:27:41', 0),
(63, 63, 'I believe how you present is more important than what you present', '2024-04-16 17:27:41', 0),
(64, 64, 'I get energized every time I anticipate the needs of others without them saying a word', '2024-04-16 17:27:41', 0),
(65, 65, 'I am energized by thinking outside of the box', '2024-04-16 17:27:41', 0),
(66, 66, 'I learn new things faster than others', '2024-04-16 17:27:41', 0),
(67, 67, 'I believe that competition is the best driver for achieving excellence', '2024-04-16 17:27:41', 0),
(68, 68, 'It is natural for me to keep myself & others on task and on point', '2024-04-16 17:27:41', 0),
(69, 69, 'I believe that following through with commitments defines a person\'s reputation', '2024-04-16 17:27:41', 0),
(70, 70, 'It is natural for me to energize people to act', '2024-04-16 17:27:41', 0),
(71, 71, 'It is natural for me to set up routines, schedules, timelines, and deadlines', '2024-04-16 17:27:41', 0),
(72, 72, 'I believe everyone should help each other to reach their full potential', '2024-04-16 17:27:41', 0),
(73, 73, 'I feel excited every time I am in charge', '2024-04-16 17:27:41', 0),
(74, 74, 'I enjoy thinking of all alternative ways to find the best route', '2024-04-16 17:27:41', 0),
(75, 75, 'I believe the best way to achieve success is by focusing on one thing', '2024-04-16 17:27:41', 0),
(76, 76, 'I believe a great idea is more important than its implementation', '2024-04-16 17:27:41', 0),
(77, 77, 'I believe theory should always precede practice', '2024-04-16 17:27:41', 0),
(78, 78, 'When I hear something is too ambitious or even impossible - I feel excited to do it', '2024-04-16 17:27:41', 0),
(79, 79, 'I believe there are problems everywhere waiting to be solved', '2024-04-16 17:27:41', 0),
(80, 80, 'I believe success is not limited to money or prestige', '2024-04-16 17:27:41', 0),
(81, 81, 'I believe actions speak louder than words', '2024-04-16 17:27:41', 0),
(82, 82, 'I naturally compare my results with others and therefore always strive for the best', '2024-04-16 17:27:41', 0),
(83, 83, 'I am thrilled by sudden changes, unforeseen detours, and surprises', '2024-04-16 17:27:41', 0),
(84, 84, 'I often get excited for no other reason than just being alive', '2024-04-16 17:27:41', 0),
(85, 85, 'I find joy in finding the right words to craft the most powerful message', '2024-04-16 17:27:41', 0),
(86, 86, 'I believe that facts and numbers are the best proof for any point of view', '2024-04-16 17:27:41', 0),
(87, 87, 'I believe surprises are great when they are planned ahead of time', '2024-04-16 17:27:41', 0),
(88, 88, 'I believe nothing is impossible if you believe in yourself', '2024-04-16 17:27:41', 0),
(89, 89, 'I believe that learning a bit from every field is better than focusing on just one', '2024-04-16 17:27:41', 0),
(90, 90, 'It is natural for me to capture people\'s attention', '2024-04-16 17:27:41', 0),
(91, 91, 'I enjoy starting something new, even if I am not the one finishing it', '2024-04-16 17:27:41', 0),
(92, 92, 'I believe we can reach better solutions through open confrontation', '2024-04-16 17:27:41', 0),
(93, 93, 'I believe you don\'t have to agree with everyone to understand how they feel', '2024-04-16 17:27:41', 0),
(94, 94, 'I believe profound thoughts cannot be hurried - they take time to incubate', '2024-04-16 17:27:41', 0),
(95, 95, 'I believe that even the most disadvantageous peace is better than any direct conflict', '2024-04-16 17:27:41', 0),
(96, 96, 'I believe stories are the best way to get a point across', '2024-04-16 17:27:41', 0),
(97, 97, 'I believe that seeing the glass half-full or half-empty is a personal choice', '2024-04-16 17:27:41', 0),
(98, 98, 'I am driven by the feeling of greater purpose', '2024-04-16 17:27:41', 0),
(99, 99, 'I am energized by the mere fact of learning something new, regardless of what it is', '2024-04-16 17:27:41', 0),
(100, 100, 'I believe you can\'t solve a puzzle by looking at every piece individually', '2024-04-16 17:27:41', 0),
(101, 101, 'I am good at finding simplicity in the midst of complexity', '2024-04-16 17:27:41', 0),
(102, 102, 'It is natural for me to align everything I do with my core values', '2024-04-16 17:27:41', 0),
(103, 103, 'I am good at taking a fresh and creative perspective on even the most mundane things', '2024-04-16 17:27:41', 0),
(104, 104, 'I am good at activating people around me and building the momentum', '2024-04-16 17:27:41', 0),
(105, 105, 'I am good at going with the flow and focusing on the present moment', '2024-04-16 17:27:41', 0),
(106, 106, 'I am good at spotting potential in others and helping them realize it', '2024-04-16 17:27:41', 0),
(107, 107, 'It is natural for me to be direct and decisive', '2024-04-16 17:27:41', 0),
(108, 108, 'I am good at getting things done', '2024-04-16 17:27:41', 0),
(109, 109, 'I am good at making others feel heard, understood, and included', '2024-04-16 17:27:41', 0),
(110, 110, 'I am good at determining what is important and essential to the task at hand', '2024-04-16 17:27:41', 0),
(111, 111, 'I am good at making even the most boring tasks exciting', '2024-04-16 17:27:41', 0),
(112, 112, 'I am good at keeping conflicts around me to a minimum', '2024-04-16 17:27:41', 0),
(113, 113, 'I am good at drawing lessons from any experience I go through', '2024-04-16 17:27:41', 0),
(114, 114, 'I am good at assessing risks', '2024-04-16 17:27:41', 0),
(115, 115, 'I am good at instilling certainty and confidence in other people', '2024-04-16 17:27:41', 0),
(116, 116, 'I am good at explaining, describing, and entertaining', '2024-04-16 17:27:41', 0),
(117, 117, 'I am good at thinking several steps ahead', '2024-04-16 17:27:41', 0),
(118, 118, 'It is natural for me to rehearse conversations in my head that I intend to have later', '2024-04-16 17:27:41', 0),
(119, 119, 'I am good at paying attention to details', '2024-04-16 17:27:41', 0),
(120, 120, 'I am good at turning any mundane task into a game or challenge', '2024-04-16 17:27:41', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `questions_talent`
--

CREATE TABLE `questions_talent` (
  `id` int NOT NULL,
  `questions_id` int NOT NULL,
  `talent_id` int NOT NULL,
  `active` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `questions_talent`
--

INSERT INTO `questions_talent` (`id`, `questions_id`, `talent_id`, `active`) VALUES
(1, 1, 15, 0),
(2, 2, 6, 0),
(3, 3, 5, 0),
(4, 4, 13, 0),
(5, 5, 7, 0),
(6, 6, 8, 0),
(7, 7, 15, 0),
(8, 8, 12, 0),
(9, 9, 19, 0),
(10, 10, 2, 0),
(11, 11, 18, 0),
(12, 12, 9, 0),
(13, 13, 17, 0),
(14, 14, 6, 0),
(15, 15, 8, 0),
(16, 16, 14, 0),
(17, 17, 16, 0),
(18, 18, 20, 0),
(19, 19, 1, 0),
(20, 20, 12, 0),
(21, 21, 4, 0),
(22, 22, 7, 0),
(23, 23, 3, 0),
(24, 24, 1, 0),
(25, 25, 5, 0),
(26, 26, 11, 0),
(27, 27, 18, 0),
(28, 28, 15, 0),
(29, 29, 10, 0),
(30, 30, 14, 0),
(31, 31, 12, 0),
(32, 32, 17, 0),
(33, 33, 10, 0),
(34, 34, 20, 0),
(35, 35, 3, 0),
(36, 36, 2, 0),
(37, 37, 19, 0),
(38, 38, 4, 0),
(39, 39, 14, 0),
(40, 40, 17, 0),
(41, 41, 8, 0),
(42, 42, 10, 0),
(43, 43, 11, 0),
(44, 44, 6, 0),
(45, 45, 1, 0),
(46, 46, 18, 0),
(47, 47, 13, 0),
(48, 48, 12, 0),
(49, 49, 15, 0),
(50, 50, 11, 0),
(51, 51, 20, 0),
(52, 52, 5, 0),
(53, 53, 9, 0),
(54, 54, 1, 0),
(55, 55, 3, 0),
(56, 56, 5, 0),
(57, 57, 2, 0),
(58, 58, 10, 0),
(59, 59, 14, 0),
(60, 60, 7, 0),
(61, 61, 6, 0),
(62, 62, 19, 0),
(63, 63, 16, 0),
(64, 64, 9, 0),
(65, 65, 3, 0),
(66, 66, 13, 0),
(67, 67, 20, 0),
(68, 68, 10, 0),
(69, 69, 8, 0),
(70, 70, 4, 0),
(71, 71, 19, 0),
(72, 72, 6, 0),
(73, 73, 7, 0),
(74, 74, 17, 0),
(75, 75, 10, 0),
(76, 76, 3, 0),
(77, 77, 18, 0),
(78, 78, 15, 0),
(79, 79, 14, 0),
(80, 80, 2, 0),
(81, 81, 4, 0),
(82, 82, 20, 0),
(83, 83, 5, 0),
(84, 84, 11, 0),
(85, 85, 16, 0),
(86, 86, 1, 0),
(87, 87, 19, 0),
(88, 88, 15, 0),
(89, 89, 13, 0),
(90, 90, 16, 0),
(91, 91, 4, 0),
(92, 92, 7, 0),
(93, 93, 9, 0),
(94, 94, 18, 0),
(95, 95, 12, 0),
(96, 96, 16, 0),
(97, 97, 11, 0),
(98, 98, 2, 0),
(99, 99, 13, 0),
(100, 100, 17, 0),
(101, 101, 1, 0),
(102, 102, 2, 0),
(103, 103, 3, 0),
(104, 104, 4, 0),
(105, 105, 5, 0),
(106, 106, 6, 0),
(107, 107, 7, 0),
(108, 108, 8, 0),
(109, 109, 9, 0),
(110, 110, 10, 0),
(111, 111, 11, 0),
(112, 112, 12, 0),
(113, 113, 13, 0),
(114, 114, 14, 0),
(115, 115, 15, 0),
(116, 116, 16, 0),
(117, 117, 17, 0),
(118, 118, 18, 0),
(119, 119, 19, 0),
(120, 120, 20, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `talents`
--

CREATE TABLE `talents` (
  `id` int NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `about` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` smallint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `talents`
--

INSERT INTO `talents` (`id`, `sort`, `name`, `about`, `date_create`, `active`) VALUES
(1, 1, 'Analyst', 'Analysts get energized when searching for simplicity and clarity within a large amount of data.\nThey become frustrated when asked to follow their heart rather than proven facts and logic.', '2024-04-16 12:31:34', 0),
(2, 2, 'Believer', 'Believers’ actions are driven by core values that cannot be compromised at the expense of success. Believers get drained if their beliefs and values are questioned, or if they have to do something that goes against their principles.', '2024-04-16 12:31:34', 0),
(3, 3, 'Brainstormer', 'Brainstormers get excited when asked to come up with ideas where the sky’s the limit. They\nenjoy connecting the seemingly unconnectable, and quickly get bored by close-minded people\nand standard practices.', '2024-04-16 12:31:34', 0),
(4, 4, 'Catalyst', 'Catalysts love to get things started and are great at creating momentum in stagnant\nenvironments. They have a hard time waiting and so-called ‘wasting time’ when they know they\ncould be moving forward and getting things off the ground.', '2024-04-16 12:31:34', 0),
(5, 5, 'Chameleon', 'Chameleons love working ‘on the fly’ and draw excitement from surprises, changing environments and unexpected detours. They get bored to tears with routine and predictability.', '2024-04-16 12:31:34', 0),
(6, 6, 'Coach', 'Coaches love discovering the potential in people and supporting others’ personal growth. It’s hard for them to accept when this potential is being wasted.', '2024-04-16 12:31:34', 0),
(7, 7, 'Commander', 'Commanders love to be in charge, to speak up and be asked for their opinion. They do not shy away from conflict and may get frustrated by those who \'beat around the bush’.', '2024-04-16 12:31:34', 0),
(8, 8, 'Deliverer', 'Deliverers follow through on their commitments and appreciate seeing how this builds more trust and respect among others. They feel terrible if promises get broken - both on the receiving and giving side.', '2024-04-16 12:31:34', 0),
(9, 9, 'Empathizer', 'Empathizers are great at understanding how people feel and use this sensibility to do good for others. They become frustrated when asked to disregard feelings and focus solely on logic instead.', '2024-04-16 12:31:34', 0),
(10, 10, 'Focus Expert', 'Focus Experts enjoy getting a project straight to the finish line rather than changing directions\nregularly. They focus on one thing at a time and dislike any distractions.', '2024-04-16 12:31:34', 0),
(11, 11, 'Optimist', 'Optimists enjoy praising the good in people and are grateful for what they have. They find it\ndifficult to be around those who constantly focus on the negative.', '2024-04-16 12:31:34', 0),
(12, 12, 'Peace Keeper', 'Peace Keepers are masters of balance. Their strength helps them find alignment and build bridges among people to reach the best outcomes. They feel emotionally drained by constant friction among those who do not seek common ground.', '2024-04-16 12:31:34', 0),
(13, 13, 'Philomath', 'Philomaths love learning. They explore many interests, follow new paths and acquire as much knowledge as possible. They don’t enjoy the company of so-called \'know-it-alls’, people with little curiosity and no desire to explore new ideas.', '2024-04-16 12:31:34', 0),
(14, 14, 'Problem Solver', 'Problem Solvers love uncovering flaws, diagnosing problems and coming up with solutions. It is difficult for them to simply sweep unresolved issues under the rug and keep going as if everything is fine.', '2024-04-16 12:31:34', 0),
(15, 15, 'Self-Believer', 'Self-Believers are independent, self-sufficient people who inspire others with their confidence and certainty. They cannot stand when others tell them what to do or try to control their actions.', '2024-04-16 12:31:34', 0),
(16, 16, 'Storyteller', 'Storytellers are masters of communication. They like to host events, speak in public and be heard. They suffer in situations where they can’t express themselves through words.', '2024-04-16 12:31:34', 0),
(17, 17, 'Strategist', 'Strategists look at the big picture, which enables them to easily find the best way out of the clutter. Because connecting the dots comes naturally to them, they may get impatient with people who make slower decisions.', '2024-04-16 12:31:34', 0),
(18, 18, 'Thinker', 'Thinkers enjoy mental activity, intellectual discussions and time alone in reflection. They find it difficult to work in teams that tend to act before thinking.', '2024-04-16 12:31:34', 0),
(19, 19, 'Time Keeper', 'Nothing excites Time Keepers more than meeting a deadline. They enjoy setting up processes, timelines and plans. They may feel confused in chaotic circumstances where neither the outcomes nor the ways to achieve these are clear.', '2024-04-16 12:31:34', 0),
(20, 20, 'Winner', 'Winners turn any mundane task into a game or challenge because the feeling of competition is essential for them. They feel lost in environments that have no defined measure of success.', '2024-04-16 12:31:34', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `test_result`
--

CREATE TABLE `test_result` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `test_id` int NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `result` text,
  `active` smallint NOT NULL DEFAULT '0',
  `date_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `test_result`
--

INSERT INTO `test_result` (`id`, `user_id`, `test_id`, `data`, `result`, `active`, `date_create`) VALUES
(13, 1, 0, '{\"1\":62,\"2\":30,\"3\":19,\"4\":61,\"5\":90,\"6\":99,\"7\":8,\"8\":30,\"9\":77,\"10\":89,\"11\":100,\"12\":1,\"13\":12,\"14\":32,\"15\":50,\"16\":61,\"17\":50,\"18\":24,\"19\":64,\"20\":80,\"21\":0,\"22\":0,\"23\":0,\"24\":0,\"25\":0,\"26\":0,\"27\":0,\"28\":0,\"29\":0,\"30\":0,\"31\":0,\"32\":0,\"33\":0,\"34\":0,\"35\":0,\"36\":0,\"37\":0,\"38\":0,\"39\":0,\"40\":0,\"41\":0,\"42\":0,\"43\":0,\"44\":0,\"45\":0,\"46\":0,\"47\":0,\"48\":0,\"49\":0,\"50\":0,\"51\":0,\"52\":0,\"53\":0,\"54\":0,\"55\":0,\"56\":0,\"57\":0,\"58\":0,\"59\":0,\"60\":0,\"61\":0,\"62\":0,\"63\":0,\"64\":0,\"65\":0,\"66\":0,\"67\":0,\"68\":0,\"69\":0,\"70\":0,\"71\":0,\"72\":0,\"73\":0,\"74\":0,\"75\":0,\"76\":0,\"77\":0,\"78\":0,\"79\":0,\"80\":0,\"81\":0,\"82\":0,\"83\":0,\"84\":0,\"85\":0,\"86\":0,\"87\":0,\"88\":0,\"89\":0,\"90\":0,\"91\":0,\"92\":0,\"93\":0,\"94\":0,\"95\":0,\"96\":0,\"97\":0,\"98\":0,\"99\":0,\"100\":0,\"101\":0,\"102\":0,\"103\":0,\"104\":0,\"105\":0,\"106\":0,\"107\":0,\"108\":0,\"109\":0,\"110\":0,\"111\":0,\"112\":0,\"113\":0,\"114\":0,\"115\":0,\"116\":0,\"117\":0,\"118\":0,\"119\":0,\"120\":84}', '{\"8\":149,\"12\":110,\"20\":108,\"18\":100,\"7\":90,\"2\":89,\"19\":77,\"15\":70,\"1\":64,\"6\":62,\"13\":61,\"14\":61,\"16\":50,\"5\":19,\"17\":12,\"9\":1,\"3\":0,\"4\":0,\"10\":0,\"11\":0}', 0, '2024-04-17 11:58:00');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint NOT NULL DEFAULT '10',
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Cs2kC-tunhzGBwWAZITSnL5KmgVhaoqh', '$2y$13$nQad9zslcyr05HHRO9du6e3tbjJZdIKS.zXEHk0Gz63tLb2ywZ9SO', NULL, 'admin@kstu.kz', 10, 1704429806, 1704429806);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent` (`parent`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions_talent`
--
ALTER TABLE `questions_talent`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `talents`
--
ALTER TABLE `talents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `test_result`
--
ALTER TABLE `test_result`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT для таблицы `questions_talent`
--
ALTER TABLE `questions_talent`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT для таблицы `talents`
--
ALTER TABLE `talents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `test_result`
--
ALTER TABLE `test_result`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
