CREATE OR REPLACE TYPE estadistica AS OBJECT (
    poblacion number,
    fallecidos number,
    infectados number,
    recuperados number,
    MEMBER FUNCTION porcentaje_infectados RETURN number,
    MEMBER FUNCTION porcentaje_fallecidos RETURN number,
    MEMBER FUNCTION porcentaje_recuperados RETURN number
);

CREATE OR REPLACE TYPE BODY estadistica AS MEMBER FUNCTION porcentaje_infectados RETURN number
IS resultado number;
BEGIN
    IF infectados > poblacion THEN
        RAISE_APPLICATION_ERROR(-20001, 'Numero de infectados no puede ser mayor a la poblacion');
    ELSE
        resultado := ROUND((infectados*100)/poblacion,2);
        return (resultado);
    END IF;
END; --fin del begin

MEMBER FUNCTION porcentaje_fallecidos RETURN number
IS resultado number;
BEGIN
IF fallecidos > poblacion OR fallecidos > infectados THEN
        RAISE_APPLICATION_ERROR(-20001, 'Numero de fallecidos no puede ser mayor al numero de infectados, ni el numero de fallecidos puede ser mayor a la poblacion');
    ELSE
        resultado := ROUND((fallecidos*100)/infectados,2);
        return (resultado);
    END IF;
END; --fin de la funcion

MEMBER FUNCTION porcentaje_recuperados RETURN number 
IS resultado number;
BEGIN
IF recuperados > poblacion OR recuperados > infectados THEN
        RAISE_APPLICATION_ERROR(-20001, 'Numero de recuperados no puede ser mayor al numero de infectados, ni el numero de recuperados puede ser mayor a la poblacion');
    ELSE
        resultado := ROUND((recuperados*100)/infectados,2);
        return (resultado);
    END IF;
END;
END;
-- Create table

CREATE TABLE paises(
    id NUMBER PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    bandera VARCHAR2(100) NOT NULL,
    datos estadistica
);

-- Caso donde falla

BEGIN
    INSERT INTO paises VALUES (1, 'Alemania', '1.jpg', estadistica(150, 200, 10, 20)); -- fallecidos mayor a poblacion
END;    

SELECT p.datos.porcentaje_infectados(), p.datos.porcentaje_fallecidos() FROM paises p WHERE p.id = 1; 


-- Caso donde funciona

BEGIN
    INSERT INTO paises VALUES (2, 'Polonia', '2.jpg', estadistica(1500, 5, 38, 13)); 
END;    

SELECT p.nombre, TO_CHAR(p.datos.porcentaje_infectados()) || '%' AS infectados, TO_CHAR(p.datos.porcentaje_fallecidos()) || '%' as "FALLECIDOS BASE A INFECTADOS", TO_CHAR(p.datos.porcentaje_recuperados()) || '%' as "RECUPERADOS BASE A INFECTADOS" FROM paises p WHERE p.id = 2; 
