drop schema tp_04;
CREATE schema IF NOT EXISTS TP_04;
USE TP_04;
SET SQL_SAFE_UPDATES = 0;

create table vendedor(          
 cd_vendedor int(2) primary key not null,
nm_Vendedor varchar(40),
ds_Endereco varchar(40),
cd_CPF decimal(11),
nm_Cidade varchar(20),
nm_Bairro  varchar(20),
sg_Estado char(2),
cd_Telefone varchar(20),
ds_Email varchar(80)  
);

create table comprador (
cd_Comprador int (2) primary key not null,
nm_Comprador varchar(40),
ds_Endereco varchar(40),
cd_CPF decimal(11),
nm_Cidade varchar(20),
nm_Bairro varchar(20),
sg_Estado varchar(2),
cd_Telefone  varchar(20),
ds_Email varchar(80) 

);

create table estado( 
sg_Estado char(2) primary key  not null,
nm_Estado varchar(20) 
);
create table cidade (
cd_Cidade int primary key ,
nm_Cidade varchar(20),
sg_Estado char(2),
foreign key (sg_Estado) references estado (sg_Estado)
);
create table bairro (
cd_Bairro int primary key not null,
cd_Cidade int,
sg_Estado char(2),
nm_Bairro  varchar(20),
foreign key (cd_Cidade ) references cidade(cd_Cidade),
foreign key (sg_Estado) references estado (sg_Estado)
);
create table imovel (
cd_Imovel int primary key not null ,
cd_Vendedor int(2),
cd_Bairro int,
cd_Cidade int,
sg_Estado char(2),
ds_Endereco varchar(40),
qt_AreaUtil decimal(10,2),
qt_AreaTotal decimal(10,2),
ds_Imovel varchar(300),
vl_Preco  double ,
qt_Ofertas int,
ic_Vendido char(1),
dt_Lancto date,
qt_ImovelIndicado int ,
foreign key (cd_Bairro) references bairro(cd_Bairro),
foreign key (cd_Vendedor) references vendedor(cd_Vendedor),
foreign key (cd_Cidade) references cidade(cd_Cidade),
foreign key (sg_Estado) references estado(sg_Estado)
);
create table oferta (
cd_Comprador int,
cd_Imovel int,
vl_Oferta double,
dt_Oferta date, 
foreign key (cd_Comprador) references comprador (cd_Comprador),
foreign key (cd_Imovel) references imovel (cd_Imovel)
);
 create table faixa_imovel(
 cd_Faixa int primary key not null,
 nm_Faixa varchar(30),
vl_Maximo double,
vl_Minimo double  
);




insert into estado (nm_Estado, sg_Estado) Values (  'São Paulo', 'SP');
insert into estado (nm_Estado, sg_Estado) Values (  'Rio de Janeiro', 'RJ');

insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  1, 'São Paulo','SP');
insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  2, 'Santo André','SP');
insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  3, 'campinas','SP');
insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  4, 'Rio de Janeiro','RJ');
insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  5, 'niteroi','RJ');

insert into bairro (cd_Bairro, nm_Bairro, cd_Cidade, sg_Estado) values (1, 'JARDINS', '1', 'SP');
insert into bairro (cd_Bairro, nm_Bairro, cd_Cidade, sg_Estado) values (2, 'MORUMBI', '1', 'SP');
insert into bairro (cd_Bairro, nm_Bairro, cd_Cidade, sg_Estado) values (3, 'AEROPORTO', '1', 'SP');
insert into bairro (cd_Bairro, nm_Bairro, cd_Cidade, sg_Estado) values (4, 'AEROPORTO', '1', 'RJ');
insert into bairro (cd_Bairro, nm_Bairro, cd_Cidade, sg_Estado) values (5, 'NITEROI', '1', 'RJ');

insert into vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email) values (1, 'MARIA DA SILVA', 'RUA DO GRITO,45','msilva@nova.com');
insert into vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email) values (2, 'MARCO ANDRADE', 'AV DA SAUDADE, 325','mandrade@nova.com');
insert into vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email) values (3, 'ANDRÉ CARDOSO', 'AV BRASIL,401','acardoso@nova.com');
insert into vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email) values (4, 'TATIANA SOUZA', 'RUA DO IMPERADOR,778','TSOUZA@NOVA.COM');

insert into imovel ( cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (1,' 1','1','1','SP','AL TIETE 3304/101','250','400','18000' );
insert into imovel ( cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (2,' 1','2','1','SP','AV.MORUMBI 2230','150','250','135000' );
insert into imovel ( cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (3,' 2','1','1','RJ','R. GAL OSORIO 445/34','250','400','185000' );
insert into imovel ( cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (4,' 2','2','1','RJ','R.D.PEDRO I,882','120','400','110000' );
insert into imovel ( cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (5,' 3','3','1','SP','AV.RUBENS BERTA, 2355','2110','200','95000' );
insert into imovel ( cd_Imovel, cd_Vendedor, cd_Bairro, cd_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (6,' 4','1','1','RJ','R.GETULIO VARGAS,522','200','300','99000' );


insert into comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (1,'EMMANUEL ANTUNES ','R.SARAIVA, 452','eantunes@nova.com')  ;
insert into comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (2,'JOANA PEREIRA ','AV.PORTUGAL, 52','jpereira@nova.com')  ;
insert into comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (3,'RONALDO CAMPELO ','R.ESTADOS UNIDOS, 54','rcampelo@nova.com')  ;
insert into comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (4,'MANFRED AUGUSTO ','AV.BRASIL 351','maugusto@nova.com')  ;

insert into oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta) values (1,'1','170000','09/01/10');
insert into oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta) values (1,'3','180000','09/01/10');
insert into oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta) values (2,'2','135000','09/01/15');
insert into oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta) values (2,'4','100000','09/02/15');
insert into oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta) values (3,'1','160000','09/01/05');
insert into oferta (cd_Comprador, cd_Imovel, vl_Oferta, dt_Oferta) values (3,'2','140000','09/02/20');

update imovel
set vl_Preco = 1.10 * vl_Preco ;

update imovel
set vl_preco = 0.95 * vl_Preco
where cd_vendedor=1 ;

update oferta
 set vl_Oferta = 1.05 *vl_Oferta
 where cd_Comprador =2 ;
 
update comprador
set ds_Endereco = 'R.ANANÁs,45'
where cd_Comprador = 3 ;

update oferta 
set vl_Oferta = 101.000
where cd_Comprador = 2;

DELETE FROM oferta
where cd_Comprador =3 and  cd_Imovel=1 ;

DELETE FROM cidade
where cd_Cidade=3 and sg_Estado = "SP";

insert into faixa_imovel (cd_Faixa, nm_Faixa, vl_Minimo , vl_Maximo) values (1,'BAIXO','0','105000');
insert into faixa_imovel (cd_Faixa, nm_Faixa, vl_Minimo , vl_Maximo) values (2,'MEDIO','105001','180000');
insert into faixa_imovel (cd_Faixa, nm_Faixa, vl_Minimo , vl_Maximo) values (3,'ALTO','180001','999999');

SELECT I.cd_Imovel, V.cd_Vendedor, V.nm_Vendedor, I.sg_Estado
FROM imovel AS I, vendedor AS V;

SELECT C.cd_Comprador, C.nm_Comprador, I.cd_Imovel, O.vl_Oferta
FROM comprador AS C, imovel AS I, oferta AS O;


SELECT I.cd_Imovel, I.vl_Preco, B.nm_Bairro
FROM imovel AS I, bairro AS B, vendedor AS V
WHERE V.cd_Vendedor = 3;


SELECT *
FROM imovel AS I INNER JOIN oferta AS O
ON I.cd_Imovel = O.cd_Imovel
WHERE O.cd_Imovel > 0;


SELECT *
FROM imovel AS I LEFT JOIN oferta AS O
ON I.cd_Imovel = O.cd_Imovel;


SELECT *
FROM comprador AS C INNER JOIN oferta AS O
ON C.cd_Comprador = O.cd_Comprador;


SELECT *
FROM comprador AS C LEFT JOIN oferta AS O
ON C.cd_Comprador = O.cd_Comprador;


SELECT I.ds_Endereco, B.nm_Bairro, F.nm_Faixa
FROM imovel AS I JOIN bairro AS B 
ON (I.cd_Bairro = B.cd_Bairro) AND (I.cd_Cidade = B.cd_Cidade) AND (I.sg_Estado = B.sg_Estado)
JOIN Faixa_Imovel AS F
ON I.vl_Preco BETWEEN F.vl_Minimo AND F.vl_Maximo;
  
  
  
SELECT COUNT(*) AS QTD, nm_Vendedor
FROM  imovel AS I JOIN vendedor AS V
ON I.cd_Vendedor = V.cd_Vendedor
GROUP BY V.nm_Vendedor
ORDER BY QTD ASC;


SELECT MAX(vl_Preco) - MIN(vl_Preco) AS RESULT
FROM Imovel;

#11 ARRUMAR (QUASE LÁ, 80% PRONTO)

SELECT cd_Vendedor, MIN(vl_Preco)
FROM imovel
WHERE vl_Preco >= 10000
GROUP BY cd_Vendedor;


SELECT COUNT(*) AS QTD, AVG(vl_Oferta), C.cd_Comprador, C.nm_Comprador
FROM  comprador AS C JOIN oferta AS O
ON C.cd_Comprador = O.cd_Comprador
GROUP BY C.cd_Comprador
ORDER BY QTD;

