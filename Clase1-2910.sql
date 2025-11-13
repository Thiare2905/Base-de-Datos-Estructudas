---- Creamos tabla centro ----
CREATE TABLE Centros (
    numero int not null,
    nombre varchar2(255),
    direccion varchar2(255),
    constraint PK_CENTRO primary key (numero)
)
---- Crear tabla de departamentos ----
CREATE TABLE Departamentos (
    numero int not null,
    centro int,
    director int, 
    tipo_dir varchar2(255),
    presupuesto int,
    depto_jefe int,
    nombre varchar2(255),
    constraint PK_DEP primary key (numero),
    constraint FK_CENTRO foreign key (centro) references Centros(numero)
)
---- Crear tabla de Empleados ----
CREATE TABLE Empleados (
    cod int not null,
    departamento int,
    telefono int,
    fecha_nacimiento date,
    fecha_ingreso date,
    salario int,
    comision int,
    num_hijos int,
    nombre varchar2(255),
    constraint PK_EMPLEADO primary key (cod),
    constraint FK_DEP foreign key (departamento) references Departamentos(numero)
)
---- Se insertan los datos de los Centros ----
insert into centros (numero, nombre, direccion) values 
                    (10, 'Sede Central', 'C/ Alcala 820, Madrid');
insert into centros values (20, 'Relacion con Clientes', 'C/ Atocha 405, Madrid');

---- Se insertan datos de los departamentos ----
insert into departamentos values (101, 10, 160, 'P', 12, null, 'Direccion General');
insert into departamentos values (110, 20, 180, 'P', 15, 100, 'Direccion Comercial');
insert into departamentos values (111, 20, 180, 'F', 11, 110, 'Sector Industrial');
insert into departamentos values (112, 20, 270, 'P', 9, 100, 'Sector Servicios');
insert into departamentos values (120, 10, 150, 'F', 3, 100, 'Organizacion');
insert into departamentos values (121, 10, 150, 'P', 2, 120, 'Personal');
insert into departamentos values (122, 10, 350, 'P', 6, 120, 'Proceso de Datos');
insert into departamentos values (130, 10, 310, 'P', 2, 100, 'Finanzas');

-- update departamentos set numero=100 where numero=101;

--- Se insertan datos de Empleados ---
insert into empleados values (110, 121, 350, to_date('10/11/1939', 'dd, mm, yyyy'), to_date('10/02/1950', 'dd, mm, yyyy'), 1310, null, 3, 'Pons Cesar');
insert into empleados values (120, 112, 840, to_date('9/06/1945', 'dd, mm, yyyy'), to_date('1/10/1968', 'dd, mm, yyyy'), 1350, 110, 1, 'Lasa Mario');
insert into empleados values (110, 121, 350, to_date('10/11/1939', 'dd, mm, yyyy'), to_date('10/02/1950', 'dd, mm, yyyy'), 1310, null, 3, 'Pons Cesar');

---- Consultas ----
Select * from centros;
Select * from departamentos;
Select * from empleados;

---- Modificar una tabla - Añade una columna ---
alter table centros add apellido varchar2(255)
alter table centros rename column apellido to apellido2