-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2024 at 12:50 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tea_sage`
--

-- --------------------------------------------------------

--
-- Table structure for table `dieseases`
--

CREATE TABLE `dieseases` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `meta_code` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dieseases`
--

INSERT INTO `dieseases` (`id`, `name`, `meta_code`, `is_active`, `is_deleted`) VALUES
(1, 'Anthracnose', 'ANTHRACNOSE', 1, 0),
(2, 'Algal Leaf', 'ALGAL_LEAF', 1, 0),
(3, 'Bird Eye Spot', 'BIRD_EYE_SPOT', 1, 0),
(4, 'Brown Blight', 'BROWN_BLIGHT', 1, 0),
(5, 'Gray Light', 'GRAY_LIGHT', 1, 0),
(6, 'Healthy', 'HEALTHY', 1, 0),
(7, 'Red Leaf Spot', 'RED_LEAF_SPOT', 1, 0),
(8, 'White Spot', 'WHITE_SPOT', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `disease_description`
--

CREATE TABLE `disease_description` (
  `id` int(11) NOT NULL,
  `diesease_id` int(11) NOT NULL,
  `scientific_name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `damage` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `affected_areas` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `seasonality` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disease_description`
--

INSERT INTO `disease_description` (`id`, `diesease_id`, `scientific_name`, `description`, `damage`, `affected_areas`, `seasonality`) VALUES
(1, 1, 'Colletotrichum camelliae', 'Anthracnose affects tea plants primarily during the wet seasons (monsoon) in the mid and low-country regions of Sri Lanka. This fungal disease creates dark, sunken lesions on leaves, which eventually coalesce, causing leaf blight. It thrives in humid, rainy climates.', '[\"Reduced photosynthesis due to leaf defoliation.\",\"Dieback of shoots, leading to stunted growth.\",\"Yield losses, especially during peak harvest periods.\"]', '[\"Most prevalent in the mid-country and low-country tea plantations.\"]', 'Peaks during monsoonal rains in May to September.'),
(2, 2, 'Cephaleuros virescens', 'Commonly seen in the low-country and mid-country, this parasitic alga creates small, greenish or orange-brown patches on tea leaves. It is most active during periods of high humidity and consistent rainfall.', '[\"Reduces photosynthesis, weakening the plant.\",\"Prolonged infection leads to leaf shedding.\",\"Weakens tea bushes, making them susceptible to secondary infections.\"]', '[\"Humid low-country areas (Ratnapura, Galle, Kalutara) during the monsoons.\"]', 'Higher risks during May–July and October–January rains.\r\n'),
(3, 3, 'Cercospora theae', 'Named for the distinct bird’s-eye-like lesions with white centers and dark brown edges on tea leaves. This disease is most common in the wet-zone and can appear year-round, but especially after heavy rains.\r\n', '[\"Lowers leaf quality, reducing tea grade.\",\"In severe cases, it causes leaf fall, impacting yield.\"]', '[\"Prominent in high-rainfall regions of the mid-country and low-country.\"]', 'Most active during the inter-monsoon periods, where moisture is high but sunlight is lower.\r\n'),
(4, 4, 'Glomerella cingulata', 'This fungal disease creates brown spots with concentric rings on tea leaves. It tends to thrive in cooler, wetter environments, making the high-country (Nuwara Eliya, Badulla) more prone to this infection.', '[\"Severe infection leads to defoliation and twig dieback.\",\"Reduced tea yield and quality.\"]', '[\"Higher elevations like the high-country plantations are more affected.\"]', 'Appears mostly in the wet season from April to August.'),
(5, 5, 'Pestalotiopsis theae', 'Causes greyish or brown lesions with yellow margins, usually on older leaves. This disease spreads in humid, warm conditions and is a major issue in the low-country tea plantations.', '[\"Leads to premature leaf fall and reduced photosynthetic activity.\",\"Can result in considerable yield loss during critical harvest periods.\"]', '[\"Prevalent in warm, humid areas, particularly in the low-country during the monsoon season.\"]', 'Common in the southern tea-growing areas like Galle and Matara.\r\n'),
(6, 6, '', 'A disease-free tea plant with robust growth and uniform green leaves, indicating optimal plant health.', '[\"None\"]', '[\"Cultivation in well-drained, properly maintained fields with minimal disease pressure.\"]', 'Optimal conditions include moderate rainfall and consistent, but not excessive, moisture.'),
(7, 7, 'Phyllosticta theaefolia', 'Appears as red or purple spots that later turn brown as the tissue dies. It thrives in moist and warm environments and typically affects mid-country plantations.', '[\"Reduces photosynthesis and plant vigor.\",\"Causes premature leaf drop in severe infections, reducing yield.\"]', '[\"Mid-country regions (Kandy, Matale, Hatton) are most affected.\"]', 'Peaks during periods of high rainfall in April to July and October to January.'),
(8, 8, 'Diaporthe theae', 'Causes small white spots bordered by dark margins on tea leaves. It can affect both young and mature leaves, leading to a significant loss of leaf area and tea quality.', '[\"Severe infection leads to reduced photosynthesis and early leaf fall.\",\"Affects the quality of tea leaves harvested, reducing the overall crop yield.\"]', '[\"More common in mid-country and high-country during prolonged wet periods.\"]', 'Prevalent during monsoonal and inter-monsoonal rains, from May to September.');

-- --------------------------------------------------------

--
-- Table structure for table `fdrelation`
--

CREATE TABLE `fdrelation` (
  `id` int(11) NOT NULL,
  `fertilizer_id` int(11) NOT NULL,
  `diesease_id` int(11) NOT NULL,
  `effectiveness` longtext NOT NULL,
  `application_timing` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fdrelation`
--

INSERT INTO `fdrelation` (`id`, `fertilizer_id`, `diesease_id`, `effectiveness`, `application_timing`) VALUES
(1, 1, 1, 'High', 'Early spring or before growth flush'),
(2, 4, 1, 'High', 'At the first sign of disease, or preventative in early spring'),
(3, 2, 2, 'Moderate', 'Early spring or before growth flush'),
(4, 3, 2, 'Moderate', 'Early spring or during flowering'),
(5, 3, 3, 'High', 'Early spring or during flowering'),
(6, 5, 3, 'High', 'At the first sign of disease or preventative in early spring'),
(7, 6, 4, 'High', 'Early spring or during planting'),
(8, 7, 4, 'Moderate', 'Early spring or during planting'),
(9, 8, 5, 'High', 'Early spring or during planting'),
(10, 9, 5, 'Moderate', 'Anytime, especially before planting'),
(11, 10, 6, 'High', 'Anytime, especially before planting'),
(12, 11, 6, 'Moderate', 'Preventative use before disease onset'),
(13, 12, 7, 'High', 'Early spring or during flowering'),
(14, 4, 7, 'Moderate', 'At the first sign of disease, or preventative in early spring'),
(15, 11, 8, 'High', 'Preventative use before disease onset'),
(16, 12, 8, 'High', 'Early spring or during flowering');

-- --------------------------------------------------------

--
-- Table structure for table `fertilizers`
--

CREATE TABLE `fertilizers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `chemical_composition` longtext DEFAULT NULL,
  `application_method` longtext DEFAULT NULL,
  `optimal_timing` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fertilizers`
--

INSERT INTO `fertilizers` (`id`, `name`, `type`, `description`, `chemical_composition`, `application_method`, `optimal_timing`) VALUES
(1, 'Urea', 'Nitrogen Fertilizer', 'Promotes growth and helps manage anthracnose.', 'NH₂CONH₂ (46% N)', 'Broadcast or side-dress around the root zone', 'Early spring or before growth flush'),
(2, 'Copper-based Fungicide', 'Fungicide', 'Controls fungal infections like anthracnose.', 'Varies by formulation', 'Sprayed on foliage according to label', 'At the first sign of disease, or preventative in early spring'),
(3, 'Ammonium Sulfate', 'Nitrogen Fertilizer', 'Supports nitrogen needs and helps manage algal leaf.', '(NH₄)₂SO₄ (21% N)', 'Broadcast or incorporated into the soil', 'Early spring or before growth flush'),
(4, 'Potassium Sulfate', 'Potassium Fertilizer', 'Enhances plant health and resilience against algae.', 'K₂SO₄ (50% K, 18% S)', 'Broadcast or incorporated into the soil', 'Early spring or during flowering'),
(5, 'Muriate of Potash', 'Potassium Fertilizer', 'Improves overall plant vigor for bird eye spot.', 'KCl (60% K)', 'Broadcast or side-dress around the root zone', 'Early spring or during flowering'),
(6, 'Tebuconazole', 'Fungicide', 'Effective against fungal pathogens like bird eye spot.', 'C₁₅H₁₃ClN₂O (active ingredient)', 'Sprayed on foliage according to label', 'At the first sign of disease or preventative in early spring'),
(7, 'Diammonium Phosphate', 'Phosphorus Fertilizer', 'Promotes root development for brown blight.', '(NH₄)₂HPO₄ (18% N, 46% P)', 'Broadcast or incorporated into the soil', 'Early spring or during planting'),
(8, 'Single Super Phosphate', 'Phosphorus Fertilizer', 'Supports healthy root systems for gray light.', 'Ca(H₂PO₄)₂ · H₂O (16% P)', 'Broadcast or incorporated into the soil', 'Early spring or during planting'),
(9, 'Balanced NPK Fertilizer', 'NPK Fertilizer', 'Ensures overall plant health for healthy plants.', 'Varies by formulation', 'Broadcast according to soil test recommendations', 'During active growth'),
(10, 'Organic Matter', 'Organic Fertilizer', 'Improves soil structure and nutrient availability for healthy plants.', 'N/A', 'Incorporated into the soil', 'Anytime, especially before planting'),
(11, 'Gypsum', 'Calcium Fertilizer', 'Improves soil structure for red leaf spot.', 'CaSO₄ · 2H₂O', 'Broadcast or incorporated into the soil', 'Anytime, especially before planting'),
(12, 'Bacillus subtilis', 'Biological Control', 'Suppresses fungal pathogens for red leaf spot.', 'N/A (biological agent)', 'Applied as a foliar spray or soil drench', 'Preventative use before disease onset'),
(13, 'Sulfate of Potash', 'Potassium Fertilizer', 'Enhances disease resistance for white spot.', 'K₂SO₄ (50% K, 18% S)', 'Broadcast or incorporated into the soil', 'Early spring or during flowering');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) NOT NULL,
  `name` varchar(180) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`) VALUES
(1, 'admin@gmail.com', '[\"ROLE_ADMIN\", \"ROLE_USER\"]', '$2y$13$/dxTZBzCDaUCCdfVulpF8.RKhbM0lP3tIV2fBvsHw/9sgqdHMSKh2', 'Admin'),
(2, 'n', '[\"ROLE_USER\"]', '$2y$13$Lo9aESQhVaf/RMSj9OL50eDFD9RXqxhg0Au7hazp79t//oxcUTXwO', 'b bn'),
(3, 'indhuja@gmail.com', '[\"ROLE_USER\"]', '$2y$13$7mvlrpae2Gu3qfveyc1KHu4ph1VF6DEDTCnukAq/ppWvVM7p6x38C', 'indhu'),
(4, 'test1@gmail.com', '[\"ROLE_USER\"]', '$2y$13$8Z6FuC5PjUXb0GY.zAlL9uF/yMxVKoxDnKFCf9gtFtNVTp3sjDAje', 'test'),
(5, 'test2@gmail.com', '[\"ROLE_USER\"]', '$2y$13$SVMLpwXL6Iu7KI9q/B2SxOzjg3bYFvWkaPA0TbbQs2sG.mjv1v0SG', 'test2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dieseases`
--
ALTER TABLE `dieseases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `disease_description`
--
ALTER TABLE `disease_description`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5891E05A3FF17C5` (`diesease_id`);

--
-- Indexes for table `fdrelation`
--
ALTER TABLE `fdrelation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_395754C98288BF5B` (`fertilizer_id`),
  ADD KEY `IDX_395754C9A3FF17C5` (`diesease_id`);

--
-- Indexes for table `fertilizers`
--
ALTER TABLE `fertilizers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dieseases`
--
ALTER TABLE `dieseases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `disease_description`
--
ALTER TABLE `disease_description`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fdrelation`
--
ALTER TABLE `fdrelation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `fertilizers`
--
ALTER TABLE `fertilizers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disease_description`
--
ALTER TABLE `disease_description`
  ADD CONSTRAINT `FK_5891E05A3FF17C5` FOREIGN KEY (`diesease_id`) REFERENCES `dieseases` (`id`);

--
-- Constraints for table `fdrelation`
--
ALTER TABLE `fdrelation`
  ADD CONSTRAINT `FK_395754C98288BF5B` FOREIGN KEY (`fertilizer_id`) REFERENCES `fertilizers` (`id`),
  ADD CONSTRAINT `FK_395754C9A3FF17C5` FOREIGN KEY (`diesease_id`) REFERENCES `dieseases` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
