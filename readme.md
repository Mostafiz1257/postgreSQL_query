1. What is PostgreSQL?
PostgreSQL is an open-source relational database management system (RDBMS) that supports SQL for querying and maintains strong compliance with ACID (Atomicity, Consistency, Isolation, Durability) properties. It is known for its advanced features, including support for complex queries, transactions, and extensibility (e.g., custom data types, functions, and operators).

2. What is the purpose of a database schema in PostgreSQL?
In PostgreSQL, a schema is a way to logically organize database objects like tables, views, functions, and indexes. It helps to manage and structure data within a database, providing namespaces that prevent name conflicts and making it easier to control access and permissions. A schema is useful for grouping related objects and can help in organizing large databases.

3. Explain the primary key and foreign key concepts in PostgreSQL.
Primary Key: A primary key is a unique identifier for each record in a table. It ensures that each row has a unique value for that key and that it is not NULL. Each table can only have one primary key, and it often involves one or more columns.

sql
Copy code
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100)
);
Foreign Key: A foreign key is a column or a set of columns in one table that refers to the primary key of another table. It establishes a relationship between the two tables and enforces referential integrity (i.e., ensuring that records in one table correspond to valid records in another).

sql
Copy code
CREATE TABLE enrollment (
  enrollment_id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(student_id)
);
4. What is the difference between the VARCHAR and CHAR data types?
VARCHAR: Stands for "variable character" and stores variable-length strings. It only uses the space needed for the actual content and is more flexible when dealing with strings of varying lengths.
CHAR: Stands for "character" and stores fixed-length strings. If the string is shorter than the defined length, the remaining space is filled with padding (spaces).
sql
Copy code
CREATE TABLE users (
  name VARCHAR(50),  -- Variable-length string
  code CHAR(5)       -- Fixed-length string (padded with spaces if shorter)
);
5. Explain the purpose of the WHERE clause in a SELECT statement.
The WHERE clause is used to filter records from the database that meet a specified condition. It is crucial for querying subsets of data based on certain criteria.

sql
Copy code
SELECT * FROM students WHERE age > 20;
6. What are the LIMIT and OFFSET clauses used for?
LIMIT: Restricts the number of rows returned by a query.
OFFSET: Skips a specified number of rows before starting to return the result set. It is often used with LIMIT for pagination.
sql
Copy code
SELECT * FROM students LIMIT 5 OFFSET 10;
7. How can you perform data modification using UPDATE statements?
The UPDATE statement is used to modify existing records in a table. You specify the table, columns to be updated, and the condition under which the update occurs.

sql
Copy code
UPDATE students
SET age = 21
WHERE student_id = 1;
8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
A JOIN operation combines rows from two or more tables based on a related column. It's used to retrieve data from multiple tables in a single query. Types of joins include:

INNER JOIN: Returns rows when there is a match in both tables.
LEFT JOIN: Returns all rows from the left table, and matched rows from the right table (nulls for non-matches).
RIGHT JOIN: Returns all rows from the right table, and matched rows from the left table (nulls for non-matches).
FULL OUTER JOIN: Returns all rows when there is a match in either the left or right table.
sql
Copy code
SELECT students.student_name, courses.course_name
FROM students
INNER JOIN enrollment ON students.student_id = enrollment.student_id
INNER JOIN courses ON enrollment.course_id = courses.course_id;
9. Explain the GROUP BY clause and its role in aggregation operations.
The GROUP BY clause is used to group rows that share a common property so that aggregate functions like COUNT, SUM, AVG, etc., can be applied to each group.

sql
Copy code
SELECT course_id, COUNT(student_id) AS num_students
FROM enrollment
GROUP BY course_id;
10. How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?
Aggregate functions are used to perform calculations on a set of values. Examples include:

COUNT: Counts the number of rows or non-NULL values.
SUM: Adds up the values in a numeric column.
AVG: Computes the average of numeric values.
sql
Copy code
SELECT COUNT(*) FROM students;
SELECT SUM(frontend_mark) FROM students;
SELECT AVG(age) FROM students;