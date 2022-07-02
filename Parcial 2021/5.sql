/* Antes de registrar un avatar se procedera a vestirlo */
CREATE OR REPLACE TRIGGER vestir BEFORE INSERT ON AVATAR FOR EACH ROW
DECLARE
shirt number;
shirt_price number;
pants number;
pants_price number;
shoes number;
shoes_price number;
acc number;
acc_price number;
wallet_id number;
wallet_balance number;
total_price number;
gender varchar(2);
BEGIN
    SELECT genero INTO gender FROM personas WHERE doc_iden = :new.id_persona;
    SELECT id, precio INTO shirt, shirt_price FROM camisas WHERE genero = gender;
    SELECT id, precio INTO pants, pants_price FROM pantalones WHERE genero = gender;
    SELECT id, precio INTO shoes, shoes_price FROM zapatos WHERE genero = gender;
    SELECT id, precio INTO acc, acc_price FROM accesorios WHERE genero = gender;
    SELECT w.id, w.balance INTO wallet_id, wallet_balance FROM personas p
    JOIN wallets w ON w.id = p.id_wallet
    WHERE p.doc_iden = :new.id_persona;

    total_price = shirt_price + pants_price + shoes_price + acc_price;
    
    IF total_price < wallet_balance THEN
        :new.id_camisa = shirt;
        :new.id_pantalon = pants;
        :new.id_zapatos = shoes;
        :new.id_accesorio = acc;
        UPDATE wallets w SET w.balance = wallet_balance-total_price
        WHERE w.id = wallet_id;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No hay suficientes fondos');
END;