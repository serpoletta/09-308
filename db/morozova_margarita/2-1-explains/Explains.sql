-- Вывод получился следующий: при сильно разделенной базе эффективность запросов не очень, если с этим отдельно не поработать.
-- Возможно, и данные следовало организовать как-то иначе?
-- 
-- Таинственное (never executed).

-- Расписание движения теплохода с id=1

SELECT start_date, end_date, ci1.name, ci2.name
FROM ships_timetable, cities as ci1, cities as ci2
WHERE ships_timetable.cruiseship_id=1 AND start_city_id=ci1.id AND end_city_id=ci2.id;

"Hash Join  (cost=43.83..58.59 rows=8 width=416) (actual time=10.489..10.489 rows=0 loops=1)"
"  Hash Cond: (ci2.id = ships_timetable.end_city_id)"
"  ->  Seq Scan on cities ci2  (cost=0.00..13.40 rows=340 width=208) (actual time=10.385..10.385 rows=1 loops=1)"
"  ->  Hash  (cost=43.73..43.73 rows=8 width=216) (actual time=0.022..0.022 rows=0 loops=1)"
"        Buckets: 1024  Batches: 1  Memory Usage: 0kB"
"        ->  Hash Join  (cost=28.98..43.73 rows=8 width=216) (actual time=0.020..0.020 rows=0 loops=1)"
"              Hash Cond: (ci1.id = ships_timetable.start_city_id)"
"              ->  Seq Scan on cities ci1  (cost=0.00..13.40 rows=340 width=208) (actual time=0.003..0.003 rows=1 loops=1)"
"              ->  Hash  (cost=28.88..28.88 rows=8 width=16) (actual time=0.003..0.003 rows=0 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 0kB"
"                    ->  Seq Scan on ships_timetable  (cost=0.00..28.88 rows=8 width=16) (actual time=0.001..0.001 rows=0 loops=1)"
"                          Filter: (cruiseship_id = 1)"
"Total runtime: 10.587 ms"


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

"Hash Join  (cost=182.20..282.91 rows=1770 width=624) (actual time=0.016..0.016 rows=0 loops=1)"
"  Hash Cond: (routes.start_move_id = sh1.id)"
"  ->  Hash Join  (cost=99.81..176.19 rows=1770 width=420) (never executed)"
"        Hash Cond: (routes.cruiseship_id = cruiseships.id)"
"        ->  Hash Join  (cost=82.39..134.43 rows=1770 width=220) (never executed)"
"              Hash Cond: (routes.end_move_id = sh2.id)"
"              ->  Seq Scan on routes  (cost=0.00..27.70 rows=1770 width=16) (never executed)"
"              ->  Hash  (cost=63.51..63.51 rows=1510 width=212) (never executed)"
"                    ->  Hash Join  (cost=17.65..63.51 rows=1510 width=212) (never executed)"
"                          Hash Cond: (sh2.end_city_id = ci2.id)"
"                          ->  Seq Scan on ships_timetable sh2  (cost=0.00..25.10 rows=1510 width=12) (never executed)"
"                          ->  Hash  (cost=13.40..13.40 rows=340 width=208) (never executed)"
"                                ->  Seq Scan on cities ci2  (cost=0.00..13.40 rows=340 width=208) (never executed)"
"        ->  Hash  (cost=13.30..13.30 rows=330 width=208) (never executed)"
"              ->  Seq Scan on cruiseships  (cost=0.00..13.30 rows=330 width=208) (never executed)"
"  ->  Hash  (cost=63.51..63.51 rows=1510 width=212) (actual time=0.003..0.003 rows=0 loops=1)"
"        Buckets: 1024  Batches: 1  Memory Usage: 0kB"
"        ->  Hash Join  (cost=17.65..63.51 rows=1510 width=212) (actual time=0.002..0.002 rows=0 loops=1)"
"              Hash Cond: (sh1.start_city_id = ci1.id)"
"              ->  Seq Scan on ships_timetable sh1  (cost=0.00..25.10 rows=1510 width=12) (actual time=0.002..0.002 rows=0 loops=1)"
"              ->  Hash  (cost=13.40..13.40 rows=340 width=208) (never executed)"
"                    ->  Seq Scan on cities ci1  (cost=0.00..13.40 rows=340 width=208) (never executed)"
"Total runtime: 0.144 ms"


-- Количество внесенных мест для каюты с id=5
SELECT count(seats.id)
FROM seats
WHERE seats.cabin_id=5
GROUP BY seats.cabin_id;

"GroupAggregate  (cost=0.00..36.83 rows=2 width=8) (actual time=0.005..0.005 rows=0 loops=1)"
"  ->  Seq Scan on seats  (cost=0.00..36.75 rows=11 width=8) (actual time=0.002..0.002 rows=0 loops=1)"
"        Filter: (cabin_id = 5)"
"Total runtime: 0.118 ms"


-- Количество мест в каюте с id=5
SELECT c.seats_number 
FROM cabins c;
"Seq Scan on cabins c  (cost=0.00..18.30 rows=830 width=4) (actual time=0.001..0.001 rows=0 loops=1)"
"Total runtime: 0.026 ms"

-- Все круизы туроператора с id=2

SELECT cruiseships.name, start_date, start_city, end_date, end_city
FROM cruiseships JOIN cruises ON cruiseship_id=cruiseships.id
WHERE owner_id=2;

"Nested Loop  (cost=26.71..74.73 rows=11 width=620) (actual time=0.005..0.005 rows=0 loops=1)"
"  ->  Nested Loop  (cost=26.71..71.30 rows=11 width=420) (actual time=0.004..0.004 rows=0 loops=1)"
"        ->  Nested Loop  (cost=26.71..67.87 rows=11 width=220) (actual time=0.004..0.004 rows=0 loops=1)"
"              ->  Nested Loop  (cost=26.71..64.51 rows=11 width=216) (actual time=0.003..0.003 rows=0 loops=1)"
"                    ->  Hash Join  (cost=26.71..61.16 rows=11 width=212) (actual time=0.003..0.003 rows=0 loops=1)"
"                          Hash Cond: (routes.cruiseship_id = public.cruiseships.id)"
"                          ->  Seq Scan on routes  (cost=0.00..27.70 rows=1770 width=12) (actual time=0.001..0.001 rows=0 loops=1)"
"                          ->  Hash  (cost=26.69..26.69 rows=2 width=212) (never executed)"
"                                ->  Nested Loop  (cost=0.00..26.69 rows=2 width=212) (never executed)"
"                                      ->  Seq Scan on cruiseships  (cost=0.00..14.12 rows=2 width=208) (never executed)"
"                                            Filter: (owner_id = 2)"
"                                      ->  Index Scan using cruiseships_pkey on cruiseships  (cost=0.00..6.27 rows=1 width=4) (never executed)"
"                                            Index Cond: (id = public.cruiseships.id)"
"                    ->  Index Scan using ships_timetable_pkey on ships_timetable sh1  (cost=0.00..0.29 rows=1 width=12) (never executed)"
"                          Index Cond: (id = routes.start_move_id)"
"              ->  Index Scan using ships_timetable_pkey on ships_timetable sh2  (cost=0.00..0.29 rows=1 width=12) (never executed)"
"                    Index Cond: (id = routes.end_move_id)"
"        ->  Index Scan using cities_pkey on cities ci1  (cost=0.00..0.30 rows=1 width=208) (never executed)"
"              Index Cond: (id = sh1.start_city_id)"
"  ->  Index Scan using cities_pkey on cities ci2  (cost=0.00..0.30 rows=1 width=208) (never executed)"
"        Index Cond: (id = sh2.end_city_id)"
"Total runtime: 0.187 ms"

PS
alter table ships_timetable add column start jsonb;
