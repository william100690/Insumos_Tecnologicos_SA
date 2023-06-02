use insumos_tecnologicos_sa;

SELECT * from ventas;
SELECT * from canalesventas;

-- crear las vista para obtener cantidad de ventas y ventas separado por canal ventas
SELECT * from canal_ventas_1;
DROP VIEW Canal_ventas_1;
CREATE VIEW Canal_ventas_1 as;
SELECT V.IdCanal, Cv.Canal, DATE_FORMAT(V.Fecha, '%Y-%m') Fecha, COUNT(V.IdVenta) Cant_Ventas,
round(sum(V.Cantidad * V.Precio),2) Ventas 
FROM ventas V
join canalesventas Cv on V.IdCanal = Cv.IdCanalVenta
GROUP BY IdCanal, Cv.Canal, DATE_FORMAT(Fecha, '%Y-%m')
ORDER BY DATE_FORMAT(Fecha, '%Y-%m'), IdCanal;

-- crear la vista para obtener el total de cantidad ventas y total de ventas sumando los canales de ventas
SELECT * from Canal_ventas_2;
DROP VIEW Canal_ventas_2;
Create View Canal_ventas_2 as;
SELECT Fecha, sum(Cant_ventas) as Total_cant_ventas, ROUND(sum(Ventas),2) as Total_ventas from canal_ventas_1
GROUP BY Fecha;


-- crear la tabla donde obtenemos la información de la relación de ventas por canal de ventas
-- al hacer join de las vistas anteriores INGRESOS
SELECT * from Canal_ventas_2;
DROP TABLE Relacion_canal_ventas_ingresos;
CREATE TABLE Relacion_canal_ventas_ingresos as
SELECT Cv1.Canal, Cv1.Fecha, Cv1.Ventas,
ROUND((Cv1.Ventas/Cv2.Total_ventas)*100,2) Porcentaje, Cv2.Total_ventas from Canal_ventas_1 Cv1
join Canal_ventas_2 Cv2 on Cv1.Fecha = Cv2.Fecha;

-- observamos al table recién creada
SELECT * from Relacion_canal_ventas_ingresos;

-- cambiar el tipo de dato de la columna fecha del tipo varchar a tipo date
-- agregar una columna nueva del tipo date
ALTER TABLE Relacion_canal_ventas_ingresos add Anio_mes DATE after Fecha; 

-- transformar los datos de la columna fecha de Str a Date y llenar la columna recien creada
UPDATE Relacion_canal_ventas_ingresos set Anio_mes = STR_TO_DATE(concat(Fecha, '-01'), '%Y-%m-%d');

-- Borrar la columna fecha ya que esta en formato STR y no la necesitamos
ALTER TABLE Relacion_canal_ventas_ingresos DROP COLUMN Fecha;


--  INGRESOS crear la tabla donde obtenemos la información de la relación de ventas por canal de ventas
-- al hacer join de las vistas anteriores 
SELECT * from Canal_ventas_2;
DROP TABLE Relacion_canal_ventas_ingresos;
CREATE TABLE Relacion_canal_ventas_ingresos as
SELECT Cv1.Canal, Cv1.Fecha, Cv1.Ventas,
ROUND((Cv1.Ventas/Cv2.Total_ventas)*100,2) Porcentaje, Cv2.Total_ventas from Canal_ventas_1 Cv1
join Canal_ventas_2 Cv2 on Cv1.Fecha = Cv2.Fecha;

-- observamos al table recién creada
SELECT * from Relacion_canal_ventas_ingresos;

-- cambiar el tipo de dato de la columna fecha del tipo varchar a tipo date
-- agregar una columna nueva del tipo date
ALTER TABLE Relacion_canal_ventas_ingresos add Anio_mes DATE after Fecha; 

-- transformar los datos de la columna fecha de Str a Date y llenar la columna recien creada
UPDATE Relacion_canal_ventas_ingresos set Anio_mes = STR_TO_DATE(concat(Fecha, '-01'), '%Y-%m-%d');

-- Borrar la columna fecha ya que esta en formato STR y no la necesitamos
ALTER TABLE Relacion_canal_ventas_ingresos DROP COLUMN Fecha;


-- CANTIDAD crear la tabla donde obtenemos la información de la relación de ventas por canal de ventas
-- al hacer join de las vistas anteriores
SELECT * from Canal_ventas_2;
DROP TABLE Relacion_canal_ventas_cantidad;
CREATE TABLE Relacion_canal_ventas_cantidad as;
SELECT Cv1.Canal, Cv1.Fecha, Cv1.Cant_Ventas,
ROUND((Cv1.Cant_Ventas/Cv2.Total_cant_ventas)*100,2) Porcentaje, Cv2.Total_cant_ventas from Canal_ventas_1 Cv1
join Canal_ventas_2 Cv2 on Cv1.Fecha = Cv2.Fecha;

-- observamos al table recién creada
SELECT * from Relacion_canal_ventas_cantidad;

-- cambiar el tipo de dato de la columna fecha del tipo varchar a tipo date
-- agregar una columna nueva del tipo date
ALTER TABLE Relacion_canal_ventas_cantidad add Anio_mes DATE after Fecha; 

-- transformar los datos de la columna fecha de Str a Date y llenar la columna recien creada
UPDATE Relacion_canal_ventas_cantidad set Anio_mes = STR_TO_DATE(concat(Fecha, '-01'), '%Y-%m-%d');

-- Borrar la columna fecha ya que esta en formato STR y no la necesitamos
ALTER TABLE Relacion_canal_ventas_cantidad DROP COLUMN Fecha;