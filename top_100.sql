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


SELECT * FROM reparto;

  id  | id_pelicula |            actor            
------+-------------+-----------------------------
    1 |           1 | Tom Hanks
    2 |           1 | Robin Wright Penn
    3 |           1 | Gary Sinise
    4 |           1 | Mykelti Williamson
    5 |           1 | Sally Field
:y muchos mas...


4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,
año de estreno, director y todo el reparto. (0.5 puntos)

peliculas=# SELECT * FROM peliculas WHERE peliculas.pelicula = 'Titanic';

DIRECTOR DE PELICULA TITANIC Y AÑO DE ESTRENO:

 id | pelicula | año_estreno |   director    
----+----------+-------------+---------------
  2 | Titanic  |        1997 | James Cameron
(1 row)


CONSULTA, DIRECTOR Y TODO EL REPARTO:

peliculas=# SELECT * FROM peliculas INNER JOIN reparto ON id_pelicula = reparto.id_pelicula WHERE peliculas.pelicula = 'Titanic';


 id | pelicula | año_estreno |   director    | id | pelicula_id |       actor       
----+----------+-------------+---------------+----+-------------+-------------------
  2 | Titanic  |        1997 | James Cameron | 17 |           2 | Leonardo DiCaprio
  2 | Titanic  |        1997 | James Cameron | 18 |           2 | Kate Winslet
  2 | Titanic  |        1997 | James Cameron | 19 |           2 | Billy Zane
  2 | Titanic  |        1997 | James Cameron | 20 |           2 | Kathy Bates
  2 | Titanic  |        1997 | James Cameron | 21 |           2 | Frances Fisher
  2 | Titanic  |        1997 | James Cameron | 22 |           2 | Bernard Hill
  2 | Titanic  |        1997 | James Cameron | 23 |           2 | Jonathan Hyde
  2 | Titanic  |        1997 | James Cameron | 24 |           2 | Danny Nucci
  2 | Titanic  |        1997 | James Cameron | 25 |           2 | David Warner
  2 | Titanic  |        1997 | James Cameron | 26 |           2 | Bill Paxton
  2 | Titanic  |        1997 | James Cameron | 27 |           2 | Gloria Stuart
  2 | Titanic  |        1997 | James Cameron | 28 |           2 | Victor Garber
  2 | Titanic  |        1997 | James Cameron | 29 |           2 | Suzy Amis
(13 rows)


5. Listar los titulos de las películas donde actúe Harrison Ford.(0.5 puntos)

peliculas=# SELECT pelicula FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.id_pelicula WHERE reparto.actor = 'Harrison Ford';
                   pelicula                    
-----------------------------------------------
 Star Wars. Episodio IV: Una nueva esperanza
 Indiana Jones y la última cruzada
 En busca del arca perdida
 Star Wars. Episodio V: El imperio contraataca
 Star Wars. Episodio VI: El retorno del Jedi
 Blade Runner
 Apocalypse Now
 Indiana Jones y el templo maldito
(8 rows)


6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el
top 100.(1 puntos)


peliculas=# SELECT director, COUNT(*) AS numero FROM peliculas GROUP BY director ORDER BY numero DESC LIMIT 10;

       director       | numero 
----------------------+--------
 Steven Spielberg     |      9
 Francis Ford Coppola |      4
 Peter Jackson        |      4
 Quentin Tarantino    |      3
 Martin Scorsese      |      3
 Robert Zemeckis      |      3
 James Cameron        |      3
 Ridley Scott         |      3
 George Lucas         |      3
 Frank Darabont       |      2
(10 rows)


7. Indicar cuantos actores distintos hay (1 puntos)

peliculas=# SELECT COUNT(DISTINCT actor) FROM reparto;
 count 
-------
   831
(1 row)


8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por
título de manera ascendente.(1 punto)


peliculas=# SELECT pelicula FROM peliculas WHERE año_estreno >= 1990 AND año_estreno <= 1999;

                  pelicula                  
--------------------------------------------
 Forest Gump
 Titanic
 Cadena perpetua
 Braveheart
 La lista de Schindler
 Toy Story
 Eduardo Manostijeras
 Salvar al soldado Ryan
 American History X
 El sexto sentido
 Pulp Fiction
 El silencio de los corderos
 El club de la pelea
 Parque Jurásico
 Matrix
 La milla verde
 Seven
 Terminator 2: el juicio final
 Hombres de negro
 El show de Truman
 Toy Story 2
 Pesadilla antes de navidad
 Entrevista con el vampiro
 El Padrino. Parte III
 El profesional
 American Beauty
 Trainspotting
 Star Wars. Episodio I: La amenaza fantasma
 Mejor... imposible
 Uno de los nuestros
(30 rows)

~
(END)

