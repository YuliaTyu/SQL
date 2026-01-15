--SQLQuery2-SELECT COUNT Disciplines OF Teachers

USE SPU_411_Import;

SELECT
			[Преподаватель]	=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
			[Дисциплина]	=	COUNT(discipline_id)
FROM		Teachers, Disciplines, TeachersDisciplinesRelation
WHERE		teacher			=	teacher_id
AND			discipline		=   discipline_id

GROUP BY	last_name, first_name, middle_name--количество дисциплин
;
