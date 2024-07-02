DROP DATABASE IF EXISTS Pets;

CREATE DATABASE Pets;
USE Pets;

CREATE TABLE Classroom_pets
(pet_id INT,
childs_name VARCHAR (15),
pet_type VARCHAR (15),
pet_name VARCHAR (20),
pet_age INT,
PRIMARY KEY (pet_type)
);

INSERT INTO Classroom_pets 
(pet_id, childs_name, pet_type, pet_name, pet_age)
VALUES 
(335, 'Theo', 'dog', 'Rufus', 5),
(229, 'Emily', 'cat', 'Whiskers', 3),
(162, 'Harry', 'dog', 'Archie', 6),
(021, 'Lily', 'hamster', 'Nibbles', 1); 