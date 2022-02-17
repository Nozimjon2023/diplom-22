-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 14 2022 г., 02:05
-- Версия сервера: 5.6.51
-- Версия PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dbcatalog`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bolezn`
--

CREATE TABLE `bolezn` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `createOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bolezn_category`
--

CREATE TABLE `bolezn_category` (
  `id` int(11) NOT NULL,
  `ru_name` varchar(255) DEFAULT NULL,
  `tj_name` varchar(255) DEFAULT NULL,
  `createOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bolezn_symptoms`
--

CREATE TABLE `bolezn_symptoms` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_bolezn` int(11) DEFAULT NULL,
  `id_symptom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `diagnostics`
--

CREATE TABLE `diagnostics` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_patient` int(11) UNSIGNED NOT NULL,
  `growth` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `id_detail` int(11) UNSIGNED DEFAULT NULL,
  `createOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `diagnos_detail`
--

CREATE TABLE `diagnos_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_organ` int(11) DEFAULT NULL,
  `id_symptom` int(11) DEFAULT NULL,
  `createOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `organs`
--

CREATE TABLE `organs` (
  `id` int(11) NOT NULL,
  `ru_name` varchar(255) DEFAULT NULL,
  `tj_name` varchar(255) DEFAULT NULL,
  `createOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `organs_symptoms`
--

CREATE TABLE `organs_symptoms` (
  `id` int(11) NOT NULL,
  `id_organ` int(11) DEFAULT NULL,
  `id_symptom` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_symptom` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `patients`
--

CREATE TABLE `patients` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` enum('man','woman') NOT NULL,
  `id_address` int(11) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `createOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `patients_address`
--

CREATE TABLE `patients_address` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_country` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_city` int(11) DEFAULT NULL,
  `id_village` int(11) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `house` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `createOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `patients_organs`
--

CREATE TABLE `patients_organs` (
  `id` int(11) DEFAULT NULL,
  `id_organ` int(11) DEFAULT NULL,
  `gender` enum('man','woman') DEFAULT NULL,
  `view_type` enum('front','back') DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `parent_organ` int(11) DEFAULT NULL,
  `image_puth` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `symptoms`
--

CREATE TABLE `symptoms` (
  `id` int(11) NOT NULL,
  `ru_name` varchar(255) DEFAULT NULL,
  `tj_name` varchar(255) DEFAULT NULL,
  `createOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verefited` date DEFAULT NULL,
  `login` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` enum('superadmin','admin','patient') NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createOn` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bolezn`
--
ALTER TABLE `bolezn`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `bolezn_category`
--
ALTER TABLE `bolezn_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `bolezn_symptoms`
--
ALTER TABLE `bolezn_symptoms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_illness` (`id_bolezn`),
  ADD KEY `id_symptom` (`id_symptom`);

--
-- Индексы таблицы `diagnostics`
--
ALTER TABLE `diagnostics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_patient` (`id_patient`),
  ADD KEY `id_detail` (`id_detail`);

--
-- Индексы таблицы `diagnos_detail`
--
ALTER TABLE `diagnos_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_organ` (`id_organ`),
  ADD KEY `id_symtom` (`id_symptom`);

--
-- Индексы таблицы `organs`
--
ALTER TABLE `organs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `organs_symptoms`
--
ALTER TABLE `organs_symptoms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_symptom` (`id_symptom`),
  ADD KEY `id_organ` (`id_organ`);

--
-- Индексы таблицы `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD UNIQUE KEY `id_address` (`id_address`);

--
-- Индексы таблицы `patients_address`
--
ALTER TABLE `patients_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_country` (`id_country`),
  ADD KEY `id_area` (`id_area`),
  ADD KEY `id_city` (`id_city`);

--
-- Индексы таблицы `patients_organs`
--
ALTER TABLE `patients_organs`
  ADD KEY `id_organ` (`id_organ`);

--
-- Индексы таблицы `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bolezn`
--
ALTER TABLE `bolezn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bolezn_category`
--
ALTER TABLE `bolezn_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bolezn_symptoms`
--
ALTER TABLE `bolezn_symptoms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `diagnostics`
--
ALTER TABLE `diagnostics`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `diagnos_detail`
--
ALTER TABLE `diagnos_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `patients_address`
--
ALTER TABLE `patients_address`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bolezn`
--
ALTER TABLE `bolezn`
  ADD CONSTRAINT `bolezn_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `bolezn_category` (`id`);

--
-- Ограничения внешнего ключа таблицы `bolezn_symptoms`
--
ALTER TABLE `bolezn_symptoms`
  ADD CONSTRAINT `bolezn_symptoms_ibfk_2` FOREIGN KEY (`id_symptom`) REFERENCES `symptoms` (`id`),
  ADD CONSTRAINT `bolezn_symptoms_ibfk_3` FOREIGN KEY (`id_bolezn`) REFERENCES `bolezn` (`id`);

--
-- Ограничения внешнего ключа таблицы `diagnostics`
--
ALTER TABLE `diagnostics`
  ADD CONSTRAINT `diagnos_detail` FOREIGN KEY (`id_detail`) REFERENCES `diagnos_detail` (`id`),
  ADD CONSTRAINT `diagnostics_patients` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id`);

--
-- Ограничения внешнего ключа таблицы `diagnos_detail`
--
ALTER TABLE `diagnos_detail`
  ADD CONSTRAINT `detail_organs` FOREIGN KEY (`id_organ`) REFERENCES `organs` (`id`),
  ADD CONSTRAINT `detail_symptoms` FOREIGN KEY (`id_symptom`) REFERENCES `symptoms` (`id`);

--
-- Ограничения внешнего ключа таблицы `organs_symptoms`
--
ALTER TABLE `organs_symptoms`
  ADD CONSTRAINT `organs_symptoms_ibfk_1` FOREIGN KEY (`id_symptom`) REFERENCES `symptoms` (`id`),
  ADD CONSTRAINT `organs_symptoms_ibfk_2` FOREIGN KEY (`id_organ`) REFERENCES `organs` (`id`);

--
-- Ограничения внешнего ключа таблицы `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `patients_organs`
--
ALTER TABLE `patients_organs`
  ADD CONSTRAINT `patients_organs_ibfk_1` FOREIGN KEY (`id_organ`) REFERENCES `organs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
