CREATE DATABASE university;

DROP TABLE IF EXISTS lessons;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS subjects;

CREATE TABLE groups (
	id serial PRIMARY KEY,
	name VARCHAR NOT NULL,
	entry_year SMALLINT NOT NULL
);

CREATE TABLE students (
	id serial PRIMARY KEY,
	name VARCHAR NOT NULL,
	surname VARCHAR NOT NULL,
	birthday DATE,
	phone VARCHAR(10) UNIQUE,
	group_id INTEGER REFERENCES groups(id)
);

CREATE TABLE professors (
	id serial PRIMARY KEY,
	name VARCHAR NOT NULL,
	surname VARCHAR NOT NULL,
	birthday DATE
);

CREATE TABLE subjects (
	id serial PRIMARY KEY,
	title VARCHAR NOT NULL
);

CREATE TABLE lessons (
	id serial PRIMARY KEY,
	professor_id INTEGER REFERENCES professors(id),
	group_id INTEGER REFERENCES groups(id),
	subject_id INTEGER REFERENCES subjects(id)
	day INTEGER NOT NULL,
	time TIME NOT NULL
);