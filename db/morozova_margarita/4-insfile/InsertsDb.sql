/* Заполнение базы пробными записями */

DELETE FROM cities;
INSERT INTO cities(
			id, name)
	VALUES
	(1, 'Казань'),
	(2, 'Булгар'),
	(3, 'Самара'),
	(4, 'Балаково'),
	(5, 'Саратов'
);

DELETE FROM owners;
INSERT INTO owners(
			id, name, info,phone)
	VALUES
	(1, 'ВолгаПлес', 'Самарская круизная компания', 'XXX-XX-XX'),
	(2, 'ИнТурВолга', 'Казанская туркомпания', '255-55-55'),
	(3, 'HelloTravel', 'Не только круизы', '333-33-33'),
	(4, 'AngelTour', 'Райский отдых', '000-00-00'),
	(5, 'Волжские путешествия', 'Туры по Волге из Казани', '525-35-35'
);

DELETE FROM cruiseships;
INSERT INTO cruiseships(
			id, name, owner_id)
	VALUES
	(1, 'Дмитрий Пожарский', 1),
	(2, 'Алексей Толстой', 2),
	(3, 'Хирург Разумовский', 2),
	(4, 'Арабелла', 4),
	(5, 'LENIN', 3
	
);

DELETE FROM cabins;
INSERT INTO cabins(
			id,"number","class", seats_number, cruiseship_id)
	VALUES
	(1,'001', 'ЛЮКС', 2, 4),
	(2, '077', 'A2', 2, 3),
	(3, '078', 'A3', 3, 3),
	(4, '079', 'A3', 3, 3),
	(5, '001', 'A01', 4, 1),
	(6, '002', 'A01', 4, 1),
	(7, '003', 'A01', 4, 1),
	(8, '004', 'A01', 4, 1),
	(9, '701Ф', 'B06', 3, 5),
	(10, '702Ф', 'B06', 3, 5 
);

DELETE FROM seats;
INSERT INTO seats(
			id, cabin_id)
	VALUES
	(1, 1),
	(2, 1),
	(3, 5),
	(4, 5),
	(5, 5),
	(6, 9),
	(7, 9),
	(8, 9),
	(9, 10),
	(10, 10
);


DELETE FROM ships_timetable;
INSERT INTO ships_timetable(
			id, cruiseship_id, start_date, end_date, start_city_id, end_city_id)
	VALUES
	(1, 1, '2015-05-08', '2015-06-08', 1, 2),
	(2, 1, '2015-06-08', '2015-07-08', 2, 3),
	(3, 1, '2015-07-08', '2015-07-08', 3, 4),
	(4, 2, '2015-05-08', '2015-06-08', 1, 2),
	(5, 2, '2015-06-08', '2015-06-08', 2, 3),
	(6, 3, '2015-05-08', '2015-06-08', 1, 2),
	(7, 3, '2015-06-08', '2015-07-08', 2, 3),
	(8, 3, '2015-07-08', '2015-08-08', 3, 4),
	(9, 3, '2015-08-08', '2015-09-08', 4, 5),
	(10, 4, '2015-05-08', '2015-06-08', 1, 2
);


DELETE FROM routes;
INSERT INTO routes(
			id, cruiseship_id, start_move_id, end_move_id)
	VALUES
	(1, 1, 1, 3),
	(2, 2, 4, 5),
	(3, 3, 6, 8),
	(4, 3, 7, 9),
	(5, 3, 6, 9
);

DELETE FROM prices;
INSERT INTO prices(
			id, seat_id, route_id, price, is_booked)
	VALUES
	(1, 1, 1, 50200, false),
	(2, 2, 1, 50200, false),
	(3, 3, 1, 25200, false),
	(4, 4, 1, 25200, false),
	(5, 5, 1, 25200, false
);

DELETE FROM book_seats_for_timetable;
INSERT INTO book_seats_for_timetable(
			id, seat_id, ships_timetable_id, is_booked)
	VALUES
	(1, 1, 1, false),
	(2, 2, 1, false),
	(3, 3, 5, false),
	(4, 4, 5, false),
	(5, 5, 5, false
);
