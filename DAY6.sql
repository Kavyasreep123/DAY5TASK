CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT
);

-- Step 2: Create Marks Table
CREATE TABLE Marks (
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

INSERT INTO Students (student_id, student_name, age) VALUES
(1, 'Raju', 20),
(2, 'Jaggu', 22),
(3, 'Charlie', 21),
(4, 'Honey', 23);

INSERT INTO Marks (student_id, subject, marks) VALUES
(1, 'Math', 85),
(2, 'Math', 78),
(2, 'Science', 88),
(3, 'Math', 92),
(4, 'Science', 75);

SELECT student_id, student_name, age
FROM Students
WHERE age > (SELECT AVG(age) FROM Students);

SELECT student_name
FROM Students s
WHERE EXISTS (
    SELECT 1
    FROM Marks m
    WHERE m.student_id = s.student_id AND m.subject = 'Math' AND m.marks > 80
);

SELECT student_name
FROM Students
WHERE student_id IN (SELECT DISTINCT student_id FROM Marks);

SELECT student_name
FROM Students s
WHERE EXISTS (
    SELECT 1
    FROM Marks m
    WHERE m.student_id = s.student_id AND m.subject = 'Science'
);

SELECT student_name
FROM Students
WHERE student_id = (
    SELECT student_id
    FROM Marks
    WHERE subject = 'Math'
    ORDER BY marks DESC
    LIMIT 1
);
