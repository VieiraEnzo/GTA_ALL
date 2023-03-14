CREATE TABLE IF NOT EXISTS Positions (
  id int(11) NOT NULL AUTO_INCREMENT,
  time timestamp NOT NULL,
  bidentification char(6) NOT NULL,
  bline varchar(7) DEFAULT NULL,
  lat float(8,6) NOT NULL,
  lng float(8,6) NOT NULL,
  speed int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY `time_uniqueness` (`time`,`bidentification`)
);

CREATE TABLE IF NOT EXISTS Buses (
  id int(11) NOT NULL AUTO_INCREMENT,
  identification char(6) NOT NULL,
  datacount int(11) DEFAULT 0,
  filtereddatacount int(11) DEFAULT 0,
  filtered TINYINT(1) DEFAULT 0,
  snapped TINYINT(1) DEFAULT 0,
  place_extracted TINYINT(1) DEFAULT 0,
  snapped_time_set TINYINT(1) DEFAULT 0,
  sections_set TINYINT(1) DEFAULT 0,
  PRIMARY KEY (id)
);

create index bus_raw_position_index on Positions (bidentification);

CREATE TABLE IF NOT EXISTS `Stops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` float(8,6) NOT NULL,
  `lng` float(8,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_StopLocation` (`lat`,`lng`)
);

CREATE TABLE IF NOT EXISTS Encounters(
id INT NOT NULL AUTO_INCREMENT,
time TIMESTAMP,
b_identification CHAR(6) NOT NULL,
stop_id INT,
b_lat FLOAT(8,6) NOT NULL,
b_lng FLOAT(8,6) NOT NULL,
distance FLOAT(10,9) NOT NULL,
PRIMARY KEY (id));