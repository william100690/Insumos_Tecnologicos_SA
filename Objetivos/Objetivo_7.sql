-- hacer join de las tablas recien creadas para observar la utilidad_mes vs utilidad_promedio de las
-- sucursales 21 y 22 que pertenecen a la localidad 207/Mar del plata y crear una tabla
-- sucusal 1 que pertenece a la localida 55/Capital federal y crear una tabla
DROP TABLE if EXISTS Utilidad_VS_Utilidad_promedio_21;
CREATE TABLE Utilidad_VS_Utilidad_promedio_21 as;
SELECT Um.IdSucursal, S.Sucursal, CONCAT(Um.Mes, Um.Anio) as Mes_Anio, Um.Utilidad_mes, Up.Utilidad_promedio, 
(Utilidad_mes - Utilidad_promedio) as arriba
from Utilidad_mes Um
join Utilidad_promedio Up on Um.Anio = Up.Anio and Um.Mes = Up.Mes
join sucursales S on Um.IdSucursal = S.IdSucursal
where Um.IdSucursal = 21
ORDER BY (Um.IdSucursal);


DROP TABLE if EXISTS Utilidad_VS_Utilidad_promedio_22;
CREATE TABLE Utilidad_VS_Utilidad_promedio_22 as;
SELECT Um.IdSucursal, S.Sucursal, CONCAT(Um.Mes, Um.Anio) as Mes_Anio, Um.Utilidad_mes, Up.Utilidad_promedio, 
(Utilidad_mes - Utilidad_promedio) as arriba
from Utilidad_mes Um
join Utilidad_promedio Up on Um.Anio = Up.Anio and Um.Mes = Up.Mes
join sucursales S on Um.IdSucursal = S.IdSucursal
where Um.IdSucursal = 22
ORDER BY (Um.IdSucursal);


DROP TABLE if EXISTS Utilidad_VS_Utilidad_promedio_1;
CREATE TABLE Utilidad_VS_Utilidad_promedio_1 as;
SELECT Um.IdSucursal, S.Sucursal, CONCAT(Um.Mes, Um.Anio) as Mes_Anio, Um.Utilidad_mes, Up.Utilidad_promedio, 
(Utilidad_mes - Utilidad_promedio) as arriba
from Utilidad_mes Um
join Utilidad_promedio Up on Um.Anio = Up.Anio and Um.Mes = Up.Mes
join sucursales S on Um.IdSucursal = S.IdSucursal
where Um.IdSucursal = 1
ORDER BY (Um.IdSucursal);

SELECT * from utilidad_promedio;
SELECT * from utilidad_mes;