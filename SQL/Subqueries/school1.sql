/*

**Students**
```
| StudentID | StudentName |
|-----------|-------------|
| 1         | Alice       |
| 2         | Bob         |
| 3         | Charlie     |
| 4         | David       |
```

**Subjects**
```
| SubjectID | SubjectName | TeacherID |
|-----------|-------------|-----------|
| 1         | Math        | 1         |
| 2         | English     | 2         |
| 3         | History     | 3         |
| 4         | Science     | 4         |
```

**Teachers**
```
| TeacherID | TeacherName |
|-----------|-------------|
| 1         | Mr. Smith   |
| 2         | Ms. Johnson |
| 3         | Mrs. Lee    |
| 4         | Mr. Walker  |
```

**Grades**
```
| GradeID | SubjectID | StudentID | Grade |
|---------|-----------|-----------|-------|
| 1       | 1         | 1         | 95    |
| 2       | 1         | 2         | 85    |
| 3       | 2         | 1         | 80    |
| 4       | 2         | 3         | 90    |
| 5       | 3         | 4         | 70    |
| 6       | 3         | 2         | 85    |
| 7       | 4         | 4         | 100   |
| 8       | 4         | 3         | 75    |
```

Determine the top scoring student for each subject and also find out the 
teacher teaching the subject.
*/

SELECT sq1.SubjectName, sq1.TopGrade, sq2.StudentName, sq2.TeacherName
    FROM (
        SELECT s.SubjectName, MAX(g.Grade) AS TopGrade 
        FROM Grades g 
        INNER JOIN Subjects S ON g.SubjectName = s.SubjectName
        GROUP BY s.SubjectName
    ) AS sq1 
    INNER JOIN 
    (
        SELECT s.SubjectName, t.TeacherName, st.StudentName, MAX(g.Grade) AS MaxGrade
        FROM Subjects s 
        INNER JOIN Grades g ON g.SubjectName = s.SubjectName 
        INNER JOIN Teachers t ON t.TeacherID = s.TeacherID 
        INNER JOIN Students st ON g.StudentID = st.StudentID
        GROUP BY s.SubjectName, t.TeacherName, st.StudentName
    ) AS sq2 
    ON sq1.StudentName = sq2.StudentName, sq1.TopGrade = sq2.MaxGrade
    ORDER BY sq1.TopGrade DESC

/*
COMMENTARY
Finally, when joining sq1 and sq2 on both SubjectName and the maximum grade, 
it does match the highest grade for each subject from sq1 with the student 
who has the same grade in sq2. In other words, for each subject, it finds 
the student who has the maximum grade (which is the same as the maximum grade 
for the subject), and lists that student along with the teacher of the subject.
*/
