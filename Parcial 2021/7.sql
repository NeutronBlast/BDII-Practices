SELECT p.doc_iden as "DOCUMENTO DE IDENTIDAD", p.primer_nombre as "PRIMER NOMBRE", p.primer_apellido
as "PRIMER APELLIDO", p.genero as "GENERO", r.fecha_llegada as "FECHA DE LLEGADA", r.fecha_salida as
"FECHA DE SALIDA" FROM personas p 
JOIN registro_asistencia r ON r.id_persona = p.doc_iden
WHERE r.id_matrimonio = 1;