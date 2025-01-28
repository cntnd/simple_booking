--
-- Table structure for table `cntnd_payment`
--

CREATE TABLE `cntnd_payment` (
  `id` int(11) NOT NULL,
  `reference_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `forename` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `booking_name` varchar(255) NOT NULL,
  `booking_description` varchar(255) DEFAULT NULL,
  `booking_quantity` int(11) NOT NULL,
  `booking_amount` int(11) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `mut_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Table structure for table `cntnd_payment_config`
--

CREATE TABLE `cntnd_payment_config` (
  `id` int(11) NOT NULL,
  `price_id` int(11) DEFAULT NULL,
  `persons` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Table structure for table `cntnd_payment_price_config`
--

CREATE TABLE `cntnd_payment_price_config` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Table structure for table `cntnd_simple_booking_payment`
--

CREATE TABLE `cntnd_simple_booking_payment` (
  `id` int(11) NOT NULL,
  `idart` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` datetime NOT NULL,
  `persons` int(11) NOT NULL,
  `forename` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `booking_label` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `mut_date` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `cntnd_simple_booking_payment`
--
DELIMITER $$
CREATE TRIGGER `booking_history` AFTER INSERT ON `cntnd_simple_booking_payment` FOR EACH ROW INSERT INTO cntnd_simple_booking_payment_history (booking_id, idart, date, time, persons, forename, surname, street, postcode, place, email, phone, comment, create_date, mut_date, status) VALUES (NEW.id, NEW.idart, NEW.date, NEW.time, NEW.persons, NEW.forename, NEW.surname, NEW.street, NEW.postcode, NEW.place, NEW.email, NEW.phone, NEW.comment, NEW.create_date, NEW.mut_date, NEW.status)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `booking_history_delete` BEFORE DELETE ON `cntnd_simple_booking_payment` FOR EACH ROW INSERT INTO cntnd_simple_booking_payment_history (booking_id, idart, date, time, persons, forename, surname, street, postcode, place, email, phone, comment, create_date, mut_date, status) VALUES (OLD.id, OLD.idart, OLD.date, OLD.time, OLD.persons, OLD.forename, OLD.surname, OLD.street, OLD.postcode, OLD.place, OLD.email, OLD.phone, OLD.comment, OLD.create_date, OLD.mut_date, 'cancel')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `booking_history_update` AFTER UPDATE ON `cntnd_simple_booking_payment` FOR EACH ROW INSERT INTO cntnd_simple_booking_payment_history (booking_id, idart, date, time, persons, forename, surname, street, postcode, place, email, phone, comment, create_date, mut_date, status) VALUES (NEW.id, NEW.idart, NEW.date, NEW.time, NEW.persons, NEW.forename, NEW.surname, NEW.street, NEW.postcode, NEW.place, NEW.email, NEW.phone, NEW.comment, NEW.create_date, NEW.mut_date, NEW.status)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cntnd_simple_booking_payment_config`
--

CREATE TABLE `cntnd_simple_booking_payment_config` (
  `id` int(11) NOT NULL,
  `idart` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `time` datetime NOT NULL,
  `time_until` time DEFAULT NULL,
  `day` int(1) NOT NULL,
  `slots` int(10) NOT NULL,
  `price_id` int(10) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `recurrent` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Table structure for table `cntnd_simple_booking_payment_history`
--

CREATE TABLE `cntnd_simple_booking_payment_history` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `idart` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` datetime NOT NULL,
  `persons` int(11) NOT NULL,
  `forename` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `street` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `booking_label` varchar(255) DEFAULT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `mut_date` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for table `cntnd_payment`
--
ALTER TABLE `cntnd_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_booking` (`reference_id`);

--
-- Indexes for table `cntnd_payment_config`
--
ALTER TABLE `cntnd_payment_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idart_payment_config` (`price_id`);

--
-- Indexes for table `cntnd_payment_price_config`
--
ALTER TABLE `cntnd_payment_price_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `cntnd_simple_booking_payment`
--
ALTER TABLE `cntnd_simple_booking_payment`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idart` (`idart`);

--
-- Indexes for table `cntnd_simple_booking_payment_config`
--
ALTER TABLE `cntnd_simple_booking_payment_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idart` (`idart`);

--
-- Indexes for table `cntnd_simple_booking_payment_history`
--
ALTER TABLE `cntnd_simple_booking_payment_history`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idart` (`idart`),
  ADD KEY `booking_id` (`booking_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cntnd_payment`
--
ALTER TABLE `cntnd_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cntnd_payment_config`
--
ALTER TABLE `cntnd_payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `cntnd_payment_price_config`
--
ALTER TABLE `cntnd_payment_price_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cntnd_simple_booking_payment`
--
ALTER TABLE `cntnd_simple_booking_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `cntnd_simple_booking_payment_config`
--
ALTER TABLE `cntnd_simple_booking_payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `cntnd_simple_booking_payment_history`
--
ALTER TABLE `cntnd_simple_booking_payment_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;