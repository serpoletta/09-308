-- Добавление jsonb полей
alter table ships_timetable add column m_start jsonb;
alter table ships_timetable add column m_end jsonb;

-- Заполнение таблицы

INSERT INTO ships_timetable(
			id, cruiseship_id, m_start, m_end)
	VALUES
	(1, 1, '{"date": "2015-08-05","city_id": 1}', '{"date": "2015-08-07","city_id": 2}' ),
	(2, 1, '{"date": "2015-08-07","city_id": 2}', '{"date": "2015-08-07","city_id": 3}' ),
	(3, 2, '{"date": "2015-08-05","city_id": 3}', '{"date": "2015-08-06","city_id": 4}' ),
	(4, 2, '{"date": "2015-08-06","city_id": 1}', '{"date": "2015-08-06","city_id": 2}' ),
	(5, 3, '{"date": "2015-08-05","city_id": 2}', '{"date": "2015-08-07","city_id": 3}' ),
	(6, 3, '{"date": "2015-08-06","city_id": 1}', '{"date": "2015-08-08","city_id": 2}' ),
	(7, 3, '{"date": "2015-08-07","city_id": 2}', '{"date": "2015-08-09","city_id": 3}' ),
	(8, 3, '{"date": "2015-08-08","city_id": 3}', '{"date": "2015-08-06","city_id": 4}' ),
	(9, 4, '{"date": "2015-08-05","city_id": 4}', '{"date": "2015-08-06","city_id": 5}' ),
	(10, 4, '{"date": "2015-08-06","city_id": 1}', '{"date": "2015-08-07","city_id": 2}' );

-- Примеры запросов

-- id тех кораблей, которые отправляются из города с id=2

SELECT id
FROM ships_timetable
WHERE m_start @> '{"city_id": 2}'; 

-- Те корабли, которые прибывают в город id=4 2015-08-06.

SELECT *
FROM ships_timetable
WHERE m_end='{"date": "2015-08-06","city_id": 4}';
