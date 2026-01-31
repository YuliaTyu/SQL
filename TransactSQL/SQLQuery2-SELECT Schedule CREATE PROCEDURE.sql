--SQLQuery2-SELECT Schedule CREATE PROCEDURE.sql
USE SPU_411_Import;
GO

ALTER PROCEDURE sp_SelectScheduleFull   --SELECT-создать запрос ALTER-изменить запрос если процедура сохранена
	AS

	BEGIN
			SELECT 
			[Группа]		=		group_name,
			[Время]			=		[time],
			[Дата]			=		[date],	
			[День недели]	=		FORMAT([date], N'ddd', 'ru-RU'), -- сокращенно день недели	
			--[День недели]	=		DATENAME(WEEKDAY, [date]),	--полностью день недели
			--[День недели]	= 		DATENAME(WEEKDAY, [date], 3),
			[Дисциплина]	=		discipline_name,
			[Преподаватель] =		FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
			[Статус]		=		IIF(spent=1,N'Проведено', N'Запланировано')
		FROM	Schedule
		JOIN	Groups		ON		[group]=group_id
		JOIN    Disciplines ON		discipline=discipline_id
		JOIN	Teachers	ON		teacher=teacher_id
		ORDER BY [date]

	END