--SQLQuery0-CHECK PROCEDURE.sql
SET DATEFIRST 1;
USE SPU_411_Import;

--SET LANGUAGE N'Russian';

--DELETE FROM Schedule WHERE [group]=411;
EXEC sp_InsertScheduleSemistacionar N'SPU_411', N'Процедурное%C++', N'Ковтун';
EXEC sp_SelectScheduleFull;
--EXEC sp_SelectSchedule N'SPU_411', N'Процедурное%';

