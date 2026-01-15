--SQLQuery4-SELECT Teachers AND Disciplines

USE SPU_411_Import;

SELECT
		 [Преподаватель]	=	FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name),
		 [Дисциплина]		=	discipline_name
FROM	 Teachers, Disciplines, TeachersDisciplinesRelation
WHERE	 teacher			=	teacher_id
AND		 discipline			=   discipline_id
--AND		 last_name		=	N'Покидюк'--поиск по преподу
--AND		 discipline_name    LIKE N'Системное%'--поиск по дисциплине
ORDER BY	discipline_name--препод/дисциплина

;


