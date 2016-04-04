COPY (SELECT row_to_json(c) 
	FROM ( select * from cities ) c)
TO '/tmp/cities.txt';

-- Можно еще так, но результат менее красивый
--select array_to_json(array_agg(cities)) from cities;
