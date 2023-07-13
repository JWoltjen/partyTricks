/*
Julia just finished conducting a coding contest, and she needs 
your help assembling the leaderboard! Write a query to print the 
respective hacker_id and name of hackers who achieved full scores 
for more than one challenge. Order your output in descending order 
by the total number of challenges in which the hacker earned a full 
score. If more than one hacker received full scores in same number of 
challenges, then sort them by ascending hacker_id.


Hackers Table:
+-----------+--------------+
| hacker_id |     name     |
+-----------+--------------+
|     1     |    Alice     |
|     2     |    Bob       |
|     3     |    Charlie   |
+-----------+--------------+

Difficulty Table:
+-----------------+-------+
| difficulty_level| score |
+-----------------+-------+
|        1        |   10  |
|        2        |   20  |
|        3        |   30  |
+-----------------+-------+

Challenges Table:
+----------------+-----------+-----------------+
| challenge_id   | hacker_id | difficulty_level|
+----------------+-----------+-----------------+
|       1        |     1     |        2        |
|       2        |     2     |        1        |
|       3        |     2     |        3        |
|       4        |     3     |        2        |
+----------------+-----------+-----------------+

Submissions Table:
+----------------+-----------+--------------+-------+
| submission_id  | hacker_id | challenge_id | score |
+----------------+-----------+--------------+-------+
|       1        |     1     |      1       |   20  |
|       2        |     1     |      2       |   50  |
|       3        |     2     |      1       |   30  |
|       4        |     2     |      3       |   70  |
|       5        |     3     |      2       |   80  |
|       6        |     3     |      4       |   60  |
+----------------+-----------+--------------+-------+
*/

SELECT      h.hacker_id,
            h.name
            --COUNT(s.challenge_id)
FROM        hackers h
LEFT JOIN submissions s ON s.hacker_id = h.hacker_id
LEFT JOIN challenges c ON c.challenge_id = s.challenge_id
LEFT JOIN difficulty d ON d.difficulty_level = c.difficulty_level
WHERE       s.score = d.score
GROUP BY    h.hacker_id, h.name
HAVING      COUNT(s.challenge_id) > 1
ORDER BY    COUNT(s.challenge_id) desc, hacker_id asc


/*
COMMENTARY
This was taken from a youtube tutorial video where I watched this guy solve this problem
from start to finish. https://www.youtube.com/watch?v=OfwPCEzAR24
Here are some things I learned by watching:

1. he opened a notepad and noted the output required as well as listed each condition required
2. he read the problem very carefully before he started coding. He was calm and methodical.
3. He was not afraid to run the code after incomplete attempts just to check in with what
   he was working with. 
4. His use of LEFT JOINs made the problem much more manageable--that's really a key is to 
   link all the necessary tables together to see the data in aggregate.

Because he took his time and remained calm, he was able to work through the problem from start
to finish in 30 minutes. Impresive.


*/