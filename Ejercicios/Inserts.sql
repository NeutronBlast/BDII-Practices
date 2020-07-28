INSERT INTO empleados (nombre, apellido, nss, fechanac, direccion, sexo, salario, nsssup, numdep) VALUES 
('Jose', 'Silva', 123456789, '09/01/1955', 'El Marques', 'M', 30000, 334455555, 5),
('Federico', 'Vizcarra', 334455555, '08/12/1945', 'Carrizal', 'M', 40000, 888665555, 5),
('Alicia', 'Zapata', 999887777, '19/07/1958', 'La Urbina', 'F', 25000, 987654321, 4),
('Jazmin', 'Valdes', 987654321, '20/06/1931', 'Tazon', 'F', 43000, 888665555, 4),
('Ramon', 'Valdes', 666884444, '15/09/1952', 'Los Chorros', 'M', 38000, 334455555, 5),
('Josefa', 'Esparza', 453453453, '31/07/1962', 'Petare', 'F', 25000, 334455555, 5),
('Ahmed', 'Jabbar', 987987987, '29/03/1959', 'La Paz', 'M', 25000, 987654321, 4),
('Jaime', 'Botello', 888665555, '10/11/1927', 'Boleita', 'M', 50000, null, 1);

INSERT INTO departamentos(nomdep, numdep, nssgte, fechainigte) VALUES 
('Investigacion', 5, 334455555, '22/05/1978'),
('Administracion', 4, 987654321, '01/01/1985'),
('Direccion', 1, 888665555, '19/06/1971');

INSERT INTO lugares_departamentos(numdep, lugardep) VALUES 
(1, 'El Marques'),
(4, 'Carrizal'),
(5, 'Los Chorros'),
(5, 'Boleita'),
(5, 'El Marques');

INSERT INTO proyectos (nomproy, numproy, lugarproy, numdep) VALUES 
('Producto X', 1, 'Los Chorros', 5),
('Producto Y', 2, 'Boleita', 5),
('Producto Z', 3, 'El Marques', 5),
('Automatizacion', 10, 'Carrizal', 4),
('Reorganizacion', 20, 'El Marques', 1),
('Nuevasprestaciones', 30, 'Carrizal', 4);

INSERT INTO dependientes (nsse, nombredep, sexo, fecnac, parentesco) VALUES 
(334455555, 'Alicia', 'F', '05/04/1976', 'Hija'),
(334455555, 'Teodoro', 'M', '20/10/1973', 'Hijo'),
(334455555, 'Jobita', 'F', '03/05/1948', 'Conyugue'),
(987654321, 'Abdiel', 'M', '29/02/1932', 'Conyugue'),
(123456789, 'Miguel', 'M', '01/01/1978', 'Hijo'),
(123456789, 'Alicia', 'F', '31/12/1978', 'Hija'),
(123456789, 'Elizabeth', 'F', '05/05/1957', 'Conyugue');

INSERT INTO trabaja_en (nsse, numproy, hora, semana) VALUES 
(123456789, 1, 32.5, 1),
(123456789, 2, 7.5, 1),
(666884444, 3, 40.0, 2),
(453453453, 1, 20.0, 1),
(453453453, 2, 20.0, 2),
(334455555, 2, 10.0, 1),
(334455555, 3, 10.0, 2),
(334455555, 10, 10.0, 1),
(334455555, 20, 10.0, 2),
(999887777, 30, 30.0, 1),
(999887777, 10, 10.0, 1),
(999887777, 10, 35.0, 1),
(987987987, 30, 5.0, 1),
(987654321, 30, 20.0, 2),
(987654321, 20, 15.0, 3),
(888665555, 20, null, 3);