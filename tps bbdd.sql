----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------- PRACTICO 4 PARTE 2 ------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------- esquema voluntarios

-- 1) Haga un resumen de cuantas veces ha cambiado de tareas cada voluntario. Indique el número,  nombre y apellido del voluntario.
-- cada vez que termina una tarea se anota en historico, por lo que cada entrada de un voluntario en historico es =  un cambio de tarea de dicho voluntario
-- despues con el nro de ese vol extraemos los otros datos de voluntario
-- opt1 cuenta por id tarea
SELECT CONCAT(v.nombre, ', ', v.apellido) AS "Nombre y Apellido",
       COUNT(h.id_tarea) AS "Cantidad de Cambios"
FROM voluntario v
INNER JOIN historico h ON v.nro_voluntario = h.nro_voluntario
GROUP BY CONCAT(v.nombre, ', ', v.apellido)
ORDER BY "Cantidad de Cambios" DESC;
-- opt2 cuenta por nro_vol, PUEDE ESTAR MAL SI UN VOLUNTARIO PUEDE ESTAR 2 VECES EN UNA MISMA TAREA
SELECT CONCAT(v.nombre, ', ', v.apellido) AS "Nombre y Apellido",
       COUNT(h.nro_voluntario) AS "Cantidad de Cambios"
FROM voluntario v
INNER JOIN historico h ON v.nro_voluntario = h.nro_voluntario
GROUP BY CONCAT(v.nombre, ', ', v.apellido)
ORDER BY "Cantidad de Cambios" DESC;

-- 2) Liste los datos de contacto (nombre, apellido, e-mail y teléfono) de los voluntarios que hayan desarrollado tareas con diferencia max_horas-min_horas de hasta 5000 horas y que las hayan finalizado antes del  01/01/2000. 
SELECT  v.nombre AS "Nombre",
        v.apellido AS "Apellido",
        v.e_mail AS "Email",
        v.telefono AS "Tfn"
FROM voluntario v
INNER JOIN historico h ON v.nro_voluntario = h.nro_voluntario
INNER JOIN tarea t ON h.id_tarea = t.id_tarea
WHERE (t.max_horas - t.min_horas <= 5000) AND h.fecha_fin < '2000-01-01'
GROUP BY v.nombre, v.apellido, v.e_mail, v.telefono;

-- 3) Indique nombre, id y dirección completa de las instituciones que no poseen voluntarios con aporte de horas mayor o igual que el máximo de horas de la tarea que realiza. 


-- 4) Liste en orden alfabético los nombres de los países que nunca han tenido acción de voluntarios (considerando sólo información histórica, no tener en cuenta los voluntarios actuales).


-- 5) Indique los datos de las tareas que se han desarrollado históricamente y que no se están desarrollando actualmente.


-- 6) Liste el id, nombre y máxima cantidad de horas de las tareas que se están ejecutando solo una vez y que actualmente la están realizando voluntarios de la ciudad ‘Munich’. Ordene por id de tarea.


-- 7) Indique los datos de las instituciones que poseen director, donde históricamente se hayan desarrollado tareas que actualmente las estén ejecutando voluntarios de otras instituciones.


-- 8) Liste los datos completos de todas las instituciones junto con el apellido y nombre de su director, si poseen.

-------------------------------------------------------------------- esquema de peliculas

-- 9) Para cada uno de los empleados indique su id, nombre y apellido junto con el id, nombre y apellido de su jefe, en caso de tenerlo.


-- 10) Determine los ids, nombres y apellidos de los empleados que son jefes y cuyos departamentos donde se desempeñan se encuentren en la ciudad ‘Rawalpindi’. Ordene los datos por los ids. 


-- 11) Liste los ids y números de inscripción de los distribuidores nacionales que hayan entregado películas en idioma Español luego del año 2010.


-- 12) Liste las películas que nunca han sido entregadas por un distribuidor nacional.


-- 13) Liste el apellido y nombre de los empleados que trabajan en departamentos residentes en el país Argentina y donde el jefe de departamento posee más del 40% de comisión.


-- 14) Indique los departamentos (nombre e identificador completo) que tienen más de 3 empleados con tareas con sueldo mínimo menor a 6000. Muestre el resultado ordenado por distribuidor.


-- 15) Liste los datos de los departamentos en los que trabajan menos del 10 % de los empleados que hay registrados.