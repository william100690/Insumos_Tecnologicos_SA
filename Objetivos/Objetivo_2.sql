use Insumos_Tecnologicos_SA;

-- 1) ¿Qué tan actualizada está la información? 
-- Seleccionamos las tablas que muestran fechas
SELECT * FROM Clientes; -- para esta tabla observamos que se repite la fehca 2015-01-01
SELECT * from Compras;-- para esta tabla observmaos que se repite la fecha 2015-01-30 
SELECT * from Gastos;-- para esta tabla observmaos que se repite la fecha 2015-01-01 
SELECT * from Ventas; -- para esta tabla observamos que la fecha mas reciente es del 2019



-- 2) ¿Los datos están completos en todas las tablas?
SELECT * from Clientes;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
       SUM(CASE WHEN id="" or id = 0 or id IS NULL THEN 1 ELSE 0 END) as Nulos_id,
       sum(CASE WHEN Provincia="" or id = 0 or Provincia IS NULL THEN 1 ELSE 0 END) as Nulos_provincia,
       sum(CASE WHEN NombreApellido="" or NombreApellido IS NULL THEN 1 ELSE 0 END) as Nulos_nombre_apellido,
       sum(CASE WHEN Domicilio="" or Domicilio IS NULL THEN 1 ELSE 0 END) as Nulos_domicilio,
       sum(CASE WHEN Telefono="" or Telefono = 0 or Telefono IS NULL THEN 1 ELSE 0 END) as Nulos_telefono,
       sum(CASE WHEN Edad="" or Edad = 0 or Edad IS NULL THEN 1 ELSE 0 END) as Nulos_edad,
       sum(CASE WHEN Localidad = "" or Localidad IS NULL THEN 1 ELSE 0 END) as Nulos_localidad,
       sum(CASE WHEN X="" or X = 0 or X IS NULL THEN 1 ELSE 0 END) as Nulos_X,
       sum(CASE WHEN Y="" or Y = 0 or Y IS NULL THEN 1 ELSE 0 END) as Nulos_Y,
       sum(CASE WHEN trim(FechaAlta)="" or FechaAlta IS NULL THEN 1 ELSE 0 END) as Nulos_fecha_alta,
       sum(CASE WHEN UsuarioAlta="" or UsuarioAlta IS NULL THEN 1 ELSE 0 END) as Nulos_usuario_alta,
       sum(CASE WHEN trim(FechaUltimaModificacion)="" or FechaUltimaModificacion IS NULL THEN 1 ELSE 0 END) as Nulos_fecha_ultima_modificacion,
       sum(CASE WHEN UsuarioUltimaModificacion="" or UsuarioUltimaModificacion IS NULL THEN 1 ELSE 0 END) as Nulos_usuario_ultima_modificacion,
       sum(CASE WHEN MarcaBaja="" or MarcaBaja IS NULL THEN 1 ELSE 0 END) as Nulos_marca_baja
FROM Clientes;


SELECT * from Compras;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
    sum(CASE WHEN id="" or id = 0 or id IS NULL THEN 1 ELSE 0 END) as Nulos_id,
    sum(CASE WHEN trim(Fecha)="" or Fecha IS NULL THEN 1 ELSE 0 END) as Nulos_Fecha,
    sum(CASE WHEN IdProducto="" or IdProducto= 0 or IdProducto IS NULL THEN 1 ELSE 0 END) as Nulos_IdProducto,
    sum(CASE WHEN Cantidad="" or Cantidad = 0 or Cantidad IS NULL THEN 1 ELSE 0 END) as Nulos_Cantidad,
    sum(CASE WHEN Precio="" or Precio = 0 or Precio IS NULL THEN 1 ELSE 0 END) as Nulos_Precio,
    sum(CASE WHEN IdProveedor="" or IdProveedor = 0 or IdProveedor IS NULL THEN 1 ELSE 0 END) as Nulos_IdProveedor
FROM Compras;


SELECT * from Empleados;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
    sum(CASE WHEN id="" or id = 0 or id IS NULL THEN 1 ELSE 0 END) as Nulos_id,
    sum(CASE WHEN Apellido="" or id = 0 or Apellido IS NULL THEN 1 ELSE 0 END) as Nulos_apellido,
    sum(CASE WHEN Nombre="" or Nombre IS NULL THEN 1 ELSE 0 END) as Nulos_nombre,
    sum(CASE WHEN Sucursal="" or Sucursal IS NULL THEN 1 ELSE 0 END) as Nulos_sucursal,
    sum(CASE WHEN Sector="" or Sector IS NULL THEN 1 ELSE 0 END) as Nulos_sector,
    sum(CASE WHEN Cargo="" or Cargo IS NULL THEN 1 ELSE 0 END) as Nulos_cargo,
    sum(CASE WHEN Salario="" or Salario IS NULL THEN 1 ELSE 0 END) as Nulos_salario
FROM Empleados;


SELECT * from Gastos;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
        sum(CASE WHEN IdGasto="" or IdGasto = 0 or IdGasto IS NULL THEN 1 ELSE 0 END) as Nulos_IdGasto,
        sum(CASE WHEN IdSucursal="" or IdSucursal = 0 or IdSucursal IS NULL THEN 1 ELSE 0 END) as Nulos_IdSucursal,
        sum(CASE WHEN IdTipoGasto="" or IdTipoGasto = 0 or IdTipoGasto IS NULL THEN 1 ELSE 0 END) as Nulos_IdTipoGasto,
        sum(CASE WHEN trim(Fecha)="" or Fecha IS NULL THEN 1 ELSE 0 END) as Nulos_Fecha,
        sum(CASE WHEN Monto="" or Monto = 0 or Monto IS NULL THEN 1 ELSE 0 END) as Nulos_Monto
FROM Gastos;

SELECT * FROM Productos;
SELECT COUNT(*) as Total_datos,
       SUM(CASE WHEN id="" or id = 0 or id is null THEN 1 ELSE 0 END) as Nulos_id,
       SUM(CASE WHEN Concepto="" or Concepto is null THEN 1 ELSE 0 END) as Nulos_Conceto,
       SUM(CASE WHEN Tipo="" or Tipo is null THEN 1 ELSE 0 END) as Nulos_tipo,
       SUM(CASE WHEN Precio="" or Precio = 0 or Precio is null THEN 1 ELSE 0 END) as Nulos_precio
FROM Productos;


SELECT * from Proveedores;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN id="" or id=0 or id is null THEN 1 ELSE 0 END) as Nulos_idproveedor,
    SUM(CASE WHEN Nombre="" or Nombre is null THEN 1 ELSE 0 END) as Nulos_nombre,
    SUM(CASE WHEN Domicilio="" or Domicilio is null THEN 1 ELSE 0 END) as Nulos_domicilio,
    SUM(CASE WHEN Ciudad="" or Ciudad is null THEN 1 ELSE 0 END) as Nulos_ciudad,
    SUM(CASE WHEN Provincia="" or Provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN Pais="" or Pais is null THEN 1 ELSE 0 END) as Nulos_pais,
    SUM(CASE WHEN Departamento="" or Departamento is null THEN 1 ELSE 0 END) as Nulos_departamento
FROM Proveedores;


SELECT * from Sucursales;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN id="" or id = 0 or id is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN Sucursal="" or Sucursal is null THEN 1 ELSE 0 END) as Nulos_sucursal,
    SUM(CASE WHEN Direccion="" or Direccion is null THEN 1 ELSE 0 END) as Nulos_direccion,
    SUM(CASE WHEN Localidad="" or Localidad is null THEN 1 ELSE 0 END) as Nulos_localidad,
    SUM(CASE WHEN Provincia="" or Provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN Latitud="" or Latitud = 0 or Latitud is null THEN 1 ELSE 0 END) as Nulos_latitud,
    SUM(CASE WHEN Longitud="" or Longitud = 0 or Longitud is null THEN 1 ELSE 0 END) as Nulos_longitud
FROM Sucursales;


SELECT * from TiposGastos;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN id="" or id is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN Descripcion="" or Descripcion is null THEN 1 ELSE 0 END) as Nulos_descripcion,
    SUM(CASE WHEN MontoAproximado="" or MontoAproximado is null THEN 1 ELSE 0 END) as Nulos_monto_aproximado
FROM TiposGastos;


SELECT * from Ventas;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN id="" or id=0 or id is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN trim(Fecha)="" or Fecha is null THEN 1 ELSE 0 END) as Nulos_Fecha,
    SUM(CASE WHEN trim(FechaEntrega)="" or FechaEntrega is null THEN 1 ELSE 0 END) as Nulos_Fecha_Entrega,
    SUM(CASE WHEN IdCanal="" or IdCanal=0 or IdCanal is null THEN 1 ELSE 0 END) as Nulos_IdCanal,
    SUM(CASE WHEN IdCliente="" or IdCliente=0 or IdCliente is null THEN 1 ELSE 0 END) as Nulos_IdCliente,
    SUM(CASE WHEN IdSucursal="" or IdSucursal=0 or IdSucursal is null THEN 1 ELSE 0 END) as Nulos_IdSucursal,
    SUM(CASE WHEN IdEmpleado="" or IdEmpleado=0 or IdEmpleado is null THEN 1 ELSE 0 END) as Nulos_IdEmpleado,
    SUM(CASE WHEN IdProducto="" or IdProducto=0 or IdProducto is null THEN 1 ELSE 0 END) as Nulos_IdProducto,
    SUM(CASE WHEN Precio="" or Precio=0 or Precio=0 or Precio is null THEN 1 ELSE 0 END) as Nulos_Precio,
    SUM(CASE WHEN Cantidad="" or Cantidad=0 or Cantidad is null THEN 1 ELSE 0 END) as Nulos_Cantidad
FROM Ventas;



--3) ¿Se conocen las fuentes de los datos?
-- Las fuentes son las tablas de excel que nos facilitó el Departamento de Marketing



-- 4) Al integrar éstos datos, es prudente que haya una normalización respecto de nombrar las tablas y sus campos.
SELECT * from Compras; --observmaos que el campo se llama id, hay que cambiarlo por Idcompra

SELECT * from Ventas; --observmaos que el campo se llama id, hay que cambiarlo por IdVEnta

SELECT * from Sucursales; --observmaos que el campo se llama id, hay que cambiarlo por IdSucursal

SELECT * from Clientes; --observmaos que el campo se llama id, hay que cambiarlo por IdCliente

SELECT * from CanalesVentas; --observmaos que el campo se llama id, hay que cambiarlo por IdCanalVenta

SELECT * from TiposGastos; --observmaos que el campo se llama id, hay que cambiarlo por IdTiposGastos

SELECT * from Proveedores; --observmaos que el campo se llama id, hay que cambiarlo por IdProveedor

SELECT * from Productos; --observmaos que el campo se llama id, hay que cambiarlo por IdProducto

SELECT * from Empleados; --observmaos que el campo se llama id, hay que cambiarlo por IdEmpleado



--5) Es importante revisar la consistencia y Tipo de los datos

SELECT * from Clientes; --las columnas X y Y estan en Tipo varchar hay que cambiarlos a Tipo decimal
SELECT * from Empleados; --la columna Salario esta en varchar hay que cambiarla a Tipo decimal
SELECT * from Productos; --la columna Precio esta en varchar hay que cambiarla a Tipo decimal
SELECT * from Sucursales; --las columnas Latitud y Longitud estan en varchar cambiarla a Tipo decimal
SELECT * from Ventas; -- las columnas de Precio y Cantidad estan en varchar, hay que cambiarlas a decimal y entera



-- 6) Crear una nueva tabla llamada calendario y poblar esta tabla con el procedimiento creado en la carpeta herramientas
DROP TABLE IF EXISTS `calendario`;
CREATE TABLE calendario (
        id                      INTEGER PRIMARY KEY,  -- year*10000+month*100+day
        fecha                 	DATE NOT NULL,
        anio                    INTEGER NOT NULL,
        mes                   	INTEGER NOT NULL, -- 1 to 12
        dia                     INTEGER NOT NULL, -- 1 to 31
        trimestre               INTEGER NOT NULL, -- 1 to 4
        semana                  INTEGER NOT NULL, -- 1 to 52/53
        dia_nombre              VARCHAR(9) NOT NULL, -- 'Monday', 'Tuesday'...
        mes_nombre              VARCHAR(9) NOT NULL -- 'January', 'February'...
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

ALTER TABLE `calendario` CHANGE `id` `IdFecha` INT(11) NOT NULL;
ALTER TABLE `calendario` ADD UNIQUE(`fecha`);

SELECT * from calendario; -- revisamos la creación de la tabla

CALL Llenar_dimension_calendario('2015-01-01','2021-01-01'); --poblamos la tabla con el procedimiento
SELECT * FROM calendario; -- revisamos la tabla con los datos cargados