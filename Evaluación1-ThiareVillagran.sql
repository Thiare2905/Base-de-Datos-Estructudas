-- Thiare Villagran Hernandez - Bases de Datos Estructuradas 114-2A-F2 --
-------- Diagrama 1 (Cliente, Pedido, Detalle_pedido, Producto)--------
-- 1. Crear tabla Cliente --
CREATE TABLE Cliente (
    id_cliente int not null,
    nombre varchar2(255),
    correo varchar2(255), 
    constraint PK_CLIENTE primary key (id_cliente)
)
-- 2. Crear tabla Pedido --
CREATE TABLE Pedido (
    id_pedido int not null,
    fecha_ped date,
    total int,
    id_cliente int,
    constraint PK_PEDIDO primary key (id_pedido),
    constraint FK_CLIENTE foreign key (id_cliente) references Cliente(id_cliente)
)
-- 3. Crear tabla Producto --
CREATE TABLE Producto(
    id_producto int not null,
    nombre varchar2(255), 
    precio int,
    constraint PK_PRODUCTO primary key (id_producto)
)
-- 4. Crear tabla Detalle pedido --
CREATE TABLE Detalle_pedido(
    id_detalle int not null,
    id_pedido int,
    id_producto int,
    cantidad int,
    precio_unt int,
    constraint PK_DETALLE_PEDIDO primary key (id_detalle),
    constraint FK_PEDIDO foreign key (id_pedido) references Pedido(id_pedido),
    constraint FK_PRODUCTO foreign key (id_producto) references Producto(id_producto)
)
-- 5. Insertar registro de la tabla CLiente -- 
insert into cliente values (01,'Juan Perez', 'pjuan@gmail.com');
insert into cliente values (02, 'Martina Salas', 'smartina@gmail.com');

-- 6. Insertar registro de la tabla Pedido -- 
insert into pedido values (11, to_date('05/11/2025', 'dd/mm/yyyy'), 17940, 02);
insert into pedido values (12, to_date('09/10/2025', 'dd/mm/yyyy'), 15980, 01);

-- 7. Insertar registro de la tabla Producto -- 
insert into producto values (31, 'Teclado inalambrico', 7990);
insert into producto values (32, 'Mouse inalambrico', 5980);

-- 8. Insertar registro de la tabla Detalle_pedido -- 
insert into detalle_pedido values (21, 12, 31, 2, 7990);
insert into detalle_pedido values (22, 11, 32, 3, 5980);

-------- Diagrama 2 (Libro, LibAut, PRestamo, Autor, Estudiante)--------
-- 1. Crear table Libro --
CREATE TABLE Libro (
    id_libro int not null,
    titulo varchar2(255),
    editorial varchar2(255),
    area varchar2(255),
    constraint PK_LIBRO primary key (id_libro)
)
-- 2. Crear table Autor --
CREATE TABLE Autor (
    id_autor int not null,
    nombre varchar2(255),
    nacionalidad varchar2(255),
    constraint PK_AUTOR primary key (id_autor)
)
-- 3. Crear table LibAut --
CREATE TABLE LibAut (
    id_libaut int not null,
    id_libro int,
    id_autor int,
    constraint PK_LIBAUT primary key (id_libaut),
    constraint FK_LIBRO foreign key (id_libro) references Libro(id_libro),
    constraint FK_AUTOR foreign key (id_autor) references Autor(id_autor)    
)
-- 4. Crear tabla Estudiante --
CREATE TABLE Estudiante (
    id_lector int not null,
    CI varchar2(255),
    nombre varchar2(255),
    direccion varchar2(255),
    carrera varchar2(255),
    edad int,
    constraint PK_ESTUDIANTE primary key (id_lector)
)
-- 5. Crear tabla Prestamo --
CREATE TABLE Prestamo (
    id_prestamo int not null,
    id_lector int,
    id_libro int,
    fecha_prestamo date,
    fecha_devolucion date,
    devuelto char(1), -- S o N
    constraint PK_PRESTAMO primary key (id_prestamo),
    constraint FK_LIBRO_P foreign key (id_libro) references Libro(id_libro),
    constraint FK_LECTOR foreign key (id_lector) references Estudiante(id_lector) 
)
-- 6. Insertar en la tabla Libro --
insert into libro values (001, 'Calculo I', 'McGraw-Hill', 'Matematicas');
insert into libro values (002, 'Introducción a la programación', 'Pearson', 'Informatica');

-- 7. Insertar en la tabla Autor --
insert into autor values (010, 'James Stewart', 'EE.UU');
insert into autor values (020, 'Luis Joyanes Aguilar', 'España');

-- 8. Insertar en la tabla LibAut --
insert into libaut values (100, 001, 010);
insert into libaut values (200, 002, 020);

-- 9. Insertar en la tabla Estudiante --
insert into estudiante values (111, '20.799.304-9', 'Martina Diaz', 'Calle xx', 'Ing Programación', 23);
insert into estudiante values (112, '21.667.234-0', 'Felipe Berrios', 'Calle yy', 'Ing Programación', 26);

-- 10. Insertar en la tabla Prestamo --
insert into prestamo values (1, 111, 001, to_date('25/10/2025','dd/mm/yyyy'), to_date('05/11/2025','dd/mm/yyyy'), 'S');
insert into prestamo values (2, 112, 002, to_date('25/10/2025','dd/mm/yyyy'), null, 'N');
