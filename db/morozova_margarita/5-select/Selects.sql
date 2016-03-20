-- Расписание движения теплохода с id=1

SELECT start_date, end_date, ci1.name, ci2.name
FROM ships_timetable, cities as ci1, cities as ci2
WHERE ships_timetable.cruiseship_id=1 AND start_city_id=ci1.id AND end_city_id=ci2.id;

-- Все круизы (в той форме, в которой их привыкли воспринимать)

SELECT routes.id, 
	cruiseships.name, 
	sh1.start_date,ci1.name,
	sh2.end_date,ci2.name
FROM routes, 
	ships_timetable as sh1, ships_timetable as sh2, 
	cruiseships,
	cities as ci1, cities as ci2
WHERE routes.start_move_id=sh1.id AND routes.end_move_id=sh2.id 
	AND routes.cruiseship_id=cruiseships.id
	AND sh1.start_city_id=ci1.id AND sh2.end_city_id=ci2.id;

-- Количество внесенных мест для каюты с id=5
SELECT count(seats.id)
FROM seats
WHERE seats.cabin_id=5
GROUP BY seats.cabin_id;

-- Количество мест в каюте с id=5
SELECT c.seats_number 
FROM cabins c 
WHERE c.id=NEW.cabin_id;

-- Все круизы туроператора с id=2

SELECT cruiseships.name, start_date, start_city, end_date, end_city
FROM cruiseships JOIN cruises ON cruiseship_id=cruiseships.id
WHERE owner_id=2;
