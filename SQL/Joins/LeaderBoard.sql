/*
You did such a great job helping Julia with her last coding contest challenge that she 
wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all of the 
challenges. Write a query to print the hacker_id, name, and total score of the 
hackers ordered by the descending score. If more than one hacker achieved the 
same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.

Input Format

The following tables contain contest data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 

Submissions: The submission_id is the id of the submission, 
hacker_id is the id of the hacker who made the submission, 
challenge_id is the id of the challenge for which the submission belongs to, 
and score is the score of the submission. 
*/


SELECT h.hacker_id, h.name, SUM(s.max_score) AS TotalScore
FROM Hackers h
JOIN (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
) s ON h.hacker_id = s.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(s.max_score) > 0
ORDER BY TotalScore DESC, h.hacker_id ASC;


/*
COMMENTARY
1. The subquery (SELECT hacker_id, challenge_id, MAX(score) AS max_score FROM Submissions 
GROUP BY hacker_id, challenge_id) finds the maximum score (max_score) for each challenge 
that each hacker (hacker_id) has submitted. This subquery is joined with the Hackers table 
using hacker_id as the common column.

2. The main query then calculates the total score for each hacker by summing the maximum scores 
obtained from the subquery. The SUM(s.max_score) AS TotalScore expression calculates the total 
score.

3. The result is grouped by hacker_id and name from the 
Hackers table to ensure unique results for each hacker.

4. The HAVING clause is used to exclude hackers with a total score of 0 (SUM(s.max_score) > 0).

5. Finally, the result is ordered by the descending total score (TotalScore DESC) 
and ascending hacker_id (h.hacker_id ASC) as specified in the problem statement.

*/
