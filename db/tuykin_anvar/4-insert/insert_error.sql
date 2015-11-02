CREATE TABLE test (
	test integer unique
);

CREATE TABLE test2 (
	pk INTEGER PRIMARY KEY
);

CREATE TABLE products (
	id INTEGER PRIMARY KEY,
	series CHARACTER VARYING NOT NULL,
	number VARCHAR NOT NULL,
	UNIQUE (series, number) 
);

-- сколько строк будет в таблице? Почему?
INSERT INTO test VALUES(null);
INSERT INTO test VALUES(null);

-- можем ли мы вставлять PK не по порядку? Каков будет результат? Сколько записей будет в таблице?
INSERT INTO test2 VALUES(1);
INSERT INTO test2 VALUES(9);
INSERT INTO test2 VALUES(5);

-- каков будет результат? (предпологаем, что до этого был выполнен предыдущий запрос)
DELETE FROM test2 WHERE pk = 100;

-- каков будет результат?
DELETE FROM test2;

-- сколько строк будет в таблице? Почему?
INSERT INTO products VALUES (1, '10', '10');
INSERT INTO products VALUES (2, '10', '10');
INSERT INTO products VALUES (NULL, '10', '20');
INSERT INTO products VALUES (2, '10', '20');
INSERT INTO products VALUES (3, '20', '10');
INSERT INTO products VALUES (4, '10', '20');

-- В каком порядке должны быть указаны данные при использовании команды insert?
