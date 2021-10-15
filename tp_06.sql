USE DBTP;
GO
--TP06

--Stored Procedure

CREATE PROCEDURE sp_ex1
AS
GO

ALTER PROCEDURE sp_ex1
@nomeBairro VARCHAR(20),
@sgEstado CHAR(2),
@vlPercentual MONEY
AS
	IF (SELECT sg_Estado FROM estado WHERE sg_Estado=@sgEstado) = @sgEstado
	AND (SELECT nm_Bairro FROM bairro WHERE nm_Bairro = @nomeBairro AND sg_Estado=@sgEstado) = @nomeBairro
		BEGIN
			PRINT('O valor dos imoveis do bairro ' + @nomeBairro 
			+ 'do estado de ' + @sgEstado 
			+ ' será ACRESCENTADO em ' + CAST((@vlPercentual-1)*100 AS VARCHAR) + '%')
	
			UPDATE imovel
			SET vl_Preco = vl_Preco*@vlPercentual WHERE sg_Estado=@sgEstado 
			AND cd_Bairro=(SELECT cd_Bairro FROM bairro WHERE nm_Bairro = @nomeBairro AND sg_Estado=@sgEstado)
			PRINT('A alteração foi feita com sucesso')
		END
		ELSE
			PRINT('Estado OU bairro invalido')
GO

EXEC sp_ex1 'Aeroporto','RJ',1
GO

CREATE PROCEDURE sp_ex2
AS
GO

ALTER PROCEDURE sp_ex2
@cdComprador INT,
@vlPercentual MONEY
AS