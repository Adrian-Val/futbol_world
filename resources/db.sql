CREATE DATABASE futbol_world;
USE futbol_world;

CREATE TABLE tbl_countrys (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO tbl_countrys(id,name) VALUES (1,'España'),(2,'Polonia'),(3,'Francia'),(4,'México'),(5,'Belgica'),(6,'Inglaterra'),(7,'Uruguay'),(8,'Argentina'),(9,'Alemania'),(10,'Países Bajos'),(11,'Portugal'),(12,'República Checa'),(13,'Ecuador'),(14,'Brasil'),(15,'Noruega'),(16,'Italia'),(17,'Georgia');

CREATE TABLE tbl_players (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  lastname varchar(100) DEFAULT NULL,
  market_value int(11) DEFAULT NULL,
  dorsal int(11) DEFAULT NULL,
  id_tbl_position int(11) DEFAULT NULL,
  id_tbl_team int(11) DEFAULT NULL,
  id_tbl_country int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY id_tbl_position (id_tbl_position),
  KEY id_tbl_team (id_tbl_team),
  KEY id_tbl_country (id_tbl_country),
  CONSTRAINT tbl_players_ibfk_1 FOREIGN KEY (id_tbl_position) REFERENCES tbl_positions (id),
  CONSTRAINT tbl_players_ibfk_2 FOREIGN KEY (id_tbl_team) REFERENCES tbl_teams (id),
  CONSTRAINT tbl_players_ibfk_3 FOREIGN KEY (id_tbl_country) REFERENCES tbl_countrys (id)
);

INSERT INTO tbl_players(id,name,lastname,market_value,dorsal,id_tbl_position,id_tbl_team,id_tbl_country) VALUES (1,'Thibaut','Courtois',25000000,1,1,1,5),(2,'Antonio','Rüdiger',24000000,22,2,1,9),(3,'Federico','Valverde',130000000,8,3,1,7),(4,'Kylian','Mbappé',170000000,9,4,1,3),(5,'Marc-André','ter Stegen',15000000,1,1,2,9),(6,'Eric','García',15000000,24,2,2,1),(7,'Frenkie','de Jong',45000000,21,3,2,10),(8,'Robert','Lewandowski',15000000,9,4,2,2),(9,'Raúl','Rangel',4500000,1,1,3,4),(10,'Alan','Mozo',4500000,2,2,3,4),(11,'Roberto','Alvarado',7000000,25,3,3,4),(12,'Alan','Pulido',1300000,9,4,3,4),(13,'Pau','López',3000000,18,1,4,1),(14,'Jesús','Gallardo',3500000,20,2,4,4),(15,'Franco','Romero',1500000,5,3,4,8),(16,'Paulinho',NULL,8000000,26,4,4,11),(17,'Manuel','Neur',4000000,1,1,5,9),(18,'Dayot','Upamecano',50000000,2,2,5,3),(19,'Leon','Goretzka',22000000,8,3,5,9),(20,'Harry','Kane',90000000,9,4,5,6),(21,'Matej','Kovar',7000000,17,1,6,12),(22,'Piero','Hincapié',50000000,3,2,6,13),(23,'Exequiel','Palacios',40000000,25,3,6,8),(24,'Patrik','Schick',27000000,14,4,6,12),(25,'David','Raya',40000000,22,1,7,1),(26,'William','Saliba',80000000,2,2,7,3),(27,'Declan','Rice',110000000,41,3,7,6),(28,'Gabriel','Martinelli',55000000,11,4,7,14),(29,'Ederson',NULL,25000000,31,1,8,14),(30,'Rúben','Dias',70000000,3,2,8,11),(31,'Bernardo','Silva',45000000,20,3,8,11),(32,'Erling','Haaland',200000000,9,4,8,15),(33,'Mike','Maignan',25000000,16,1,9,3),(34,'Matteo','Gabbia',14000000,46,2,9,16),(35,'Tijjani','Reijnders',50000000,14,3,9,10),(36,'Santiago','Gimenez',37000000,7,4,9,4),(37,'Gianluigi','Donnarumma',35000000,1,1,10,16),(38,'Presnel','Kimpembe',8000000,3,2,10,3),(39,'Khvicha','Kvaratskhelia',80000000,7,3,10,17),(40,'Goncalo','Ramos',45000000,9,4,10,11);

DROP TABLE IF EXISTS tbl_positions;

CREATE TABLE tbl_positions (
  id int(11) NOT NULL AUTO_INCREMENT,
  name char(3) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO tbl_positions(id,name) VALUES (1,'POR'),(2,'DEF'),(3,'MED'),(4,'DEL');

DROP TABLE IF EXISTS tbl_teams;

CREATE TABLE tbl_teams (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tbl_teams(id,name) VALUES (1,'Real Madrid'),(2,'Barcelona'),(3,'Chivas'),(4,'Toluca'),(5,'Bayern de Múnich'),(6,'Bayer 04 Leverkusen'),(7,'Arsenal'),(8,'Manchester City'),(9,'Milan'),(10,'PSG');