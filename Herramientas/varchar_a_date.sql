use insumos_tecnologicos_sa;

SET GLOBAL log_bin_trust_function_creators = 1;

-- cambiar el tipo de dato de la columna fecha del tipo varchar a tipo date
-- agregar una columna nueva del tipo date
ALTER TABLE Relacion_canal_ventas_ingresos add Anio_mes DATE after Fecha; 

-- transformar los datos de la columna fecha de Str a Date y llenar la columna recien creada
UPDATE Relacion_canal_ventas_ingresos set Anio_mes = STR_TO_DATE(concat(Fecha, '-01'), '%Y-%m-%d');

-- Borrar la columna fecha ya que esta en formato STR y no la necesitamos
ALTER TABLE Relacion_canal_ventas_ingresos DROP COLUMN Fecha;



CREATE Function varchar_a_date(Fecha VARCHAR(7))
RETURNS DATE
BEGIN
    CONCAT(Fecha, '-01');
    DECLARE Fecha_date DATE;
    set Fecha_date = STR_TO_DATE(Feha);
    RETURN Fecha_date;
END;

CREATE Function varchar_a_varchar(Fecha VARCHAR(7))
RETURNS VARCHAR(9)
BEGIN
    DECLARE Fecha_date VARCHAR(9);
    SET Fecha_date = CONCAT(Fecha, "-01");
    RETURN Fecha_date;
END;