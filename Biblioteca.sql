-- Tabla Autor --
CREATE TABLE Autor (
    id_autor int not null,
    nombre varchar2(255),
    nacionalidad varchar2(255),
    
    constraint PK_Autor primary key (id_autor)
)
-- Tabla Libro --
CREATE TABLE Libro (
    id_libro int not null,
    titulo varchar2(255),
    año_publicacion date,
    id_autor int,
    
    constraint PK_Libro primary key (id_libro),
    constraint FK_Autor foreign key (id_autor) references Autor(id_autor)
)
-- Insertar en Tabla Autor --
INSERT INTO Autor (id_autor, nombre, nacionalidad) VALUES (1, 'Gabriel García Márquez', 'Colombiana');
INSERT INTO Autor (id_autor, nombre, nacionalidad) VALUES (2, 'Isabel Allende', 'Chilena');
INSERT INTO Autor (id_autor, nombre, nacionalidad) VALUES (3, 'Jorge Luis Borges', 'Argentina');
INSERT INTO Autor (id_autor, nombre, nacionalidad) VALUES (4, 'Mario Vargas Llosa', 'Peruana');
INSERT INTO Autor (id_autor, nombre, nacionalidad) VALUES (5, 'Julio Cortázar', 'Argentina');
-- Insertar en Tabla Libro --
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (1, 'Cien años de soledad', DATE '1967-05-30', 1);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (2, 'El amor en los tiempos del cólera', DATE '1985-09-05', 1);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (3, 'La casa de los espíritus', DATE '1982-01-01', 2);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (4, 'Eva Luna', DATE '1987-01-01', 2);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (5, 'Ficciones', DATE '1944-01-01', 3);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (6, 'El Aleph', DATE '1949-01-01', 3);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (7, 'La ciudad y los perros', DATE '1963-01-01', 4);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (8, 'Conversación en La Catedral', DATE '1969-01-01', 4);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (9, 'Rayuela', DATE '1963-01-01', 5);
INSERT INTO Libro (id_libro, titulo, año_publicacion, id_autor)
VALUES (10, 'Bestiario', DATE '1951-01-01', 5);

-- Consultas --
select * from Autor
select * from Libro

select L.titulo from Libro L

