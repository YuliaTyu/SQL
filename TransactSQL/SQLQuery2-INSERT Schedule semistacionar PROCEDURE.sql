--SQLQuery2-INSERT Schedule semistacionar PROCEDURE

USE SPU_411_Import;
GO

ALTER PROCEDURE sp_INSERTScheduleSemiStacionar
AS
BEGIN

	SELECT 
	[Группа]		=		group_name,
	[Дисциплина]	=		discipline_name,
	[Преподаватель] =		FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
	[Дата]			=		[date],	
	[Время]			=		[time]
	FROM	Schedule
		JOIN	Groups		ON		[group]=group_id
		JOIN    Disciplines ON		discipline=discipline_id
		JOIN	Teachers	ON		teacher=teacher_id
END


	
	DECLARE @group		AS	INT		=	(SELECT group_id		FROM Groups			WHERE group_name	=	N'SPU_411');
	DECLARE @discipline	AS	SMALLINT=	(SELECT discipline_id	FROM Disciplines	WHERE discipline_name LIKE(N'Процедурное%C++'));
	DECLARE @teacher	AS	INT		=	(SELECT teacher_id		FROM Teachers		WHERE first_name	LIKE(N'Олег'));
	DECLARE @number_of_lessons TINYINT	=	(SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline);
	DECLARE @lesson_number AS TINYINT = 0;
	DECLARE @interval AS TINYINT = 7; 
	DECLARE @start_date	AS DATE			  = N'2024-10-26';
	DECLARE @date AS DATE				  = @start_date;
	DECLARE @start_time  AS TIME		  = N'10:00';
	DECLARE @time		AS TIME			  = @start_time;			

	
	PRINT('Intervals:');
	PRINT(@interval);
	

	WHILE (@lesson_number < @number_of_lessons)
	BEGIN
		PRINT(@date);
		PRINT(DATENAME(WEEKDAY, @date));
				
		IF(NOT EXISTS (SELECT [date] FROM DaysOFF WHERE [date]=@date))
		BEGIN
			IF (NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [group]=@group AND discipline=@discipline AND [date]=@date AND [time]=@time))
			BEGIN
				INSERT Schedule
						([group], discipline, teacher, [date], [time], spent)
				VALUES	(@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(), 1, 0))
			END

			PRINT(@lesson_number+1);
			PRINT(@time);
			SET	@lesson_number = @lesson_number+1;
			PRINT(@lesson_number+1);
			PRINT(DATEADD(MINUTE, 95, @time));
			
			IF (NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [group]=@group AND discipline=@discipline AND [date]=@date AND [time]=DATEADD(MINUTE, 95, @time)))
			BEGIN
				INSERT Schedule
						([group], discipline, teacher, [date], [time], spent)
				VALUES	(@group, @discipline, @teacher, @date, DATEADD(MINUTE, 95, @time), IIF(@date < GETDATE(), 1, 0))
			END
       END		


	