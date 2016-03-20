-- Проверяем, что мы не вносим несуществующее в каюте место
CREATE OR REPLACE FUNCTION cabin_seat_insert() RETURNS TRIGGER AS $$
BEGIN
	IF (SELECT count(seats.id) FROM seats WHERE seats.cabin_id=NEW.cabin_id GROUP BY seats.cabin_id) < (SELECT c.seats_number FROM cabins c WHERE c.id=NEW.cabin_id) OR (SELECT count(seats.id) FROM seats WHERE seats.cabin_id=NEW.cabin_id GROUP BY seats.cabin_id) IS NULL THEN
		RETURN NEW;
	ELSE
		RAISE EXCEPTION 'Уже внесены все места в данной каюте';
	END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;


-- ЕСЛИ БОЛЬШЕ

DROP TRIGGER IF EXISTS cabin_seat_insert ON seats;
CREATE TRIGGER cabin_seat_insert
BEFORE INSERT ON seats FOR EACH ROW EXECUTE PROCEDURE cabin_seat_insert();




-- Вью круизов
DROP VIEW cruises;
CREATE OR REPLACE VIEW cruises as SELECT routes.id, 
	cruiseships.id as cruiseship_id, cruiseships.name as cruiseship_name, 
	sh1.id as start_move_id, sh1.start_date,ci1.name as start_city,
	sh2.id as end_move_id, sh2.end_date,ci2.name as end_city
FROM routes, 
	ships_timetable as sh1, ships_timetable as sh2, 
	cruiseships,
	cities as ci1, cities as ci2
WHERE routes.start_move_id=sh1.id AND routes.end_move_id=sh2.id 
	AND routes.cruiseship_id=cruiseships.id
	AND sh1.start_city_id=ci1.id AND sh2.end_city_id=ci2.id;




-- Индекс для поиска по ценам
CREATE INDEX price_index ON prices(price);
