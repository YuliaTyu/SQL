--SQLQuery7-GetHolidaysStartDate
USE SPU_411_Import;
SET DATEFIRST 1;
GO

ALTER FUNCTION  GetHolidaysStartDate(@holiday NVARCHAR(150), @year SMALLINT)RETURNS DATE
BEGIN
	DECLARE @month	AS	TINYINT	=	(SELECT[month] FROM Holidays WHERE holiday_name LIKE @holiday);
	DECLARE @day	AS	TINYINT	=	(SELECT [day] FROM Holidays WHERE holiday_name LIKE @holiday);
	DECLARE @start_date AS DATE =
	(
	CASE
	WHEN	@holiday	LIKE N'Нов%'	THEN dbo.GetNewYaer(@year)
	WHEN	@holiday	LIKE N'Летние%'	THEN dbo.GetSummertimeSadness(@year)
	WHEN	@holiday	LIKE N'Пасха%'	THEN dbo.GetEasterDate(@year)
	WHEN	@month !=0 AND @day !=0 THEN DATEFROMPARTS(@year, @month, @day)
	END
	);
	RETURN @start_date;

END