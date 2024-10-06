CREATE TABLE Discipline (
    discipline_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE PracticalWork (
    work_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    deadline DATE,
    discipline_id INT REFERENCES Discipline(discipline_id)
);

CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    "group" VARCHAR(50) NOT NULL
);

CREATE TABLE Instructor (
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE WorkAssignment (
    assignment_id SERIAL PRIMARY KEY,
    work_id INT NOT NULL REFERENCES PracticalWork(work_id),
    student_id INT NOT NULL REFERENCES Student(student_id),
    assigned_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    completion_date DATE
);

CREATE TABLE InstructorAssignment (
    instructor_assignment_id SERIAL PRIMARY KEY,
    instructor_id INT NOT NULL REFERENCES Instructor(instructor_id),
    work_id INT NOT NULL REFERENCES PracticalWork(work_id)
);

CREATE TABLE Step (
    step_id SERIAL PRIMARY KEY,
    work_id INT NOT NULL REFERENCES PracticalWork(work_id),
    step_number INT NOT NULL,
    description TEXT NOT NULL
); 

