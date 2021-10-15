
USE trab_01;
SET SQL_SAFE_UPDATES = 0;




#Escreva uma query para mostrar a mãe com idade > 45 anos  e seus filhos com idade > 15 anos.
 #      colunas -> nome e data nascimento esposa, nome e data nascimento filho e cidade

SELECT NM_Dependente AS NOME_ESPOSA, DT_NascimentoDependente as NASCIMENTO_ESPOSA,
(SELECT NM_Dependente FROM dependente  WHERE GR_Parentesco = 1 and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) >15 ) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente WHERE GR_Parentesco = 1  and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) > 15 ) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente WHERE GR_Parentesco = 2  and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) > 15) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente  WHERE GR_Parentesco = 2  and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) > 15) AS NASCIMENTO_FILHA,
(SELECT SG_Cidade FROM empregado) AS CIDADE    
FROM dependente D
 WHERE GR_Parentesco =99 and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) > 45 ;
 
 
 SELECT NM_Dependente AS NOME_ESPOSA, DT_NascimentoDependente as NASCIMENTO_ESPOSA,
(SELECT NM_Dependente FROM dependente  WHERE GR_Parentesco = 1 and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) <15 ) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente WHERE GR_Parentesco = 1  and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) < 15 ) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente WHERE GR_Parentesco = 2  and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) < 15) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente  WHERE GR_Parentesco = 2  and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) < 15) AS NASCIMENTO_FILHA,
(SELECT SG_Cidade FROM empregado )AS CIDADE    
FROM dependente 
 WHERE GR_Parentesco =99 and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) <24 and (SELECT TIMESTAMPDIFF(YEAR, DT_NascimentoDependente, CURDATE()) AS Idade) >38;
 
 #6 Escreva uma query para mostrar os empregados com idade 25 a 37 anos, esposas e os filhos < que 15 anos.
 #    colunas -> nome empregado, nome e data nascimento esposa, nome e data nascimento filhos.

select E.NM_EMPREGADO AS E.NOME_EMPREGADO , DT_Nascimento as DATA_FUNCIONARIO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 99 ) as NOME_ESPOSA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 99) AS NASCIMENTO_ESPOSA, 
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) < 15 ) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) < 15 ) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) < 15) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) < 15) AS NASCIMENTO_FILHA
FROM empregado E 
#where  (SELECT TIMESTAMPDIFF(YEAR, E.DT_Nascimento, CURDATE()) AS Idade) >24 and (SELECT TIMESTAMPDIFF(YEAR, E.DT_Nascimento, CURDATE()) AS Idade) <38;
#7 – na tabela de empregados altere o ano para 1992,1987,1982,1977,1972,1967,1962, 1957, 1952 mantendo o dia e mês original.
delimiter $
create procedure MudarAnoE( in A int(04), in B int(04), in C int(04), in D int(04), in E int(04), in F int(04), in G int(04), in H int(04), in I int(04) )
begin
	
    
    UPDATE empregado SET  DT_Nascimento = date_format(DT_Nascimento, concat(A, '-%m-%d')) where CD_Empregado = 'A1' ;
    UPDATE empregado SET DT_Nascimento = date_format(DT_Nascimento, concat(B, '-%m-%d')) where CD_Empregado = 'A2' ;
    UPDATE empregado SET DT_Nascimento= date_format(DT_Nascimento, concat(C, '-%m-%d'))where CD_Empregado = 'A3' ;
    UPDATE empregado SET DT_Nascimento = date_format(DT_Nascimento, concat(D, '-%m-%d')) where CD_Empregado = 'B1' ;
    UPDATE empregado SET DT_Nascimento = date_format(DT_Nascimento, concat(E, '-%m-%d')) where CD_Empregado = 'B2' ;
    UPDATE empregado SET DT_Nascimento =date_format(DT_Nascimento, concat(F, '-%m-%d')) where CD_Empregado = 'B3' ;
   UPDATE empregado SET  DT_Nascimento = date_format(DT_Nascimento, concat(G, '-%m-%d')) where CD_Empregado = 'C1' ;
    UPDATE empregado SET  DT_Nascimento = date_format(DT_Nascimento, concat(H, '-%m-%d')) where CD_Empregado = 'C2' ;
    UPDATE empregado SET  DT_Nascimento = date_format(DT_Nascimento, concat(I, '-%m-%d')) where CD_Empregado = 'C3' ;
   
end $
  
delimiter ;
call trab_01.MudarAnoE('1992', '1987', '1982', '1977', '1972', '1967', '1962', '1957', '1952');
#8 – na tabela de dependentes altere o ano das esposas para 1953,1956,1959,1973,1976, 1979, 1983, 1986, 1989 mantendo o dia e mês original.
#rode a procedure e insira cada ano correspondente a cada pessoa que deseja
delimiter $
create procedure MudarAnoD( in A int(04), in B int(04), in C int(04), in D int(04), in E int(04), in F int(04), in G int(04), in H int(04), in I int(04) )
begin
	
#date_format(coluna_da_tabela, concat(variavel_parametro, 'formato_data'))
    UPDATE dependente SET  DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(A, '-%m-%d'))where CD_Empregado = 'A1' and GR_Parentesco = 99;
    UPDATE dependente SET DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(B, '-%m-%d')) where CD_Empregado = 'A2' and GR_Parentesco = 99;
    uPDATE dependente SET DT_NascimentoDependente= date_format(DT_NascimentoDependente, concat(C, '-%m-%d')) where CD_Empregado = 'A3' and GR_Parentesco = 99;
    UPDATE dependente SET DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(D, '-%m-%d')) where CD_Empregado = 'B1' and GR_Parentesco = 99;
    UPDATE dependente SET DT_NascimentoDependente =date_format(DT_NascimentoDependente, concat(E, '-%m-%d')) where CD_Empregado = 'B2' and GR_Parentesco = 99;
    UPDATE dependente SET DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(F, '-%m-%d')) where CD_Empregado = 'B3' and GR_Parentesco = 99;
   UPDATE dependente SET  DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(G, '-%m-%d')) where CD_Empregado = 'C1' and GR_Parentesco = 99;
    UPDATE dependente SET  DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(H, '-%m-%d')) where CD_Empregado = 'C2' and GR_Parentesco = 99;
    UPDATE dependente SET  DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(I, '-%m-%d')) where CD_Empregado = 'C3' and GR_Parentesco = 99;
   
end $
  
delimiter ;
  
 call trab_01.MudarAnoD('1953', '1956', '1959', '1973', '1976', '1979', '1983', '1986', '1989');
  
  
  
 delimiter $$

#9
create procedure clonarAnoM(in A int(04))
begin
	
	UPDATE dependente SET DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(A, '-%m-%d')) where GR_Parentesco = 1;
  
end $$
delimiter ;
 call trab_01. clonarAnoM('2000')
 delimiter $$
#10
create procedure ClonarAnoF(in A int(04))
begin
	update dependente set DT_NascimentoDependente = date_format(DT_NascimentoDependente, concat(A, '-%m-%d')) where  GR_Parentesco = 2;
    select * from dependente;
end $$
delimiter ;
call trab_01. clonarAnoF('2000')