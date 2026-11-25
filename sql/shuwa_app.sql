-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2026-11-25 17:16:59
-- サーバのバージョン： 10.4.32-MariaDB
-- PHP のバージョン: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `shuwa_app`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `words`
--

CREATE TABLE `words` (
  `id` int(11) NOT NULL,
  `word` varchar(40) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `start_second` int(11) DEFAULT NULL,
  `end_second` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `words`
--

INSERT INTO `words` (`id`, `word`, `url`, `start_second`, `end_second`) VALUES
(1, '預ける/預かってもらう', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 66, 74),
(2, '会社員', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 1255, 1266),
(3, '採用', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 3383, 3394),
(4, '尋ねる', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 5226, 5233),
(5, '内容', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 6075, 6083),
(6, '俳優', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 6510, 6519),
(7, 'マイペース', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 7737, 7746),
(8, '薬剤師', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 8122, 8131),
(9, '落語', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 8386, 8394),
(10, 'ワイン', 'https://youtu.be/jiC463M8gAg?si=m92hnWqaMyAX1OuC', 8571, 8580);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `words`
--
ALTER TABLE `words`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルの AUTO_INCREMENT
--

--
-- テーブルの AUTO_INCREMENT `words`
--
ALTER TABLE `words`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
