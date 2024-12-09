# Fundamentals of Database Engineering

## Testing databases performance optimization techniques


`docker exec -it postgres_big_test_db bash`

`psql -U postgres_big_test_db_user -d big_db`

`\timing on`

`create table temp(t int);`

`insert into temp2(t) select random()*100 from generate_series(0, 10);`

`CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 0)
);`

`INSERT INTO users (first_name, last_name, age)
SELECT
    'FirstName_' || trunc(random() * 1000) + 1,
    'LastName_' || trunc(random() * 1000) + 1,
    trunc(random() * 100)
FROM
    generate_series(1, 1000000);`

