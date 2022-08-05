-- line base de données (database) est utile dans me cadre d'un projet informatique pour conserver des informations en mémoire
-- A l'intérieur de la base de donnée, les informations sont classées, structurées et regroupées généralement par sujet
-- Dans la grande majorité des cas une BDD est générée par un logiciel moteur qui la manipule : un SGBD.

-- MCD => Modèle conceptuel de données.
-- Le modèle conceptuel de donnée => donne un plan de la Database avant de la créer

-- SGBD => Système de gestion de base de donnée. // Database management system
-- Les SGBD permet d'accueillir, d'exploiter et de fonctionner les base de données (moteur).

-- Nous utiliserons MySQL, d'autre SGBD existent comme Oracle, Sql server, PostgreSQL, etc...

-- BDD => Base de données
-- La base de données représente l'emplacement des données sauvegardées.

-- SQL => Structured Query Language
-- Le langage de requête SQL nous permet d'échanger des informations avec la base de données.

-- Une fois les informations enregistrées, il est important de pouvoir les gérer (ajout, suppression, consultation).

-- /!\ Toutes ces actions de gestion et manipulations passeront par une requête à SQL.

-- MODELE MCD:
-- Avant de créer une BDD, il est essentiel de se poser et réfléchir sur la modélisation.
-- En effet, une base de données va servir de support à une application informatique.
-- Comment modéliser une base de données ?
-- Nous pouvons modéliser sur papier si celle-ci n'est pas complexe mais dans la plupartt des cas nous aurons besoin d'un logiciel pour nous accompagner et avoir une vue d'ensemble.

-- Un logiciel connu permet de modéliser une BDD: MySQL Workbench

-- la modélisation se compose de différentes tables (table = sujet?)
-- Exemple, si nous vendons des produits sur notre site, nous aurons 1 table produit et 1 table commande.

-- LES TABLES :
-- 1 sujet représente 1 table dans BDD, 1 table est un emplacement de sauvegarde.
-- Il faut réfléchir au sujet et à ses conséquences, si nous vendons des produits nous aurons certainement besoin d'une table membre.

-- LES TYPES DES COLONNES / CHAMPS
-- Type: varchar => String chaîne de caractères, maxlength 256
-- Sert à enregistrer un pseudo, email, titre de produit, ou titre d'article (blog) etc...

-- Type text => String, maxlength: unlimited
-- Sert à enregistrer le texte d'un article.

-- Type int => Number
-- Sert à enregistrer les numéros d'un champ servant d'ID, de prix, code postal, quantité en stock...

-- Type date => date
-- Sert à enregistrer la date d'une requête.

-- LES IDENTIFIANTS (clé Primaire - PK Primary Key):
-- Les identifiants sont des champs systématiquement présents dans chaque tables, et ce en première position => Clé Primaire (PK).
-- Pour éviter de choisir le numéro et faire des erreures nous demanderons à ce qu'il soit généré automatiquement en i++.

-- AUTO INCREMENTATION (AI) :
-- Option permettant de générer un numéro unique dans la colonne (champs) de type PK (ID).
-- Attention le 1er champ de chaque table sera systématiquement un ID qui sera PK et AI (i++).

-- NULL / NOT NULL
-- Dans chaque champs, nous pourrons indiquer si nous acceptons les valeurs NULL ou non NULL.
-- NULL => type qui permet de laisser le champ vide  (not required).

-- LES RELATIONS :
-- exemple: 1 membre commande 1 produit (ou l'inverse... non pas le produit qui commande le client... quoi qui...).
-- Nous devons enregistrer l'info dans 1 table commande, pour cela il faut voir les cardinalités

-- CARDINALITÉS
-- Elles permettent de connaitre le chiffre mini et maxi d'enregistrement pour une relation.

-- TABLE DE JOINTURE
-- Elle permet de faire le lien entre deux tables
-- Exemple: sct de taxi qui posséderait des conducteurs (table1) et des taxis (table2), 1 conducteur peut conduire relation: (0,1) mini 0 max 1 voiture conduite à la fois.
-- Le taxi relation: (0,n) mini 0 conducteur maxi un nombre undefined de conducteurs.
-- table taxi table conducteurs table relation: idTaxi; idConducteur-vehicule.

-- LES REQUÊTES
-- Comment ? formulation -> exécution -> résultat
-- 4 types de requêtes:
-- SELECTION (question/réponse)
-- INSERTION (action/impact)
-- MODIFICATION (action/impact)
-- SUPPRESSION (action/impact)
-- Finir les requêtes par un point-virgule;

-- APPLICATION:

-- linker shell à phpadmin : # mysql -u root -p
-- MariaDB [(none)] CREATE DATABASE entreprise;
-- MariaDB [(none)] USE entreprise;
-- Lister la base de données: SHOW TABLES;
-- Supprimer une BDD: DROP entreprise;
-- Supprimer une table: DROP employes;
-- Vider le contenu d'une table: TRUNCATE employes;
-- Observer la structure d'une table: DESCRIBE employes;
-- Afficher une colonne: SELECT service FROM employes;
-- MariaDB [(entreprise)] SELECT DISTINCT (service) FROM employes;
-- SELECT nom, prenom, data_embauche FROM employes WHERE data_embauche BETWEEN '2006-01-01'AND '2007-01-01';
-- SELECT prenom FROM employes WHERE prenom LIKE 'y%' le % peut être placé avant pour séléctionner la dernière lettre.

C:\Users\Niamatullah>cd C:\xampp\mysql\bin

C:\xampp\mysql\bin>mysql -u root --
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 252
Server version: 10.4.24-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| ecommerce          |
| information_schema |
| mysql              |
| performance_schema |
| phpmyadmin         |
| poles              |
| portfolio          |
| test               |
| test2              |
| yadaf              |
+--------------------+
10 rows in set (0.001 sec)

MariaDB [(none)]> USE yadaf;
Database changed
MariaDB [yadaf]> SHOW TABLES;
Empty set (0.000 sec)

MariaDB [yadaf]> USE poles;
Database changed
MariaDB [poles]> SHOW TABLES;
+-----------------+
| Tables_in_poles |
+-----------------+
| employes        |
+-----------------+
1 row in set (0.000 sec)

MariaDB [poles]> SELECT * FROM employes;
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
| id | nom       | prenom    | email               | date_naissance | ville                 | pays   | code_postal | note |
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
|  1 | BOUBEKEUR | Nacime    | nacime@gmail.com    | 23-10-1999     | Poissy                | France | 78300       |   18 |
|  2 | KONE      | Nouha     | kone@gmail.com      | 19-06-2002     | Mantes-la-jolie       | France | 78200       |   14 |
|  3 | MOUNAH    | Yacine    | yacine@gmail.com    | 17-07-1999     | Poissy                | France | 78300       |   11 |
|  4 | LE FEVRE  | Tom       | tom@gmail.com       | 06-01-1994     | Poissy                | France | 78300       |   12 |
|  5 | HYVERNAT  | Hafsa     | hafsa@gmail.com     | 08-04-2002     | Les Mureaux           | France | 78130       |   15 |
|  6 | MENDY     | Kevin     | kevin@gmail.com     | 03-02-1991     | Poissy                | France | 78300       |    8 |
|  7 | GIMBERT   | Dominique | dominique@gmail.com | 16-01-1962     | Saint Germain En Laye | France | 78100       |    5 |
|  8 | DANCIU    | Delia     | delia@gmail.com     | 01-02-1994     | Poissy                | France | 78300       |   12 |
|  9 | AWEL      | Yadaf     | yadaf@gmail.com     | 04-05-1998     | Paris                 | France | 78300       |    9 |
| 10 | HAVRET    | Henri     | henri@gmail.com     | 07-10-1991     | Versailles            | France | 78000       |   10 |
| 11 | OURAHOU   | Shaymae   | shaymae@gmail.com   | 09-01-2002     | Les Mureaux           | France | 78130       |   11 |
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
11 rows in set (0.000 sec)

MariaDB [poles]> SELECT * FROM employes WHERE note = 5;
+----+---------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
| id | nom     | prenom    | email               | date_naissance | ville                 | pays   | code_postal | note |
+----+---------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
|  7 | GIMBERT | Dominique | dominique@gmail.com | 16-01-1962     | Saint Germain En Laye | France | 78100       |    5 |
+----+---------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
1 row in set (0.000 sec)

MariaDB [poles]> SELECT * FROM employes WHERE code_postal = '78130';
+----+----------+---------+-------------------+----------------+-------------+--------+-------------+------+
| id | nom      | prenom  | email             | date_naissance | ville       | pays   | code_postal | note |
+----+----------+---------+-------------------+----------------+-------------+--------+-------------+------+
|  5 | HYVERNAT | Hafsa   | hafsa@gmail.com   | 08-04-2002     | Les Mureaux | France | 78130       |   15 |
| 11 | OURAHOU  | Shaymae | shaymae@gmail.com | 09-01-2002     | Les Mureaux | France | 78130       |   11 |
+----+----------+---------+-------------------+----------------+-------------+--------+-------------+------+
2 rows in set (0.000 sec)

MariaDB [poles]> CREATE DATABASE entreprise;
Query OK, 1 row affected (0.001 sec)

MariaDB [poles]> USE entreprise;
Database changed
MariaDB [entreprise]> use poles;
Database changed
MariaDB [poles]> INSERT INTO employes (id, nom, prenom, email, date_naissance, ville, pays, code_postal, note)
    -> VALUES('test', 'test','test@gmail.com', '00-00-0000', 'test', 'test', '00000', 0);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
MariaDB [poles]> INSERT INTO employes (id, nom, prenom, email, date_naissance, ville, pays, code_postal, note)
    -> VALUES( ,'test', 'test','test@gmail.com', '00-00-0000', 'test', 'test', '00000', 0);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''test', 'test','test@gmail.com', '00-00-0000', 'test', 'test', '00000', 0)' at line 2
MariaDB [poles]> INSERT INTO employes (id, nom, prenom, email, date_naissance, ville, pays, code_postal, note)
    -> VALUES(NULL,'test', 'test','test@gmail.com', '00-00-0000', 'test', 'test', '00000', 0);
ERROR 1048 (23000): Column 'id' cannot be null
MariaDB [poles]> INSERT INTO employes (id, nom, prenom, email, date_naissance, ville, pays, code_postal, note)
    -> VALUES(0 ,'test', 'test','test@gmail.com', '00-00-0000', 'test', 'test', '00000', 0);
Query OK, 1 row affected (0.002 sec)

MariaDB [poles]> select * from employes;
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
| id | nom       | prenom    | email               | date_naissance | ville                 | pays   | code_postal | note |
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
|  0 | test      | test      | test@gmail.com      | 00-00-0000     | test                  | test   | 00000       |    0 |
|  1 | BOUBEKEUR | Nacime    | nacime@gmail.com    | 23-10-1999     | Poissy                | France | 78300       |   18 |
|  2 | KONE      | Nouha     | kone@gmail.com      | 19-06-2002     | Mantes-la-jolie       | France | 78200       |   14 |
|  3 | MOUNAH    | Yacine    | yacine@gmail.com    | 17-07-1999     | Poissy                | France | 78300       |   11 |
|  4 | LE FEVRE  | Tom       | tom@gmail.com       | 06-01-1994     | Poissy                | France | 78300       |   12 |
|  5 | HYVERNAT  | Hafsa     | hafsa@gmail.com     | 08-04-2002     | Les Mureaux           | France | 78130       |   15 |
|  6 | MENDY     | Kevin     | kevin@gmail.com     | 03-02-1991     | Poissy                | France | 78300       |    8 |
|  7 | GIMBERT   | Dominique | dominique@gmail.com | 16-01-1962     | Saint Germain En Laye | France | 78100       |    5 |
|  8 | DANCIU    | Delia     | delia@gmail.com     | 01-02-1994     | Poissy                | France | 78300       |   12 |
|  9 | AWEL      | Yadaf     | yadaf@gmail.com     | 04-05-1998     | Paris                 | France | 78300       |    9 |
| 10 | HAVRET    | Henri     | henri@gmail.com     | 07-10-1991     | Versailles            | France | 78000       |   10 |
| 11 | OURAHOU   | Shaymae   | shaymae@gmail.com   | 09-01-2002     | Les Mureaux           | France | 78130       |   11 |
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
12 rows in set (0.001 sec)

MariaDB [poles]> DELETE * FROM employes WHERE id = 0;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '* FROM employes WHERE id = 0' at line 1
MariaDB [poles]> DELETE FROM employes WHERE id = 0;
Query OK, 1 row affected (0.002 sec)

MariaDB [poles]> select * from employes;
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
| id | nom       | prenom    | email               | date_naissance | ville                 | pays   | code_postal | note |
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
|  1 | BOUBEKEUR | Nacime    | nacime@gmail.com    | 23-10-1999     | Poissy                | France | 78300       |   18 |
|  2 | KONE      | Nouha     | kone@gmail.com      | 19-06-2002     | Mantes-la-jolie       | France | 78200       |   14 |
|  3 | MOUNAH    | Yacine    | yacine@gmail.com    | 17-07-1999     | Poissy                | France | 78300       |   11 |
|  4 | LE FEVRE  | Tom       | tom@gmail.com       | 06-01-1994     | Poissy                | France | 78300       |   12 |
|  5 | HYVERNAT  | Hafsa     | hafsa@gmail.com     | 08-04-2002     | Les Mureaux           | France | 78130       |   15 |
|  6 | MENDY     | Kevin     | kevin@gmail.com     | 03-02-1991     | Poissy                | France | 78300       |    8 |
|  7 | GIMBERT   | Dominique | dominique@gmail.com | 16-01-1962     | Saint Germain En Laye | France | 78100       |    5 |
|  8 | DANCIU    | Delia     | delia@gmail.com     | 01-02-1994     | Poissy                | France | 78300       |   12 |
|  9 | AWEL      | Yadaf     | yadaf@gmail.com     | 04-05-1998     | Paris                 | France | 78300       |    9 |
| 10 | HAVRET    | Henri     | henri@gmail.com     | 07-10-1991     | Versailles            | France | 78000       |   10 |
| 11 | OURAHOU   | Shaymae   | shaymae@gmail.com   | 09-01-2002     | Les Mureaux           | France | 78130       |   11 |
+----+-----------+-----------+---------------------+----------------+-----------------------+--------+-------------+------+
11 rows in set (0.001 sec)

MariaDB [poles]> USE entreprise;
Database changed
MariaDB [entreprise]> CREATE TABLE IF NOT EXISTS employes (
    -> id_employes int(3) NOT NULL AUTO_INCREMENT,
    -> prenom varchar(20) DEFAULT NULL,
    -> nom varchar(20) DEFAULT NULL,
    -> sex enum('M', 'F')NOT NULL,
    -> PRIMARY KEY(id_abonne)
    -> );
ERROR 1072 (42000): Key column 'id_abonne' doesn't exist in table
MariaDB [entreprise]> CREATE TABLE IF NOT EXISTS employes (
    -> id_abonne int(3) NOT NULL AUTO_INCREMENT,
    -> prenom varchar(20) DEFAULT NULL,
    -> nom varchar(20) DEFAULT NULL,
    -> sex enum('M', 'F')NOT NULL,
    -> PRIMARY KEY(id_abonne)
    -> );
Query OK, 0 rows affected (0.029 sec)

MariaDB [entreprise]> CREATE TABLE IF NOT EXISTS abonnes (
    -> id_abonne int(3) NOT NULL AUTO_INCREMENT,
    -> prenom varchar(20) DEFAULT NULL,
    -> nom varchar(20) DEFAULT NULL,
    -> sex enum('M', 'F')NOT NULL,
    -> PRIMARY KEY(id_abonne)
    -> );
Query OK, 0 rows affected (0.029 sec)

MariaDB [entreprise]> CREATE TABLE IF NOT EXISTS employes (
    -> id_employes int(3) NOT NULL AUTO_INCREMENT,
    -> prenom varchar(20) DEFAULT NULL,
    -> nom varchar(20) DEFAULT NULL,
    -> sex enum('M', 'F')NOT NULL,
    -> service varchar(30) DEFAULT NULL,
    -> date_embauche date DEFAULT NULL,
    -> salaire float DEFAULT NULL,
    -> PRIMARY KEY(id_employes)
    -> );
Query OK, 0 rows affected (0.021 sec)

MariaDB [entreprise]> INSERT INTO employes (id_employes, prenom, nom, sex, service, date_embauche, salaire)
    -> VALUES
    -> (350, 'Jean-Pierre', 'Laborde', 'M', 'Direction', '1999-12-09', 5000),
    -> (388, 'Clement', 'Gallet', 'M', 'Commercial', '2000-01-15', 2300),
    -> (415, 'Thomas', 'Winter', 'M', 'Commercial', '2001-05-03', 3350),
    -> (417, 'Cloe', 'Dubar', 'F', 'Production', '2001-09-05', 1900),
    -> (491, 'Elodie', 'Fellier', 'F', 'Secretariat', '2002-02-22', 1700),
    -> (509, 'Celine', 'Perrin', 'F', 'Commercial', '2006-09-10', 2700),
    -> (690, 'Mathieu', 'Vergnal', 'M', 'Informatique', '2008-11-17', 2500),
    -> (739, 'Tom', 'Le Fevre', 'M', 'Informatique', '2022-05-09', 2600),
    -> (900, 'Benoit', 'Lagarde', 'M', 'Production', '2000-01-15', 2300),
    -> (933, 'Delia', 'Danciu', 'F', 'Commercial', '2018-01-15', 8000),
    -> (990, 'Nouha', 'Kone', 'M', 'Informatique', '2023-08-22', 3000);
Query OK, 11 rows affected (0.003 sec)
Records: 11  Duplicates: 0  Warnings: 0

MariaDB [entreprise]>

-- OPERATEUR DE COMPARAISON 
-- = est égal
-- > strictement supérieur
-- < strictement inférieur
-- >= supérieur ou égal
-- <= inférieur ou égal
-- <> != différent de;
-- NOT, (NOT BETWEEN =/= BETWEEN)

-- Séléctionne les données entre (BETWEEN) un intervalle (fonctionne dans une requête utilisant WHERE)
-- SELECT * FROM employes WHERE date_embauche BETWEEN '2000-01-15' AND '2008-11-17';
-- SELECT * FROM employes WHERE date_embauche NOT BETWEEN '2000-01-15' AND '2008-11-17';

-- Pour éviter des redondances dans les résultats
-- SELECT DISTINCT prenom FROM employes;

+-------------+
| prenom      |
+-------------+
| Jean-Pierre |
| Clement     |
| Thomas      |
| Cloe        |
| Elodie      |
| Celine      |
| Mathieu     |
| Tom         |
| Benoit      |
| Delia       |
| Nouha       |
+-------------+

-- Pour grouper plusieurs résultats | La fonction SUM() permet d'additionner la valeur de chaque salaire pour un même service

-- Trier les lignes dans un résultat d'une requête SQL
-- SELECT nom, prenom, date_embauche FROM employes ORDER BY date_embauche DESC; (décroissant)
-- SELECT nom, prenom, date_embauche FROM employes ORDER BY date_embauche ASC; (croissant)

+-------------+----------+---------------+
| prenom      | nom      | date_embauche |
+-------------+----------+---------------+
| Jean-Pierre | Laborde  | 1999-12-09    |
| Clement     | Gallet   | 2000-01-15    |
| Benoit      | Lagarde  | 2000-01-15    |
| Thomas      | Winter   | 2001-05-03    |
| Cloe        | Dubar    | 2001-09-05    |
| Elodie      | Fellier  | 2002-02-22    |          -- version croissant (ASC)
| Celine      | Perrin   | 2006-09-10    |
| Mathieu     | Vergnal  | 2008-11-17    |
| Delia       | Danciu   | 2018-01-15    |
| Tom         | Le Fevre | 2022-05-09    |
| Nouha       | Kone     | 2023-08-22    |
+-------------+----------+---------------+

-- Vérifier si une colonne est égale à une des valeurs compris dans le set de valeurs déterminés.

-- SELECT * FROM employes LIMIT 4, 9;

+-------------+---------+----------+-----+--------------+---------------+---------+
| id_employes | prenom  | nom      | sex | service      | date_embauche | salaire |
+-------------+---------+----------+-----+--------------+---------------+---------+
|         491 | Elodie  | Fellier  | F   | Secretariat  | 2002-02-22    |    1700 |
|         509 | Celine  | Perrin   | F   | Commercial   | 2006-09-10    |    2700 |
|         690 | Mathieu | Vergnal  | M   | Informatique | 2008-11-17    |    2500 |
|         739 | Tom     | Le Fevre | M   | Informatique | 2022-05-09    |    2600 |
|         900 | Benoit  | Lagarde  | M   | Production   | 2000-01-15    |    2300 |
|         933 | Delia   | Danciu   | F   | Commercial   | 2018-01-15    |    8000 |
|         990 | Nouha   | Kone     | M   | Informatique | 2023-08-22    |    3000 |
+-------------+---------+----------+-----+--------------+---------------+---------+

-- Toutes les entrées qui finissent par "r";

-- Toutes les entrées qui commencent par "c", contiennent "m" et finissent par "t";

-- SELECT prenom FROM employes ORDER BY prenom DESC LIMIT 3, 3   -> LIMIT : à partir de 3, les 3 qui suivent

-- SELECT nom, prenom, salaire*12 AS salaire_annuel FROM employes;

-- SELECT nom, prenom, CONCAT(nom, ' ', prenom) AS nom_prenom FROM employes;

+----------+-------------+---------------------+
| nom      | prenom      | nom_prenom          |
+----------+-------------+---------------------+
| Laborde  | Jean-Pierre | Laborde Jean-Pierre |
| Gallet   | Clement     | Gallet Clement      |
| Winter   | Thomas      | Winter Thomas       |
| Dubar    | Cloe        | Dubar Cloe          |
| Fellier  | Elodie      | Fellier Elodie      |
| Perrin   | Celine      | Perrin Celine       |
| Vergnal  | Mathieu     | Vergnal Mathieu     |
| Le Fevre | Tom         | Le Fevre Tom        |
| Lagarde  | Benoit      | Lagarde Benoit      |
| Danciu   | Delia       | Danciu Delia        |
| Kone     | Nouha       | Kone Nouha          |
+----------+-------------+---------------------+

-- SELECT AVG(salaire) FROM employes;
-- Calcule la moyenne;

+--------------------+
| AVG(salaire)       |
+--------------------+
| 3213.6363636363635 |
+--------------------+

-- ISOLER UNE VALEUR MINIMUM OU MAXIMUM AVEC MIN / MAX

-- SELECT MIN(salaire), MAX(salaire), AVG(salaire) FROM employes;

+--------------+--------------+--------------------+
| MIN(salaire) | MAX(salaire) | AVG(salaire)       |
+--------------+--------------+--------------------+
|         1700 |         8000 | 3213.6363636363635 |
+--------------+--------------+--------------------+

-- SELECT * FROM employes WHERE service = 'Commercial' AND salaire = 2300 OR salaire = 3300;

-- SELECT service, COUNT(*) AS nombre FROM employes GROUP BY service;
+--------------+--------+
| service      | nombre |
+--------------+--------+
| Commercial   |      4 |
| Direction    |      1 |
| Informatique |      3 |
| Production   |      2 |
| Secretariat  |      1 |
+--------------+--------+

-- SELECT nom, prenom, salaire from employes order by salaire desc;
+----------+-------------+---------+
| nom      | prenom      | salaire |
+----------+-------------+---------+
| Danciu   | Delia       |    8000 |
| Laborde  | Jean-Pierre |    5000 |
| Winter   | Thomas      |    3350 |
| Kone     | Nouha       |    3000 |
| Perrin   | Celine      |    2700 |
| Le Fevre | Tom         |    2600 |
| Vergnal  | Mathieu     |    2500 |
| Lagarde  | Benoit      |    2300 |
| Gallet   | Clement     |    2300 |
| Dubar    | Cloe        |    1900 |
| Fellier  | Elodie      |    1700 |
+----------+-------------+---------+
11 rows in set (0.000 sec)

MariaDB [entreprise]> select prenom, nom, salaire from employes where salaire = (select max(salaire) from employes) OR salaire = (select min(salaire) from employes);
+--------+---------+---------+
| prenom | nom     | salaire |
+--------+---------+---------+
| Elodie | Fellier |    1700 |
| Delia  | Danciu  |    8000 |
+--------+---------+---------+

-- SELECT service, COUNT(nom) AS nombre FROM employes GROUP BY service HAVING COUNT(*) > 1;
-- Répertorie les services ayant un nombre d'employé supérieur à 1

+--------------+--------+
| service      | nombre |
+--------------+--------+
| Commercial   |      4 |
| Informatique |      3 |
| Production   |      2 |
+--------------+--------+

-- MEMO SUR LES REQUÊTES DE SELECTION SELECT
-- SELECT / FROM / DISTINCT / WHERE / BETWEEN / CURDATE / LIKE / % 
-- OPERATEUR DE COMPARAISON / ORDER BY / ASC / DESC / LIMIT / AS pour ... / SUM / AVG
-- COUNT / MIN / MAX / IN / NOT IN / CONDITION MULTIPLE / HAVING

-- MEMO SUR LES REQUÊTES DE SELECTION INSERT
-- INSERT INTO ... VALUES

-- MEMO SUR LES REQUÊTES DE SELECTION UPDATE
-- UPDATE ... SET .. WHERE

-- MEMO SUR LES REQUÊTES DE SELECTION DELETE
-- DELETE FROM ... WHERE ...

-- EXERCICE
-- Afficher la profession de l'id 739

select nom, prenom, service from employes where id_employes = 739;
+----------+--------+--------------+
| nom      | prenom | service      |
+----------+--------+--------------+
| Le Fevre | Tom    | Informatique |
+----------+--------+--------------+
1 row in set (0.000 sec)

-- Afficher la date d'embauche de Nouha

select nom, prenom, date_embauche from employes where prenom = 'Nouha';
+------+--------+---------------+
| nom  | prenom | date_embauche |
+------+--------+---------------+
| Kone | Nouha  | 2023-08-22    |
+------+--------+---------------+
1 row in set (0.000 sec)

-- Afficher le nombre de commerciaux

select service, count(*) as nombre from employes where service = 'Commercial';
+------------+--------+
| service    | nombre |
+------------+--------+
| Commercial |      4 |
+------------+--------+
1 row in set (0.001 sec)

-- Afficher le coût des commerciaux à l'année

-- SELECT service, count(*), SUM(salaire*12) AS salaire_annuel_commercial FROM employes where service = 'Commercial';
+------------+----------+----------------+
| service    | count(*) | salaire_annuel |
+------------+----------+----------------+
| Commercial |        4 |         196200 |
+------------+----------+----------------+
1 row in set (0.000 sec)

MariaDB [entreprise]>

-- Afficher le salaire moyen par service

-- SELECT service, count(*), round(AVG(salaire)) FROM employes group by service;
+--------------+----------+---------------------+
| service      | count(*) | round(AVG(salaire)) |
+--------------+----------+---------------------+
| Commercial   |        4 |                4088 |
| Direction    |        1 |                5000 |
| Informatique |        3 |                3033 |
| Production   |        2 |                2100 |
| Secretariat  |        1 |                1700 |
+--------------+----------+---------------------+

-- Afficher le nombre de recrutement pour l'année 2010

-- SELECT count(*) AS recrutement_annee_2001 FROM employes WHERE date_embauche BETWEEN '2001-01-01' AND '2001-12-31';
+------------------------+
| recrutement_annee_2001 |
+------------------------+
|                      2 |
+------------------------+

-- Augmenter le salaire de chaque employés de 100

-- UPDATE employes SET salaire = salaire + 100;
-- SELECT * FROM employes;
+-------------+-------------+----------+-----+--------------+---------------+---------+
| id_employes | prenom      | nom      | sex | service      | date_embauche | salaire |
+-------------+-------------+----------+-----+--------------+---------------+---------+
|         350 | Jean-Pierre | Laborde  | M   | Direction    | 1999-12-09    |    5100 |
|         388 | Clement     | Gallet   | M   | Commercial   | 2000-01-15    |    2400 |
|         415 | Thomas      | Winter   | M   | Commercial   | 2001-05-03    |    3450 |
|         417 | Cloe        | Dubar    | F   | Production   | 2001-09-05    |    2000 |
|         491 | Elodie      | Fellier  | F   | Secretariat  | 2002-02-22    |    1800 |
|         509 | Celine      | Perrin   | F   | Commercial   | 2006-09-10    |    2800 |
|         690 | Mathieu     | Vergnal  | M   | Informatique | 2008-11-17    |    2600 |
|         739 | Tom         | Le Fevre | M   | Informatique | 2022-05-09    |    3400 |
|         900 | Benoit      | Lagarde  | M   | Production   | 2000-01-15    |    2400 |
|         933 | Delia       | Danciu   | F   | Commercial   | 2018-01-15    |    8100 |
|         990 | Nouha       | Kone     | M   | Informatique | 2023-08-22    |    3400 |
+-------------+-------------+----------+-----+--------------+---------------+---------+

-- Afficher le nombre de service différents
-- SELECT COUNT(DISINCT service) AS services_differents FROM employes;
+---------------------+
| services_differents |
+---------------------+
|                   5 |
+---------------------+

-- Afficher les informations de l'employé du service gagnant le plus dans chaque service;