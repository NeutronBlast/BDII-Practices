/* Generar invitaciones, estas invitaciones seran registradas en la tabla registro de asistencia
   si la persona no asistio simplemente no se llenan los campos de fecha de entrada y salida */
CREATE OR REPLACE TRIGGER generar_invitacion BEFORE INSERT ON matrimonios FOR EACH ROW
DECLARE
CURSOR familia_amigos_persona_1 IS
    SELECT pp.id_amigo
    FROM familia_y_amigos pp 
    WHERE pp.id_persona_1 = 1;
cur_fap1 familia_y_amigos%ROWTYPE;

CURSOR familia_amigos_persona_1 IS
    SELECT pp.id_amigo
    FROM familia_y_amigos pp 
    WHERE pp.id_persona_1 = 1;
cur_fap2 familia_y_amigos%ROWTYPE;
BEGIN
    OPEN familia_amigos_persona_1;
    FETCH familia_amigos_persona_1 INTO cur_fap1;
    WHILE familia_amigos_persona_1%FOUND
        LOOP
            INSERT INTO registro_asistencia ra (id, id_matrimonio, id_calle, id_persona)
            VALUES (ra.nextval, :new.id, 1, cur_fap1.id_amigo)
        END LOOP;
    CLOSE cur_fap1;

    OPEN familia_amigos_persona_2;
    FETCH familia_amigos_persona_2 INTO cur_fap2;
    WHILE familia_amigos_persona_2%FOUND
        LOOP
            INSERT INTO registro_asistencia ra (id, id_matrimonio, id_calle, id_persona)
            VALUES (ra.nextval, :new.id, 1, cur_fap2.id_amigo)
        END LOOP;
    CLOSE cur_fap2;
END;