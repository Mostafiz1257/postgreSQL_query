create table students (
    student_id serial PRIMARY KEY,
    student_name varchar(50) not null,
    age INTEGER not null,
    email VARCHAR(50) UNIQUE not null,
    frontend_mark INTEGER not null,
    backend_mark INTEGER not null,
    "status" varchar(50)
);

INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        "status"
    )
VALUES (
        'Alice Johnson',
        20,
        'alice.johnson@example.com',
        85,
        90,
        'Passed'
    ),
    (
        'Bob Smith',
        22,
        'bob.smith@example.com',
        75,
        80,
        'Passed'
    ),
    (
        'Charlie Brown',
        21,
        'charlie.brown@example.com',
        40,
        50,
        'Fail'
    ),
    (
        'Diana Prince',
        23,
        'diana.prince@gmail.com',
        95,
        88,
        NULL
    ),
    (
        'Ethan Hunt',
        24,
        'ethan.hunt@example.com',
        65,
        70,
        'Passed'
    );

SELECT * from students;

create Table courses (
    course_id serial PRIMARY key,
    course_name varchar(50),
    credits int
);

insert into
    courses (course_name, credits)
VALUES ('Next js', 3),
    ('React js', 4),
    ('Database', 3),
    ('Prisma', 3);

SELECT * from courses;

create table enrollment (
    enrollment_id SERIAL PRIMARY key,
    student_id int not null,
    course_id int not NULL,
    FOREIGN key (student_id) REFERENCES students (student_id),
    FOREIGN key (course_id) REFERENCES courses (course_id)
);

insert into
    enrollment (student_id, course_id)
VALUES (1, 1),
    (1, 2),
    (2, 3),
    (2, 1),
    (3, 3),
    (4, 2);

select * from enrollment;

/ / Query_1

INSERT into
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        "status"
    )
VALUES (
        'Mostafiz',
        25,
        'mostafiz@gmail.com',
        55,
        70,
        NULL
    ) / / query_2

select student_name
from
    students
    join enrollment using (student_id)
    join courses using (course_id)
where
    courses.course_name = 'Next js';

/ / Query_3

update students
set
    "status" = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
        SELECT max(frontend_mark + backend_mark)
        from students
    );

/ / query_4

DELETE FROM courses
WHERE
    course_id NOT IN (
        SELECT DISTINCT
            course_id
        FROM enrollment
    );

/ / query_5

SELECT student_name from students limit 2 offset 2;

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM courses c
    LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY
    c.course_id,
    c.course_name;


    SELECT Round(avg(age),2) from students;

    SELECT student_name
FROM students
WHERE email LIKE '%example.com%';
