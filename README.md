# Insumos_Tecnologicos_SA
## Objetivo principal: Analizar la factibilidad de abrir una nueva sucursal

Para este proyecto seras el especialista en datos de una compañía que se dedica a la venta de insumos tecnológicos. 
El trabajo consiste en extraer la información de Excel, que generan los diferentes departamentos, para la creación de la base de datos de la empresa (ETL). A lo largo del proyecto te harás cargo de la información de la empresa y realizaras el proceso completo de captura, limpieza, análisis, diagnóstico, documentación, explotación y publicación de resultados.  


## Objetivo 1 Creación de base de datos e ingesta de datos
Solicitar a las diferente areas de la empresa las siguientes tablas con el fin de que sean integradas en SQL. Es necesario realizar la captura de esos archivos e ingestarlos dentro de nuestra base de datos.

* La tabla de puntos de venta propios, un Excel frecuentemente utilizado para contactar a cada sucursal, actualizada en 2021.
* La tabla de empleados, un Excel mantenido por el personal administrativo de RRHH.
* La tabla de proveedores, un Excel mantenido por un analista de otra dirección que ya no esta en la empresa. 
* La tabla de clientes, alojada en el CRM de la empresa.
* La tabla de productos, un Excel mantenido por otro analista.
* Las tablas de ventas, gastos y compras, tres archivos CSV generados a partir del sistema transaccional de la empresa.


## Objetivo 2 EDA (Exploratory Data Analysis)
Con el fín de asegurarse de que la calidad de la información con la que se va a trabajar sea la óptima, es necesario tomar en cuenta los siguientes puntos:

1) ¿Qué tan actualizada está la información? 
2) ¿Los datos están completos en todas las tablas?
3) ¿Se conocen las fuentes de los datos?
4) Al integrar éstos datos, es prudente que haya una normalización respecto de nombrar las tablas y sus campos.
5) Es importante revisar el tipo de los datos 
6) Crear una nueva tabla llamada calendario y poblar esta tabla


## Objetivo 3 Limpieza y Normalización
Realizar una liempieza y revisar los valores faltantes tomando en cuenta lo siguiente:

1) Normalizar los nombres de los campos y colocar el tipo de dato adecuado para cada uno en cada una de las tablas. Descartar columnas que consideres que no tienen relevancia.
2) Buscar valores faltantes y campos inconsistentes en las tablas sucursal, proveedor, empleado y cliente. De encontrarlos, deberás corregirlos o desestimarlos. Propone y realiza una acción correctiva sobre ese problema.
3) Modificar a letra capital los campos que contengan descripciones para todas las tablas.
4) Chequear la consistencia de los campos precio y cantidad de la tabla de ventas. Precio coherentes o no, precio con zero
5) Chequear que no haya claves duplicadas, y de encontrarla en alguna de las tablas, proponer una solución.
6) Realizar la siguiente NORMALIZACIÓN:
    - Generar dos nuevas tablas a partir de la tabla 'empelado' que contengan las entidades Cargo y Sector.
    - Generar una nueva tabla a partir de la tabla 'producto' que contenga la entidad Tipo de Producto.


## Objetivo 4 Creación de la tabla Localidades

1) Es necesario contar con una tabla de localidades del país y mejorar nuestros datos. 
A partir de los datos en las tablas cliente, sucursal y proveedor hay que generar una tabla definitiva de Localidades y Provincias.
Utilizando la nueva tabla de Localidades controlar y corregir (Normalizar) los campos Localidad y Provincia de las tablas cliente, sucursal y proveedor.
2) Es necesario discretizar el campo edad en la tabla cliente.


## Objetivo 5 Mostrar los resultados del análisis

1) Utilizar la herramienta Tableau y crear visualizaciones atracctivas y efectivas para comunicar los resultados del análisis de manera clara y comprensible para la dirección de la empresa.


## Indicaciones de Gerencia
Después de la 1er junta y para continuar con el análisis de factibilidad de una nueva sucursal, se establecen los siguientes objetivos

## Objetivo 6
Obtener el (KPI) análisis de utilidad de las sucursales en la localidad en mar de plata a tra ves del tiempo para observar su tendencia

## Objetivo 7
Obtener la utilidad de cada una de las sucursales así como el promedio general de todas y oberservar la posición de la suscursales de mar de plata respecto al promedio general

## Objetivo 8
Obtener la relación de ventas por canal de ventas, es decir por cual canal de ventas vendemos mas y cual vendemos menos, para las sucursales con Id 1, 21 y 22 y presentar esta información de forma mensual

## Objetivo 9
Obtener la relación de ventas por canal de ventas, es decir por cual canal de ventas vendemos mas y cual vendemos menos, de forma global incluyendo todas las sucursales y presentarlo de forma mensual


## Objetivo principal: Crear un modelo de predicción para las ventas del siguiente año

## Objetivo 1
Analizar el comportamiento de las ventas de manera global y buscar una tendencia

## Objetivo 2
Analizar el comportamiento de las ventas de manera individual por canal de venta y buscar una tendencia

## Objetivo 3 
Crear un modelo de predicción y mostrar las ventas para el siguiente año