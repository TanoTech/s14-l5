CREATE PROCEDURE VisualizzaContravvenzioniPerAnno
    @Anno INT
AS
BEGIN
    SELECT Verbali.ID, Verbali.DataViolazione, Verbali.IndirizzoViolazione, TipoViolazione.Descrizione AS TipoViolazione, Verbali.Importo
    FROM Verbali
    JOIN TipoViolazione ON Verbali.IDTipoViolazione = TipoViolazione.ID
    WHERE YEAR(Verbali.DataViolazione) = @Anno;
END;