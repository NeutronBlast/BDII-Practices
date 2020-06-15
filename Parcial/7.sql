CREATE OR REPLACE PROCEDURE reporte_despistaje
IS
reporte_final SYS_REFCURSOR;
BEGIN
OPEN reporte_final FOR 
SELECT p.doc_iden as "DOCUMENTO DE IDENTIDAD", p.primer_nombre as "PRIMER NOMBRE", p.primer_apellido as "PRIMER APELLIDO", 
d.nombre || ' VIVIENDA: ' || d.numero || c.nombre || ', ' || u.nombre || ', ' || ci.nombre || ', ' || e.nombre || ', ' || p.nombre as "DIRECCION"
FROM personas p
JOIN P_P_C_A hist ON hist.id_persona_1 = p.doc_iden
JOIN personas pp ON pp.doc_iden = hist.id_persona_2 AND pp.estado = 'INFECTADO'
JOIN domicilios d ON d.id = p.id_domicilio
JOIN calles c ON c.id = d.id_calle
JOIN urbanizaciones u ON u.id = c.id_urbanizacion
JOIN ciudades ci ON ci.id = u.id_ciudad
JOIN estados e ON e.id = ci.id_estado
JOIN paises p ON p.id = e.id_pais;

DBMS_SQL.RETURN_RESULT(reporte_final);
END;

EXECUTE reporte_despistaje();