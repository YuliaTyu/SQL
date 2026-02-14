--SQLQuery7-GetEasterDate
USE SPU_411_Import;
SET DATEFIRST 1;
GO

ALTER FUNCTION GetEasterDate(@year AS SMALLINT)RETURNS DATE
AS
BEGIN
--МЕТОД ГАУССА вычисления Пасхи
	DECLARE @a	AS	SMALLINT = @year%19;
	DECLARE @b	AS	SMALLINT = @year%4;
	DECLARE @c	AS	SMALLINT = @year%7;
	DECLARE @d	AS	SMALLINT = (19*@a + 15)%30;
	DECLARE @e	AS	SMALLINT = (2*@b + 4*@c + 6*@d + 6) % 7;
	DECLARE @f	AS	SMALLINT = @d + @e;
	RETURN	IIF(@f <= 26, DATEFROMPARTS(@year, 4, 4+@f), DATEFROMPARTS(@year, 5, @f-26));
END