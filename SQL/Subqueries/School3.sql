/*

**Scenario:** The school principal wants to award the students 
with the most improved grades within each subject. 
They define the "most improved" as the student who has had 
the greatest positive difference between their first and last 
recorded grades. Along with the student's name, they also want 
to know the teacher of the subject, and the amount of improvement 
the student has made.


**Teachers:**

| TeacherID | TeacherName |
|-----------|-------------|
| 1         | Mr. Smith   |
| 2         | Mrs. Johnson|
| 3         | Dr. Miller  |
| 4         | Mr. Brown   |

**Subjects:**

| SubjectID | SubjectName | TeacherID |
|-----------|-------------|-----------|
| 1         | Math        | 1         |
| 2         | History     | 2         |
| 3         | Chemistry   | 3         |
| 4         | English     | 4         |

**Students:**

| StudentID | StudentName |
|-----------|-------------|
| 1         | Amy         |
| 2         | Jake        |
| 3         | Lily        |
| 4         | Max         |

**Grades:**

| GradeID | Grade | StudentID | SubjectID | DateOfGrade |
|---------|-------|-----------|-----------|-------------|
| 1       | 85    | 1         | 1         | 2023-01-01  |
| 2       | 95    | 1         | 1         | 2023-06-01  |
| 3       | 80    | 2         | 2         | 2023-02-01  |
| 4       | 92    | 2         | 2         | 2023-05-01  |
| 5       | 75    | 3         | 3         | 2023-03-01  |
| 6       | 88    | 3         | 3         | 2023-06-01  |
| 7       | 80    | 4         | 4         | 2023-04-01  |
| 8       | 89    | 4         | 4         | 2023-06-01  |

**Scenario:** The school principal wants to award the students 
with the most improved grades within each subject. 
They define the "most improved" as the student who has had 
the greatest positive difference between their first and last 
recorded grades. Along with the student's name, they also want 
to know the teacher of the subject, and the amount of improvement 
the student has made.

This problem is slightly more challenging as it requires 
you to use aggregate functions like MIN and MAX in 
combination with the DATE type. 


student name, teacher of subject, amount improved

sq1 
*/

SELECT sq1.SubjectName, sq1.TeacherName, sq1.StudentName, (sq2.MaxGrade - sq1.MinGrade) AS Improvement
FROM
(
    SELECT s.SubjectName, t.TeacherName, st.StudentName, g.Grade as MinGrade
    FROM Grades g
    INNER JOIN (SELECT StudentID, SubjectID, MIN(DateOfGrade) as MinDate FROM Grades GROUP BY StudentID, SubjectID) g1 
      ON g.StudentID = g1.StudentID AND g.SubjectID = g1.SubjectID AND g.DateOfGrade = g1.MinDate
    INNER JOIN Subjects s ON g.SubjectID = s.SubjectID
    INNER JOIN Teachers t ON s.TeacherID = t.TeacherID
    INNER JOIN Students st ON g.StudentID = st.StudentID
) AS sq1
INNER JOIN
(
    SELECT s.SubjectName, t.TeacherName, st.StudentName, g.Grade as MaxGrade
    FROM Grades g
    INNER JOIN (SELECT StudentID, SubjectID, MAX(DateOfGrade) as MaxDate FROM Grades GROUP BY StudentID, SubjectID) g2 
      ON g.StudentID = g2.StudentID AND g.SubjectID = g2.SubjectID AND g.DateOfGrade = g2.MaxDate
    INNER JOIN Subjects s ON g.SubjectID = s.SubjectID
    INNER JOIN Teachers t ON s.TeacherID = t.TeacherID
    INNER JOIN Students st ON g.StudentID = st.StudentID
) AS sq2
ON sq1.SubjectName = sq2.SubjectName AND sq1.StudentName = sq2.StudentName
ORDER BY Improvement DESC

/*
COMMENTARY
This is a self-join operation. In SQL, a self-join is a regular join operation where 
a table is joined with itself. We often perform self-joins to compare 
values in a column with other values in the same column, in the same table.

In this case, we create a derived table (g1) from the Grades table that 
contains the earliest DateOfGrade (MinDate) for each StudentID and SubjectID 
combination.

We then join the original Grades table (g) with this derived table (g1) 
on three conditions:

g.StudentID = g1.StudentID — Match rows where the StudentID in the 
original table matches the StudentID in the derived table.
g.SubjectID = g1.SubjectID — Match rows where the SubjectID in the 
original table matches the SubjectID in the derived table.
g.DateOfGrade = g1.MinDate — Match rows where the DateOfGrade in the 
original table matches the MinDate in the derived table.

This combination of conditions will effectively return the rows in the 
Grades table where the DateOfGrade is the earliest date for 
each StudentID and SubjectID combination, 
hence representing the first grade recorded for each student in each subject.



*/