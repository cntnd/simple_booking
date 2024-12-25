--
-- Tabellenstruktur für Tabelle `cntnd_payment`
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
  `transaction_id` int(11) DEFAULT NULL,
  `mut_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'open'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tabellenstruktur für Tabelle `cntnd_payment_config`
--

CREATE TABLE `cntnd_payment_config` (
  `id` int(11) NOT NULL,
  `price_id` int(11) DEFAULT NULL,
  `persons` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Tabellenstruktur für Tabelle `cntnd_payment_price_config`
--

CREATE TABLE `cntnd_payment_price_config` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Tabellenstruktur für Tabelle `cntnd_simple_booking_payment`
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
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `mut_date` datetime DEFAULT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tabellenstruktur für Tabelle `cntnd_simple_booking_payment_config`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `cntnd_payment`
--
ALTER TABLE `cntnd_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_booking` (`reference_id`);

--
-- Indizes für die Tabelle `cntnd_payment_config`
--
ALTER TABLE `cntnd_payment_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idart_payment_config` (`price_id`);

--
-- Indizes für die Tabelle `cntnd_payment_price_config`
--
ALTER TABLE `cntnd_payment_price_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indizes für die Tabelle `cntnd_simple_booking_payment`
--
ALTER TABLE `cntnd_simple_booking_payment`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idart` (`idart`);

--
-- Indizes für die Tabelle `cntnd_simple_booking_payment_config`
--
ALTER TABLE `cntnd_simple_booking_payment_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idart` (`idart`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `cntnd_payment`
--
ALTER TABLE `cntnd_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `cntnd_payment_config`
--
ALTER TABLE `cntnd_payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `cntnd_payment_price_config`
--
ALTER TABLE `cntnd_payment_price_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `cntnd_simple_booking_payment`
--
ALTER TABLE `cntnd_simple_booking_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `cntnd_simple_booking_payment_config`
--
ALTER TABLE `cntnd_simple_booking_payment_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;