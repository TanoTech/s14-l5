CREATE PROCEDURE VisualizzaTotalePuntiDecurtatiPerData
    @DataViolazione DATE
AS
BEGIN
    SELECT SUM(DecurtamentoPunti) AS TotalePuntiDecurtati
    FROM Verbali
    WHERE DataViolazione = @DataViolazione;
END;