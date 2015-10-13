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

2. 

3. NULL is not "equal to" NULL. (The null value represents an unknown value, and it is not known whether two unknown values are equal.) This behavior conforms to the SQL standard. - документация

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
	info character(500) DEFAULT 'Owner did not send anything',
	phone character(13) NOT NULL UNIQUE
)
WITH (
	OIDS=FALSE
);

CREATE TABLE cruiseships
(
	id serial primary key,
	name character(50) NOT NULL UNIQUE,
	owner_id integer references owners(id) ON DELETE RESTRICT
)
WITH (
	OIDS=FALSE
);

CREATE TABLE cabins
(
	id serial primary key,
	"number" character(5) NOT NULL,
	"class" character(7) NOT NULL,
	cruiseship_id integer references cruiseships(id) ON DELETE CASCADE
)
WITH (
	OIDS=FALSE
);

CREATE TABLE cruiseships_timetable
(
	id serial primary key,
	cruiseship_id integer NOT NULL references cruiseships(id) ON DELETE CASCADE,
	"date" date NOT NULL,
	city_id integer NOT NULL references cities(id)
	
)
WITH (
	OIDS=FALSE
);

CREATE TABLE routes
(
	id serial primary key,
	cruiseship_id integer NOT NULL references cruiseships(id) ON DELETE CASCADE,
	start_move_id integer NOT NULL references cruiseships_timetable(id) ON DELETE RESTRICT,
	end_move_id integer NOT NULL references cruiseships_timetable(id) ON DELETE RESTRICT,
	booked boolean NOT NULL DEFAULT false, /* Здесь при установке true нужно проверять, чтобы не было пересечения с другим route */
	CONSTRAINT ship_moving CHECK(start_move_id<>end_move_id)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE prices
(
	id serial primary key,
	cabin_id integer NOT NULL references cabins(id) ON DELETE CASCADE,
	route_id integer NOT NULL references routes(id) ON DELETE CASCADE,
	price integer NULL CONSTRAINT positive_price CHECK(price>0),
	UNIQUE (cabin_id,route_id)
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
ALTER TABLE cruiseships_timetable
	OWNER TO rita;
ALTER TABLE owners
	OWNER TO rita;
ALTER TABLE prices
	OWNER TO rita;
ALTER TABLE routes
	OWNER TO rita;
