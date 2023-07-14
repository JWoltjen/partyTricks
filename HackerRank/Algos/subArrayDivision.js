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
*/

/*
Thought process
So birth month is going to be the number of integers in the array
and the elements in that array all added together have to equal d
and s is the number of integers in the array
we are returning the number of ways this can be divided?

*/
const subArrayDivision = (s, d, m) => {
   let matches = 0;
   for(let i = 0; i<s.length; i++){
      let subarr = s.slice(i, i+m);
      let sum = subarr.reduce((a, b) => a+b)
      if(sum == d){
        matches++
      }
   }
   return matches
  };  
/*
COMMENTARY
1. Initialize a variable matches to keep track of the number of matching subarrays.
2. Iterate over the input array s using the index variable i.

3. For each iteration, extract a subarray of length m using the slice method. 
The slice method takes the starting index i and the ending index i + m (exclusive) 
to create the subarray.

4. Calculate the sum of the elements in the subarray using the reduce method. 
The reduce method takes a callback function that accumulates the sum by adding each element to the 
accumulator (a) and returns the final sum.

5. Check if the calculated sum is equal to the target sum d. 
If it is, increment the matches variable by 1.

6. Repeat steps 3-5 for all possible subarrays in the input array.

7. Finally, return the matches variable, which represents the count of 
matching subarrays.

The approach essentially checks each possible subarray of 
length m and compares its sum with the target sum d. 
If a subarray's sum matches the target sum, the count is incremented. 
This approach has a time complexity of O(n * m) since it 
iterates over each element of the input array and performs a 
subarray sum calculation for each element.

*/