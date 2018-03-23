-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- 主機: 127.0.0.1
-- 產生時間： 2018-03-23 10:40:24
-- 伺服器版本: 10.1.21-MariaDB
-- PHP 版本： 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `kase`
--
CREATE DATABASE IF NOT EXISTS `kase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kase`;

-- --------------------------------------------------------

--
-- 資料表結構 `demov3`
--

CREATE TABLE `demov3` (
  `_id` int(11) NOT NULL,
  `tag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 資料表結構 `tag_data`
--

CREATE TABLE `tag_data` (
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 資料表的匯出資料 `tag_data`
--

INSERT INTO `tag_data` (`tag`, `description`, `type`, `value`, `time_stamp`) VALUES
('8AHU:KWH', '8F空調箱電錶數值', 'string', '4912.5', '2018-03-23 09:40:03'),
('8EL:KWH', '8F-8EL電錶數值', 'string', '357.92', '2018-03-23 09:39:03'),
('BA_130105', '8F AHU8-1(8F) 空調 控制', 'string', '測試', '2018-02-12 06:06:29'),
('BA_130109', '8F AHU8-1(8F) 送風溫度', 'string', '21.2', '2018-03-23 09:40:03'),
('BA_130110', '8F AHU8-1(8F) 回風溫度', 'string', '22.8', '2018-03-23 09:40:03'),
('BA_130111', '(110巷)東側 溫度', 'string', '24.2', '2018-03-23 09:40:03'),
('BA_130112', '(復北)西側 溫度', 'string', '25.6', '2018-03-23 09:40:03'),
('BA_130113', '8F AHU8-1(8F) CO2偵測', 'string', '1750', '2018-03-23 09:40:03'),
('BA_130114', '8F AHU8-1(8F) 靜壓感測', 'string', '50', '2018-03-23 09:40:03'),
('BA_130117', '8F AHU8-1(8F) 二通閥', 'string', '10', '2018-03-23 08:57:28'),
('BA_130118', '8F AHU8-1(8F) 變頻器', 'string', '40', '2018-03-23 08:59:29'),
('BA_130119', '8F AHU8-1(8F) 外氣風門', 'string', '0', '2018-03-23 05:58:44'),
('BA_130121', '8F AHU8-1(8F) 狀態', 'string', '1', '2018-03-23 08:55:26'),
('BA_130122', '8F AHU8-1(8F) 過載', 'string', '0', '2018-03-23 05:58:44'),
('BA_130123', '8F AHU8-1(8F) 風管偵煙', 'string', '0', '2018-03-23 05:58:44'),
('BA_130124', '8F AHU8-1(8F) 濾網壓差', 'string', '0', '2018-03-23 05:58:44'),
('BA_130201', '8F 8NL照明1狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130202', '8F 8NL照明2狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130203', '8F 8NL照明3狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130204', '8F 8NL照明4狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130205', '8F 8NL照明5狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130206', '8F 8NL照明6狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130207', '8F 8NL照明7狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130208', '8F 8NL照明8狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130209', '8F 8NL照明9狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130210', '8F 8NL照明10狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130211', '8F 8NL照明11狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130212', '8F 8NL照明12狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130213', '8F 8NL照明13狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130214', '8F 8NL照明14狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130215', '8F 8NL照明15狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130216', '8F 8NL照明16狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130301', '8F 8EL照明1狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130302', '8F 8EL照明2狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130303', '8F 8EL照明3狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130304', '8F 8EL照明4狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130305', '8F 8EL照明5狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130306', '8F 8EL照明6狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130307', '8F 8EL照明7狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130308', '8F 8EL照明8狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130309', '8F 8EL照明9狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130310', '8F 8EL照明10狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130311', '8F 8EL照明11狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130312', '8F 8EL照明12狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130401', '8F EF8-1排風 狀態', 'string', '1', '2018-03-23 05:58:44'),
('BA_130402', '8F EF8-1排風 過載', 'string', '0', '2018-03-23 05:58:44'),
('BA_130421', '8F甲梯安全門 門位監視', 'string', '1', '2018-03-23 05:58:44'),
('BA_130422', '8F乙梯安全門 門位監視', 'string', '0', '2018-03-23 08:21:59'),
('BA_130423', '8F空調機房門 門位監視', 'string', '0', '2018-03-23 05:58:44'),
('BA_130424', '8F電氣室門 門位監視', 'string', '0', '2018-03-23 05:58:44'),
('BA_130425', '8F女廁 緊急按鈕', 'string', '0', '2018-03-23 05:58:44'),
('BA_130426', '8F室內 緊急按鈕', 'string', '0', '2018-03-23 05:58:44'),
('BA_130427', '8F SEM8-1排煙 狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130428', '8F SEM8-1排煙 過載', 'string', '0', '2018-03-23 05:58:44'),
('BA_130429', '8F SEM8-2排煙 狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130430', '8F SEM8-2排煙 過載', 'string', '0', '2018-03-23 05:58:44'),
('BA_130431', '8F SEM8-3排煙 狀態', 'string', '0', '2018-03-23 05:58:44'),
('BA_130432', '8F SEM8-3排煙 過載', 'string', '0', '2018-03-23 05:58:44'),
('XX_123456', '測試元件5', 'int', '980', '2018-02-12 01:33:10');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `demov3`
--
ALTER TABLE `demov3`
  ADD PRIMARY KEY (`_id`),
  ADD KEY `_id` (`_id`);

--
-- 資料表索引 `tag_data`
--
ALTER TABLE `tag_data`
  ADD PRIMARY KEY (`tag`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `demov3`
--
ALTER TABLE `demov3`
  MODIFY `_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3147256;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
