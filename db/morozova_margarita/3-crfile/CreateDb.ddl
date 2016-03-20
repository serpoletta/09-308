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
	seats_number integer,
	cruiseship_id integer references cruiseships(id) ON DELETE CASCADE
)
WITH (
	OIDS=FALSE
);

CREATE TABLE seats 
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

(
	id serial primary key,
	seat_id integer NOT NULL references seats(id) ON DELETE CASCADE,
	route_id integer NOT NULL references routes(id) ON DELETE CASCADE,
	price integer NULL CONSTRAINT positive_price CHECK(price>0),
	is_booked boolean NOT NULL DEFAULT false, 
	UNIQUE (seat_id,route_id)
)
WITH (
	OIDS=FALSE
);

CREATE TABLE book_seats_for_timetable

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

