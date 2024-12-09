

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 0)
);


-- 100 millions 
EXPLAIN INSERT INTO users (first_name, last_name, age)
SELECT
    'FirstName_' || trunc(random() * 1000) + 1,
    'LastName_' || trunc(random() * 100000) + 1,
    trunc(random() * 100)
FROM
    generate_series(1, 5000000);



TRUNCATE TABLE users;


EXPLAIN SELECT * FROM users WHERE last_name = 'LastName_587' LIMIT 10;


-- Generated table with 5M records.
-- Test #1
-- Find user with specific first_name

EXPLAIN SELECT * FROM users WHERE first_name = 'FirstName_492';
SELECT * FROM users WHERE first_name = 'FirstName_492'; -- 4.9s
SELECT * FROM users WHERE last_name = 'LastName_19905'; --4.8s
select count(*) from users; -- 4.4s
SELECT * from users WHERE age = 10; -- 4.6s

EXPLAIN SELECT * from users WHERE first_name = 'FirstName_492' AND last_name = 'LastName_19905'; -- 4.3s
SELECT * from users WHERE last_name = 'LastName_19905' AND first_name = 'FirstName_492'; --4.2s


SELECT count(*) from users WHERE first_name = 'FirstName_492'; -- 4.7s; 10008 rows;
SELECT count(*) from users WHERE last_name = 'LastName_18905'; -- 4.3s; 100 rows;
SELECT count(*) from users WHERE age = 10; -- 4.1s; 100110 rows;

SELECT * from users WHERE id = 1000000; -- 8ms
EXPLAIN ANAlYZE SELECT * from users WHERE id = 1000800;


CREATE INDEX first_name_idx ON users(first_name);




