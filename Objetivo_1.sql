set global local_infile=1; -- activar la variable 'Local_infile' para poder cargar archivos de forma local
show variables like 'local_infile'; -- mostrar el status de la variable y confirmar que esta eb ON

-- Create data base
create database Insumos_Tecnologicos_SA;


-- Create table

use Insumos_Tecnologicos_SA;

create table if not exists gasto (
idGasto int,
idSucursal int,
idTipoGasto int,
fecha date,
monto decimal(10,2)
);


load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Gasto.csv'
into table gasto
fields terminated by ',' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines
(idGasto, idSucursal, idTipoGasto, fecha, monto)
;

create table if not exists compra (
idCompra int,
Fecha date,
IdProducto int,
Cantidad int,
Precio decimal (10,2),
IdProveedor int)
;

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Compra.csv'
into table compra
fields terminated by ',' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines
(idCompra, Fecha, IdProducto, Cantidad, Precio, IdProveedor)
;


create table if not exists venta (
idVenta int,
Fecha date,
Fecha_Entrega date,
IdCanal int,
IdCliente int,
IdSucursal int,
IdEmpleado int,
IdProducto int,
Precio varchar(50),  -- lo ponemos en varchar pq hay datos inexistentes y nos marca error
Cantidad varchar(50) -- lo ponemos en varchar pq hay datos inexistentes y nos marca error
);


load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Venta.csv'
into table venta
fields terminated by ',' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines;

create table if not exists sucursal (
id int,
sucursal varchar (100),
direccion varchar (100),
localidad varchar (100),
provincia varchar (100),
latitud varchar (100),
longitud varchar (100)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Sucursales.csv'
into table sucursal
character set utf8mb4 -- utilizamos este set para poder añadir caracteres especiales como comas o ñ
fields terminated by ';' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines
;

create table if not exists clientes (
id int,
provincia varchar(100),
nombre_apellido varchar(100),
domicilio varchar(100),
telefono varchar(100),
edad varchar(100),
X varchar(100),
fecha_alta date,
usuario_alta varchar(100),
fecha_ultima_modificacion date,
usuario_ultima_modificacion varchar(100),
marca_baja tinyint,
col10 varchar(5)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Clientes.csv'
into table clientes
character set latin1 -- utilizamos este set para pasar a letras originales, ciertos caracteres especiales
fields terminated by ';' enclosed by '' escaped by '\"'
lines terminated by '\n' ignore 1 lines;


create table if not exists canal_venta (
idcanal int,
canal varchar(50)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/CanalDeVenta.csv'
into table canal_venta
fields terminated by ',' enclosed by ''
lines terminated by '\n' ignore 1 lines;


create table if not exists tipo_gasto
(
idtipogasto int,
descripcion varchar(100),
monto_aproximado int
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/TiposDeGasto.csv'
into table tipo_gasto
fields terminated by ',' enclosed by ''
lines terminated by '\n' ignore 1 lines;


create table if not exists proveedores
(
idproveedor int,
nombre varchar(100),
domicilio varchar(200),
ciudad varchar(100),
provincia varchar(50),
pais varchar(100),
departamento varchar(100)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Proveedores.csv'
into table proveedores
fields terminated by ',' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines;

drop table productos;
select * from productos;

create table if not exists productos
(
idproducto int,
concepto varchar(100),
tipo varchar(50),
precio varchar(100)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/PRODUCTOS.csv'
into table productos
fields terminated by ',' ENCLOSED BY '' ESCAPED BY '\"'
lines terminated by '\n' ignore 1 lines;

drop table empleado;
select * from empleado;

create table if not exists empleado
(
idempleado int,
apellido varchar(100),
nombre varchar(100),
sucursal varchar(100),
sector varchar(100),
cargo varchar(100),
salario varchar(100)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Empleados.csv'
into table empleado
fields terminated by ',' enclosed by '' escaped by''
lines terminated by '\n' ignore 1 lines;

select * from empleado;