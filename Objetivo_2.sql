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


SELECT * from compra;
SELECT COUNT(*) as Total_datos,  -- observamos los datos faltantes
    sum(CASE WHEN trim(idCompra)="" or idCompra IS NULL THEN 1 ELSE 0 END) as Nulos_idCompra,
    sum(CASE WHEN trim(Fecha)="" or Fecha IS NULL THEN 1 ELSE 0 END) as Nulos_Fecha,
    sum(CASE WHEN trim(IdProducto)="" or IdProducto IS NULL THEN 1 ELSE 0 END) as Nulos_IdProducto,
    sum(CASE WHEN trim(Cantidad)="" or Cantidad IS NULL THEN 1 ELSE 0 END) as Nulos_Cantidad,
    sum(CASE WHEN trim(Precio)="" or Precio IS NULL THEN 1 ELSE 0 END) as Nulos_Precio,
    sum(CASE WHEN trim(IdProveedor)="" or IdProveedor IS NULL THEN 1 ELSE 0 END) as Nulos_IdProveedor
FROM compra;

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


SELECT * from gasto;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
        sum(CASE WHEN trim(idGasto)="" or idGasto IS NULL THEN 1 ELSE 0 END) as Nulos_idGasto,
        sum(CASE WHEN trim(idSucursal)="" or idSucursal IS NULL THEN 1 ELSE 0 END) as Nulos_idSucursal,
        sum(CASE WHEN trim(idTipoGasto)="" or idTipoGasto IS NULL THEN 1 ELSE 0 END) as Nulos_idTipoGasto,
        sum(CASE WHEN trim(fecha)="" or fecha IS NULL THEN 1 ELSE 0 END) as Nulos_fecha,
        sum(CASE WHEN trim(monto)="" or monto IS NULL THEN 1 ELSE 0 END) as Nulos_monto
FROM gasto;


SELECT * FROM productos;
SELECT COUNT(*) as Total_datos,
       SUM(CASE WHEN trim(idproducto)="" or idproducto is null THEN 1 ELSE 0 END) as Nulos_Id,
       SUM(CASE WHEN trim(concepto)="" or concepto is null THEN 1 ELSE 0 END) as Nulos_Conceto,
       SUM(CASE WHEN trim(tipo)="" or tipo is null THEN 1 ELSE 0 END) as Nulos_tipo,
       SUM(CASE WHEN trim(precio)="" or precio is null THEN 1 ELSE 0 END) as Nulos_precio
FROM productos;


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


SELECT * from tipo_gasto;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN trim(idtipogasto)="" or idtipogasto is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN trim(descripcion)="" or descripcion is null THEN 1 ELSE 0 END) as Nulos_descripcion,
    SUM(CASE WHEN trim(monto_aproximado)="" or monto_aproximado is null THEN 1 ELSE 0 END) as Nulos_monto_aproximado
FROM tipo_gasto;


SELECT * from venta;
SELECT COUNT(*) as total_datos,  -- observamos los datos faltantes
    SUM(CASE WHEN trim(idVenta)="" or idVenta is null THEN 1 ELSE 0 END) as Nulos_id,
    SUM(CASE WHEN trim(Fecha)="" or Fecha is null THEN 1 ELSE 0 END) as Nulos_Fecha,
    SUM(CASE WHEN trim(Fecha_Entrega)="" or Fecha_Entrega is null THEN 1 ELSE 0 END) as Nulos_Fecha_Entrega,
    SUM(CASE WHEN trim(IdCanal)="" or IdCanal is null THEN 1 ELSE 0 END) as Nulos_IdCanal,
    SUM(CASE WHEN trim(IdCliente)="" or IdCliente is null THEN 1 ELSE 0 END) as Nulos_IdCliente,
    SUM(CASE WHEN trim(IdSucursal)="" or IdSucursal is null THEN 1 ELSE 0 END) as Nulos_IdSucursal,
    SUM(CASE WHEN trim(IdEmpleado)="" or IdEmpleado is null THEN 1 ELSE 0 END) as Nulos_IdEmpleado,
    SUM(CASE WHEN trim(IdProducto)="" or IdProducto is null THEN 1 ELSE 0 END) as Nulos_IdProducto,
    SUM(CASE WHEN trim(Precio)="" or Precio is null THEN 1 ELSE 0 END) as Nulos_Precio,
    SUM(CASE WHEN trim(Cantidad)="" or Cantidad is null THEN 1 ELSE 0 END) as Nulos_Cantidad
FROM venta;
