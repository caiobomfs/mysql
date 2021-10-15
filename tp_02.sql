CREATE schema IF NOT EXISTS TP_02;
USE TP_02;
SET SQL_SAFE_UPDATES = 0;

create table vendedor(          #6
 cd_vendedor int(2) primary key,
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
cd_Comprador int (2) primary key,
nm_Comprador varchar(40),
ds_Endereco varchar(40),
cd_CPF decimal(11),
nm_Cidade varchar(20),
nm_Bairro varchar(20),
sg_Estado varchar(2),
cd_Telefone  varchar(20),
ds_Email varchar(80) 

);
create table imovel (
cd_Imovel int primary key ,
cd_Vendedor int,
sg_Bairro int,
sg_Cidade int,
sg_Estado char(2),
ds_Endereco varchar(40),
qt_AreaUtil decimal(10,2),
qt_AreaTotal decimal(10,2),
ds_Imovel varchar(300),
vl_Preco  double ,
qt_Ofertas int,
ic_Vendido char(1),
dt_Lancto date,
qt_ImovelIndicado int 
);
create table oferta (
sg_Comprador int,
sg_Imovel int,
vl_Oferta double,
dt_Oferta date, 
foreign key (sg_Comprador) references comprador (cd_Comprador),
foreign key (sg_Imovel) references imovel (cd_Imovel)
);
create table estado( 
cd_Estado char(2) primary key  ,
nm_Estado varchar(20) 
);
create table cidade (
cd_Cidade int primary key ,
nm_Cidade varchar(20),
sg_Estado char(2),
foreign key (sg_Estado) references estado (cd_Estado)
);
create table bairro (
cd_Bairro int primary key ,
sg_Cidade int,
sg_Estado char(2),
nm_Bairro  varchar(20),
foreign key (sg_Cidade ) references cidade(cd_Cidade),
foreign key (sg_Estado) references estado (cd_Estado)
);
 create table faixa_imovel(
 cd_Faixa int primary key,
 nm_Faixa varchar(30),
vl_Maximo double,
vl_Minimo double  
);




insert into estado (nm_Estado, cd_Estado) Values (  'São Paulo', 'SP');
insert into estado (nm_Estado, cd_Estado) Values (  'Rio de Janeiro', 'RJ');

insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  1, 'São Paulo','SP');
insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  2, 'Santo André','SP');
insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  3, 'campinas','SP');
insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  4, 'Rio de Janeiro','RJ');
insert into cidade (cd_Cidade, nm_Cidade,sg_Estado) Values (  5, 'niteroi','RJ');

insert into bairro (cd_Bairro, nm_Bairro, sg_Cidade, sg_Estado) values (1, 'JARDINS', '1', 'SP');
insert into bairro (cd_Bairro, nm_Bairro, sg_Cidade, sg_Estado) values (2, 'MORUMBI', '1', 'SP');
insert into bairro (cd_Bairro, nm_Bairro, sg_Cidade, sg_Estado) values (3, 'AEROPORTO', '1', 'SP');
insert into bairro (cd_Bairro, nm_Bairro, sg_Cidade, sg_Estado) values (4, 'AEROPORTO', '1', 'RJ');
insert into bairro (cd_Bairro, nm_Bairro, sg_Cidade, sg_Estado) values (5, 'NITEROI', '1', 'RJ');

insert into vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email) values (1, 'MARIA DA SILVA', 'RUA DO GRITO,45','msilva@nova.com');
insert into vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email) values (2, 'MARCO ANDRADE', 'AV DA SAUDADE, 325','mandrade@nova.com');
insert into vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email) values (3, 'ANDRÉ CARDOSO', 'AV BRASIL,401','acardoso@nova.com');
insert into vendedor (cd_Vendedor, nm_Vendedor, ds_Endereco, ds_Email) values (4, 'TATIANA SOUZA', 'RUA DO IMPERADOR,778','TSOUZA@NOVA.COM');

insert into imovel ( cd_Imovel, cd_Vendedor, sg_Bairro, sg_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (1,' 1','1','1','SP','AL TIETE 3304/101','250','400','18000' );
insert into imovel ( cd_Imovel, cd_Vendedor, sg_Bairro, sg_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (2,' 1','2','1','SP','AV.MORUMBI 2230','150','250','135000' );
insert into imovel ( cd_Imovel, cd_Vendedor, sg_Bairro, sg_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (3,' 2','1','1','RJ','R. GAL OSORIO 445/34','250','400','185000' );
insert into imovel ( cd_Imovel, cd_Vendedor, sg_Bairro, sg_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (4,' 2','2','1','RJ','R.D.PEDRO I,882','120','400','110000' );
insert into imovel ( cd_Imovel, cd_Vendedor, sg_Bairro, sg_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (5,' 3','3','1','SP','AV.RUBENS BERTA, 2355','2110','200','95000' );
insert into imovel ( cd_Imovel, cd_Vendedor, sg_Bairro, sg_Cidade, sg_Estado, ds_Endereco, qt_AreaUtil, qt_AreaTotal, vl_Preco) values (6,' 4','1','1','RJ','R.GETULIO VARGAS,522','200','300','99000' );


insert into comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (1,'EMMANUEL ANTUNES ','R.SARAIVA, 452','eantunes@nova.com')  ;
insert into comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (2,'JOANA PEREIRA ','AV.PORTUGAL, 52','jpereira@nova.com')  ;
insert into comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (3,'RONALDO CAMPELO ','R.ESTADOS UNIDOS, 54','rcampelo@nova.com')  ;
insert into comprador (cd_Comprador,nm_Comprador,ds_Endereco,ds_Email) values (4,'MANFRED AUGUSTO ','AV.BRASIL 351','maugusto@nova.com')  ;

insert into oferta (sg_Comprador, sg_Imovel, vl_Oferta, dt_Oferta) values (1,'1','170000','10/01/09');
insert into oferta (sg_Comprador, sg_Imovel, vl_Oferta, dt_Oferta) values (1,'3','180000','10/01/09');
insert into oferta (sg_Comprador, sg_Imovel, vl_Oferta, dt_Oferta) values (2,'2','135000','15/01/09');
insert into oferta (sg_Comprador, sg_Imovel, vl_Oferta, dt_Oferta) values (2,'4','100000','15/02/09');
insert into oferta (sg_Comprador, sg_Imovel, vl_Oferta, dt_Oferta) values (3,'1','160000','05/01/09');
insert into oferta (sg_Comprador, sg_Imovel, vl_Oferta, dt_Oferta) values (3,'2','140000','20/02/09');

update imovel
set vl_Preco = 1.10 * vl_Preco ;

update imovel
set vl_preco = 0.95 * vl_Preco
where cd_vendedor=1 ;

update oferta
 set vl_Oferta = 1.05 *vl_Oferta
 where sg_Comprador =2 ;
 
update comprador
set ds_Endereco = 'R.ANANÁs,45'
where cd_Comprador = 3 ;

update oferta 
set vl_Oferta = 101.000
where sg_Comprador = 2;

DELETE FROM oferta
where sg_Comprador =3 and  sg_Imovel=1 ;

DELETE FROM cidade
where cd_Cidade=3 and sg_Estado = "SP";

insert into faixa_imovel (cd_Faixa, nm_Faixa, vl_Minimo , vl_Maximo) values (1,'BAIXO','0','105000');
insert into faixa_imovel (cd_Faixa, nm_Faixa, vl_Minimo , vl_Maximo) values (2,'MEDIO','105001','180000');
insert into faixa_imovel (cd_Faixa, nm_Faixa, vl_Minimo , vl_Maximo) values (3,'ALTO','180001','999999');
