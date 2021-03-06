DELETE FROM groups;
INSERT INTO groups (
            id, name, entry_year)
    VALUES
        (1, '09-308', 2013),
        (2, '09-306', 2013),
        (3, '09-307', 2013),
        (4, '09-309', 2013),
        (5, '09-410', 2014),
        (6, '09-411', 2014),
        (7, '09-412', 2014),
        (8, '09-409', 2014),
        (9, '09-511', 2015),
        (10, '09-510', 2015);

DELETE FROM students;
INSERT INTO students
    (id, name, surname, birthday, gender, phone, group_id)
VALUES
    (100,'Phelan','Durham','23/05/1998','м','79573024375',8),
    (101,'Hector','Mccarthy','07/10/1990','м','79776698916',9),
    (102,'Nell','Hobbs','18/10/1991','ж','79773829070',6),
    (103,'Aretha','Phillips','23/06/1997','ж','79771262366',10),
    (104,'Odette','Alford','22/11/1997','м','79879777682',6),
    (105,'Madeson','Keller','02/06/1995','м','79873250999',9),
    (106,'Elliott','Nielsen','24/02/1997','ж','79377425938',7),
    (107,'Cyrus','Clayton','20/12/1996','ж','79771780236',9),
    (108,'Ryder','Baldwin','12/08/1994','м','79675884914',4),
    (109,'Cally','Mendez','05/07/1997','м','79670986897',1),
    (110,'Yoshio','Hood','04/05/1993','ж','79274142159',2),
    (111,'Athena','Valdez','27/07/1997','ж','79774696098',4),
    (112,'Lucius','Carey','28/04/1997','м','79973219786',2),
    (113,'Fletcher','Brock','19/09/1990','м','79775538783',10),
    (114,'Leslie','Steele','26/06/1994','ж','79771084392',6),
    (115,'Allistair','Jimenez','10/05/1996','ж','79175447280',5),
    (116,'Ava','Winters','05/07/1994','м','79679084938',6),
    (117,'Risa','Norris','02/08/1996','м','79276380136',1),
    (118,'Scarlet','Rosales','21/08/1999','ж','79976609542',1),
    (119,'Nash','Whitfield','12/02/1993','ж','79773388122',10),
    (120,'Yardley','Howell','16/04/1993','м','79373521431',3),
    (121,'Skyler','Cohen','14/08/1993','м','79774275989',4),
    (122,'Karly','Knowles','02/10/1991','ж','79978120542',5),
    (123,'Marny','Espinoza','06/09/1995','ж','79572430811',10),
    (124,'Galena','Maldonado','16/05/1991','м','79878586130',1),
    (125,'Kirby','Perkins','10/05/1993','м','79879840400',8),
    (126,'Lee','Mckay','06/10/1993','ж','79877296968',7),
    (127,'Rhiannon','Farmer','07/12/1993','ж','79779514000',5),
    (128,'Aline','Dejesus','07/08/1997','м','79979042956',5),
    (129,'Kirk','Shannon','19/12/1997','м','79570401091',3),
    (130,'Scott','Wynn','28/12/1997','ж','79372139866',5),
    (131,'Tarik','Schroeder','05/08/1996','ж','79479033271',9),
    (132,'Donovan','Estrada','15/07/1994','м','79171773621',2),
    (133,'Murphy','Klein','28/08/1992','м','79277194308',5),
    (134,'Kelly','Ward','25/09/1991','ж','79579243488',2),
    (135,'Keiko','Nielsen','10/03/1991','ж','79470555422',6),
    (136,'Shoshana','Reeves','05/09/1991','м','79170049573',7),
    (137,'Maisie','Nguyen','17/08/1994','м','79273056529',9),
    (138,'Cheyenne','Dunlap','31/10/1996','ж','79471387535',5),
    (139,'Amy','Waller','07/08/1993','ж','79073403230',1),
    (140,'Lavinia','Rivera','05/04/1992','м','79875820144',5),
    (141,'Candice','Baldwin','19/04/1990','м','79574395624',5),
    (142,'Stone','Bright','18/07/1993','ж','79075529334',1),
    (143,'Ebony','King','05/10/1998','ж','79171624703',1),
    (144,'Rashad','Lawrence','06/03/1998','м','79078623579',8),
    (145,'Mira','Parsons','19/10/1995','м','79370772496',7),
    (146,'Cassidy','Mccray','18/05/1993','ж','79672522408',2),
    (147,'Kennan','Lewis','18/06/1994','ж','79871970917',2),
    (148,'Kermit','Tanner','21/12/1996','м','79975079827',2),
    (149,'Alma','Giles','10/03/1999','м','79972705064',5),
    (150,'Mariam','Hancock','14/01/1990','ж','79572106631',2),
    (151,'Althea','Barton','24/08/1992','ж','79275642187',10),
    (152,'Tara','Crosby','08/06/1997','м','79976172058',1),
    (153,'Elton','Carroll','10/10/1994','м','79975249123',1),
    (154,'Zephania','Rowland','05/09/1994','ж','79578620865',5),
    (155,'Emma','Wells','31/05/1991','ж','79270143415',6),
    (156,'Rhea','Vasquez','07/12/1994','м','79876681845',8),
    (157,'Julie','Wiggins','17/10/1994','м','79376371759',6),
    (158,'Evangeline','Doyle','18/06/1999','ж','79573450970',8),
    (159,'Amanda','Daniels','24/04/1999','ж','79472932147',10),
    (160,'Jennifer','Bauer','23/09/1993','м','79078954047',2),
    (161,'Emmanuel','Morin','16/09/1991','м','79677107357',8),
    (162,'Skyler','Mcintosh','07/11/1998','ж','79272319821',8),
    (163,'Autumn','Hoover','19/07/1995','ж','79179573910',10),
    (164,'Wing','Doyle','16/11/1989','м','79279894944',8),
    (165,'Denton','Boyle','27/07/1998','м','79879733630',7),
    (166,'Amethyst','Valdez','27/08/1993','ж','79474387896',10),
    (167,'Brynne','William','03/12/1993','ж','79178795590',9),
    (168,'Ayanna','Langley','29/06/1997','м','79779387827',8),
    (169,'Todd','Odonnell','24/11/1996','м','79572852978',2),
    (170,'Hannah','Marsh','22/12/1993','ж','79671556245',7),
    (171,'Maxine','Woods','04/10/1994','ж','79570547072',8),
    (172,'Sage','Lowe','24/09/1992','м','79877919128',1),
    (173,'Sade','Pope','09/05/1993','м','79374054862',5),
    (174,'Leroy','Houston','12/01/1998','ж','79273292858',2),
    (175,'Nathaniel','Riggs','30/03/1998','ж','79579078588',4),
    (176,'Tatyana','Obrien','29/09/1999','м','79270870974',3),
    (177,'Berk','Pollard','06/07/1996','м','79975051378',2),
    (178,'Lavinia','Wright','30/10/1992','ж','79977024809',2),
    (179,'Boris','Mejia','05/06/1994','ж','79679128108',10),
    (180,'Anjolie','Becker','23/08/1999','м','79076183220',5),
    (181,'Caesar','Weaver','17/12/1995','м','79871500516',7),
    (182,'Joseph','Franks','14/06/1997','ж','79972846138',3),
    (183,'Dieter','Ratliff','13/10/1990','ж','79173121070',5),
    (184,'Brenna','Rowe','28/12/1990','м','79772154901',9),
    (185,'Tallulah','Aguilar','29/09/1998','м','79871254096',10),
    (186,'Faith','Whitney','03/02/1996','ж','79779512451',9),
    (187,'Lucius','Rowland','14/01/1992','ж','79776276876',4),
    (188,'Carl','George','10/05/1998','м','79672957081',7),
    (189,'Jade','Wise','28/04/1991','м','79474615893',8),
    (190,'Mira','Frost','24/02/1992','ж','79175355511',7),
    (191,'Colby','Zamora','06/05/1991','ж','79779842905',4),
    (192,'Ahmed','Castaneda','07/04/1991','м','79475444515',5),
    (193,'Desiree','Heath','25/03/1991','м','79676946974',4),
    (194,'Mufutau','Bender','24/11/1993','ж','79474316356',8),
    (195,'Doris','Charles','17/03/1990','ж','79574359712',5),
    (196,'Uma','Gilmore','09/05/1996','м','79475513029',1),
    (197,'Cadman','Olson','31/01/1991','м','79272633587',8),
    (198,'Darrel','Rush','30/11/1990','ж','79377218649',10),
    (199,'Breanna','Sexton','10/04/1999','ж','79076294722',7);


DELETE FROM professors;
INSERT INTO professors
    (id, name, surname, birthday, gender)
VALUES
    (201,'August','Hood','19/09/1953','м'),
    (202,'Nero','Strickland','10/03/1969','м'),
    (203,'Rinah','Cash','10/11/1974','м'),
    (204,'Keiko','Rodgers','15/12/1968','м'),
    (205,'Cameron','Campbell','22/07/1975','м'),
    (206,'Barry','Buck','21/04/1964','м'),
    (207,'Ray','Flowers','22/10/1958','м'),
    (208,'Ruby','Garza','04/02/1958','м'),
    (209,'Alexis','Hood','11/01/1955','м'),
    (210,'Asher','Cain','09/12/1969','м'),
    (211,'Kameko','Albert','05/07/1968','м'),
    (212,'Ezekiel','Benson','23/07/1955','м'),
    (213,'Steel','Wilder','26/04/1966','м'),
    (214,'Benedict','Vasquez','14/11/1961','м'),
    (215,'Stephanie','Middleton','15/08/1952','м'),
    (216,'Berk','Sweeney','26/09/1982','м'),
    (217,'Vivian','Mcmahon','08/04/1986','м'),
    (218,'Shannon','Chaney','21/01/1951','м'),
    (219,'Victoria','Wynn','21/04/1982','м'),
    (220,'Jordan','Fletcher','22/02/1989','м'),
    (221,'Kasper','Estrada','17/01/1970','ж'),
    (222,'Courtney','Lawson','04/04/1955','ж'),
    (223,'Noelani','Spence','03/10/1968','ж'),
    (224,'Kathleen','Davidson','08/11/1989','ж'),
    (225,'Pamela','Larson','12/03/1957','ж'),
    (226,'Nomlanga','Avila','02/08/1966','ж'),
    (227,'Emerson','Munoz','22/12/1957','ж'),
    (228,'Camille','Hinton','11/12/1956','ж'),
    (229,'Igor','Welch','28/08/1973','ж'),
    (230,'Bevis','Montoya','21/06/1955','ж'),
    (231,'Elvis','Wooten','16/03/1955','ж'),
    (232,'Avram','Barrera','05/05/1965','ж'),
    (233,'Colton','Simpson','18/02/1963','ж'),
    (234,'Farrah','Pitts','25/11/1986','ж'),
    (235,'Moana','Woodward','13/10/1961','ж'),
    (236,'Molly','Winters','12/11/1984','ж'),
    (237,'Paul','Obrien','20/12/1985','ж'),
    (238,'Minerva','Oneal','20/11/1968','ж'),
    (239,'Wallace','Wilkerson','16/10/1988','ж'),
    (240,'Guinevere','Burgess','23/03/1981','ж'),
    (241,'Curran','Lloyd','25/09/1965','м'),
    (242,'Deanna','Hull','14/04/1953','м'),
    (243,'Gavin','Baird','21/08/1978','м'),
    (244,'Deborah','Benson','22/01/1951','м'),
    (245,'Jasper','Montoya','18/01/1982','м'),
    (246,'Ila','Lambert','23/07/1984','м'),
    (247,'Eric','Clayton','01/07/1971','м'),
    (248,'Ignacia','Ochoa','20/10/1972','м'),
    (249,'Hiram','Norris','13/08/1978','м'),
    (250,'Simon','Daniel','17/08/1953','м'),
    (251,'Ivory','Shepherd','22/05/1964','м'),
    (252,'Damian','Conway','14/02/1990','м'),
    (253,'Donovan','Fitzpatrick','10/01/1985','м'),
    (254,'Priscilla','Atkins','01/08/1983','м'),
    (255,'Carissa','Carroll','12/03/1980','м'),
    (256,'Garrett','Richard','08/11/1987','м'),
    (257,'MacKenzie','Levine','09/10/1956','м'),
    (258,'Hillary','Bowen','10/04/1983','м'),
    (259,'Keiko','Garcia','17/07/1969','м'),
    (260,'Lois','Mccullough','22/04/1980','м'),
    (261,'Lacota','Copeland','03/02/1989','ж'),
    (262,'Cole','Clay','01/02/1968','ж'),
    (263,'Kevin','Hawkins','28/11/1975','ж'),
    (264,'Zoe','Snow','17/09/1987','ж'),
    (265,'Naida','Collier','14/12/1959','ж'),
    (266,'Zachery','Brewer','23/10/1988','ж'),
    (267,'Clinton','Gibbs','27/03/1954','ж'),
    (268,'Kiayada','Wheeler','11/09/1968','ж'),
    (269,'Addison','Kelly','17/08/1975','ж'),
    (270,'Tasha','Macias','21/05/1985','ж'),
    (271,'Clementine','Grant','08/02/1988','ж'),
    (272,'Unity','Carey','05/03/1979','ж'),
    (273,'Britanney','Hubbard','03/06/1963','ж'),
    (274,'Latifah','Olsen','14/06/1954','ж'),
    (275,'Mechelle','Whitfield','29/07/1965','ж'),
    (276,'Rose','Battle','13/04/1965','ж'),
    (277,'Lisandra','Mcdonald','14/01/1968','ж'),
    (278,'Chanda','Hickman','20/12/1970','ж'),
    (279,'Cyrus','Ewing','17/12/1985','ж'),
    (280,'Michael','Ferrell','16/07/1960','ж'),
    (281,'Stuart','Whitney','25/02/1953','м'),
    (282,'Brooke','Todd','27/11/1951','м'),
    (283,'Cecilia','Terry','19/06/1971','м'),
    (284,'Bert','Smith','26/03/1958','м'),
    (285,'Lamar','Bullock','04/03/1951','м'),
    (286,'Seth','Reynolds','21/07/1971','м'),
    (287,'Barry','Jefferson','30/01/1962','м'),
    (288,'Bethany','Gonzalez','27/08/1966','м'),
    (289,'Illana','Cardenas','20/08/1963','м'),
    (290,'Silas','Hoover','05/01/1990','м'),
    (291,'Silas','Hines','29/04/1956','м'),
    (292,'Branden','Acevedo','25/04/1954','м'),
    (293,'Ramona','Winters','13/07/1968','м'),
    (294,'Petra','Campos','01/03/1954','м'),
    (295,'Garrett','Merrill','22/10/1985','м'),
    (296,'Jolene','Reeves','31/07/1969','м'),
    (297,'Herman','James','10/01/1962','м'),
    (298,'Joseph','Tucker','27/05/1986','м'),
    (299,'Emmanuel','Boyer','25/01/1982','м'),
    (300,'Nero','Butler','21/09/1959','м');

DELETE FROM subjects;
INSERT INTO subjects
    (id, title)
VALUES
    (1, 'Базы Данных'),
    (2, 'Мат. анализ'),
    (3, 'Экономика'),
    (4, 'Культурология'),
    (5, 'Дискретная математика'),
    (6, 'Алгоритмы и Структуры Данных'),
    (7, 'Спецификации программных систем'),
    (8, 'ОБЖ'),
    (9, 'ООП'),
    (10, 'Управление ИТ-проектами');

DELETE FROM lessons_time;
INSERT INTO lessons_time
    (id, starts_at, ends_at, ordering)
VALUES
    (1, '8:30', '10:00', 1),
    (2, '10:10', '11:40', 2),
    (3, '11:50', '13:20', 3),
    (4, '13:35', '15:05', 4),
    (5, '15:20', '16:50', 5),
    (6, '17:00', '18:30', 6),
    (7, '18:40', '20:10', 7);