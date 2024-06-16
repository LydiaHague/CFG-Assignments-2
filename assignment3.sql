DROP DATABASE IF EXISTS Festivals;

CREATE DATABASE Festivals;

USE Festivals;

CREATE TABLE Festival_details
(festival_id VARCHAR (10) NOT NULL, 
festival_name VARCHAR (50) NOT NULL, 
festival_location VARCHAR (20) NOT NULL, 
festival_date DATE NOT NULL, 
festival_duration INT,
PRIMARY KEY (festival_id)
);

CREATE TABLE Performers
(performer_id INT NOT NULL,
performer_name VARCHAR (20) NOT NULL,
band_members INT,
backing_dancers INT, 
managers_contact BIGINT,
PRIMARY KEY (performer_id)
);

CREATE TABLE Schedules
(schedule_id VARCHAR (10) NOT NULL UNIQUE, 
festival_id VARCHAR (10) NOT NULL, 
performer_id INT NOT NULL,
performance_date DATE NOT NULL, 
performance_time TIME NOT NULL, 
stage VARCHAR (20),
FOREIGN KEY (festival_id) REFERENCES Festival_details (festival_id),
FOREIGN KEY (performer_id) REFERENCES Performers (performer_id));



-- Inserting data into our tables
INSERT INTO Festival_details
(festival_id, festival_name, festival_location, festival_date, festival_duration)
VALUES
('RD24', 'Reading_Festival', 'Reading', '2024-07-21', 3),
('LD24', 'Leeds_Festival', 'Leeds', '2024-08-03', 4),
('PK24', 'Parklife', 'Manchester', '2024-07-15', 2),
('IW24', 'Isle_of_Wight_Festival', 'Isle_of_Wight', '2024-06-22', 3);


INSERT INTO Performers
(performer_id, performer_name, band_members, backing_dancers, managers_contact)
VALUES
(225, 'Raye', 7, null, 07797389720),
(762, 'Beyonce', 5, 15, 07812946784), 
(198, 'Fred Again', null, null, 07345621987), 
(621, 'Arctic Monkeys', 5, null, 07127493810);


INSERT INTO Schedules
(schedule_id, festival_id, performer_id, performance_date, performance_time, stage)
VALUES
('T3HG6', 'RD24', 225, '2024-07-21', '21:00:00', 'Main_Stage'),
('KNHS8', 'RD24', 762, '2024-07-23', '22:00:00', 'Main_Stage'),
('RS2N7', 'LD24', 198, '2024-08-05', '22:00:00', 'Main_Stage'),
('JH55M', 'PK24', 198, '2024-07-15', '21:00:00', 'Parklife_Stage'),
('L90BI', 'IW24', 621, '2024-06-22', '20:00:00', 'Big_Top'),
('QW68G', 'IW24', 762, '2024-06-24', '22:00:00', 'Main_Stage');



SELECT * FROM Performers;
SELECT * FROM Schedules;
SELECT * FROM Festival_details
ORDER BY festival_date ASC;


-- Example of a query to retrieve data of all the scheduled perfomances for one particular artist
SELECT * FROM Schedules
WHERE performer_id = '198'
ORDER BY performance_date ASC;


-- Example of a query to find out all the artists playing at Isle of Wight Festival with data taken from two different tables
SELECT performer_name, festival_name
FROM Performers, Festival_details
WHERE festival_name = 'Isle_of_Wight_Festival'; 


-- Example of a query to quickly find out the managers contact details for a particular performer 
SELECT performer_name, managers_contact
FROM Performers
WHERE performer_name = 'Beyonce';


-- Example of a query to show all the festivals going on after a certain date in ascending order
SELECT festival_name, festival_date
FROM Festival_details
WHERE festival_date > '2024-07-15'
ORDER BY festival_date ASC;

-- An example of a query to see how many band members each act has using descending order
SELECT performer_name, band_members
FROM Performers
ORDER BY band_members DESC;



-- Example of an inner join to show what stage each performer is playing at
SELECT p.performer_name, s.stage
FROM Performers p
INNER JOIN Schedules s ON p.performer_id = s.performer_id;


-- Another example of a join to show all the performers at Reading festival and what date and time they are playing
SELECT p.performer_name, s.performance_date, s.performance_time
FROM Performers p
LEFT JOIN Schedules s ON p.performer_id = s.performer_id
WHERE festival_id = 'RD24';



-- Example of an aggregate function to calculate how many festivals there are
SELECT COUNT(*) AS Amount_of_Festivals FROM Festival_details;

-- Example of an aggregate function to show the shortest festival in terms of duration
SELECT MIN(festival_duration) AS shortest_festival FROM Festival_details;

-- Example of an aggregate function to show the maximum amount of backing dancers
SELECT MAX(backing_dancers) AS maximum_backing_dancers FROM Performers;



-- Example of an in-built function to change all of the festival names to Upper case
SELECT UPPER(festival_name) AS upper_festival_name
FROM Festival_details;

-- Example of an in-built function to show the average duration of all of the festivals
SELECT ROUND(AVG(festival_duration)) AS average_duration
FROM Festival_details;



-- Example of a stored procedure to add a new fesitval to the festival_details table
DELIMITER //
CREATE PROCEDURE add_festival(
IN festival_id VARCHAR (10),
IN festival_name VARCHAR (50), 
IN festival_location VARCHAR (20), 
IN festival_date DATE, 
IN festival_duration INT)

BEGIN
INSERT INTO Festival_details (festival_id, festival_name, festival_location, festival_date, festival_duration)
VALUES (festival_id, festival_name, festival_location, festival_date, festival_duration);
END//
DELIMITER ;

CALL add_festival ('GB24', 'Glastonbury', 'Somerset', '2024-06-27', 5);



-- Example of using a query to delete data if the date has past and any schedules from that date or before need deleting
DELETE FROM Schedules
WHERE performance_date < '2024-06-24'




