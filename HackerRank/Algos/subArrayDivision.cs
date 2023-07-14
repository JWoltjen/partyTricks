
/*
Two children, Lily and Ron, want to share a chocolate bar. 
Each of the squares has an integer on it.

Lily decides to share a contiguous segment of the bar selected such that:

The length of the segment matches Ron's birth month, and,
The sum of the integers on the squares is equal to his birth day.
Determine how many ways she can divide the chocolate.

Example

s = [2, 2, 1, 3, 2]
d = 4
m = 2

Lily wants to find segments summing to Ron's birth day, d=4
with a length equalling his birth month, m=2 . 
In this case, there are two segments meeting her criteria: [2, 2] and [1,3].

Complete the birthday function in the editor below.

birthday has the following parameter(s):

int s[n]: the numbers on each of the squares of chocolate
int d: Ron's birth day
int m: Ron's birth month



public static int SubArrayDivision(List<int> s, int d, int m)
{
    int matches = 0;

    for (int i = 0; i <= s.Count - m; i++)
    {
        List<int> subarr = s.GetRange(i, m);
        int sum = subarr.Sum();

        if (sum == d)
        {
            matches++;
        }
    }

    return matches;
}

*/