-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 08, 2025 at 03:47 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aiaas_model`
--

-- --------------------------------------------------------

--
-- Table structure for table `am_admin`
--

CREATE TABLE `am_admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `am_admin`
--

INSERT INTO `am_admin` (`username`, `password`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `am_data`
--

CREATE TABLE `am_data` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `image_file` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `label_name` varchar(30) NOT NULL,
  `hash1` varchar(100) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `am_data`
--

INSERT INTO `am_data` (`id`, `mid`, `bid`, `image_file`, `model`, `label_name`, `hash1`, `status`) VALUES
(1, 1, 1, 'F1Haland_1.jpg', 'LACrimeNet.pkl', 'Haland', '00bd658b0ec8d4138ec985b498f77a740a5a28190829755eddf8bcdc3bbd6737', 1),
(2, 1, 1, 'F2Haland_10.jpg', 'LACrimeNet.pkl', 'Haland', '7a5aa61ca041d7351e1fe337934c2426498ab143c99d337f0b395c5f40fb98a4', 1),
(3, 1, 1, 'F3Haland_11.jpg', 'LACrimeNet.pkl', 'Haland', 'da75ea7e47f5019a9e1c8864592aa44085cd35a949c92f4e6b300afb2cb6a5ec', 1),
(4, 1, 1, 'F4Haland_12.jpg', 'LACrimeNet.pkl', 'Haland', 'd87723017f362d26b75f7dbb9de1687e1850de34fdb2d6eed3cef902ae198eca', 1),
(5, 1, 1, 'F5Haland_13.jpg', 'LACrimeNet.pkl', 'Haland', '83e6cdd55fae5a8d55cab8edfb96ecd1b3653cb4e228fd0edab083f8294e746a', 1),
(6, 1, 1, 'F6Haland_14.jpg', 'LACrimeNet.pkl', 'Haland', '32e72bd52166f7898985629a9e72e84c4ce558d21660d4f8e9acbc028bf91108', 1),
(7, 1, 1, 'F7Haland_2.jpg', 'LACrimeNet.pkl', 'Haland', '963b2bde03f828689744efbece43c64c57fed0a2e144177063c41880dacf7038', 1),
(8, 1, 1, 'F8Haland_3.jpg', 'LACrimeNet.pkl', 'Haland', '87d7ec6ccc49d11d7906a01de632857b31b11b66f4e7cedadeb4ed140a57d70c', 1),
(9, 1, 1, 'F9Haland_4.jpg', 'LACrimeNet.pkl', 'Haland', '7edaeec6d0284a45aada5fc7d46e1ec365370ce13bf0d796afd6575a6f915cc4', 1),
(10, 1, 1, 'F10Haland_5.jpg', 'LACrimeNet.pkl', 'Haland', '820b66ffa9b1316e54627f17dc1bf19b12a3260eb41ab0ea2850028bff7c202e', 1),
(11, 1, 2, 'F11Mbape_1_1.jpg', 'LACrimeNet.pkl', 'Mbape', 'da17b3b08eff7a9c991b4af50bffb9a1ae3beb25ad8d54beb2e3efb4c4c98b83', 1),
(12, 1, 2, 'F12Mbape_10.jpg', 'LACrimeNet.pkl', 'Mbape', '7dcdab84b140331c52a51f9aeacfa06e8f049598d3d7222ffa793e52b07bd13a', 1),
(13, 1, 2, 'F13Mbape_11.jpg', 'LACrimeNet.pkl', 'Mbape', 'd8f2aed1e15137634046ba3e3a03000fb8e13dd3ae15d7eab0d5cecdbd716cb3', 1),
(14, 1, 2, 'F14Mbape_12.jpg', 'LACrimeNet.pkl', 'Mbape', '0066c888b59539cf41178861287200cead45879e0f7296502d9a526ad254d754', 1),
(15, 1, 2, 'F15Mbape_13.jpg', 'LACrimeNet.pkl', 'Mbape', 'a892b16ba2f637884838b6ed73cbd36ab7f9cf21bbeae779802bca5ca25f1c84', 1),
(16, 1, 2, 'F16Mbape_2.jpg', 'LACrimeNet.pkl', 'Mbape', 'f3ac6ffbfb473e4f9d895fcf9282848a934f8a5c22b5aec5f518188b362d8fc2', 1),
(17, 1, 2, 'F17Mbape_3.jpg', 'LACrimeNet.pkl', 'Mbape', '926959b3cd56f07537409801e9e9c93798443878b3e395769b3185d54e59bacf', 1),
(18, 1, 2, 'F18Mbape_4.jpg', 'LACrimeNet.pkl', 'Mbape', 'ef4b56d9c37049ca2a5423c3c1b6f65b4f724689a1d61899be4afb07b78004d2', 1),
(19, 1, 2, 'F19Mbape_5.jpg', 'LACrimeNet.pkl', 'Mbape', 'e45b08daf12c0dfe0e6ea5c2ba0b4f198aa715a978952033423d4c1eab1634e9', 1),
(20, 1, 2, 'F20Mbape_6.jpg', 'LACrimeNet.pkl', 'Mbape', '72fc40050629f9ccc4f369ae567c69e68fe6e569d01faf2d56afd1c5e2391d3c', 1),
(21, 1, 3, 'F21Messi_1.jpg', 'LACrimeNet.pkl', 'Messi', '223fcb721da6ea7555ec6387fd1751de566fbae18c1a44e5495e459215175a78', 1),
(22, 1, 3, 'F22Messi_10.jpg', 'LACrimeNet.pkl', 'Messi', '876acd3c1482f01beababf7176c7924f8f82c416d721efa06d5562e2ee767739', 1),
(23, 1, 3, 'F23Messi_11.jpg', 'LACrimeNet.pkl', 'Messi', 'acdb321f8e71d260d36eed3e05d9422e5d81cfe9b1cb69de309ce486cb6e1b41', 1),
(24, 1, 3, 'F24Messi_2.jpg', 'LACrimeNet.pkl', 'Messi', '622b74cd8683ccec7f279850e3106a3f583b8c9e43fde3ec2335ef7bab7ccb07', 1),
(25, 1, 3, 'F25Messi_3.jpg', 'LACrimeNet.pkl', 'Messi', '2f173518aab81bdbf8441a25d81256ca3ea9c2ac65947f87305966f77586f318', 1),
(26, 1, 3, 'F26Messi_4.jpg', 'LACrimeNet.pkl', 'Messi', 'd7ff837b643cde69125c735533cfad6918863c51c2dc33b850993087e22ff781', 1),
(27, 1, 3, 'F27Messi_5.jpg', 'LACrimeNet.pkl', 'Messi', '8ae66a25bcb48d2f19ade6dea2734db15781cfc4d4181729e8621e2e3dbf6979', 1),
(28, 1, 3, 'F28Messi_6.jpg', 'LACrimeNet.pkl', 'Messi', '7baaa7fa2acab9065b717c8fade27d5972868fe1fa65bf2f6a34cbbb9799af5c', 1),
(29, 1, 3, 'F29Messi_7.jpg', 'LACrimeNet.pkl', 'Messi', 'f46ff866d28e6f21c0bbdd789152ac2d302ae314d7c370776849372372a7f1be', 1),
(30, 1, 3, 'F30Messi_8.jpg', 'LACrimeNet.pkl', 'Messi', '2f2498e9e421abbaeea4c7927c5a9ed5e52bdaf9f7c82c4bf7b7b18ce6b13cb0', 1),
(31, 1, 4, 'F31Neymar_1_1.jpg', 'LACrimeNet.pkl', 'Neymar', 'd63b1faa547e91ecff002ce17ccfd42ba1e45a535381facde18131f634c12acd', 1),
(32, 1, 4, 'F32Neymar_11.jpg', 'LACrimeNet.pkl', 'Neymar', 'f635a8825368e146efb7c46e60f334c3f1198c2ef2f66aa248fb53850cfe8b9c', 1),
(33, 1, 4, 'F33Neymar_12.jpg', 'LACrimeNet.pkl', 'Neymar', '1394daef58e5a1df85cceedfcbb2c545f9dd0da8d57c0b429c0b62ef12075911', 1),
(34, 1, 4, 'F34Neymar_13.jpg', 'LACrimeNet.pkl', 'Neymar', '74225fffccf168b56dd2e2cff6a464f5b3efa3f59f8dd0469466360fe2094557', 1),
(35, 1, 4, 'F35Neymar_2.jpg', 'LACrimeNet.pkl', 'Neymar', '977d7e46645798e1ee948fb0f8e9be20d13e9b7af25357e172ec72e9273d80e1', 1),
(36, 1, 4, 'F36Neymar_3.jpg', 'LACrimeNet.pkl', 'Neymar', 'd750e7fcb75d8c1e17214952105188193947504f43d54899d3f7ae638b4c605b', 1),
(37, 1, 4, 'F37Neymar_4.jpg', 'LACrimeNet.pkl', 'Neymar', '8ed037f6019e1ed4f1aff53bdf4cd0b99cdd957f178f13dbea56ef11049f43e0', 1),
(38, 1, 4, 'F38Neymar_5.jpg', 'LACrimeNet.pkl', 'Neymar', '51532fc064686061a9d0c80dd27b17fad4ae8187f5e14386a51a74eaf34a53bc', 1),
(39, 1, 4, 'F39Neymar_6.jpg', 'LACrimeNet.pkl', 'Neymar', '68c827b61bfa1dfd6013c9dd5520727392aa6f7b517244425bedca10221e9a57', 1),
(40, 1, 4, 'F40Neymar_7.jpg', 'LACrimeNet.pkl', 'Neymar', '35ee6e08d1a8a108d6f78c4f3027858d9d6d93b7343e5c22c1f6496ce2fca43c', 1),
(41, 1, 4, 'F41Neymar_8.jpg', 'LACrimeNet.pkl', 'Neymar', '5f906b6630ed45ee4f2510d32c4aa63ad4fc01bfc4782b631a1dd0481a3dd9d7', 1),
(42, 1, 5, 'F42Ronaldo_1.jpg', 'LACrimeNet.pkl', 'Ronaldo', '0e4c4ac69d3421f83e92545993a2a33621a4446d9883e42515a810bd0f46028b', 1),
(43, 1, 5, 'F43Ronaldo_10.jpg', 'LACrimeNet.pkl', 'Ronaldo', '850fb6618b4bbfa1f15338405ed69239b441165b0d93d7b559bb6087d773ffb5', 1),
(44, 1, 5, 'F44Ronaldo_11.jpg', 'LACrimeNet.pkl', 'Ronaldo', 'a84c5caa672465da8bb106db40e89227d30918a0a15d2e2478ed10d888596503', 1),
(45, 1, 5, 'F45Ronaldo_12.jpg', 'LACrimeNet.pkl', 'Ronaldo', 'ad2659f2f09cffbdadb5ffa216be2aec32f5512997209683d8c299e8975f8156', 1),
(46, 1, 5, 'F46Ronaldo_13.jpg', 'LACrimeNet.pkl', 'Ronaldo', '5a9fd44e5c0be93316e11076a1e758417ec7c5079986c579f151a258f07f662f', 1),
(47, 1, 5, 'F47Ronaldo_2.jpg', 'LACrimeNet.pkl', 'Ronaldo', 'c9a48a3c43ff44583914c21fb5594558c686e19968100ce5395c6b2ca8ad59d9', 1),
(48, 1, 5, 'F48Ronaldo_3.jpg', 'LACrimeNet.pkl', 'Ronaldo', 'bfd9b71aa10b90b0c63414b7e5c9d3d0fc5f407fdf15ee61ade9bbfe087f706e', 1),
(49, 1, 5, 'F49Ronaldo_4.jpg', 'LACrimeNet.pkl', 'Ronaldo', '174656f88cae1427ea36f1d68a2eb2fd6be19b6fea203d9ed46f883493641616', 1),
(50, 1, 5, 'F50Ronaldo_5.jpg', 'LACrimeNet.pkl', 'Ronaldo', '8ee530a2ed27a09093edfb1b46c10e4651ae0db32525722915fccf0a1c480524', 1),
(51, 1, 5, 'F51Ronaldo_6.jpg', 'LACrimeNet.pkl', 'Ronaldo', 'a7b049769e39eba35fac2ec23b185f1f6f6a4ea468c02aa4df40ad0a222c93b2', 1),
(52, 2, 6, 'F52Aaron_Paul_cropped_Aaron_Paul_1.jpg', 'ENCrimeNet.pkl', 'Aaron_Paul', '329db66af14e84e737d788d8c5d7c762a4336137850fecc9d8e6a365954dd54b', 1),
(53, 2, 6, 'F53Aaron_Paul_cropped_Aaron_Paul_2.jpg', 'ENCrimeNet.pkl', 'Aaron_Paul', 'ba7f633e8329d508e2d2dd4aced986d0dd10d1051a745854d12faf8fb99e3d7f', 1),
(54, 2, 6, 'F54Aaron_Paul_cropped_Aaron_Paul_3.jpg', 'ENCrimeNet.pkl', 'Aaron_Paul', 'e1da3fc09911629b16ecaf885e3a5bc90d11fec13944b11dd66d4fba7becac5c', 1),
(55, 2, 6, 'F55Aaron_Paul_cropped_Aaron_Paul_4.jpg', 'ENCrimeNet.pkl', 'Aaron_Paul', '92870a6d3a43354cc7221801d92a0a0f3cdcfb0f3eb3dff84058d1679ebb0e44', 1),
(56, 2, 6, 'F56Aaron_Paul_cropped_Aaron_Paul_5.jpg', 'ENCrimeNet.pkl', 'Aaron_Paul', 'd1b1d764fee7e0e2aca95790b8565a7723d40b9030297f6eae7bbd478af4d054', 1),
(57, 2, 6, 'F57Aaron_Paul_cropped_Aaron_Paul_6.jpg', 'ENCrimeNet.pkl', 'Aaron_Paul', '4a4a525c15cfc0967240e2d1a436cd1a6722a40ada44830eb769a68f99397908', 1),
(58, 2, 6, 'F58Aaron_Paul_cropped_Aaron_Paul_7.jpg', 'ENCrimeNet.pkl', 'Aaron_Paul', '2ffe50fac1b2473118c8ace6edde7ceed8ea311470adea432a18c677ca1976d1', 1),
(59, 2, 7, 'F59Billy_Bob_Thornton_1.jpg', 'ENCrimeNet.pkl', 'Billy_Bob_Thornton', '22656c628aad8f7333bf9cc518a0aacd92aa4ddc98aa38cd2fe339f9eb6eea7d', 1),
(60, 2, 7, 'F60Billy_Bob_Thornton_3.jpg', 'ENCrimeNet.pkl', 'Billy_Bob_Thornton', 'aca020cc0a8b34fba0a9033050a2c01b9e0f2de3f743f15097f3f97f3f317446', 1),
(61, 2, 7, 'F61Billy_Bob_Thornton_4.jpg', 'ENCrimeNet.pkl', 'Billy_Bob_Thornton', '1d71c674b736b731bbfe40636968d179e86c93d96d69e0dd1bef6e11de2915e8', 1),
(62, 2, 7, 'F62Billy_Bob_Thornton_5.jpg', 'ENCrimeNet.pkl', 'Billy_Bob_Thornton', 'fde0406ee193b4c626b46403fd9223ad92c528aad7e88b56f569768121bc11ab', 1),
(63, 2, 7, 'F63Billy_Bob_Thornton_8.jpg', 'ENCrimeNet.pkl', 'Billy_Bob_Thornton', '128953f2d7a7d8fda0e9e258a27feace32d6d1df5480e655ad515c2cf89b04a9', 1),
(64, 2, 8, 'F64Clive_Owen_cropped_Clive_Owen_1.jpg', 'ENCrimeNet.pkl', 'Clive_Owen', 'fd330037c56c9c5aeb8101523649b78e135d0408ce781db31bd2c1b42dbe3142', 1),
(65, 2, 8, 'F65Clive_Owen_cropped_Clive_Owen_2.jpg', 'ENCrimeNet.pkl', 'Clive_Owen', '1da848609d8d6133d95029a41421a03531bc6fd00fc814b21d4bf6a3f5f8dc00', 1),
(66, 2, 8, 'F66Clive_Owen_cropped_Clive_Owen_4.jpg', 'ENCrimeNet.pkl', 'Clive_Owen', '4b049329d10e100fefdd8fa55ea96e3579270f8fa3b708f0c27890f3b5da91f4', 1),
(67, 2, 8, 'F67Clive_Owen_cropped_Clive_Owen_6.jpg', 'ENCrimeNet.pkl', 'Clive_Owen', '24fe1cdd3ecceb6361cc8bc4f5a39da02d9eefdf1a4ec595dc8738856580b557', 1),
(68, 2, 8, 'F68Clive_Owen_cropped_Clive_Owen_8.jpg', 'ENCrimeNet.pkl', 'Clive_Owen', 'a60a0e1ea0fab3e85acf3be0c739f24f4181392816a8678016c2868a42c8fcde', 1),
(69, 2, 8, 'F69Clive_Owen_cropped_Clive_Owen_9.jpg', 'ENCrimeNet.pkl', 'Clive_Owen', '17db482401a9704f6fff668261ebb8a793c93bd6d5ab24bbe80d4a857211101c', 1),
(70, 2, 9, 'F70Edward_Norton_cropped_Edward_Norton_2.jpg', 'ENCrimeNet.pkl', 'Edward_Norton', '6ce2cca368d0c0e729f118ed5f64f741b98949ffdcc16ae028132ac0429d79ae', 1),
(71, 2, 9, 'F71Edward_Norton_cropped_Edward_Norton_3.jpg', 'ENCrimeNet.pkl', 'Edward_Norton', 'b46e2a6c376eae44bc5ea3e0933dc8b988f04c56b7dbfeb3607e5f9744f631e8', 1),
(72, 2, 9, 'F72Edward_Norton_cropped_Edward_Norton_4.jpg', 'ENCrimeNet.pkl', 'Edward_Norton', '1cdc3fe23128441e6441f81cb4b5f5dab877082c6bf7a2f76de42df494e55367', 1),
(73, 2, 9, 'F73Edward_Norton_cropped_Edward_Norton_5.jpg', 'ENCrimeNet.pkl', 'Edward_Norton', '9805d8df14521983ed1b8da6b6636d147c9ddf189024f06906bc6143b6c36f84', 1),
(74, 2, 9, 'F74Edward_Norton_cropped_Edward_Norton_6.jpg', 'ENCrimeNet.pkl', 'Edward_Norton', '0a673400fe2d3551ff374944d0f97059a285ae1ddd5ca4a5e1b2a27d45b27dd2', 1),
(75, 2, 9, 'F75Edward_Norton_cropped_Edward_Norton_8.jpg', 'ENCrimeNet.pkl', 'Edward_Norton', '0222bf9128800b95a9e996b8483a14db61b24d52ac2be5e9c3e0ca96d6d43f46', 1),
(76, 2, 10, 'F76Freddie_Highmore_10.jpg', 'ENCrimeNet.pkl', 'Freddie_Highmore', '4dd2f53e80540ab6ce1928f9e80d2f0525a42f62cbf2e63cc9dab388c6045640', 1),
(77, 2, 10, 'F77Freddie_Highmore_2.jpg', 'ENCrimeNet.pkl', 'Freddie_Highmore', '0a196697e6e7ee2bb8cd25b8be24d063c0256d75599385fa39f8895debb9113d', 1),
(78, 2, 10, 'F78Freddie_Highmore_4.jpg', 'ENCrimeNet.pkl', 'Freddie_Highmore', 'd98744ded99f4e8c7d39eee33a4e9857aeaf47d518be5442931b7149d1b461b7', 1),
(79, 2, 10, 'F79Freddie_Highmore_5.jpg', 'ENCrimeNet.pkl', 'Freddie_Highmore', '828fb37689f37e7f96c0b8f9be0e3b020c9ab92068b7fd589668fc52a5ac0fa3', 1),
(80, 2, 10, 'F80Freddie_Highmore_7.jpg', 'ENCrimeNet.pkl', 'Freddie_Highmore', '286215dfc821f99fe5eaa5866f78fdb55ea73111400d4b95287ab5a1668c8c62', 1),
(81, 2, 10, 'F81Freddie_Highmore_8.jpg', 'ENCrimeNet.pkl', 'Freddie_Highmore', 'c84b26c5a1ce671690b8f121b5804e58b5b2c6251ec097b15ba0eb8d0f5775b1', 1),
(82, 2, 10, 'F82Freddie_Highmore_9.jpg', 'ENCrimeNet.pkl', 'Freddie_Highmore', '2e9ec0bfbc608766944cb792f8431d9d041ebe0a8b9d4847be678c754567a955', 1);

-- --------------------------------------------------------

--
-- Table structure for table `am_developer`
--

CREATE TABLE `am_developer` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `location` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `public_key` varchar(30) NOT NULL,
  `private_key` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `am_developer`
--

INSERT INTO `am_developer` (`id`, `name`, `mobile`, `email`, `location`, `country`, `uname`, `pass`, `create_date`, `status`, `public_key`, `private_key`) VALUES
(1, 'James', 9654254885, 'james25@gmail.com', 'Pasadena', 'Los Angels, US', 'OW001', '1234', '04-05-2025', 1, 'b67473bb550fc16c', '18c5783f789250eb'),
(2, 'Harshan', 8875915375, 'harshan11@gmail.com', 'Coventry', 'England, UK', 'OW002', '1234', '07-05-2025', 1, '232311fe4eacf6ab', 'b9daae60906d2457');

-- --------------------------------------------------------

--
-- Table structure for table `am_label`
--

CREATE TABLE `am_label` (
  `id` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `label_name` varchar(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `dob` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `crime_type` varchar(200) NOT NULL,
  `details` text NOT NULL,
  `crime_date` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `enc_st` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `am_label`
--

INSERT INTO `am_label` (`id`, `mid`, `label_name`, `name`, `dob`, `gender`, `crime_type`, `details`, `crime_date`, `status`, `address`, `enc_st`) VALUES
(1, 1, 'Haland', '0zDhOP3GUQ/wSVIfvYbQifmKl71BL+mxFHf+j07cipw=', 'oSiD6ydaqIhpY7lONB0UmmnZx690L3+Z32L3BJD0ZjU=', 'Uc+cZG4qwS2ZgemQrkwxtysU9b8Pdjz1iruW7k/xuiw=', '6IfT7bY1kycnS19Dl4iKI+8e+GTbb4g3AoxgSHyNWIo=', 'NDfTCvhFitpGICkBZVeRSHk1G6+xyfygRWAmwwvfUhwLlLi6ypvJ/Z0rgpTXJAA3', 't4YkqJcQtwXrmFoN7w8ViUJuJu/h7ZXrtW5MQYaYxdY=', 'w4wJL/gOcnA94Ja1kpLAd59wwleL4bQ69Pv/5O7P0fA=', 'B+j08JFG9GpFpHvzdo6G6LlM5mmQm7Aq5MSOl9+ECoMh5Hi56rnaSQLWgBJMMwiv', 1),
(2, 1, 'Mbape', 'XlGHKr1TAdWahBgcyOoJsj8gfC+AtrXxQB1IPciUjs4=', '9txWStFYwxbgyN37dgM+HCacTSNgZ/eYZOsKIqbocbA=', 'kH705JdpRhh34PMqBZksfVF+xW5MVRI2ajWExqM3RL4=', 'P8T8ArqYBR+e86HijeLtIdKBrsGb4QBPv9m71Pjhlb0=', 'pb864nkL6bk0kMU+lowpFBRtNruHoyxjdk1/H9wt6o3Zp2Obngw286B05lbGBDST', 'JPMA2R5YRMSy4Icd0kkDjgRmUW4OX1Ie+EhKNXn4ySs=', 'QK/BLd+dCMb/JT0rk0PYJBKi7AGGSE41Cm9yLj30WTL3w8ApwzWBkNicWmUvBM0M', 'W9Ugn4znnSNhUEBBgKeZe2ivFbkC5yI53LZ8cXFgG0sGErl9iirDTBjN15bL3EMS', 1),
(3, 1, 'Messi', '8AaKzeh2UxkLho7c4RaVUNODGoOW27AZMr/DDskDtvk=', 'MQdO2au4aWDeMWhK2om/bI5Ck8/G3pRRmsA2pJ886NU=', 'LSOQ/HTc+bT6jcjUzQxAW8SAcZ8T8Aa4VCEDs+ZY7Ng=', 'PDmwYqOgct7Iy5rUOL2spYEe3eE79kxT+6/uiXweSvk=', 'B8Lo7eH8D5GhkYyqTAQV2wyb+3imuI1AyUFM7VEB/+TPV9E5srnSvrv0i2nzwBTY', 'HhM6m50CJugnWLKJ9CoOAof0Sl+JLDMoTYuHuZH23MU=', 'oBi5qeKlcMGYHVhN9qURS8jrblNTuc646tgNrnhBBFM=', '7GrPhp1mlbKj3U8ldkKkgtBJiEFAxh8bXYLTfc2tV7iF6CZ8gEDPvz7D8vCZbQ9I', 1),
(4, 1, 'Neymar', 'J1C7F9woxNYvR3J1dwQqbt4fnlhswXklYgOxIaD5zvk=', 'pJQfkz6TnqyTcfix/UWoUsTjzV2mdGwacceQEzZNNWA=', 'LKghx8hs6xjeUjStuRQI72Ik9Wi20jta8A8uZC2SyiY=', '7ZhVKvlz5YrEur4Qjure5AZMQF9h3znueHHRaM2APQo5kC5OU5NwImVg3Zf1s4NN', 'K4tN4GlXBZjsJXRx1CR7MVvdIs0pm1WveaWJLJ0jw/RMdms57Ce/clUgCuwpmtdo', 'xsa5jNAfSIED2ZPtQLnlHLxUiR0/ThQVqrqu2Epcwxw=', 'T58FtlvIu3jwGpcXnF4g6u/cpmM/SZzLV0FGg8Hc4sA=', '+gqbItVVdWdnfm3OHjXFk/CDhEDwuzSVI5hHrVs88W4gEbhhR2ENqDjPGNZBz0U2', 1),
(5, 1, 'Ronaldo', '0IeTjEkk/Y5TB1V3lecFT1EKLu8NzBz7nGEbwmbXs1k=', '5NMC+L5x+4+nWyg/BPV9CXGCX/IvOMMBrmEPDM4T8Co=', 'bZpC71XLBQAPLf4F5fsajWMXjd9S2CpbPCkd4rNdLDc=', 'iYrO09gJKHOPfwPGL/H6HUQN3SPJIzlU8c+E53Qh89E=', '0ixuwWzitYhzoCmkOzJV1htzEooWVSrOE6r0AqE+GpAH6PmW15kSO3JfaDFD09Wd', 'Q8zpyzre2ovkYxMpqupndbpmdpV8NWG7P1O4zDrvWPY=', 'Mn3wDifPr2bGoEztZNAoAw/tgkQ9Vg9Bj5aYMKG9nesWffyUPnwTMd1B4czW1eWF', '8lzCSvmgI6hFW3zcrUjIW0uaHKboh0UNcFx18TtXjeMycZyrzLQE7WWoEROurMEe', 1),
(6, 2, 'Aaron_Paul', 'AjzWcYPlglhS1UjiEuRAFgpjqnwondtweyWfxwA1iVU=', 'Y6YNWSjRIMcPVyV3qD05+enJE0UXaEh65i0/a+aXWFE=', 'iIOrjthk4/XzdOhyeZstkwJHi6v33C6/QbuSvnBvUrw=', 'CEnsx6ifZpBQmPFVMbOdB0glaehjuuiN3fWp8wr36Fs=', 'Ku88g3Q3PYIHnifDmp743lmFU/5sliP3AKQczYUiAUxDyIkoauW0l2TqH9NmORKv', '7yxG98WHuGe4kiRf2ddfR5ZahNopSBwYNWIWqb/5qMo=', 'UZpMcYnD8l1l8OqvAq+hobbvi/QDgbrlf98ENFz/d7w=', '3jMQg3K26MA81G1M1Rt9YKmo8TLZ/DewlM5XcjBfSuUOpiBP0/eh2MRnI4kL38S/', 1),
(7, 2, 'Billy_Bob_Thornton', 'BS3UOZa7CpWzBW8ZDM/yJmh8/OmL8wK9naKH4qhR15HFt/y8K0EthumT0tdlitOh', 'VfsLiAbMM54Gz0ZbM+MOhGwMkpksV6qZn3royBfA1LA=', 'm1kC4CpnIGQcTy5gP/cf2o4RnXDbVty/DoNtYvPBCEc=', 'JtJ73vdTQYPvDrIfxAKSoQDXcNybynOzUFk9S5wBsOI=', 'MnHzV80oAMFBw1V1DAZmWbvpCxn0CpRThMXtVl8n64ATIrRXvGV1CuI2cGhm81mC', 'fkrVWvNAbK0jmthMQWbF7EVpcI9GI47fi042symY5ms=', 'PE6RTVsZzb9m5LGnLQbAzbST4KXGJUZCn8mf0U9UCVs=', 'Q0Kt5ZDuNxcoVESrO2vYYNY4JnNYkjP4MnSdmncFXCvXLAiw3cmZqQGWiiQqTQYD', 1),
(8, 2, 'Clive_Owen', 'CtJZ9JS8hTUztQyVu8RnFbB+DDepQe7d2Tp/YslQz6o=', 'RCdEWZENjc4CT5HzWNF62zcz618OEPc3ugVs20jSjjE=', '7FvPPQqv6xfuAMwCafAGcGypIAJDErTkLaArQWak+Yg=', 'o3gNoPH94uWe0/1ZOQ9n+CLvPDYo7BprTWVfLS4EUMY=', 'avFli1cuB9I/K0OYxwC0H4E8XxGsFVS6p2tpuqSzrC4GJje7sf4L8sDaNgMA9qpfT4m61TXXtrdD+iaB6MGkyg==', 'PVpj0ArO2+Vm9c3MnM5iCUqesufe1mJ2AZsSwH6ivpU=', 'N2kPNve7rFScFlToshsLzZSbkeqcaaITzx+5M78q+MBMjc4OhVqZMqInjQWWrrJL', 'IWV2KQAZm/G0zNbdQjV2Pw2Pi+jHb6FMnOc7q5YlVFeFMNl/LaYjZc+LnMEz9Hmr', 1),
(9, 2, 'Edward_Norton', 'L9Nk5COLz9H7UO6qt8SAAKOO+P7LNIFV3mqPJ71twSM=', 'FPqEhtrqUsYDSWL0w9IsUAlNXrIcwafG3IZEgaKb5G8=', 'JLHPXW9c7Jq2aw0pC5ZZuBpNe8BuIV5QPybza3xZlk4=', 'fE5DQgRYQQd5a+xhE9cRhr0701DrK3gDUbf+WnKQ8YA=', '4egKZz8l24vDCzDxGj3IzOM1ysTJaIXbtESNjtF65gkamqzPIR6XMZl1Hrt6YIRA', 'aPsUQa0jo1Hf3wTHca1TsxFE102sofLxgB49kATzmz8=', 'OQX84ZvmvCJJy+wSQJiAlX5eTOQVCw4Hsa7q6/IvDV4=', '+xXeTfRT+joMQk0AUPOQFrycsE2ShnpDiMaMcxKakrwQWug+wgjFusRJBm0Z9F20', 1),
(10, 2, 'Freddie_Highmore', 'oUvJQKog8+V3AJz5XtZps94JpF57eJ2AL3WyCfO5NadZ+oOWUeVcBL47jV6BIaWB', 'Mca/4HGN10IMwDVHJXWD6Yl08hxDEWu0rPaE516xfjE=', 'NR9sKG+GkebrXcl+dgfocTi07e/Fnlqv1X9E3xFVIlQ=', 'h5xaBpPQLa2Zig4bKb7FVqDpgyxyWluRN/m5HsOHcjZlZ/1TCW0yBu5hb28UHWVU', 'k7vIxPxdy4u2EixDGUjVDfBj8KDsg7pceTCiZm3SkLRR7gB3lCULzt8sFZ8owkRN', 'UdUn+ENhWopzl4bNzOW5V8DG/ZcemcWPp2LgMOQPF0E=', '0ZSAlnQPjsUM3XlWerhWnY/jhQEqvrZRE3q6CUauwpE=', 'UObkYqZ+ZEkyrWkr+azGrwSVvZ3PQyBOrp5KW1LIUt51ae7hIw4MXgNf78NaWyLR', 1);

-- --------------------------------------------------------

--
-- Table structure for table `am_model`
--

CREATE TABLE `am_model` (
  `id` int(11) NOT NULL,
  `model_file` varchar(50) NOT NULL,
  `model_id` varchar(20) NOT NULL,
  `public_key` varchar(30) NOT NULL,
  `private_key` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  `owner` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `am_model`
--

INSERT INTO `am_model` (`id`, `model_file`, `model_id`, `public_key`, `private_key`, `status`, `owner`) VALUES
(1, 'LACrimeNet.pkl', 'CRIME-MODEL-001', 'd7163bda0e384f11', 'b84d6ec9928938e2', 0, 'OW001'),
(2, 'ENCrimeNet.pkl', 'CRIME-MODEL-002', '068f09e09a44ace1', '709ccd7788d8ac6b', 0, 'OW002');

-- --------------------------------------------------------

--
-- Table structure for table `am_test`
--

CREATE TABLE `am_test` (
  `id` int(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `mid` int(11) NOT NULL,
  `model_id` varchar(20) NOT NULL,
  `pbkey` varchar(100) NOT NULL,
  `prkey` varchar(100) NOT NULL,
  `test_image` varchar(50) NOT NULL,
  `hash1` varchar(100) NOT NULL,
  `rdate` varchar(20) NOT NULL,
  `rtime` varchar(20) NOT NULL,
  `score` double NOT NULL,
  `status` varchar(20) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `remarks` varchar(100) NOT NULL,
  `owner` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `am_test`
--

INSERT INTO `am_test` (`id`, `uname`, `mid`, `model_id`, `pbkey`, `prkey`, `test_image`, `hash1`, `rdate`, `rtime`, `score`, `status`, `ip_address`, `remarks`, `owner`) VALUES
(1, 'U001', 1, 'CRIME-MODEL-001', 'f8db4646419ec0fb', 'c849450b33edfd1b', 'T113.jpg', '74225fffccf168b56dd2e2cff6a464f5b3efa3f59f8dd0469466360fe2094557', '07-05-2025', '19:10', 93.25, 'Success', '192.168.1.2', 'Match found with high confidence', 'OW001'),
(2, 'U001', 1, 'CRIME-MODEL-001', '0657d37aa526344f', '911ec3e6978f4d11', 'T2crr122.jpg', '8c38fad6348b596d642eadf7676a18fe8edd2635d91be0a9aa2ccfc4f55f7f3a', '07-05-2025', '19:56', 23.42, 'Failed', '192.168.1.2', 'Match not found, low confidence', 'OW001'),
(3, 'U001', 2, 'CRIME-MODEL-002', 'a7dc3a009255ec1b', '6f026044bc7fb5fe', 'T3cropped_Aaron_Paul_1.jpg', '329db66af14e84e737d788d8c5d7c762a4336137850fecc9d8e6a365954dd54b', '08-05-2025', '06:58', 92.63, 'Success', '192.168.1.2', 'Match found with high confidence', 'OW002'),
(4, 'U001', 2, 'CRIME-MODEL-002', '385643bc78fa1b15', 'bf323a65bc68cfc2', 'T4cropped_Freddie_Highmore_10.jpg', '4dd2f53e80540ab6ce1928f9e80d2f0525a42f62cbf2e63cc9dab388c6045640', '08-05-2025', '07:06', 94.36, 'Success', '192.168.1.2', 'Match found with high confidence', 'OW002'),
(5, 'U001', 1, 'CRIME-MODEL-001', 'd27041e5c9ec7ebc', '1a9f69cc96d2d00a', 'T5cropped_Aaron_Paul_1.jpg', '329db66af14e84e737d788d8c5d7c762a4336137850fecc9d8e6a365954dd54b', '08-05-2025', '07:34', 29.57, 'Failed', '192.168.1.2', 'Match not found, low confidence', 'OW001'),
(6, 'U001', 1, 'CRIME-MODEL-001', '8026dfb4d88ad2bb', 'ef5515ff4ae6e744', 'T6cropped_Aaron_Paul_1.jpg', '329db66af14e84e737d788d8c5d7c762a4336137850fecc9d8e6a365954dd54b', '08-05-2025', '09:56', 29.53, 'Failed', '192.168.1.2', 'Match not found, low confidence', 'OW001'),
(7, 'U001', 1, 'CRIME-MODEL-001', 'd7c8de3f9ddc30d8', '59bcb348805eca6c', 'T713.jpg', '74225fffccf168b56dd2e2cff6a464f5b3efa3f59f8dd0469466360fe2094557', '08-05-2025', '13:56', 94.3, 'Success', '192.168.1.2', 'Match found with high confidence', 'OW001');

-- --------------------------------------------------------

--
-- Table structure for table `am_user`
--

CREATE TABLE `am_user` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(40) NOT NULL,
  `location` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `create_date` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `public_key` varchar(30) NOT NULL,
  `private_key` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `am_user`
--

INSERT INTO `am_user` (`id`, `name`, `mobile`, `email`, `location`, `country`, `uname`, `pass`, `create_date`, `status`, `public_key`, `private_key`) VALUES
(1, 'Krish', 8856944175, 'krish33@gmail.com', 'Chennai', 'India', 'U001', '1234', '04-05-2025', 1, 'c3bc34c17efb7d33', '5c562d0c394f6061');

-- --------------------------------------------------------

--
-- Table structure for table `model_metadata`
--

CREATE TABLE `model_metadata` (
  `model_id` varchar(50) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `model_version` varchar(20) default NULL,
  `model_owner_id` varchar(50) default NULL,
  `model_description` text,
  `model_type` varchar(30) default NULL,
  `input_type` varchar(50) default NULL,
  `output_type` varchar(100) default NULL,
  `model_algorithm` varchar(100) default NULL,
  `training_dataset` text,
  `model_accuracy` decimal(5,2) default NULL,
  `evaluation_metrics` varchar(200) default NULL,
  `homomorphic_encryption` enum('yes','no') default NULL,
  `encryption_status` varchar(20) default NULL,
  `deployment_date` date default NULL,
  `last_updated` date default NULL,
  `usage_count` int(11) default NULL,
  `access_permissions` varchar(200) default NULL,
  `license_type` varchar(30) default NULL,
  `compliance_status` varchar(30) default NULL,
  PRIMARY KEY  (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `model_metadata`
--

INSERT INTO `model_metadata` (`model_id`, `model_name`, `model_version`, `model_owner_id`, `model_description`, `model_type`, `input_type`, `output_type`, `model_algorithm`, `training_dataset`, `model_accuracy`, `evaluation_metrics`, `homomorphic_encryption`, `encryption_status`, `deployment_date`, `last_updated`, `usage_count`, `access_permissions`, `license_type`, `compliance_status`) VALUES
('CRIME-MODEL-001', 'CrimeNet Face Recognition AI', 'v1.0', 'OW001', 'Face recognition AI model for crime detection.', 'Classification', 'Encrypted Facial Features (FHE)', 'Suspect Identity with Confidence Score', 'Convolutional Neural Network (CNN)', '50,000 labeled face images from crime database.', '92.47', 'Accuracy, Precision, Recall, F1-Score', 'yes', 'Encrypted', '2025-05-06', NULL, 5, 'Authorized Law Enforcement Agencies Only', 'Proprietary', 'Compliant'),
('CRIME-MODEL-002', 'CrimeNet Face Recognition AI', 'v1.0', 'OW002', 'Face recognition AI model for crime detection.', 'Classification', 'Encrypted Facial Features (FHE)', 'Suspect Identity with Confidence Score', 'Convolutional Neural Network (CNN)', '50,000 labeled face images from crime database.', '93.54', 'Accuracy, Precision, Recall, F1-Score', 'yes', 'Encrypted', '2025-05-07', NULL, 2, 'Authorized Law Enforcement Agencies Only', 'Proprietary', 'Compliant');
