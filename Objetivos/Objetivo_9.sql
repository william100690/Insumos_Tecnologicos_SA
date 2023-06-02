use insumos_tecnologicos_sa;

SELECT * from ventas;
SELECT * from canalesventas;

-- crear las vista para obtener cantidad de ventas por canal de ventas, por cada mes
CREATE VIEW Canal_ventas_1 as;
SELECT V.IdCanal, Cv.Canal, DATE_FORMAT(V.Fecha, '%Y-%m') Fecha, COUNT(V.IdVenta) Ventas 
FROM ventas V
join canalesventas Cv on V.IdCanal = Cv.IdCanalVenta
GROUP BY IdCanal, Cv.Canal, DATE_FORMAT(Fecha, '%Y-%m')
ORDER BY DATE_FORMAT(Fecha, '%Y-%m'), IdCanal;

-- crear las vista para obtener cantidad de ventas por Idcanal de ventas, por cada mes
CREATE VIEW Canal_ventas as;
SELECT V.IdCanal, DATE_FORMAT(V.Fecha, '%Y-%m') Fecha, COUNT(V.IdVenta) Ventas
FROM ventas V
GROUP BY IdCanal, DATE_FORMAT(Fecha, '%Y-%m')
ORDER BY DATE_FORMAT(Fecha, '%Y-%m'), IdCanal;

-- crear la vista para obtener el total de ventas por cada mes
Create View Canal_ventas_2 as;
SELECT Fecha, sum(Ventas) as Total_ventas from Canal_ventas
GROUP BY Fecha;


-- crear la tabla donde obtenemos la información de la relación de ventas por canal de ventas
-- al hacer join de las vistas anteriores
CREATE TABLE Relacion_canal_ventas as
SELECT Cv1.Canal, Cv1.Fecha, Cv1.Ventas, 
ROUND((Cv1.Ventas/Cv2.Total_ventas)*100,2) Porcentaje from Canal_ventas_1 Cv1
join Canal_ventas_2 Cv2 on Cv1.Fecha = Cv2.Fecha;

-- observamos al table recién creada
SELECT * from Relacion_canal_ventas;

-- cambiar el tipo de dato de la columna fecha del tipo varchar a tipo date
-- agregar una columna nueva del tipo date
ALTER TABLE Relacion_canal_ventas add Anio_mes DATE after Fecha; 

-- transformar los datos de la columna fecha de Str a Date y llenar la columna recien creada
UPDATE Relacion_canal_ventas set Anio_mes = STR_TO_DATE(concat(Fecha, '-01'), '%Y-%m-%d');

-- Borrar la columna fecha ya que esta en formato STR y no la necesitamos
ALTER TABLE Relacion_canal_ventas DROP COLUMN Fecha;