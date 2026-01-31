--проверка функции
SET DATEFIRST 1;
USE SPU_411_Import;

PRINT(dbo.GetLastDate(N'SPU_411'));
PRINT(dbo.GetNextDay(N'PD_212'));
PRINT(dbo.GetNextDay(N'PV_319'));
PRINT(dbo.GetNextDay(N'SPU_411'));

SELECT * FROM Schedule WHERE [group]=3;