use insumos_tecnologicos_sa;


-- 1) Es necesario contar con una tabla de localidades del país y mejorar nuestros datos. 

-- Crear una tabla auxiliar que nos va ayudar con la normalización de Localidad y Provincia
DROP TABLE IF EXISTS aux_Localidad;
CREATE TABLE IF NOT EXISTS aux_Localidad (
	Localidad_Original	VARCHAR(80),
	Provincia_Original	VARCHAR(50),
	Localidad_Normalizada	VARCHAR(80),
	Provincia_Normalizada	VARCHAR(50),
	IdLocalidad			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- especificar motor de almacenamiento, especificar el conjunto de caracteres, especificar el orden de
-- clasificación de los datos

-- observar el Union entre las tablas Clientes, Sucursales y Proveedores
select * from Clientes;
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM Clientes where Localidad = 'Avellaneda'
UNION
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM Sucursales where Localidad = 'Avellaneda'
UNION
SELECT DISTINCT Ciudad, Provincia, Ciudad, Provincia, 0 FROM Proveedores where Ciudad = 'Avellaneda'
ORDER BY 2, 1;

-- Observar el Union All entre las tablas Clientes, Sucursales y Proveedores
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM Clientes where Localidad = 'Avellaneda'
UNION ALL
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM Sucursales where Localidad = 'Avellaneda'
UNION ALL
SELECT DISTINCT Ciudad, Provincia, Ciudad, Provincia, 0 FROM Proveedores where Ciudad = 'Avellaneda'
ORDER BY 2, 1;


-- insertar a la tabla auxiliar Localidad y Provincia (Borrando los duplicados) 
-- desde las tablas Clientes, Sucursales y Proveedores
INSERT INTO aux_Localidad (Localidad_Original, Provincia_Original, 
Localidad_Normalizada, Provincia_Normalizada, IdLocalidad)
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM Clientes
UNION
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM Sucursales
UNION
SELECT DISTINCT Ciudad, Provincia, Ciudad, Provincia, 0 FROM Proveedores
ORDER BY 2, 1;

SELECT * from Clientes ORDER BY(Localidad);

-- observar como quedó la tabla despues de los datos insertados
-- las columnas "Original" es como vienen los datos
-- mientras que las columnas "Normalizada" es donde los vamos a normalizar
SELECT * FROM aux_Localidad ORDER BY Provincia_Original;

-- hacer la modificación de la columna "Localidad_Normalizada" donde vamos a igualar/Normalizar
-- todas la variantes de Capital Federal
UPDATE `aux_Localidad` SET Localidad_Normalizada = 'Capital Federal'
WHERE Localidad_Original IN ('Boca De Atencion Monte Castro',
                            'Caba',
                            'Cap.   Federal',
                            'Cap. Fed.',
                            'Capfed',
                            'Capital',
                            'Capital Federal',
                            'Cdad De Buenos Aires',
                            'Ciudad De Buenos Aires');

-- hacer la modificación de la columna "Localidad_Normalizada" donde vamos a igualar/Normalizar
-- todas la variantes de Cordoba
UPDATE `aux_Localidad` SET Localidad_Normalizada = 'Córdoba'
WHERE Localidad_Original IN ('Coroba',
                            'Cordoba',
                            'CÃ³rdoba',
							'Cã³rdoba');


-- hacer la modificación de la columna "Localidad_Normalizada" para que solo la 1er letra sea letra capital
-- usaremos la función que creamos en el archivo Funcion_letra_capital
UPDATE aux_Localidad SET  Localidad_Normalizada = UC_Words(TRIM(Localidad_Normalizada));
                    


-- hacer la modificación de la columna "Provinicia_Normalizada" donde vamos a igualar/Normalizar
-- todas la variantes de Buenos Aires
UPDATE `aux_Localidad` SET Provincia_Normalizada = 'Buenos Aires'
WHERE Provincia_Original IN ('B. Aires',
                            'B.Aires',
                            'Bs As',
                            'Bs.As.',
                            'Buenos Aires',
                            'C Debuenos Aires',
                            'Caba',
                            'Ciudad De Buenos Aires',
                            'Pcia Bs As',
                            'Prov De Bs As.',
                            'Provincia De Buenos Aires');


-- hacer la modificación de la columna "Provinicia_Normalizada" donde vamos a igualar/Normalizar
-- todas la variantes de Córdoba
UPDATE `aux_Localidad` SET Provincia_Normalizada = 'Córdoba'
WHERE Provincia_Original IN ('Coroba',
                            'Cordoba',
                            'CÃ³rdoba',
							'Cã³rdoba');

-- hacer la modificación de la columna "Provinicia_Normalizada" donde vamos a igualar/Normalizar
-- todas la variantes de Entre Ríos
UPDATE `aux_Localidad` SET Provincia_Normalizada = 'Entre Ríos'
WHERE Provincia_Original IN ('Entre RÃ­os');


-- hacer la modificación de la columna "Provinicia_Normalizada" donde vamos a igualar/Normalizar
-- todas la variantes de Neuquén
UPDATE `aux_Localidad` SET Provincia_Normalizada = 'Neuquén'
WHERE Provincia_Original IN ('NeuquÃ©n');

-- hacer la modificación de la columna "Provinicia_Normalizada" donde vamos a igualar/Normalizar
-- todas la variantes de Tucumán
UPDATE `aux_Localidad` SET Provincia_Normalizada = 'Tucumán'
WHERE Provincia_Original IN ('TucumÃ¡n',
                            'TUCUMAN');


-- Crear las tablas Localidad y provinica
DROP TABLE IF EXISTS `Localidad`;
CREATE TABLE IF NOT EXISTS `Localidad` (
  `IdLocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `Localidad` varchar(80) NOT NULL,
  `Provincia` varchar(80) NOT NULL,
  `IdProvincia` int(11) NOT NULL,
  PRIMARY KEY (`IdLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `Provincia`;
CREATE TABLE IF NOT EXISTS `Provincia` (
  `IdProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `Provincia` varchar(50) NOT NULL,
  PRIMARY KEY (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



-- insertar los datos generados a cada una de las tablas desde la tabla auxiliar
INSERT INTO Localidad (Localidad, Provincia, IdProvincia)
SELECT	DISTINCT Localidad_Normalizada, Provincia_Normalizada, 0
FROM aux_Localidad
ORDER BY Provincia_Normalizada, Localidad_Normalizada;

INSERT INTO Provincia (Provincia)
SELECT DISTINCT Provincia_Normalizada
FROM aux_Localidad
ORDER BY Provincia_Normalizada;


-- Observar como quedaron las tablas Provincia y Localidad
SELECT * from Localidad;
SELECT * from Provincia;


-- observar como quedó la tabla aux_Localidad
SELECT * FROM aux_Localidad ORDER BY Provincia_Original;


-- cargar a la tabla localidad los Id´s de cada provincia mediente un join
UPDATE Localidad l JOIN Provincia p
	ON (l.Provincia = p.Provincia)
SET l.IdProvincia = p.IdProvincia;

-- observar como se cargaron Id´s en la columna IdProvincia de la tabla Localidad 
SELECT * from Localidad;

-- cargar a la tabla aux_localidad los Id´s desde la tabla localidad mediante un join
UPDATE aux_localidad a JOIN localidad l 
			ON (l.Localidad = a.Localidad_Normalizada
                AND a.Provincia_Normalizada = l.Provincia)
SET a.IdLocalidad = l.IdLocalidad;
-- Observar como se cargaron Id´s en la columna IdLocalidad de la tabla aux_localidad
select * from aux_localidad;

-- Agregar a las tablas Clientes, Proveedores y Sucursales una columna llamada IdLocalidad
ALTER TABLE `Clientes` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Localidad`;
ALTER TABLE `Proveedores` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Departamento`;
ALTER TABLE `Sucursales` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Provincia`;

-- cargar IdLocalidad a cada una de las tablas, en la columna recién creada
UPDATE Clientes c JOIN aux_localidad a
	ON (c.Provincia = a.Provincia_Original AND c.Localidad = a.Localidad_Original)
SET c.IdLocalidad = a.IdLocalidad;
UPDATE Clientes c JOIN aux_localidad a
	ON (c.Provincia = a.Provincia_Original AND c.Localidad = a.Localidad_Original)
SET c.IdProvincia = a.IdProvincia;

UPDATE Sucursales s JOIN aux_localidad a
	ON (s.Provincia = a.Provincia_Original AND s.Localidad = a.Localidad_Original)
SET s.IdLocalidad = a.IdLocalidad;

UPDATE Proveedores p JOIN aux_localidad a
	ON (p.Provincia = a.Provincia_Original AND p.Ciudad = a.Localidad_Original)
SET p.IdLocalidad = a.IdLocalidad;

-- observar como se agregó la columna IdLocalidad junto con los datos de cada localidad
select * from Clientes;
select * from Proveedores;
select * from Sucursales;

-- borar cada una de las columnas que ya no necesitamos en las tablas Clientes, Proveedores, Sucursales
-- y Localidad
ALTER TABLE `Clientes`
  DROP `Provincia`,
  DROP `Localidad`;
  
ALTER TABLE `Proveedores`
  DROP `Ciudad`,
  DROP `Provincia`,
  DROP `Pais`,
  DROP `Departamento`;
  
ALTER TABLE `Sucursales`
  DROP `Localidad`,
  DROP `Provincia`;
  
ALTER TABLE `Localidad`
  DROP `Provincia`;

  -- Obsercar como resultaron las tablas Clientes, Proveedores, Sucursales, Localidad y Provincia
SELECT * FROM `Clientes`;
SELECT * FROM `Proveedores`;
SELECT * FROM `Sucursales`;
SELECT * FROM `Localidad`;
SELECT * FROM `Provincia`;


-- Observar el total de clientes por Localidad
SELECT IdLocalidad, COUNT(IdLocalidad) as Total_Clientes from Clientes
GROUP BY IdLocalidad ORDER BY Total_Clientes DESC;


-- Observar el total de sucursales por Localidad, observamos que en la localida 207 hay 2 sucursales
-- pero esta localidad no esta dentro del Top 5 en clientes
SELECT IdLocalidad, COUNT(IdLocalidad) as Total_Sucursales from Sucursales
GROUP BY IdLocalidad ORDER BY Total_Sucursales DESC;

-- Observar el total de clientes que hay en la localidad 207, nos damos cuenta que no hay clientes
-- en esta Localidad
SELECT IdLocalidad, COUNT(IdLocalidad) as Total_Clientes from Clientes
WHERE IdLocalidad = 207 GROUP BY IdLocalidad;
SELECT * from Clientes WHERE IdLocalidad = 207;


-- hacer un Join para observar mejor la información
SELECT C.IdLocalidad, COUNT(C.IdLocalidad) as Total_Clientes, S.Total_Sucursales FROM Clientes C
JOIN (SELECT IdLocalidad, COUNT(IdLocalidad) as Total_Sucursales from Sucursales
GROUP BY IdLocalidad ORDER BY Total_Sucursales DESC) S on C.IdLocalidad = S.IdLocalidad
GROUP BY IdLocalidad ORDER BY Total_Clientes DESC;