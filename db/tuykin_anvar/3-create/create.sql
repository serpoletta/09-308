DROP TABLE IF EXISTS lessons;
DROP TABLE IF EXISTS lessons_time;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS professors;
DROP TABLE IF EXISTS subjects;

DROP TYPE TGENDER;
DROP TYPE TWEEKDAY;

CREATE TYPE TGENDER AS ENUM ('м', 'ж');
CREATE TYPE TWEEKDAY AS ENUM ('ПН','ВТ','СР','ЧТ','ПТ','СБ','ВС');

CREATE TABLE groups (
    id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    entry_year SMALLINT NOT NULL CHECK (entry_year BETWEEN 1800 AND 2100)
);

CREATE TABLE students (
    id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    middlename VARCHAR(50),
    birthday DATE,
    gender TGENDER NOT NULL,
    phone VARCHAR(11) UNIQUE,
    group_id INTEGER REFERENCES groups(id)
);

CREATE TABLE professors (
    id serial PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    middlename VARCHAR(50),
    birthday DATE,
    gender TGENDER NOT NULL
);

CREATE TABLE subjects (
    id serial PRIMARY KEY,
    title VARCHAR NOT NULL
);

CREATE TABLE lessons_time (
    id serial PRIMARY KEY,
    starts_at TIME NOT NULL,
    ends_at TIME NOT NULL,
    ordering SMALLINT,
    CHECK (starts_at < ends_at)
);

CREATE TABLE lessons (
    id serial PRIMARY KEY,
    professor_id INTEGER REFERENCES professors(id),
    group_id INTEGER REFERENCES groups(id),
    subject_id INTEGER REFERENCES subjects(id),
    weekday TWEEKDAY NOT NULL,
    -- week_parity: четность недели; 1: каждую неделю, 2: четные недели, 3: нечетные недели
    week_parity SMALLINT NOT NULL CHECK (week_parity BETWEEN 1 AND 3),
    lesson_time INTEGER REFERENCES lessons_time
);
