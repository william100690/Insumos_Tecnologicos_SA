use Insumos_Tecnologicos_SA;

-- 1) ¿Qué tan actualizada está la información? 
-- Seleccionamos las tablas que muestran fechas
SELECT * FROM clientes; -- para esta tabla observamos que se repite la fehca 2015-01-01
SELECT * from compra;-- para esta tabla observmaos que se repite la fecha 2015-01-30 
SELECT * from gasto;-- para esta tabla observmaos que se repite la fecha 2015-01-01 
SELECT * from venta; -- para esta tabla observamos que la fecha mas reciente es del 2019

-- 2) ¿Los datos están completos en todas las tablas?
SELECT * from clientes;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
       SUM(CASE WHEN id="" or id = 0 or id IS NULL THEN 1 ELSE 0 END) as Nulos_id,
       sum(CASE WHEN provincia="" or id = 0 or provincia IS NULL THEN 1 ELSE 0 END) as Nulos_provincia,
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
FROM clientes;


SELECT * from compra;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
    sum(CASE WHEN id="" or id = 0 or id IS NULL THEN 1 ELSE 0 END) as Nulos_id,
    sum(CASE WHEN trim(Fecha)="" or Fecha IS NULL THEN 1 ELSE 0 END) as Nulos_Fecha,
    sum(CASE WHEN IdProducto="" or IdProducto= 0 or IdProducto IS NULL THEN 1 ELSE 0 END) as Nulos_IdProducto,
    sum(CASE WHEN Cantidad="" or Cantidad = 0 or Cantidad IS NULL THEN 1 ELSE 0 END) as Nulos_Cantidad,
    sum(CASE WHEN Precio="" or Precio = 0 or Precio IS NULL THEN 1 ELSE 0 END) as Nulos_Precio,
    sum(CASE WHEN IdProveedor="" or IdProveedor = 0 or IdProveedor IS NULL THEN 1 ELSE 0 END) as Nulos_IdProveedor
FROM compra;


SELECT * from empleado;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
    sum(CASE WHEN id="" or id = 0 or id IS NULL THEN 1 ELSE 0 END) as Nulos_id,
    sum(CASE WHEN apellido="" or id = 0 or apellido IS NULL THEN 1 ELSE 0 END) as Nulos_apellido,
    sum(CASE WHEN nombre="" or nombre IS NULL THEN 1 ELSE 0 END) as Nulos_nombre,
    sum(CASE WHEN sucursal="" or sucursal IS NULL THEN 1 ELSE 0 END) as Nulos_sucursal,
    sum(CASE WHEN sector="" or sector IS NULL THEN 1 ELSE 0 END) as Nulos_sector,
    sum(CASE WHEN cargo="" or cargo IS NULL THEN 1 ELSE 0 END) as Nulos_cargo,
    sum(CASE WHEN salario="" or salario IS NULL THEN 1 ELSE 0 END) as Nulos_salario
FROM empleado;


SELECT * from gasto;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
        sum(CASE WHEN IdGasto="" or IdGasto = 0 or IdGasto IS NULL THEN 1 ELSE 0 END) as Nulos_IdGasto,
        sum(CASE WHEN IdSucursal="" or IdSucursal = 0 or IdSucursal IS NULL THEN 1 ELSE 0 END) as Nulos_IdSucursal,
        sum(CASE WHEN IdTipoGasto="" or IdTipoGasto = 0 or IdTipoGasto IS NULL THEN 1 ELSE 0 END) as Nulos_IdTipoGasto,
        sum(CASE WHEN trim(Fecha)="" or Fecha IS NULL THEN 1 ELSE 0 END) as Nulos_Fecha,
        sum(CASE WHEN Monto="" or Monto = 0 or Monto IS NULL THEN 1 ELSE 0 END) as Nulos_Monto
FROM gasto;


SELECT * FROM productos;
SELECT COUNT(*) as Total_datos,
       SUM(CASE WHEN id="" or id = 0 or id is null THEN 1 ELSE 0 END) as Nulos_id,
       SUM(CASE WHEN concepto="" or concepto is null THEN 1 ELSE 0 END) as Nulos_Conceto,
       SUM(CASE WHEN tipo="" or tipo is null THEN 1 ELSE 0 END) as Nulos_tipo,
       SUM(CASE WHEN precio="" or precio = 0 or precio is null THEN 1 ELSE 0 END) as Nulos_precio
FROM productos;


SELECT * from proveedores;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN id="" or id=0 or id is null THEN 1 ELSE 0 END) as Nulos_idproveedor,
    SUM(CASE WHEN nombre="" or nombre is null THEN 1 ELSE 0 END) as Nulos_nombre,
    SUM(CASE WHEN domicilio="" or domicilio is null THEN 1 ELSE 0 END) as Nulos_domicilio,
    SUM(CASE WHEN ciudad="" or ciudad is null THEN 1 ELSE 0 END) as Nulos_ciudad,
    SUM(CASE WHEN provincia="" or provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN pais="" or pais is null THEN 1 ELSE 0 END) as Nulos_pais,
    SUM(CASE WHEN departamento="" or departamento is null THEN 1 ELSE 0 END) as Nulos_departamento
FROM proveedores;


SELECT * from sucursal;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN id="" or id = 0 or id is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN sucursal="" or sucursal is null THEN 1 ELSE 0 END) as Nulos_sucursal,
    SUM(CASE WHEN direccion="" or direccion is null THEN 1 ELSE 0 END) as Nulos_direccion,
    SUM(CASE WHEN localidad="" or localidad is null THEN 1 ELSE 0 END) as Nulos_localidad,
    SUM(CASE WHEN provincia="" or provincia is null THEN 1 ELSE 0 END) as Nulos_provincia,
    SUM(CASE WHEN latitud="" or latitud = 0 or latitud is null THEN 1 ELSE 0 END) as Nulos_latitud,
    SUM(CASE WHEN longitud="" or longitud = 0 or longitud is null THEN 1 ELSE 0 END) as Nulos_longitud
FROM sucursal;


SELECT * from tipo_gasto;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN id="" or id is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN descripcion="" or descripcion is null THEN 1 ELSE 0 END) as Nulos_descripcion,
    SUM(CASE WHEN monto_aproximado="" or monto_aproximado is null THEN 1 ELSE 0 END) as Nulos_monto_aproximado
FROM tipo_gasto;


SELECT * from venta;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN id="" or id=0 or id is null THEN 1 ELSE 0 END) as Nulos_id,
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

--3) ¿Se conocen las fuentes de los datos?
-- Las fuentes son las tablas de excel que nos facilitó el departamento de Marketing