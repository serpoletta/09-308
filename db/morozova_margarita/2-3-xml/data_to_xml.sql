copy 
	(SELECT query_to_xml('SELECT * 
	FROM 
	book_seats_for_timetable,cabins,cities',true,false,'') ) 
TO '/tmp/dataxml1.txt';
copy 
	(SELECT query_to_xml('SELECT * 
	FROM 
	cruiseships,owners,prices',true,false,'') ) 
TO '/tmp/dataxml2.txt';
copy 
	(SELECT query_to_xml('SELECT * 
	FROM 
	routes,seats,ships_timetable',true,false,'') ) 
TO '/tmp/dataxml3.txt';
