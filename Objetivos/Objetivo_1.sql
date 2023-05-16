set global local_infile=1; -- activar la variable 'Local_infile' para poder cargar archivos de forma local
show variables like 'local_infile'; -- mostrar el status de la variable y confirmar que esta eb ON

-- Create data base
create database Insumos_Tecnologicos_SA;


-- Create table

use Insumos_Tecnologicos_SA;

create table if not exists Gastos (
IdGasto int,
IdSucursal int,
IdTipoGasto int,
Fecha date,
MontoDecimal(10,2)
);


load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Gasto.csv'
into table Gastos
fields terminated by ',' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines
(idGasto, idSucursal, idTipoGasto, fecha, monto)
;

create table if not exists Compras (
id int,
Fecha date,
IdProducto int,
Cantidad int,
Precio decimal (10,2),
IdProveedor int)
;

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Compra.csv'
into table Compras
fields terminated by ',' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines
(id, Fecha, IdProducto, Cantidad, Precio, IdProveedor)
;


create table if not exists Ventas (
id int,
Fecha date,
FechaEntrega date,
IdCanal int,
IdCliente int,
IdSucursal int,
IdEmpleado int,
IdProducto int,
Precio varchar(50),  -- lo ponemos en varchar pq hay datos inexistentes y nos marca error
Cantidad varchar(50) -- lo ponemos en varchar pq hay datos inexistentes y nos marca error
);


load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Venta.csv'
into table Ventas
fields terminated by ',' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines;


create table if not exists Sucursales (
id int,
Sucursal varchar (100),
Direccion varchar (100),
Localidad varchar (100),
Provincia varchar (100),
Latitud varchar (100),
Longitud varchar (100)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Sucursales.csv'
into table Sucursales
character set utf8mb4 -- utilizamos este set para poder añadir caracteres especiales como comas o ñ
fields terminated by ';' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines
;


create table if not exists Clientes (
id int,
Provincia varchar(100),
NombreApellido varchar(100),
Domicilio varchar(100),
Telefono varchar(100),
Edad varchar(100),
Localidad varchar(100),
X varchar(100),
Y varchar(100),
FechaAlta date,
UsuarioAlta varchar(100),
FechaUltimaModificacion date,
UsuarioUltimaModificacion varchar(100),
MarcaBaja varchar(100),
Col10 varchar(5)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Clientes.csv'
into table Clientes
character set latin1 -- utilizamos este set para pasar a letras originales, ciertos caracteres especiales
fields terminated by ';' enclosed by '' escaped by '\"'
lines terminated by '\n' ignore 1 lines;


create table if not exists CanalesVentas (
id int,
Canal varchar(50)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/CanalDeVenta.csv'
into table CanalesVentas
fields terminated by ',' enclosed by ''
lines terminated by '\n' ignore 1 lines;


create table if not exists TiposGastos
(
id int,
Descripcion varchar(100),
MontoAproximado int
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/TiposDeGasto.csv'
into table TiposGastos
fields terminated by ',' enclosed by ''
lines terminated by '\n' ignore 1 lines;


create table if not exists Proveedores
(
id int,
Nombre varchar(100),
Domicilio varchar(200),
Ciudad varchar(100),
Provincia varchar(50),
Pais varchar(100),
Departamento varchar(100)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Proveedores.csv'
into table Proveedores
fields terminated by ',' enclosed by '' escaped by ''
lines terminated by '\n' ignore 1 lines;


create table if not exists Productos
(
id int,
Concepto varchar(100),
Tipo varchar(50),
Precio varchar(100)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/PRODUCTOS.csv'
into table Productos
fields terminated by ',' ENCLOSED BY '' ESCAPED BY '\"'
lines terminated by '\n' ignore 1 lines;


create table if not exists Empleados
(
id int,
Apellido varchar(100),
Nombre varchar(100),
Sucursal varchar(100),
Sector varchar(100),
Cargo varchar(100),
Salario varchar(100)
);

load data local infile 'C:/Users/willi/OneDrive/Escritorio/Proyectos/Insumos_Tecnologicos_SA/Datasets/Empleados.csv'
into table Empleados
fields terminated by ',' enclosed by '' escaped by''
lines terminated by '\n' ignore 1 lines;