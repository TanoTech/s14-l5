SELECT COUNT(*) AS TotaleVerbaliTrascritti
FROM [dbo].[Verbali];

SELECT a.ID, a.Cognome, a.Nome, COUNT(V.ID) AS TotaleVerbali
FROM [dbo].[Anagrafica] a
JOIN [dbo].[Verbali] v ON a.ID = v.IDAnagrafe
GROUP BY a.ID, A.Cognome, a.Nome;

SELECT t.ID, t.Descrizione, COUNT(V.ID) AS TotaleViolazioni
FROM [dbo].[TipoViolazione] t
JOIN [dbo].[Verbali] V ON t.ID = v.IDTipoViolazione
GROUP BY t.ID, t.Descrizione;


SELECT a.ID, a.Cognome, a.Nome, SUM(V.DecurtamentoPunti) AS PuntiDecurtatiTotale
FROM [dbo].[Anagrafica] a
JOIN [dbo].[Verbali] v ON a.ID = v.IDAnagrafe
GROUP BY a.ID, a.Cognome, a.Nome;


SELECT a.Cognome, a.Nome, v.DataViolazione, v.IndirizzoViolazione, v.Importo, v.DecurtamentoPunti
FROM [dbo].[Anagrafica] a
JOIN [dbo].[Verbali] v ON a.ID = v.IDAnagrafe
WHERE a.Città = 'Palermo';


SELECT a.Cognome, a.Nome, v.IndirizzoViolazione, v.DataViolazione, v.Importo, v.DecurtamentoPunti
FROM [dbo].[Anagrafica] a
JOIN [dbo].[Verbali] v ON A.ID = v.IDAnagrafe
WHERE v.DataViolazione BETWEEN '2009-02-01' AND '2009-07-31';


SELECT a.ID, a.Cognome, a.Nome, SUM(V.Importo) AS ImportoTotale
FROM [dbo].[Anagrafica] a
JOIN [dbo].[Verbali] V ON a.ID = v.IDAnagrafe
GROUP BY a.ID, a.Cognome, a.Nome;

SELECT ID, Cognome, Nome, Indirizzo, Città, CAP, CF
FROM [dbo].[Anagrafica]
WHERE Città = 'Palermo';

DECLARE @DataChevuoiFaiTu DATE = '2030-10-22'
SELECT DataViolazione, Importo, DecurtamentoPunti
FROM [dbo].[Verbali]
WHERE DataViolazione = @DataChevuoiFaiTu;

SELECT NominativoAgente, COUNT(*) as VerbaliFatti
FROM [dbo].[Verbali]
GROUP BY NominativoAgente

SELECT a.Cognome, a.Nome, a.Indirizzo, v.DataViolazione, v.Importo, v.DecurtamentoPunti
FROM [dbo].[Anagrafica] a
JOIN [dbo].[Verbali] v ON A.ID = v.IDAnagrafe
WHERE v.DecurtamentoPunti > 5;

SELECT a.Cognome, a.Nome, a.Indirizzo, v.DataViolazione, v.Importo, v.DecurtamentoPunti
FROM [dbo].[Anagrafica] a
JOIN [dbo].[Verbali] v ON a.ID = v.IDAnagrafe
WHERE v.Importo > 400;

/* Stored Procedure */

EXEC VisualizzaContravvenzioniPerAnno @Anno = 2022;

EXEC VisualizzaTotalePuntiDecurtatiPerData @DataViolazione = '2024-02-09';

EXEC EliminaVerbale @IDVerbale = 1;

/* piccoli extra per i miei colleghi <3 */
SELECT Anagrafica.Cognome, Anagrafica.Nome, Verbali.DataViolazione, Verbali.IndirizzoViolazione, TipoViolazione.Descrizione AS TipoViolazione, Verbali.Importo
FROM Anagrafica
JOIN Verbali ON Anagrafica.ID = Verbali.IDAnagrafe
JOIN TipoViolazione ON Verbali.IDTipoViolazione = TipoViolazione.ID
WHERE Anagrafica.ID IN (1400, 1401, 1402, 1403, 1404);