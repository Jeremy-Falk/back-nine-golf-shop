DROP TABLE IF EXISTS sale_item, manufacturer, model, club_type CASCADE;

CREATE TABLE golf_club (
	sale_id serial PRIMARY KEY,
	manufacturer_id integer NOT NULL,
	model_id integer NOT NULL,
	club_type_id integer NOT NULL,
	serial_number varchar(20),
	status varchar(20) NOT NULL,
	price numeric(6,2) NOT NULL,
	condition varchar(20) NOT NULL
);

CREATE TABLE manufacturer (
	manufacturer_id serial PRIMARY KEY,
	manufacturer_name varchar(100) UNIQUE NOT NULL
);

CREATE TABLE model (
	model_id serial PRIMARY KEY,
	manufacturer_id integer NOT NULL,
	model_name VARCHAR(100) NOT NULL,
	gender VARCHAR(10) NOT NULL,
	CONSTRAINT FK_manufacturer_model FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id)
);

CREATE TABLE club_type (
	club_type_id serial PRIMARY KEY,
	club_type_name VARCHAR(50)
);


ALTER TABLE golf_club ADD CONSTRAINT FK_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(manufacturer_id);
ALTER TABLE golf_club ADD CONSTRAINT FK_model FOREIGN KEY (model_id) REFERENCES model(model_id);
ALTER TABLE golf_club ADD CONSTRAINT FK_club_type FOREIGN KEY (club_type_id) REFERENCES club_type(club_type_id);
ALTER TABLE golf_club ADD CONSTRAINT chk_condition CHECK (condition in ('NEW', 'MINT', 'ABOVE AVERAGE', 'AVERAGE', 'BELOW AVERAGE', 'P0OR'));
ALTER TABLE model ADD CONSTRAINT UQ_model_name_gender UNIQUE (model_name, gender);

--INSERT Club Types
INSERT INTO club_type(club_type_name) VALUES ('Driver');
INSERT INTO club_type(club_type_name) VALUES ('Fairway Wood');
INSERT INTO club_type(club_type_name) VALUES ('Hybrid');
INSERT INTO club_type(club_type_name) VALUES ('Iron');
INSERT INTO club_type(club_type_name) VALUES ('Wedge');
INSERT INTO club_type(club_type_name) VALUES ('Putter');

--INSERT MANUFACTURER NAMES
INSERT INTO manufacturer (manufacturer_name) VALUES ('Axis1');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Bettinardi');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Callaway');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Cleveland');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Cobra');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Evnroll');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Honma');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Mizuno');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Momentus');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Odyssey');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Ping');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Scotty Cameron');
INSERT INTO manufacturer (manufacturer_name) VALUES ('SeeMore');
INSERT INTO manufacturer (manufacturer_name) VALUES ('SIK');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Srixon');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Taylormade');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Titleist');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Tommy Armour');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Top Flite');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Tour Edge');
INSERT INTO manufacturer (manufacturer_name) VALUES ('U.S. Kids Golf');
INSERT INTO manufacturer (manufacturer_name) VALUES ('Wilson');
INSERT INTO manufacturer (manufacturer_name) VALUES ('XXIO GOLF');

--Insert Axis Models
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('1', 'Rose-B', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('1', 'Tour-HM', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('1', 'Tour-S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('1', 'Rose', 'Men');

--Insert Axis Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Queen B 6', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 Inoval 8.0 Armlock', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Studio Stock 18', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 BB46', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 BB1', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2020 BB8 Wide', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2020 BB1 Flow', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2020 BB1', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2020 iNOVAi 6.0 S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', 'Inovai 7.0 Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Queen B 11', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Studio Stock 17', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 2022 Inovai 6.0 Spud', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 BB8 Wide', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Studio Stock 28', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Studio Stock 28 Armlock', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', 'Inovai 7.0 Spud', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2020 iNOVAi 6.0', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 Inovai 6.0 Center Shaft', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 Inovai 6.0 Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2020 BB45', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2020 iNOVAi 6.0 CS', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 Inovai 8.0 Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Queen B 12', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Studio Stock 7', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2021 Studio Stock 28 Center Shaft', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 Inovai 8.0 Spud', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('2', '2022 BB1 Flow', 'Men');

--Insert Cleveland Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Frontline 2.0', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT 10.5C', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT 4', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT 8', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT 11', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT Premier 10.5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Frontline Elevado Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT Premier 4', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT Premier 11', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Frontline Custom', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Frontline Elevado Plumber''s Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach Soft #11', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Frontline ISO Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Frontline 4.0', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Frontline 10.5 Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT 3', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT 14', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT Premier 3 Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT Premier 8', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Huntington Beach SOFT Premier 10.5C', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Hungtngton Beach SOFT Premier 14', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('4', 'Hungtngton Beach SOFT 10.5C', 'Men');

--Insert Cobra Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Supernova-20 Flow Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Torino Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Agera Limited Edition Volition Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Grandsport-35 Armlock', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Agera Armlock', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Supernova Single Ben', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Vintage Stingray-20 Plumber''s Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Cuda-40 Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Agera-30 Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Cuda Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Widesport Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Agera Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Supernova-30 Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Sport-60 Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage NOVA-40 Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Stingray-40 Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Stingray Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Supernova Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Nova Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING Vintage Sport-45 Plumber''s Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Grandsport-35 Plumber''s Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('5', 'KING 3D Agera Limited Edition Palm Tree Crew Single Bend', 'Men');

--Insert Evnroll Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ERZ Zero', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER11vx Mallet Inline Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER2 MidBlade Black Single Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER11v Long Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER2 MidBlade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER2v MidBlade Short Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER8v TourMallet Short Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER2v MidBlade Short Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER8v TourMallet Short Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER11vx Long Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER2vB MidBlade Short Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER11vx MidLock', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER5W Hatchback', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER7v FullMallet Short Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER7v FullMallet Short Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER11v Mallet Short Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER2 MidBlade', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER Series Custom', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER V-Series Custom', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER1v TourBlade Long Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER10 Outback Black with Insert', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER1v TourBlade Long Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER5v Hatchback Short Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER7 FullMallet', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER Series Custom', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER5 Hatchback', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER5 Hatchback Black', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER5v Hatchback Short Slant', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER11v Mallet Short Plumber', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('6', 'ER2v ML Midblade', 'Men');

--Insert Mizuno Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. CRAFT Blue ION III', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M-Craft OMOI 03', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M-Craft OMOI 01', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. Craft IV', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. Craft V', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. Craft VI', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. CRAFT White Satin II', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. CRAFT Black ION II', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. CRAFT White Satin I', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. CRAFT Black ION I', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. CRAFT White Satin III', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M. CRAFT Black ION III', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('8', 'M-Craft OMOI 02', 'Men');

--Insert Odyssey Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab Seven S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven Tour Lined Double Bend Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven 2-Ball Tour Lined Double Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'DFX #7', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2020 White Hot RX 7 Black', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 Toulon Design Chicago Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab One', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven 2-Ball Double Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven 2-Ball Tour Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven 2-Ball Triple Track OS Double Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'DFX #1 Double Wide', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2020 White Hot RX 1 Black', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 Toulon Design Lemans Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 1', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 7 DB', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'DFX #1', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Triple Track 2-Ball', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab Tuttle', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2020 White Hot RX 7 Black', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab V-Line', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Tri-Hot 5K Double Wide CH', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven Triple Track Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Tour Authentic 2-Ball Ten', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab Ten S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 1 Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 7 S Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 7 DB Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 7 S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 2-Ball', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab Black Seven', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Triple Track Double Wide Flow', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab Black One', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2020 White Hot RX 2B Black', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 Toulon Design Madison Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 7 Nano Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'DFX Rossie', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG 2-Ball Stroke Lab', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG 7 CH', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven 2-Ball Tour Lined CH', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG 7 Bird Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 Toulon Design Daytona Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 Toulon Design Las Vegas Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2020 Toulon Design Seattle H1 Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2-Ball Ten', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2-Ball Ten S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2-Ball Ten Tour Lined S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2-Ball Ten Triple Track S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Ten S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG Double Wide Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG 1 Wide S', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab Black Seven S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab R-Ball S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Triple Track Marxman', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven Tour Lined Center Shaft', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG 2-Ball', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Tri-Hot 5K One CH', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Tri-Hot 5K Three Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Triple Track 2-Ball Blade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2020 White Hot RX 1W Black', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Ten Triple Track Putter', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG Rossie DB', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG 2-Ball Stroke Lab', 'Men');	
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Arm Lock 2-Ball Ten', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Toulon Design Austin Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG 7', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab R-Ball', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2-Ball Ten Tour Lined', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Eleven Tour Lined Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Ten', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'White Hot OG Rossie S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab Black R-Line Arrow', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG 7 Stroke Lab', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Toulon Design Las Vegas DB Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Stroke Lab V-Line S', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2-Ball Triple Track', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', '2022 White Hot OG 7 CH Stroke Lab', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Tri-Hot 5K Two CH', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('10', 'Tri-Hot 5K Triple Wide Double Bend', 'Men');

--Insert Ping Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', '2021 Anser', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Sigma 2 Anser Platinum', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Heppler Anser 2', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Sigma 2 Valor 400 Stealth', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'PLD Milled Anser', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Sigma 2 Tyne Stealth', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'PLD Milled Prime Tyne 4', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', '2021 Tyne 4', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', '2021 Kushin 4', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Heppler Tomcat 14 Slight Arc', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Heppler Fetch', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'G Le 2 Anser', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'PLD Milled Anser 2', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', '2021 Fetch', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Heppler Tyne 3', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Heppler Floki', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Sigma 2 Fetch Platinum', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Sigma 2 Arna Stealth', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', '2021 DS 72', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', '2021 Anser 2', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', '2021 Harwood', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'PLD Milled DS72', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', '2021 Tyne C', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('11', 'Heppler Ketsch', 'Men');

--Insert Scotty Cameron Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', 'Special Select Newport 2', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2022 Phantom X 5s', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', 'Special Select Squareback 2', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2022 Phantom X 5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2022 Phantom X 5.5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', 'Special Select Newport', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', 'Special Select Newport 2.5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', 'Special Select Fastback 1.5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2022 Phantom X 7', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2022 Phantom X 7.5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2022 Phantom X 11.5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2022 Phantom X 9.5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2021 Phantom X 11.5', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('12', '2022 Phantom X 9', 'Men');

--Insert SeeMore Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Black HT Mallet Hosel', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'PVD Pure Center Blade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Model B', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Model M', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'PVD Si5 Offset Mallet', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'PVD Original FGP Mallet', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Model T', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'PVD Si2 Blade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'PVD Si5 Mallet', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Model C', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'PVD Original FGP Blade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', '2020 Si5 Offset', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', '2020 Si2 Offset', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', '2020 Si3', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', '2020 HT Offset Mallet', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'FGP Mallet', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Black Si2 RST Hosel', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Si5 Mallet', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'HT Mallet', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Black Si3 RST Hosel Mallet', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('13', 'Black Si5 RST Hosel Mallet', 'Men');

--Insert SIK Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'FLO Armlock', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'DW Plumber''s Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'PRO Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'PRO Swept Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'FLO Plumber''s Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'DW Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'SHO Swept Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'JO Plumber''s Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'PRO Plumber''s Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'SHO Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'DW Armlock', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'DW Double Bend', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'DW Swept Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'FLO Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'JO Slant Neck', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('14', 'FLO Post Neck', 'Men');

--Insert Taylormade Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('16', 'Spider X #3 Copper', 'Men');

--Insert Tommy Armour Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('18', 'Impact No. 1 Blade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('18', 'Impact No. 3 Align', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('18', 'Impact No. 2 Wide Blade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('18', '2021 Impact Mallet', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('18', 'Impact Series No. 2 Mid Mallet', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('18', 'Impact No. 3 Align CB', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('18', 'Impact Series No. 1 Blade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('18', 'Impact Series No. 3 Alignment', 'Men');

--Insert Top Flite Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2020 Gamer Align 3', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2021 Gamer Blade', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2021 Gamer Alignment', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2021 Aura Blade', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2020 Flawless Blade 1', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2020 Flawless Mallet 2', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2020 Gamer Blade 1', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2021 Aura Mallet', 'Women');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2020 Gamer Mallet 2', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('19', '2021 Gamer Mallet', 'Men');

--Insert Top Flite Putters
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('20', 'HP Series 03', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('20', 'Exotics Wingman Mid-Toe Hang', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('20', 'HP Series 02', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('20', 'HP Series 04', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('20', 'HP Series 01 Counter-Balance', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('20', 'HP Series 01', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('20', 'HP Series 05', 'Men');
INSERT INTO model(manufacturer_id, model_name, gender) VALUES('20', 'Exotics Wingman Center-Shafted', 'Men');

--Insert Sample Clubs
--  sale_id, manufacturer_id, model_id, club_type_id, serial_number, status, price
INSERT INTO golf_club(manufacturer_id, model_id, club_type_id, serial_number, status, price, condition)
VALUES('12', '230', '6', '123456', 'For Sale', '350.00', 'AVERAGE')

