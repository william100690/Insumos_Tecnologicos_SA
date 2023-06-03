use insumos_tecnologicos_sa;

-- obtener la relación de cantidad de ventas por canal de ventas para la sucursal Id 1 y hacer una tabla
SELECT * from Relacion_canal_ventas_1;
drop TABLE Relacion_canal_ventas_1;
CREATE table Relacion_canal_ventas_1
SELECT V.IdCanal, Cv.Canal, DATE_FORMAT(V.Fecha, '%Y-%m') Fecha, COUNT(V.IdVenta) Cant_Ventas,
round(sum(V.Cantidad * V.Precio),2) Ventas 
FROM ventas V
join canalesventas Cv on V.IdCanal = Cv.IdCanalVenta
WHERE IdSucursal = 1
GROUP BY IdCanal, Cv.Canal, DATE_FORMAT(Fecha, '%Y-%m')
ORDER BY DATE_FORMAT(Fecha, '%Y-%m'), IdCanal;

-- observamos al table recién creada
SELECT * from Relacion_canal_ventas_1;

-- cambiar el tipo de dato de la columna fecha del tipo varchar a tipo date
-- agregar una columna nueva del tipo date
ALTER TABLE Relacion_canal_ventas_1 add Anio_mes DATE after Fecha; 

-- transformar los datos de la columna fecha de Str a Date y llenar la columna recien creada
UPDATE Relacion_canal_ventas_1 set Anio_mes = STR_TO_DATE(concat(Fecha, '-01'), '%Y-%m-%d');

-- Borrar la columna fecha ya que esta en formato STR y no la necesitamos
ALTER TABLE Relacion_canal_ventas_1 DROP COLUMN Fecha;

-- Crear la vista para obtener la relación total de ventas para la sucursal 1
SELECT * from Relacion_total_canal_ventas_1;
DROP VIEW Relacion_total_canal_ventas_1;
CREATE VIEW Relacion_total_canal_ventas_1 as
SELECT Anio_mes, sum(Cant_ventas) as Total_cant_ventas, ROUND(sum(Ventas),2) as Total_ventas 
from Relacion_canal_ventas_1
GROUP BY Anio_mes;
-- Crear la vista para obtener la relación indiviudal por canal de ventas VS total de cantiada de ventas
SELECT * from Cantidad_Ventas_VS_Total_cant_ventas_1;
DROP VIEW Cantidad_Ventas_VS_Total_cant_ventas_1;
CREATE VIEW Cantidad_Ventas_VS_Total_cant_ventas_1 as
SELECT R.Canal, R.Anio_mes, R.Cant_Ventas, Rt.Total_cant_ventas from Relacion_canal_ventas_1 R
join Relacion_total_canal_ventas_1 Rt on R.Anio_mes = Rt.Anio_mes;




-- obtener la relación de cantidad de ventas por canal de ventas para la sucursal Id 1 y hacer una tabla
SELECT * from Relacion_canal_ventas_21;
drop TABLE Relacion_canal_ventas_21;
CREATE table Relacion_canal_ventas_21
SELECT V.IdCanal, Cv.Canal, DATE_FORMAT(V.Fecha, '%Y-%m') Fecha, COUNT(V.IdVenta) Cant_Ventas,
round(sum(V.Cantidad * V.Precio),2) Ventas 
FROM ventas V
join canalesventas Cv on V.IdCanal = Cv.IdCanalVenta
WHERE IdSucursal = 21
GROUP BY IdCanal, Cv.Canal, DATE_FORMAT(Fecha, '%Y-%m')
ORDER BY DATE_FORMAT(Fecha, '%Y-%m'), IdCanal;

-- observamos al table recién creada
SELECT * from Relacion_canal_ventas_21;

-- cambiar el tipo de dato de la columna fecha del tipo varchar a tipo date
-- agregar una columna nueva del tipo date
ALTER TABLE Relacion_canal_ventas_21 add Anio_mes DATE after Fecha; 

-- transformar los datos de la columna fecha de Str a Date y llenar la columna recien creada
UPDATE Relacion_canal_ventas_21 set Anio_mes = STR_TO_DATE(concat(Fecha, '-01'), '%Y-%m-%d');

-- Borrar la columna fecha ya que esta en formato STR y no la necesitamos
ALTER TABLE Relacion_canal_ventas_21 DROP COLUMN Fecha;

-- Crear la vista para obtener la relación total de ventas para la sucursal 1
SELECT * from Relacion_total_canal_ventas_21;
DROP VIEW Relacion_total_canal_ventas_21;
CREATE VIEW Relacion_total_canal_ventas_21 as
SELECT Anio_mes, sum(Cant_ventas) as Total_cant_ventas, ROUND(sum(Ventas),2) as Total_ventas 
from Relacion_canal_ventas_21
GROUP BY Anio_mes;
-- Crear la vista para obtener la relación indiviudal por canal de ventas VS total de cantiada de ventas
SELECT * from Cantidad_Ventas_VS_Total_cant_ventas_21;
DROP VIEW Cantidad_Ventas_VS_Total_cant_ventas_21;
CREATE VIEW Cantidad_Ventas_VS_Total_cant_ventas_21 as
SELECT R.Canal, R.Anio_mes, R.Cant_Ventas, Rt.Total_cant_ventas from Relacion_canal_ventas_21 R
join Relacion_total_canal_ventas_21 Rt on R.Anio_mes = Rt.Anio_mes;




-- obtener la relación de cantidad de ventas por canal de ventas para la sucursal Id 1 y hacer una tabla
SELECT * from Relacion_canal_ventas_22;
drop TABLE Relacion_canal_ventas_22;
CREATE table Relacion_canal_ventas_22
SELECT V.IdCanal, Cv.Canal, DATE_FORMAT(V.Fecha, '%Y-%m') Fecha, COUNT(V.IdVenta) Cant_Ventas,
round(sum(V.Cantidad * V.Precio),2) Ventas 
FROM ventas V
join canalesventas Cv on V.IdCanal = Cv.IdCanalVenta
WHERE IdSucursal = 22
GROUP BY IdCanal, Cv.Canal, DATE_FORMAT(Fecha, '%Y-%m')
ORDER BY DATE_FORMAT(Fecha, '%Y-%m'), IdCanal;

-- observamos al table recién creada
SELECT * from Relacion_canal_ventas_22;

-- cambiar el tipo de dato de la columna fecha del tipo varchar a tipo date
-- agregar una columna nueva del tipo date
ALTER TABLE Relacion_canal_ventas_22 add Anio_mes DATE after Fecha; 

-- transformar los datos de la columna fecha de Str a Date y llenar la columna recien creada
UPDATE Relacion_canal_ventas_22 set Anio_mes = STR_TO_DATE(concat(Fecha, '-01'), '%Y-%m-%d');

-- Borrar la columna fecha ya que esta en formato STR y no la necesitamos
ALTER TABLE Relacion_canal_ventas_22 DROP COLUMN Fecha;

-- Crear la vista para obtener la relación total de ventas para la sucursal 1
SELECT * from Relacion_total_canal_ventas_22;
DROP VIEW Relacion_total_canal_ventas_22;
CREATE VIEW Relacion_total_canal_ventas_22 as
SELECT Anio_mes, sum(Cant_ventas) as Total_cant_ventas, ROUND(sum(Ventas),2) as Total_ventas 
from Relacion_canal_ventas_22
GROUP BY Anio_mes;
-- Crear la vista para obtener la relación indiviudal por canal de ventas VS total de cantiada de ventas
SELECT * from Cantidad_Ventas_VS_Total_cant_ventas_22;
DROP VIEW Cantidad_Ventas_VS_Total_cant_ventas_22;
CREATE VIEW Cantidad_Ventas_VS_Total_cant_ventas_22 as
SELECT R.Canal, R.Anio_mes, R.Cant_Ventas, Rt.Total_cant_ventas from Relacion_canal_ventas_22 R
join Relacion_total_canal_ventas_22 Rt on R.Anio_mes = Rt.Anio_mes;