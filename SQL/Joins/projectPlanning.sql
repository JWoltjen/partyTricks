/*
You are given a table, Projects, containing three columns: 
Task_ID, Start_Date and End_Date. It is guaranteed that the 
difference between the End_Date and the Start_Date is equal to 1 day 
for each row in the table.

If the End_Date of the tasks are consecutive, then they are part of the same project.
Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number 
of days it took to complete the project in ascending order. 
If there is more than one project that have the same number of completion days, 
then order by the start date of the project.

*/



/*
COMMENTARY
I followed along with this youtube video. https://www.youtube.com/watch?v=EMFtSduFVL0
The following stood out to me:

1. He carefully and calmly read the problem for 8 minutes before even attempting to query
2. First he did an incomplete query to list all the projects 
    (where start_date NOT IN(SELECT End_Date from Projects))
3. Next, he grabbed all the end_dates with the same condition with the variables reversed
    (where end_date NOT IN SELECT(Start_Date FROM Projects))
4. Next, he made a temporary table using WITH, and made columns for start end and
    using the two query fragments from steps 2 and 3.
5. He made a cartesian table Select * From Project_Start_Date, Project_End_Date,
6. He uses the RANK function with the With_Project_Start_Date
    RANK() OVER (Order by Start_Date) as Rank_Start
7. He repeated the process in the End_Date table.
8. Finally, he used the DATEDIFF Function to order the results
*/

With Project_Start_Date as(
    SELECT
            Start_Date,
            Rank() OVER (ORDER BY Start_Date) as Rank_Start
    FROM    Projects 
    WHERE   Start_Date NOT IN(Select End_Date FROM PRojects)
),

Project_End_Date as (
    SELECT
            End_Date,
            RANK() OVER (ORDER BY End_Date) as Rank_End
    FROM    Projects
    WHERE  End_Dated NOT IN(Select Start_Date FROM Projects)
)

Select 
        Start_Date,
        End_Date
    FROM Project_Start_Date, Project_End_Date
    WHERE Rank_Start = Rank_End

ORDER BY
DATEDIFF(day, Start_Date, End_Date), Start_Date

/*
NOTES
Project Start Date

SELECT 
        Start_Date
FROM    Projects
WHERE   Start_Date NOT IN SELECT(End_Date FROM Projects)

SELECT 
        End_Date
FROM    Projects
WHERE   End_Date NOT IN SELECT(Start_Date FROM Projects)
*/