DROP TABLE IF EXISTS salaries;

CREATE TABLE IF NOT EXISTS salaries (
    id INT,
    name VARCHAR(20),
    city VARCHAR(20),
    dept VARCHAR(20),
    salary FLOAT
);