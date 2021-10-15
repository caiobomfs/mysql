USE TP_01;
DELIMITER $
CREATE TRIGGER VL_Medio
 AFTER INSERT ON oferta
FOR EACH ROW

BEGIN 
ALTER TABLE imovel 
ADD COLUMN MD_Valor int;
INSERT INTO imovel(MD_Valor) VALUES (AVG(VL_Oferta));
END$

DELIMITER $$
CREATE TRIGGER estado_block BEFORE DELETE
ON estado
FOR EACH ROW
BEGIN 
   
   SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'mas se num pode alterar a tabela estado oxente';

END$$


DELIMITER $$$
CREATE TRIGGER faixa_imovel_block  BEFORE UPDATE
ON faixa_imovel
FOR EACH ROW
BEGIN
	
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ixi maria se num pode alterar a tabela faixa imovel';

END$$$