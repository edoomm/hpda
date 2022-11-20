# SQL queries for creating and querying the star schema based on the OLAP model.

## Star schema SQL
```sql
CREATE TABLE area (
    id INT NOT NULL PRIMARY KEY,
    country VARCHAR,
    city VARCHAR
)

CREATE TABLE access_time (
    id INT NOT NULL PRIMARY KEY,
    access_date DATE,
    start_time TIMESTAMP,
    end_time TIMESTAMP
)

CREATE TABLE browser_user_agent (
    id INT NOT NULL PRIMARY KEY,
    user_agent VARCHAR
)

CREATE TABLE fact_user (
    ip_address INT NOT NULL UNIQUE,
    area_id INT FOREIGN KEY REFERENCES area(id),
    access_time_id INT FOREIGN KEY REFERENCES access_time(id),
    browser_user_agent_id INT FOREIGN KEY REFERENCES browser_user_agent(id)
)
```

## Retrieving the time spent on the website by users from a certain country within a specific month
```sql
SELECT CAST((JULIANDAY(F.end_time) - JULIANDAY(F.start_time)) * 24 * 60 As Integer) AS time_spent_in_minutes
FROM fact_user  F
INNER JOIN area                 A ON F.area_id = A.id
INNER JOIN access_time          T ON F.access_time_id = T.id
INNER JOIN browser_user_agent   B ON F.browser_user_agent_id = B.id
WHERE A.country = 'Germany' AND MONTH(T.access_date) = 11 -- Users from germany in november
```
