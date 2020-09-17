Instrucciones

1. Crear base de datos llamada películas (1 punto)

eva=# CREATE DATABASE peliculas;
CREATE DATABASE
You are now connected to database "peliculas" as user "postgres".
peliculas=#


2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes,
determinando la relación entre ambas tablas. (2 puntos)

CREACION DE TABLA LLAMADA PELICULAS:

peliculas=# CREATE TABLE peliculas(
peliculas(# id SERIAL,
peliculas(# pelicula VARCHAR,
peliculas(# año_estreno INT,
peliculas(# director VARCHAR,
peliculas(# PRIMARY KEY(id));
CREATE TABLE

VISUALIZACION DE TABLA CREADA:

peliculas=# SELECT * FROM peliculas;
                  eva
 id | pelicula | año_estreno | director 
----+----------+-------------+----------
(0 rows)

CREACION DE TABLA REPARTO:

peliculas=# CREATE TABLE reparto(
peliculas(# id SERIAL PRIMARY KEY,
peliculas(# id_pelicula INT,
peliculas(# actor VARCHAR,
peliculas(# FOREIGN KEY(id_pelicula) REFERENCES peliculas(id));
CREATE TABLE
peliculas=# SELECT * FROM reparto;
           eva
 id | id_pelicula | actor 
----+-------------+-------
(0 rows)


3. Cargar ambos archivos a su tabla correspondiente (1 punto):

ENLAZAR RUTA DEL ARCHIVO CSV DE PELICULAS:

peliculas=# \copy peliculas FROM '/home/eva/Escritorio/desafio_top100/Apoyo Desafío -  Top 100/Apoyo Desafío 2 -  Top 100/peliculas.csv' csv header
COPY 100


ENLAZAR RUTA DEL ARCHIVO CSV DE REPARTO:

peliculas=# \copy reparto (id_pelicula, actor) FROM '/home/eva/Escritorio/desafio_top100/Apoyo Desafío -  Top 100/Apoyo Desafío 2 -  Top 100/reparto.csv' csv
COPY 1051



