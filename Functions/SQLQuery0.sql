--проверка функции
SET DATEFIRST 1;--
USE SPU_411_Import;

--PRINT(dbo.GetLastDate(N'SPU_411'));
--PRINT(dbo.GetNextDay(N'PD_212'));
--PRINT(dbo.GetNextDay(N'PV_319'));
--PRINT(dbo.GetNextDay(N'SPU_411'));

--SELECT * FROM Schedule WHERE [group]=3;


--EXEC sp_SelectScheduleFull;
--PRINT (dbo.GetNextDate(N'PV_211'));

--PRINT (dbo.GetNewYear(2018));
--PRINT (dbo.GetSummertimeSadness(2026));
PRINT (dbo.GetEasterDate(2022));
