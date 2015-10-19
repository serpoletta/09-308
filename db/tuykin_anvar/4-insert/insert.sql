DELETE FROM groups;
INSERT INTO groups (
			id, name, entry_year) 
	VALUES 
		(1, '09-308', 2013),
		(2, '09-411', 2014),
		(3, '09-510', 2015);

DELETE FROM students;
INSERT INTO students(
            id, name, surname, birthday, group_id)
    VALUES 
    	(1, 'Вася', 'Пупкин', '10-12-1996', 1),
    	(2, 'Семен', 'Семеныч', '01-02-1997', 1),
    	(3, 'Искандер', 'Ягудин', '13-07-1996', 1),
    	(4, 'Самат', 'Яппаров', '10-09-1996', 2),
    	(5, 'Леонардо', 'Да Винчи', '12-12-1996', 1);
