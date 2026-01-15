--SQLQuery2-SELECT COUNT  Students AND Groups
USE SPU_411_Import;


SELECT
			group_name			AS N'Группа',
			COUNT(stud_id)	AS N'Количество студентов'
FROM		Students, Groups
WHERE		[group]=group_id
GROUP BY	group_name
ORDER BY	N'Количество студентов'
;

