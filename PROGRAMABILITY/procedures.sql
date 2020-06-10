CREATE PROCEDURE CLIENTE_DIRP  @NOM NVARCHAR(20) , @DIR NVARCHAR (20)
AS
SELECT NOM FROM CLIENTE_DIR WHERE NOM = @NOM AND DIR = @DIR
GO
DROP PROCEDURE CLIENTE_DIRP
CREATE VIEW 


CREATE FUNCTION VALIDAR_TEL( @TEL AS INT )
RETURNS VARCHAR (10)
AS
BEGIN
	RETURN CAST(@TEL AS VARCHAR(10)) 
END
CREATE TABLE RESP
(
NOM VARCHAR(30) NOT NULL,
APES VARCHAR(30) NOT NULL,
CURP VARCHAR(18) NOT NULL,
DIR VARCHAR(30) NOT NULL,
TEL INT,
PRIMARY KEY(CURP)
)
GO
CREATE TRIGGER CIENTESB
ON CLIENTE
AFTER DELETE
AS
BEGIN 
	INSERT RESP
	SELECT *
	FROM deleted
END

GO
CREATE TRIGGER PRODin
ON PRODUCTO
INSTEAD of insert
AS
BEGIN 
	insert into PRODUCTO
     select*
     from inserted where PRECIO > 10 
END