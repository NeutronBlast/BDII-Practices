CREATE OR REPLACE PROCEDURE reporte_transmision
IS
reporte_final SYS_REFCURSOR;
BEGIN
OPEN reporte_final FOR 
SELECT p.doc_iden as "DOCUMENTO DE IDENTIDAD DE INFECTADO", p.primer_nombre as "PRIMER NOMBRE INFECTADO", p.primer_apellido as "PRIMER APELLIDO INFECTADO", hist.id_persona_2 as "DOCUMENTO DE IDENTIDAD", pp.primer_nombre as "PRIMER NOMBRE", pp.primer_apellido as "PRIMER APELLIDO",
c.nombre || ', ' || u.nombre || ', ' || ci.nombre || ', ' || e.nombre || ', ' || p.nombre as "LUGAR",
a.nombre as "ACTIVIDAD"
FROM personas p
JOIN P_P_C_A hist ON hist.id_persona_1 = p.doc_iden
JOIN personas pp ON pp.doc_iden = hist.id_persona_2
JOIN calles c ON c.id = hist.id_calle
JOIN urbanizaciones u ON u.id = c.id_urbanizacion
JOIN ciudades ci ON ci.id = u.id_ciudad
JOIN estados e ON e.id = ci.id_estado
JOIN paises p ON p.id = e.id_pais
JOIN actividades a ON a.id = hist.id_actividad
WHERE p.estado = 'INFECTADO';
DBMS_SQL.RETURN_RESULT(reporte_final);
END;

EXECUTE reporte_transmision();