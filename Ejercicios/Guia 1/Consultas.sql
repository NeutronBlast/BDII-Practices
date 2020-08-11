-- Obtener el nombre y la dirección de todos los empleados que pertenecen al departamento ‘Investigación’
SELECT e.nombre, e.apellido, e.direccion
FROM empleados e
JOIN departamentos d ON d.numdep = e.numdep
WHERE d.nomdep = 'Investigacion';

-- Para cada empleado, obtener el nombre y apellido y el nombre y apellido de su supervisor
SELECT e.nombre, e.apellido ,emp.nombre, emp.apellido
From empleados e
JOIN empleados emp on e.NSSSup = emp.NSS;

-- Para cada proyecto ubicado en ‘Carrizal’ obtener una lista con el numero de proyecto, el número del departamento que lo controla y el apellido, la dirección y la fecha de nacimiento del gerente de dicho departamento.

SELECT p.numproy, p.numdep, e.apellido, e.direccion, e.fechanac
FROM proyectos p
JOIN departamentos d ON d.numdep = p.numdep
JOIN empleados e ON e.nss = d.nssgte
WHERE p.lugarproy LIKE 'Carrizal%';

-- Obtener todos los empleados cuya dirección este en una Urbanización llamada ‘Marques’:
SELECT nss, nombre, apellido
FROM empleados
WHERE direccion LIKE INITCAP('%MARQUES%');

-- Obtener todos los empleados que nacieron en la década de los 50. (El formato de fecha es en este ejemplo dd/mm/yy)
SELECT nss, nombre, apellido
FROM empleados
WHERE fechanac >= TO_DATE('01/01/1950', 'DD-MM-YYYY') AND fechanac <= TO_DATE('31/12/1959', 'DD-MM-YYYY');

-- Mostrar los salarios resultantes si cada empleado que trabaja en el proyecto ‘ProductoX recibe un aumento del 10%.
SELECT e.nombre, e.apellido, ROUND(e.salario*1.1, 0) as salario
FROM empleados e
JOIN departamentos d ON d.numdep = e.numdep
JOIN proyectos pro ON pro.numdep = d.numdep
WHERE pro.nomproy LIKE '%Producto X%';

-- Obtener una lista de empleados y de los proyectos en los que trabajan, ordenados por departamento y dentro de cada departamento alfabéticamente por apellido y nombre. 
SELECT e.nombre, e.apellido, e.numdep
FROM empleados e 
JOIN departamentos d On d.numdep = e.numdep
ORDER BY d.numdep, e.apellido, e.nombre;

-- Traer los nss de los empleados que trabajan con la misma combinación de proyecto y horas que el empleado José Silva
SELECT DISTINCT e.nss
FROM empleados e
JOIN trabaja_en te ON te.nsse = e.nss
JOIN (SELECT e.nss, te.numproy, te.hora
FROM trabaja_en te
JOIN empleados e ON e.nss = te.nsse
WHERE e.nombre LIKE 'Jose%' AND e.apellido LIKE 'Silva%') aux ON aux.numproy = te.numproy AND aux.hora = te.hora;

-- Traer los nss de los empleados que trabajan con el mismo proyecto que Jose Silva sin incluir a Jose Silva

SELECT DISTINCT e.nss
FROM empleados e
JOIN trabaja_en te ON te.nsse = e.nss
JOIN (SELECT e.nss, te.numproy, te.hora
FROM trabaja_en te
JOIN empleados e ON e.nss = te.nsse
WHERE e.nombre LIKE 'Jose%' AND e.apellido LIKE 'Silva%') aux ON aux.numproy = te.numproy  AND e.nss <> aux.nss;