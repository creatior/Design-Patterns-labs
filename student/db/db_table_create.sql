CREATE TABLE student (
    id serial PRIMARY KEY,
    first_name varchar(40) NOT NULL,
    surname varchar(40) NOT NULL,
    last_name varchar(40) NOT NULL,
    telegram varchar(40),
    email varchar(40),
    phone_number varchar(16),
    git varchar(40),
    birthdate DATE NOT NULL
);