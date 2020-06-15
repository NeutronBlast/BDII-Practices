/* Antes de registrar o actualizar una actividad de usuario se detectara el peligro */
CREATE OR REPLACE TRIGGER peligro BEFORE INSERT OR UPDATE ON P_P_C_A FOR EACH ROW
DECLARE
public_pw_1 number;
public_pw_2 number;
estado_p_1 varchar(10);
estado_p_2 varchar(10);
BEGIN
    SELECT p.estado INTO estado_p_1 FROM personas p WHERE p.doc_iden = :new.id_persona_1;
    SELECT p.estado INTO estado_p_2 FROM personas p WHERE p.doc_iden = :new.id_persona_2;
    SELECT t.clave_publica INTO public_pw_1 FROM telefonos t WHERE t.id_persona = :new.id_persona_1;
    SELECT t.clave_publica INTO public_pw_2 FROM telefonos t WHERE t.id_persona = :new.id_persona_2;
    IF public_pw_1 = public_pw_2 AND (estado_p_1 = 'INFECTADO' OR estado_p_2 = 'INFECTADO') THEN
        DBMS_OUTPUT.PUT_LINE('Se ha detectado peligro de persona contagiada a menos de un metro de distancia');
    END IF;
END;