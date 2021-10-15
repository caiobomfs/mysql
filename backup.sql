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


alter table empregado MODIFY COLUMN CD_Empregado CHAR (08) PRIMARY KEY NOT NULL;
alter table dependente MODIFY COLUMN CD_Dependente INT PRIMARY KEY NOT NULL;
alter table parentesco MODIFY COLUMN CD_Parentesco INT PRIMARY KEY NOT NULL;
 
 alter table dependente 
 add foreign key (CD_Empregado) references empregado(CD_Empregado)ON UPDATE CASCADE ON DELETE CASCADE ;
 ALTER TABLE parentesco add foreign key (CD_Parentesco) references dependente (CD_Dependente) ON UPDATE CASCADE ON DELETE CASCADE;
 
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
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('11','Adeline da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A1','12','Adilson JR da silva','1','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('12','Adilson JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A1','13','Adeline JR da silva','2','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('13','Adeline JR da silva');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A2','21','Beatriz da silva','99','1975/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('21','Beatriz da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A2','22','Bruno JR da silva','1','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('22','Bruno JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A2','23','Beatriz JR da silva','2','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('23','Beatriz JR da silva');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A3','31','Cecil da silva','99','1978/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('31','Cecil da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A3','32','Cecil JR da silva','1','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('32','Caetano JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('A3','33','Caetano JR da silva','2','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('33','Cecil JR da silva');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B1','41','Denise da silva','99','1978/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('41','Denise da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B2','42','Daniel JR da silva','1','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('42','Daniel JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B3','43','Denise JR da silva','2','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('43','Denise JR da silva');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B2','51','Elza da silva','99','1978/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('51','Denise JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B2','52','Enzo JR da silva','1','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('52','Denise JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B2','53','Elza JR da silva','2','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('53','Denise JR da silva');
 
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B3','61','Fiona da silva','99','1975/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('61','Fiona da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B3','62','Flavio JR da silva','1','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('62','Flavio JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('B3','63','Fiona JR da silva','2','2005/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('63','Fiona JR da silva');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C1','71','Gertrude da silva','99','1999/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('71','Gertrude da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C1','72','Geraldo JR da silva','1','2000/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('72','Geraldo JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C1','73','Gertrude JR da silva','2','2000/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('73','Gertrude JR da silva');
 
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C2','81','Helena da silva','99','1999/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('81','Helena da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C2','82','Hugo JR da silva','1','2000/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('82','Hugo JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C2','83','Helena JR da silva','2','2000/01/01 '); 
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('83','Helena JR da silva');

 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C3','91','Isolde da silva','99','1999/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('91','Isolde da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C3','92','Isocrates JR da silva','1','2000/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('92','Isocrates JR da silva');
 insert into dependente (CD_Empregado ,CD_Dependente ,NM_Dependente ,GR_Parentesco  ,DT_NascimentoDependente) values('C3','93','Isolde JR da silva','2','2000/01/01 ');
 INSERT INTO parentesco (CD_Parentesco, NM_Parentesco) VALUE ('93','Isolde JR da silva');
 
 select E.NM_Empregado as NOME_EMPREGADO , E.DT_Nascimento AS DATA_NASCIMENTO ,
 (select NM_Dependente from dependente where GR_Parentesco = 99 and E.CD_Empregado = CD_Empregado) as NOME_ESPOSA,
 (select NM_Dependente from dependente where GR_Parentesco = 1 and E.CD_Empregado = CD_Empregado) as NOME_FILHO,
 (select NM_Dependente from dependente where GR_Parentesco = 2 and E.CD_Empregado = CD_Empregado) as NOME_FILHA
 from empregado E ;