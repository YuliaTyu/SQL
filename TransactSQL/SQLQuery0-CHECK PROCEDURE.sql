--SQLQuery0-CHECK PROCEDURE.sql
SET DATEFIRST 1;
USE SPU_411_Import;

--SET LANGUAGE N'Russian';

--DELETE FROM Schedule WHERE [group]=411;
--EXEC sp_InsertScheduleSemistacionar N'SPU_411', N'Процедурное%C++', N'Ковтун';
--EXEC sp_SelectScheduleFull;
--EXEC sp_SelectSchedule N'SPU_411', N'Процедурное%'; //проверить праздники в расписании
--EXEC sp_AddAllHolidaysFor 2026;


SELECT
	[date], holiday_name
FROM	DaysOff JOIN Holidays ON (holiday=holiday_id)
WHERE	[date] BETWEEN N'2024-12-20'AND N'2026-12-31';


