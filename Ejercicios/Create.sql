CREATE TABLE empleados (
    nss BIGINT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fechanac date NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    sexo VARCHAR(2) NOT NULL,
    salario BIGINT NOT NULL,
    nsssup BIGINT,
    numdep BIGINT NOT NULL
);

CREATE TABLE departamentos (
    nomdep VARCHAR(100) NOT NULL,
    numdep BIGINT PRIMARY KEY,
    nssgte BIGINT NOT NULL,
    fechainigte date NOT NULL
);

CREATE TABLE lugares_departamentos (
    numdep BIGINT NOT NULL,
    lugardep VARCHAR(200) NOT NULL
);

CREATE TABLE proyectos (
    numproy BIGINT NOT NULL,
    nomproy VARCHAR(200) NOT NULL,
    lugarproy VARCHAR(200) NOT NULL,
    numdep BIGINT NOT NULL
);

CREATE TABLE trabaja_en (
    nsse BIGINT NOT NULL,
    numproy BIGINT NOT NULL,
    hora INT,
    semana INT NOT NULL
);

CREATE TABLE dependientes (
    nsse BIGINT NOT NULL,
    nombredep VARCHAR(200) NOT NULL,
    sexo VARCHAR(2) NOT NULL,
    fecnac date NOT NULL,
    parentesco VARCHAR(200) NOT NULL
);