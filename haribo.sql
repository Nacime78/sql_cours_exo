-- mysql -u root --
-- SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| entreprise         |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+

-- Créer une base de données SQL nommée haribo
CREATE DATABASE haribo;
Query OK, 1 row affected (0.001 sec)

SHOW DATABASE;
+--------------------+
| Database           |
+--------------------+
| entreprise         |
| haribo             |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| test               |
+--------------------+

-- 3/4/5 --

-- Table Stagiaires
CREATE TABLE stagiaires(
    id int(3) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    prenom varchar(100) NOT NULL,
    yeux varchar(30) NOT NULL,
    genre enum('M', 'F') NOT NULL
);

-- Tables Bonbons
CREATE TABLE Bonbons(
    id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom varchar(100) NOT NULL,
    saveur varchar(100) NOT NULL
);

-- Table Bonbon mangés par les Stagiaires
CREATE TABLE candisplay(
    id int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_bonbon int(11) DEFAULT NULL,
    id_stagiaire int(11) DEFAULT NULL,
    date_manger DATE NOT NULL,
    quantite int(11) NOT NULL
);

----------------------------------------------

-- INSERT INTO stagiaires
INSERT INTO stagiaires (prenom, yeux, genre)
VALUES
('Nouha', 'marron', 'm'),
('Nacime', 'marron', 'm'),
('Tom', 'vert', 'm'),
('Kevin', 'noir', 'm'),
('Shaymae', 'marron', 'f'),
('Delia', 'marron', 'f'),
('Dominique', 'vert', 'm'),
('Yadaf', 'marron', 'm');

---------------------------------------------

-- INSERT INTO bonbons
INSERT INTO Bonbons (nom, saveur) 
VALUES 
('dragibus', 'cola'),
('tagada', 'fraise'),
('bams', 'banane'),
('rotaled', 'reglisse'),
('floppys', 'sucre'),
('rainbollows', 'marshmallow'),
('bigharri', 'cerise'),
('oursor', 'fruits'),
('croco', 'fruits'),
('oeufoplat', 'fruits'),
('flanbotti', 'caramel');

-------------------------------------------

-- INSERT INTO candisplay
INSERT INTO candisplay(id_bonbon, id_stagiaire, date_manger, quantite)
VALUES
(4, 7, '2022-06-20', 5),
(1, 1, '2022-06-05', 5),
(2, 2, '2022-06-03', 5),
(3, 3, '2022-06-04', 5),
(5, 4, '2022-06-15', 5),
(6, 5, '2022-06-18', 5),
(7, 6, '2022-06-22', 5),
(8, 8, '2022-06-25', 5),
(9, 9, '2022-06-24', 5),
(10, 10, '2022-06-01', 5),
(11, 11, '2022-06-06', 5);

-- Lister les tables de la BDD **haribo**;

SHOW TABLES;
+------------------+
| Tables_in_haribo |
+------------------+
| bonbons          |
| candisplay       |
| stagiaires       |
+------------------+

-- Voir les paramètres de la table Bonbons;

DESCRIBE Bonbons;
+--------+--------------+------+-----+---------+----------------+
| Field  | Type         | Null | Key | Default | Extra          |
+--------+--------------+------+-----+---------+----------------+
| id     | int(11)      | NO   | PRI | NULL    | auto_increment |
| nom    | varchar(100) | NO   |     | NULL    |                |
| saveur | varchar(100) | NO   |     | NULL    |                |
+--------+--------------+------+-----+---------+----------------+

-- Selectionner tous les champs de tous les enregistrements de la table *stagiaires*;

SELECT * FROM stagiaires;
+----+-----------+--------+-------+
| id | prenom    | yeux   | genre |
+----+-----------+--------+-------+
|  1 | Yacine    | marron | M     |
|  2 | Hafsa     | marron | F     |
|  3 | Henri     | bleu   | M     |
|  4 | Nouha     | marron | M     |
|  5 | Nacime    | marron | M     |
|  6 | Tom       | vert   | M     |
|  7 | Kevin     | noir   | M     |
|  8 | Shaymae   | marron | F     |
|  9 | Delia     | marron | F     |
| 10 | Dominique | vert   | M     |
| 11 | Yadaf     | marron | M     |
+----+-----------+--------+-------+

-- Rajouter dans la table Bonbons que Theo a mangé 5 Tagada le '15 juin 2022';
-- Ajouter tagada purple dans la table Bonbons et ajouter dans le reste dans candisplay

-- Afficher les noms de tous les bonbons
SELECT nom FROM Bonbons;
+-------------+
| nom         |
+-------------+
| dragibus    |
| tagada      |
| bams        |
| rotaled     |
| floppys     |
| rainbollows |
| bigharri    |
| oursor      |
| croco       |
| oeufoplat   |
| flanbotti   |
| tagada      |
+-------------+

-- Afficher tous les noms des bonbons en enlevant les doublons
SELECT DISTINCT nom FROM Bonbons;
+-------------+
| nom         |
+-------------+
| dragibus    |
| tagada      |
| bams        |
| rotaled     |
| floppys     |
| rainbollows |
| bigharri    |
| oursor      |
| croco       |
| oeufoplat   |
| flanbotti   |
+-------------+

-- Récupérer les couleurs des yeux des stagiaires (Séléctionner plusieurs champs dans une table)
SELECT prenom, yeux FROM stagiaires;
+-------------+--------+
| prenom      | yeux   |
+-------------+--------+
| Yacine      | marron |
| Hafsa       | marron |
| Henri       | bleu   |
| Nouha       | marron |
| Nacime      | marron |
| Tom         | vert   |
| Kevin       | noir   |
| Shaymae     | marron |
| Delia       | marron |
| Dominique   | vert   |
| Yadaf       | marron |
| Niamatullah | marron |
| Theo        | marron |
+-------------+--------+

-- Séléctionner les couleurs des yeux des stagiaires sans les doublons
SELECT * FROM stagiaires GROUP BY yeux;
+----+--------+--------+-------+
| id | prenom | yeux   | genre |
+----+--------+--------+-------+
|  3 | Henri  | bleu   | M     |
|  1 | Yacine | marron | M     |
|  7 | Kevin  | noir   | M     |
|  6 | Tom    | vert   | M     |
+----+--------+--------+-------+

-- Séléctionner tous les stagiaires qui ont les yeux marrons
SELECT * FROM stagiaires WHERE yeux = 'marron';
+----+-------------+--------+-------+
| id | prenom      | yeux   | genre |
+----+-------------+--------+-------+
|  1 | Yacine      | marron | M     |
|  2 | Hafsa       | marron | F     |
|  4 | Nouha       | marron | M     |
|  5 | Nacime      | marron | M     |
|  8 | Shaymae     | marron | F     |
|  9 | Delia       | marron | F     |
| 11 | Yadaf       | marron | M     |
| 12 | Niamatullah | marron | M     |
| 14 | Theo        | marron | M     |
+----+-------------+--------+-------+

-- Séléctionner tous les stagiaires dont l'id est plus grand que 8
SELECT * FROM stagiaires WHERE id > 8;
+----+-------------+--------+-------+
| id | prenom      | yeux   | genre |
+----+-------------+--------+-------+
|  9 | Delia       | marron | F     |
| 10 | Dominique   | vert   | M     |
| 11 | Yadaf       | marron | M     |
| 12 | Niamatullah | marron | M     |
| 14 | Theo        | marron | M     |
+----+-------------+--------+-------+

-- Séléctionner tous les stagiaires sauf le stagiaire avec l'id = 13
SELECT * FROM stagiaires WHERE id != 13;
+----+-------------+--------+-------+
| id | prenom      | yeux   | genre |
+----+-------------+--------+-------+
|  1 | Yacine      | marron | M     |
|  2 | Hafsa       | marron | F     |
|  3 | Henri       | bleu   | M     |
|  4 | Nouha       | marron | M     |
|  5 | Nacime      | marron | M     |
|  6 | Tom         | vert   | M     |
|  7 | Kevin       | noir   | M     |
|  8 | Shaymae     | marron | F     |
|  9 | Delia       | marron | F     |
| 10 | Dominique   | vert   | M     |
| 11 | Yadaf       | marron | M     |
| 12 | Niamatullah | marron | M     |
| 14 | Theo        | marron | M     |
+----+-------------+--------+-------+

-- Séléctionner tous les stagiaires qui ont un id inférieur ou égal à 10
SELECT * FROM stagiaires WHERE id <= 10;
+----+-----------+--------+-------+
| id | prenom    | yeux   | genre |
+----+-----------+--------+-------+
|  1 | Yacine    | marron | M     |
|  2 | Hafsa     | marron | F     |
|  3 | Henri     | bleu   | M     |
|  4 | Nouha     | marron | M     |
|  5 | Nacime    | marron | M     |
|  6 | Tom       | vert   | M     |
|  7 | Kevin     | noir   | M     |
|  8 | Shaymae   | marron | F     |
|  9 | Delia     | marron | F     |
| 10 | Dominique | vert   | M     |
+----+-----------+--------+-------+

-- Séléctionner tous les stagiaires dont l'id est compris entre 7 et 11;
SELECT * FROM stagiaires WHERE id BETWEEN 7 AND 11;
+----+-----------+--------+-------+
| id | prenom    | yeux   | genre |
+----+-----------+--------+-------+
|  7 | Kevin     | noir   | M     |
|  8 | Shaymae   | marron | F     |
|  9 | Delia     | marron | F     |
| 10 | Dominique | vert   | M     |
| 11 | Yadaf     | marron | M     |
+----+-----------+--------+-------+

-- Séléctionner les stagiaires dont le prénom commence par un 'd'
SELECT * FROM stagiaires WHERE prenom LIKE 'd%';
+----+-----------+--------+-------+
| id | prenom    | yeux   | genre |
+----+-----------+--------+-------+
|  9 | Delia     | marron | F     |
| 10 | Dominique | vert   | M     |
+----+-----------+--------+-------+

-- Trier les stagiaires femmes par id décroissant
SELECT * FROM stagiaires WHERE genre = 'f' ORDER BY id DESC;
+----+---------+--------+-------+
| id | prenom  | yeux   | genre |
+----+---------+--------+-------+
|  9 | Delia   | marron | F     |
|  8 | Shaymae | marron | F     |
|  2 | Hafsa   | marron | F     |
+----+---------+--------+-------+

-- Trier les stagiaires hommes par prénom dans l'ordre alphabétique
SELECT * FROM stagiaires WHERE genre = 'm' ORDER BY prenom ASC;
+----+-------------+--------+-------+
| id | prenom      | yeux   | genre |
+----+-------------+--------+-------+
| 10 | Dominique   | vert   | M     |
|  3 | Henri       | bleu   | M     |
|  7 | Kevin       | noir   | M     |
|  5 | Nacime      | marron | M     |
| 13 | Naruto      | bleu   | M     |
| 12 | Niamatullah | marron | M     |
|  4 | Nouha       | marron | M     |
| 14 | Theo        | marron | M     |
|  6 | Tom         | vert   | M     |
|  1 | Yacine      | marron | M     |
| 11 | Yadaf       | marron | M     |
+----+-------------+--------+-------+

-- Trier les stagiaires en affichant les femmes en premier et en classant les couleurs des yeux dans l'ordre alphabétique;
SELECT * FROM stagiaires ORDER BY genre = 'f' DESC, yeux ASC;
+----+-------------+--------+-------+
| id | prenom      | yeux   | genre |
+----+-------------+--------+-------+
|  8 | Shaymae     | marron | F     |
|  2 | Hafsa       | marron | F     |
|  9 | Delia       | marron | F     |
|  3 | Henri       | bleu   | M     |
| 13 | Naruto      | bleu   | M     |
| 12 | Niamatullah | marron | M     |
| 11 | Yadaf       | marron | M     |
|  1 | Yacine      | marron | M     |
|  5 | Nacime      | marron | M     |
|  4 | Nouha       | marron | M     |
| 14 | Theo        | marron | M     |
|  7 | Kevin       | noir   | M     |
| 10 | Dominique   | vert   | M     |
|  6 | Tom         | vert   | M     |
+----+-------------+--------+-------+

-- Limiter l'affichage des stagiaires aux 3 premières valeurs;
SELECT * FROM stagiaires LIMIT 0, 3;
+----+--------+--------+-------+
| id | prenom | yeux   | genre |
+----+--------+--------+-------+
|  1 | Yacine | marron | M     |
|  2 | Hafsa  | marron | F     |
|  3 | Henri  | bleu   | M     |
+----+--------+--------+-------+

-- 