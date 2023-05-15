use Insumos_Tecnologicos_SA;

-- 1) Normalizar los nombres de los campos y colocar el tipo de dato adecuado para cada uno en cada una de las tablas. 
-- Descartar columnas que consideres que no tienen relevancia.
SELECT * from clientes;
ALTER TABLE `clientes` CHANGE `id` `IdCliente` int(11) not null;

SELECT * from empleado;
ALTER Table `empleado` CHANGE `idempleado` `IdEmpleado` INT(11) null DEFAULT null;

SELECT * from proveedores;


-- 2) Buscar valores faltantes y campos inconsistentes en las tablas productos, sucursal, proveedores, empleado, clientes. 
--y venta. De encontrarlos, deberás corregirlos o desestimarlos. Propone y realiza una acción correctiva sobre ese problema.
SELECT * FROM productos;
SELECT COUNT(*) as Total_datos,
       SUM(CASE WHEN trim(idproducto)="" or idproducto is null THEN 1 ELSE 0 END) as Nulos_Id,
       SUM(CASE WHEN trim(concepto)="" or concepto is null THEN 1 ELSE 0 END) as Nulos_Conceto,
       SUM(CASE WHEN trim(tipo)="" or tipo is null THEN 1 ELSE 0 END) as Nulos_tipo,
       SUM(CASE WHEN trim(precio)="" or precio is null THEN 1 ELSE 0 END) as Nulos_precio
FROM productos;
-- Borrar los nulos
DELETE from productos where tipo = "" or tipo is null;
DELETE from productos where precio = "" or precio is null;


SELECT * from sucursal;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN trim(id)="" or id is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN trim(sucursal)="" or sucursal is null THEN 1 ELSE 0 END) as Nulos_sucursal,
    SUM(CASE WHEN trim(direccion)="" or direccion is null THEN 1 ELSE 0 END) as Nulos_direccion,
    SUM(CASE WHEN trim(localidad)="" or localidad is null THEN 1 ELSE 0 END) as Nulos_localidad,
    SUM(CASE WHEN trim(provincia)="" or provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN trim(latitud)="" or latitud is null THEN 1 ELSE 0 END) as Nulos_latitud,
    SUM(CASE WHEN trim(longitud)="" or longitud is null THEN 1 ELSE 0 END) as Nulos_longitud
FROM sucursal;


SELECT * from proveedores;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN trim(idproveedor)="" or idproveedor is null THEN 1 ELSE 0 END) as Nulos_idproveedor,
    SUM(CASE WHEN trim(nombre)="" or nombre is null THEN 1 ELSE 0 END) as Nulos_nombre,
    SUM(CASE WHEN trim(domicilio)="" or domicilio is null THEN 1 ELSE 0 END) as Nulos_domicilio,
    SUM(CASE WHEN trim(ciudad)="" or ciudad is null THEN 1 ELSE 0 END) as Nulos_ciudad,
    SUM(CASE WHEN trim(provincia)="" or provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN trim(pais)="" or pais is null THEN 1 ELSE 0 END) as Nulos_pais,
    SUM(CASE WHEN trim(departamento)="" or departamento is null THEN 1 ELSE 0 END) as Nulos_departamento
FROM proveedores;
-- Borrar los valores nulos
DELETE from proveedores where nombre = "" or nombre is null;


SELECT * from empleado;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
    sum(CASE WHEN trim(idempleado)="" or idempleado IS NULL THEN 1 ELSE 0 END) as Nulos_idempleado,
    sum(CASE WHEN trim(apellido)="" or apellido IS NULL THEN 1 ELSE 0 END) as Nulos_apellido,
    sum(CASE WHEN trim(nombre)="" or nombre IS NULL THEN 1 ELSE 0 END) as Nulos_nombre,
    sum(CASE WHEN trim(sucursal)="" or sucursal IS NULL THEN 1 ELSE 0 END) as Nulos_sucursal,
    sum(CASE WHEN trim(sector)="" or sector IS NULL THEN 1 ELSE 0 END) as Nulos_sector,
    sum(CASE WHEN trim(cargo)="" or cargo IS NULL THEN 1 ELSE 0 END) as Nulos_cargo,
    sum(CASE WHEN trim(salario)="" or salario IS NULL THEN 1 ELSE 0 END) as Nulos_salario
FROM empleado;


SELECT * from clientes;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
       SUM(CASE WHEN trim(id)="" or id IS NULL THEN 1 ELSE 0 END) as Nulos_id,
       sum(CASE WHEN trim(provincia)="" or provincia IS NULL THEN 1 ELSE 0 END) as Nulos_provincia,
       sum(CASE WHEN trim(nombre_apellido)="" or nombre_apellido IS NULL THEN 1 ELSE 0 END) as Nulos_nombre_apellido,
       sum(CASE WHEN trim(domicilio)="" or domicilio IS NULL THEN 1 ELSE 0 END) as Nulos_domicilio,
       sum(CASE WHEN trim(telefono)="" or telefono IS NULL THEN 1 ELSE 0 END) as Nulos_telefono,
       sum(CASE WHEN trim(edad)="" or edad IS NULL THEN 1 ELSE 0 END) as Nulos_edad,
       sum(CASE WHEN trim(localidad)="" or localidad IS NULL THEN 1 ELSE 0 END) as Nulos_localidad,
       sum(CASE WHEN trim(X)="" or X IS NULL THEN 1 ELSE 0 END) as Nulos_X,
       sum(CASE WHEN trim(Y)="" or Y IS NULL THEN 1 ELSE 0 END) as Nulos_Y,
       sum(CASE WHEN trim(fecha_alta)="" or fecha_alta IS NULL THEN 1 ELSE 0 END) as Nulos_fecha_alta,
       sum(CASE WHEN trim(usuario_alta)="" or usuario_alta IS NULL THEN 1 ELSE 0 END) as Nulos_usuario_alta,
       sum(CASE WHEN trim(fecha_ultima_modificacion)="" or fecha_ultima_modificacion IS NULL THEN 1 ELSE 0 END) as Nulos_fecha_ultima_modificacion,
       sum(CASE WHEN trim(usuario_ultima_modificacion)="" or usuario_ultima_modificacion IS NULL THEN 1 ELSE 0 END) as Nulos_usuario_ultima_modificacion,
       sum(CASE WHEN trim(marca_baja)="" or marca_baja IS NULL THEN 1 ELSE 0 END) as Nulos_marca_baja
FROM clientes;
-- Borrar los valores nulos
DELETE from clientes where provincia="" or provincia is null;
DELETE from clientes where nombre_apellido="" or nombre_apellido is null;
DELETE from clientes where domicilio="" or domicilio is null;
DELETE from clientes where telefono="" or telefono is null;
DELETE from clientes where localidad = "" or localidad is null;
DELETE from clientes where X = "" or X is null;
DELETE from clientes where Y = "" or Y is null;


SELECT * from venta;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN idVenta="" or idVenta=0 or idVenta is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN trim(Fecha)="" or Fecha is null THEN 1 ELSE 0 END) as Nulos_Fecha,
    SUM(CASE WHEN trim(Fecha_Entrega)="" or Fecha_Entrega is null THEN 1 ELSE 0 END) as Nulos_Fecha_Entrega,
    SUM(CASE WHEN IdCanal="" or IdCanal=0 or IdCanal is null THEN 1 ELSE 0 END) as Nulos_IdCanal,
    SUM(CASE WHEN IdCliente="" or IdCliente=0 or IdCliente is null THEN 1 ELSE 0 END) as Nulos_IdCliente,
    SUM(CASE WHEN IdSucursal="" or IdSucursal=0 or IdSucursal is null THEN 1 ELSE 0 END) as Nulos_IdSucursal,
    SUM(CASE WHEN IdEmpleado="" or IdEmpleado=0 or IdEmpleado is null THEN 1 ELSE 0 END) as Nulos_IdEmpleado,
    SUM(CASE WHEN IdProducto="" or IdProducto=0 or IdProducto is null THEN 1 ELSE 0 END) as Nulos_IdProducto,
    SUM(CASE WHEN Precio="" or Precio=0 or Precio=0 or Precio is null THEN 1 ELSE 0 END) as Nulos_Precio,
    SUM(CASE WHEN Cantidad="" or Cantidad=0 or Cantidad is null THEN 1 ELSE 0 END) as Nulos_Cantidad
FROM venta;
-- Borrar los valores nulos
DELETE from venta where precio = "" or precio = 0 or precio is null;
DELETE from venta where Cantidad = "" or Cantidad = 0 or Cantidad is null;


-- 4) Chequear la consistencia de los campos latitud y longitud de la tabla clientes
-- Chequear la consistencia del campo salario de la tabla empleado
-- Chequear la consistencia del campo precio de la tabla productos
-- Chequear la consistencia de los campos latitud y longitud de la tabla sucursal
-- Chequear la consistencia de los campos precio y cantidad de la tabla ventas

SELECT * from clientes; --observamos la tabla clientes, las columnas X y Y estan en tipo varchar hay que cambiarlos
ALTER TABLE `clientes` 	ADD `Latitud` DECIMAL(13,10) DEFAULT '0' AFTER `Y`, -- Agregamos la columna Latitud
						ADD `Longitud` DECIMAL(13,10) DEFAULT '0' AFTER `Latitud`; -- Agregamos la columna Longitud
UPDATE clientes SET Y = '0' WHERE Y = ''; -- colocamos valor de cero donde hay espacios vacíos
UPDATE clientes SET X = '0' WHERE X = '';-- colocamos valor de cero donde hay espacios vacíos
UPDATE `clientes` SET Latitud = REPLACE(Y,',','.'); -- pasamos los valores de la columna Y a la columna Latitud
UPDATE `clientes` SET Longitud = REPLACE(X,',','.'); -- pasamos los valores de la columna X a la columna Longitud
ALTER TABLE `clientes` DROP `Y`;
ALTER TABLE `clientes` DROP `X`;


SELECT * from empleado; --Observamos que los datos de la columna salario esta en varchar hay que cambiarla
ALTER TABLE `empleado` ADD `Salario_` DECIMAL(10,2) DEFAULT '0' AFTER `salario`; -- agregamos la columna
UPDATE empleado SET Salario_ = REPLACE(salario,'"',''); -- pasamos los valores 
ALTER TABLE `empleado` drop `salario`;


SELECT * from productos; --Observamos que los datos de la columna precio esta en varchar hay que cambiarlos
ALTER Table `productos` add `Precio_` DECIMAL(15,3) DEFAULT '0' after `precio`; -- agregamos la columna
Update productos set Precio_ = REPLACE(precio,',','.');
ALTER table `productos` drop `precio`;


SELECT * from sucursal; -- observamos que las columnas latitud y longitud estan en varchar
ALTER TABLE `sucursal` 	ADD `Latitud_` DECIMAL(13,10) DEFAULT '0' AFTER `latitud`, -- Agregamos la columna Latitud
						ADD `Longitud_` DECIMAL(13,10) DEFAULT '0' AFTER `Latitud_`; -- Agregamos la columna Longitud
UPDATE `sucursal` SET Latitud_ = REPLACE(latitud,',','.'); -- pasamos los valores de la columna Y a la columna Latitud
UPDATE `sucursal` SET Longitud_ = REPLACE(longitud,',','.'); -- pasamos los valores de la columna X a la columna Longitud
ALTER TABLE `sucursal` DROP `latitud`;
ALTER TABLE `sucursal` DROP `longitud`;


SELECT * from venta; -- observamos que las columnas de Precio y Cantidad estan en varchar, hay que cambiarlas
alter Table `venta` ADD `Precio_` DECIMAL(10,2) DEFAULT '0' after `Cantidad`,
                    ADD `Cantidad_` int(3) DEFAULT '0' after `Precio_`;
UPDATE `venta` set Precio_ = REPLACE(Precio,"",'');
UPDATE `venta` set Cantidad_ = REPLACE(Cantidad,"",'');
ALTER table `venta` drop `Precio`;
ALTER Table `venta` drop `Cantidad`;


-- 5) Chequear que no haya claves duplicadas, y de encontrarla en alguna de las tablas, proponer una solución.