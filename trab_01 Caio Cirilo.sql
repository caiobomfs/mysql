drop schema TRAB_01;
CREATE SCHEMA IF NOT EXISTS TRAB_01;
USE TRAB_01;
SET SQL_SAFE_UPDATES = 0;

create table empregado(
CD_Empregado char(8),
NM_Empregado char(30),
ED_Empregado char(50),
SG_Cidade char(20),
SG_Estado char(2),
TF_Empregado char(11),
DT_Nascimento  date
);
create table dependente(
CD_Empregado char(8),
CD_Dependente int,
NM_Dependente char(30),
GR_Parentesco int ,
DT_NascimentoDependente date
);
create table parentesco(
CD_Parentesco int, #codigos = (99=esposa) (1=filho) (2=filha)
NM_Parentesco char(25)
);
insert into parentesco (CD_Parentesco,NM_Parentesco) values ('99','esposa' );
insert into parentesco (CD_Parentesco,NM_Parentesco) values ('1','filho' );
insert into parentesco (CD_Parentesco,NM_Parentesco) values ('2','filha' );


alter table empregado  
add   primary key (CD_Empregado)

;
alter table dependente 
add  primary key (CD_Dependente) ;
 alter table parentesco
 add  primary key (CD_Parentesco);
 
 alter table dependente 
 add foreign key (CD_Empregado) references empregado(CD_Empregado),
 add foreign key (GR_Parentesco) references parentesco(CD_Parentesco);
 
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('A1', 'Adilson da silva','rua A ,1','são paulo','SP','11111111111','1968/01/01');
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('A2', 'Bruno da silva','rua A ,2','são paulo','RJ','22222222222','1967/01/01');
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('A3', 'Caetano da silva','rua A ,3','são paulo','SP','33333333333','1966/01/01');
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('B1', 'Daniel da silva','rua B ,1','são paulo','RJ','44444444444','1972/01/01');
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('B2', 'Enzo da silva','rua B ,2','são paulo','SP','55555555555','1973/01/01');
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('B3', 'Flavio da silva','rua B ,3','são paulo','RJ','66666666666','1974/01/01');
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('C1', 'Geraldo da silva','rua C ,1','são paulo','SP','77777777777','1994/01/01');
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('C2', 'Hugo da silva','rua C ,2','são paulo','RJ','88888888888','1993/01/01');
 insert into empregado (CD_Empregado,NM_Empregado ,ED_Empregado ,SG_Cidade ,SG_Estado ,TF_Empregado ,DT_Nascimento) values ('C3', 'Isocrates da silva','rua C ,3','são paulo','SP','99999999999','1992/01/01');
 
 
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A1','11','Adeline da silva','99','1975/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A1','12','Adilson JR da silva','1','2006/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A1','13','Adeline JR da silva','2','2006/01/01 ');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A2','21','Beatriz da silva','99','1975/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A2','22','Bruno JR da silva','1','2006/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A2','23','Beatriz JR da silva','2','2006/01/01 ');
 
  insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A3','31','Cecil da silva','99','1978/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A3','32','Cecil JR da silva','1','2006/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A3','33','Caetano JR da silva','2','2006/01/01 ');

 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B1','41','Denise da silva','99','1978/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B1','42','Daniel JR da silva','1','2006/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B1','43','Denise JR da silva','2','2006/01/01 ');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B2','51','Elza da silva','99','1978/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B2','52','Enzo JR da silva','1','2006/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B2','53','Elza JR da silva','2','2006/01/01 ');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B3','61','Fiona da silva','99','1975/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B3','62','Flavio JR da silva','1','2006/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B3','63','Fiona JR da silva','2','2006/01/01 ');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C1','71','Gertrude da silva','99','1999/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C1','72','Geraldo JR da silva','1','2001/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C1','73','Gertrude JR da silva','2','2001/01/01 ');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C2','81','Helena da silva','99','1999/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C2','82','Hugo JR da silva','1','2001/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C2','83','Helena JR da silva','2','2001/01/01 '); 
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C3','91','Isolde da silva','99','1999/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C3','92','Isocrates JR da silva','1','2001/01/01 ');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C3','93','Isolde JR da silva','2','2001/01/01 ');
 
 SELECT E.NM_Empregado AS NOME_EMPREGADO, E.DT_Nascimento AS DATA_NASCIMENTO ,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 99 AND E.CD_Empregado = D.CD_Empregado) AS NOME_ESPOSA,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado) AS NOME_FILHO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado) AS NOME_FILHA
FROM empregado E;

SELECT E.NM_Empregado AS NOME_EMPREGADO ,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 99 AND E.CD_Empregado = D.CD_Empregado) AS NOME_ESPOSA,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado) AS NASCIMENTO_FILHA
FROM empregado E;

select E.NM_EMPREGADO AS NOME_EMPREGADO , E.DT_Nascimento as DATA_FUNCIONARIO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) < 15 ) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) < 15 ) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) < 15) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) < 15) AS NASCIMENTO_FILHA
FROM empregado E
where  (SELECT TIMESTAMPDIFF(YEAR, E.DT_Nascimento, CURDATE()) AS Idade) < 50;

SELECT E.NM_Empregado AS NOME_EMPREGADO ,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 99 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) >33 and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) >44 )  AS NOME_ESPOSA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 99 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) >33 and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) >44  ) AS NASCIMENTO_ESPOSA,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) > 15 ) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) > 15 ) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) > 15 ) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) > 15 ) AS NASCIMENTO_FILHA
FROM empregado E; #dependente D
#where E.CD_Empregado=D.CD_Empregado 
#and D.GR_Parentesco=99 
#and D.DT_NascimentoDependente > '1976-01-01' 
#and D.DT_NascimentoDependente < '1987-01-01';
	#8
 SELECT E.NM_Empregado AS NOME_EMPREGADO ,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 99 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) >22 and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) >44 )  AS NOME_ESPOSA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 99 AND E.CD_Empregado = D.CD_Empregado and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) >22 and (SELECT TIMESTAMPDIFF(YEAR, D.DT_NascimentoDependente, CURDATE()) AS Idade) >44  ) AS NASCIMENTO_ESPOSA,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado ) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado  ) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado ) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado  ) AS NASCIMENTO_FILHA
FROM empregado E;

SELECT E.NM_Empregado AS NOME_EMPREGADO , E.TF_empregado as TELEFONE ,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 99 AND E.CD_Empregado = D.CD_Empregado) AS NOME_ESPOSA,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado) AS NASCIMENTO_FILHA,
E.SG_Estado as ESTADO
FROM empregado E
where E.SG_Estado = 'RJ';


SELECT E.NM_Empregado AS NOME_EMPREGADO , 
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 99 AND E.CD_Empregado = D.CD_Empregado) AS NOME_ESPOSA,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado) AS NOME_FILHO,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 1 AND E.CD_Empregado = D.CD_Empregado) AS NASCIMENTO_FILHO,
(SELECT NM_Dependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado) AS NOME_FILHA,
(SELECT DT_NascimentoDependente FROM dependente D WHERE GR_Parentesco = 2 AND E.CD_Empregado = D.CD_Empregado) AS NASCIMENTO_FILHA,
E.TF_empregado
FROM empregado E
where E.SG_Estado = 'SP';