--SQLQuery5-DELETE Schedule
USE SPU_411_Import;
--удаление записей в таблице
DELETE FROM Schedule WHERE [group] = 411;
SELECT * FROM Schedule WHERE [group] = 411;