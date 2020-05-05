CREATE OR REPLACE TYPE estadistica AS OBJECT (
    poblacion number,
    fallecidos number,
    infectados number,
    recuperados number,
    MEMBER FUNCTION porcentaje_infectados(poblacion number, infectados number) RETURN number,
    MEMBER FUNCTION porcentaje_fallecidos(poblacion number, infectados number, fallecidos number) RETURN number,
    MEMBER FUNCTION porcentaje_recuperados(poblacion number, infectados number, recuperado number) RETURN number
);

CREATE OR REPLACE TYPE BODY estadistica AS MEMBER FUNCTION porcentaje_infectados RETURN number
IS resultado number;
BEGIN
    IF infectados > poblacion THEN
        RAISE_APPLICATION_ERROR(-20001, 'Numero de infectados no puede ser mayor a la poblacion');
    ELSE
        resultado := poblacion/infectados;
        return (resultado);
    ENDIF;
END; --fin del begin
END; --fin de la funcion

CREATE OR REPLACE TYPE BODY estadistica AS MEMBER FUNCTION porcentaje_fallecidos(poblacion number, infectados number, fallecidos number) RETURN number
IS resultado number;
BEGIN
    IF fallecidos > poblacion OR fallecidos > infectados THEN
        RAISE_APPLICATION_ERROR(-20001, 'Numero de fallecidos no puede ser mayor al numero de infectados, ni el numero de fallecidos puede ser mayor a la poblacion');
    ELSE
        resultado := poblacion/fallecidos;
        return (resultado);
    ENDIF;
END; --fin del begin
END; --fin de la funcion

CREATE OR REPLACE TYPE BODY estadistica AS MEMBER FUNCTION porcentaje_recuperados(poblacion number, infectados number, recuperados number) RETURN number
IS resultado number;
BEGIN
    IF recuperados > poblacion OR recuperados > infectados THEN
        RAISE_APPLICATION_ERROR(-20001, 'Numero de recuperados no puede ser mayor al numero de infectados, ni el numero de recuperados puede ser mayor a la poblacion');
    ELSE
        resultado := poblacion/recuperados;
        return (resultado);
    ENDIF;
END; --fin del begin
END; --fin de la funcion

-- Create table

CREATE TABLE paises(
    id NUMBER PRIMARY KEY,
    foto VARCHAR2(100) NOT NULL,
    datos estadistica
);

BEGIN
    INSERT INTO paises VALUES (1, '1.jpg', estadistica(150, 200, 10, 20)); -- fallecidos mayor a poblacion
END;

SELECT TREAT(datos AS estadistica).poblacion AS poblacion FROM paises p WHERE p.id = 1;
SELECT p.id, p.datos.poblacion as poblacion, p.datos.infectados as infectados as infectados, p.datos.fallecidos as fallecidos, p.datos.recuperados as recuperados FROM paises p WHERE p.id = 1;