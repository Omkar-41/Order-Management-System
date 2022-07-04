-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2021 at 01:43 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(1, 'prathamesh patil', 'pratham31patil@gmail.com', '$2y$10$rCduHlh5WtNiIzJikR.ieu0uGx9VCqSX8VYHf8p3HqMYOK9QfVb1y', '0'),
(2, 'omkar', 'omkar@gmail.com', '$2y$10$fot0clwiUTVPKSEOzJEfr.LIuh9B9c29Z.Iv2jneexXovSfa58LYa', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(14, 'J V Healthcare'),
(15, 'Tyzpure Lifesciences');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(10, 1, '::1', 1, 1),
(11, 2, '::1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(17, 'tablet'),
(19, 'Syrup'),
(21, 'Soap, Lotion & Oil'),
(22, 'Gel & Powder');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `mobile`, `message`) VALUES
(1, 'prathamesh patil', 'pratham31patil@gmail.com', '9137433142', 'hi'),
(2, 'Demo', 'fs19if002@gmail.com', '1568545856', 'Checking the Message Feature.'),
(3, 'medicine', 'fs19if002@gmail.com', '5245859631', 'Thanks message Checking');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `p_status` varchar(20) NOT NULL,
  `Amount` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `p_status`, `Amount`, `date`) VALUES
(1, 3, 1, 9, 'placed', '468', '2021-12-07'),
(2, 3, 2, 1, 'placed', '95', '2021-12-07'),
(3, 3, 1, 1, 'placed', '52', '2021-12-07'),
(4, 3, 1, 1, 'placed', '52', '2021-12-07'),
(5, 3, 2, 1, 'placed', '95', '2021-12-07'),
(6, 3, 4, 1, 'placed', '70', '2021-12-07'),
(7, 3, 6, 1, 'placed', '120', '2021-12-07'),
(8, 3, 3, 1, 'placed', '65', '2021-12-07'),
(9, 3, 4, 1, 'placed', '70', '2021-12-07'),
(10, 3, 6, 1, 'placed', '120', '2021-12-07'),
(11, 3, 3, 1, 'placed', '65', '0000-00-00'),
(12, 3, 4, 1, 'placed', '70', '0000-00-00'),
(13, 3, 10, 1, 'placed', '135', '2021-12-07'),
(14, 3, 2, 1, 'placed', '95', '2007-12-21'),
(15, 1, 1, 2, 'placed', '104', '2021-12-07'),
(16, 1, 6, 1, 'placed', '120', '2021-12-07');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`) VALUES
(2, 17, 14, 'Azpar-SP Tab', 95, 200, 'Aceclofenac 100mg + Paracetamol 325mg + Serratiopeptidase 15mg', '1637633240_Azpar-SP.jpg'),
(3, 17, 14, 'Azpar 200 SR Tab', 65, 200, 'Aceclofenac 200mg', '1637633320_Azpar-200 SR.jpg'),
(4, 17, 14, 'Azpar-MR Tab', 70, 150, 'Aceclofenac 100mg + Paracetamol 325mg + Chlorozoxazone', '1637633444_Azpar-MR.jpg'),
(5, 17, 14, 'Azpar-TX ', 188, 250, 'Aceclofenac 100mg + Thiocolchicoside 8mg', '1637633531_Azpar-TX.jpg'),
(6, 17, 14, 'CBX-625', 120, 200, 'Amoxycillin 500mg + Clavulanic acid125mg', '1637633716_CBX-625.jpg'),
(9, 17, 14, 'XICM-200', 107, 100, 'Cefixime 200mg', '1637633904_Xicm-200.jpg'),
(10, 17, 14, 'XICM-LB', 135, 150, 'Cefixime 200mg + Lactic Acid Bacillius', '1637633952_Xicm-LB.jpg'),
(12, 17, 14, 'Podoxin-CV', 195, 100, 'Cepodoxine proxetil200mg+Clavulanic Acid 125mg', '1637634126_Podoxin-CV.jpg'),
(13, 19, 14, 'Podoxin-CV Syrup', 120, 50, 'Cefpodoxime Proxetil 50mg + Potassium\r\nClavulanate 31.25 mg/5ml\r\n', '1637634238_Podoxin-CV Syrup.jpg'),
(14, 17, 14, 'Ceftore-500', 340, 100, 'Cefuroxime Axetil 500mg', '1637634312_Ceftore-500.jpg'),
(15, 17, 14, 'Livox-500', 90, 150, 'Levofloxacin 500mg', '1637634398_Livox-500.jpg'),
(16, 17, 14, 'Oxib-60', 75, 50, 'Etoricoxib 60mg', '1637634563_Oxib-60.jpg'),
(17, 17, 14, 'Oxib-90', 95, 50, 'Etoricoxib 90mg', '1637634616_Oxib-90.jpg'),
(18, 17, 14, 'Oxib-120', 125, 20, 'Etoricoxib 120mg', '1637634666_Oxib-120.jpg'),
(19, 17, 14, 'Oxib-MR', 187, 20, 'Etoricoxib +  Chlorozoxazone', '1637634743_Oxib-MR.jpg'),
(20, 17, 14, 'Keronac', 90, 50, 'Ketorolac Tromethamine 10mg', '1637634796_Keronac.jpg'),
(21, 17, 14, 'Jvflox-OZ ', 95, 150, 'Ofloxacin 200mg + Ornidazole 500mg', '1637634847_Jvflox-OZ.jpg'),
(22, 17, 14, 'Meuvit Tab', 90, 50, 'Multivitamin + Multimineral with Antioxidant', '1637634904_Meuvit.jpg'),
(23, 19, 14, 'Meuvit Syrup', 110, 100, 'Multivitamin with Multimineral Syrup', '1637635034_Meuvit Syrup.jpg'),
(24, 17, 14, 'Mojer Tab', 50, 100, 'Levocetrizine', '1637635117_Mojer.jpg'),
(25, 17, 14, 'Mojer-FX Tab', 130, 50, 'Fexofenadine 120mg + Montelukast10mg', '1637635159_Mojer-FX.jpg'),
(26, 17, 14, 'Mojer-LC kid Tab', 52, 50, 'Levocetrizine + Dihydrochloride + Montelukast\r\nSodium Dispersible Tab\r\n', '1637635236_Mojer-LC Kid.jpg'),
(27, 17, 14, 'Mojer-LC Tab', 110, 50, 'Levocetrizine 5mg + Montelukast', '1637635285_Mojer-LC.jpg'),
(28, 19, 14, 'Mojer-LC Syrup', 90, 50, 'Levocetrizine + Dihydrochloride + Montelukast Oral Syrup', '1637635346_Mojer-LC Syrup.jpg'),
(29, 17, 14, 'Demlar-Cold Tab', 55, 50, 'Paracetamol 325mg + Phenylephrine\r\nHCL + Diphenydramine HCL & caffeineTablets\r\n', '1637635450_Demlar-Cold.jpg'),
(30, 19, 14, 'Demlar Syrup', 55, 20, 'Paracetamol 125mg + Chlorpheniramine Meleate 0.5mg + Phenylepheine HCL 5mg + Sodium Citrate\r\n60mg + Menthol 1mg\r\n', '1637635510_Demlar Syrup.jpg'),
(31, 17, 14, 'Ajx-250 Tab', 70, 100, 'Azithromycin 250mg', '1637635585_Ajx-250.jpg'),
(32, 17, 14, 'Ajx-500 Tab', 71, 100, 'Azithromycin 500mg', '1637635621_Ajx-500.jpg'),
(33, 17, 14, 'Olacort-6 Tab', 90, 50, 'Deflazocort 6mg', '1637635701_Olacort-6.jpg'),
(34, 17, 14, 'Livonim-P Tab', 40, 200, 'Nimesuilide 200mg + Paracetamol 325mg', '1637635806_Livonim-P.jpg'),
(35, 17, 14, 'Rabib-D Tab', 65, 300, 'Rebeprazole 20MG + Domperidone10mg', '1637635864_Rabib-D.jpg'),
(36, 17, 14, 'Rabib-DSR Tab', 90, 200, 'Rabeprazole Sodium and\r\nDomperidone SR Capsules\r\n', '1637635942_Rabib-DSR.jpg'),
(37, 17, 14, 'Eassy-D Tab', 110, 50, 'Esomeprazole 40mg + Domperidone60mg', '1637636051_Eassy-D.jpg'),
(38, 17, 14, 'Pankol-D Tab', 65, 200, 'Pantoprazole 40mg+ Domperidone10mg', '1637636122_Pankol-D.jpg'),
(39, 17, 14, 'Pankol-DSR Tab', 100, 200, 'Pantaprazole Gastro-resistant and\r\nDomperidone Prolonged release Capsules\r\n', '1637636177_Pankol-DSR.jpg'),
(40, 17, 14, 'Rabib-LS Tab', 145, 50, 'Rabeprazole 20mg + Levosulpride', '1637636262_Rabib-LS.jpg'),
(41, 19, 14, 'Lysee-B Syrup', 90, 100, 'Vitamin B3 + B6 + B12 with L-Lysine HCL', '1637636345_Lysee-B Syrup.jpg'),
(42, 19, 14, 'Dexyzyme Syrup', 95, 100, 'Fungal Diastase with Pepsin', '1637636402_Dexyzyme Syrup.jpg'),
(43, 19, 14, 'Jvtuss Syrup', 76, 50, 'Maleate + Dextromenthorphan 10mg\r\n+ Hydrobromide & Phenylephrine HCL\r\n', '1637636463_Jvtuss syrup.jpg'),
(44, 19, 14, 'Jvtuss-T Syrup', 70, 50, 'Terbutaline sulphate 1.25mg + Bromhexine HCL.2mg + Guaiphenesin 50mg + Menthol/5ml', '1637636513_Jvtuss-T Syrup.jpg'),
(45, 19, 14, 'Jvtuss-AX Syrup', 87, 50, 'Ambrxol Hdr. 15mg + Terbutaline 1.25mg + Guapheesin 50mg/5ml', '1637636554_Jvtuss-AX Syrup.jpg'),
(46, 19, 14, 'Jvtuss LS Syrup', 80, 100, 'Levosalbutamol Sulphate 1 mg + Ambroxol HCl 30 mg + Guaiphenesin 50mg /5ml', '1637636594_Jvtuss-LS Syrup.jpg'),
(47, 17, 14, 'Itzo-100 Tab', 140, 20, 'Itraconazole 100mg', '1637636708_Itzo-100.jpg'),
(48, 17, 14, 'Itzo-200 Tab', 160, 20, 'Itraconazole 200mg', '1637636744_Itzo-100.jpg'),
(49, 21, 14, 'Skabanil Soap', 80, 20, 'Permethrine 5% + Cetrimide 0.01%', '1637636838_Skabanil Soap.jpg'),
(50, 21, 14, 'Skabanil Lotion', 90, 20, 'Permethrine 5% + Cetrimide 0.01%', '1637637010_Skabanil Lotion.jpg'),
(51, 21, 14, 'K-zee Soap', 90, 20, 'Ketoconazole Soap 1% w/w', '1637637158_K-zee Soap.jpg'),
(52, 17, 14, 'Thyokal Tab', 100, 50, 'Calcium citrate USP 1000MG + Megnesuim 100mg +\r\nZinc Sulphate 4mg + Vitamin d3 200 I.U\r\n', '1637637315_Thyokal.jpg'),
(53, 17, 14, 'Thyokal-CZ Tab', 125, 30, 'Calcium Citrate 500 mg + Calcitriol 0.25 mcg +\r\nMagnesium 50 mg + Zinc 7.5 mg\r\n', '1637637358_Thyokal-CZ.jpg'),
(54, 17, 14, 'Thyokal-k27 Tab', 135, 40, 'Calcium Carbonate + Cholecalciferol +Vitamin K-27  & Floic Acid', '1637637423_Thyokal-k27.jpg'),
(55, 17, 14, 'Thyokal-60K Tab', 120, 30, 'Cholecalciferol 60,000 I.U. SoftgelCapsules', '1637637499_Thyokal-60K.jpg'),
(56, 22, 14, 'Itzo-OC Gel', 86, 50, 'Itraconazole 1% + Ofloxacin 0.75% + Ornidazole 2% +\r\nclobetasol 0.05% + methylparaben 0.20% +\r\npropylparaben 0.02%\r\n', '1637637572_Itzo-OC Cream.jpg'),
(57, 22, 14, 'Lilycona-Cream', 145, 50, 'Luliconazole cream 1% w/w', '1637637616_Lilycona Cream.jpg'),
(58, 22, 14, 'Dgzoint Cream', 99, 50, 'Diclofenac Diethylamine + Methylsalicylate\r\n+ Linseed Oil & Menthol\r\n', '1637637670_Dgzoint Cream.jpg'),
(59, 17, 14, 'Feezore-XT ', 105, 60, 'Ferrous Ascorbate 100 mg + Folic Acid 5 mg + Zinc 7.5 mg + Adenosylcobalamin 100 mg + Niacinamide10 mg + Vitamin B1 1mg\r\n+Vitamin B6 3 mg + Vitamin B12 1mcg\r\n', '1637637734_Feezore-XT.jpg'),
(60, 17, 14, 'PV-75', 118, 50, 'Pregabalin 75mg + Methylcobalamin 750 mcg Cap', '1637637817_PV-75.jpg'),
(61, 22, 14, 'Jedpro DHA', 275, 50, 'Protein Powder', '1637637903_Jedpro DHA.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `DL_Number` text NOT NULL,
  `Address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `DL_Number`, `Address`) VALUES
(1, 'Yugandhar', 'sarode', 'sarodeyugandhar@gmail.com', 'b247b47dc25db33b0c4dc8db19f02abd', '1568536856', 'MH-JAL-526453', 'dummy address'),
(2, 'prathamesh', 'patil', 'pratham31patil@gmail.com', '916172e7995de7e1e64c0c3aad1edd59', '9137433142', '56', 'mumbai'),
(3, 'prathamesh', 'patil', 'fs19if004@gmail.com', '916172e7995de7e1e64c0c3aad1edd59', '9137433142', '89', 'mumbai');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
