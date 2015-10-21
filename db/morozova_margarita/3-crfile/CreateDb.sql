/*CREATE DATABASE cruises
	WITH OWNER = rita
			 ENCODING = 'UTF8'
			 TABLESPACE = pg_default
			 LC_COLLATE = 'ru_RU.UTF-8'
			 LC_CTYPE = 'ru_RU.UTF-8'
			 CONNECTION LIMIT = -1;
*/

/*
Задачи:

1. "cabin_id integer NOT NULL references cabins(id) ON DELETE SET NULL,
route_id integer NOT NULL references routes(id) ON DELETE SET NULL" - при создании сработало без комментариев. Возникнет ошибка при удалении? Возникнет:
'Произошла ошибка:
ОШИБКА:  нулевое значение в колонке "route_id" нарушает ограничение NOT NULL
КОНТЕКСТ:  SQL-оператор: "UPDATE ONLY "public"."prices" SET "route_id" = NULL WHERE $1 OPERATOR(pg_catalog.=) "route_id""'

2. Удалить позволило, установило NULL - на колонке нет not null.

3. NULL is not "equal to" NULL. (The null value represents an unknown value, and it is not known whether two unknown values are equal.) This behavior conforms to the SQL standard. - документация
Напоминает 0/0 и прочие подобные неопределенности.

*/


CREATE TABLE cities
(
	name character(50) NOT NULL UNIQUE,
	id serial primary key
)
WITH (
	OIDS=FALSE
);

CREATE TABLE owners
(
	id serial primary key,
	name character(50) NOT NULL UNIQUE,
	info character(500) DEFAULT 'Please call by phone.',
	phone character(13) NOT NULL UNIQUE
)
WITH (
	OIDS=FALSE
);

CREATE TABLE cruiseships
(
	id serial primary key,
	name character(50) NOT NULL UNIQUE,
	owner_id integer references owners(id) ON DELETE RESTRICT /* Подозрительное действие, хотя администратору д.б. можно */
)
WITH (
	OIDS=FALSE
);

CREATE TABLE cabins
(
	id serial primary key,
	"number" character(5) NOT NULL,
	"class" character(7) NOT NULL,
	seats_number integer,
	cruiseship_id integer references cruiseships(id) ON DELETE CASCADE
)
WITH (
	OIDS=FALSE
);

CREATE TABLE seats /* Здесь должна быть проверка - соответствует ли количество мест указанному в таблице кают */
(
	id serial primary key,
	cabin_id integer references cabins(id) ON DELETE CASCADE
)
WITH (
	OIDS=FALSE
);

CREATE TABLE ships_timetable
/* Все перемещения теплоходов*/
(
	id serial primary key,
	cruiseship_id integer NOT NULL references cruiseships(id) ON DELETE CASCADE,
	start_date date NOT NULL,
	end_date date NOT NULL,
	start_city_id integer NOT NULL references cities(id) ON DELETE RESTRICT,
	end_city_id integer NOT NULL references cities(id) ON DELETE RESTRICT
)
WITH (
	OIDS=FALSE
);

CREATE TABLE routes
/* Круизные маршруты*/
(
	id serial primary key,
	cruiseship_id integer NOT NULL references cruiseships(id) ON DELETE CASCADE,
	/* Расписание первично относительно маршрутов. Чисто технически. */
	start_move_id integer NOT NULL references ships_timetable(id) ON DELETE RESTRICT,
	end_move_id integer NOT NULL references ships_timetable(id) ON DELETE RESTRICT,
	CONSTRAINT ship_moving CHECK(start_move_id<>end_move_id)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE prices
/* Цены на места в каютах на маршруты - это для использования пользователями. */
(
	id serial primary key,
	seat_id integer NOT NULL references seats(id) ON DELETE CASCADE,
	route_id integer NOT NULL references routes(id) ON DELETE CASCADE,
	price integer NULL CONSTRAINT positive_price CHECK(price>0),
	is_booked boolean NOT NULL DEFAULT false, /* Здесь при установке true нужно проверять, 
											чтобы не было пересечения с другим route и прописывать его во всех кусках маршрута*/
	UNIQUE (seat_id,route_id)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE book_seats_for_timetable
/* Бронирование места на каждое перемещение по расписанию: каждое место на каждый отрезок пути имеет только 1 бронирование.*/
/* Это для того, чтобы не позволить забронировать место дважды - на разных маршрутах, которые перекрывают друг друга.*/
(
	id serial primary key,
	seat_id integer NOT NULL references seats(id) ON DELETE CASCADE,
	ships_timetable_id integer NOT NULL references ships_timetable(id) ON DELETE CASCADE,
	is_booked boolean NOT NULL DEFAULT false,
	UNIQUE (seat_id,ships_timetable_id)
)
WITH (
	OIDS=FALSE
);

ALTER TABLE cabins
	OWNER TO rita;
ALTER TABLE cities
	OWNER TO rita;
ALTER TABLE cruiseships
	OWNER TO rita;
ALTER TABLE ships_timetable
	OWNER TO rita;
ALTER TABLE owners
	OWNER TO rita;
ALTER TABLE prices
	OWNER TO rita;
ALTER TABLE seats
	OWNER TO rita;
ALTER TABLE routes
	OWNER TO rita;
ALTER TABLE book_seats_for_timetable
	OWNER TO rita;
	
/*
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "cities_id_seq" для колонки serial "cities.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "cities_pkey" для таблицы "cities"
ЗАМЕЧАНИЕ:  CREATE TABLE / UNIQUE создаст неявный индекс "cities_name_key" для таблицы "cities"
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "owners_id_seq" для колонки serial "owners.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "owners_pkey" для таблицы "owners"
ЗАМЕЧАНИЕ:  CREATE TABLE / UNIQUE создаст неявный индекс "owners_name_key" для таблицы "owners"
ЗАМЕЧАНИЕ:  CREATE TABLE / UNIQUE создаст неявный индекс "owners_phone_key" для таблицы "owners"
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "cruiseships_id_seq" для колонки serial "cruiseships.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "cruiseships_pkey" для таблицы "cruiseships"
ЗАМЕЧАНИЕ:  CREATE TABLE / UNIQUE создаст неявный индекс "cruiseships_name_key" для таблицы "cruiseships"
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "cabins_id_seq" для колонки serial "cabins.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "cabins_pkey" для таблицы "cabins"
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "seats_id_seq" для колонки serial "seats.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "seats_pkey" для таблицы "seats"
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "ships_timetable_id_seq" для колонки serial "ships_timetable.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "ships_timetable_pkey" для таблицы "ships_timetable"
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "routes_id_seq" для колонки serial "routes.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "routes_pkey" для таблицы "routes"
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "prices_id_seq" для колонки serial "prices.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "prices_pkey" для таблицы "prices"
ЗАМЕЧАНИЕ:  CREATE TABLE / UNIQUE создаст неявный индекс "prices_seat_id_route_id_key" для таблицы "prices"
ЗАМЕЧАНИЕ:  CREATE TABLE создаст последовательность "is_booked_seats_for_timetable_id_seq" для колонки serial "is_booked_seats_for_timetable.id"
ЗАМЕЧАНИЕ:  CREATE TABLE / PRIMARY KEY создаст неявный индекс "is_booked_seats_for_timetable_pkey" для таблицы "is_booked_seats_for_timetable"
ЗАМЕЧАНИЕ:  CREATE TABLE / UNIQUE создаст неявный индекс "is_booked_seats_for_timetable_seat_id_ships_timetable_id_key" для таблицы "is_booked_seats_for_timetable"
Запрос успешно выполнен без возвращаемых данных за 876 мс.
*/
