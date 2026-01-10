--SQLQuery3-SELECT COUNT Groups AND Students
USE SPU_411_Import;

SELECT
		direction_name				AS N'Направление обучения',
		COUNT(DISTINCT group_name)	AS N'Количесвто групп', --DISTINCT сортирует уникальные значения и удирает дубликаты
		COUNT(DISTINCT stud_id)		AS N'Количество студентов'

FROM		Students, Groups,Directions
WHERE		direction	=	direction_id -- условия отбора!!!!!!!!!!
AND			[group]		=	group_id
GROUP BY	direction_name --группировка основной группы
--HAVING		COUNT (group_name) < 5--сортировка меньше 5 нельзя разрывать функции GROUP BY
ORDER BY	N'Количесвто групп' ASC

;

