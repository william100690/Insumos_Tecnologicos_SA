use insumos_tecnologicos_sa;

SELECT * from ventas;
-- Obtener las 2 sucursales que pertenecen a la localidad 207/ Mar del Plata
SELECT * from sucursales where IdLocalidad = 207;
-- Id 21 y 22

-- Obtener las 2 sucursales que pertenecen a la localidad 443/ Mendoza
SELECT * from sucursales where IdLocalidad = 443;
-- Id 29 y 30

SELECT * from sucursales where IdLocalidad = 55;
-- Id 1,2,3,4,5,6,7,8,9,10


-- obtener el total de utilidad por mes, de cada sucursal y crear una tabla
SELECT * FROM gastos;
Drop table if EXISTS Utilidad_mes;
create table Utilidad_mes as;
SELECT V.IdSucursal, year(V.Fecha) Anio, MONTH(V.Fecha) Mes, ROUND(sum(V.Precio * V.Cantidad),2) as Ventas, 
sum(G.Monto) as Gasto, ROUND(ROUND(sum(V.Precio * V.Cantidad),2) -  sum(G.Monto),2) as Utilidad_mes from ventas V
JOIN gastos G on V.IdSucursal = G.IdSucursal
GROUP BY(IdSucursal), year(Fecha), MONTH(Fecha)
ORDER BY(IdSucursal), (year(Fecha));


-- obtener el promedio de utilidad de todas las sucursales, por mes y crear una tabla
DROP TABLE if EXISTS Utilidad_promedio;
CREATE table Utilidad_promedio as;
SELECT year(V.Fecha) Anio, MONTH(V.Fecha) Mes, 
ROUND(ROUND((sum(V.Precio * V.Cantidad))/31,2) -  (sum(G.Monto))/31,2) as Utilidad_promedio from ventas V
JOIN gastos G on V.IdSucursal = G.IdSucursal
GROUP BY year(Fecha), MONTH(Fecha)
ORDER BY (year(Fecha));



-- hacer join de las tablas recien creadas para observar la utilidad_mes
-- sucursales 21 y 22 que pertenecen a la localidad 207/Mar del plata y crear una tabla
-- sucusal 1 que pertenece a la localida 55/Capital federal y crear una tabla
DROP TABLE if EXISTS Utilidad_mes_21;
CREATE TABLE Utilidad_mes_21 as
SELECT Um.IdSucursal, S.Sucursal, Um.Mes, Um.Anio, Um.Utilidad_mes
from Utilidad_mes Um
join Utilidad_promedio Up on Um.Anio = Up.Anio and Um.Mes = Up.Mes
join sucursales S on Um.IdSucursal = S.IdSucursal
where Um.IdSucursal = 21
ORDER BY (Um.IdSucursal);

DROP TABLE if EXISTS Utilidad_mes_22;
CREATE TABLE Utilidad_mes_22 as
SELECT Um.IdSucursal, S.Sucursal, Um.Mes, Um.Anio, Um.Utilidad_mes
from Utilidad_mes Um
join Utilidad_promedio Up on Um.Anio = Up.Anio and Um.Mes = Up.Mes
join sucursales S on Um.IdSucursal = S.IdSucursal
where Um.IdSucursal = 22
ORDER BY (Um.IdSucursal);

DROP TABLE if EXISTS Utilidad_mes_1;
CREATE TABLE Utilidad_mes_1 as
SELECT Um.IdSucursal, S.Sucursal, Um.Mes, Um.Anio, Um.Utilidad_mes
from Utilidad_mes Um
join Utilidad_promedio Up on Um.Anio = Up.Anio and Um.Mes = Up.Mes
join sucursales S on Um.IdSucursal = S.IdSucursal
where Um.IdSucursal = 1
ORDER BY (Um.IdSucursal);