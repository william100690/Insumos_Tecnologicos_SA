use Insumos_Tecnologicos_SA;

-- 1) Normalizar los nombres de los campos y colocar el Tipo de dato adecuado para cada uno en cada una de las tablas. 
-- Descartar columnas que consideres que no tienen relevancia.

-- 1ro Hacer la normalización de los nombres de los campos
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

--  2do cambiar el tipo de dato
SELECT * from Clientes; --observamos la tabla Clientes, las columnas X y Y estan en Tipo varchar hay que cambiarlos
ALTER TABLE `Clientes` 	ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Y`, -- Agregamos la columna Latitud
						ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`; -- Agregamos la columna Longitud

UPDATE Clientes SET Y = '0' WHERE Y = ''; -- colocamos valor de cero donde hay espacios vacíos
UPDATE Clientes SET X = '0' WHERE X = '';-- colocamos valor de cero donde hay espacios vacíos
UPDATE `Clientes` SET Latitud = REPLACE(Y,',','.'); -- pasamos los valores de la columna Y a la columna Latitud
UPDATE `Clientes` SET Longitud = REPLACE(X,',','.'); -- pasamos los valores de la columna X a la columna Longitud
ALTER TABLE `Clientes` DROP `Y`; --eliminar la columna anterior
ALTER TABLE `Clientes` DROP `X`; --eliminar la columna anterior


SELECT * from Empleados; --Observamos que los datos de la columna salario esta en varchar hay que cambiarla
ALTER TABLE `Empleados` ADD `Salario_` DECIMAL(10,2) DEFAULT '0' AFTER `salario`; -- agregamos la columna
UPDATE Empleados SET Salario_ = REPLACE(salario,'"',''); -- pasamos los valores 
ALTER TABLE `Empleados` drop `salario`; --eliminar la columna anterior
ALTER Table `Empleados` RENAME COLUMN Salario_ to Salario; -- renombrar la columna nueva


SELECT * from Productos; --Observamos que los datos de la columna Precio esta en varchar hay que cambiarlos
ALTER Table `Productos` add `Precio_` DECIMAL(15,3) not null DEFAULT '0' after `Precio`; -- agregamos la columna
Update Productos set Precio_ = REPLACE(Precio,',','.') where Precio !="" ; --pasar los valores a la columna nueva
ALTER table `Productos` drop `Precio`; --eliminar la columna anterior
ALTER table `Productos` RENAME COLUMN Precio_ to Precio; --renombra la columna nueva


SELECT * from Sucursales; -- observamos que las columnas latitud y longitud estan en varchar
ALTER TABLE `Sucursales` ADD `Latitud_` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `latitud`, -- Agregamos la columna Latitud
						ADD `Longitud_` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud_`; -- Agregamos la columna Longitud

UPDATE `Sucursales` SET Latitud_ = REPLACE(latitud,',','.'); -- pasamos los valores de la columna Y a la columna Latitud
UPDATE `Sucursales` SET Longitud_ = REPLACE(longitud,',','.'); -- pasamos los valores de la columna X a la columna Longitud
ALTER TABLE `Sucursales` DROP `latitud`; --eliminar la columna anterior
ALTER TABLE `Sucursales` DROP `longitud`; --eliminar la columna anterior
ALTER table `Sucursales` RENAME COLUMN Latitud_ to Latitud; --renombrar la columna nueva
ALTER table `Sucursales` RENAME COLUMN Longitud_ to Longitud; --renombrar la columma nueva


SELECT * from Ventas; -- observamos que las columnas de Precio y Cantidad estan en varchar, hay que cambiarlas
alter Table `Ventas`ADD `Precio_` DECIMAL(10,2) DEFAULT '0' after `Cantidad`,
                    ADD `Cantidad_` INT DEFAULT 0 after `Precio_`;
UPDATE `Ventas` set Precio_ = REPLACE(Precio,'',"") where Precio !='' ; --pasamos los valores a la columna nueva
UPDATE `Ventas` set Cantidad_ = REPLACE(Cantidad,'',"") where Cantidad !=0; --pasamos los valores a la columna nueva
ALTER table `Ventas` drop `Precio`; --eliminar la columna anterior
ALTER Table `Ventas` drop `Cantidad`; --eliminar la columna anterior
ALTER table `Ventas` Rename COLUMN Precio_ to Precio; --renomnbrar la columna nueva
ALTER TABLE `Ventas` Rename COLUMN Cantidad_ to Cantidad; --renombrar la columna nueva



-- 2) Buscar valores faltantes y campos inconsistentes en las tablas Productos, Sucursales, Proveedores, Empleados, Clientes. 
--y Ventas. De encontrarlos, deberás corregirlos o desestimarlos. Propone y realiza una acción correctiva sobre ese problema.
SELECT * FROM Productos;
SELECT COUNT(*) as Total_datos,
       SUM(CASE WHEN IdProducto="" or IdProducto = 0 or IdProducto is null THEN 1 ELSE 0 END) as Nulos_id,
       SUM(CASE WHEN Concepto="" or Concepto is null THEN 1 ELSE 0 END) as Nulos_Conceto,
       SUM(CASE WHEN Tipo="" or Tipo is null THEN 1 ELSE 0 END) as Nulos_tipo,
       SUM(CASE WHEN Precio="" or Precio = 0 or Precio is null THEN 1 ELSE 0 END) as Nulos_precio
FROM Productos;
-- Propuesta 1) Borrar los nulos
DELETE from Productos where Tipo = "" or Tipo is null;
DELETE from Productos where Precio = "" or Precio is null;
DELETE from Productos where Concepto = "" or Concepto is null;

-- Propuesta 2) Imputar valores faltantes
UPDATE `Productos` SET Tipo = 'Sin Dato' WHERE TRIM(Tipo) = "" OR ISNULL(Tipo);
UPDATE `Productos` SET Precio = 'Sin Dato' WHERE TRIM(Precio) = "" OR ISNULL(Precio);
UPDATE `Productos` SET Concepto = 'Sin Dato' WHERE TRIM(Concepto) = "" OR ISNULL(Concepto);

SELECT * from Sucursales;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN IdSucursal="" or IdSucursal = 0 or IdSucursal is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN Sucursal="" or Sucursal is null THEN 1 ELSE 0 END) as Nulos_sucursal,
    SUM(CASE WHEN direccion="" or direccion is null THEN 1 ELSE 0 END) as Nulos_direccion,
    SUM(CASE WHEN Localidad="" or Localidad is null THEN 1 ELSE 0 END) as Nulos_localidad,
    SUM(CASE WHEN provincia="" or provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN latitud="" or latitud = 0 or latitud is null THEN 1 ELSE 0 END) as Nulos_latitud,
    SUM(CASE WHEN longitud="" or longitud = 0 or longitud is null THEN 1 ELSE 0 END) as Nulos_longitud
FROM Sucursales;
-- Propuesta 1) Borrar los nulos
DELETE from Sucursales where direccion = "" or direccion is null;
DELETE from Sucursales where Sucursal = "" or direccion is null;
DELETE from Sucursales where Provincia = "" or Provincia is null;
DELETE from Sucursales where Localidad = "" or Localidad is null;
-- Propuesta 2) imputar los valores faltantes
UPDATE `Sucursales` SET direccion = 'Sin Dato' WHERE TRIM(direccion) = "" OR ISNULL(direccion);
UPDATE `Sucursales` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `Sucursales` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `Sucursales` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);

SELECT * from Proveedores;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN IdProveedor="" or IdProveedor=0 or IdProveedor is null THEN 1 ELSE 0 END) as Nulos_idproveedor,
    SUM(CASE WHEN nombre="" or nombre is null THEN 1 ELSE 0 END) as Nulos_nombre,
    SUM(CASE WHEN Domicilio="" or Domicilio is null THEN 1 ELSE 0 END) as Nulos_domicilio,
    SUM(CASE WHEN ciudad="" or ciudad is null THEN 1 ELSE 0 END) as Nulos_ciudad,
    SUM(CASE WHEN provincia="" or provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN pais="" or pais is null THEN 1 ELSE 0 END) as Nulos_pais,
    SUM(CASE WHEN departamento="" or departamento is null THEN 1 ELSE 0 END) as Nulos_departamento
FROM Proveedores;
-- Prouesta 1) Borrar los valores nulos
DELETE from Proveedores where nombre = "" or nombre is null;
DELETE from Proveedores where Domicilio = "" or Domicilio is null;
DELETE from Proveedores where ciudad = "" or ciudad is null;
DELETE from Proveedores where provincia = "" or provincia is null;
DELETE from Proveedores where pais = "" or pais is null;
DELETE from Proveedores where departamento = "" or departamento is null;

-- Propuesta 2) Imputar valores faltantes
UPDATE `Proveedores` SET nombre = 'Sin Dato' WHERE TRIM(nombre) = "" OR ISNULL(nombre);
UPDATE `Proveedores` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `Proveedores` SET ciudad = 'Sin Dato' WHERE TRIM(ciudad) = "" OR ISNULL(ciudad);
UPDATE `Proveedores` SET provincia = 'Sin Dato' WHERE TRIM(provincia) = "" OR ISNULL(provincia);
UPDATE `Proveedores` SET pais = 'Sin Dato' WHERE TRIM(pais) = "" OR ISNULL(pais);
UPDATE `Proveedores` SET departamento = 'Sin Dato' WHERE TRIM(departamento) = "" OR ISNULL(departamento);


SELECT * from Empleados;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
    sum(CASE WHEN IdEmpleado="" or IdEmpleado = 0 or IdEmpleado IS NULL THEN 1 ELSE 0 END) as Nulos_id,
    sum(CASE WHEN apellido="" or apellido IS NULL THEN 1 ELSE 0 END) as Nulos_apellido,
    sum(CASE WHEN nombre="" or nombre IS NULL THEN 1 ELSE 0 END) as Nulos_nombre,
    sum(CASE WHEN Sucursal="" or Sucursal IS NULL THEN 1 ELSE 0 END) as Nulos_sucursal,
    sum(CASE WHEN sector="" or sector IS NULL THEN 1 ELSE 0 END) as Nulos_sector,
    sum(CASE WHEN cargo="" or cargo IS NULL THEN 1 ELSE 0 END) as Nulos_cargo,
    sum(CASE WHEN salario="" or salario IS NULL THEN 1 ELSE 0 END) as Nulos_salario
FROM Empleados;
-- Propuesta 1) borrar los valores nulos
DELETE from Empleados where Apellido = "" or pais is null;
DELETE from Empleados where nombre = "" or pais is null;
DELETE from Empleados where Sucursal = "" or pais is null;
DELETE from Empleados where sector = "" or pais is null;
DELETE from Empleados where cargo = "" or pais is null;

-- Propuesta 2) Imputar valores faltantes
UPDATE `Empleados` SET Apellido = 'Sin Dato' WHERE TRIM(apellido) = "" OR ISNULL(apellido);
UPDATE `Empleados` SET nombre = 'Sin Dato' WHERE TRIM(nombre) = "" OR ISNULL(nombre);
UPDATE `Empleados` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `Empleados` SET sector = 'Sin Dato' WHERE TRIM(sector) = "" OR ISNULL(sector);
UPDATE `Empleados` SET cargo = 'Sin Dato' WHERE TRIM(cargo) = "" OR ISNULL(cargo);

SELECT * from Clientes;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
       SUM(CASE WHEN IdCliente="" or IdCliente = 0 or IdCliente IS NULL THEN 1 ELSE 0 END) as Nulos_id,
       sum(CASE WHEN provincia="" or provincia IS NULL THEN 1 ELSE 0 END) as Nulos_provincia,
       sum(CASE WHEN NombreApellido="" or NombreApellido IS NULL THEN 1 ELSE 0 END) as Nulos_nombre_apellido,
       sum(CASE WHEN Domicilio="" or Domicilio IS NULL THEN 1 ELSE 0 END) as Nulos_domicilio,
       sum(CASE WHEN Telefono="" or Telefono IS NULL THEN 1 ELSE 0 END) as Nulos_telefono,
       sum(CASE WHEN Edad="" or Edad = 0 or Edad IS NULL THEN 1 ELSE 0 END) as Nulos_edad,
       sum(CASE WHEN Localidad = "" or Localidad IS NULL THEN 1 ELSE 0 END) as Nulos_localidad,
       sum(CASE WHEN Latitud="" or Latitud IS NULL THEN 1 ELSE 0 END) as Nulos_Latitud,
       sum(CASE WHEN Longitud="" or Longitud IS NULL THEN 1 ELSE 0 END) as Nulos_Longitud,
       sum(CASE WHEN trim(FechaAlta)="" or FechaAlta IS NULL THEN 1 ELSE 0 END) as Nulos_fecha_alta,
       sum(CASE WHEN UsuarioAlta="" or UsuarioAlta IS NULL THEN 1 ELSE 0 END) as Nulos_usuario_alta,
       sum(CASE WHEN trim(FechaUltimaModificacion)="" or FechaUltimaModificacion IS NULL THEN 1 ELSE 0 END) as Nulos_fecha_ultima_modificacion,
       sum(CASE WHEN UsuarioUltimaModificacion="" or UsuarioUltimaModificacion IS NULL THEN 1 ELSE 0 END) as Nulos_usuario_ultima_modificacion,
       sum(CASE WHEN MarcaBaja="" or MarcaBaja IS NULL THEN 1 ELSE 0 END) as Nulos_marca_baja
FROM Clientes;
-- Propuesta 1) Borrar los valores nulos
DELETE from Clientes where provincia="" or provincia is null;
DELETE from Clientes where NombreApellido="" or NombreApellido is null;
DELETE from Clientes where Domicilio="" or Domicilio is null;
DELETE from Clientes where Telefono="" or Telefono is null;
DELETE from Clientes where Localidad = "" or Localidad is null;
DELETE from Clientes where X = "" or X is null;
DELETE from Clientes where Y = "" or Y is null;

-- Propuesta 2) Imputar valores faltantes
UPDATE `Clientes` SET provincia = 'Sin Dato' WHERE TRIM(provincia) = "" OR ISNULL(provincia);
UPDATE `Clientes` SET NombreApellido = 'Sin Dato' WHERE TRIM(NombreApellido) = "" OR ISNULL(NombreApellido);
UPDATE `Clientes` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `Clientes` SET Telefono = 'Sin Dato' WHERE TRIM(Telefono) = "" OR ISNULL(Telefono);
UPDATE `Clientes` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);


SELECT * from Ventas;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN IdVenta="" or IdVenta=0 or IdVenta is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN trim(Fecha)="" or Fecha is null THEN 1 ELSE 0 END) as Nulos_Fecha,
    SUM(CASE WHEN trim(FechaEntrega)="" or FechaEntrega is null THEN 1 ELSE 0 END) as Nulos_Fecha_Entrega,
    SUM(CASE WHEN IdCanal="" or IdCanal=0 or IdCanal is null THEN 1 ELSE 0 END) as Nulos_IdCanal,
    SUM(CASE WHEN IdCliente="" or IdCliente=0 or IdCliente is null THEN 1 ELSE 0 END) as Nulos_IdCliente,
    SUM(CASE WHEN IdSucursal="" or IdSucursal=0 or IdSucursal is null THEN 1 ELSE 0 END) as Nulos_IdSucursal,
    SUM(CASE WHEN IdEmpleado="" or IdEmpleado=0 or IdEmpleado is null THEN 1 ELSE 0 END) as Nulos_IdEmpleado,
    SUM(CASE WHEN IdProducto="" or IdProducto=0 or IdProducto is null THEN 1 ELSE 0 END) as Nulos_IdProducto,
    SUM(CASE WHEN Precio="" or Precio is null THEN 1 ELSE 0 END) as Nulos_Precio,
    SUM(CASE WHEN Cantidad="" or Cantidad is null THEN 1 ELSE 0 END) as Nulos_Cantidad
FROM Ventas;
-- Propuesta 1) Borrar los valores nulos
DELETE from Ventas where Precio = "" or Precio = 0 or Precio is null;
DELETE from Ventas where Cantidad = "" or Cantidad = 0 or Cantidad is null;

-- Propuesta 2) Imputar valores faltantes
UPDATE `Ventas` SET Precio = 'Sin Dato' WHERE TRIM(Precio) = "" OR ISNULL(Precio);
UPDATE `Ventas` SET Cantidad = 'Sin Dato' WHERE TRIM(Cantidad) = "" OR ISNULL(Cantidad);


-- 3) Modificar a letra capital los campos que contengan descripciones para todas las tablas.
-- para esto vamos a utilizar la función que creamos en el archivo Función letra capital
-- que esta en la carpeta de herramientas
SELECT * from Clientes; 
UPDATE Clientes SET  Domicilio = UC_Words(TRIM(Domicilio)),   --aplicamos la función a los campos necesarios
                    NombreApellido = UC_Words(TRIM(NombreApellido));

SELECT * from Sucursales;
UPDATE Sucursales SET direccion = UC_Words(TRIM(direccion)), --aplicamos la función a los campos necesarios
                    sucursal = UC_Words(TRIM(sucursal));

SELECT * from Proveedores;
UPDATE Proveedores SET nombre = UC_Words(TRIM(nombre)), --aplicamos la función a los campos necesarios
                    Domicilio = UC_Words(TRIM(Domicilio));
SELECT * from Productos;
UPDATE Productos SET Concepto = UC_Words(TRIM(Concepto)); --aplicamos la función a los campos necesarios
SELECT * from Empleados;					
UPDATE Empleados SET nombre = UC_Words(TRIM(nombre)), --aplicamos la función a los campos necesarios
                    apellido = UC_Words(TRIM(apellido));



-- 4) Chequear la consistencia de los campos Precio y cantidad de la tabla ventas




-- 5) Chequear que no haya claves duplicadas, y de encontrarla en alguna de las tablas, proponer una solución.
