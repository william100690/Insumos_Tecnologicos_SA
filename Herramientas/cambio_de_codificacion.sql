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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- especificar motor de almacenamiento, especificar el conjunto de caracteres, especificar el orden de
-- clasificación de los datos

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

-- observar como quedó la tabla despues de los datos insertados
-- las columnas "Original" es como vienen los datos
-- mientras que las columnas "Normalizada" es donde los vamos a normalizar
SHOW CREATE TABLE aux_Localidad;
SELECT * FROM aux_Localidad ORDER BY Provincia_Original;

ALTER TABLE aux_localidad CONVERT TO CHARACTER SET utf8;
UPDATE aux_localidad SET Localidad_Original = CONVERT(cast(Localidad_Original as BINARY) USING utf8) COLLATE utf8_general_ci;

ALTER TABLE aux_localidad CONVERT TO CHARACTER set utf8mb4 COLLATE utf8mb4_spanish_ci;
UPDATE aux_localidad SET Localidad_Original = CONVERT(cast(Localidad_Original as BINARY) USING utf8mb4) COLLATE utf8mb4_spanish_ci;

ALTER TABLE aux_localidad CONVERT TO CHARACTER set utf8mb4 COLLATE utf8mb4_unicode_ci;
UPDATE aux_localidad SET Localidad_Original = CONVERT(cast(Localidad_Original as BINARY) USING utf8mb4) COLLATE utf8mb4_unicode_ci;

ALTER TABLE aux_localidad CONVERT TO CHARACTER set utf8mb4 COLLATE utf8mb4_0900_ai_ci;
UPDATE aux_localidad SET Localidad_Original = CONVERT(cast(Localidad_Original as BINARY) USING utf8mb4) COLLATE utf8mb4_0900_ai_ci;

