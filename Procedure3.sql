CREATE PROCEDURE EliminaVerbale
    @IDVerbale INT
AS
BEGIN
    DELETE FROM Verbali
    WHERE ID = @IDVerbale;
END;