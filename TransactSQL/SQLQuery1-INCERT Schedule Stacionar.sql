--SQLQuery1-INCERT Schedule Stacionar

USE SPU_411_Import;

--INSERT Groups
-- (group_id, group_name, direction)
--VALUES (411,  N'SPU_411',1)

DECLARE @group AS INT	              =	(SELECT group_id FROM Groups WHERE group_name = N'SPU_411');
DECLARE @discipline AS SMALLINT		  = (SELECT discipline_id FROM Disciplines WHERE discipline_name LIKE (N'Процедурное%C++'));
DECLARE @number_of_lessons AS TINYINT = (SELECT number_of_lessons FROM Disciplines WHERE discipline_id = @discipline);
DECLARE @lesson_number	AS INT		  = 0;
DECLARE @teacher	AS INT			  = (SELECT teacher_id FROM Teachers WHERE first_name LIKE(N'Олег'));
DECLARE @start_date	AS DATE			  = N'2024-10-26';
DECLARE @date AS DATE				  = @start_date;
DECLARE @start_time  AS TIME		  = N'10:00';
DECLARE @time		AS TIME			  = @start_time;			

PRINT  (@group)
PRINT  (@discipline)
PRINT  (@number_of_lessons)
PRINT  (@teacher)
PRINT  (@date)
PRINT  (@start_time)

WHILE (@lesson_number <= @number_of_lessons)
BEGIN
		PRINT('---------------------------');
		PRINT (@date);
		----------------------
		SET @time = @start_time;
		IF NOT EXISTS (SELECT [group] FROM Schedule WHERE [group]=@group AND [date]=@date AND [time]=@time)--если нет такой записи - добавляем запись
		BEGIN
			INSERT Schedule([group], discipline,teacher,[date],[time],spent)
			VALUES (@group, @discipline, @teacher, @date, @time, IIF (@date<GETDATE(),1,0));
		END
		SET @lesson_number = @lesson_number+1;
		--------------------
		SET @time = DATEADD(MINUTE, 95, @time);
		IF NOT EXISTS (SELECT [group] FROM Schedule WHERE [group]=@group AND [date]=@date AND [time]=@time)--если нет такой записи - добавляем запись
		BEGIN
			INSERT Schedule([group], discipline,teacher,[date],[time],spent)
			VALUES (@group, @discipline, @teacher, @date, @time, IIF (@date<GETDATE(),1,0));
		END
		SET @lesson_number = @lesson_number+1;
		-------------------
		SET @time = DATEADD(MINUTE, 95, @time);
		IF NOT EXISTS (SELECT [group] FROM Schedule WHERE [group]=@group AND [date]=@date AND [time]=@time)--если нет такой записи - добавляем запись
		BEGIN
			INSERT Schedule([group], discipline,teacher,[date],[time],spent)
			VALUES (@group, @discipline, @teacher, @date, @time, IIF (@date<GETDATE(),1,0));
		END
		SET @lesson_number = @lesson_number+1;
		SET @date = DATEADD(DAY, 7, @date);
END
;


SELECT
[Группа]		=		group_name,
[Дата]			=		[date],	
[Время]			=		[time],
[Дисциплина]	=		discipline,
[Преподаватель] =		FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name)

FROM	Schedule
JOIN	Groups		ON		([group]=group_id)
JOIN    Disciplines ON		discipline=discipline_id
JOIN	Teachers	ON		teacher=teacher_id
WHERE	group_name = N'SPU_411'
;

SELECT COUNT ([group]) FROM Schedule JOIN Groups ON [group]=group_id WHERE group_name = N'SPU_411';