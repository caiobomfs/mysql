CREATE schema IF NOT EXISTS TP_01;
USE TP_01;

CREATE TABLE produto(   # 01
produto_nome char(40) NOT NULL,
produto_preco decimal(5,2)

); 
CREATE TABLE UE_PRODUTO(
UE_PRODUTO_DESCR char (50)

) ;
alter table produto   #exercicio 02 
add nome_codigo smallint primary key NOT NULL

;
alter table UE_PRODUTO
add descr_codigo smallint primary key NOT NULL

;
alter table produto 
add codigo smallint  NOT NULL ;
alter table produto 
add foreign key (codigo) references UE_PRODUTO (descr_codigo) ; # exercicio 03

alter table produto 
modify column produto_nome char(40) UNIQUE NOT NULL #04
;
drop table produto ;   #exercicio  05
drop table UE_PRODUTO;

#linhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

create table vendedor(          #6
cd_vendedor int(2) ,
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
cd_comprador int (2),
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
cd_imovel int,
cd_vendedor int,
cd_bairro int,
cd_cidade int,
sg_Estado char(2),
ds_Endereco varchar(40),
qt_AreaUtil decimal(10,2),
qt_AreaTotal decimal(10,2),
ds_Imovel varchar(300),
vl_preco  double ,
qt_Ofertas int,
ic_Vendido char(1),
dt_Lancto date,
qt_ImovelIndicado int 
);
create table oferta (
cd_comprador int,
cd_imovel int,
vl_oferta double,
dt_Oferta date 
);
create table estado( 
cd_estado char(2) ,
nm_Estado varchar(20)
);
create table cidade (
cd_cidade int,
cd_estado char(2),
nm_Cidade varchar(20)
);
create table bairro (
cd_bairro int,
cd_cidade int,
cd_estado char(2),
nm_Bairro  varchar(20)

);
 create table faixa_imovel(
 cd_faixa int,
 nm_Faixa varchar(30),
vl_Maximo double,
vl_Minimo double  
);

alter table vendedor    #7
modify column cd_vendedor int primary key  NOT NULL
;
alter table comprador 
modify column cd_comprador int primary key NOT NULL ;
alter table imovel 
modify column cd_imovel int primary key NOT NULL ;
alter table oferta
add foreign key(cd_comprador) references comprador (cd_comprador);
alter table oferta 
add foreign key (cd_imovel) references imovel (cd_imovel);
alter table estado 
modify column cd_estado char(2) primary key NOT NULL ;
alter table cidade 
modify column cd_cidade int primary key NOT NULL,
add foreign key (cd_estado) references estado (cd_estado);
alter table bairro 
modify column cd_bairro int primary key NOT NULL,
add foreign key (cd_cidade) references cidade (cd_cidade),
add foreign key (cd_estado) references estado (cd_estado);
alter table faixa_imovel
modify column cd_faixa varchar (30) primary key NOT NULL ;

create index vende on vendedor (cd_vendedor); #8
create index compra on comprador (cd_comprador);
create index maior_oferta on oferta (cd_imovel asc); #9
create index menor_oferta on oferta (vl_oferta desc);
drop index vende on vendedor; #10
drop index compra on comprador;
alter table oferta 
drop foreign key oferta_ibfk_2;
alter table oferta modify column cd_imovel int ;
drop index maior_oferta on oferta;
drop index menor_oferta on oferta;
alter table oferta add foreign key (cd_imovel) references imovel (cd_imovel);
CREATE schema IF NOT EXISTS descartavel ; #11
DROP schema descartavel;