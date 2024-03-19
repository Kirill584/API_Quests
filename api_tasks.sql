-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 19 2024 г., 21:55
-- Версия сервера: 8.0.30
-- Версия PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `api_tasks`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Quests`
--

CREATE TABLE `Quests` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `cost` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Quests`
--

INSERT INTO `Quests` (`id`, `name`, `cost`) VALUES
(1, 'сывмыа', 20),
(2, 'вымипа', 20),
(3, 'уакмип', 20),
(4, 'ав', 30),
(5, 'ьонтр', 20),
(6, 'gfdhf', 20),
(7, 'esvf', 20),
(8, 'esvf', 20),
(9, 'esvf', 20),
(10, 'esvfуцак', 20),
(11, 'r6j7nyu', 30),
(12, 'defrv', 40),
(13, 'rbt', 20),
(14, 'cesdvf', 20),
(15, 'dwefr', 20),
(16, '56yjtnh', 20),
(17, 'свмау', 50),
(18, 'сва', 60),
(19, 'вцмуа', 50),
(20, 'evewv', 50),
(21, 'вуацк', 50),
(22, 'rebtg', 50),
(23, 'ewr', 50),
(24, 'ewr', 20),
(25, 'oiyum ', 30),
(26, 'edwfr', 20),
(27, 'wefr', 50),
(28, 'wefr', 50),
(29, 'wefr', 50),
(30, 'ewfre', 20),
(31, 'itl,iymu', 20),
(32, 'defwr', 20),
(33, 'вуацк', 20),
(34, 'dvrdt', 20),
(35, 'erfvbg', 30),
(36, 'vbtytny', 20),
(37, 'ewfr', 20),
(38, 'dsvfdbg', 20),
(39, 'кап', 20),
(40, 'куиек', 30);

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `balance` int NOT NULL DEFAULT '0',
  `quests` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `name`, `balance`, `quests`) VALUES
(1, 'Иван', 360, '1; 3; 2; 4; 6; 5; 16; 8; 1; 10; 7; 20'),
(2, 'Евгений', 40, '1; 2'),
(3, 'Олег', 140, '1; 2'),
(4, 'Павел', 100, '2; 3'),
(6, 'Николай', 240, '1; 2; 5'),
(8, 'Антон', 80, NULL),
(9, 'Алексей', 100, NULL),
(10, 'Володя', 60, '1; 2; 3'),
(11, 'Володя', 0, NULL),
(12, 'Володя', 0, NULL),
(21, 'Ростислав', 0, NULL),
(22, 'Харитон', 40, '1; 3'),
(24, 'Владислав', 0, NULL),
(25, 'Артем', 0, NULL),
(26, 'Егор', 0, NULL),
(28, 'Генадий', 0, NULL),
(29, 'Иннокентий', 90, '1; 19; 3'),
(31, 'Арсений', 20, '1'),
(37, 'Марат', 20, '1'),
(38, 'Родион', 110, '2; 3; 4; 5; 1'),
(39, 'Роман', 100, '4; 20; 1'),
(40, 'Ларион', 0, NULL),
(41, 'Владимир', 40, '1; 3'),
(42, 'Остав', 0, NULL),
(45, 'Аркадий', 0, NULL),
(46, 'Евгений', 0, NULL),
(47, 'Аркадий', 0, NULL),
(48, 'Роман', 0, NULL),
(49, 'Петр', 20, '2'),
(50, 'Артур', 0, NULL),
(51, 'Аркадий', 0, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Quests`
--
ALTER TABLE `Quests`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Quests`
--
ALTER TABLE `Quests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
