--SQLQuery1-INSERT Schedule Semi PROCEDURE_2
USE SPU_411_Import;
GO

CREATE PROCEDURE sp_INSERTSceduleSemistacionar
@group_name			AS		NVARCAR(24)
,@discipline_name	AS		NVARCAR(150)
,@teacher			AS		NVARCAR(50)

AS
BEGIN
	DECLARE @group_id		AS INT		=	(SELECT group_id	  FROM Groups		WHERE group_name=@group_name);
	DECLARE @discipline_id	AS SMALLINT =	(SELECT discipline_id FROM Disciplines  WHERE discipline_name LIKE @discipline_name);
	DECLARE @teacher_id		AS SMALLINT	=	(SELECT teacher_id	  FROM Teachers		WHERE last_name = @teacher);
	--DECLARE @start_date		AS DATE		=   ;
	--DECLARE @date			AS DATE		= @start_date;
	DECLARE @start_time		AS TIME		=	(SELECT start_time	  FROM Groups		WHERE group_id=@group_id);

END