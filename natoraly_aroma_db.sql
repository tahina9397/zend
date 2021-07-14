-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mer 14 Juillet 2021 à 13:59
-- Version du serveur :  5.7.14
-- Version de PHP :  7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `natoraly_aroma_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `na_categories`
--

CREATE TABLE `na_categories` (
  `id` int(11) NOT NULL,
  `uniqid` varchar(150) DEFAULT NULL,
  `id_category_group` int(11) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `archive` tinyint(1) NOT NULL DEFAULT '0',
  `order_item` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_categories`
--

INSERT INTO `na_categories` (`id`, `uniqid`, `id_category_group`, `icon`, `archive`, `order_item`, `create_time`, `update_time`) VALUES
(1, '', 1, NULL, 0, 1, '2021-04-21 14:48:22', '2021-04-21 14:48:22'),
(2, '', 2, NULL, 1, 1, '2021-04-21 14:48:41', '2021-04-23 17:23:40'),
(3, '', 3, NULL, 0, 1, '2021-04-21 14:48:59', '2021-04-21 16:20:14'),
(4, '', 2, NULL, 0, 1, '2021-04-21 16:20:47', '2021-04-26 09:03:02'),
(5, '', 2, NULL, 0, 1, '2021-04-21 16:21:38', '2021-04-28 16:39:54'),
(6, '', 2, NULL, 1, 1, '2021-04-21 16:22:11', '2021-04-26 09:01:23'),
(7, '', 1, NULL, 0, 1, '2021-04-21 16:22:59', '2021-04-21 16:22:59'),
(8, '', 1, NULL, 0, 1, '2021-04-21 16:23:32', '2021-04-21 16:23:32'),
(9, '', 1, NULL, 0, 1, '2021-04-21 16:24:23', '2021-04-21 16:24:23'),
(10, '', 4, NULL, 0, 1, '2021-04-23 16:06:10', '2021-04-23 16:06:10'),
(11, '', 4, NULL, 0, 1, '2021-04-23 16:42:56', '2021-05-14 00:19:06'),
(12, '', 1, NULL, 0, 1, '2021-04-26 10:45:28', '2021-04-26 10:45:28'),
(13, '', 1, NULL, 0, 1, '2021-04-26 10:45:48', '2021-04-26 10:45:48'),
(14, '', 1, NULL, 0, 1, '2021-04-26 10:46:17', '2021-04-26 10:46:17'),
(15, '', 5, NULL, 0, 1, '2021-04-26 14:04:16', '2021-04-26 14:04:16'),
(16, '', 5, NULL, 0, 1, '2021-04-26 14:04:35', '2021-04-26 14:04:35'),
(17, '', 5, NULL, 0, 1, '2021-04-26 14:04:56', '2021-04-26 14:04:56'),
(18, '', 2, NULL, 1, 1, '2021-04-26 20:57:37', '2021-04-28 16:27:26'),
(19, '', 6, NULL, 0, 1, '2021-04-29 08:45:58', '2021-04-29 08:45:58'),
(20, '', 7, NULL, 0, 1, '2021-04-29 08:50:44', '2021-04-29 08:51:44'),
(21, '', 7, NULL, 0, 1, '2021-04-29 08:52:16', '2021-04-29 08:52:16'),
(22, '', 7, NULL, 0, 1, '2021-04-29 08:53:01', '2021-04-29 08:53:01'),
(24, '', 9, NULL, 1, 1, '2021-05-07 08:36:46', '2021-05-07 08:36:46'),
(25, '', 9, NULL, 0, 1, '2021-05-07 08:47:06', '2021-05-07 08:47:41'),
(26, '', 9, NULL, 0, 1, '2021-05-07 08:50:53', '2021-05-07 08:51:35'),
(27, '', 9, NULL, 0, 1, '2021-05-07 08:52:16', '2021-05-07 08:52:16'),
(28, '', 10, NULL, 0, 1, '2021-05-07 08:54:51', '2021-05-07 08:54:51'),
(29, '', 10, NULL, 0, 1, '2021-05-07 08:55:07', '2021-05-07 08:55:07'),
(30, '', 4, NULL, 0, 1, '2021-05-07 21:22:17', '2021-05-07 21:22:17'),
(31, '', 2, NULL, 1, 1, '2021-05-07 21:23:41', '2021-05-07 21:28:03'),
(32, '', 1, NULL, 0, 1, '2021-05-11 11:15:35', '2021-05-11 11:15:35'),
(33, '', 1, NULL, 0, 1, '2021-05-19 15:34:04', '2021-05-19 15:34:04'),
(34, '', 1, NULL, 0, 1, '2021-06-07 14:07:17', '2021-06-07 14:07:17');

-- --------------------------------------------------------

--
-- Structure de la table `na_categories_groups`
--

CREATE TABLE `na_categories_groups` (
  `id` int(11) NOT NULL,
  `order_item` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_categories_groups`
--

INSERT INTO `na_categories_groups` (`id`, `order_item`, `create_time`, `update_time`) VALUES
(1, 1, '2021-04-21 14:46:56', '2021-05-06 10:47:00'),
(2, 2, '2021-04-21 14:47:11', '2021-05-06 11:01:20'),
(3, 3, '2021-04-21 14:47:30', '2021-05-06 10:47:15'),
(4, 4, '2021-04-23 16:05:12', '2021-05-06 10:47:22'),
(5, 5, '2021-04-26 14:02:43', '2021-05-06 10:47:26'),
(6, 6, '2021-04-29 08:45:42', '2021-05-06 10:47:33'),
(7, 7, '2021-04-29 08:50:13', '2021-05-06 10:47:44'),
(9, 8, '2021-05-07 08:23:06', '2021-05-07 08:23:06'),
(10, 9, '2021-05-07 08:23:40', '2021-05-07 08:23:40');

-- --------------------------------------------------------

--
-- Structure de la table `na_categories_groups_multilingual`
--

CREATE TABLE `na_categories_groups_multilingual` (
  `id` int(11) NOT NULL,
  `id_category_group` int(11) NOT NULL,
  `id_language` int(11) NOT NULL,
  `title` varchar(765) NOT NULL,
  `permalink` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_categories_groups_multilingual`
--

INSERT INTO `na_categories_groups_multilingual` (`id`, `id_category_group`, `id_language`, `title`, `permalink`) VALUES
(1, 1, 1, 'Pages', 'pages'),
(2, 1, 2, 'Pages', 'pages'),
(3, 2, 1, 'Huiles essentielles', 'huiles-essentielles'),
(4, 2, 2, 'Essentials Oils', 'essentials-oils'),
(5, 3, 1, 'News', 'news'),
(6, 3, 2, 'Huilles végétales', 'huilles-vegetales'),
(7, 4, 1, 'Home', 'home'),
(8, 4, 2, 'Slider', 'slider'),
(9, 5, 1, 'Qualité', 'qualite'),
(10, 5, 2, 'Qualité', 'qualite'),
(11, 6, 1, 'Filières', 'filieres'),
(12, 6, 2, 'Filières', 'filieres'),
(13, 7, 1, 'Approche', 'approche'),
(14, 7, 2, 'Approche', 'approche'),
(17, 9, 1, 'Huiles végétales', 'huiles-vegetales'),
(18, 9, 2, 'Vegetal oils', 'vegetal-oils'),
(19, 10, 1, 'Produits locaux', 'produits-locaux'),
(20, 10, 2, 'Local products', 'local-products');

-- --------------------------------------------------------

--
-- Structure de la table `na_categories_multilingual`
--

CREATE TABLE `na_categories_multilingual` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_language` int(11) NOT NULL,
  `title` varchar(765) NOT NULL,
  `short_description` varchar(765) NOT NULL,
  `text` text,
  `seo_title` varchar(765) DEFAULT NULL,
  `seo_meta_description` text,
  `seo_meta_keyword` text,
  `seo_permalink` varchar(765) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_categories_multilingual`
--

INSERT INTO `na_categories_multilingual` (`id`, `id_category`, `id_language`, `title`, `short_description`, `text`, `seo_title`, `seo_meta_description`, `seo_meta_keyword`, `seo_permalink`) VALUES
(1, 1, 1, 'Qui sommes-nous ?', '', '', NULL, NULL, NULL, 'qui-sommes-nous-'),
(2, 1, 2, 'Who are we ?', '', '', NULL, NULL, NULL, 'who-are-we-'),
(3, 2, 1, 'Géranium', 'Huile Essentielle De Géranium', '<p>Le G&eacute;ranium, plante de la famille des Geraniaceae dont le nom botanique est le Pelargonium roseat, est un arbrisseau d&rsquo;un m&egrave;tre de haut en moyenne. Les feuilles vertes sont duveteuses et comportent des poils s&eacute;cr&eacute;teurs et protecteurs : ce sont eux qui contiennent l&rsquo;huile essentielle.</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, NULL, NULL, 'geranium'),
(4, 2, 2, '', '', '', NULL, NULL, NULL, ''),
(5, 3, 1, 'Dernières nouvelles', '', '', NULL, NULL, NULL, 'dernieres-nouvelles'),
(6, 3, 2, '', '', '', NULL, NULL, NULL, ''),
(7, 4, 1, 'Gingembre', 'Huile essentielle de Gingembre', '<p>Le Gingembre est une plante de la famille des zingib&eacute;rac&eacute;es, son nom botanique est Zingiber officinale. L&rsquo;huile essentielle de Gingembre frais est obtenue par la distillation des rhizomes r&eacute;colt&eacute;s frais</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, NULL, NULL, 'gingembre'),
(8, 4, 2, '', '', '', NULL, NULL, NULL, ''),
(9, 5, 1, 'Cannelle', 'Huile Essentielle De Cannelle', '<p>Le cannelier est un arbre &agrave; feuilles persistante de la famille des Lauraceae. Son nom botannique est le Cinnamon Zeylanicum. Il est originaire du Sri Lanka, des Seychelles et de Madagascar. Le cannelier pousse naturellement, gr&acirc;ce &agrave; la diss&eacute;mination de ses graines, sur les parcelles des paysans. Cependant il est de plus en plus cultiv&eacute; pour son &eacute;corce.</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, NULL, NULL, 'cannelle'),
(10, 5, 2, 'Cinnamon', 'Cinnamon essential oil', '<p>The cinnamon tree is an evergreen tree of the Lauraceae family. Its botanical name is Cinnamon zeylanicum. It originates from Sri Lanka, the Seychelles and Madagascar. The cinnamon tree grows naturally on the farmers&rsquo; plots thanks to the dissemination of its seeds.</p>\r\n\r\n<p>However, it&rsquo;s increasingly cultivated for its bark.</p>\r\n', NULL, NULL, NULL, 'cinnamon'),
(11, 6, 1, 'Girofle', 'Huile essentielle de Girofle', '<p>Le giroflier est un arbre &agrave; feuilles persistantes, de la famille des Myrtacae, le nom botanique est Eugenia caryophyllus.</p>\r\n\r\n<p>Le rendement de la distillation des clous de girofle est d&rsquo;environ 12%. Notre unit&eacute; de production propose des qualit&eacute;s &agrave; fa&ccedil;on, nos huiles essentielles sont disponibles en conventionnelle ou en biologique.</p>\r\n', NULL, NULL, NULL, 'girofle'),
(12, 6, 2, '', '', '', NULL, NULL, NULL, ''),
(13, 7, 1, 'Qualité', '', '', NULL, NULL, NULL, 'qualite'),
(14, 7, 2, '', '', '', NULL, NULL, NULL, ''),
(15, 8, 1, 'Notre approche', '', '', NULL, NULL, NULL, 'notre-approche'),
(16, 8, 2, '', '', '', NULL, NULL, NULL, ''),
(17, 9, 1, 'Filières paysannes', '', '', NULL, NULL, NULL, 'filieres-paysannes'),
(18, 9, 2, '', '', '', NULL, NULL, NULL, ''),
(19, 10, 1, 'Slider', '', '', NULL, NULL, NULL, 'slider'),
(20, 10, 2, '', '', '', NULL, NULL, NULL, ''),
(21, 11, 1, 'About', 'Nous sommes producteur des huiles essentielles avec les plantes aromatiques et biologiques de  Madagascar', '<p>Les huiles essentielles sont produites par entraiment de vapeur d&rsquo;eau.</p>\r\n\r\n<p>Nous travaillons avec des coop&eacute;ratives bas&eacute;es dans les r&eacute;gions&nbsp;:</p>\r\n\r\n<ul style="list-style-type:circle;">\r\n	<li>Fianarantsoa, Mahatsiatra Ambony</li>\r\n	<li>Maroantsetra , Analanjorofo</li>\r\n	<li>Nosy Be, Diana</li>\r\n</ul>\r\n\r\n<p>Les huiles essentielles sont analys&eacute;s dans les 2 laboratoires &agrave; Madagascar&nbsp;: Le Laboratoire LCP Nanisana et le Laboratoire Institut Malgache de Recherches Appliqu&eacute;es (IMRA)</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, NULL, NULL, 'about'),
(22, 11, 2, '', '', '', NULL, NULL, NULL, ''),
(23, 12, 1, 'Mots du fondateur', '', '', NULL, NULL, NULL, 'mots-du-fondateur'),
(24, 12, 2, '', '', '', NULL, NULL, NULL, ''),
(25, 13, 1, 'Objectifs partenaires', '', '', NULL, NULL, NULL, 'objectifs-partenaires'),
(26, 13, 2, '', '', '', NULL, NULL, NULL, ''),
(27, 14, 1, 'Team', '', '', NULL, NULL, NULL, 'team'),
(28, 14, 2, '', '', '', NULL, NULL, NULL, ''),
(29, 15, 1, 'About', '', '', NULL, NULL, NULL, 'about'),
(30, 15, 2, '', '', '', NULL, NULL, NULL, ''),
(31, 16, 1, 'Partenaires', '', '', NULL, NULL, NULL, 'partenaires'),
(32, 16, 2, '', '', '', NULL, NULL, NULL, ''),
(33, 17, 1, 'Nos produits', '', '', NULL, NULL, NULL, 'nos-produits'),
(34, 17, 2, '', '', '', NULL, NULL, NULL, ''),
(35, 18, 1, 'Ravintsara', 'Huile essentielle de Ravintsara', '', NULL, NULL, NULL, 'ravintsara'),
(36, 18, 2, '', '', '', NULL, NULL, NULL, ''),
(37, 19, 1, 'About', '', '', NULL, NULL, NULL, 'about'),
(38, 19, 2, '', '', '', NULL, NULL, NULL, ''),
(39, 20, 1, 'Notre approche', 'DURABLE, ENVIRONNEMENTALE ET SOCIALE', '', NULL, NULL, NULL, 'notre-approche'),
(40, 20, 2, '', '', '', NULL, NULL, NULL, ''),
(41, 21, 1, 'Content', '', '', NULL, NULL, NULL, 'content'),
(42, 21, 2, '', '', '', NULL, NULL, NULL, ''),
(43, 22, 1, 'Initiatives', '', '<p><strong>Des initiatives</strong> favorables &agrave; l&rsquo;environnement</p>\r\n', NULL, NULL, NULL, 'initiatives'),
(44, 22, 2, '', '', '', NULL, NULL, NULL, ''),
(47, 24, 1, 'Amande', 'Huile d’amande douce', '<p>L&rsquo;amande douce provient de l&rsquo;amandou qui n&rsquo;est autre que le fruit de l&rsquo;amandier. Riche en vitamine A et E, cette huile poss&egrave;de de tr&egrave;s nombreuses propri&eacute;t&eacute;s:&nbsp; adoucissantes, nourrissantes, fortifiantes, apaisantes et tonifiantes.</p>\r\n', NULL, NULL, NULL, 'amande'),
(48, 24, 2, '', '', '', NULL, NULL, NULL, ''),
(49, 25, 1, 'Coco', 'Huile de coco', '<p>R&eacute;put&eacute;e et appr&eacute;ci&eacute;e pour ses multiples bienfaits (nourrissante, r&eacute;g&eacute;n&eacute;rante, sublimante, antibact&eacute;rienne et antimicrobienne),&nbsp; l&rsquo;huile de noix de coco a un usage tr&egrave;s vari&eacute; !&nbsp;</p>\r\n', NULL, NULL, NULL, 'coco'),
(50, 25, 2, '', '', '', NULL, NULL, NULL, ''),
(51, 26, 1, 'Huile d’avocat', 'Huile d’avocat', '<p>L&rsquo;huile d&rsquo;avocat est l&rsquo;une des huiles les plus riches par sa composition tr&egrave;s g&eacute;n&eacute;reuse en vitamines et en acide gras. Riche en prot&eacute;ines, elle contient &eacute;galement de la vitamine A, B, C, D, E, H, K, et PP !&nbsp;&nbsp;</p>\r\n', NULL, NULL, NULL, 'huile-d-avocat'),
(52, 26, 2, '', '', '', NULL, NULL, NULL, ''),
(53, 27, 1, 'Huile de rose musquée', 'Huile de rose musquée', '<p>Sans doute le grand classique anti-&acirc;ge pour la peau et l&rsquo;organisme. Riche en vitamine A, E, om&eacute;ga 3 et 6 et en acides gras essentiels, l&rsquo;huile de rose musqu&eacute;e pr&eacute;serve la beaut&eacute; de la peau en offrant une bonne hydratation et une protection contre les mol&eacute;cules responsables du vieillissement cutan&eacute;.</p>\r\n', NULL, NULL, NULL, 'huile-de-rose-musquee'),
(54, 27, 2, '', '', '', NULL, NULL, NULL, ''),
(55, 28, 1, 'Epices', 'Epices', '', NULL, NULL, NULL, 'epices'),
(56, 28, 2, '', '', '', NULL, NULL, NULL, ''),
(57, 29, 1, 'Vanille', 'Vanille', '', NULL, NULL, NULL, 'vanille'),
(58, 29, 2, '', '', '', NULL, NULL, NULL, ''),
(59, 30, 1, 'Test', '', '', NULL, NULL, NULL, 'test'),
(60, 30, 2, '', '', '', NULL, NULL, NULL, ''),
(61, 31, 1, 'Kininim-potsy', 'Kininim-potsy', '', NULL, NULL, NULL, 'kininim-potsy'),
(62, 31, 2, '', '', '', NULL, NULL, NULL, ''),
(63, 32, 1, 'Mentions légales', '', '', NULL, NULL, NULL, 'mentions-legales'),
(64, 32, 2, '', '', '', NULL, NULL, NULL, ''),
(65, 33, 1, 'Plan du site', '', '', NULL, NULL, NULL, 'plan-du-site'),
(66, 33, 2, 'Sitemap', '', '', NULL, NULL, NULL, 'sitemap'),
(67, 34, 1, 'Notre histoire', '', '', NULL, NULL, NULL, 'notre-histoire'),
(68, 34, 2, 'Our history', '', '', NULL, NULL, NULL, 'our-history');

-- --------------------------------------------------------

--
-- Structure de la table `na_contacts`
--

CREATE TABLE `na_contacts` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `message` text,
  `create_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_contacts`
--

INSERT INTO `na_contacts` (`id`, `name`, `email`, `message`, `create_time`) VALUES
(17, 'Maxime', 'maxime@gmail.com', '<html>\r\n<head>\r\n    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">\r\n    <title>Nouveau message</title>\r\n</head>\r\n\r\n<body>\r\n        <table width="100%" cellpadding="0" cellspacing="0">\r\n        <tr>\r\n            <td>\r\n                <table cellpadding="20" cellspacing="0" width="600" align="center">\r\n                    \r\n                    <p>Bonjour Natoraly Aroma\r\n...</p>\r\n                </table><!-- top message -->\r\n            </td>\r\n        </tr>\r\n    </table><!-- wrapper -->\r\n</body>\r\n</html>', '2021-05-12 12:42:51');

-- --------------------------------------------------------

--
-- Structure de la table `na_languages`
--

CREATE TABLE `na_languages` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `title_fr` varchar(60) NOT NULL,
  `title_en` varchar(60) NOT NULL,
  `abbreviation` varchar(765) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `order_item` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_languages`
--

INSERT INTO `na_languages` (`id`, `title`, `title_fr`, `title_en`, `abbreviation`, `active`, `order_item`) VALUES
(1, 'Français', 'français', 'french', 'fr', 1, 1),
(2, 'Anglais', 'anglais', 'english', 'en', 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `na_medias`
--

CREATE TABLE `na_medias` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED DEFAULT NULL,
  `resource_type` varchar(50) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `filename` varchar(765) NOT NULL,
  `show_in_gallery` tinyint(1) DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_medias`
--

INSERT INTO `na_medias` (`id`, `id_user`, `resource_type`, `resource_id`, `filename`, `show_in_gallery`, `create_time`, `update_time`) VALUES
(4, 1, NULL, NULL, '6082d8cf00d1f-source.jpg', 1, '2021-04-23 17:25:19', '2021-04-23 17:25:19'),
(5, 1, NULL, NULL, '6082d8d02950d-source.jpg', 1, '2021-04-23 17:25:20', '2021-04-23 17:25:20'),
(6, 1, NULL, NULL, '6082dd5de10c2-source.jpg', 1, '2021-04-23 17:44:45', '2021-04-23 17:44:45'),
(7, 1, NULL, NULL, '608657c435faa-source.jpg', 1, '2021-04-26 09:03:48', '2021-04-26 09:03:48'),
(8, 1, NULL, NULL, '6086590a2df74-source.jpg', 1, '2021-04-26 09:09:14', '2021-04-26 09:09:14'),
(9, 1, NULL, NULL, '608659437c01e-source.jpg', 1, '2021-04-26 09:10:11', '2021-04-26 09:10:11'),
(10, 1, NULL, NULL, '6086599830dd7-source.jpg', 1, '2021-04-26 09:11:36', '2021-04-26 09:11:36'),
(11, 1, NULL, NULL, '6086631c99ac2-source.jpg', 1, '2021-04-26 09:52:12', '2021-04-26 09:52:12'),
(12, 1, NULL, NULL, '6086631e5cce1-source.jpg', 1, '2021-04-26 09:52:14', '2021-04-26 09:52:14'),
(13, 1, NULL, NULL, '60866320dac06-source.jpg', 1, '2021-04-26 09:52:16', '2021-04-26 09:52:16'),
(14, 1, NULL, NULL, '608663216ec78-source.jpg', 1, '2021-04-26 09:52:17', '2021-04-26 09:52:17'),
(15, 1, NULL, NULL, '6086b035d5c36-source.png', 1, '2021-04-26 15:21:09', '2021-04-26 15:21:09'),
(16, 1, NULL, NULL, '6086b03777606-source.jpg', 1, '2021-04-26 15:21:11', '2021-04-26 15:21:11'),
(17, 1, NULL, NULL, '6086b03b28995-source.jpg', 1, '2021-04-26 15:21:15', '2021-04-26 15:21:15'),
(18, 1, NULL, NULL, '6086b03c3cd95-source.jpg', 1, '2021-04-26 15:21:16', '2021-04-26 15:21:16'),
(19, 1, NULL, NULL, '6086b03eb5f46-source.jpg', 1, '2021-04-26 15:21:18', '2021-04-26 15:21:18'),
(20, 1, NULL, NULL, '6086b03fdf79f-source.jpg', 1, '2021-04-26 15:21:19', '2021-04-26 15:21:19'),
(21, 1, NULL, NULL, '6086b0422ff44-source.jpg', 1, '2021-04-26 15:21:22', '2021-04-26 15:21:22'),
(22, 1, NULL, NULL, '6086b043de406-source.jpg', 1, '2021-04-26 15:21:23', '2021-04-26 15:21:23'),
(23, 1, NULL, NULL, '6086b18d4c400-source.jpg', 1, '2021-04-26 15:26:53', '2021-04-26 15:26:53'),
(24, 1, NULL, NULL, '6086b18d7e12d-source.jpg', 1, '2021-04-26 15:26:53', '2021-04-26 15:26:53'),
(25, 1, NULL, NULL, '6086b18e917a0-source.jpg', 1, '2021-04-26 15:26:54', '2021-04-26 15:26:54'),
(26, 1, NULL, NULL, '6086b19ecbfbb-source.png', 1, '2021-04-26 15:27:10', '2021-04-26 15:27:10'),
(27, 1, NULL, NULL, '6086b19f6d9f8-source.png', 1, '2021-04-26 15:27:11', '2021-04-26 15:27:11'),
(28, 1, NULL, NULL, '6086b1a0ade0c-source.png', 1, '2021-04-26 15:27:12', '2021-04-26 15:27:12'),
(29, 1, NULL, NULL, '6086b1a272eeb-source.png', 1, '2021-04-26 15:27:14', '2021-04-26 15:27:14'),
(30, 1, NULL, NULL, '6086b1a3930a5-source.png', 1, '2021-04-26 15:27:15', '2021-04-26 15:27:15'),
(31, 1, NULL, NULL, '6086b1a3d1bd9-source.png', 1, '2021-04-26 15:27:15', '2021-04-26 15:27:15'),
(32, 1, NULL, NULL, '6086b1b307e8b-source.jpg', 1, '2021-04-26 15:27:31', '2021-04-26 15:27:31'),
(33, 1, NULL, NULL, '6086b1b34a7d9-source.jpg', 1, '2021-04-26 15:27:31', '2021-04-26 15:27:31'),
(34, 1, NULL, NULL, '6086b1b47b895-source.jpg', 1, '2021-04-26 15:27:32', '2021-04-26 15:27:32'),
(35, 1, NULL, NULL, '6086bfe1e4244-source.jpg', 1, '2021-04-26 16:28:01', '2021-04-26 16:28:01'),
(36, 1, NULL, NULL, '6086bfe21ff94-source.jpg', 1, '2021-04-26 16:28:02', '2021-04-26 16:28:02'),
(37, 1, NULL, NULL, '6086bfe348bcf-source.jpg', 1, '2021-04-26 16:28:03', '2021-04-26 16:28:03'),
(38, 1, NULL, NULL, '6086bfe464647-source.jpg', 1, '2021-04-26 16:28:04', '2021-04-26 16:28:04'),
(39, 1, NULL, NULL, '6086bffc0b853-source.jpg', 1, '2021-04-26 16:28:28', '2021-04-26 16:28:28'),
(40, 1, NULL, NULL, '6086e03502da1-source.jpg', 1, '2021-04-26 18:45:57', '2021-04-26 18:45:57'),
(41, 1, NULL, NULL, '6086e03579613-source.jpg', 1, '2021-04-26 18:45:57', '2021-04-26 18:45:57'),
(42, 1, NULL, NULL, '6086e036bb58f-source.jpg', 1, '2021-04-26 18:45:58', '2021-04-26 18:45:58'),
(43, 1, NULL, NULL, '6086e0394e1a2-source.jpg', 1, '2021-04-26 18:46:01', '2021-04-26 18:46:01'),
(44, 1, NULL, NULL, '608a48a2f17a5-source.jpg', 1, '2021-04-29 08:48:18', '2021-04-29 08:48:18'),
(45, 1, NULL, NULL, '608a622f49865-source.jpg', 1, '2021-04-29 10:37:19', '2021-04-29 10:37:19'),
(46, 1, NULL, NULL, '608a6230d31ee-source.jpg', 1, '2021-04-29 10:37:20', '2021-04-29 10:37:20'),
(47, 1, NULL, NULL, '608a623265b19-source.jpg', 1, '2021-04-29 10:37:22', '2021-04-29 10:37:22'),
(48, 1, NULL, NULL, '608a6233a7c21-source.jpg', 1, '2021-04-29 10:37:23', '2021-04-29 10:37:23'),
(49, 1, NULL, NULL, '608a623565c4d-source.jpg', 1, '2021-04-29 10:37:25', '2021-04-29 10:37:25'),
(50, 1, NULL, NULL, '608a6237d7eca-source.jpg', 1, '2021-04-29 10:37:27', '2021-04-29 10:37:27'),
(51, 1, NULL, NULL, '608a623fe4023-source.jpg', 1, '2021-04-29 10:37:35', '2021-04-29 10:37:35'),
(52, 1, 'logos', NULL, '608bae6999f99-source.png', 1, '2021-04-30 10:14:49', '2021-04-30 10:14:49'),
(53, 1, 'logos', NULL, '608bb2f758a9e-source.png', 1, '2021-04-30 10:34:15', '2021-04-30 10:34:15'),
(54, 1, NULL, NULL, '6093bbe3ac1b9-source.jpg', 1, '2021-05-06 12:50:27', '2021-05-06 12:50:27'),
(55, 1, NULL, NULL, '6094cfa8d7665-source.jpg', 1, '2021-05-07 08:27:04', '2021-05-07 08:27:04'),
(56, 1, NULL, NULL, '6094cfabc2ac5-source.jpg', 1, '2021-05-07 08:27:07', '2021-05-07 08:27:07'),
(57, 1, NULL, NULL, '6094d290433d1-source.jpg', 1, '2021-05-07 08:39:28', '2021-05-07 08:39:28'),
(58, 1, NULL, NULL, '6094d417458bd-source.jpg', 1, '2021-05-07 08:45:59', '2021-05-07 08:45:59'),
(59, 1, NULL, NULL, '6094d4ebc8bb2-source.jpg', 1, '2021-05-07 08:49:31', '2021-05-07 08:49:31'),
(60, 1, NULL, NULL, '609553a0449a3-source.jpg', 1, '2021-05-07 17:50:08', '2021-05-07 17:50:08'),
(61, 1, NULL, NULL, '6095875544576-source.jpg', 1, '2021-05-07 21:30:45', '2021-05-07 21:30:45'),
(62, 1, NULL, NULL, '609d849448cc8-source.JPG', 1, '2021-05-13 22:57:08', '2021-05-13 22:57:08'),
(63, 1, NULL, NULL, '609d91d9f0d92-source.jpg', 1, '2021-05-13 23:53:45', '2021-05-13 23:53:45'),
(64, 1, NULL, NULL, '609d95ef07824-source.JPG', 1, '2021-05-14 00:11:11', '2021-05-14 00:11:11'),
(65, 1, NULL, NULL, '609d9cb66145a-source.jpg', 1, '2021-05-14 00:40:06', '2021-05-14 00:40:06'),
(66, 1, NULL, NULL, '609d9fa975996-source.JPG', 1, '2021-05-14 00:52:41', '2021-05-14 00:52:41'),
(67, 1, NULL, NULL, '609da0e844690-source.JPG', 1, '2021-05-14 00:58:00', '2021-05-14 00:58:00'),
(68, 1, NULL, NULL, '609da9983c7c1-source.JPG', 1, '2021-05-14 01:35:04', '2021-05-14 01:35:04'),
(69, 1, NULL, NULL, '609db5cb00147-source.JPG', 1, '2021-05-14 02:27:07', '2021-05-14 02:27:07'),
(70, 1, NULL, NULL, '609db748ca1e6-source.JPG', 1, '2021-05-14 02:33:28', '2021-05-14 02:33:28');

-- --------------------------------------------------------

--
-- Structure de la table `na_medias_metas`
--

CREATE TABLE `na_medias_metas` (
  `id` int(11) UNSIGNED NOT NULL,
  `module` varchar(150) DEFAULT NULL,
  `id_item` int(11) UNSIGNED DEFAULT NULL,
  `id_media` int(11) UNSIGNED DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `order_item` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_medias_metas`
--

INSERT INTO `na_medias_metas` (`id`, `module`, `id_item`, `id_media`, `type`, `order_item`) VALUES
(3, 'category', 2, 4, 'cover', NULL),
(4, 'category', 5, 5, 'cover', NULL),
(5, 'category', 6, 6, 'cover', NULL),
(6, 'category', 4, 7, 'cover', NULL),
(14, 'pages', 15, 24, 'cover', NULL),
(15, 'pages', 21, 32, 'cover', NULL),
(16, 'pages', 22, 33, 'cover', NULL),
(17, 'pages', 23, 34, 'cover', NULL),
(21, 'pages', 24, 18, 'cover', NULL),
(23, 'pages', 13, 22, 'cover', NULL),
(24, 'pages', 27, 39, 'cover', NULL),
(25, 'pages', 28, 35, 'cover', NULL),
(26, 'pages', 29, 36, 'cover', NULL),
(27, 'pages', 35, 37, 'cover', NULL),
(28, 'pages', 36, 38, 'cover', NULL),
(29, 'pages', 30, 26, 'cover', NULL),
(30, 'pages', 31, 27, 'cover', NULL),
(31, 'pages', 32, 28, 'cover', NULL),
(33, 'pages', 34, 30, 'cover', NULL),
(34, 'pages', 37, 31, 'cover', NULL),
(35, 'pages', 38, 41, 'cover', NULL),
(36, 'pages', 39, 40, 'cover', NULL),
(37, 'pages', 40, 44, 'cover', NULL),
(38, 'pages', 48, 5, 'cover', NULL),
(39, 'pages', 47, 51, 'cover', NULL),
(40, 'pages', 46, 47, 'cover', NULL),
(41, 'pages', 43, 27, 'cover', NULL),
(42, 'pages', 44, 31, 'cover', NULL),
(43, 'pages', 45, 29, 'cover', NULL),
(44, 'groupes', 2, 54, 'cover', NULL),
(45, 'groupes', 9, 56, 'cover', NULL),
(46, 'groupes', 10, 55, 'cover', NULL),
(47, 'pages', 50, 57, 'cover', NULL),
(48, 'pages', 51, 58, 'cover', NULL),
(49, 'pages', 52, 59, 'cover', NULL),
(50, 'category', 24, 60, 'cover', NULL),
(51, 'pages', 53, 45, 'cover', NULL),
(52, 'pages', 7, 62, 'cover', NULL),
(53, 'pages', 8, 63, 'cover', NULL),
(54, 'pages', 9, 64, 'cover', NULL),
(55, 'pages', 10, 65, 'cover', NULL),
(56, 'pages', 11, 66, 'cover', NULL),
(57, 'pages', 12, 67, 'cover', NULL),
(59, 'pages', 25, 69, 'cover', NULL),
(60, 'pages', 14, 70, 'cover', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `na_medias_multilingual`
--

CREATE TABLE `na_medias_multilingual` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_media` int(11) UNSIGNED NOT NULL,
  `id_language` int(11) NOT NULL,
  `title` varchar(1020) DEFAULT NULL,
  `caption` mediumtext,
  `alt` mediumtext,
  `description` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_medias_multilingual`
--

INSERT INTO `na_medias_multilingual` (`id`, `id_media`, `id_language`, `title`, `caption`, `alt`, `description`) VALUES
(7, 4, 1, 'feuille-fleur', NULL, NULL, NULL),
(8, 4, 2, 'feuille-fleur', NULL, NULL, NULL),
(9, 5, 1, 'huile-essentielle-de-Cannelle-de-Madagascar-3', NULL, NULL, NULL),
(10, 5, 2, 'huile-essentielle-de-Cannelle-de-Madagascar-3', NULL, NULL, NULL),
(11, 6, 1, 'huile-essentielle-de-Girofle-de-Madagascar-3', NULL, NULL, NULL),
(12, 6, 2, 'huile-essentielle-de-Girofle-de-Madagascar-3', NULL, NULL, NULL),
(13, 7, 1, 'Producteur-huile-essentielle-de-gingembre-de-Madagascar-1', NULL, NULL, NULL),
(14, 7, 2, 'Producteur-huile-essentielle-de-gingembre-de-Madagascar-1', NULL, NULL, NULL),
(15, 8, 1, 'IMG-20210223-WA0044', NULL, NULL, NULL),
(16, 8, 2, 'IMG-20210223-WA0044', NULL, NULL, NULL),
(17, 9, 1, 'IMG_1438-1', NULL, NULL, NULL),
(18, 9, 2, 'IMG_1438-1', NULL, NULL, NULL),
(19, 10, 1, '1-20200909_125259-980x476', NULL, NULL, NULL),
(20, 10, 2, '1-20200909_125259-980x476', NULL, NULL, NULL),
(21, 11, 1, '01', NULL, NULL, NULL),
(22, 11, 2, '01', NULL, NULL, NULL),
(23, 12, 1, '02', NULL, NULL, NULL),
(24, 12, 2, '02', NULL, NULL, NULL),
(25, 13, 1, '03', NULL, NULL, NULL),
(26, 13, 2, '03', NULL, NULL, NULL),
(27, 14, 1, '04', NULL, NULL, NULL),
(28, 14, 2, '04', NULL, NULL, NULL),
(29, 15, 1, 'logo_natoraly_aroma', NULL, NULL, NULL),
(30, 15, 2, 'logo_natoraly_aroma', NULL, NULL, NULL),
(31, 16, 1, 'fond-collines', NULL, NULL, NULL),
(32, 16, 2, 'fond-collines', NULL, NULL, NULL),
(33, 17, 1, 'usine', NULL, NULL, NULL),
(34, 17, 2, 'usine', NULL, NULL, NULL),
(35, 18, 1, 'bureau-antananarivo', NULL, NULL, NULL),
(36, 18, 2, 'bureau-antananarivo', NULL, NULL, NULL),
(37, 19, 1, 'bureau-france', NULL, NULL, NULL),
(38, 19, 2, 'bureau-france', NULL, NULL, NULL),
(39, 20, 1, 'femme-piste-foret', NULL, NULL, NULL),
(40, 20, 2, 'femme-piste-foret', NULL, NULL, NULL),
(41, 21, 1, 'flacon-goutte-huile', NULL, NULL, NULL),
(42, 21, 2, 'flacon-goutte-huile', NULL, NULL, NULL),
(43, 22, 1, 'Femmes-avec-panier', NULL, NULL, NULL),
(44, 22, 2, 'Femmes-avec-panier', NULL, NULL, NULL),
(45, 23, 1, 'author-3', NULL, NULL, NULL),
(46, 23, 2, 'author-3', NULL, NULL, NULL),
(47, 24, 1, 'author-1', NULL, NULL, NULL),
(48, 24, 2, 'author-1', NULL, NULL, NULL),
(49, 25, 1, 'author-2', NULL, NULL, NULL),
(50, 25, 2, 'author-2', NULL, NULL, NULL),
(51, 26, 1, 'service-icon-4', NULL, NULL, NULL),
(52, 26, 2, 'service-icon-4', NULL, NULL, NULL),
(53, 27, 1, 'service-icon-5', NULL, NULL, NULL),
(54, 27, 2, 'service-icon-5', NULL, NULL, NULL),
(55, 28, 1, 'service-icon-6', NULL, NULL, NULL),
(56, 28, 2, 'service-icon-6', NULL, NULL, NULL),
(57, 29, 1, 'service-icon-1', NULL, NULL, NULL),
(58, 29, 2, 'service-icon-1', NULL, NULL, NULL),
(59, 30, 1, 'service-icon-2', NULL, NULL, NULL),
(60, 30, 2, 'service-icon-2', NULL, NULL, NULL),
(61, 31, 1, 'service-icon-3', NULL, NULL, NULL),
(62, 31, 2, 'service-icon-3', NULL, NULL, NULL),
(63, 32, 1, 'team-3', NULL, NULL, NULL),
(64, 32, 2, 'team-3', NULL, NULL, NULL),
(65, 33, 1, 'team-1', NULL, NULL, NULL),
(66, 33, 2, 'team-1', NULL, NULL, NULL),
(67, 34, 1, 'team-2', NULL, NULL, NULL),
(68, 34, 2, 'team-2', NULL, NULL, NULL),
(69, 35, 1, '1', NULL, NULL, NULL),
(70, 35, 2, '1', NULL, NULL, NULL),
(71, 36, 1, '2', NULL, NULL, NULL),
(72, 36, 2, '2', NULL, NULL, NULL),
(73, 37, 1, '3', NULL, NULL, NULL),
(74, 37, 2, '3', NULL, NULL, NULL),
(75, 38, 1, '4', NULL, NULL, NULL),
(76, 38, 2, '4', NULL, NULL, NULL),
(77, 39, 1, 'qualite-nez3', NULL, NULL, NULL),
(78, 39, 2, 'qualite-nez3', NULL, NULL, NULL),
(79, 40, 1, '2', NULL, NULL, NULL),
(80, 40, 2, '2', NULL, NULL, NULL),
(81, 41, 1, '1', NULL, NULL, NULL),
(82, 41, 2, '1', NULL, NULL, NULL),
(83, 42, 1, '3', NULL, NULL, NULL),
(84, 42, 2, '3', NULL, NULL, NULL),
(85, 43, 1, '4', NULL, NULL, NULL),
(86, 43, 2, '4', NULL, NULL, NULL),
(87, 44, 1, 'ecocert', NULL, NULL, NULL),
(88, 44, 2, 'ecocert', NULL, NULL, NULL),
(89, 45, 1, 'main-ecorces', NULL, NULL, NULL),
(90, 45, 2, 'main-ecorces', NULL, NULL, NULL),
(91, 46, 1, 'Plantation', NULL, NULL, NULL),
(92, 46, 2, 'Plantation', NULL, NULL, NULL),
(93, 47, 1, 'labo', NULL, NULL, NULL),
(94, 47, 2, 'labo', NULL, NULL, NULL),
(95, 48, 1, 'Programme-Education', NULL, NULL, NULL),
(96, 48, 2, 'Programme-Education', NULL, NULL, NULL),
(97, 49, 1, 'reboisement', NULL, NULL, NULL),
(98, 49, 2, 'reboisement', NULL, NULL, NULL),
(99, 50, 1, 'formation', NULL, NULL, NULL),
(100, 50, 2, 'formation', NULL, NULL, NULL),
(101, 51, 1, 'bandeau-2-notre-approche', NULL, NULL, NULL),
(102, 51, 2, 'bandeau-2-notre-approche', NULL, NULL, NULL),
(103, 52, 1, 'Logo 1', '', '', ''),
(104, 52, 2, 'logo', '', '', ''),
(105, 53, 1, 'logo (1)', NULL, NULL, NULL),
(106, 53, 2, 'logo (1)', NULL, NULL, NULL),
(107, 54, 1, 'parfum', NULL, NULL, NULL),
(108, 54, 2, 'parfum', NULL, NULL, NULL),
(109, 55, 1, '34107607_433402377126460_868078216974172160_n', NULL, NULL, NULL),
(110, 55, 2, '34107607_433402377126460_868078216974172160_n', NULL, NULL, NULL),
(111, 56, 1, 'Par-quoi-remplacer-lhuile-vegetale', NULL, NULL, NULL),
(112, 56, 2, 'Par-quoi-remplacer-lhuile-vegetale', NULL, NULL, NULL),
(113, 57, 1, 'amande', NULL, NULL, NULL),
(114, 57, 2, 'amande', NULL, NULL, NULL),
(115, 58, 1, 'Wavy_Bus-01_Single-11', NULL, NULL, NULL),
(116, 58, 2, 'Wavy_Bus-01_Single-11', NULL, NULL, NULL),
(117, 59, 1, 'coco', NULL, NULL, NULL),
(118, 59, 2, 'coco', NULL, NULL, NULL),
(119, 60, 1, 'huile-damande-douce-1-860x550', NULL, NULL, NULL),
(120, 60, 2, 'huile-damande-douce-1-860x550', NULL, NULL, NULL),
(121, 61, 1, '6093bbe3ac1b9-source', NULL, NULL, NULL),
(122, 61, 2, '6093bbe3ac1b9-source', NULL, NULL, NULL),
(123, 62, 1, 'Vohimasina_alambic_Nyara', '', '', ''),
(124, 62, 2, 'Vohimasina_alambic_Nyara', '', '', ''),
(125, 63, 1, 'IMG-20201126-WA0012', NULL, NULL, NULL),
(126, 63, 2, 'IMG-20201126-WA0012', NULL, NULL, NULL),
(127, 64, 1, 'Marontsetra_Alambic_traditionelle', NULL, NULL, NULL),
(128, 64, 2, 'Marontsetra_Alambic_traditionelle', NULL, NULL, NULL),
(129, 65, 1, 'IMG-20201126-WA0009', NULL, NULL, NULL),
(130, 65, 2, 'IMG-20201126-WA0009', NULL, NULL, NULL),
(131, 66, 1, 'Biodivertiste_Madagascar', NULL, NULL, NULL),
(132, 66, 2, 'Biodivertiste_Madagascar', NULL, NULL, NULL),
(133, 67, 1, 'Tortue_de_Madagascar', NULL, NULL, NULL),
(134, 67, 2, 'Tortue_de_Madagascar', NULL, NULL, NULL),
(135, 68, 1, 'Diamondra_Ylang', NULL, NULL, NULL),
(136, 68, 2, 'Diamondra_Ylang', NULL, NULL, NULL),
(137, 69, 1, 'Girofle_Maroantsetra', NULL, NULL, NULL),
(138, 69, 2, 'Girofle_Maroantsetra', NULL, NULL, NULL),
(139, 70, 1, 'Diamondra_Photo', NULL, NULL, NULL),
(140, 70, 2, 'Diamondra_Photo', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `na_modules`
--

CREATE TABLE `na_modules` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `has_selection` tinyint(1) NOT NULL DEFAULT '0',
  `is_news` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_modules`
--

INSERT INTO `na_modules` (`id`, `title`, `slug`, `has_selection`, `is_news`, `create_time`, `update_time`) VALUES
(1, 'Pages', 'pages', 0, 0, '2021-04-21 14:32:31', '2021-04-21 14:32:31'),
(2, 'Produits', 'produits', 1, 0, '2021-04-21 14:45:53', '2021-05-07 08:53:32'),
(3, 'News', 'news', 0, 1, '2021-04-21 14:46:01', '2021-04-21 16:18:57'),
(4, 'Home', 'home', 0, 0, '2021-04-23 16:04:13', '2021-04-23 16:38:29');

-- --------------------------------------------------------

--
-- Structure de la table `na_modules_categories_groups`
--

CREATE TABLE `na_modules_categories_groups` (
  `id` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `id_category_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_modules_categories_groups`
--

INSERT INTO `na_modules_categories_groups` (`id`, `id_module`, `id_category_group`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(9, 2, 9),
(10, 2, 10);

-- --------------------------------------------------------

--
-- Structure de la table `na_newsletters`
--

CREATE TABLE `na_newsletters` (
  `id` int(11) NOT NULL,
  `id_language` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_newsletters`
--

INSERT INTO `na_newsletters` (`id`, `id_language`, `email`, `statut`, `create_time`, `update_time`) VALUES
(7, 1, 'taksbeh@gmail.com', 1, '2021-05-10 21:57:51', '2021-05-10 21:57:51');

-- --------------------------------------------------------

--
-- Structure de la table `na_news_comments`
--

CREATE TABLE `na_news_comments` (
  `id` int(11) NOT NULL,
  `id_new` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` text,
  `hidden` tinyint(1) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `na_news_visits`
--

CREATE TABLE `na_news_visits` (
  `id` int(11) NOT NULL,
  `id_new` int(11) DEFAULT NULL,
  `ip` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_news_visits`
--

INSERT INTO `na_news_visits` (`id`, `id_new`, `ip`) VALUES
(1, 7, '102.68.228.18'),
(2, 7, '77.111.247.72'),
(3, 7, '40.77.167.75'),
(4, 8, '207.46.13.166'),
(5, 9, '207.46.13.37'),
(6, 7, '102.68.225.212'),
(7, 7, '41.82.49.33'),
(8, 7, '102.68.230.61'),
(9, 8, '102.68.230.61'),
(10, 9, '40.77.167.70'),
(11, 9, '207.46.13.2'),
(12, 7, '154.126.33.163'),
(13, 8, '154.126.33.163'),
(14, 9, '154.126.33.163'),
(15, 8, '41.190.239.121'),
(16, 7, '157.55.39.72'),
(17, 9, '157.55.39.82'),
(18, 9, '102.68.228.85'),
(19, 8, '102.68.228.85'),
(20, 7, '102.68.228.85');

-- --------------------------------------------------------

--
-- Structure de la table `na_options`
--

CREATE TABLE `na_options` (
  `meta_key` varchar(150) NOT NULL,
  `meta_value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_options`
--

INSERT INTO `na_options` (`meta_key`, `meta_value`) VALUES
('address', 'Madagascar'),
('admin_email', 'tahina.randriamahefa@yahoo.com'),
('allowed_ips', '127.0.0.1'),
('allow_addons', '1'),
('company_email', 'contact@natoralyaroma.com'),
('company_link_facebook', 'https://www.facebook.com/NatoralyAroma'),
('company_link_google_plus', ''),
('company_link_instagram', 'https://www.instagram.com/natoralyaroma/'),
('company_link_twitter', ''),
('company_site', 'http://natoralyaroma.local'),
('default_cover_url', 'images/default_cover.png'),
('font', 'wwf'),
('mode_maintenance', '0'),
('phone_number', '+261 34 84 585 38'),
('site_name', 'Natoraly Aroma'),
('slider', 'text');

-- --------------------------------------------------------

--
-- Structure de la table `na_pages`
--

CREATE TABLE `na_pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(150) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_similar_news` tinyint(1) NOT NULL DEFAULT '0',
  `order_item` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_pages`
--

INSERT INTO `na_pages` (`id`, `slug`, `icon`, `create_time`, `update_time`, `hidden`, `is_similar_news`, `order_item`) VALUES
(2, 'home', '', '2021-04-23 16:10:44', '2021-05-13 21:38:53', 0, 0, NULL),
(4, 'home', 'flaticon-nature-1', '2021-04-23 17:04:20', '2021-05-13 21:43:49', 0, 0, NULL),
(5, 'home', 'flaticon-plant-1', '2021-04-23 17:04:56', '2021-05-19 15:25:07', 0, 0, NULL),
(6, 'home', 'flaticon-sprout', '2021-04-23 17:05:25', '2021-05-19 15:26:54', 0, 0, NULL),
(7, 'news', '', '2021-04-26 09:08:40', '2021-05-13 23:22:18', 0, 1, NULL),
(8, 'news', '', '2021-04-26 09:10:43', '2021-05-13 23:56:15', 0, 1, NULL),
(9, 'news', '', '2021-04-26 09:12:00', '2021-05-14 00:16:12', 0, 1, NULL),
(10, 'pages', '', '2021-04-26 10:42:47', '2021-05-14 00:44:21', 0, 0, NULL),
(11, 'pages', '', '2021-04-26 10:43:26', '2021-05-14 01:03:37', 0, 0, NULL),
(12, 'pages', '', '2021-04-26 10:43:55', '2021-05-14 01:02:57', 0, 0, NULL),
(13, 'pages', '', '2021-04-26 10:44:25', '2021-04-26 10:44:25', 1, 0, NULL),
(14, 'pages', '', '2021-04-26 10:47:23', '2021-05-14 02:43:29', 0, 0, NULL),
(15, 'pages', '', '2021-04-26 10:47:42', '2021-04-26 10:47:42', 1, 0, NULL),
(16, 'pages', 'flaticon-nature', '2021-04-26 10:48:43', '2021-04-26 10:50:36', 1, 0, NULL),
(17, 'pages', 'flaticon-eco-world', '2021-04-26 10:49:01', '2021-04-26 10:50:49', 1, 0, NULL),
(18, 'pages', 'flaticon-nature-2', '2021-04-26 10:49:28', '2021-04-26 10:51:03', 1, 0, NULL),
(19, 'pages', 'flaticon-recycle', '2021-04-26 10:49:45', '2021-04-26 10:51:12', 1, 0, NULL),
(20, 'pages', 'flaticon-donation', '2021-04-26 10:49:58', '2021-04-26 16:42:53', 1, 0, NULL),
(21, 'pages', '', '2021-04-26 10:52:58', '2021-04-26 10:52:58', 0, 0, NULL),
(22, 'pages', '', '2021-04-26 10:53:06', '2021-04-26 10:53:06', 0, 0, NULL),
(23, 'pages', '', '2021-04-26 10:53:14', '2021-04-26 10:53:14', 0, 0, NULL),
(24, 'pages', '', '2021-04-26 10:54:04', '2021-04-26 10:54:04', 1, 0, NULL),
(25, 'pages', '', '2021-04-26 10:54:31', '2021-05-14 02:33:19', 0, 0, NULL),
(26, 'pages', '', '2021-04-26 14:05:36', '2021-05-18 00:49:27', 0, 0, NULL),
(27, 'pages', '', '2021-04-26 14:07:20', '2021-04-26 16:28:13', 1, 0, NULL),
(28, 'pages', '', '2021-04-26 14:07:54', '2021-04-26 14:07:54', 1, 0, NULL),
(29, 'pages', '', '2021-04-26 14:08:10', '2021-04-26 14:08:10', 1, 0, NULL),
(30, 'pages', '', '2021-04-26 14:08:53', '2021-04-26 14:08:53', 1, 0, NULL),
(31, 'pages', '', '2021-04-26 14:09:23', '2021-04-26 14:09:23', 1, 0, NULL),
(32, 'pages', '', '2021-04-26 14:09:46', '2021-04-26 14:09:46', 1, 0, NULL),
(33, 'pages', '', '2021-04-26 14:10:12', '2021-05-18 00:47:44', 0, 0, NULL),
(34, 'pages', '', '2021-04-26 14:10:29', '2021-04-26 14:10:29', 0, 0, NULL),
(35, 'pages', '', '2021-04-26 16:32:24', '2021-04-26 16:32:24', 0, 0, NULL),
(36, 'pages', '', '2021-04-26 16:33:15', '2021-04-26 16:33:15', 0, 0, NULL),
(37, 'pages', '', '2021-04-26 16:40:10', '2021-04-26 16:40:10', 0, 0, NULL),
(38, 'produits', '', '2021-04-26 18:45:00', '2021-04-26 18:45:00', 0, 0, NULL),
(39, 'produits', '', '2021-04-26 20:59:45', '2021-04-26 20:59:45', 0, 0, NULL),
(40, 'pages', '', '2021-04-29 08:46:53', '2021-04-29 08:46:53', 0, 0, NULL),
(41, 'pages', '', '2021-04-29 08:47:19', '2021-04-29 08:47:19', 0, 0, NULL),
(42, 'pages', '', '2021-04-29 08:47:43', '2021-04-29 08:47:43', 0, 0, NULL),
(43, 'pages', '', '2021-04-29 08:58:25', '2021-04-29 08:58:25', 0, 0, NULL),
(44, 'pages', '', '2021-04-29 08:59:01', '2021-04-29 08:59:01', 0, 0, NULL),
(45, 'pages', '', '2021-04-29 08:59:25', '2021-04-29 08:59:25', 0, 0, NULL),
(46, 'pages', '', '2021-04-29 10:32:24', '2021-04-29 10:32:24', 0, 0, NULL),
(47, 'pages', '', '2021-04-29 10:35:08', '2021-04-29 10:35:08', 0, 0, NULL),
(48, 'pages', '', '2021-04-29 10:36:25', '2021-04-29 10:52:22', 0, 0, NULL),
(50, 'produits', '', '2021-05-07 08:38:38', '2021-05-07 08:38:38', 0, 0, NULL),
(51, 'produits', '', '2021-05-07 08:41:27', '2021-05-07 08:41:27', 0, 0, NULL),
(52, 'produits', '', '2021-05-07 08:49:15', '2021-05-07 08:49:15', 0, 0, NULL),
(53, 'produits', 'Kininim-potsy', '2021-05-07 21:26:03', '2021-05-07 21:28:33', 0, 0, NULL),
(54, 'pages', '', '2021-05-11 11:20:15', '2021-05-11 13:29:28', 0, 0, NULL),
(55, 'pages', '', '2021-05-19 15:35:01', '2021-05-19 15:35:01', 0, 0, NULL),
(56, 'pages', '', '2021-06-07 14:08:02', '2021-06-07 14:10:09', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `na_pages_categories`
--

CREATE TABLE `na_pages_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_page` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_pages_categories`
--

INSERT INTO `na_pages_categories` (`id`, `id_page`, `id_category`) VALUES
(25, 13, 1),
(27, 15, 12),
(33, 16, 13),
(34, 17, 13),
(35, 18, 13),
(36, 19, 13),
(38, 21, 14),
(39, 22, 14),
(40, 23, 14),
(41, 24, 1),
(45, 28, 16),
(46, 29, 16),
(47, 30, 17),
(48, 31, 17),
(49, 32, 17),
(51, 34, 17),
(52, 27, 15),
(53, 35, 16),
(54, 36, 16),
(55, 37, 17),
(56, 20, 13),
(57, 38, 5),
(58, 39, 5),
(60, 40, 19),
(61, 41, 19),
(62, 42, 19),
(63, 43, 20),
(64, 44, 20),
(65, 45, 20),
(66, 46, 21),
(67, 47, 21),
(69, 48, 22),
(73, 50, 24),
(74, 51, 24),
(75, 52, 25),
(78, 53, 31),
(80, 54, 32),
(82, 2, 10),
(84, 4, 11),
(90, 7, 3),
(92, 8, 3),
(99, 9, 3),
(103, 10, 1),
(111, 12, 1),
(112, 11, 1),
(120, 25, 1),
(123, 14, 12),
(131, 33, 15),
(132, 26, 15),
(134, 5, 11),
(135, 6, 11),
(136, 55, 33),
(138, 56, 34);

-- --------------------------------------------------------

--
-- Structure de la table `na_pages_multilingual`
--

CREATE TABLE `na_pages_multilingual` (
  `id` int(11) NOT NULL,
  `id_page` int(11) NOT NULL,
  `id_language` int(11) NOT NULL,
  `title` varchar(765) NOT NULL,
  `text` text,
  `icon` varchar(150) DEFAULT NULL,
  `seo_title` varchar(765) NOT NULL,
  `seo_meta_description` text,
  `seo_meta_keyword` varchar(765) NOT NULL,
  `seo_permalink` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_pages_multilingual`
--

INSERT INTO `na_pages_multilingual` (`id`, `id_page`, `id_language`, `title`, `text`, `icon`, `seo_title`, `seo_meta_description`, `seo_meta_keyword`, `seo_permalink`) VALUES
(3, 2, 1, 'Huilles essentielles de Madagascar', '<p>Nous sommes un producteur des&nbsp;huiles essentielles avec les plantes aromatiques et biologiques de Madagascar.</p>\r\n', NULL, '', '', '', 'huilles-essentielles-de-madagascar'),
(4, 2, 2, 'Ginger essential oil', '<p>The essential oil of fresh ginger is obtained from the distillation of freshly harvested rhizomes.</p>\r\n', NULL, '', '', '', 'ginger-essential-oil'),
(7, 4, 1, 'Nos valeurs essentielles', '<p>La qualit&eacute; de nos produits s&rsquo;appuie sur des contr&ocirc;les rigoureux des plantes.&nbsp;Les huiles essentielles sont produites par entraiment de vapeur d&rsquo;eau.&nbsp;Les huiles essentielles sont analys&eacute;s dans les 2 laboratoires &agrave; Madagascar&nbsp;: Le Laboratoire LCP Nanisana et le Laboratoire Institut Malgache de Recherches Appliqu&eacute;es (IMRA)</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, '', '', '', 'nos-valeurs-essentielles'),
(8, 4, 2, 'Our core values', '', NULL, '', '', '', 'our-core-values'),
(9, 5, 1, 'Les filières', '<p>Nous travaillons avec des coop&eacute;ratives bas&eacute;es dans les r&eacute;gions&nbsp;:</p>\r\n\r\n<ul style="list-style-type:circle;">\r\n	<li>Fianarantsoa, Mahatsiatra Ambony</li>\r\n	<li>Maroantsetra , Analanjorofo</li>\r\n	<li>Nosy Be, Diana</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, '', '', '', 'les-filieres'),
(10, 5, 2, 'Farm', '<p>Nous travaillons avec des coop&eacute;ratives bas&eacute;es dans les r&eacute;gions&nbsp;:</p>\r\n\r\n<ul style="list-style-type: circle;">\r\n	<li>Fianarantsoa, Mahatsiatra Ambony</li>\r\n	<li>Maroantsetra , Analanjorofo</li>\r\n	<li>Nosy Be, Diana</li>\r\n</ul>\r\n', NULL, '', '', '', 'farm'),
(11, 6, 1, 'Notre approche', '<p>Notre d&eacute;marche est &eacute;coresponsable, sociale et solidaire</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, '', '', '', 'notre-approche'),
(12, 6, 2, 'Our approach', '<p>Notre d&eacute;marche est &eacute;coresponsable, sociale et solidaire</p>\r\n', NULL, '', '', '', 'our-approach'),
(13, 7, 1, 'Accord de partenariat RSE Natoraly Aroma Madagascar et Nyara Bio Sénégal', '<p>La&nbsp;signature du Protocole&nbsp;d&rsquo;accord&nbsp;pour&nbsp;la mise en&nbsp;oeuvre&nbsp;d&#39;une&nbsp;Initiative&nbsp;RSE pour le valoriation&nbsp;d&#39;un Alambic&nbsp;&agrave;&nbsp;usage de fabrication d&rsquo;Huiles&nbsp;Essentielles est sign&eacute; par&nbsp;<strong>AIKAUDI Labo (NYARA) et</strong> <strong>Natoraly Aroma</strong> &agrave; Dakar le 18 Novembre 2020.</p>\r\n\r\n<p>Cette coop&eacute;ration permet &agrave; Natoraly Aroma l&#39;acquisiton d&#39;un Alambic de 1500Litres pour pouvoir commencer l&#39;exploitation en D&eacute;cembre 2020, Et Nyara va beneficier en majorit&eacute;&nbsp;les Huiles Essentielles produites par Natoraly Aroma.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, 'Protocole d’accord pour la mise en œuvre d\'une Initiative RSE ', '', '', 'accord-de-partenariat-rse-natoraly-aroma-madagascar-et-nyara-bio-senegal'),
(14, 7, 2, 'Reboisement : un pas vers la reforestation EN', '<p>Avec pr&egrave;s de 90%* d&rsquo;esp&egrave;ces end&eacute;miques, Madagascar poss&egrave;de une biodiversit&eacute; particuli&egrave;re. Or, sur les six derni&egrave;res d&eacute;cennies, presque 50% des for&ecirc;ts naturelles ont disparu*. Ce ph&eacute;nom&egrave;ne de d&eacute;forestation s&rsquo;est accentu&eacute; depuis 2005, mettant en p&eacute;ril une biodiversit&eacute; unique.</p>\r\n', NULL, '', '', '', 'reboisement-un-pas-vers-la-reforestation-en'),
(15, 8, 1, 'Accord de partenariat avec les producteurs d\'Ylang Ylang à Nosibe', '<p>Natoraly Aroma a fait&nbsp;un accord de partenariat avec les cultivateurs et producteurs des Huiles Essentielles d&#39;Ylang Ylang, dans le village de Maromaniry, Nosibe le 20 Novembre 2020.</p>\r\n\r\n<p>Nous avons visit&eacute; les champs de culture des Ylang Ylang &agrave; Nosibe et nous avons assist&eacute; la distillation des fleurs d&#39;Ylang Ylang avec les producteurs. Ils ont la maitrise de cette fili&egrave;re et ils sont pr&ecirc;ts &agrave; nous partager leurs savoir-faire et leurs meilleurs produits.</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, 'Accord de partenariat avec les cultivateurs et producteurs des Huiles Essentielles d\'Ylang Ylang Nosibe', 'Visites', '', 'accord-de-partenariat-avec-les-producteurs-d-ylang-ylang-a-nosibe'),
(16, 8, 2, 'Certification Fair for Life (FFL)', '', NULL, '', '', '', 'certification-fair-for-life-ffl-'),
(17, 9, 1, 'Visite des producteurs des Huiles Essentielles des Girofles et producteurs des Vanilles à Maroantsetra', '<p>L&#39;&eacute;quipe de Natoraly Arma a visit&eacute; les&nbsp;producteurs des Huiles Essentielles des Girofles et producteurs des Vanilles &agrave; Maroantsetra, r&eacute;gion d&#39;Analanjirofo en D&eacute;cembre 2020.</p>\r\n\r\n<p>Nous avons &eacute;tabli&nbsp;les protocoles et les m&eacute;thodes de production,&nbsp;pour optimiser la qualit&eacute; des Huiles Essentielles. Dans un premier temps, nous avons partag&eacute; les bonnes mani&egrave;res et techniques pour am&eacute;liorer amener des corrections &agrave; leur distillation traditionnelle. En Juin 2021, un projet d&rsquo;installation d&rsquo;un alambic performant et am&eacute;lior&eacute; est conclu avec la coop&eacute;rative des producteurs.</p>\r\n\r\n<p>La production des Huiles Essentielles de Niouli sera faite &agrave; Maroantsetra apr&egrave;s l&#39;installation du nouveau Alambic en Juillet 2021.</p>\r\n', NULL, '', '', '', 'visite-des-producteurs-des-huiles-essentielles-des-girofles-et-producteurs-des-vanilles-a-maroantsetra'),
(18, 9, 2, 'Huile essentielle de Giroflier : Campagne 2020', '', NULL, '', '', '', 'huile-essentielle-de-giroflier-campagne-2020'),
(19, 10, 1, 'NATORALY AROMA : Producteur des huiles essentielles avec les plantes aromatiques et biologiques de  Madagascar', '<p>Nous sommes producteur des&nbsp;huiles essentielles avec les plantes aromatiques et biologiques de&nbsp; Madagascar. Nous travaillons avec des producteurs dans les diff&eacute;rentes r&eacute;gions de Madagascar pour avoir les meilleurs qualit&eacute;s des&nbsp;huiles essentielles sp&eacute;cifiques de chaque r&eacute;gion.</p>\r\n', NULL, '', '', '', 'natoraly-aroma-producteur-des-huiles-essentielles-avec-les-plantes-aromatiques-et-biologiques-de-madagascar'),
(20, 10, 2, 'NATORALY AROMA : Producteur D’huiles Essentielles De Madagascar', '', NULL, '', '', '', 'natoraly-aroma-producteur-d-huiles-essentielles-de-madagascar'),
(21, 11, 1, 'MADAGASCAR : Une Biodiversité à couper le souffle', '<p>L&#39;&icirc;le de Madagascar est situ&eacute;e dans l&#39;Oc&eacute;an Indien, &agrave; 400 km &agrave; l&#39;Est des c&ocirc;tes africaines dont elle est s&eacute;par&eacute;e par le canal du Mozambique.</p>\r\n\r\n<p>Madagascar est une v&eacute;ritable terre de biodiversit&eacute; pleine de plantes et de cr&eacute;atures fascinantes. Avec une faune et flore end&eacute;mique et des paysages aussi vari&eacute;s qu&rsquo;exceptionnels, la Grande &icirc;le fait aujourd&rsquo;hui partie des plus grandes destinations &eacute;cotouristiques de choix.</p>\r\n', NULL, '', '', '', 'madagascar-une-biodiversite-a-couper-le-souffle'),
(22, 11, 2, 'Une Origine : MADAGASCAR', '', NULL, '', '', '', 'une-origine-madagascar'),
(23, 12, 1, 'UN CADRE EXCEPTIONNEL POUR DES ESPÈCES UNIQUES', '<p>L&eacute;muriens, tortues, cam&eacute;l&eacute;ons, ou baobabs &ndash; ils sont tous typiques de Madagascar. Environ 5 pour cent des esp&egrave;ces animales et v&eacute;g&eacute;tales du monde vivent sur l&#39;&icirc;le et la plupart d&#39;entre elles y sont end&eacute;miques.</p>\r\n\r\n<p>En d&eacute;pit d&#39;une immense biodiversit&eacute; d&eacute;j&agrave; r&eacute;pertori&eacute;e, de nouvelles esp&egrave;ces sont d&eacute;couvertes chaque ann&eacute;e &agrave; Madagascar. Il y a environ 165 millions d&#39;ann&eacute;es, cette &icirc;le s&#39;est d&eacute;tach&eacute;e de l&#39;Afrique par la d&eacute;rive des continents. Du fait de cet isolement, des esp&egrave;ces qui n&#39;existent nulle part ailleurs s&#39;y sont d&eacute;velopp&eacute;es: 98 pour cent des mammif&egrave;res, 91 pour cent des reptiles et 80 pour cent des plantes qui s&#39;y trouvent sont end&eacute;miques.</p>\r\n', NULL, '', '', '', 'un-cadre-exceptionnel-pour-des-especes-uniques'),
(24, 12, 2, 'Plusieurs Régions Aux Climats Variées', '', NULL, '', '', '', 'plusieurs-regions-aux-climats-variees'),
(25, 13, 1, 'NATORALY AROMA : Une Présence Sur Le Terrain, Au Plus Près Des Producteurs', '<p>Nos produits sont issus des terroirs malgaches et sont le fruit du travail des paysans. Nous avons d&eacute;velopp&eacute; une relation de partenariat durable avec les producteurs.</p>\r\n\r\n<p>Notre r&eacute;seau est compos&eacute; de plusieurs milliers de paysans, organis&eacute;s en associations et coop&eacute;ratives agricoles.</p>\r\n', NULL, '', '', '', 'natoraly-aroma-une-presence-sur-le-terrain-au-plus-pres-des-producteurs'),
(26, 13, 2, 'NATORALY AROMA : Une Présence Sur Le Terrain, Au Plus Près Des Producteurs', '', NULL, '', '', '', 'natoraly-aroma-une-presence-sur-le-terrain-au-plus-pres-des-producteurs'),
(27, 14, 1, 'RAKOTOMAMONJY Diamondra', '<p>La pand&eacute;mie de COVID-19 m&rsquo;a pouss&eacute; &agrave; r&eacute;fl&eacute;chir plus loin sur le question du bien-&ecirc;tre des hommes et la bonne sant&eacute; de notre environnement. Je suis form&eacute; dans le mouvement scoutisme depuis le mon enfance. L&rsquo;attachement et respect de la nature est une culture calqu&eacute;e dans mon esprit. Natoraly Aroma est cr&eacute;&eacute; pour r&eacute;pondre &agrave; cette demande de bien &ecirc;tre des hommes et aussi pour pr&eacute;server la biodiversit&eacute;, lutter contre le changement climatique et r&eacute;duire notre empreinte &eacute;cologique. Nous voulons participer &agrave; construire un avenir dans lequel l&rsquo;humanit&eacute; pourra vivre en harmonie avec la nature.</p>\r\n', NULL, '', '', '', 'rakotomamonjy-diamondra'),
(28, 14, 2, 'Matthieu Richard', '', NULL, '', '', '', 'matthieu-richard'),
(29, 15, 1, 'Mima Randriantsoa-Chateauneuf', '<p>Nous avons toujours voulu une entreprise &agrave; taille humaine. Jacarandas est un &eacute;difice qui se construit en &eacute;quipe. Du plan &agrave; la r&eacute;alisation, chaque personne a sa place pour apporter sa contribution. C&rsquo;est l&rsquo;esprit d&rsquo;&eacute;quipe qui entretient la motivation pour avancer chaque jour un peu plus</p>\r\n', NULL, '', '', '', 'mima-randriantsoa-chateauneuf'),
(30, 15, 2, 'Mima Randriantsoa-Chateauneuf', '', NULL, '', '', '', 'mima-randriantsoa-chateauneuf'),
(31, 16, 1, 'Structurer en associations et coopératives les paysans producteurs', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, '', '', '', 'structurer-en-associations-et-cooperatives-les-paysans-producteurs'),
(32, 16, 2, 'Structurer en associations et coopératives les paysans producteurs', '', NULL, '', '', '', 'structurer-en-associations-et-cooperatives-les-paysans-producteurs'),
(33, 17, 1, 'Former les producteurs à des techniques agricoles respectueuses de l’environnement', '', NULL, '', '', '', 'former-les-producteurs-a-des-techniques-agricoles-respectueuses-de-l-environnement'),
(34, 17, 2, 'Former les producteurs à des techniques agricoles respectueuses de l’environnement', '', NULL, '', '', '', 'former-les-producteurs-a-des-techniques-agricoles-respectueuses-de-l-environnement'),
(35, 18, 1, 'Pérenniser les revenus de nos producteurs-partenaires', '', NULL, '', '', '', 'perenniser-les-revenus-de-nos-producteurs-partenaires'),
(36, 18, 2, 'Pérenniser les revenus de nos producteurs-partenaires', '', NULL, '', '', '', 'perenniser-les-revenus-de-nos-producteurs-partenaires'),
(37, 19, 1, 'Accroître les volumes et améliorer la qualité des productions', '', NULL, '', '', '', 'accroitre-les-volumes-et-ameliorer-la-qualite-des-productions'),
(38, 19, 2, 'Accroître les volumes et améliorer la qualité des productions', '', NULL, '', '', '', 'accroitre-les-volumes-et-ameliorer-la-qualite-des-productions'),
(39, 20, 1, 'Développer et sécuriser nos approvisionnements en matières premières', '', NULL, '', '', '', 'developper-et-securiser-nos-approvisionnements-en-matieres-premieres'),
(40, 20, 2, 'Développer et sécuriser nos approvisionnements en matières premières', '', NULL, '', '', '', 'developper-et-securiser-nos-approvisionnements-en-matieres-premieres'),
(41, 21, 1, 'WILLIAM HALES', '', NULL, '', '', '', 'william-hales'),
(42, 21, 2, 'WILLIAM HALES', '', NULL, '', '', '', 'william-hales'),
(43, 22, 1, 'ARTHUR JOHN', '', NULL, '', '', '', 'arthur-john'),
(44, 22, 2, 'ARTHUR JOHN', '', NULL, '', '', '', 'arthur-john'),
(45, 23, 1, 'ADAM GILCHRIST', '', NULL, '', '', '', 'adam-gilchrist'),
(46, 23, 2, 'ADAM GILCHRIST', '', NULL, '', '', '', 'adam-gilchrist'),
(47, 24, 1, 'Le Siège Sociale D\'Antananarivo', '<p>Les bureaux d&rsquo;Antananarivo regroupent les p&ocirc;les :</p>\r\n\r\n<ul>\r\n	<li>Logistique</li>\r\n	<li>Comptabilit&eacute;</li>\r\n	<li>Services exports</li>\r\n	<li>Recherche &amp; D&eacute;veloppement</li>\r\n</ul>\r\n\r\n<p>Le d&eacute;partement D&eacute;veloppement pr&eacute;pare le futur de JACARANDAS. Il identifie des zones de productions, monte les projets et effectue les certifications jusqu&rsquo;&agrave; ce que la fili&egrave;re soit productive</p>\r\n', NULL, '', '', '', 'le-siege-sociale-d-antananarivo'),
(48, 24, 2, 'Le Siège Sociale D\'Antananarivo', '', NULL, '', '', '', 'le-siege-sociale-d-antananarivo'),
(49, 25, 1, 'Natoraly Aroma, Nos Huiles Essentielles et Produits locaux pour votre bien être', '<p>Natoraly Aroma a commenc&eacute; &agrave; commecialiser les Huiles Essentielles &agrave; Dakar S&eacute;n&eacute;gal, depuis D&eacute;cembre 2020. Plusieurs acteurs en aromath&eacute;raprie et en cosm&eacute;tic font confience &agrave; nos produits.</p>\r\n\r\n<p>Nous travaillons aussi avec des producteurs des Vanilles et de &eacute;pices de Madagascar&nbsp;&agrave; Maroantsetra et aussi avec des producteurs des Huiles V&eacute;g&eacute;tales &agrave; Mananjary,&nbsp;Sud Est de Madagascar.</p>\r\n', NULL, '', '', '', 'natoraly-aroma-nos-huiles-essentielles-et-produits-locaux-pour-votre-bien-etre'),
(50, 25, 2, 'Natoraly Aroma ,Notre Expertise Des Huiles Essentielles De Madagascar À Votre Service', '', NULL, '', '', '', 'natoraly-aroma-notre-expertise-des-huiles-essentielles-de-madagascar-a-votre-service'),
(51, 26, 1, 'Huiles essentielles 100% Bio, Pures et Naturelles.', '<p>Les cultivateurs adoptenet la culture bio ou ils collectent des plantes sauvages pour les mati&egrave;res premi&egrave;res.&nbsp;</p>\r\n\r\n<p>La&nbsp;distillation se fait par&nbsp;vapeur d&#39;eau &agrave; basse pression avec les alambics concus&nbsp;avec des Inox 316L.</p>\r\n\r\n<p>Les produits sont analys&eacute;s dans les laboratoires pour &eacute;valuer ses qualit&eacute;s</p>\r\n', NULL, '', '', '', 'huiles-essentielles-100-bio-pures-et-naturelles.'),
(52, 26, 2, 'Notre engagement sur la qualité de nos matières premières et huiles essentielles 100% pures et naturelles.', '', NULL, '', '', '', 'notre-engagement-sur-la-qualite-de-nos-matieres-premieres-et-huiles-essentielles-100-pures-et-naturelles.'),
(53, 27, 1, 'Des Contrôles Qualité Basés Sur Des Analyses Chimiques Et Organoleptiques:', '<p>ANALYSE CHIMIQUE :</p>\r\n\r\n<ul>\r\n	<li>Analyses C.P.G.</li>\r\n	<li>Densit&eacute;</li>\r\n	<li>Analyses pesticides</li>\r\n</ul>\r\n\r\n<p>TEST OLFACTIF</p>\r\n\r\n<p>Effectu&eacute; par notre NEZ professionnel</p>\r\n\r\n<p>Gr&acirc;ce &agrave; ces diff&eacute;rentes analyses, tous nos proc&eacute;d&eacute;s de fabrication r&eacute;pondent aux normes, HACCP et ISO 22000. Nos huiles essentielles de haute qualit&eacute; sont 100% pures et naturelles*.</p>\r\n', NULL, '', '', '', 'des-controles-qualite-bases-sur-des-analyses-chimiques-et-organoleptiques-'),
(54, 27, 2, 'Des Contrôles Qualité Basés Sur Des Analyses Chimiques Et Organoleptiques:', '', NULL, '', '', '', 'des-controles-qualite-bases-sur-des-analyses-chimiques-et-organoleptiques-'),
(55, 28, 1, 'Phytocontrol', '', NULL, '', '', '', 'phytocontrol'),
(56, 28, 2, 'Phytocontrol', '', NULL, '', '', '', 'phytocontrol'),
(57, 29, 1, 'Primoris', '', NULL, '', '', '', 'primoris'),
(58, 29, 2, 'Primoris', '', NULL, '', '', '', 'primoris'),
(59, 30, 1, 'Composés uniquement d’ ingrédients actifs d’origine végétales, sans adultération de la matière', '<p>Compos&eacute;s uniquement d&rsquo; <strong>ingr&eacute;dients actifs d&rsquo;origine v&eacute;g&eacute;tales</strong>, sans adult&eacute;ration de la mati&egrave;re</p>\r\n', NULL, '', '', '', 'composes-uniquement-d-ingredients-actifs-d-origine-vegetales-sans-adulteration-de-la-matiere'),
(60, 30, 2, 'Composés uniquement d’ ingrédients actifs d’origine végétales, sans adultération de la matière', '', NULL, '', '', '', 'composes-uniquement-d-ingredients-actifs-d-origine-vegetales-sans-adulteration-de-la-matiere'),
(61, 31, 1, 'Récoltés à la source, au plus près de producteurs', '<p>R&eacute;colt&eacute;s &agrave; la source, au <strong>plus pr&egrave;s de producteurs</strong></p>\r\n', NULL, '', '', '', 'recoltes-a-la-source-au-plus-pres-de-producteurs'),
(62, 31, 2, 'Récoltés à la source, au plus près de producteurs', '', NULL, '', '', '', 'recoltes-a-la-source-au-plus-pres-de-producteurs'),
(63, 32, 1, 'Vivent au rythme des récoltes.', '<p>Vivent <strong>au rythme des r&eacute;coltes.</strong></p>\r\n', NULL, '', '', '', 'vivent-au-rythme-des-recoltes.'),
(64, 32, 2, 'Vivent au rythme des récoltes.', '', NULL, '', '', '', 'vivent-au-rythme-des-recoltes.'),
(65, 33, 1, 'Engagements sur l\'environnement', '<p>Les coop&eacute;ratives recoivent les permis d&#39;exploitations pour chaque type de plante aupr&egrave;s de la direction Regionale. Ces derni&egrave;res doivent faire le controle sur place et ils&nbsp;delivrent les conventions de coll&egrave;ctes.</p>\r\n\r\n<p>Le plan de reboisement et le certificat de mise en culure est la garantie de la d&eacute;livrance des ces permis d&#39;exploitations.</p>\r\n', NULL, '', '', '', 'engagements-sur-l-environnement'),
(66, 33, 2, 'Respectueux de l’environnement', '', NULL, '', '', '', 'respectueux-de-l-environnement'),
(67, 34, 1, 'Exempts de colorant, de substance chimique, de matière première d’origine animale.', '<p><strong>Exempts </strong>de colorant, de substance chimique, de mati&egrave;re premi&egrave;re d&rsquo;origine animale.</p>\r\n', NULL, '', '', '', 'exempts-de-colorant-de-substance-chimique-de-matiere-premiere-d-origine-animale.'),
(68, 34, 2, 'Exempts de colorant, de substance chimique, de matière première d’origine animale.', '', NULL, '', '', '', 'exempts-de-colorant-de-substance-chimique-de-matiere-premiere-d-origine-animale.'),
(69, 35, 1, 'Hive', '', NULL, '', '', '', 'hive'),
(70, 35, 2, 'Hive', '', NULL, '', '', '', 'hive'),
(71, 36, 1, 'Event', '', NULL, '', '', '', 'event'),
(72, 36, 2, 'Event', '', NULL, '', '', '', 'event'),
(73, 37, 1, 'Lorem', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>\r\n', NULL, '', '', '', 'lorem'),
(74, 37, 2, 'Lorem', '', NULL, '', '', '', 'lorem'),
(75, 38, 1, 'Intro', '<p><strong>Partie de la plante distill&eacute;e</strong> : Ecorce<br />\r\n<strong>R&eacute;colte </strong>: De F&eacute;vrier &agrave; juin et de Septembre &agrave; D&eacute;cembre<br />\r\n<strong>Densit&eacute; 20/20&deg; </strong>: 1.0420-1.0630<br />\r\n<strong>Couleur </strong>: Jaune clair &agrave; jaune fonc&eacute;<br />\r\n<strong>Odeur </strong>: Poudr&eacute;e, &eacute;pic&eacute;e, notes chaudes et poivr&eacute;es<br />\r\n<strong>Principaux constituants</strong> :&nbsp; Cinnamald&eacute;hyde : 55% &agrave; 80%, Ac&eacute;tate de cinnamyle : 4,2% &agrave; 15,2%, Eug&eacute;nol : 4% &agrave; 10%<br />\r\n<strong>CAS </strong>: 84649-98-9 / 8015-91-6<br />\r\n<strong>EINCS </strong>: 283-479-0<br />\r\n<strong>FEMA </strong>: 2291</p>\r\n\r\n<p>Le rendement de la distillation est de 0.4 &agrave; 0.5%.</p>\r\n', NULL, '', '', '', 'intro'),
(76, 38, 2, 'Intro', '', NULL, '', '', '', 'intro'),
(77, 39, 1, 'Identité de l’huile essentielle de cannelle de Madagascar (écorce)', '<p>Le cannelier est un arbre &agrave; feuilles persistante de la famille des Lauraceae. Son nom botannique est le Cinnamon Zeylanicum. Il est originaire du Sri Lanka, des Seychelles et de Madagascar. Le cannelier pousse naturellement, gr&acirc;ce &agrave; la diss&eacute;mination de ses graines, sur les parcelles des paysans. Cependant il est de plus en plus cultiv&eacute; pour son &eacute;corce.</p>\r\n', NULL, '', '', '', 'identite-de-l-huile-essentielle-de-cannelle-de-madagascar-ecorce-'),
(78, 39, 2, 'Identité de l’huile essentielle de cannelle de Madagascar (écorce)', '', NULL, '', '', '', 'identite-de-l-huile-essentielle-de-cannelle-de-madagascar-ecorce-'),
(79, 40, 1, 'Nous Structurons Des Filières Paysannes Certifiées Biologique.', '<p><strong>En 2019, 17 programmes sont en cours. Ce sont, soit des montages de fili&egrave;res, soit des extensions de projets.</strong></p>\r\n\r\n<p>Chaque projet de fili&egrave;re est diff&eacute;rent, de par la zone g&eacute;ographique, la taille du projet, le nombre de paysans et les produits cultiv&eacute;s.</p>\r\n', NULL, '', '', '', 'nous-structurons-des-filieres-paysannes-certifiees-biologique.'),
(80, 40, 2, 'Nous Structurons Des Filières Paysannes Certifiées Biologique.', '', NULL, '', '', '', 'nous-structurons-des-filieres-paysannes-certifiees-biologique.'),
(81, 41, 1, 'L’Association Tsinjo Aina', '<p><strong>Cette association travaille sur la diversification des cultures et la formation des paysans.</strong></p>\r\n\r\n<p><strong>Son objectif est de procurer des sources de revenus r&eacute;guliers aux villageois</strong></p>\r\n\r\n<p><strong>Partenaire de l&rsquo;association, Jacarandas ach&egrave;te la totalit&eacute; de la production d&rsquo;huile essentielles de Tsinjo Aina.</strong></p>\r\n\r\n<p><strong>Depuis 2015 l&rsquo;association a lanc&eacute; la culture du G&eacute;ranium</strong></p>\r\n\r\n<p>100000 plants de G&eacute;ranium mis en culture et diversification des cultures avec le Ravintsara</p>\r\n\r\n<p>Cinq groupements de paysans (soit une centaine de membres)</p>\r\n\r\n<p>Cr&eacute;ation d&rsquo;un centre de formation agricole &agrave; Kelilalina, dont le but est de :</p>\r\n\r\n<ul>\r\n	<li>professionnaliser les paysans et futurs producteurs</li>\r\n	<li>d&eacute;velopper la culture vivri&egrave;re : maraichage et petit &eacute;levage</li>\r\n	<li>am&eacute;liorer la culture de rente : G&eacute;ranium, Ravintsara</li>\r\n</ul>\r\n', NULL, '', '', '', 'l-association-tsinjo-aina'),
(82, 41, 2, 'L’Association Tsinjo Aina', '', NULL, '', '', '', 'l-association-tsinjo-aina'),
(83, 42, 1, 'Un montage de filières en partenariat avec le GIZ', '<p><strong>Un montage de fili&egrave;res de grande envergure est en cours, sur la c&ocirc;te Est, en partenariat avec le GIZ, dans le cadre du projet DeveloPPP.</strong></p>\r\n\r\n<p>Localis&eacute; sur 3 disctricts &agrave; Vatomandry, Mahanoro et Brickaville</p>\r\n\r\n<p>Plantation</p>\r\n\r\n<ul>\r\n	<li>100 000 pieds de cannelle par an entre 2019 et 2021 : 400 pieds par hectares et 250 hectares par an</li>\r\n	<li>50 tonnes de semences de curcuma en 2019</li>\r\n	<li>40 tonnes de semences de gingembre en 2019</li>\r\n</ul>\r\n\r\n<p>Environ 500 paysans, membres de ces coop&eacute;ratives en 2019.</p>\r\n', NULL, '', '', '', 'un-montage-de-filieres-en-partenariat-avec-le-giz'),
(84, 42, 2, 'Un montage de filières en partenariat avec le GIZ', '', NULL, '', '', '', 'un-montage-de-filieres-en-partenariat-avec-le-giz'),
(85, 43, 1, 'Protection de l\'environnement', '<p>Dolore egua fugiat nulla pariatur sint occaecat cupidatat non proident tempor officia deserunt mollit anim laboum.</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, '', '', '', 'protection-de-l-environnement'),
(86, 43, 2, 'Protection de l\'environnement', '', NULL, '', '', '', 'protection-de-l-environnement'),
(87, 44, 1, 'Respect des êtres humains', '<p>Dolore egua fugiat nulla pariatur sint occaecat cupidatat non proident tempor officia deserunt mollit anim laboum</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, '', '', '', 'respect-des-etres-humains'),
(88, 44, 2, 'Respect des êtres humains', '', NULL, '', '', '', 'respect-des-etres-humains'),
(89, 45, 1, 'Modes de production responsables', '<p>Dolore egua fugiat nulla pariatur sint occaecat cupidatat non proident tempor officia deserunt mollit anim laboum</p>\r\n\r\n<p>&nbsp;</p>\r\n', NULL, '', '', '', 'modes-de-production-responsables'),
(90, 45, 2, 'Modes de production responsables', '', NULL, '', '', '', 'modes-de-production-responsables'),
(91, 46, 1, 'Un Engagement Social Et Concret', '<p>Au sein de Jacarandas, les salari&eacute;s b&eacute;n&eacute;ficient :</p>\r\n\r\n<ul>\r\n	<li>D&rsquo;une protection sociale compl&eacute;mentaire</li>\r\n	<li>De formations professionnelles propos&eacute;es aux employ&eacute;s tous les ans</li>\r\n	<li>D&rsquo;une &eacute;volution interne rapide, port&eacute;e par le fort d&eacute;veloppement de l&rsquo;entreprise</li>\r\n	<li>De l&rsquo;application des normes internationales H.S.E. au sein de notre entreprise.</li>\r\n</ul>\r\n\r\n<p>Le bien-&ecirc;tre au travail est une de nos priorit&eacute;s, le turnover est tr&egrave;s faible.</p>\r\n', NULL, '', '', '', 'un-engagement-social-et-concret'),
(92, 46, 2, 'Un Engagement Social Et Concret', '', NULL, '', '', '', 'un-engagement-social-et-concret'),
(93, 47, 1, 'Au sein de nos filières paysannes', '<ul>\r\n	<li>Accompagnement technique et financier dans l&rsquo;organisation des coop&eacute;ratives</li>\r\n	<li>Formations sp&eacute;cifiques des membres de nos fili&egrave;res, par nos &eacute;quipes</li>\r\n	<li>Accroissement des revenus via la certification biologique</li>\r\n	<li>Am&eacute;lioration de la s&eacute;curit&eacute; alimentaire par la mise en place de cultures de contre-saison.</li>\r\n</ul>\r\n', NULL, '', '', '', 'au-sein-de-nos-filieres-paysannes'),
(94, 47, 2, 'Au sein de nos filières paysannes', '', NULL, '', '', '', 'au-sein-de-nos-filieres-paysannes'),
(95, 48, 1, 'Utilisation de chaudière à biomasse', '<p>Utilisation de <strong>chaudi&egrave;re &agrave; biomasse</strong> pour nos alambics et ceux de nos fournisseurs partenaires, aliment&eacute;es par des combustibles recycl&eacute;s, plus &eacute;cologiques que le bois :</p>\r\n\r\n<ul>\r\n	<li>Les bambous utilis&eacute;s par les paysans pour construire des radeaux temporaires</li>\r\n	<li>Des r&eacute;sidus de mati&egrave;res premi&egrave;res apr&egrave;s distillation (le girofle, la cannelle ou les feuilles de Niaouli qui br&ucirc;lent tr&egrave;s bien apr&egrave;s s&eacute;chage)</li>\r\n	<li>Des r&eacute;sidus de mati&egrave;res v&eacute;g&eacute;tales issues des entreprises environnantesNotre d&eacute;partement R&amp;D travaille en continu pour am&eacute;liorer l&rsquo;efficacit&eacute; &eacute;nerg&eacute;tique de nos installations.</li>\r\n</ul>\r\n', NULL, '', '', '', 'utilisation-de-chaudiere-a-biomasse'),
(96, 48, 2, 'Utilisation de chaudière à biomasse', '', NULL, '', '', '', 'utilisation-de-chaudiere-a-biomasse'),
(99, 50, 1, 'Intro', '<p>L&rsquo;amande douce provient de l&rsquo;amandou qui n&rsquo;est autre que le fruit de l&rsquo;amandier. Riche en vitamine A et E, cette huile poss&egrave;de de tr&egrave;s nombreuses propri&eacute;t&eacute;s:&nbsp; adoucissantes, nourrissantes, fortifiantes, apaisantes et tonifiantes. Elle renforce les cheveux secs et les hydrate, les cheveux s&rsquo;en trouvent ainsi renforc&eacute;s. Elle est &eacute;galement id&eacute;ale pour les peaux s&egrave;che, sensible et normale. &Agrave; &eacute;viter sur les peaux grasses.<br />\r\nParmi les huiles les plus utilis&eacute;es, celle d&rsquo;amande douce est pr&eacute;sente dans la plupart des produits cosm&eacute;tiques : cr&egrave;me, shampoing, lessive. Encore faut-il bien la choisir ! Pr&eacute;f&eacute;rez une huile d&rsquo;amande douce bio qui co&ucirc;te peu ch&egrave;re et disponible dans les pharmacies, parapharmacies et magasins bio.</p>\r\n', NULL, '', '', '', 'intro'),
(100, 50, 2, 'Intro', '', NULL, '', '', '', 'intro'),
(101, 51, 1, 'Astuce beauté : Masque de cheveux à l’amande douce', '<ul>\r\n	<li>&nbsp;M&eacute;langez 4 cuill&egrave;res &agrave; soupe d&rsquo;huile v&eacute;g&eacute;tale d&rsquo;amande douce, un jaune d&rsquo;oeuf, une cuill&egrave;re de miel&nbsp; et du jus de citron.</li>\r\n	<li>Ajoutez du vinaigre de cidre jusqu&rsquo;&agrave; obtenir la consistance d&eacute;sir&eacute;e.</li>\r\n	<li>Appliquez sur cheveux secs ou humides pendant une quinzaine de minutes avant de les laver avec un shampooing doux.</li>\r\n</ul>\r\n', NULL, '', '', '', 'astuce-beaute-masque-de-cheveux-a-l-amande-douce'),
(102, 51, 2, 'Astuce beauté : Masque de cheveux à l’amande douce', '', NULL, '', '', '', 'astuce-beaute-masque-de-cheveux-a-l-amande-douce'),
(103, 52, 1, 'Intro', '<p>R&eacute;put&eacute;e et appr&eacute;ci&eacute;e pour ses multiples bienfaits (nourrissante, r&eacute;g&eacute;n&eacute;rante, sublimante, antibact&eacute;rienne et antimicrobienne),&nbsp; l&rsquo;huile de noix de coco a un usage tr&egrave;s vari&eacute; ! Elle s&rsquo;utilise aussi bien sur la peau, les ongles, les l&egrave;vres, les dents (en bain de bouche), sur les cheveux qu&rsquo;en cuisine. Elle contient de la vitamine A et E ainsi que de puissants antioxydants qui luttent contre les radicaux libres. La vitamine A am&eacute;liore &eacute;galement le renouvellement cellulaire tandis que la vitamine E permet de ralentir le vieillissement cutan&eacute; et stimule la circulation.</p>\r\n\r\n<p>Cette huile est &eacute;galement riche en vitamine K utilis&eacute;e en cosm&eacute;tique en cas de varices et varicosit&eacute;s ou pour att&eacute;nuer les cernes. L&rsquo;acide laurique qu&rsquo;elle renferme est r&eacute;put&eacute; pour ses vertus antimicrobiennes et est tr&egrave;s efficace pour prendre soin de la peau et des cheveux.<br />\r\nL&rsquo;huile de coco pr&eacute;vient &eacute;galement les vergetures pendant la grossesse.</p>\r\n', NULL, '', '', '', 'intro'),
(104, 52, 2, 'Intro', '', NULL, '', '', '', 'intro'),
(105, 53, 1, 'Kininim-potsy', '<p>Details kininim-potsy</p>\r\n', NULL, '', '', '', 'kininim-potsy'),
(106, 53, 2, 'Kininim-potsy', '', NULL, '', '', '', 'kininim-potsy'),
(107, 54, 1, 'Mentions légales', '<p>116, avenue du pr&eacute;sident Kennedy 75220 Paris cedex 16<br />\r\nStandard de Radio France : 01 56 40 22 22<br />\r\n&Eacute;crire &agrave; la m&eacute;diatrice : &eacute;crire &agrave; la m&eacute;diatrice de Radio France</p>\r\n\r\n<p><strong>Informations Editeur</strong></p>\r\n\r\n<p>Soci&eacute;t&eacute; Nationale de Radiodiffusion Radio France, soci&eacute;t&eacute; nationale de programme au capital de 74 260 056 euros, immatricul&eacute;e au R.C.S. de Paris sous le n&deg; B 326 094 471. Si&egrave;ge social : 116, avenue du pr&eacute;sident Kennedy, 75220 Paris Cedex 16.&nbsp;</p>\r\n\r\n<p>Directrice de la publication : Sibyle Veil, Pr&eacute;sidente-Directrice g&eacute;n&eacute;rale de Radio France</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Droit de reproduction</strong></p>\r\n\r\n<p>&quot;Tous droits de reproduction et de repr&eacute;sentation r&eacute;serv&eacute;s. &copy; 2009 Radio France Toutes les informations reproduites dans ce site (sons, photos, logos Radio France) sont prot&eacute;g&eacute;es par des droits de propri&eacute;t&eacute; intellectuelle d&eacute;tenus par Radio France. Par cons&eacute;quent, aucune de ces informations ne peut &ecirc;tre reproduite, modifi&eacute;e, rediffus&eacute;e, traduite, exploit&eacute;e commercialement ou r&eacute;utilis&eacute;e de quelque mani&egrave;re que ce soit sans l&#39;accord pr&eacute;alable &eacute;crit de Radio France.&quot;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Responsabilit&eacute;</strong></p>\r\n\r\n<p>Radio France d&eacute;cline toute responsabilit&eacute; quant au contenu des sites propos&eacute;s en liens.</p>\r\n', NULL, '', '', '', 'mentions-legales'),
(108, 54, 2, 'Mentions légales', '', NULL, '', '', '', 'mentions-legales'),
(109, 55, 1, 'Plan du site', '', NULL, '', '', '', 'plan-du-site'),
(110, 55, 2, 'Sitemap', '', NULL, '', '', '', 'sitemap'),
(111, 56, 1, 'Notre histoire', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', NULL, '', '', '', 'notre-histoire'),
(112, 56, 2, 'Our history', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', NULL, '', '', '', 'our-history');

-- --------------------------------------------------------

--
-- Structure de la table `na_products_lots`
--

CREATE TABLE `na_products_lots` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `filename` varchar(150) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `create_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_products_lots`
--

INSERT INTO `na_products_lots` (`id`, `id_product`, `filename`, `title`, `create_time`) VALUES
(2, 5, '6098d61a97086-source.pdf', 'Lot du 10 Mai 2021 à 09:52', '2021-05-10 09:43:38'),
(3, 5, '6098d6ef6246c-source.pdf', 'Lot du 11 Mai 2022', '2021-05-10 09:47:11'),
(4, 25, '609a5e7f3e4f7-source.pdf', '1 - Copie', '2021-05-11 13:37:51');

-- --------------------------------------------------------

--
-- Structure de la table `na_produits_phares`
--

CREATE TABLE `na_produits_phares` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_category` int(11) NOT NULL,
  `archive` tinyint(1) DEFAULT '1',
  `id_logo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_produits_phares`
--

INSERT INTO `na_produits_phares` (`id`, `id_category`, `archive`, `id_logo`) VALUES
(1, 2, 1, NULL),
(2, 4, 0, 53),
(3, 5, 0, 52),
(4, 6, 1, NULL),
(5, 18, 1, NULL),
(6, 24, 0, NULL),
(7, 25, 0, NULL),
(8, 26, 0, NULL),
(9, 27, 0, NULL),
(10, 28, 0, NULL),
(11, 29, 0, NULL),
(12, 31, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `na_seo`
--

CREATE TABLE `na_seo` (
  `id` int(11) UNSIGNED NOT NULL,
  `page` varchar(150) NOT NULL,
  `page_notes` varchar(300) DEFAULT NULL,
  `module` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_seo`
--

INSERT INTO `na_seo` (`id`, `page`, `page_notes`, `module`) VALUES
(1, 'index', '/', NULL),
(2, 'pages_about', '/qui-sommes-nous', NULL),
(3, 'pages_quality', '/nos-valeurs-essentielles', NULL),
(4, 'pages_farm', '/les-filieres', NULL),
(5, 'pages_approach', '/notre-approche', NULL),
(6, 'products_index', '/produits/huiles-essentielles', NULL),
(7, 'products_fiche', '/produits/huiles-essentielles/cannelle', NULL),
(8, 'news_index', '/actualites', NULL),
(9, 'contact', '/contact', NULL),
(10, 'news_fiche', '/actualites/reboisement-un-pas-vers-la-reforestation-fr', NULL),
(11, 'products_all', '/nos-produits', NULL),
(12, 'pages_legalnotice', '/mentions-legales', NULL),
(13, 'pages_sitemap', '/plan-du-site', NULL),
(14, 'pages_history', '/notre-histoire', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `na_seo_multilingual`
--

CREATE TABLE `na_seo_multilingual` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_seo` int(11) UNSIGNED NOT NULL,
  `id_language` int(11) NOT NULL,
  `seo_title` varchar(765) DEFAULT NULL,
  `seo_meta_description` text,
  `seo_meta_keyword` text,
  `seo_h1` text,
  `seo_h2` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_seo_multilingual`
--

INSERT INTO `na_seo_multilingual` (`id`, `id_seo`, `id_language`, `seo_title`, `seo_meta_description`, `seo_meta_keyword`, `seo_h1`, `seo_h2`) VALUES
(1, 1, 1, '#site_name# - Huilles essentielles de Madagascar', 'Producteur et distillateur de matières premières aromatiques, et huiles essentielles d’origine Madagascar, biologiques et conventionnelles.', '', '', ''),
(2, 1, 2, '#site_name# - Huilles essentielles de Madagascar', 'Producteur et distillateur de matières premières aromatiques, et huiles essentielles d’origine Madagascar, biologiques et conventionnelles.', '', '', ''),
(3, 2, 1, 'Qui sommes-nous | #site_name#', '', '', '', ''),
(4, 2, 2, 'Who we are | #site_name#', '', '', '', ''),
(5, 3, 1, 'Nos valeurs essentielles | #site_name#', '', '', '', ''),
(6, 3, 2, 'Nos valeurs essentielles | #site_name#', '', '', '', ''),
(7, 4, 1, 'Les filières | #site_name#', '', '', '', ''),
(8, 4, 2, 'Les filières | #site_name#', '', '', '', ''),
(9, 5, 1, 'Notre approche | #site_name#', '', '', '', ''),
(10, 5, 2, 'Notre approche | #site_name#', '', '', '', ''),
(11, 6, 1, 'Nos produits | #category_permalink# | #site_name# ', '', '', '', ''),
(12, 6, 2, 'Nos produits | #category_permalink# | #site_name# ', '', '', '', ''),
(13, 7, 1, '#permalink# | #site_name#', '', '', '', ''),
(14, 7, 2, '#permalink# | #site_name#', '', '', '', ''),
(15, 8, 1, 'Actualités | #site_name#', '', '', '', ''),
(16, 8, 2, 'Actualités | #site_name#', '', '', '', ''),
(17, 9, 1, 'Nous contacter | #site_name#', '', '', '', ''),
(18, 9, 2, 'Contact us | #site_name#', '', '', '', ''),
(19, 10, 1, '#permalink# | #site_name#', '', '', '', ''),
(20, 10, 2, '#permalink# | #site_name#', '', '', '', ''),
(21, 11, 1, 'Nos produits | #site_name#', '', '', '', ''),
(22, 11, 2, 'Our products | #site_name#', '', '', '', ''),
(23, 12, 1, 'Mentions légales | #site_name#', '', '', '', ''),
(24, 12, 2, 'Legal notice | #site_name#', '', '', '', ''),
(25, 13, 1, 'Plan du site | #site_name#', '', '', '', ''),
(26, 13, 2, 'Sitemap | #site_name#', '', '', '', ''),
(27, 14, 1, 'Notre histoire | #site_name#', '', '', '', ''),
(28, 14, 2, '', '', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `na_template`
--

CREATE TABLE `na_template` (
  `id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `na_template`
--

INSERT INTO `na_template` (`id`, `create_time`, `update_time`) VALUES
(1, '2018-10-04 10:34:06', '2021-05-10 21:57:29');

-- --------------------------------------------------------

--
-- Structure de la table `na_template_multilingual`
--

CREATE TABLE `na_template_multilingual` (
  `id` int(11) NOT NULL,
  `id_template` int(11) NOT NULL,
  `id_language` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `na_template_multilingual`
--

INSERT INTO `na_template_multilingual` (`id`, `id_template`, `id_language`, `text`) VALUES
(1, 1, 1, '<p>Bienvenue sur NATORALY AROMA</p>\r\n'),
(2, 1, 2, '<p>Welcome to&nbsp;NATORALY AROMA</p>\r\n');

-- --------------------------------------------------------

--
-- Structure de la table `na_translations`
--

CREATE TABLE `na_translations` (
  `id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_translations`
--

INSERT INTO `na_translations` (`id`, `create_time`, `update_time`) VALUES
(1, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(2, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(3, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(4, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(5, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(6, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(7, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(8, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(9, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(10, '2021-04-20 20:47:06', '2021-05-07 21:39:44'),
(11, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(12, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(13, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(14, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(15, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(16, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(17, '2021-04-20 20:47:06', '2021-04-20 20:47:06'),
(18, '2021-04-20 20:47:07', '2021-04-20 20:47:07'),
(19, '2021-04-20 20:47:07', '2021-04-20 20:47:07'),
(20, '2021-04-20 20:47:07', '2021-04-20 20:47:07'),
(21, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(22, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(23, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(24, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(25, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(26, '2021-04-26 20:54:37', '2021-04-26 20:55:14'),
(27, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(28, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(29, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(30, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(31, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(32, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(33, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(34, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(35, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(36, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(37, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(38, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(39, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(40, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(41, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(42, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(43, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(44, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(45, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(46, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(47, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(48, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(49, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(50, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(51, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(52, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(53, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(54, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(55, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(56, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(57, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(58, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(59, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(60, '2021-04-26 20:54:37', '2021-04-26 20:54:37'),
(61, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(62, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(63, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(64, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(65, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(66, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(67, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(68, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(69, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(70, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(71, '2021-05-06 15:58:42', '2021-05-06 15:58:42'),
(72, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(73, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(74, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(75, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(76, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(77, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(78, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(79, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(80, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(81, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(82, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(83, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(84, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(85, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(86, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(87, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(88, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(89, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(90, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(91, '2021-05-21 09:23:33', '2021-05-21 09:23:33'),
(92, '2021-05-21 09:23:34', '2021-05-21 09:23:34'),
(93, '2021-05-21 09:23:34', '2021-05-21 09:23:34'),
(94, '2021-05-21 09:23:34', '2021-05-21 09:23:34'),
(95, '2021-05-21 09:23:34', '2021-05-21 09:23:34'),
(96, '2021-05-21 09:23:34', '2021-05-21 09:23:34');

-- --------------------------------------------------------

--
-- Structure de la table `na_translations_multilingual`
--

CREATE TABLE `na_translations_multilingual` (
  `id` int(11) NOT NULL,
  `id_translation` int(11) NOT NULL,
  `id_language` int(11) NOT NULL,
  `language_abbreviation` enum('en','fr') NOT NULL,
  `key` text,
  `value` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_translations_multilingual`
--

INSERT INTO `na_translations_multilingual` (`id`, `id_translation`, `id_language`, `language_abbreviation`, `key`, `value`) VALUES
(1, 1, 1, 'fr', 'le champ nom est obligatoire', 'le champ nom est obligatoire'),
(2, 1, 2, 'en', 'le champ nom est obligatoire', 'the name field is required'),
(3, 2, 1, 'fr', 'le champ email est obligatoire', 'le champ email est obligatoire'),
(4, 2, 2, 'en', 'le champ email est obligatoire', 'the email field is required'),
(5, 3, 1, 'fr', 'le champ objet est obligatoire', 'le champ objet est obligatoire'),
(6, 3, 2, 'en', 'le champ objet est obligatoire', 'the subject field is mandatory'),
(7, 4, 1, 'fr', 'veuillez laisser un message', 'veuillez laisser un message'),
(8, 4, 2, 'en', 'veuillez laisser un message', 'please leave a message'),
(9, 5, 1, 'fr', 'Site en cours de maintenance', 'Site en cours de maintenance'),
(10, 5, 2, 'en', 'Site en cours de maintenance', 'Site under maintenance'),
(11, 6, 1, 'fr', 'Bonjour', 'Bonjour'),
(12, 6, 2, 'en', 'Bonjour', 'Hello'),
(13, 7, 1, 'fr', 'Liens utiles', 'Liens utiles'),
(14, 7, 2, 'en', 'Liens utiles', 'Useful links'),
(15, 8, 1, 'fr', 'Dernières actualités', 'Dernières actualités'),
(16, 8, 2, 'en', 'Dernières actualités', 'last news'),
(17, 9, 1, 'fr', 'Contact', 'Contact'),
(18, 9, 2, 'en', 'Contact', 'Contact'),
(19, 10, 1, 'fr', 'Tous droits réservés', 'Tous droits réservés'),
(20, 10, 2, 'en', 'Tous droits réservés', 'All rights reserved'),
(21, 11, 1, 'fr', 'Nous nous excusons pour le désagrément occasionné, mais nous effectuons des travaux de maintenance. Vous pouvez toujours nous contacter à #company_email#. Nous serons de retour bientôt!', 'Nous nous excusons pour le désagrément occasionné, mais nous effectuons des travaux de maintenance. Vous pouvez toujours nous contacter à #company_email#. Nous serons de retour bientôt!'),
(22, 11, 2, 'en', 'Nous nous excusons pour le désagrément occasionné, mais nous effectuons des travaux de maintenance. Vous pouvez toujours nous contacter à #company_email#. Nous serons de retour bientôt!', 'We apologize for the inconvenience caused, but we are performing maintenance work. You can always contact us at # company_email #. We will be back soon!'),
(23, 12, 1, 'fr', 'Oops! Page non trouvée', 'Oops! Page non trouvée'),
(24, 12, 2, 'en', 'Oops! Page non trouvée', 'Oops! Page not found'),
(25, 13, 1, 'fr', 'La page que vous recherchez est introuvable', 'La page que vous recherchez est introuvable'),
(26, 13, 2, 'en', 'La page que vous recherchez est introuvable', 'The page you are looking for could not be found'),
(27, 14, 1, 'fr', 'Page d\'accueil', 'Page d\'accueil'),
(28, 14, 2, 'en', 'Page d\'accueil', 'Home page'),
(29, 15, 1, 'fr', 'Nom', 'Nom'),
(30, 15, 2, 'en', 'Nom', 'Last name'),
(31, 16, 1, 'fr', 'Adresse mail', 'Adresse mail'),
(32, 16, 2, 'en', 'Adresse mail', 'Mail address'),
(33, 17, 1, 'fr', 'Objet', 'Objet'),
(34, 17, 2, 'en', 'Objet', 'Object'),
(35, 18, 1, 'fr', 'Message', 'Message'),
(36, 18, 2, 'en', 'Message', 'Message'),
(37, 19, 1, 'fr', 'Envoyer', 'Envoyer'),
(38, 19, 2, 'en', 'Envoyer', 'To send'),
(39, 20, 1, 'fr', 'Pour confirmer votre inscription suur #site_name#, veuillez cliquer sur ce #link#', 'Pour confirmer votre inscription suur #site_name#, veuillez cliquer sur ce #link#'),
(40, 20, 2, 'en', 'Pour confirmer votre inscription suur #site_name#, veuillez cliquer sur ce #link#', 'To confirm your registration on # site_name #, please click on this # link #'),
(41, 21, 1, 'fr', 'Nouveau message', 'Nouveau message'),
(42, 21, 2, 'en', 'Nouveau message', 'New message'),
(43, 22, 1, 'fr', 'Votre message a été envoyé', 'Votre message a été envoyé'),
(44, 22, 2, 'en', 'Votre message a été envoyé', 'Your message has been sent'),
(45, 23, 1, 'fr', 'Une erreur s\'est produite, veuillez réessayer ultérieurement', 'Une erreur s\'est produite, veuillez réessayer ultérieurement'),
(46, 23, 2, 'en', 'Une erreur s\'est produite, veuillez réessayer ultérieurement', 'An error has occurred, please try again later'),
(47, 24, 1, 'fr', 'Présentation', 'Présentation'),
(48, 24, 2, 'en', 'Présentation', 'Presentation'),
(49, 25, 1, 'fr', 'Huiles essentielles', 'Huiles essentielles'),
(50, 25, 2, 'en', 'Huiles essentielles', 'Essential oils'),
(51, 26, 1, 'fr', 'Actualités', 'Actualités'),
(52, 26, 2, 'en', 'Actualités', 'News'),
(53, 27, 1, 'fr', 'Formulaire de contact', 'Formulaire de contact'),
(54, 27, 2, 'en', 'Formulaire de contact', 'Contact form'),
(55, 28, 1, 'fr', 'Qui sommes-nous', 'Qui sommes-nous'),
(56, 28, 2, 'en', 'Qui sommes-nous', 'Who are we'),
(57, 29, 1, 'fr', 'Toutes nos huiles essentielles', 'Toutes nos huiles essentielles'),
(58, 29, 2, 'en', 'Toutes nos huiles essentielles', 'All our essential oils'),
(59, 30, 1, 'fr', 'Partager cet article', 'Partager cet article'),
(60, 30, 2, 'en', 'Partager cet article', 'Share this article'),
(61, 31, 1, 'fr', 'Publié le : #date_publication# ', 'Publié le : #date_publication# '),
(62, 31, 2, 'en', 'Publié le : #date_publication# ', 'Published on: # date_publication #'),
(63, 32, 1, 'fr', 'Voir plus', 'Voir plus'),
(64, 32, 2, 'en', 'Voir plus', 'See more'),
(65, 33, 1, 'fr', 'Actualités similaires', 'Actualités similaires'),
(66, 33, 2, 'en', 'Actualités similaires', 'Similar news'),
(67, 34, 1, 'fr', 'Nos huiles essentielles', 'Nos huiles essentielles'),
(68, 34, 2, 'en', 'Nos huiles essentielles', 'Our essential oils'),
(69, 35, 1, 'fr', 'Notre gamme', 'Notre gamme'),
(70, 35, 2, 'en', 'Notre gamme', 'Our range'),
(71, 36, 1, 'fr', 'Qui sommes-nous ?', 'Qui sommes-nous ?'),
(72, 36, 2, 'en', 'Qui sommes-nous ?', 'Who are we ?'),
(73, 37, 1, 'fr', 'Notre approche', 'Notre approche'),
(74, 37, 2, 'en', 'Notre approche', 'Our approach'),
(75, 38, 1, 'fr', 'Filières paysannes', 'Filières paysannes'),
(76, 38, 2, 'en', 'Filières paysannes', 'Farmer sectors'),
(77, 39, 1, 'fr', 'Qualité', 'Qualité'),
(78, 39, 2, 'en', 'Qualité', 'Quality'),
(79, 40, 1, 'fr', 'Nos partenaires', 'Nos partenaires'),
(80, 40, 2, 'en', 'Nos partenaires', 'Our partners'),
(81, 41, 1, 'fr', 'Nos produits sont  Purs et Naturels', 'Nos produits sont  Purs et Naturels'),
(82, 41, 2, 'en', 'Nos produits sont  Purs et Naturels', 'Our products are Pure and Natural'),
(83, 42, 1, 'fr', 'c\'est à dire', 'c\'est à dire'),
(84, 42, 2, 'en', 'c\'est à dire', 'that is to say'),
(85, 43, 1, 'fr', 'Les objectifs de nos partenaires', 'Les objectifs de nos partenaires'),
(86, 43, 2, 'en', 'Les objectifs de nos partenaires', 'The objectives of our partners'),
(87, 44, 1, 'fr', 'Nos équipes', 'Nos équipes'),
(88, 44, 2, 'en', 'Nos équipes', 'Our teams'),
(89, 45, 1, 'fr', 'Les mots du fondateur', 'Les mots du fondateur'),
(90, 45, 2, 'en', 'Les mots du fondateur', 'The words of the founder'),
(91, 46, 1, 'fr', 'Huiles essentielles de Madagascar', 'Huiles essentielles de Madagascar'),
(92, 46, 2, 'en', 'Huiles essentielles de Madagascar', 'Essential oils from Madagascar'),
(93, 47, 1, 'fr', 'Découvrez notre équipe', 'Découvrez notre équipe'),
(94, 47, 2, 'en', 'Découvrez notre équipe', 'Discover our team'),
(95, 48, 1, 'fr', 'Nos produits phares', 'Nos produits phares'),
(96, 48, 2, 'en', 'Nos produits phares', 'Our flagship products'),
(97, 49, 1, 'fr', 'Voir plus de détails', 'Voir plus de détails'),
(98, 49, 2, 'en', 'Voir plus de détails', 'See more details'),
(99, 50, 1, 'fr', 'Huilles essentielles de Madagascar', 'Huilles essentielles de Madagascar'),
(100, 50, 2, 'en', 'Huilles essentielles de Madagascar', 'Essential oils from Madagascar'),
(101, 51, 1, 'fr', 'Nous sommes producteur et distillateur de matières premières aromatiques, et huiles essentielles d’origine Madagascar, biologiques et conventionnelles.', 'Nous sommes producteur et distillateur de matières premières aromatiques, et huiles essentielles d’origine Madagascar, biologiques et conventionnelles.'),
(102, 51, 2, 'en', 'Nous sommes producteur et distillateur de matières premières aromatiques, et huiles essentielles d’origine Madagascar, biologiques et conventionnelles.', 'We are producer and distiller of aromatic raw materials and essential oils of Madagascar origin, organic and conventional.'),
(103, 52, 1, 'fr', 'Lire la suite', 'Lire la suite'),
(104, 52, 2, 'en', 'Lire la suite', 'Read more'),
(105, 53, 1, 'fr', 'Lire plus', 'Lire plus'),
(106, 53, 2, 'en', 'Lire plus', 'Read more'),
(107, 54, 1, 'fr', 'Adresse email', 'Adresse email'),
(108, 54, 2, 'en', 'Adresse email', 'E-mail adress'),
(109, 55, 1, 'fr', 'Accueil', 'Accueil'),
(110, 55, 2, 'en', 'Accueil', 'Home'),
(111, 56, 1, 'fr', 'Vous êtes curieux, vous souhaitez avoir plus d’informations sur notre société et nos épices, nous vous invitons à nous contacter par #email#, par #phone#, ou via ce #form#. Nous ne manquerons pas de vous répondre dans les plus brefs délais.', 'Vous êtes curieux, vous souhaitez avoir plus d’informations sur notre société et nos épices, nous vous invitons à nous contacter par #email#, par #phone#, ou via ce #form#. Nous ne manquerons pas de vous répondre dans les plus brefs délais.'),
(112, 56, 2, 'en', 'Vous êtes curieux, vous souhaitez avoir plus d’informations sur notre société et nos épices, nous vous invitons à nous contacter par #email#, par #phone#, ou via ce #form#. Nous ne manquerons pas de vous répondre dans les plus brefs délais.', 'If you are curious, you would like more information about our company and our spices, we invite you to contact us by # email #, by # phone #, or via this # form #. We will be sure to get back to you as soon as possible.'),
(113, 57, 1, 'fr', 'email', 'email'),
(114, 57, 2, 'en', 'email', 'E-mail'),
(115, 58, 1, 'fr', 'téléphone', 'téléphone'),
(116, 58, 2, 'en', 'téléphone', 'phone'),
(117, 59, 1, 'fr', 'Prenez contact avec nous', 'Prenez contact avec nous'),
(118, 59, 2, 'en', 'Prenez contact avec nous', 'Contact us'),
(119, 60, 1, 'fr', 'Adresse', 'Adresse'),
(120, 60, 2, 'en', 'Adresse', 'Address'),
(121, 61, 1, 'fr', 'veuillez laisser un commentaire', 'veuillez laisser un commentaire'),
(122, 61, 2, 'en', 'veuillez laisser un commentaire', 'please leave a comment'),
(123, 62, 1, 'fr', 'Veuillez cocher la case captcha', 'Veuillez cocher la case captcha'),
(124, 62, 2, 'en', 'Veuillez cocher la case captcha', 'Please check the captcha box'),
(125, 63, 1, 'fr', 'Votre commentaire a été envoyé et en attente d\'approbation par l\'administrateur.', 'Votre commentaire a été envoyé et en attente d\'approbation par l\'administrateur.'),
(126, 63, 2, 'en', 'Votre commentaire a été envoyé et en attente d\'approbation par l\'administrateur.', 'Your comment has been sent and pending administrator approval.'),
(127, 64, 1, 'fr', 'Nos produits', 'Nos produits'),
(128, 64, 2, 'en', 'Nos produits', 'Our products'),
(129, 65, 1, 'fr', 'A propos de nous', 'A propos de nous'),
(130, 65, 2, 'en', 'A propos de nous', 'About Us'),
(131, 66, 1, 'fr', 'Nos #title#', 'Nos #title#'),
(132, 66, 2, 'en', 'Nos #title#', 'Our # title #'),
(133, 67, 1, 'fr', 'Publié le #date_publication# à #time#', 'Publié le #date_publication# à #time#'),
(134, 67, 2, 'en', 'Publié le #date_publication# à #time#', 'Posted on # date_publication # at # time #'),
(135, 68, 1, 'fr', 'Laisser votre commentaire', 'Laisser votre commentaire'),
(136, 68, 2, 'en', 'Laisser votre commentaire', 'Leave your comment'),
(137, 69, 1, 'fr', 'Commentaires', 'Commentaires'),
(138, 69, 2, 'en', 'Commentaires', 'Comments'),
(139, 70, 1, 'fr', 'Commentaire', 'Commentaire'),
(140, 70, 2, 'en', 'Commentaire', 'Comment'),
(141, 71, 1, 'fr', 'Ajouter', 'Ajouter'),
(142, 71, 2, 'en', 'Ajouter', 'Add'),
(143, 72, 1, 'fr', 'Votre email', 'Votre email'),
(144, 72, 2, 'en', 'Votre email', 'Your email'),
(145, 73, 1, 'fr', 'votre saisir votre adresse email', 'votre saisir votre adresse email'),
(146, 73, 2, 'en', 'votre saisir votre adresse email', 'your enter your email address'),
(147, 74, 1, 'fr', 'S\'abonner', 'S\'abonner'),
(148, 74, 2, 'en', 'S\'abonner', 'Subscribe'),
(149, 75, 1, 'fr', 'Vous êtes déja abonnés à #site_name#', 'Vous êtes déja abonnés à #site_name#'),
(150, 75, 2, 'en', 'Vous êtes déja abonnés à #site_name#', 'You are already subscribed to # site_name #'),
(151, 76, 1, 'fr', 'Désormais vous êtes de nouveau abonnés à #site_name#', 'Désormais vous êtes de nouveau abonnés à #site_name#'),
(152, 76, 2, 'en', 'Désormais vous êtes de nouveau abonnés à #site_name#', 'You are now subscribed to # site_name # again'),
(153, 77, 1, 'fr', 'Newsletter - Nouvelle inscription', 'Newsletter - Nouvelle inscription'),
(154, 77, 2, 'en', 'Newsletter - Nouvelle inscription', 'Newsletter - New subscription'),
(155, 78, 1, 'fr', 'Désormais vous êtes abonnés à #site_name#', 'Désormais vous êtes abonnés à #site_name#'),
(156, 78, 2, 'en', 'Désormais vous êtes abonnés à #site_name#', 'You are now subscribed to # site_name #'),
(157, 79, 1, 'fr', 'Une erreur est survenue. Veuillez réessayer ultérieurement', 'Une erreur est survenue. Veuillez réessayer ultérieurement'),
(158, 79, 2, 'en', 'Une erreur est survenue. Veuillez réessayer ultérieurement', 'An error has occurred. Please retry later'),
(159, 80, 1, 'fr', 'Veuillez accepter la politique de confidentialité du site', 'Veuillez accepter la politique de confidentialité du site'),
(160, 80, 2, 'en', 'Veuillez accepter la politique de confidentialité du site', 'Please accept the site\'s privacy policy'),
(161, 81, 1, 'fr', 'fr', 'fr'),
(162, 81, 2, 'en', 'fr', 'Fr'),
(163, 82, 1, 'fr', 'Mentions légales', 'Mentions légales'),
(164, 82, 2, 'en', 'Mentions légales', 'Legal Notice'),
(165, 83, 1, 'fr', 'Plan du site', 'Plan du site'),
(166, 83, 2, 'en', 'Plan du site', 'Sitemap'),
(167, 84, 1, 'fr', 'Grâce à notre courrier, vous restez toujours au courant de nos dernières nouvelles!', 'Grâce à notre courrier, vous restez toujours au courant de nos dernières nouvelles!'),
(168, 84, 2, 'en', 'Grâce à notre courrier, vous restez toujours au courant de nos dernières nouvelles!', 'Thanks to our mail, you always stay up to date with our latest news!'),
(169, 85, 1, 'fr', 'Abonnez-vous à notre newsletter', 'Abonnez-vous à notre newsletter'),
(170, 85, 2, 'en', 'Abonnez-vous à notre newsletter', 'Subscribe to our newsletter'),
(171, 86, 1, 'fr', 'la politique de confidentialité du site', 'la politique de confidentialité du site'),
(172, 86, 2, 'en', 'la politique de confidentialité du site', 'the site\'s privacy policy'),
(173, 87, 1, 'fr', 'J\'ai lu et j\'accepte #legal_notice#', 'J\'ai lu et j\'accepte #legal_notice#'),
(174, 87, 2, 'en', 'J\'ai lu et j\'accepte #legal_notice#', 'I have read and I accept # legal_notice #'),
(175, 88, 1, 'fr', 'S\'inscrire', 'S\'inscrire'),
(176, 88, 2, 'en', 'S\'inscrire', 'Register now'),
(177, 89, 1, 'fr', 'Pas de résultats', 'Pas de résultats'),
(178, 89, 2, 'en', 'Pas de résultats', 'No results'),
(179, 90, 1, 'fr', 'Nous suivre', 'Nous suivre'),
(180, 90, 2, 'en', 'Nous suivre', 'Follow us'),
(181, 91, 1, 'fr', 'Votre recherche', 'Votre recherche'),
(182, 91, 2, 'en', 'Votre recherche', 'Votre recherche'),
(183, 92, 1, 'fr', 'Archives', 'Archives'),
(184, 92, 2, 'en', 'Archives', 'Archives'),
(185, 93, 1, 'fr', 'Soyez le premier à laisser un commentaire', 'Soyez le premier à laisser un commentaire'),
(186, 93, 2, 'en', 'Soyez le premier à laisser un commentaire', 'Soyez le premier à laisser un commentaire'),
(187, 94, 1, 'fr', 'Pages', 'Pages'),
(188, 94, 2, 'en', 'Pages', 'Pages'),
(189, 95, 1, 'fr', 'Lots', 'Lots'),
(190, 95, 2, 'en', 'Lots', 'Lots'),
(191, 96, 1, 'fr', 'Télécharger', 'Télécharger'),
(192, 96, 2, 'en', 'Télécharger', 'Télécharger');

-- --------------------------------------------------------

--
-- Structure de la table `na_url`
--

CREATE TABLE `na_url` (
  `id` int(11) UNSIGNED NOT NULL,
  `resource` varchar(50) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `page` varchar(50) DEFAULT NULL,
  `params` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_url`
--

INSERT INTO `na_url` (`id`, `resource`, `action`, `page`, `params`) VALUES
(19, 'pages', 'about', NULL, NULL),
(20, 'pages', 'quality', NULL, NULL),
(21, 'pages', 'approach', NULL, NULL),
(22, 'pages', 'farm', NULL, NULL),
(23, 'oils', 'listing', NULL, NULL),
(24, 'oils', 'index', NULL, NULL),
(25, 'news', 'index', NULL, NULL),
(26, 'news', 'fiche', NULL, NULL),
(27, 'contact', 'index', NULL, NULL),
(29, 'products', 'index', NULL, NULL),
(30, 'products', 'fiche', NULL, NULL),
(31, 'products', 'all', NULL, NULL),
(32, 'pages', 'legalnotice', NULL, NULL),
(33, 'pages', 'sitemap', NULL, NULL),
(34, 'pages', 'history', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `na_url_multilingual`
--

CREATE TABLE `na_url_multilingual` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_url` int(11) UNSIGNED DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_url_multilingual`
--

INSERT INTO `na_url_multilingual` (`id`, `id_url`, `id_language`, `url`) VALUES
(1, 19, 1, 'qui-sommes-nous'),
(2, 19, 2, 'who-we-are'),
(3, 20, 1, 'nos-valeurs-essentielles'),
(4, 20, 2, 'our-core-values'),
(5, 21, 1, 'notre-approche'),
(6, 21, 2, 'our-approach'),
(7, 22, 1, 'les-filieres'),
(8, 22, 2, 'farm'),
(9, 23, 1, 'huiles-essentielles'),
(10, 23, 2, 'essentials-oils'),
(11, 24, 1, 'huiles-essentielles/#permalink#'),
(12, 24, 2, 'essentials-oils/#permalink#'),
(13, 25, 1, 'actualites'),
(14, 25, 2, 'news'),
(15, 26, 1, 'actualites/#permalink#'),
(16, 26, 2, 'news/#permalink#'),
(17, 27, 1, 'contact'),
(18, 27, 2, 'contact'),
(21, 29, 1, 'produits/#category_permalink#'),
(22, 29, 2, 'products/#category_permalink#'),
(23, 30, 1, 'produits/#category_permalink#/#permalink#'),
(24, 30, 2, 'products/#category_permalink#/#permalink#'),
(25, 31, 1, 'produits'),
(26, 31, 2, 'products'),
(27, 32, 1, 'mentions-legales'),
(28, 32, 2, 'legal-notice'),
(29, 33, 1, 'plan-du-site'),
(30, 33, 2, 'sitemap'),
(31, 34, 1, 'notre-histoire'),
(32, 34, 2, 'our-history');

-- --------------------------------------------------------

--
-- Structure de la table `na_users`
--

CREATE TABLE `na_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(200) DEFAULT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `full_name` varchar(400) DEFAULT NULL,
  `email` varchar(1020) DEFAULT NULL,
  `password` varchar(1020) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `na_users`
--

INSERT INTO `na_users` (`id`, `first_name`, `last_name`, `full_name`, `email`, `password`, `token`, `last_activity`, `create_time`, `update_time`) VALUES
(1, 'Admin', 'Admin', 'Admin Admin', 'contact@natoralyaroma.com', 'e10adc3949ba59abbe56e057f20f883e', '0319d772d82a9424dc294550c14a6657827908fd', '2021-07-14 16:59:13', '2019-01-14 11:54:12', '2021-04-19 11:04:26');

-- --------------------------------------------------------

--
-- Structure de la table `na_visits_annual`
--

CREATE TABLE `na_visits_annual` (
  `date` date NOT NULL,
  `stats_visits` int(11) NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Contenu de la table `na_visits_annual`
--

INSERT INTO `na_visits_annual` (`date`, `stats_visits`, `updated`) VALUES
('2021-01-01', 1228, '2021-07-14 16:25:56');

-- --------------------------------------------------------

--
-- Structure de la table `na_visits_daily`
--

CREATE TABLE `na_visits_daily` (
  `date` date NOT NULL,
  `stats_visits` int(11) NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Contenu de la table `na_visits_daily`
--

INSERT INTO `na_visits_daily` (`date`, `stats_visits`, `updated`) VALUES
('2021-04-20', 5, '2021-04-20 23:39:17'),
('2021-04-21', 38, '2021-04-21 22:57:33'),
('2021-04-22', 42, '2021-04-22 23:32:55'),
('2021-04-23', 73, '2021-04-23 22:48:43'),
('2021-04-24', 43, '2021-04-24 23:58:18'),
('2021-04-25', 40, '2021-04-25 21:39:04'),
('2021-04-26', 37, '2021-04-26 22:53:23'),
('2021-04-27', 41, '2021-04-27 23:44:20'),
('2021-04-28', 39, '2021-04-28 23:49:13'),
('2021-04-29', 40, '2021-04-29 22:28:25'),
('2021-04-30', 56, '2021-04-30 23:48:07'),
('2021-05-01', 43, '2021-05-01 23:37:38'),
('2021-05-02', 38, '2021-05-02 23:53:11'),
('2021-05-03', 44, '2021-05-03 23:23:04'),
('2021-05-04', 69, '2021-05-04 23:32:56'),
('2021-05-05', 37, '2021-05-05 22:21:27'),
('2021-05-06', 44, '2021-05-06 23:21:53'),
('2021-05-07', 91, '2021-05-07 23:25:32'),
('2021-05-08', 46, '2021-05-08 23:12:00'),
('2021-05-09', 51, '2021-05-09 21:26:47'),
('2021-05-10', 60, '2021-05-10 23:01:33'),
('2021-05-11', 32, '2021-05-11 23:57:53'),
('2021-05-12', 35, '2021-05-12 23:17:46'),
('2021-05-13', 25, '2021-05-13 23:59:29'),
('2021-05-14', 28, '2021-05-14 23:52:15'),
('2021-05-15', 19, '2021-05-15 20:04:19'),
('2021-05-16', 22, '2021-05-16 23:57:28'),
('2021-05-17', 27, '2021-05-17 23:59:57'),
('2021-05-18', 18, '2021-05-18 23:53:46'),
('2021-05-19', 33, '2021-05-19 15:49:28'),
('2021-05-20', 1, '2021-05-20 09:39:39'),
('2021-05-21', 1, '2021-05-21 09:06:48'),
('2021-05-27', 1, '2021-05-27 22:32:27'),
('2021-06-07', 1, '2021-06-07 13:45:08'),
('2021-06-10', 1, '2021-06-10 08:51:59'),
('2021-06-22', 1, '2021-06-22 09:41:44'),
('2021-06-23', 1, '2021-06-23 09:45:52'),
('2021-06-24', 1, '2021-06-24 10:25:20'),
('2021-06-27', 1, '2021-06-27 17:35:18'),
('2021-06-29', 1, '2021-06-29 12:31:34'),
('2021-07-08', 1, '2021-07-08 13:40:23'),
('2021-07-14', 1, '2021-07-14 16:25:56');

-- --------------------------------------------------------

--
-- Structure de la table `na_visits_ips`
--

CREATE TABLE `na_visits_ips` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ip_address` varchar(30) DEFAULT '',
  `date` date DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Contenu de la table `na_visits_ips`
--

INSERT INTO `na_visits_ips` (`id`, `ip_address`, `date`, `user_agent`, `create_time`) VALUES
(1, '127.0.0.1', '2021-04-20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.10 Safari/537.36', '2021-04-20 10:27:19'),
(2, '102.68.224.27', '2021-04-20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.10 Safari/537.36', '2021-04-20 22:15:55'),
(3, '74.201.28.70', '2021-04-20', 'libwww-perl/6.53', '2021-04-20 22:36:04'),
(4, '198.232.118.99', '2021-04-20', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-20 22:56:46'),
(5, '201.75.0.205', '2021-04-20', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-20 23:39:17'),
(6, '74.201.28.70', '2021-04-21', 'libwww-perl/6.53', '2021-04-21 00:22:51'),
(7, '107.151.182.58', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-21 00:33:45'),
(8, '13.66.139.81', '2021-04-21', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-21 00:51:19'),
(9, '192.241.217.241', '2021-04-21', 'Mozilla/5.0 zgrab/0.x', '2021-04-21 01:11:49'),
(10, '192.241.218.209', '2021-04-21', 'Mozilla/5.0 zgrab/0.x', '2021-04-21 02:08:39'),
(11, '62.234.81.93', '2021-04-21', 'Mozilla/5.0 (Windows; U; Windows NT 6.0;en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6)', '2021-04-21 02:18:01'),
(12, '128.14.211.190', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-21 04:27:24'),
(13, '80.82.77.192', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-04-21 05:48:26'),
(14, '80.82.77.42', '2021-04-21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-21 06:24:29'),
(15, '51.255.3.45', '2021-04-21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-21 06:37:55'),
(16, '167.172.38.106', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '2021-04-21 06:52:39'),
(17, '71.6.232.4', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '2021-04-21 08:02:44'),
(18, '162.142.125.40', '2021-04-21', NULL, '2021-04-21 08:05:49'),
(19, '13.66.139.142', '2021-04-21', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-21 08:12:44'),
(20, '102.68.231.40', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.10 Safari/537.36', '2021-04-21 08:13:12'),
(21, '32.140.239.70', '2021-04-21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-21 08:25:18'),
(22, '69.25.114.212', '2021-04-21', 'libwww-perl/6.05', '2021-04-21 10:09:20'),
(23, '86.13.220.32', '2021-04-21', NULL, '2021-04-21 10:48:10'),
(24, '34.89.60.52', '2021-04-21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-21 10:49:07'),
(25, '186.33.126.57', '2021-04-21', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-21 11:35:07'),
(26, '23.81.64.144', '2021-04-21', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-04-21 12:33:53'),
(27, '104.206.128.50', '2021-04-21', 'https://gdnplus.com:Gather Analyze Provide.', '2021-04-21 14:27:16'),
(28, '184.105.247.254', '2021-04-21', NULL, '2021-04-21 14:40:11'),
(29, '190.57.222.32', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-21 16:45:20'),
(30, '138.246.253.24', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '2021-04-21 16:45:58'),
(31, '27.255.65.35', '2021-04-21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-21 16:53:59'),
(32, '109.94.164.13', '2021-04-21', 'Mozilla/5.0', '2021-04-21 16:56:36'),
(33, '104.224.28.103', '2021-04-21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-21 17:24:14'),
(34, '193.118.53.210', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-21 18:04:02'),
(35, '101.255.69.138', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-21 18:12:46'),
(36, '102.68.229.71', '2021-04-21', 'Mozilla/5.0 (Linux; Android 10; MI CC 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.181 Mobile Safari/537.36', '2021-04-21 19:31:52'),
(37, '167.248.133.37', '2021-04-21', NULL, '2021-04-21 20:21:46'),
(38, '128.14.211.198', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-21 21:24:03'),
(39, '185.165.190.17', '2021-04-21', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-04-21 21:36:36'),
(40, '34.76.80.167', '2021-04-21', 'python-requests/2.25.1', '2021-04-21 21:36:59'),
(41, '92.118.161.13', '2021-04-21', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-04-21 22:23:57'),
(42, '192.3.146.243', '2021-04-21', NULL, '2021-04-21 22:48:55'),
(43, '45.79.218.30', '2021-04-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-21 22:57:33'),
(44, '20.51.107.12', '2021-04-22', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-22 00:28:16'),
(45, '178.93.7.20', '2021-04-22', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-22 00:49:56'),
(46, '91.224.92.162', '2021-04-22', NULL, '2021-04-22 02:25:48'),
(47, '66.240.219.146', '2021-04-22', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-04-22 02:58:23'),
(48, '184.105.139.67', '2021-04-22', NULL, '2021-04-22 03:16:08'),
(49, '207.46.13.16', '2021-04-22', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-22 04:55:47'),
(50, '192.241.214.135', '2021-04-22', 'Mozilla/5.0 zgrab/0.x', '2021-04-22 05:18:59'),
(51, '192.241.221.78', '2021-04-22', 'Mozilla/5.0 zgrab/0.x', '2021-04-22 05:53:19'),
(52, '94.46.13.218', '2021-04-22', 'Mozilla/5.0', '2021-04-22 06:05:17'),
(53, '190.210.250.178', '2021-04-22', NULL, '2021-04-22 06:55:00'),
(54, '102.68.231.194', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.10 Safari/537.36', '2021-04-22 08:09:10'),
(55, '35.231.136.117', '2021-04-22', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0', '2021-04-22 09:09:18'),
(56, '179.106.100.21', '2021-04-22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-22 10:10:44'),
(57, '181.228.170.199', '2021-04-22', NULL, '2021-04-22 10:27:46'),
(58, '45.79.218.30', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-22 10:37:41'),
(59, '193.118.53.210', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-22 11:24:42'),
(60, '39.96.139.158', '2021-04-22', 'Go-http-client/1.1', '2021-04-22 11:43:42'),
(61, '185.163.109.66', '2021-04-22', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-04-22 11:47:03'),
(62, '34.76.80.167', '2021-04-22', 'python-requests/2.25.1', '2021-04-22 11:47:13'),
(63, '102.68.228.163', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.10 Safari/537.36', '2021-04-22 12:25:03'),
(64, '103.68.42.122', '2021-04-22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-22 12:33:50'),
(65, '167.62.90.20', '2021-04-22', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-22 13:27:33'),
(66, '154.126.11.106', '2021-04-22', 'Mozilla/5.0 (Linux; Android 9; SM-G9500) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.66 Mobile Safari/537.36', '2021-04-22 13:54:50'),
(67, '138.68.176.208', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '2021-04-22 14:09:41'),
(68, '109.94.164.13', '2021-04-22', 'Mozilla/5.0', '2021-04-22 17:16:41'),
(69, '142.93.223.88', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '2021-04-22 18:43:27'),
(70, '65.49.20.66', '2021-04-22', NULL, '2021-04-22 19:01:14'),
(71, '128.14.134.134', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-22 19:04:08'),
(72, '154.126.33.163', '2021-04-22', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15', '2021-04-22 19:25:46'),
(73, '188.159.31.100', '2021-04-22', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-22 19:43:38'),
(74, '181.105.9.166', '2021-04-22', NULL, '2021-04-22 19:52:39'),
(75, '154.126.11.59', '2021-04-22', 'Mozilla/5.0 (Android 11; Mobile; rv:87.0) Gecko/87.0 Firefox/87.0', '2021-04-22 19:52:45'),
(76, '80.82.77.192', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-04-22 19:53:29'),
(77, '192.46.239.120', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '2021-04-22 20:11:23'),
(78, '172.105.172.122', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-22 20:26:14'),
(79, '41.214.87.21', '2021-04-22', 'Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/14.0 Chrome/87.0.4280.141 Mobile Safari/537.36', '2021-04-22 21:25:55'),
(80, '128.14.211.186', '2021-04-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-22 21:35:04'),
(81, '167.248.133.56', '2021-04-22', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-04-22 22:24:18'),
(82, '122.228.19.80', '2021-04-22', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-04-22 23:03:51'),
(83, '74.120.14.37', '2021-04-22', NULL, '2021-04-22 23:09:13'),
(84, '193.169.254.213', '2021-04-22', NULL, '2021-04-22 23:28:50'),
(85, '162.62.123.19', '2021-04-22', NULL, '2021-04-22 23:32:55'),
(86, '177.125.72.24', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-23 00:06:29'),
(87, '34.76.80.167', '2021-04-23', 'python-requests/2.25.1', '2021-04-23 00:54:29'),
(88, '209.222.10.28', '2021-04-23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-23 01:47:09'),
(89, '107.151.182.62', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-23 02:19:18'),
(90, '104.221.74.43', '2021-04-23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-23 02:38:25'),
(91, '165.227.4.31', '2021-04-23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', '2021-04-23 02:38:25'),
(92, '95.72.7.33', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-23 02:52:29'),
(93, '80.82.70.118', '2021-04-23', 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_3_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.1 Mobile/15E148 Safari/604.1', '2021-04-23 02:54:27'),
(94, '190.237.93.47', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-23 03:13:39'),
(95, '74.82.47.2', '2021-04-23', NULL, '2021-04-23 03:20:15'),
(96, '128.14.134.170', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-23 03:24:19'),
(97, '207.46.13.16', '2021-04-23', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-23 04:18:42'),
(98, '45.33.81.148', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0', '2021-04-23 04:22:31'),
(99, '177.185.156.199', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-23 04:30:59'),
(100, '178.79.134.182', '2021-04-23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-23 05:05:46'),
(101, '36.74.41.170', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-23 05:23:37'),
(102, '193.46.255.64', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:55.0) Gecko/20100101 Firefox/55.0', '2021-04-23 05:28:17'),
(103, '45.79.218.30', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-23 06:08:34'),
(104, '45.79.163.21', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0', '2021-04-23 06:21:08'),
(105, '168.181.120.21', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-23 06:47:13'),
(106, '34.203.37.48', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-04-23 06:48:49'),
(107, '54.250.87.247', '2021-04-23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36', '2021-04-23 06:49:39'),
(108, '54.178.182.46', '2021-04-23', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.3319.102 Safari/537.36', '2021-04-23 06:49:50'),
(109, '18.184.155.204', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.4; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-04-23 06:51:13'),
(110, '13.53.64.97', '2021-04-23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36', '2021-04-23 06:51:25'),
(111, '35.183.60.188', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.2 Safari/537.36', '2021-04-23 06:51:30'),
(112, '35.180.147.121', '2021-04-23', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.3319.102 Safari/537.36', '2021-04-23 06:52:50'),
(113, '3.8.68.2', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1623.0 Safari/537.36', '2021-04-23 06:53:56'),
(114, '13.233.73.212', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', '2021-04-23 06:56:54'),
(115, '52.60.189.115', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36', '2021-04-23 06:57:24'),
(116, '34.209.105.222', '2021-04-23', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.3319.102 Safari/537.36', '2021-04-23 07:00:17'),
(117, '54.176.188.51', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-04-23 07:01:53'),
(118, '83.147.223.4', '2021-04-23', 'Mozilla/5.0 zgrab/0.x', '2021-04-23 07:05:34'),
(119, '167.248.133.53', '2021-04-23', NULL, '2021-04-23 07:52:21'),
(120, '192.241.214.98', '2021-04-23', 'Mozilla/5.0 zgrab/0.x', '2021-04-23 07:55:39'),
(121, '102.68.229.2', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.19 Safari/537.36', '2021-04-23 08:02:29'),
(122, '35.229.63.243', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0', '2021-04-23 08:58:20'),
(123, '192.241.216.41', '2021-04-23', 'Mozilla/5.0 zgrab/0.x', '2021-04-23 09:14:29'),
(124, '185.189.121.50', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-23 09:16:26'),
(125, '64.62.197.2', '2021-04-23', NULL, '2021-04-23 09:50:22'),
(126, '128.14.211.186', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-23 10:32:45'),
(127, '154.126.107.132', '2021-04-23', 'Mozilla/5.0 (Linux; Android 9; FIG-LA1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.82 Mobile Safari/537.36', '2021-04-23 10:54:29'),
(128, '196.192.35.34', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', '2021-04-23 11:14:15'),
(129, '180.250.162.26', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-23 12:47:46'),
(130, '162.62.123.19', '2021-04-23', NULL, '2021-04-23 12:51:58'),
(131, '109.94.164.13', '2021-04-23', 'Mozilla/5.0', '2021-04-23 13:07:42'),
(132, '69.162.231.221', '2021-04-23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-23 13:29:12'),
(133, '128.14.133.58', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-23 13:37:15'),
(134, '162.142.125.53', '2021-04-23', NULL, '2021-04-23 14:06:43'),
(135, '92.118.161.49', '2021-04-23', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-04-23 14:23:51'),
(136, '88.5.237.10', '2021-04-23', 'Mozilla/5.0 zgrab/0.x', '2021-04-23 15:03:39'),
(137, '186.33.118.218', '2021-04-23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-23 15:47:46'),
(138, '175.196.163.231', '2021-04-23', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '2021-04-23 16:06:09'),
(139, '143.198.52.250', '2021-04-23', 'Linux Gnu (cow)', '2021-04-23 16:46:21'),
(140, '5.160.100.47', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-23 16:53:36'),
(141, '45.143.99.69', '2021-04-23', 'Go-http-client/1.1', '2021-04-23 17:01:51'),
(142, '34.230.156.67', '2021-04-23', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', '2021-04-23 17:04:46'),
(143, '13.209.28.104', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '2021-04-23 17:05:52'),
(144, '52.64.20.252', '2021-04-23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36', '2021-04-23 17:08:41'),
(145, '18.231.94.162', '2021-04-23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', '2021-04-23 17:12:20'),
(146, '52.15.212.3', '2021-04-23', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36', '2021-04-23 17:14:49'),
(147, '13.232.96.15', '2021-04-23', 'Mozilla/5.0 (X11; CrOS i686 4319.74.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2021-04-23 17:15:45'),
(148, '52.192.73.251', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36', '2021-04-23 17:16:52'),
(149, '104.206.128.10', '2021-04-23', 'https://gdnplus.com:Gather Analyze Provide.', '2021-04-23 17:30:52'),
(150, '62.240.7.3', '2021-04-23', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-23 17:59:41'),
(151, '52.171.55.122', '2021-04-23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-23 18:19:06'),
(152, '187.108.32.133', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-23 19:06:23'),
(153, '139.59.29.86', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '2021-04-23 19:44:39'),
(154, '139.162.208.7', '2021-04-23', NULL, '2021-04-23 20:47:32'),
(155, '186.33.77.22', '2021-04-23', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-23 20:55:28'),
(156, '207.46.13.37', '2021-04-23', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-23 21:33:31'),
(157, '91.137.104.221', '2021-04-23', NULL, '2021-04-23 22:48:27'),
(158, '52.249.198.118', '2021-04-23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-23 22:48:43'),
(159, '128.14.134.134', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-24 00:04:13'),
(160, '45.165.28.191', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-24 00:14:02'),
(161, '163.172.11.54', '2021-04-24', 'Mozilla/5.0 zgrab/0.x', '2021-04-24 00:19:03'),
(162, '5.235.224.208', '2021-04-24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-24 00:28:11'),
(163, '74.120.14.38', '2021-04-24', NULL, '2021-04-24 01:28:41'),
(164, '51.158.108.77', '2021-04-24', NULL, '2021-04-24 02:38:20'),
(165, '128.14.211.194', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-24 03:01:38'),
(166, '207.46.13.16', '2021-04-24', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-24 03:42:39'),
(167, '128.14.211.190', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-24 04:10:55'),
(168, '103.209.178.103', '2021-04-24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-24 04:24:22'),
(169, '88.5.237.10', '2021-04-24', 'Mozilla/5.0 zgrab/0.x', '2021-04-24 05:49:31'),
(170, '123.160.221.46', '2021-04-24', 'Chrome/54.0 (Windows NT 10.0)', '2021-04-24 06:25:34'),
(171, '128.14.133.58', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-24 07:26:51'),
(172, '64.62.197.2', '2021-04-24', NULL, '2021-04-24 07:35:13'),
(173, '180.149.125.175', '2021-04-24', 'Mozilla/5.0 (Windows NT 5.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2021-04-24 07:38:24'),
(174, '34.208.86.17', '2021-04-24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', '2021-04-24 08:33:09'),
(175, '104.152.52.22', '2021-04-24', 'masscan/1.0 (https://github.com/robertdavidgraham/masscan)', '2021-04-24 09:25:53'),
(176, '107.151.182.62', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-24 09:35:54'),
(177, '193.118.53.210', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-24 09:59:16'),
(178, '74.120.14.40', '2021-04-24', NULL, '2021-04-24 10:48:27'),
(179, '161.69.99.11', '2021-04-24', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20120101 Firefox/29.0', '2021-04-24 11:15:38'),
(180, '154.126.33.163', '2021-04-24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15', '2021-04-24 11:39:12'),
(181, '41.77.17.7', '2021-04-24', 'Mozilla/5.0 (Linux; Android 9; FIG-LA1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.82 Mobile Safari/537.36', '2021-04-24 11:39:38'),
(182, '109.94.164.13', '2021-04-24', 'Mozilla/5.0', '2021-04-24 11:53:55'),
(183, '193.118.53.202', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-24 12:21:25'),
(184, '89.39.36.125', '2021-04-24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-24 12:22:11'),
(185, '162.142.125.55', '2021-04-24', NULL, '2021-04-24 13:39:27'),
(186, '102.68.225.26', '2021-04-24', 'Mozilla/5.0 (Linux; Android 10; MI CC 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.181 Mobile Safari/537.36', '2021-04-24 15:17:38'),
(187, '23.129.64.207', '2021-04-24', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-04-24 15:30:51'),
(188, '75.165.50.176', '2021-04-24', NULL, '2021-04-24 15:44:03'),
(189, '184.105.139.70', '2021-04-24', NULL, '2021-04-24 15:54:44'),
(190, '185.24.35.8', '2021-04-24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-24 16:15:03'),
(191, '18.191.252.245', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36', '2021-04-24 17:32:44'),
(192, '119.42.126.185', '2021-04-24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-24 18:01:35'),
(193, '189.126.64.72', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-24 18:08:11'),
(194, '178.32.197.91', '2021-04-24', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', '2021-04-24 18:31:33'),
(195, '45.83.67.76', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '2021-04-24 19:28:49'),
(196, '50.116.7.112', '2021-04-24', NULL, '2021-04-24 20:29:14'),
(197, '207.46.13.37', '2021-04-24', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-24 20:59:39'),
(198, '138.99.93.174', '2021-04-24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-24 21:20:46'),
(199, '195.24.220.35', '2021-04-24', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-24 21:21:08'),
(200, '212.72.153.186', '2021-04-24', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-24 22:36:49'),
(201, '45.143.147.173', '2021-04-24', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-24 23:58:18'),
(202, '193.118.53.202', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-25 00:10:22'),
(203, '51.254.59.113', '2021-04-25', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-04-25 00:12:28'),
(204, '128.14.133.58', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-25 01:35:00'),
(205, '159.89.161.207', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '2021-04-25 01:44:14'),
(206, '192.241.218.128', '2021-04-25', 'Mozilla/5.0 zgrab/0.x', '2021-04-25 02:37:57'),
(207, '207.46.13.16', '2021-04-25', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-25 03:06:51'),
(208, '139.162.116.133', '2021-04-25', 'HTTP Banner Detection (https://security.ipip.net)', '2021-04-25 04:04:12'),
(209, '192.241.214.162', '2021-04-25', 'Mozilla/5.0 zgrab/0.x', '2021-04-25 04:06:52'),
(210, '112.171.130.213', '2021-04-25', NULL, '2021-04-25 04:08:41'),
(211, '121.108.240.207', '2021-04-25', 'Dalvik/2.1.0 (Linux; U; Android 10; SH-M08 Build/S3110)', '2021-04-25 04:54:51'),
(212, '121.108.240.207', '2021-04-25', 'Dalvik/2.1.0 (Linux; U; Android 10; SH-M08 Build/S3110)', '2021-04-25 04:54:51'),
(213, '195.201.57.164', '2021-04-25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36 OPR/43.0.2442.991', '2021-04-25 05:00:16'),
(214, '177.54.82.46', '2021-04-25', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-25 05:04:49'),
(215, '109.94.164.13', '2021-04-25', 'Mozilla/5.0', '2021-04-25 05:12:27'),
(216, '80.82.77.192', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-04-25 05:41:28'),
(217, '193.118.53.210', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-25 05:59:32'),
(218, '93.174.93.76', '2021-04-25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-25 06:06:53'),
(219, '64.62.197.2', '2021-04-25', NULL, '2021-04-25 06:18:37'),
(220, '207.46.13.37', '2021-04-25', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-25 06:23:13'),
(221, '168.227.181.218', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-25 06:36:34'),
(222, '92.118.160.49', '2021-04-25', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-04-25 07:16:20'),
(223, '162.62.133.40', '2021-04-25', NULL, '2021-04-25 07:51:42'),
(224, '212.83.146.233', '2021-04-25', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', '2021-04-25 08:17:05'),
(225, '178.93.59.66', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-25 09:23:16'),
(226, '54.200.149.217', '2021-04-25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-25 11:36:12'),
(227, '89.248.170.22', '2021-04-25', NULL, '2021-04-25 11:39:53'),
(228, '51.255.3.45', '2021-04-25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-25 12:00:21'),
(229, '64.62.197.32', '2021-04-25', NULL, '2021-04-25 13:03:07'),
(230, '107.151.182.58', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-25 14:44:17'),
(231, '186.33.78.199', '2021-04-25', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-25 14:53:08'),
(232, '139.59.92.203', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '2021-04-25 14:55:39'),
(233, '41.206.44.62', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-25 15:39:53'),
(234, '193.142.146.84', '2021-04-25', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-04-25 16:11:06'),
(235, '79.188.122.219', '2021-04-25', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-25 17:56:00'),
(236, '89.248.165.163', '2021-04-25', 'libwww-perl/6.52', '2021-04-25 18:19:52'),
(237, '187.188.190.41', '2021-04-25', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-25 20:55:12'),
(238, '74.120.14.37', '2021-04-25', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-04-25 21:01:44'),
(239, '162.142.125.38', '2021-04-25', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-04-25 21:01:48'),
(240, '167.248.133.56', '2021-04-25', NULL, '2021-04-25 21:07:37'),
(241, '154.126.33.163', '2021-04-25', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15', '2021-04-25 21:39:04'),
(242, '193.200.50.189', '2021-04-26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-26 00:01:33'),
(243, '41.82.49.33', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', '2021-04-26 01:41:17'),
(244, '207.46.13.16', '2021-04-26', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-26 02:29:49'),
(245, '103.254.57.108', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-26 02:40:28'),
(246, '193.142.146.84', '2021-04-26', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-04-26 02:42:34'),
(247, '84.241.62.89', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-26 05:34:23'),
(248, '207.46.13.37', '2021-04-26', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-26 05:45:40'),
(249, '184.105.247.196', '2021-04-26', NULL, '2021-04-26 05:55:50'),
(250, '167.248.133.53', '2021-04-26', NULL, '2021-04-26 06:05:16'),
(251, '94.214.102.171', '2021-04-26', 'Mozilla/5.0 (X11; Linux x86_64; rv:67.0) Gecko/20100101 Firefox/67.0', '2021-04-26 06:15:00'),
(252, '47.242.18.184', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '2021-04-26 06:35:22'),
(253, '192.241.221.78', '2021-04-26', 'Mozilla/5.0 zgrab/0.x', '2021-04-26 07:16:49'),
(254, '192.241.220.83', '2021-04-26', 'Mozilla/5.0 zgrab/0.x', '2021-04-26 07:48:47'),
(255, '3.84.132.113', '2021-04-26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-26 08:12:21'),
(256, '13.85.75.111', '2021-04-26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-26 08:16:10'),
(257, '102.68.229.130', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4484.7 Safari/537.36', '2021-04-26 08:43:34'),
(258, '176.65.253.41', '2021-04-26', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-26 08:49:53'),
(259, '54.244.211.151', '2021-04-26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-26 09:29:51'),
(260, '71.6.135.131', '2021-04-26', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-04-26 09:56:58'),
(261, '34.77.163.42', '2021-04-26', 'python-requests/2.25.1', '2021-04-26 09:57:08'),
(262, '128.14.209.178', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36', '2021-04-26 10:01:29'),
(263, '154.126.12.96', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', '2021-04-26 10:02:32'),
(264, '94.231.162.53', '2021-04-26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-26 10:30:28'),
(265, '94.231.162.53', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-26 10:30:28'),
(266, '127.0.0.1', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4484.7 Safari/537.36', '2021-04-26 10:39:52'),
(267, '181.90.211.222', '2021-04-26', NULL, '2021-04-26 15:02:16'),
(268, '128.14.134.170', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-26 15:47:47'),
(269, '74.120.14.54', '2021-04-26', NULL, '2021-04-26 18:19:18'),
(270, '107.151.182.54', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-26 18:38:09'),
(271, '103.149.192.207', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '2021-04-26 18:58:02'),
(272, '192.35.168.96', '2021-04-26', 'Mozilla/5.0 zgrab/0.x', '2021-04-26 19:04:21'),
(273, '186.33.113.201', '2021-04-26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-26 19:34:39'),
(274, '89.248.170.22', '2021-04-26', 'Linux Gnu (cow)', '2021-04-26 20:50:29'),
(275, '80.82.77.240', '2021-04-26', 'masscan/1.0 (https://github.com/robertdavidgraham/masscan)', '2021-04-26 21:14:47'),
(276, '144.91.73.82', '2021-04-26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-26 21:40:50'),
(277, '128.14.211.186', '2021-04-26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-26 21:48:37'),
(278, '152.170.225.158', '2021-04-26', NULL, '2021-04-26 22:53:23'),
(279, '179.109.1.244', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-27 00:08:39'),
(280, '128.14.211.186', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-27 00:15:16'),
(281, '89.248.170.22', '2021-04-27', 'Linux Gnu (cow)', '2021-04-27 00:44:53'),
(282, '103.15.242.196', '2021-04-27', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-27 01:23:20'),
(283, '207.46.13.16', '2021-04-27', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-27 01:59:51'),
(284, '178.73.215.171', '2021-04-27', NULL, '2021-04-27 02:23:15'),
(285, '139.162.116.133', '2021-04-27', 'HTTP Banner Detection (https://security.ipip.net)', '2021-04-27 03:06:06'),
(286, '92.118.160.49', '2021-04-27', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-04-27 04:24:48'),
(287, '207.46.13.37', '2021-04-27', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-27 05:17:29'),
(288, '107.151.182.62', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-27 05:50:28'),
(289, '167.248.133.55', '2021-04-27', NULL, '2021-04-27 06:03:57'),
(290, '122.228.19.80', '2021-04-27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-04-27 06:46:05'),
(291, '162.142.125.53', '2021-04-27', NULL, '2021-04-27 07:30:49'),
(292, '184.105.247.196', '2021-04-27', NULL, '2021-04-27 07:51:35'),
(293, '193.118.53.210', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-27 08:29:35'),
(294, '199.195.252.133', '2021-04-27', 'Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)', '2021-04-27 08:37:10'),
(295, '23.129.64.236', '2021-04-27', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-04-27 08:39:39'),
(296, '139.162.106.181', '2021-04-27', 'HTTP Banner Detection (https://security.ipip.net)', '2021-04-27 09:28:51'),
(297, '71.6.232.7', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '2021-04-27 09:28:56'),
(298, '109.94.164.13', '2021-04-27', 'Mozilla/5.0', '2021-04-27 09:50:35'),
(299, '183.136.225.14', '2021-04-27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-04-27 09:55:29'),
(300, '192.162.111.113', '2021-04-27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-27 10:04:22'),
(301, '138.246.253.24', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '2021-04-27 10:39:10'),
(302, '102.68.228.168', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4484.7 Safari/537.36', '2021-04-27 11:19:41'),
(303, '65.49.20.69', '2021-04-27', NULL, '2021-04-27 11:57:32'),
(304, '13.93.27.183', '2021-04-27', 'Mozilla/5.0 zgrab/0.x', '2021-04-27 11:58:08'),
(305, '139.59.187.221', '2021-04-27', NULL, '2021-04-27 12:07:40'),
(306, '162.62.133.40', '2021-04-27', NULL, '2021-04-27 12:32:36'),
(307, '192.241.214.104', '2021-04-27', 'Mozilla/5.0 zgrab/0.x', '2021-04-27 12:50:28'),
(308, '34.77.163.42', '2021-04-27', 'python-requests/2.25.1', '2021-04-27 12:55:41'),
(309, '192.241.192.103', '2021-04-27', 'Mozilla/5.0 zgrab/0.x', '2021-04-27 13:47:21'),
(310, '85.238.102.57', '2021-04-27', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', '2021-04-27 17:19:19'),
(311, '103.123.151.42', '2021-04-27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-27 18:23:35'),
(312, '60.217.72.12', '2021-04-27', 'Mozilla/5.0', '2021-04-27 19:44:54'),
(313, '51.178.240.0', '2021-04-27', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-27 19:56:47'),
(314, '75.176.162.154', '2021-04-27', NULL, '2021-04-27 20:34:09'),
(315, '162.142.125.55', '2021-04-27', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-04-27 20:48:23'),
(316, '192.35.168.176', '2021-04-27', 'Mozilla/5.0 zgrab/0.x', '2021-04-27 21:14:36'),
(317, '107.151.182.58', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-27 21:22:24'),
(318, '128.14.211.190', '2021-04-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-27 21:46:39'),
(319, '92.118.161.49', '2021-04-27', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-04-27 23:44:20'),
(320, '209.141.48.140', '2021-04-28', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:77.0) Gecko/20100101 Firefox/77.0', '2021-04-28 00:10:07'),
(321, '77.122.3.127', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-28 00:59:53'),
(322, '207.46.13.16', '2021-04-28', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-28 01:23:13'),
(323, '102.23.224.208', '2021-04-28', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-28 03:01:56'),
(324, '64.62.197.62', '2021-04-28', NULL, '2021-04-28 04:34:50'),
(325, '207.46.13.37', '2021-04-28', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-28 04:40:08'),
(326, '45.86.200.95', '2021-04-28', NULL, '2021-04-28 05:22:34'),
(327, '71.6.232.4', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '2021-04-28 06:27:47'),
(328, '186.33.127.32', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-28 07:03:59'),
(329, '178.73.215.171', '2021-04-28', NULL, '2021-04-28 07:06:16'),
(330, '104.140.188.26', '2021-04-28', 'https://gdnplus.com:Gather Analyze Provide.', '2021-04-28 07:30:57'),
(331, '45.143.147.173', '2021-04-28', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-28 09:53:45'),
(332, '45.133.1.233', '2021-04-28', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-28 10:09:20'),
(333, '37.79.216.87', '2021-04-28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-28 10:34:03'),
(334, '192.162.194.163', '2021-04-28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-28 11:02:15'),
(335, '195.9.192.50', '2021-04-28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-28 11:02:44'),
(336, '104.197.181.32', '2021-04-28', NULL, '2021-04-28 11:35:50'),
(337, '89.43.139.114', '2021-04-28', NULL, '2021-04-28 12:22:11'),
(338, '34.105.209.23', '2021-04-28', NULL, '2021-04-28 13:22:10'),
(339, '128.14.211.194', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-28 13:35:46'),
(340, '192.241.216.101', '2021-04-28', 'Mozilla/5.0 zgrab/0.x', '2021-04-28 14:22:40'),
(341, '64.62.197.212', '2021-04-28', NULL, '2021-04-28 14:24:37'),
(342, '171.217.141.92', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-28 14:38:11'),
(343, '128.14.133.58', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-28 14:46:15'),
(344, '192.241.221.126', '2021-04-28', 'Mozilla/5.0 zgrab/0.x', '2021-04-28 14:54:08'),
(345, '167.248.133.40', '2021-04-28', NULL, '2021-04-28 14:59:40'),
(346, '45.83.65.115', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '2021-04-28 15:16:06'),
(347, '102.68.225.232', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4484.7 Safari/537.36', '2021-04-28 15:25:16'),
(348, '209.141.33.74', '2021-04-28', 'Linux Gnu (cow)', '2021-04-28 16:43:43'),
(349, '54.184.239.200', '2021-04-28', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-28 16:55:49'),
(350, '192.248.187.241', '2021-04-28', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-28 17:22:03'),
(351, '77.247.110.199', '2021-04-28', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-28 17:26:38'),
(352, '162.142.125.53', '2021-04-28', NULL, '2021-04-28 19:25:12'),
(353, '94.73.4.54', '2021-04-28', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-28 19:47:06'),
(354, '94.73.4.54', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-28 19:47:06'),
(355, '102.68.229.15', '2021-04-28', 'Mozilla/5.0 (Linux; Android 10; MI CC 9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.181 Mobile Safari/537.36', '2021-04-28 20:27:18'),
(356, '80.82.77.192', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-04-28 22:12:15'),
(357, '162.62.133.40', '2021-04-28', NULL, '2021-04-28 22:29:03'),
(358, '103.91.92.225', '2021-04-28', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-28 23:49:13'),
(359, '74.120.14.56', '2021-04-29', NULL, '2021-04-29 00:22:31'),
(360, '207.46.13.16', '2021-04-29', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-29 00:49:40'),
(361, '107.1.208.106', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-29 01:47:54');
INSERT INTO `na_visits_ips` (`id`, `ip_address`, `date`, `user_agent`, `create_time`) VALUES
(362, '172.105.172.122', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-29 02:25:16'),
(363, '128.14.211.186', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-29 02:50:17'),
(364, '89.248.170.22', '2021-04-29', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-04-29 03:15:38'),
(365, '154.126.11.53', '2021-04-29', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:88.0) Gecko/20100101 Firefox/88.0', '2021-04-29 03:33:50'),
(366, '78.45.45.131', '2021-04-29', NULL, '2021-04-29 03:45:34'),
(367, '162.142.125.38', '2021-04-29', NULL, '2021-04-29 03:51:52'),
(368, '193.118.53.210', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-29 04:02:55'),
(369, '207.46.13.37', '2021-04-29', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-29 04:06:42'),
(370, '202.74.245.162', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-29 04:19:27'),
(371, '67.207.84.68', '2021-04-29', 'Mozilla/5.0 zgrab/0.x', '2021-04-29 04:39:31'),
(372, '186.33.118.110', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-29 05:00:33'),
(373, '39.111.208.132', '2021-04-29', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '2021-04-29 05:46:28'),
(374, '103.101.100.254', '2021-04-29', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-29 06:02:29'),
(375, '64.62.197.92', '2021-04-29', NULL, '2021-04-29 07:04:54'),
(376, '102.68.225.8', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4484.7 Safari/537.36', '2021-04-29 08:13:04'),
(377, '157.119.215.0', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-29 09:42:46'),
(378, '182.16.156.121', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-29 10:54:01'),
(379, '150.249.214.249', '2021-04-29', 'Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko', '2021-04-29 11:04:35'),
(380, '209.141.33.74', '2021-04-29', 'Linux Gnu (cow)', '2021-04-29 11:10:15'),
(381, '188.241.121.202', '2021-04-29', NULL, '2021-04-29 12:46:39'),
(382, '65.49.20.67', '2021-04-29', NULL, '2021-04-29 13:30:36'),
(383, '175.199.133.171', '2021-04-29', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '2021-04-29 13:31:37'),
(384, '144.126.134.15', '2021-04-29', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-29 13:39:49'),
(385, '193.142.59.209', '2021-04-29', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-29 14:02:09'),
(386, '41.204.110.241', '2021-04-29', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-04-29 14:12:26'),
(387, '176.125.35.185', '2021-04-29', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-29 14:45:39'),
(388, '79.8.70.162', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-29 16:25:21'),
(389, '192.241.215.108', '2021-04-29', 'Mozilla/5.0 zgrab/0.x', '2021-04-29 16:58:36'),
(390, '162.142.125.39', '2021-04-29', NULL, '2021-04-29 17:34:11'),
(391, '5.8.10.202', '2021-04-29', 'fasthttp', '2021-04-29 17:44:26'),
(392, '89.248.171.23', '2021-04-29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '2021-04-29 17:44:44'),
(393, '192.241.219.221', '2021-04-29', 'Mozilla/5.0 zgrab/0.x', '2021-04-29 17:59:44'),
(394, '137.117.78.252', '2021-04-29', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-29 18:31:10'),
(395, '188.134.71.220', '2021-04-29', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-29 18:54:09'),
(396, '74.120.14.39', '2021-04-29', NULL, '2021-04-29 19:08:44'),
(397, '34.76.80.167', '2021-04-29', 'python-requests/2.25.1', '2021-04-29 22:15:07'),
(398, '13.250.107.117', '2021-04-29', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:28.0) Gecko/20100101 Firefox/28.0', '2021-04-29 22:28:25'),
(399, '23.129.64.204', '2021-04-30', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-04-30 00:22:34'),
(400, '137.117.78.252', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4240.193 Safari/537.36', '2021-04-30 00:33:30'),
(401, '122.228.19.80', '2021-04-30', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-04-30 00:45:21'),
(402, '139.162.116.133', '2021-04-30', 'HTTP Banner Detection (https://security.ipip.net)', '2021-04-30 01:19:49'),
(403, '207.46.13.16', '2021-04-30', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-30 01:21:39'),
(404, '109.94.164.13', '2021-04-30', 'Mozilla/5.0', '2021-04-30 03:08:24'),
(405, '167.71.13.196', '2021-04-30', 'l9tcpid/0.4.0', '2021-04-30 04:00:20'),
(406, '92.118.161.29', '2021-04-30', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-04-30 04:17:25'),
(407, '207.46.13.37', '2021-04-30', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-04-30 04:37:28'),
(408, '183.136.225.14', '2021-04-30', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-04-30 05:01:11'),
(409, '138.99.216.147', '2021-04-30', '"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36"', '2021-04-30 05:23:21'),
(410, '216.218.206.69', '2021-04-30', NULL, '2021-04-30 05:29:17'),
(411, '145.255.6.162', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-30 05:37:43'),
(412, '13.250.107.117', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-30 05:48:08'),
(413, '209.141.48.140', '2021-04-30', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:77.0) Gecko/20100101 Firefox/77.0', '2021-04-30 06:00:02'),
(414, '185.183.15.48', '2021-04-30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-30 06:00:09'),
(415, '80.82.77.192', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-04-30 06:10:01'),
(416, '87.107.181.150', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-30 06:40:13'),
(417, '194.165.16.78', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2021-04-30 06:41:56'),
(418, '102.68.227.183', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4484.7 Safari/537.36', '2021-04-30 08:46:07'),
(419, '36.37.185.103', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-30 09:05:18'),
(420, '35.182.75.60', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-30 09:21:56'),
(421, '184.105.139.67', '2021-04-30', NULL, '2021-04-30 09:26:57'),
(422, '3.94.21.41', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-30 09:42:14'),
(423, '45.79.187.56', '2021-04-30', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0', '2021-04-30 10:03:53'),
(424, '178.239.198.76', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-30 10:11:32'),
(425, '128.14.211.190', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-30 10:12:44'),
(426, '5.54.190.162', '2021-04-30', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-30 10:31:51'),
(427, '104.237.151.11', '2021-04-30', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0', '2021-04-30 11:46:39'),
(428, '41.249.49.201', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-30 11:54:21'),
(429, '193.118.53.202', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-30 12:04:17'),
(430, '162.62.133.40', '2021-04-30', NULL, '2021-04-30 12:06:39'),
(431, '89.248.170.22', '2021-04-30', NULL, '2021-04-30 12:22:36'),
(432, '213.32.122.82', '2021-04-30', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-04-30 13:04:54'),
(433, '128.14.211.194', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-30 13:43:48'),
(434, '198.20.87.98', '2021-04-30', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-04-30 14:03:59'),
(435, '34.76.80.167', '2021-04-30', 'python-requests/2.25.1', '2021-04-30 14:04:15'),
(436, '178.73.215.171', '2021-04-30', NULL, '2021-04-30 14:09:27'),
(437, '193.118.53.194', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-30 14:16:10'),
(438, '221.2.163.231', '2021-04-30', 'Mozilla/5.0', '2021-04-30 14:18:20'),
(439, '104.224.28.85', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-30 14:30:25'),
(440, '167.71.226.231', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '2021-04-30 15:03:40'),
(441, '151.240.183.197', '2021-04-30', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-30 15:31:11'),
(442, '91.133.12.77', '2021-04-30', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-04-30 15:54:16'),
(443, '154.126.33.163', '2021-04-30', 'Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/14.0 Chrome/87.0.4280.141 Mobile Safari/537.36', '2021-04-30 16:14:39'),
(444, '107.151.182.62', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-30 17:04:36'),
(445, '202.191.125.181', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-04-30 17:21:59'),
(446, '193.142.59.209', '2021-04-30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-04-30 18:10:29'),
(447, '125.64.94.138', '2021-04-30', NULL, '2021-04-30 18:42:00'),
(448, '45.155.126.222', '2021-04-30', 'Mozilla/5.0 (compatible; tchelebi/1.0; +http://tchelebi.io)', '2021-04-30 19:24:09'),
(449, '128.14.211.186', '2021-04-30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-04-30 19:34:30'),
(450, '45.9.150.27', '2021-04-30', 'curl/7.66.0', '2021-04-30 20:29:49'),
(451, '189.41.6.45', '2021-04-30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-30 21:09:53'),
(452, '88.5.237.10', '2021-04-30', 'Mozilla/5.0 zgrab/0.x', '2021-04-30 21:16:31'),
(453, '54.198.176.200', '2021-04-30', 'Mozilla/5.0 (Windows NT 6.2;en-US) AppleWebKit/537.32.36 (KHTML, live Gecko) Chrome/51.0.3105.72 Safari/537.32', '2021-04-30 22:36:32'),
(454, '46.109.192.98', '2021-04-30', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-04-30 23:48:07'),
(455, '45.79.204.46', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-01 00:51:39'),
(456, '193.118.53.210', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-01 01:30:55'),
(457, '72.66.105.159', '2021-05-01', NULL, '2021-05-01 01:51:25'),
(458, '207.46.13.16', '2021-05-01', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-01 01:56:34'),
(459, '162.62.133.40', '2021-05-01', NULL, '2021-05-01 01:59:06'),
(460, '89.248.168.140', '2021-05-01', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-01 02:06:35'),
(461, '176.31.40.57', '2021-05-01', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-01 02:26:30'),
(462, '74.120.14.39', '2021-05-01', NULL, '2021-05-01 02:50:53'),
(463, '13.68.155.109', '2021-05-01', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-01 03:37:02'),
(464, '128.14.209.162', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-01 04:00:03'),
(465, '89.248.171.23', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36', '2021-05-01 04:16:37'),
(466, '64.62.197.2', '2021-05-01', NULL, '2021-05-01 04:35:45'),
(467, '207.46.13.37', '2021-05-01', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-01 05:12:41'),
(468, '66.240.236.119', '2021-05-01', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-01 05:12:59'),
(469, '34.77.163.42', '2021-05-01', 'python-requests/2.25.1', '2021-05-01 05:13:24'),
(470, '198.98.59.61', '2021-05-01', NULL, '2021-05-01 05:37:05'),
(471, '13.72.102.159', '2021-05-01', 'curl/7.58.0', '2021-05-01 07:16:53'),
(472, '92.118.160.17', '2021-05-01', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-01 07:44:00'),
(473, '101.255.85.114', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-01 08:19:50'),
(474, '92.118.160.5', '2021-05-01', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-01 08:57:17'),
(475, '180.149.125.175', '2021-05-01', 'Mozilla/5.0 (Windows NT 5.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2021-05-01 09:16:05'),
(476, '212.54.222.112', '2021-05-01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-01 09:45:13'),
(477, '213.16.63.201', '2021-05-01', 'curl/7.58.0', '2021-05-01 10:32:41'),
(478, '109.70.100.46', '2021-05-01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '2021-05-01 10:48:46'),
(479, '128.1.248.26', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-01 11:30:29'),
(480, '122.228.19.80', '2021-05-01', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-01 11:43:45'),
(481, '154.126.33.163', '2021-05-01', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15', '2021-05-01 12:11:22'),
(482, '112.171.130.213', '2021-05-01', NULL, '2021-05-01 12:27:15'),
(483, '88.5.237.10', '2021-05-01', 'Mozilla/5.0 zgrab/0.x', '2021-05-01 12:45:01'),
(484, '192.241.197.198', '2021-05-01', 'Mozilla/5.0 zgrab/0.x', '2021-05-01 12:57:54'),
(485, '192.241.214.143', '2021-05-01', 'Mozilla/5.0 zgrab/0.x', '2021-05-01 13:31:51'),
(486, '167.71.175.10', '2021-05-01', 'curl/7.58.0', '2021-05-01 14:28:35'),
(487, '184.105.247.194', '2021-05-01', NULL, '2021-05-01 15:13:41'),
(488, '202.62.57.138', '2021-05-01', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-01 16:03:38'),
(489, '154.126.10.195', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36', '2021-05-01 16:29:03'),
(490, '66.249.64.241', '2021-05-01', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-01 19:47:15'),
(491, '66.249.64.233', '2021-05-01', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-01 20:40:19'),
(492, '176.58.104.76', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-01 21:03:02'),
(493, '185.173.35.29', '2021-05-01', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-01 21:09:31'),
(494, '89.165.8.98', '2021-05-01', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-01 21:59:26'),
(495, '5.35.58.83', '2021-05-01', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', '2021-05-01 22:09:53'),
(496, '34.223.59.237', '2021-05-01', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '2021-05-01 22:18:57'),
(497, '40.122.106.211', '2021-05-01', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-01 23:37:38'),
(498, '71.6.146.185', '2021-05-02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-02 01:26:57'),
(499, '34.76.80.167', '2021-05-02', 'python-requests/2.25.1', '2021-05-02 01:27:32'),
(500, '91.236.177.162', '2021-05-02', 'curl/7.58.0', '2021-05-02 02:12:37'),
(501, '207.46.13.16', '2021-05-02', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-02 02:31:26'),
(502, '92.118.160.9', '2021-05-02', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-02 02:46:43'),
(503, '5.8.10.202', '2021-05-02', 'fasthttp', '2021-05-02 03:03:54'),
(504, '39.96.139.223', '2021-05-02', 'Go-http-client/1.1', '2021-05-02 03:49:10'),
(505, '39.96.139.223', '2021-05-02', 'Go-http-client/1.1', '2021-05-02 03:49:10'),
(506, '66.249.64.241', '2021-05-02', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-02 05:11:05'),
(507, '89.248.170.22', '2021-05-02', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-05-02 05:13:15'),
(508, '207.46.13.37', '2021-05-02', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-02 05:43:27'),
(509, '103.149.192.197', '2021-05-02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '2021-05-02 05:51:57'),
(510, '162.142.125.39', '2021-05-02', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-02 06:56:44'),
(511, '74.120.14.37', '2021-05-02', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-02 06:56:47'),
(512, '74.82.47.4', '2021-05-02', NULL, '2021-05-02 07:21:20'),
(513, '92.118.161.53', '2021-05-02', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-02 08:47:24'),
(514, '52.161.108.142', '2021-05-02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-02 08:51:02'),
(515, '71.6.146.186', '2021-05-02', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-02 10:10:09'),
(516, '34.77.163.42', '2021-05-02', 'python-requests/2.25.1', '2021-05-02 10:10:23'),
(517, '167.249.102.76', '2021-05-02', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-02 11:01:46'),
(518, '80.82.77.192', '2021-05-02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-05-02 11:03:43'),
(519, '66.249.64.231', '2021-05-02', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-02 12:33:15'),
(520, '3.94.21.41', '2021-05-02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-02 12:44:51'),
(521, '5.252.176.63', '2021-05-02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-02 13:15:19'),
(522, '203.159.80.30', '2021-05-02', 'Linux Gnu (cow)', '2021-05-02 13:23:14'),
(523, '185.173.35.49', '2021-05-02', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-02 13:35:38'),
(524, '162.62.133.40', '2021-05-02', NULL, '2021-05-02 13:41:32'),
(525, '89.248.168.108', '2021-05-02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-02 13:48:46'),
(526, '65.49.20.69', '2021-05-02', NULL, '2021-05-02 14:17:14'),
(527, '66.249.64.245', '2021-05-02', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-02 14:34:57'),
(528, '192.241.218.112', '2021-05-02', 'Mozilla/5.0 zgrab/0.x', '2021-05-02 14:38:11'),
(529, '192.241.217.36', '2021-05-02', 'Mozilla/5.0 zgrab/0.x', '2021-05-02 15:18:22'),
(530, '183.136.225.14', '2021-05-02', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-02 18:16:23'),
(531, '51.254.59.113', '2021-05-02', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-02 18:28:16'),
(532, '164.52.24.162', '2021-05-02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:79.0) Gecko/20100101 Firefox/79.0', '2021-05-02 21:01:03'),
(533, '107.150.63.171', '2021-05-02', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '2021-05-02 22:21:04'),
(534, '88.224.99.189', '2021-05-02', NULL, '2021-05-02 22:49:09'),
(535, '178.33.77.250', '2021-05-02', 'curl/7.58.0', '2021-05-02 23:53:11'),
(536, '162.142.125.37', '2021-05-03', NULL, '2021-05-03 00:25:02'),
(537, '198.20.99.130', '2021-05-03', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-03 00:59:10'),
(538, '34.77.163.42', '2021-05-03', 'python-requests/2.25.1', '2021-05-03 01:00:30'),
(539, '103.101.107.118', '2021-05-03', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-03 01:02:01'),
(540, '89.248.170.22', '2021-05-03', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-05-03 01:28:50'),
(541, '193.142.59.209', '2021-05-03', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-03 02:26:57'),
(542, '195.98.67.12', '2021-05-03', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-03 02:29:42'),
(543, '217.218.222.61', '2021-05-03', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-03 02:48:23'),
(544, '207.46.13.16', '2021-05-03', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-03 03:01:58'),
(545, '138.68.73.41', '2021-05-03', 'curl/7.58.0', '2021-05-03 03:18:15'),
(546, '207.46.13.37', '2021-05-03', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-03 04:19:53'),
(547, '167.248.133.56', '2021-05-03', NULL, '2021-05-03 04:26:59'),
(548, '178.32.197.85', '2021-05-03', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', '2021-05-03 04:31:36'),
(549, '167.248.133.55', '2021-05-03', NULL, '2021-05-03 04:59:00'),
(550, '54.153.81.215', '2021-05-03', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '2021-05-03 05:41:24'),
(551, '64.62.197.152', '2021-05-03', NULL, '2021-05-03 08:22:41'),
(552, '34.222.183.57', '2021-05-03', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '2021-05-03 08:24:28'),
(553, '54.81.187.158', '2021-05-03', 'Cloud mapping experiment. Contact research@pdrlabs.net', '2021-05-03 08:26:47'),
(554, '206.189.132.167', '2021-05-03', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-03 08:37:59'),
(555, '206.189.140.223', '2021-05-03', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-03 08:37:59'),
(556, '23.129.64.240', '2021-05-03', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-05-03 09:04:59'),
(557, '54.189.60.153', '2021-05-03', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-03 09:32:24'),
(558, '66.249.64.241', '2021-05-03', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-03 09:37:15'),
(559, '66.249.64.245', '2021-05-03', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-03 09:38:15'),
(560, '183.136.225.14', '2021-05-03', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-03 09:58:45'),
(561, '128.14.134.134', '2021-05-03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-03 10:14:55'),
(562, '128.14.141.34', '2021-05-03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-03 10:27:23'),
(563, '211.194.252.225', '2021-05-03', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '2021-05-03 11:00:51'),
(564, '102.68.230.151', '2021-05-03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4491.6 Safari/537.36', '2021-05-03 11:42:35'),
(565, '162.62.133.40', '2021-05-03', NULL, '2021-05-03 12:50:22'),
(566, '193.118.53.138', '2021-05-03', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36', '2021-05-03 17:09:27'),
(567, '178.128.221.174', '2021-05-03', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-03 17:29:42'),
(568, '178.128.81.108', '2021-05-03', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-03 17:29:57'),
(569, '65.49.20.69', '2021-05-03', NULL, '2021-05-03 19:42:47'),
(570, '80.82.77.192', '2021-05-03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-05-03 19:50:29'),
(571, '185.38.227.49', '2021-05-03', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-03 20:12:36'),
(572, '66.249.64.243', '2021-05-03', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-03 20:37:35'),
(573, '167.99.59.17', '2021-05-03', 'Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)', '2021-05-03 20:39:06'),
(574, '103.145.255.58', '2021-05-03', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-03 22:00:20'),
(575, '139.162.116.133', '2021-05-03', 'HTTP Banner Detection (https://security.ipip.net)', '2021-05-03 22:11:56'),
(576, '161.97.108.238', '2021-05-03', 'python-requests/2.6.0 CPython/2.7.5 Linux/3.10.0-1160.11.1.el7.x86_64', '2021-05-03 23:07:57'),
(577, '161.35.212.92', '2021-05-03', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', '2021-05-03 23:21:41'),
(578, '178.216.26.175', '2021-05-03', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-03 23:22:55'),
(579, '192.241.203.9', '2021-05-03', 'Mozilla/5.0 zgrab/0.x', '2021-05-03 23:23:04'),
(580, '71.6.232.7', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '2021-05-04 00:00:58'),
(581, '207.46.13.16', '2021-05-04', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-04 00:32:43'),
(582, '138.197.185.41', '2021-05-04', NULL, '2021-05-04 00:35:33'),
(583, '51.89.255.220', '2021-05-04', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-04 01:13:03'),
(584, '85.184.34.113', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-04 02:10:33'),
(585, '85.184.34.113', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-04 02:10:33'),
(586, '85.184.34.113', '2021-05-04', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-04 02:10:33'),
(587, '207.46.13.37', '2021-05-04', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-04 03:48:58'),
(588, '74.120.14.55', '2021-05-04', NULL, '2021-05-04 04:01:47'),
(589, '66.249.64.245', '2021-05-04', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-04 06:30:18'),
(590, '91.240.191.121', '2021-05-04', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-04 06:53:00'),
(591, '73.143.208.169', '2021-05-04', NULL, '2021-05-04 07:02:31'),
(592, '216.218.206.66', '2021-05-04', NULL, '2021-05-04 07:21:52'),
(593, '58.97.225.124', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-04 07:29:46'),
(594, '109.94.164.13', '2021-05-04', 'Mozilla/5.0', '2021-05-04 07:33:01'),
(595, '34.209.105.222', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '2021-05-04 07:43:39'),
(596, '34.230.156.67', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', '2021-05-04 07:43:40'),
(597, '52.15.212.3', '2021-05-04', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1866.237 Safari/537.36', '2021-05-04 07:44:19'),
(598, '18.221.206.247', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', '2021-05-04 07:45:59'),
(599, '18.197.125.181', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36', '2021-05-04 07:47:47'),
(600, '35.181.87.238', '2021-05-04', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36', '2021-05-04 07:49:27'),
(601, '34.236.18.197', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36', '2021-05-04 07:50:25'),
(602, '34.236.55.223', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-04 07:51:13'),
(603, '18.136.72.135', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2226.0 Safari/537.36', '2021-05-04 07:53:41'),
(604, '178.73.215.171', '2021-05-04', NULL, '2021-05-04 07:57:51'),
(605, '13.209.28.104', '2021-05-04', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36', '2021-05-04 08:07:01'),
(606, '212.83.146.233', '2021-05-04', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:58.0) Gecko/20100101 Firefox/58.0', '2021-05-04 08:38:00'),
(607, '66.249.64.237', '2021-05-04', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-04 08:42:33'),
(608, '66.249.64.243', '2021-05-04', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-04 08:50:31'),
(609, '31.210.20.102', '2021-05-04', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-04 08:54:17'),
(610, '213.16.63.201', '2021-05-04', 'curl/7.58.0', '2021-05-04 08:56:48'),
(611, '197.158.119.49', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-04 09:31:52'),
(612, '102.185.84.109', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-04 10:06:11'),
(613, '34.76.80.167', '2021-05-04', 'python-requests/2.25.1', '2021-05-04 10:27:58'),
(614, '172.105.189.111', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-04 10:31:49'),
(615, '43.255.39.51', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.1 (KHTML, like Gecko) Chrome/22.0.1207.1 Safari/537.1', '2021-05-04 11:11:54'),
(616, '139.162.215.70', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-04 11:33:04'),
(617, '122.228.19.80', '2021-05-04', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-04 13:12:19'),
(618, '162.62.133.40', '2021-05-04', NULL, '2021-05-04 13:36:41'),
(619, '184.105.247.194', '2021-05-04', NULL, '2021-05-04 13:57:40'),
(620, '186.33.107.66', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-04 14:30:51'),
(621, '74.120.14.53', '2021-05-04', NULL, '2021-05-04 15:15:42'),
(622, '181.210.45.42', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-04 15:23:24'),
(623, '138.246.253.24', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '2021-05-04 15:24:34'),
(624, '35.246.248.95', '2021-05-04', NULL, '2021-05-04 15:54:27'),
(625, '66.249.64.241', '2021-05-04', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-04 16:08:18'),
(626, '167.248.133.55', '2021-05-04', NULL, '2021-05-04 16:41:56'),
(627, '91.60.62.107', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-04 17:08:59'),
(628, '102.68.229.29', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4491.6 Safari/537.36', '2021-05-04 17:17:17'),
(629, '3.8.12.221', '2021-05-04', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2117.157 Safari/537.36', '2021-05-04 17:23:53'),
(630, '35.183.60.188', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1464.0 Safari/537.36', '2021-05-04 17:23:55'),
(631, '54.176.188.51', '2021-05-04', 'Mozilla/5.0 (Windows NT 4.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36', '2021-05-04 17:24:33'),
(632, '13.124.222.242', '2021-05-04', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2117.157 Safari/537.36', '2021-05-04 17:26:25'),
(633, '3.8.68.2', '2021-05-04', 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', '2021-05-04 17:27:05'),
(634, '54.250.87.247', '2021-05-04', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.3319.102 Safari/537.36', '2021-05-04 17:28:32'),
(635, '18.184.155.204', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1464.0 Safari/537.36', '2021-05-04 17:31:00'),
(636, '54.178.182.46', '2021-05-04', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-04 17:31:11'),
(637, '35.178.16.1', '2021-05-04', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36', '2021-05-04 17:31:44'),
(638, '34.151.71.183', '2021-05-04', NULL, '2021-05-04 18:33:37'),
(639, '162.142.125.38', '2021-05-04', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-04 18:53:32'),
(640, '3.94.21.41', '2021-05-04', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-04 19:11:04'),
(641, '193.118.53.194', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-04 19:23:43'),
(642, '162.142.125.39', '2021-05-04', NULL, '2021-05-04 19:34:16'),
(643, '5.235.234.224', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-04 19:34:26'),
(644, '154.126.33.163', '2021-05-04', 'Mozilla/5.0 (Linux; Android 9; SM-G9500) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36', '2021-05-04 19:36:15'),
(645, '128.14.141.34', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-04 20:19:49'),
(646, '112.133.83.161', '2021-05-04', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', '2021-05-04 21:07:21'),
(647, '193.118.53.202', '2021-05-04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-04 22:26:08'),
(648, '194.62.6.212', '2021-05-04', NULL, '2021-05-04 23:32:56'),
(649, '162.62.133.40', '2021-05-05', NULL, '2021-05-05 00:11:30'),
(650, '192.241.214.193', '2021-05-05', 'Mozilla/5.0 zgrab/0.x', '2021-05-05 01:10:08'),
(651, '66.249.64.241', '2021-05-05', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-05 01:19:50'),
(652, '192.241.218.16', '2021-05-05', 'Mozilla/5.0 zgrab/0.x', '2021-05-05 01:46:35'),
(653, '207.46.13.37', '2021-05-05', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-05 02:11:24'),
(654, '23.251.102.74', '2021-05-05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-05 03:24:18'),
(655, '192.241.216.243', '2021-05-05', 'Mozilla/5.0 zgrab/0.x', '2021-05-05 04:00:09'),
(656, '185.173.35.37', '2021-05-05', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-05 04:38:42'),
(657, '64.62.197.182', '2021-05-05', NULL, '2021-05-05 05:16:30'),
(658, '128.1.248.26', '2021-05-05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-05 05:30:20'),
(659, '71.6.232.4', '2021-05-05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '2021-05-05 05:37:30'),
(660, '167.99.51.191', '2021-05-05', 'Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)', '2021-05-05 05:49:04'),
(661, '167.99.122.150', '2021-05-05', 'Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)', '2021-05-05 05:56:32'),
(662, '192.35.168.112', '2021-05-05', 'Mozilla/5.0 zgrab/0.x', '2021-05-05 07:01:20'),
(663, '167.99.60.152', '2021-05-05', 'Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)', '2021-05-05 07:26:24'),
(664, '207.46.13.16', '2021-05-05', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-05 08:17:56'),
(665, '203.159.80.75', '2021-05-05', 'Linux Gnu (cow)', '2021-05-05 08:37:13'),
(666, '13.68.204.69', '2021-05-05', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-05 08:51:40'),
(667, '185.233.186.56', '2021-05-05', NULL, '2021-05-05 09:25:47'),
(668, '186.33.76.226', '2021-05-05', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-05 11:46:19'),
(669, '91.236.177.162', '2021-05-05', 'curl/7.58.0', '2021-05-05 13:17:06'),
(670, '184.105.247.195', '2021-05-05', NULL, '2021-05-05 14:39:08'),
(671, '66.249.64.237', '2021-05-05', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-05 15:14:31'),
(672, '66.249.64.229', '2021-05-05', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.84 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-05 16:05:23'),
(673, '92.118.160.53', '2021-05-05', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-05 17:19:36'),
(674, '3.80.88.29', '2021-05-05', 'Mozilla/5.0 (Windows NT 6.2;en-US) AppleWebKit/537.32.36 (KHTML, live Gecko) Chrome/59.0.3067.89 Safari/537.32', '2021-05-05 17:24:25'),
(675, '128.14.209.162', '2021-05-05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-05 19:01:02'),
(676, '18.195.51.132', '2021-05-05', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-05 19:37:05'),
(677, '154.126.11.148', '2021-05-05', 'Mozilla/5.0 (Linux; Android 9; SAMSUNG SM-G9500) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/14.0 Chrome/87.0.4280.141 Mobile Safari/537.36', '2021-05-05 20:16:04'),
(678, '196.207.242.20', '2021-05-05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-05 20:20:33'),
(679, '85.203.44.152', '2021-05-05', NULL, '2021-05-05 20:44:22'),
(680, '136.144.209.97', '2021-05-05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2021-05-05 20:44:27'),
(681, '135.181.252.234', '2021-05-05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2021-05-05 20:54:13'),
(682, '74.120.14.55', '2021-05-05', NULL, '2021-05-05 21:22:47'),
(683, '103.227.118.45', '2021-05-05', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-05 21:28:08'),
(684, '85.214.85.206', '2021-05-05', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-05 21:57:26'),
(685, '1.170.230.41', '2021-05-05', 'Mozilla/5.0 zgrab/0.x', '2021-05-05 22:21:27'),
(686, '80.82.77.192', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-05-06 00:31:56'),
(687, '102.67.2.145', '2021-05-06', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-06 01:06:57'),
(688, '66.249.64.237', '2021-05-06', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-06 02:02:38'),
(689, '66.249.64.245', '2021-05-06', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-06 02:26:01'),
(690, '46.101.86.11', '2021-05-06', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-05-06 02:41:53'),
(691, '207.46.13.37', '2021-05-06', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-06 02:42:38'),
(692, '104.140.188.54', '2021-05-06', 'https://gdnplus.com:Gather Analyze Provide.', '2021-05-06 03:15:37'),
(693, '162.62.133.40', '2021-05-06', NULL, '2021-05-06 04:57:22'),
(694, '66.249.64.233', '2021-05-06', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-06 05:07:06'),
(695, '64.62.197.182', '2021-05-06', NULL, '2021-05-06 05:27:38'),
(696, '202.79.49.8', '2021-05-06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-06 06:13:37'),
(697, '23.129.64.206', '2021-05-06', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-05-06 06:24:15'),
(698, '125.64.94.138', '2021-05-06', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4 240.111 Safari/537.36', '2021-05-06 06:43:03'),
(699, '66.249.64.241', '2021-05-06', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-06 06:43:27'),
(700, '139.59.85.226', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '2021-05-06 07:43:09'),
(701, '192.241.202.181', '2021-05-06', 'Mozilla/5.0 zgrab/0.x', '2021-05-06 07:48:49'),
(702, '20.43.33.47', '2021-05-06', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-06 07:50:18'),
(703, '207.46.13.16', '2021-05-06', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-06 08:50:21'),
(704, '35.237.35.178', '2021-05-06', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0', '2021-05-06 08:57:46'),
(705, '74.120.14.53', '2021-05-06', NULL, '2021-05-06 09:08:30'),
(706, '128.1.248.42', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-06 10:00:23'),
(707, '162.142.125.54', '2021-05-06', NULL, '2021-05-06 10:32:33'),
(708, '102.68.228.14', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4496.3 Safari/537.36', '2021-05-06 10:40:11'),
(709, '45.83.67.158', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '2021-05-06 11:27:37'),
(710, '104.152.52.25', '2021-05-06', 'masscan/1.0 (https://github.com/robertdavidgraham/masscan)', '2021-05-06 11:56:11'),
(711, '151.238.154.36', '2021-05-06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-06 11:56:14'),
(712, '196.207.242.20', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-06 12:03:01'),
(713, '186.33.96.27', '2021-05-06', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-06 12:37:51'),
(714, '107.189.1.220', '2021-05-06', 'Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)', '2021-05-06 13:30:57'),
(715, '192.53.170.163', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-06 14:04:44'),
(716, '167.248.133.37', '2021-05-06', NULL, '2021-05-06 14:58:20');
INSERT INTO `na_visits_ips` (`id`, `ip_address`, `date`, `user_agent`, `create_time`) VALUES
(717, '66.249.64.229', '2021-05-06', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-06 15:30:45'),
(718, '172.105.161.246', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-06 15:32:07'),
(719, '185.165.190.17', '2021-05-06', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-06 16:09:40'),
(720, '34.77.163.42', '2021-05-06', 'python-requests/2.25.1', '2021-05-06 16:10:09'),
(721, '128.14.134.134', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-06 16:26:29'),
(722, '162.142.125.55', '2021-05-06', NULL, '2021-05-06 16:36:13'),
(723, '65.49.20.69', '2021-05-06', NULL, '2021-05-06 16:59:24'),
(724, '195.98.67.12', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-06 17:05:44'),
(725, '34.76.80.167', '2021-05-06', 'python-requests/2.25.1', '2021-05-06 19:30:25'),
(726, '128.14.141.34', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-06 22:20:41'),
(727, '41.82.49.33', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-06 22:53:39'),
(728, '183.136.225.14', '2021-05-06', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-06 23:07:30'),
(729, '49.12.13.123', '2021-05-06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36', '2021-05-06 23:21:53'),
(730, '207.46.13.37', '2021-05-07', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-07 00:23:44'),
(731, '177.29.159.59', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-07 01:14:16'),
(732, '177.125.56.120', '2021-05-07', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-07 01:20:22'),
(733, '46.101.156.20', '2021-05-07', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-07 01:41:49'),
(734, '206.189.132.167', '2021-05-07', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-07 01:46:36'),
(735, '154.126.33.163', '2021-05-07', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Safari/605.1.15', '2021-05-07 02:12:13'),
(736, '66.249.64.237', '2021-05-07', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-07 02:25:14'),
(737, '41.82.49.33', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-07 02:27:22'),
(738, '128.14.134.170', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-07 02:35:28'),
(739, '66.249.64.241', '2021-05-07', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-07 03:52:34'),
(740, '162.62.133.40', '2021-05-07', NULL, '2021-05-07 03:58:48'),
(741, '216.218.206.69', '2021-05-07', NULL, '2021-05-07 04:08:38'),
(742, '51.103.16.254', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 04:14:10'),
(743, '45.143.145.26', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 04:16:16'),
(744, '103.110.36.208', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-07 04:40:43'),
(745, '191.101.132.8', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 05:00:43'),
(746, '35.204.86.138', '2021-05-07', 'Mozilla/5.0', '2021-05-07 05:03:52'),
(747, '107.150.63.173', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '2021-05-07 05:18:22'),
(748, '15.165.13.147', '2021-05-07', 'Mozilla/5.0 zgrab/0.x', '2021-05-07 05:22:01'),
(749, '128.1.248.42', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-07 05:40:51'),
(750, '125.64.94.136', '2021-05-07', NULL, '2021-05-07 05:54:46'),
(751, '121.5.3.85', '2021-05-07', 'Mozilla/5.0 (Windows; U; Windows NT 6.0;en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6)', '2021-05-07 05:59:04'),
(752, '178.73.215.171', '2021-05-07', NULL, '2021-05-07 06:01:59'),
(753, '207.46.13.16', '2021-05-07', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-07 06:37:05'),
(754, '34.241.77.13', '2021-05-07', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2309.372 Safari/537.36', '2021-05-07 07:00:31'),
(755, '35.178.16.1', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '2021-05-07 07:01:00'),
(756, '54.176.188.51', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '2021-05-07 07:01:25'),
(757, '34.237.4.205', '2021-05-07', 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', '2021-05-07 07:03:28'),
(758, '18.231.94.162', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1500.55 Safari/537.36', '2021-05-07 07:05:23'),
(759, '52.64.20.252', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36', '2021-05-07 07:05:27'),
(760, '170.130.187.14', '2021-05-07', 'https://gdnplus.com:Gather Analyze Provide.', '2021-05-07 07:05:47'),
(761, '52.42.79.222', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36', '2021-05-07 07:07:45'),
(762, '3.8.12.221', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.2 Safari/537.36', '2021-05-07 07:08:26'),
(763, '13.124.222.242', '2021-05-07', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', '2021-05-07 07:08:32'),
(764, '34.251.241.226', '2021-05-07', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.3319.102 Safari/537.36', '2021-05-07 07:10:49'),
(765, '13.53.64.97', '2021-05-07', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.16 Safari/537.36', '2021-05-07 07:12:04'),
(766, '193.118.55.162', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.117 Safari/537.36', '2021-05-07 07:17:48'),
(767, '109.94.164.13', '2021-05-07', 'Mozilla/5.0', '2021-05-07 07:20:52'),
(768, '35.180.147.121', '2021-05-07', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', '2021-05-07 07:28:10'),
(769, '102.68.228.245', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4496.3 Safari/537.36', '2021-05-07 08:09:31'),
(770, '185.118.166.207', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 08:09:33'),
(771, '213.16.63.201', '2021-05-07', 'curl/7.58.0', '2021-05-07 08:17:24'),
(772, '104.140.188.46', '2021-05-07', 'https://gdnplus.com:Gather Analyze Provide.', '2021-05-07 08:34:54'),
(773, '118.126.65.27', '2021-05-07', 'Mozilla/5.0 zgrab/0.x', '2021-05-07 08:42:33'),
(774, '82.156.185.91', '2021-05-07', 'Mozilla/5.0 (Linux; Android 10; LIO-AN00 Build/HUAWEILIO-AN00; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.62 XWEB/2692 MMWEBSDK/200901 Mobile Safari/537.36', '2021-05-07 08:48:05'),
(775, '80.82.77.192', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-05-07 08:59:14'),
(776, '64.62.197.152', '2021-05-07', NULL, '2021-05-07 09:39:03'),
(777, '178.33.77.250', '2021-05-07', 'curl/7.58.0', '2021-05-07 09:46:10'),
(778, '52.152.226.202', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 11:11:25'),
(779, '103.206.31.2', '2021-05-07', 'curl/7.58.0', '2021-05-07 11:16:07'),
(780, '213.32.122.82', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-07 12:12:00'),
(781, '172.98.77.144', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 12:27:06'),
(782, '185.142.236.40', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-07 12:36:38'),
(783, '34.76.80.167', '2021-05-07', 'python-requests/2.25.1', '2021-05-07 12:38:01'),
(784, '18.157.179.218', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 12:53:54'),
(785, '68.149.117.177', '2021-05-07', NULL, '2021-05-07 12:58:05'),
(786, '40.117.190.154', '2021-05-07', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_8; en-us) AppleWebKit/534.50 (KHTML, like Gecko) Version/5.1 Safari/534.50', '2021-05-07 12:58:51'),
(787, '69.173.213.212', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-07 12:59:06'),
(788, '203.159.80.75', '2021-05-07', 'Linux Gnu (cow)', '2021-05-07 13:08:32'),
(789, '85.113.47.40', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-07 13:24:08'),
(790, '128.1.248.26', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-07 13:36:34'),
(791, '88.5.237.10', '2021-05-07', 'Mozilla/5.0 zgrab/0.x', '2021-05-07 13:57:28'),
(792, '192.241.218.115', '2021-05-07', 'Mozilla/5.0 zgrab/0.x', '2021-05-07 13:59:27'),
(793, '102.16.9.94', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-07 14:25:22'),
(794, '31.210.20.102', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 14:43:12'),
(795, '201.157.202.222', '2021-05-07', 'curl/7.58.0', '2021-05-07 15:16:41'),
(796, '139.59.76.204', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:82.0) Gecko/20100101 Firefox/82.0', '2021-05-07 15:18:20'),
(797, '192.241.221.13', '2021-05-07', 'Mozilla/5.0 zgrab/0.x', '2021-05-07 15:22:28'),
(798, '128.14.134.134', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-07 16:37:02'),
(799, '52.60.189.115', '2021-05-07', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.16 Safari/537.36', '2021-05-07 17:06:53'),
(800, '18.136.72.135', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-05-07 17:09:24'),
(801, '13.236.114.230', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.4; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-05-07 17:11:06'),
(802, '188.253.55.143', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-07 17:11:36'),
(803, '52.30.16.188', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36', '2021-05-07 17:13:23'),
(804, '34.236.55.223', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-05-07 17:13:38'),
(805, '23.92.16.48', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:8.0) Gecko/20100101 Firefox/8.0', '2021-05-07 17:14:02'),
(806, '18.197.125.181', '2021-05-07', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2117.157 Safari/537.36', '2021-05-07 17:14:27'),
(807, '13.73.22.8', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 17:14:44'),
(808, '13.233.73.212', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1500.55 Safari/537.36', '2021-05-07 17:18:05'),
(809, '193.56.29.155', '2021-05-07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-07 17:22:00'),
(810, '41.77.128.10', '2021-05-07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-07 17:25:52'),
(811, '78.187.168.108', '2021-05-07', NULL, '2021-05-07 19:02:06'),
(812, '178.128.93.138', '2021-05-07', 'curl/7.58.0', '2021-05-07 19:40:57'),
(813, '193.118.53.210', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-07 21:23:46'),
(814, '185.74.60.125', '2021-05-07', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-07 21:46:08'),
(815, '178.93.35.48', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-07 22:28:04'),
(816, '66.249.66.75', '2021-05-07', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-07 22:56:16'),
(817, '66.249.66.72', '2021-05-07', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-07 23:07:46'),
(818, '66.249.66.74', '2021-05-07', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-07 23:12:01'),
(819, '66.249.66.68', '2021-05-07', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-07 23:21:59'),
(820, '128.14.141.34', '2021-05-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-07 23:25:32'),
(821, '185.19.85.168', '2021-05-08', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-08 00:07:08'),
(822, '178.33.77.250', '2021-05-08', 'curl/7.58.0', '2021-05-08 00:08:06'),
(823, '139.162.106.181', '2021-05-08', 'HTTP Banner Detection (https://security.ipip.net)', '2021-05-08 00:23:28'),
(824, '167.248.133.53', '2021-05-08', NULL, '2021-05-08 00:27:13'),
(825, '205.185.117.222', '2021-05-08', 'Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)', '2021-05-08 00:46:01'),
(826, '197.157.195.250', '2021-05-08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-08 00:53:19'),
(827, '46.98.29.52', '2021-05-08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-08 01:22:37'),
(828, '207.46.13.37', '2021-05-08', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-08 01:22:38'),
(829, '167.248.133.39', '2021-05-08', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-08 02:07:12'),
(830, '45.5.202.125', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-08 02:15:49'),
(831, '128.14.133.58', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-08 02:33:49'),
(832, '88.152.56.254', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-08 02:34:24'),
(833, '194.49.68.10', '2021-05-08', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-08 02:42:23'),
(834, '193.118.53.194', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-08 03:08:27'),
(835, '136.144.209.97', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', '2021-05-08 03:21:48'),
(836, '45.155.126.230', '2021-05-08', 'masscan/1.0 (https://github.com/robertdavidgraham/masscan)', '2021-05-08 03:39:00'),
(837, '167.71.175.10', '2021-05-08', 'curl/7.58.0', '2021-05-08 03:59:39'),
(838, '172.245.71.145', '2021-05-08', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-05-08 04:47:56'),
(839, '201.54.126.231', '2021-05-08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-08 06:07:19'),
(840, '104.140.188.6', '2021-05-08', 'https://gdnplus.com:Gather Analyze Provide.', '2021-05-08 06:28:10'),
(841, '180.149.125.175', '2021-05-08', 'Mozilla/5.0 (Windows NT 5.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2021-05-08 06:37:15'),
(842, '213.16.63.201', '2021-05-08', 'curl/7.58.0', '2021-05-08 06:58:54'),
(843, '207.46.13.16', '2021-05-08', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-08 08:00:58'),
(844, '66.249.66.75', '2021-05-08', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-08 08:13:23'),
(845, '66.249.66.72', '2021-05-08', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-08 08:13:24'),
(846, '66.249.66.74', '2021-05-08', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-08 08:23:15'),
(847, '66.249.66.70', '2021-05-08', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-08 08:55:01'),
(848, '23.251.102.74', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-08 09:27:06'),
(849, '124.71.192.163', '2021-05-08', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0) Gecko/20100101 Firefox/78.0', '2021-05-08 10:01:53'),
(850, '80.82.77.62', '2021-05-08', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-08 10:54:16'),
(851, '109.94.164.13', '2021-05-08', 'Mozilla/5.0', '2021-05-08 12:12:00'),
(852, '64.62.197.32', '2021-05-08', NULL, '2021-05-08 12:43:56'),
(853, '41.82.49.33', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-08 13:20:26'),
(854, '154.126.33.163', '2021-05-08', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15', '2021-05-08 13:25:20'),
(855, '128.14.134.170', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-08 13:30:18'),
(856, '85.214.20.215', '2021-05-08', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-08 14:25:32'),
(857, '107.189.1.220', '2021-05-08', 'Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)', '2021-05-08 15:32:46'),
(858, '185.15.21.69', '2021-05-08', 'Mozilla/5.0', '2021-05-08 15:55:22'),
(859, '66.249.66.73', '2021-05-08', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-08 17:46:46'),
(860, '66.249.66.69', '2021-05-08', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-08 18:08:07'),
(861, '36.255.85.205', '2021-05-08', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-08 19:40:42'),
(862, '77.89.228.66', '2021-05-08', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', '2021-05-08 20:33:20'),
(863, '128.14.134.134', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-08 21:19:52'),
(864, '128.14.209.162', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-08 22:14:09'),
(865, '128.14.141.34', '2021-05-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-08 23:00:15'),
(866, '167.248.133.37', '2021-05-08', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-08 23:12:00'),
(867, '45.143.99.69', '2021-05-09', 'Go-http-client/1.1', '2021-05-09 00:33:05'),
(868, '93.99.65.138', '2021-05-09', NULL, '2021-05-09 00:47:06'),
(869, '66.249.66.72', '2021-05-09', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 02:10:11'),
(870, '66.249.66.75', '2021-05-09', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 02:10:17'),
(871, '66.249.66.74', '2021-05-09', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 02:10:37'),
(872, '198.20.70.114', '2021-05-09', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-09 02:45:46'),
(873, '34.77.163.42', '2021-05-09', 'python-requests/2.25.1', '2021-05-09 02:46:02'),
(874, '2.179.123.128', '2021-05-09', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-09 03:05:56'),
(875, '2.179.123.128', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-09 03:05:56'),
(876, '183.136.225.14', '2021-05-09', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-09 03:12:04'),
(877, '66.249.66.69', '2021-05-09', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 03:13:04'),
(878, '115.134.118.208', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-09 03:39:18'),
(879, '109.94.164.13', '2021-05-09', 'Mozilla/5.0', '2021-05-09 03:40:42'),
(880, '174.138.2.140', '2021-05-09', 'WinHttpClient', '2021-05-09 03:48:02'),
(881, '128.1.248.42', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-09 04:20:54'),
(882, '162.142.125.39', '2021-05-09', NULL, '2021-05-09 04:29:11'),
(883, '192.241.214.239', '2021-05-09', 'Mozilla/5.0 zgrab/0.x', '2021-05-09 05:50:18'),
(884, '61.7.138.170', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-09 05:53:17'),
(885, '64.62.197.62', '2021-05-09', NULL, '2021-05-09 06:08:40'),
(886, '192.241.216.153', '2021-05-09', 'Mozilla/5.0 zgrab/0.x', '2021-05-09 06:42:26'),
(887, '193.142.146.84', '2021-05-09', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-05-09 07:52:29'),
(888, '89.19.180.90', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-09 08:37:35'),
(889, '207.46.13.16', '2021-05-09', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-09 09:04:22'),
(890, '185.220.101.24', '2021-05-09', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-05-09 09:33:57'),
(891, '66.249.66.76', '2021-05-09', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 11:12:05'),
(892, '66.249.66.73', '2021-05-09', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 11:12:07'),
(893, '51.255.3.45', '2021-05-09', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-09 11:14:29'),
(894, '194.62.6.212', '2021-05-09', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-05-09 12:19:39'),
(895, '184.105.139.67', '2021-05-09', NULL, '2021-05-09 12:25:25'),
(896, '162.221.192.26', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-09 12:47:14'),
(897, '5.35.58.83', '2021-05-09', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', '2021-05-09 12:59:12'),
(898, '80.82.77.192', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-05-09 13:40:59'),
(899, '109.195.243.100', '2021-05-09', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-09 13:50:41'),
(900, '45.233.247.30', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-09 14:06:41'),
(901, '89.248.168.138', '2021-05-09', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-09 14:15:31'),
(902, '207.46.13.37', '2021-05-09', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-09 14:17:15'),
(903, '161.97.108.238', '2021-05-09', 'python-requests/2.6.0 CPython/2.7.5 Linux/3.10.0-1160.11.1.el7.x86_64', '2021-05-09 14:20:37'),
(904, '46.101.91.209', '2021-05-09', 'WinHttpClient', '2021-05-09 15:33:44'),
(905, '128.1.248.26', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-09 15:36:48'),
(906, '138.68.161.204', '2021-05-09', 'curl/7.58.0', '2021-05-09 15:51:32'),
(907, '167.99.149.168', '2021-05-09', 'httpx - Open-source project (github.com/projectdiscovery/httpx)', '2021-05-09 15:53:28'),
(908, '196.206.90.28', '2021-05-09', 'python-requests/2.24.0', '2021-05-09 16:10:00'),
(909, '35.180.204.254', '2021-05-09', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2021-05-09 16:11:39'),
(910, '203.159.80.75', '2021-05-09', 'Linux Gnu (cow)', '2021-05-09 16:30:15'),
(911, '186.211.101.82', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-09 18:24:36'),
(912, '162.62.123.46', '2021-05-09', NULL, '2021-05-09 20:12:34'),
(913, '66.249.64.241', '2021-05-09', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 20:13:54'),
(914, '66.249.64.239', '2021-05-09', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 20:14:53'),
(915, '102.68.224.62', '2021-05-09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4496.3 Safari/537.36', '2021-05-09 20:59:25'),
(916, '205.185.117.222', '2021-05-09', 'Mozilla/5.0 (compatible, MSIE 10.0, Windows NT, DigExt)', '2021-05-09 21:01:37'),
(917, '66.249.64.38', '2021-05-09', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-09 21:26:47'),
(918, '2.55.126.172', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-10 00:34:11'),
(919, '91.236.177.162', '2021-05-10', 'curl/7.58.0', '2021-05-10 00:56:27'),
(920, '103.206.31.2', '2021-05-10', 'curl/7.58.0', '2021-05-10 01:01:27'),
(921, '66.249.64.237', '2021-05-10', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-10 02:07:49'),
(922, '36.68.10.166', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-10 02:20:50'),
(923, '74.120.14.37', '2021-05-10', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-10 03:35:45'),
(924, '207.46.13.37', '2021-05-10', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-10 04:02:49'),
(925, '92.118.160.5', '2021-05-10', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-10 04:11:36'),
(926, '92.118.160.37', '2021-05-10', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-10 05:10:08'),
(927, '66.249.64.241', '2021-05-10', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-10 05:27:46'),
(928, '162.142.125.121', '2021-05-10', NULL, '2021-05-10 05:42:13'),
(929, '64.62.197.212', '2021-05-10', NULL, '2021-05-10 06:00:44'),
(930, '193.142.146.84', '2021-05-10', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-05-10 06:35:40'),
(931, '66.249.64.233', '2021-05-10', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-10 06:40:36'),
(932, '162.62.123.46', '2021-05-10', NULL, '2021-05-10 06:45:21'),
(933, '102.68.231.238', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4496.3 Safari/537.36', '2021-05-10 06:50:53'),
(934, '186.33.79.14', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', '2021-05-10 07:43:48'),
(935, '51.254.59.113', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-10 07:45:46'),
(936, '2.189.33.94', '2021-05-10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', '2021-05-10 08:18:58'),
(937, '154.126.11.234', '2021-05-10', 'Mozilla/5.0 (Linux; Android 9; SM-G9500) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.91 Mobile Safari/537.36', '2021-05-10 09:15:16'),
(938, '207.46.13.16', '2021-05-10', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-10 10:08:47'),
(939, '192.241.218.175', '2021-05-10', 'Mozilla/5.0 zgrab/0.x', '2021-05-10 11:23:55'),
(940, '13.124.222.242', '2021-05-10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', '2021-05-10 11:30:07'),
(941, '52.64.20.252', '2021-05-10', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.2309.372 Safari/537.36', '2021-05-10 11:30:27'),
(942, '34.236.18.197', '2021-05-10', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', '2021-05-10 11:30:44'),
(943, '34.236.202.207', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36', '2021-05-10 11:30:55'),
(944, '34.215.69.55', '2021-05-10', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2224.3 Safari/537.36', '2021-05-10 11:31:11'),
(945, '34.230.156.67', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.17 Safari/537.36', '2021-05-10 11:31:56'),
(946, '35.183.60.188', '2021-05-10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', '2021-05-10 11:33:35'),
(947, '13.53.208.18', '2021-05-10', 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', '2021-05-10 11:34:16'),
(948, '52.60.189.115', '2021-05-10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36', '2021-05-10 11:38:58'),
(949, '34.236.55.223', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1464.0 Safari/537.36', '2021-05-10 11:39:12'),
(950, '34.237.4.205', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1667.0 Safari/537.36', '2021-05-10 11:39:45'),
(951, '34.241.77.13', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '2021-05-10 11:58:29'),
(952, '154.120.176.70', '2021-05-10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15', '2021-05-10 14:30:35'),
(953, '92.118.160.1', '2021-05-10', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-10 14:59:17'),
(954, '92.118.160.9', '2021-05-10', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-10 15:10:47'),
(955, '41.190.239.121', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', '2021-05-10 15:52:00'),
(956, '71.6.232.7', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '2021-05-10 16:17:46'),
(957, '139.99.8.204', '2021-05-10', 'curl/7.29.0', '2021-05-10 16:30:23'),
(958, '128.14.141.34', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-10 16:53:24'),
(959, '23.251.102.74', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-10 18:24:41'),
(960, '172.105.189.111', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-10 18:25:51'),
(961, '74.120.14.54', '2021-05-10', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-10 19:00:59'),
(962, '45.195.146.140', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.122 Safari/537.36', '2021-05-10 19:10:49'),
(963, '74.120.14.56', '2021-05-10', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-10 19:17:43'),
(964, '172.105.161.246', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-10 19:29:10'),
(965, '13.228.104.57', '2021-05-10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36', '2021-05-10 19:42:35'),
(966, '34.209.105.222', '2021-05-10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36', '2021-05-10 19:43:16'),
(967, '3.0.115.255', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '2021-05-10 19:43:19'),
(968, '3.8.12.221', '2021-05-10', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.16 Safari/537.36', '2021-05-10 19:43:58'),
(969, '13.233.73.212', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1500.55 Safari/537.36', '2021-05-10 19:46:18'),
(970, '52.52.190.187', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36', '2021-05-10 19:47:02'),
(971, '52.192.73.251', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36', '2021-05-10 19:51:22'),
(972, '18.229.73.207', '2021-05-10', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', '2021-05-10 19:51:41'),
(973, '18.221.206.247', '2021-05-10', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-10 20:19:57'),
(974, '154.126.33.163', '2021-05-10', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15', '2021-05-10 21:18:29'),
(975, '162.142.125.39', '2021-05-10', NULL, '2021-05-10 21:42:11'),
(976, '128.14.134.170', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-10 22:42:14'),
(977, '128.14.209.162', '2021-05-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-10 23:01:33'),
(978, '54.184.175.234', '2021-05-11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', '2021-05-11 00:16:29'),
(979, '66.249.64.237', '2021-05-11', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-11 00:22:11'),
(980, '66.249.64.229', '2021-05-11', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-11 01:05:56'),
(981, '207.46.13.16', '2021-05-11', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-11 01:17:35'),
(982, '193.118.53.194', '2021-05-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-11 02:54:51'),
(983, '134.119.189.158', '2021-05-11', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-11 03:25:26'),
(984, '167.248.133.53', '2021-05-11', NULL, '2021-05-11 05:11:36'),
(985, '41.190.239.121', '2021-05-11', 'Mozilla/5.0 (Windows NT 6.1; Trident/7.0; rv:11.0) like Gecko', '2021-05-11 07:52:56'),
(986, '185.26.97.138', '2021-05-11', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', '2021-05-11 08:02:02'),
(987, '65.49.20.68', '2021-05-11', NULL, '2021-05-11 08:08:15'),
(988, '34.76.80.167', '2021-05-11', 'python-requests/2.25.1', '2021-05-11 09:00:15'),
(989, '39.96.139.223', '2021-05-11', 'Go-http-client/1.1', '2021-05-11 09:36:39'),
(990, '102.68.228.162', '2021-05-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4496.3 Safari/537.36', '2021-05-11 09:46:57'),
(991, '162.62.123.46', '2021-05-11', NULL, '2021-05-11 09:50:36'),
(992, '128.14.134.170', '2021-05-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-11 09:53:22'),
(993, '41.74.217.34', '2021-05-11', 'Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A515F) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/14.0 Chrome/87.0.4280.141 Mobile Safari/537.36', '2021-05-11 10:16:14'),
(994, '66.249.64.231', '2021-05-11', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-11 10:25:17'),
(995, '167.248.133.56', '2021-05-11', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-11 10:29:28'),
(996, '128.14.141.34', '2021-05-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-11 11:29:41'),
(997, '66.249.64.239', '2021-05-11', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-11 15:16:07'),
(998, '172.105.172.122', '2021-05-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-11 15:56:49'),
(999, '122.228.19.80', '2021-05-11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-11 16:19:55'),
(1000, '183.136.225.14', '2021-05-11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-11 16:37:21'),
(1001, '192.35.168.80', '2021-05-11', 'Mozilla/5.0 zgrab/0.x', '2021-05-11 16:42:26'),
(1002, '212.102.60.163', '2021-05-11', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-11 17:29:29'),
(1003, '192.35.168.96', '2021-05-11', 'Mozilla/5.0 zgrab/0.x', '2021-05-11 18:43:57'),
(1004, '66.249.64.233', '2021-05-11', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-11 19:27:51'),
(1005, '51.103.83.159', '2021-05-11', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-11 19:31:47'),
(1006, '185.220.101.199', '2021-05-11', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-05-11 22:20:09'),
(1007, '54.83.179.69', '2021-05-11', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) Project-Resonance (http://project-resonance.com/) (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '2021-05-11 23:02:28'),
(1008, '74.120.14.56', '2021-05-11', NULL, '2021-05-11 23:21:52'),
(1009, '128.1.248.26', '2021-05-11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-11 23:57:53'),
(1010, '66.249.64.237', '2021-05-12', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-12 00:21:41'),
(1011, '162.62.123.46', '2021-05-12', NULL, '2021-05-12 00:27:55'),
(1012, '15.188.50.230', '2021-05-12', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-12 00:52:09'),
(1013, '183.136.225.14', '2021-05-12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-12 03:02:14'),
(1014, '85.214.19.233', '2021-05-12', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-12 03:24:54'),
(1015, '64.62.197.32', '2021-05-12', NULL, '2021-05-12 04:15:19'),
(1016, '66.249.64.233', '2021-05-12', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-12 04:29:29'),
(1017, '104.237.140.169', '2021-05-12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-12 07:49:46'),
(1018, '188.166.68.174', '2021-05-12', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', '2021-05-12 09:54:10'),
(1019, '45.83.65.203', '2021-05-12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:65.0) Gecko/20100101 Firefox/65.0', '2021-05-12 10:04:45'),
(1020, '162.142.125.38', '2021-05-12', NULL, '2021-05-12 10:25:00'),
(1021, '102.68.228.18', '2021-05-12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4496.3 Safari/537.36', '2021-05-12 12:19:10'),
(1022, '138.246.253.24', '2021-05-12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '2021-05-12 13:00:54'),
(1023, '207.46.13.16', '2021-05-12', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-12 13:20:53'),
(1024, '192.151.156.189', '2021-05-12', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36', '2021-05-12 13:28:55'),
(1025, '66.249.64.236', '2021-05-12', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-12 14:11:04'),
(1026, '92.118.160.57', '2021-05-12', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-12 14:21:27'),
(1027, '193.118.53.202', '2021-05-12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-12 15:04:21'),
(1028, '128.14.134.134', '2021-05-12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-12 17:11:52'),
(1029, '66.249.64.228', '2021-05-12', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-12 17:31:54'),
(1030, '192.241.221.93', '2021-05-12', 'Mozilla/5.0 zgrab/0.x', '2021-05-12 20:24:54'),
(1031, '74.120.14.54', '2021-05-12', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-12 20:40:21'),
(1032, '35.183.60.188', '2021-05-12', 'Mozilla/5.0 (X11; CrOS i686 4319.74.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.57 Safari/537.36', '2021-05-12 21:20:58'),
(1033, '13.228.104.57', '2021-05-12', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.67 Safari/537.36', '2021-05-12 21:21:11'),
(1034, '18.231.94.162', '2021-05-12', 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', '2021-05-12 21:21:20'),
(1035, '3.8.68.2', '2021-05-12', 'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1464.0 Safari/537.36', '2021-05-12 21:21:38'),
(1036, '18.229.73.207', '2021-05-12', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1500.55 Safari/537.36', '2021-05-12 21:24:10'),
(1037, '52.65.15.196', '2021-05-12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', '2021-05-12 21:25:24'),
(1038, '13.232.96.15', '2021-05-12', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-12 21:29:08'),
(1039, '35.178.16.1', '2021-05-12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36', '2021-05-12 21:29:09'),
(1040, '3.0.115.255', '2021-05-12', 'Mozilla/5.0 (Windows NT 4.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36', '2021-05-12 21:31:18'),
(1041, '52.52.190.187', '2021-05-12', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36', '2021-05-12 21:32:00'),
(1042, '52.64.20.252', '2021-05-12', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1866.237 Safari/537.36', '2021-05-12 21:33:12'),
(1043, '35.227.168.5', '2021-05-12', NULL, '2021-05-12 22:34:46'),
(1044, '18.184.141.119', '2021-05-12', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-12 23:17:46'),
(1045, '54.87.3.150', '2021-05-13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) Project-Resonance (http://project-resonance.com/) (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36', '2021-05-13 00:55:57');
INSERT INTO `na_visits_ips` (`id`, `ip_address`, `date`, `user_agent`, `create_time`) VALUES
(1046, '41.82.49.33', '2021-05-13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-13 02:10:37'),
(1047, '41.82.49.33', '2021-05-13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-13 02:10:37'),
(1048, '162.62.123.46', '2021-05-13', NULL, '2021-05-13 02:35:23'),
(1049, '80.82.77.192', '2021-05-13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-05-13 03:48:45'),
(1050, '89.248.168.140', '2021-05-13', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-13 04:42:43'),
(1051, '64.62.197.2', '2021-05-13', NULL, '2021-05-13 05:28:02'),
(1052, '128.14.133.58', '2021-05-13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-13 06:26:30'),
(1053, '66.249.64.240', '2021-05-13', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-13 07:06:03'),
(1054, '142.202.240.38', '2021-05-13', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-13 08:40:30'),
(1055, '66.249.64.238', '2021-05-13', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-13 08:46:17'),
(1056, '102.68.230.160', '2021-05-13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-13 08:48:15'),
(1057, '207.46.13.16', '2021-05-13', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-13 09:04:16'),
(1058, '18.212.50.208', '2021-05-13', 'Mozilla/5.0 (Windows NT 6.2;en-US) AppleWebKit/537.32.36 (KHTML, live Gecko) Chrome/50.0.3036.102 Safari/537.32', '2021-05-13 12:48:36'),
(1059, '183.136.225.14', '2021-05-13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-13 16:11:15'),
(1060, '154.126.33.163', '2021-05-13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15', '2021-05-13 17:10:09'),
(1061, '102.68.225.212', '2021-05-13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-13 17:16:04'),
(1062, '122.228.19.80', '2021-05-13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-13 17:18:15'),
(1063, '197.158.119.49', '2021-05-13', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-13 17:19:33'),
(1064, '45.133.1.162', '2021-05-13', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-13 20:58:13'),
(1065, '173.82.235.195', '2021-05-13', 'Mozilla/5.0 zgrab/0.x', '2021-05-13 21:31:14'),
(1066, '104.224.29.59', '2021-05-13', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-13 22:07:53'),
(1067, '192.241.215.159', '2021-05-13', 'Mozilla/5.0 zgrab/0.x', '2021-05-13 22:25:12'),
(1068, '194.49.79.168', '2021-05-13', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-13 23:40:26'),
(1069, '74.120.14.37', '2021-05-13', NULL, '2021-05-13 23:59:29'),
(1070, '142.202.240.38', '2021-05-14', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-14 00:12:36'),
(1071, '41.82.49.33', '2021-05-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-05-14 00:19:14'),
(1072, '66.249.64.236', '2021-05-14', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-14 01:07:38'),
(1073, '162.62.123.46', '2021-05-14', NULL, '2021-05-14 02:54:56'),
(1074, '64.188.9.167', '2021-05-14', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-US; HM NOTE 1W Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/11.0.5.850 U3/0.8.0 Mobile Safari/534.30', '2021-05-14 03:31:06'),
(1075, '64.62.197.2', '2021-05-14', NULL, '2021-05-14 03:36:03'),
(1076, '207.46.13.16', '2021-05-14', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-14 04:57:41'),
(1077, '34.67.141.68', '2021-05-14', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-14 06:25:30'),
(1078, '74.120.14.54', '2021-05-14', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-14 06:33:46'),
(1079, '102.68.230.61', '2021-05-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-14 08:09:24'),
(1080, '172.255.48.137', '2021-05-14', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36 GTmetrix', '2021-05-14 08:30:42'),
(1081, '178.73.215.171', '2021-05-14', NULL, '2021-05-14 09:39:29'),
(1082, '194.62.6.212', '2021-05-14', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0', '2021-05-14 10:40:44'),
(1083, '207.46.13.94', '2021-05-14', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-14 11:43:08'),
(1084, '80.82.77.192', '2021-05-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-05-14 12:15:58'),
(1085, '85.214.20.215', '2021-05-14', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-14 13:07:12'),
(1086, '167.248.133.53', '2021-05-14', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-14 13:59:49'),
(1087, '193.118.53.202', '2021-05-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-14 14:24:53'),
(1088, '72.17.89.98', '2021-05-14', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; ASJB; ASJB; MAAU; rv:11.0) like Gecko', '2021-05-14 14:35:38'),
(1089, '82.221.105.7', '2021-05-14', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-14 15:15:38'),
(1090, '122.228.19.80', '2021-05-14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-14 15:50:30'),
(1091, '128.1.248.42', '2021-05-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-14 16:27:58'),
(1092, '34.76.80.167', '2021-05-14', 'python-requests/2.25.1', '2021-05-14 17:21:02'),
(1093, '162.142.125.38', '2021-05-14', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-14 17:39:26'),
(1094, '23.129.64.202', '2021-05-14', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-05-14 18:40:28'),
(1095, '128.14.134.134', '2021-05-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-14 20:57:00'),
(1096, '170.130.187.58', '2021-05-14', 'https://gdnplus.com:Gather Analyze Provide.', '2021-05-14 21:26:07'),
(1097, '167.248.133.40', '2021-05-14', NULL, '2021-05-14 23:52:15'),
(1098, '193.118.53.202', '2021-05-15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-15 00:03:03'),
(1099, '207.46.13.16', '2021-05-15', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-15 00:54:25'),
(1100, '162.62.123.46', '2021-05-15', NULL, '2021-05-15 01:48:09'),
(1101, '180.149.125.175', '2021-05-15', 'Mozilla/5.0 (Windows NT 5.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', '2021-05-15 04:21:00'),
(1102, '179.60.150.44', '2021-05-15', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36', '2021-05-15 04:26:04'),
(1103, '128.1.248.26', '2021-05-15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-15 05:18:52'),
(1104, '13.48.53.51', '2021-05-15', 'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', '2021-05-15 06:26:15'),
(1105, '66.249.64.236', '2021-05-15', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-15 06:29:02'),
(1106, '52.179.133.5', '2021-05-15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '2021-05-15 06:37:16'),
(1107, '185.53.90.12', '2021-05-15', 'Mozlila/5.0 (Linux; Android 7.0; SM-G892A Bulid/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/60.0.3112.107 Moblie Safari/537.36', '2021-05-15 07:03:08'),
(1108, '207.46.13.94', '2021-05-15', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-15 07:22:15'),
(1109, '128.14.134.134', '2021-05-15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-15 08:34:02'),
(1110, '143.198.209.30', '2021-05-15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', '2021-05-15 11:25:40'),
(1111, '51.255.3.45', '2021-05-15', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-15 13:16:25'),
(1112, '66.249.64.240', '2021-05-15', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-15 13:40:08'),
(1113, '50.31.21.5', '2021-05-15', NULL, '2021-05-15 14:24:28'),
(1114, '167.248.133.54', '2021-05-15', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-15 16:14:34'),
(1115, '128.14.134.170', '2021-05-15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36', '2021-05-15 17:14:55'),
(1116, '192.241.214.71', '2021-05-15', 'Mozilla/5.0 zgrab/0.x', '2021-05-15 20:04:19'),
(1117, '80.82.78.39', '2021-05-16', 'Mozilla/5.0', '2021-05-16 00:02:34'),
(1118, '40.77.167.105', '2021-05-16', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-16 00:05:02'),
(1119, '162.142.125.55', '2021-05-16', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-16 00:18:42'),
(1120, '92.118.160.37', '2021-05-16', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-16 01:44:35'),
(1121, '185.142.236.40', '2021-05-16', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-16 03:31:12'),
(1122, '64.62.197.152', '2021-05-16', NULL, '2021-05-16 05:16:07'),
(1123, '74.120.14.56', '2021-05-16', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-16 05:34:18'),
(1124, '157.55.39.23', '2021-05-16', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-16 06:19:15'),
(1125, '66.249.64.236', '2021-05-16', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-16 07:47:48'),
(1126, '167.248.133.54', '2021-05-16', NULL, '2021-05-16 08:03:41'),
(1127, '90.187.70.217', '2021-05-16', 'Mozilla/5.0 zgrab/0.x', '2021-05-16 10:06:06'),
(1128, '40.90.232.54', '2021-05-16', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-16 10:35:08'),
(1129, '41.204.115.49', '2021-05-16', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-05-16 11:43:07'),
(1130, '80.82.77.192', '2021-05-16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '2021-05-16 17:54:28'),
(1131, '88.155.49.195', '2021-05-16', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', '2021-05-16 18:20:41'),
(1132, '89.248.168.143', '2021-05-16', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-16 18:32:45'),
(1133, '157.55.39.22', '2021-05-16', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-16 19:55:34'),
(1134, '62.64.98.82', '2021-05-16', 'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1', '2021-05-16 20:39:26'),
(1135, '154.126.33.163', '2021-05-16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Safari/605.1.15', '2021-05-16 21:37:45'),
(1136, '192.241.204.249', '2021-05-16', 'Mozilla/5.0 zgrab/0.x', '2021-05-16 22:27:31'),
(1137, '183.136.225.14', '2021-05-16', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0', '2021-05-16 22:43:57'),
(1138, '20.43.33.47', '2021-05-16', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-16 23:57:28'),
(1139, '35.204.86.138', '2021-05-17', 'Mozilla/5.0', '2021-05-17 00:15:44'),
(1140, '40.77.167.105', '2021-05-17', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-17 02:23:14'),
(1141, '162.62.123.46', '2021-05-17', NULL, '2021-05-17 02:54:09'),
(1142, '44.238.100.81', '2021-05-17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36', '2021-05-17 04:41:46'),
(1143, '157.55.39.22', '2021-05-17', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-17 05:21:18'),
(1144, '66.249.64.238', '2021-05-17', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-17 07:22:59'),
(1145, '216.218.206.67', '2021-05-17', NULL, '2021-05-17 08:19:45'),
(1146, '102.68.227.215', '2021-05-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-17 09:23:48'),
(1147, '41.190.239.121', '2021-05-17', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '2021-05-17 11:18:25'),
(1148, '3.8.12.221', '2021-05-17', 'Mozilla/5.0 (Windows NT 6.4; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-05-17 11:58:55'),
(1149, '34.251.241.226', '2021-05-17', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-05-17 11:59:16'),
(1150, '52.30.16.188', '2021-05-17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1623.0 Safari/537.36', '2021-05-17 11:59:25'),
(1151, '52.52.190.187', '2021-05-17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.47 Safari/537.36', '2021-05-17 11:59:43'),
(1152, '35.178.16.1', '2021-05-17', 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2224.3 Safari/537.36', '2021-05-17 12:02:16'),
(1153, '52.64.20.252', '2021-05-17', 'Mozilla/5.0 (Windows NT 4.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36', '2021-05-17 12:03:24'),
(1154, '13.233.73.212', '2021-05-17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1623.0 Safari/537.36', '2021-05-17 12:07:31'),
(1155, '54.178.182.46', '2021-05-17', 'Mozilla/5.0 (Windows NT 4.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36', '2021-05-17 12:09:38'),
(1156, '35.180.147.121', '2021-05-17', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36', '2021-05-17 12:09:39'),
(1157, '13.228.104.57', '2021-05-17', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2225.0 Safari/537.36', '2021-05-17 12:13:18'),
(1158, '52.15.212.3', '2021-05-17', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/4E423F', '2021-05-17 12:43:37'),
(1159, '66.249.64.236', '2021-05-17', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-17 15:24:51'),
(1160, '66.249.64.226', '2021-05-17', 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.97 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-17 15:45:13'),
(1161, '71.6.232.7', '2021-05-17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.131 Safari/537.36', '2021-05-17 18:33:06'),
(1162, '157.55.39.23', '2021-05-17', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-17 18:42:45'),
(1163, '162.142.125.39', '2021-05-17', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', '2021-05-17 20:29:18'),
(1164, '198.98.48.133', '2021-05-17', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-17 21:57:54'),
(1165, '51.158.108.61', '2021-05-17', NULL, '2021-05-17 23:59:57'),
(1166, '41.82.49.33', '2021-05-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-05-18 00:02:47'),
(1167, '45.155.205.126', '2021-05-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36', '2021-05-18 00:29:27'),
(1168, '40.77.167.105', '2021-05-18', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-18 01:18:54'),
(1169, '51.161.43.237', '2021-05-18', 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)', '2021-05-18 10:36:05'),
(1170, '192.35.168.64', '2021-05-18', 'Mozilla/5.0 zgrab/0.x', '2021-05-18 15:31:27'),
(1171, '102.68.224.212', '2021-05-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-18 15:45:10'),
(1172, '213.32.122.82', '2021-05-18', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36', '2021-05-18 16:42:37'),
(1173, '45.9.150.27', '2021-05-18', 'curl/7.66.0', '2021-05-18 17:21:17'),
(1174, '194.49.68.10', '2021-05-18', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-18 20:54:43'),
(1175, '197.158.119.49', '2021-05-18', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-05-18 20:58:32'),
(1176, '157.55.39.82', '2021-05-18', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-18 21:04:15'),
(1177, '45.76.158.163', '2021-05-18', 'curl/7.67.0', '2021-05-18 21:56:02'),
(1178, '192.35.168.160', '2021-05-18', 'Mozilla/5.0 zgrab/0.x', '2021-05-18 22:25:06'),
(1179, '35.185.241.102', '2021-05-18', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '2021-05-18 23:05:00'),
(1180, '80.82.77.139', '2021-05-18', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-18 23:14:20'),
(1181, '35.225.82.182', '2021-05-18', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '2021-05-18 23:23:04'),
(1182, '159.65.128.217', '2021-05-18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', '2021-05-18 23:27:47'),
(1183, '162.62.123.46', '2021-05-18', NULL, '2021-05-18 23:53:45'),
(1184, '34.76.80.167', '2021-05-19', 'python-requests/2.25.1', '2021-05-19 00:20:16'),
(1185, '41.82.49.33', '2021-05-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', '2021-05-19 00:29:33'),
(1186, '40.77.167.105', '2021-05-19', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-19 00:48:39'),
(1187, '34.216.187.8', '2021-05-19', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '2021-05-19 01:36:25'),
(1188, '54.188.57.66', '2021-05-19', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '2021-05-19 01:38:05'),
(1189, '5.45.207.68', '2021-05-19', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '2021-05-19 01:41:09'),
(1190, '5.255.231.133', '2021-05-19', 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)', '2021-05-19 01:42:08'),
(1191, '157.55.39.82', '2021-05-19', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-19 02:35:47'),
(1192, '92.118.161.9', '2021-05-19', 'NetSystemsResearch studies the availability of various services across the internet. Our website is netsystemsresearch.com', '2021-05-19 02:51:49'),
(1193, '45.143.145.26', '2021-05-19', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-19 03:06:04'),
(1194, '20.86.8.205', '2021-05-19', 'Python/3.6 aiohttp/3.7.4.post0', '2021-05-19 03:09:35'),
(1195, '157.55.39.23', '2021-05-19', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-19 03:46:16'),
(1196, '35.245.188.175', '2021-05-19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '2021-05-19 04:26:56'),
(1197, '20.83.155.45', '2021-05-19', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-19 05:07:18'),
(1198, '207.46.13.2', '2021-05-19', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', '2021-05-19 06:17:26'),
(1199, '94.158.244.42', '2021-05-19', 'cURL', '2021-05-19 06:32:34'),
(1200, '66.249.64.147', '2021-05-19', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '2021-05-19 06:42:59'),
(1201, '184.105.247.194', '2021-05-19', NULL, '2021-05-19 07:58:26'),
(1202, '192.241.221.47', '2021-05-19', 'Mozilla/5.0 zgrab/0.x', '2021-05-19 08:00:31'),
(1203, '35.237.106.15', '2021-05-19', 'Mozilla/5.0 (Windows NT 6.2; WOW64; rv:26.0) Gecko/20100101 Firefox/26.0', '2021-05-19 09:04:57'),
(1204, '102.68.228.85', '2021-05-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-19 09:25:23'),
(1205, '198.20.99.130', '2021-05-19', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', '2021-05-19 09:26:47'),
(1206, '114.188.113.35', '2021-05-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36 Edg/90.0.818.62', '2021-05-19 09:28:58'),
(1207, '35.185.241.102', '2021-05-19', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', '2021-05-19 10:20:45'),
(1208, '138.246.253.24', '2021-05-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.146 Safari/537.36', '2021-05-19 10:23:28'),
(1209, '34.77.163.42', '2021-05-19', 'python-requests/2.25.1', '2021-05-19 11:47:21'),
(1210, '20.191.45.212', '2021-05-19', 'Mozilla/5.0 (compatible; DuckDuckGo-Favicons-Bot/1.0; +http://duckduckgo.com)', '2021-05-19 12:13:12'),
(1211, '41.77.17.8', '2021-05-19', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36 OPR/68.0.3618.91', '2021-05-19 13:12:01'),
(1212, '54.84.233.45', '2021-05-19', 'Mozilla/5.0 (Windows NT 6.2;en-US) AppleWebKit/537.32.36 (KHTML, live Gecko) Chrome/53.0.3037.85 Safari/537.32', '2021-05-19 13:15:17'),
(1213, '165.227.227.7', '2021-05-19', 'Mozilla/5.0 for legitimate research purposes only', '2021-05-19 14:40:42'),
(1214, '85.214.20.215', '2021-05-19', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.129 Safari/537.36', '2021-05-19 14:42:56'),
(1215, '102.16.9.94', '2021-05-19', 'Mozilla/5.0 (Linux; Android 8.0.0; AGS2-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.210 Safari/537.36', '2021-05-19 14:44:07'),
(1216, '127.0.0.1', '2021-05-19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-19 15:49:28'),
(1217, '127.0.0.1', '2021-05-20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-20 09:39:38'),
(1218, '127.0.0.1', '2021-05-21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4503.5 Safari/537.36', '2021-05-21 09:06:48'),
(1219, '127.0.0.1', '2021-05-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4512.3 Safari/537.36', '2021-05-27 22:32:27'),
(1220, '127.0.0.1', '2021-06-07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4530.3 Safari/537.36', '2021-06-07 13:45:08'),
(1221, '127.0.0.1', '2021-06-10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4535.2 Safari/537.36', '2021-06-10 08:51:59'),
(1222, '127.0.0.1', '2021-06-22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4542.2 Safari/537.36', '2021-06-22 09:41:44'),
(1223, '127.0.0.1', '2021-06-23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4549.3 Safari/537.36', '2021-06-23 09:45:52'),
(1224, '127.0.0.1', '2021-06-24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4549.3 Safari/537.36', '2021-06-24 10:25:20'),
(1225, '127.0.0.1', '2021-06-27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4549.3 Safari/537.36', '2021-06-27 17:35:18'),
(1226, '127.0.0.1', '2021-06-29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4549.3 Safari/537.36', '2021-06-29 12:31:34'),
(1227, '127.0.0.1', '2021-07-08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4557.4 Safari/537.36', '2021-07-08 13:40:23'),
(1228, '127.0.0.1', '2021-07-14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4557.4 Safari/537.36', '2021-07-14 16:25:56');

-- --------------------------------------------------------

--
-- Structure de la table `na_visits_monthly`
--

CREATE TABLE `na_visits_monthly` (
  `date` date NOT NULL,
  `stats_visits` int(11) NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

--
-- Contenu de la table `na_visits_monthly`
--

INSERT INTO `na_visits_monthly` (`date`, `stats_visits`, `updated`) VALUES
('2021-04-01', 454, '2021-04-30 23:48:07'),
('2021-05-01', 765, '2021-05-27 22:32:27'),
('2021-06-01', 7, '2021-06-29 12:31:34'),
('2021-07-01', 2, '2021-07-14 16:25:56');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `na_categories`
--
ALTER TABLE `na_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GrpCat` (`id_category_group`);

--
-- Index pour la table `na_categories_groups`
--
ALTER TABLE `na_categories_groups`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_categories_groups_multilingual`
--
ALTER TABLE `na_categories_groups_multilingual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CatGrpLangCatGrp` (`id_category_group`),
  ADD KEY `LangCatGrpLang` (`id_language`);

--
-- Index pour la table `na_categories_multilingual`
--
ALTER TABLE `na_categories_multilingual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CatLangCat` (`id_category`),
  ADD KEY `LangCatLang` (`id_language`);

--
-- Index pour la table `na_contacts`
--
ALTER TABLE `na_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_languages`
--
ALTER TABLE `na_languages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_medias`
--
ALTER TABLE `na_medias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_fk1` (`id_user`);

--
-- Index pour la table `na_medias_metas`
--
ALTER TABLE `na_medias_metas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mm_fk1` (`id_media`);

--
-- Index pour la table `na_medias_multilingual`
--
ALTER TABLE `na_medias_multilingual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ImgLangImg` (`id_media`),
  ADD KEY `LangImgLang` (`id_language`);

--
-- Index pour la table `na_modules`
--
ALTER TABLE `na_modules`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_modules_categories_groups`
--
ALTER TABLE `na_modules_categories_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ModCatGrpMod` (`id_module`),
  ADD KEY `CatGrpModCatGrp` (`id_category_group`);

--
-- Index pour la table `na_newsletters`
--
ALTER TABLE `na_newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_news_comments`
--
ALTER TABLE `na_news_comments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_news_visits`
--
ALTER TABLE `na_news_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `na_news_visits_fk1` (`id_new`);

--
-- Index pour la table `na_options`
--
ALTER TABLE `na_options`
  ADD PRIMARY KEY (`meta_key`),
  ADD KEY `key` (`meta_key`);

--
-- Index pour la table `na_pages`
--
ALTER TABLE `na_pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_pages_categories`
--
ALTER TABLE `na_pages_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pg_cat_fk1` (`id_page`),
  ADD KEY `pg_cat_fk2` (`id_category`);

--
-- Index pour la table `na_pages_multilingual`
--
ALTER TABLE `na_pages_multilingual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PgLangPg` (`id_page`),
  ADD KEY `LangPgLang` (`id_language`);
ALTER TABLE `na_pages_multilingual` ADD FULLTEXT KEY `search` (`title`,`text`);

--
-- Index pour la table `na_products_lots`
--
ALTER TABLE `na_products_lots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `na_categories_fk1` (`id_product`);

--
-- Index pour la table `na_produits_phares`
--
ALTER TABLE `na_produits_phares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `na_produits_phares_fk1` (`id_category`);

--
-- Index pour la table `na_seo`
--
ALTER TABLE `na_seo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_seo_multilingual`
--
ALTER TABLE `na_seo_multilingual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seo_fk1` (`id_seo`),
  ADD KEY `seo_fk2` (`id_language`);

--
-- Index pour la table `na_template`
--
ALTER TABLE `na_template`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_template_multilingual`
--
ALTER TABLE `na_template_multilingual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id_language` (`id_language`) USING BTREE,
  ADD KEY `template_id_template` (`id_template`) USING BTREE;

--
-- Index pour la table `na_translations`
--
ALTER TABLE `na_translations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_translations_multilingual`
--
ALTER TABLE `na_translations_multilingual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `TrLangTr` (`id_translation`),
  ADD KEY `LangTrLang` (`id_language`);

--
-- Index pour la table `na_url`
--
ALTER TABLE `na_url`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_url_multilingual`
--
ALTER TABLE `na_url_multilingual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `na_url_multilingual_fk1` (`id_url`);

--
-- Index pour la table `na_users`
--
ALTER TABLE `na_users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_visits_annual`
--
ALTER TABLE `na_visits_annual`
  ADD PRIMARY KEY (`date`);

--
-- Index pour la table `na_visits_daily`
--
ALTER TABLE `na_visits_daily`
  ADD PRIMARY KEY (`date`);

--
-- Index pour la table `na_visits_ips`
--
ALTER TABLE `na_visits_ips`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `na_visits_monthly`
--
ALTER TABLE `na_visits_monthly`
  ADD PRIMARY KEY (`date`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `na_categories`
--
ALTER TABLE `na_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `na_categories_groups`
--
ALTER TABLE `na_categories_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `na_categories_groups_multilingual`
--
ALTER TABLE `na_categories_groups_multilingual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `na_categories_multilingual`
--
ALTER TABLE `na_categories_multilingual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT pour la table `na_contacts`
--
ALTER TABLE `na_contacts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `na_languages`
--
ALTER TABLE `na_languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `na_medias`
--
ALTER TABLE `na_medias`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;
--
-- AUTO_INCREMENT pour la table `na_medias_metas`
--
ALTER TABLE `na_medias_metas`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT pour la table `na_medias_multilingual`
--
ALTER TABLE `na_medias_multilingual`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
--
-- AUTO_INCREMENT pour la table `na_modules`
--
ALTER TABLE `na_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `na_modules_categories_groups`
--
ALTER TABLE `na_modules_categories_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `na_newsletters`
--
ALTER TABLE `na_newsletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `na_news_comments`
--
ALTER TABLE `na_news_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `na_news_visits`
--
ALTER TABLE `na_news_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `na_pages`
--
ALTER TABLE `na_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT pour la table `na_pages_categories`
--
ALTER TABLE `na_pages_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT pour la table `na_pages_multilingual`
--
ALTER TABLE `na_pages_multilingual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
--
-- AUTO_INCREMENT pour la table `na_products_lots`
--
ALTER TABLE `na_products_lots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `na_produits_phares`
--
ALTER TABLE `na_produits_phares`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `na_seo`
--
ALTER TABLE `na_seo`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `na_seo_multilingual`
--
ALTER TABLE `na_seo_multilingual`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `na_template`
--
ALTER TABLE `na_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `na_template_multilingual`
--
ALTER TABLE `na_template_multilingual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `na_translations`
--
ALTER TABLE `na_translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT pour la table `na_translations_multilingual`
--
ALTER TABLE `na_translations_multilingual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;
--
-- AUTO_INCREMENT pour la table `na_url`
--
ALTER TABLE `na_url`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `na_url_multilingual`
--
ALTER TABLE `na_url_multilingual`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `na_users`
--
ALTER TABLE `na_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `na_visits_ips`
--
ALTER TABLE `na_visits_ips`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1229;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `na_categories`
--
ALTER TABLE `na_categories`
  ADD CONSTRAINT `GrpCat` FOREIGN KEY (`id_category_group`) REFERENCES `na_categories_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_categories_groups_multilingual`
--
ALTER TABLE `na_categories_groups_multilingual`
  ADD CONSTRAINT `CatGrpLangCatGrp` FOREIGN KEY (`id_category_group`) REFERENCES `na_categories_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_categories_multilingual`
--
ALTER TABLE `na_categories_multilingual`
  ADD CONSTRAINT `CatLangCat` FOREIGN KEY (`id_category`) REFERENCES `na_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_medias_metas`
--
ALTER TABLE `na_medias_metas`
  ADD CONSTRAINT `mm_fk1` FOREIGN KEY (`id_media`) REFERENCES `na_medias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_medias_multilingual`
--
ALTER TABLE `na_medias_multilingual`
  ADD CONSTRAINT `ImgLangImg` FOREIGN KEY (`id_media`) REFERENCES `na_medias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_modules_categories_groups`
--
ALTER TABLE `na_modules_categories_groups`
  ADD CONSTRAINT `CatGrpModCatGrp` FOREIGN KEY (`id_category_group`) REFERENCES `na_categories_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ModCatGrpMod` FOREIGN KEY (`id_module`) REFERENCES `na_modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_news_visits`
--
ALTER TABLE `na_news_visits`
  ADD CONSTRAINT `na_news_visits_fk1` FOREIGN KEY (`id_new`) REFERENCES `na_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_pages_categories`
--
ALTER TABLE `na_pages_categories`
  ADD CONSTRAINT `pg_cat_fk1` FOREIGN KEY (`id_page`) REFERENCES `na_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pg_cat_fk2` FOREIGN KEY (`id_category`) REFERENCES `na_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_pages_multilingual`
--
ALTER TABLE `na_pages_multilingual`
  ADD CONSTRAINT `PgLangPg` FOREIGN KEY (`id_page`) REFERENCES `na_pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_products_lots`
--
ALTER TABLE `na_products_lots`
  ADD CONSTRAINT `na_categories_fk1` FOREIGN KEY (`id_product`) REFERENCES `na_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_produits_phares`
--
ALTER TABLE `na_produits_phares`
  ADD CONSTRAINT `na_produits_phares_fk1` FOREIGN KEY (`id_category`) REFERENCES `na_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_seo_multilingual`
--
ALTER TABLE `na_seo_multilingual`
  ADD CONSTRAINT `seo_fk1` FOREIGN KEY (`id_seo`) REFERENCES `na_seo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_template_multilingual`
--
ALTER TABLE `na_template_multilingual`
  ADD CONSTRAINT `template_id_template` FOREIGN KEY (`id_template`) REFERENCES `na_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_translations_multilingual`
--
ALTER TABLE `na_translations_multilingual`
  ADD CONSTRAINT `TrLangTr` FOREIGN KEY (`id_translation`) REFERENCES `na_translations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `na_url_multilingual`
--
ALTER TABLE `na_url_multilingual`
  ADD CONSTRAINT `na_url_multilingual_fk1` FOREIGN KEY (`id_url`) REFERENCES `na_url` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
