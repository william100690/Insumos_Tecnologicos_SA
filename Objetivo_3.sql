use Insumos_Tecnologicos_SA;

-- 1) Normalizar los nombres de los campos y colocar el tipo de dato adecuado para cada uno en cada una de las tablas. 
-- Descartar columnas que consideres que no tienen relevancia.
SELECT * from Compras;
ALTER TABLE `Compras` CHANGE `id` `IdCompra` int(11) not null;

SELECT * from Ventas;
ALTER Table `Ventas` CHANGE `id` `IdVenta` INT(11) not null;

SELECT * from Sucursales;
ALTER table `Sucursales` CHANGE `id` `IdSucursal`INT(11) not null;

SELECT * from Clientes;
ALTER table `Clientes` CHANGE `id` `IdCliente`INT(11) not null;

SELECT * from CanalesVentas;
ALTER table `CanalesVentas` CHANGE `id` `IdCanalVenta` int(11) not null;

SELECT * from TiposGastos;
ALTER TABLE `TiposGastos` CHANGE `id` `IdTipoGasto` int(11) not null;

SELECT * from Proveedores;
ALTER table `Proveedores` CHANGE `id` `IdProveedor`int(11) not null;

SELECT * from Productos;
ALTER TABLE `Productos` CHANGE `id` `IdProducto` INT(11) not null;

SELECT * from Empleados;
ALTER TABLE `Empleados` CHANGE `id` `IdEmpleado` INT(11) not null;

-- 2) Buscar valores faltantes y campos inconsistentes en las tablas Productos, Sucursales, Proveedores, Empleados, Clientes. 
--y Ventas. De encontrarlos, deberás corregirlos o desestimarlos. Propone y realiza una acción correctiva sobre ese problema.
SELECT * FROM Productos;
SELECT COUNT(*) as Total_datos,
       SUM(CASE WHEN IdProducto="" or IdProducto = 0 or IdProducto is null THEN 1 ELSE 0 END) as Nulos_id,
       SUM(CASE WHEN concepto="" or concepto is null THEN 1 ELSE 0 END) as Nulos_Conceto,
       SUM(CASE WHEN tipo="" or tipo is null THEN 1 ELSE 0 END) as Nulos_tipo,
       SUM(CASE WHEN precio="" or precio = 0 or precio is null THEN 1 ELSE 0 END) as Nulos_precio
FROM Productos;
-- Borrar los nulos
DELETE from Productos where tipo = "" or tipo is null;
DELETE from Productos where precio = "" or precio is null;


SELECT * from Sucursales;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN IdSucursal="" or IdSucursal = 0 or IdSucursal is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN Sucursal="" or Sucursal is null THEN 1 ELSE 0 END) as Nulos_sucursal,
    SUM(CASE WHEN direccion="" or direccion is null THEN 1 ELSE 0 END) as Nulos_direccion,
    SUM(CASE WHEN localidad="" or localidad is null THEN 1 ELSE 0 END) as Nulos_localidad,
    SUM(CASE WHEN provincia="" or provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN latitud="" or latitud = 0 or latitud is null THEN 1 ELSE 0 END) as Nulos_latitud,
    SUM(CASE WHEN longitud="" or longitud = 0 or longitud is null THEN 1 ELSE 0 END) as Nulos_longitud
FROM Sucursales;


SELECT * from Proveedores;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN IdProveedor="" or IdProveedor=0 or IdProveedor is null THEN 1 ELSE 0 END) as Nulos_idproveedor,
    SUM(CASE WHEN nombre="" or nombre is null THEN 1 ELSE 0 END) as Nulos_nombre,
    SUM(CASE WHEN domicilio="" or domicilio is null THEN 1 ELSE 0 END) as Nulos_domicilio,
    SUM(CASE WHEN ciudad="" or ciudad is null THEN 1 ELSE 0 END) as Nulos_ciudad,
    SUM(CASE WHEN provincia="" or provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN pais="" or pais is null THEN 1 ELSE 0 END) as Nulos_pais,
    SUM(CASE WHEN departamento="" or departamento is null THEN 1 ELSE 0 END) as Nulos_departamento
FROM Proveedores;
-- Borrar los valores nulos
DELETE from Proveedores where nombre = "" or nombre is null;


SELECT * from Empleados;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
    sum(CASE WHEN IdEmpleado="" or IdEmpleado = 0 or IdEmpleado IS NULL THEN 1 ELSE 0 END) as Nulos_id,
    sum(CASE WHEN apellido="" or apellido = 0 or apellido IS NULL THEN 1 ELSE 0 END) as Nulos_apellido,
    sum(CASE WHEN nombre="" or nombre IS NULL THEN 1 ELSE 0 END) as Nulos_nombre,
    sum(CASE WHEN Sucursal="" or Sucursal IS NULL THEN 1 ELSE 0 END) as Nulos_sucursal,
    sum(CASE WHEN sector="" or sector IS NULL THEN 1 ELSE 0 END) as Nulos_sector,
    sum(CASE WHEN cargo="" or cargo IS NULL THEN 1 ELSE 0 END) as Nulos_cargo,
    sum(CASE WHEN salario="" or salario IS NULL THEN 1 ELSE 0 END) as Nulos_salario
FROM Empleados;


SELECT * from Clientes;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
       SUM(CASE WHEN IdCliente="" or IdCliente = 0 or IdCliente IS NULL THEN 1 ELSE 0 END) as Nulos_id,
       sum(CASE WHEN provincia="" or provincia IS NULL THEN 1 ELSE 0 END) as Nulos_provincia,
       sum(CASE WHEN nombre_apellido="" or nombre_apellido IS NULL THEN 1 ELSE 0 END) as Nulos_nombre_apellido,
       sum(CASE WHEN domicilio="" or domicilio IS NULL THEN 1 ELSE 0 END) as Nulos_domicilio,
       sum(CASE WHEN telefono="" or telefono = 0 or telefono IS NULL THEN 1 ELSE 0 END) as Nulos_telefono,
       sum(CASE WHEN edad="" or edad = 0 or edad IS NULL THEN 1 ELSE 0 END) as Nulos_edad,
       sum(CASE WHEN localidad = "" or localidad IS NULL THEN 1 ELSE 0 END) as Nulos_localidad,
       sum(CASE WHEN X="" or X = 0 or X IS NULL THEN 1 ELSE 0 END) as Nulos_X,
       sum(CASE WHEN Y="" or Y = 0 or Y IS NULL THEN 1 ELSE 0 END) as Nulos_Y,
       sum(CASE WHEN trim(fecha_alta)="" or fecha_alta IS NULL THEN 1 ELSE 0 END) as Nulos_fecha_alta,
       sum(CASE WHEN usuario_alta="" or usuario_alta IS NULL THEN 1 ELSE 0 END) as Nulos_usuario_alta,
       sum(CASE WHEN trim(fecha_ultima_modificacion)="" or fecha_ultima_modificacion IS NULL THEN 1 ELSE 0 END) as Nulos_fecha_ultima_modificacion,
       sum(CASE WHEN usuario_ultima_modificacion="" or usuario_ultima_modificacion IS NULL THEN 1 ELSE 0 END) as Nulos_usuario_ultima_modificacion,
       sum(CASE WHEN marca_baja="" or marca_baja IS NULL THEN 1 ELSE 0 END) as Nulos_marca_baja
FROM Clientes;
-- Borrar los valores nulos
DELETE from Clientes where provincia="" or provincia is null;
DELETE from Clientes where nombre_apellido="" or nombre_apellido is null;
DELETE from Clientes where domicilio="" or domicilio is null;
DELETE from Clientes where telefono="" or telefono is null;
DELETE from Clientes where localidad = "" or localidad is null;
DELETE from Clientes where X = "" or X is null;
DELETE from Clientes where Y = "" or Y is null;


SELECT * from Ventas;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN IdVenta="" or IdVenta=0 or IdVenta is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN trim(Fecha)="" or Fecha is null THEN 1 ELSE 0 END) as Nulos_Fecha,
    SUM(CASE WHEN trim(Fecha_Entrega)="" or Fecha_Entrega is null THEN 1 ELSE 0 END) as Nulos_Fecha_Entrega,
    SUM(CASE WHEN IdCanal="" or IdCanal=0 or IdCanal is null THEN 1 ELSE 0 END) as Nulos_IdCanal,
    SUM(CASE WHEN IdCliente="" or IdCliente=0 or IdCliente is null THEN 1 ELSE 0 END) as Nulos_IdCliente,
    SUM(CASE WHEN IdSucursal="" or IdSucursal=0 or IdSucursal is null THEN 1 ELSE 0 END) as Nulos_IdSucursal,
    SUM(CASE WHEN IdEmpleado="" or IdEmpleado=0 or IdEmpleado is null THEN 1 ELSE 0 END) as Nulos_IdEmpleado,
    SUM(CASE WHEN IdProducto="" or IdProducto=0 or IdProducto is null THEN 1 ELSE 0 END) as Nulos_IdProducto,
    SUM(CASE WHEN Precio="" or Precio=0 or Precio=0 or Precio is null THEN 1 ELSE 0 END) as Nulos_Precio,
    SUM(CASE WHEN Cantidad="" or Cantidad=0 or Cantidad is null THEN 1 ELSE 0 END) as Nulos_Cantidad
FROM Ventas;
-- Borrar los valores nulos
DELETE from Ventas where precio = "" or precio = 0 or precio is null;
DELETE from Ventas where Cantidad = "" or Cantidad = 0 or Cantidad is null;


-- 4) Chequear la consistencia de los campos latitud y longitud de la tabla Clientes
-- Chequear la consistencia del campo salario de la tabla Empleados
-- Chequear la consistencia del campo precio de la tabla Productos
-- Chequear la consistencia de los campos latitud y longitud de la tabla Sucursales
-- Chequear la consistencia de los campos precio y cantidad de la tabla ventas

SELECT * from Clientes; --observamos la tabla Clientes, las columnas X y Y estan en tipo varchar hay que cambiarlos
ALTER TABLE `Clientes` 	ADD `Latitud` DECIMAL(13,10) DEFAULT '0' AFTER `Y`, -- Agregamos la columna Latitud
						ADD `Longitud` DECIMAL(13,10) DEFAULT '0' AFTER `Latitud`; -- Agregamos la columna Longitud
UPDATE Clientes SET Y = '0' WHERE Y = ''; -- colocamos valor de cero donde hay espacios vacíos
UPDATE Clientes SET X = '0' WHERE X = '';-- colocamos valor de cero donde hay espacios vacíos
UPDATE `Clientes` SET Latitud = REPLACE(Y,',','.'); -- pasamos los valores de la columna Y a la columna Latitud
UPDATE `Clientes` SET Longitud = REPLACE(X,',','.'); -- pasamos los valores de la columna X a la columna Longitud
ALTER TABLE `Clientes` DROP `Y`;
ALTER TABLE `Clientes` DROP `X`;


SELECT * from Empleados; --Observamos que los datos de la columna salario esta en varchar hay que cambiarla
ALTER TABLE `Empleados` ADD `Salario_` DECIMAL(10,2) DEFAULT '0' AFTER `salario`; -- agregamos la columna
UPDATE Empleados SET Salario_ = REPLACE(salario,'"',''); -- pasamos los valores 
ALTER TABLE `Empleados` drop `salario`;


SELECT * from Productos; --Observamos que los datos de la columna precio esta en varchar hay que cambiarlos
ALTER Table `Productos` add `Precio_` DECIMAL(15,3) DEFAULT '0' after `precio`; -- agregamos la columna
Update Productos set Precio_ = REPLACE(precio,',','.');
ALTER table `Productos` drop `precio`;


SELECT * from Sucursales; -- observamos que las columnas latitud y longitud estan en varchar
ALTER TABLE `Sucursales` ADD `Latitud_` DECIMAL(13,10) DEFAULT '0' AFTER `latitud`, -- Agregamos la columna Latitud
						ADD `Longitud_` DECIMAL(13,10) DEFAULT '0' AFTER `Latitud_`; -- Agregamos la columna Longitud
UPDATE `Sucursales` SET Latitud_ = REPLACE(latitud,',','.'); -- pasamos los valores de la columna Y a la columna Latitud
UPDATE `Sucursales` SET Longitud_ = REPLACE(longitud,',','.'); -- pasamos los valores de la columna X a la columna Longitud
ALTER TABLE `Sucursales` DROP `latitud`;
ALTER TABLE `Sucursales` DROP `longitud`;


SELECT * from Ventas; -- observamos que las columnas de Precio y Cantidad estan en varchar, hay que cambiarlas
alter Table `Ventas`ADD `Precio_` DECIMAL(10,2) DEFAULT '0' after `Cantidad`,
                    ADD `Cantidad_` int(3) DEFAULT '0' after `Precio_`;
UPDATE `Ventas` set Precio_ = REPLACE(Precio,"",'');
UPDATE `Ventas` set Cantidad_ = REPLACE(Cantidad,"",'');
ALTER table `Ventas` drop `Precio`;
ALTER Table `Ventas` drop `Cantidad`;


-- 5) Chequear que no haya claves duplicadas, y de encontrarla en alguna de las tablas, proponer una solución.