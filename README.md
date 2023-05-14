# Insumos_Tecnologicos_SA

Para este proyecto seras el especialista en datos de una compañía que se dedica a la venta de insumos tecnológicos. A lo largo del proyecto te haras cargo de la información de la empresa y realizaras el proceso completo de captura, limpieza, análisis, diagnóstico, documentación, explotación y publicación de resultados.


## Objetivo 1 
La Dirección de Ventas ha solicitado las siguientes tablas a Marketing con el fin de que sean integradas. Es necesario realizar la captura de esos archivos e ingestarlos dentro de nuestra base de datos.

* La tabla de puntos de venta propios, un Excel frecuentemente utilizado para contactar a cada sucursal, actualizada en 2021.
* La tabla de empleados, un Excel mantenido por el personal administrativo de RRHH.
* La tabla de proveedores, un Excel mantenido por un analista de otra dirección que ya no esta en la empresa. 
* La tabla de clientes, alojada en el CRM de la empresa.
* La tabla de productos, un Excel mantenido por otro analista.
* Las tablas de ventas, gastos y compras, tres archivos CSV generados a partir del sistema transaccional de la empresa.


## Objetivo 2
Con el fín de asegurarse de que la calidad de la información con la que se va a trabajar sea la óptima, es necesario realizar un EDA (Exploratory Data Analysis) el cuál debe tomar en cuenta los siguientes puntos:

1) ¿Qué tan actualizada está la información? ¿La forma en que se actualiza ó mantiene esa información se puede mejorar?
2) ¿Los datos están completos en todas las tablas?
3) ¿Se conocen las fuentes de los datos?
4) Al integrar éstos datos, es prudente que haya una normalización respecto de nombrar las tablas y sus campos.
5) Es importante revisar la consistencia de los datos: 
    - ¿Se pueden relacionar todas las tablas al modelo? 
    - ¿Cuáles son las tablas de hechos y las tablas dimensionales o maestros? 
    - ¿Podemos hacer esa separación en los datos que tenemos (tablas de hecho y dimensiones)? 
    - ¿Hay claves duplicadas? 
    - ¿Cuáles son variables cualitativas y cuáles son cuantitativas? 
    - ¿Qué acciones podemos aplicar sobre las mismas?
6) Poblar la tabla de calendario.


## Objetivo 3 
Realizar una liempieza y revisar los valores faltantes tomando en cuenta lo siguiente:

1) Normalizar los nombres de los campos y colocar el tipo de dato adecuado para cada uno en cada una de las tablas. Descartar columnas que consideres que no tienen relevancia.
2) Buscar valores faltantes y campos inconsistentes en las tablas sucursal, proveedor, empleado y cliente. De encontrarlos, deberás corregirlos o desestimarlos. Propone y realiza una acción correctiva sobre ese problema.
3) Modificar a letra capital los campos que contengan descripciones para todas las tablas.
4) Chequear la consistencia de los campos precio y cantidad de la tabla de ventas. Precio coherentes o no, precio con zero
5) Chequear que no haya claves duplicadas, y de encontrarla en alguna de las tablas, proponer una solución.

6) Realizar la siguiente NORMALIZACIÓN:
    - Generar dos nuevas tablas a partir de la tabla 'empelado' que contengan las entidades Cargo y Sector.
    - Generar una nueva tabla a partir de la tabla 'producto' que contenga la entidad Tipo de Producto.