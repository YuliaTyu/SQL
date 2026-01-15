--SQLQuery2-SELECT Students

USE SPU_411_Import;

SELECT
		last_name		AS		N'Фамилия',
		first_name	AS		N'Имя',
		middle_name	AS		N'Отчество',
		FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name) AS N'Студент',

		birth_date		AS		N'Дата рожденеия',
		
		CAST(DATEDIFF(DAY, birth_date, GETDATE())/365.25 AS INT),--расчет и вывод возраста в базе:
		
		group_name		AS		N'Группа',
		direction_name	AS		N'Направленеи обучения'
FROM	Students, Groups, Directions
WHERE [group]		=	group_id     --связываем таблицы
AND direction		=	direction_id 
AND direction_name LIKE N'Разработка%' --отбор по тексту в поле


ORDER BY	last_name	ASC --сортировка по возрастанию:
--ORDER BY	last_name	DESC --сортировка по убыванию:
;

SELECT
		[Преподаватель]	=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name ),
		[Дата рождения] = birth_date,
		[Возраст]		= CAST(DATEDIFF(DAY, birth_date, GETDATE())/365.25 AS INT) 
FROM Teachers
;

