--SQLQuery2-SELECT COUNT Disciplines OF Directions

USE SPU_411_Import;

--SELECT
--			[N'Направление']	=	direction_name,
--			[N'Дисциплина']		=	COUNT(discipline_name)--количество дисциплин
--FROM		Disciplines, Directions, DisciplinesDirectionsRelation
--WHERE		discipline			=		discipline_id
--AND			direction		=		direction_id
--GROUP BY	direction_name
--;

--SELECT * FROM Disciplines;

--SELECT
--			[Направление]	=	direction_name,
--			[Дисциплина]	=	discipline_name
--FROM		Disciplines, Directions, DisciplinesDirectionsRelation
--WHERE		direction	=	direction_id
--AND		discipline	=	discipline_id --все направления и все дисциплины
--AND		discipline_name    LIKE N'Системное%'-- Для выбранного направления вывести все дисциплины, которые изучаются на этом направлении

--ORDER BY	direction_name
--;

SELECT
			[Направление]	=	direction_name,
			[Дисциплина]	=	discipline_name
FROM		Disciplines, Directions, DisciplinesDirectionsRelation
WHERE		discipline	=	discipline_id
--AND		direction	=	direction_id--все направления и все дисциплины
AND		discipline_name    LIKE N'Теория баз%'-- Для выбранной дисциплины выяснить, на каких направлениях она изучается

ORDER BY	direction_name
;

