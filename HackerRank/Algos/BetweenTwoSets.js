/*
There will be two arrays of integers. 
Determine all integers that satisfy the following two conditions:

The elements of the first array are all factors of the integer being considered
The integer being considered is a factor of all elements of the second array
These numbers are referred to as being between the two arrays. Determine how many such numbers exist.

Example
a = [2, 6]
b = [24, 36]

There are two numbers between the arrays: 6 and 12.
6 % 2 = 0, 6 % 6 = 0, 24 % 6 =0  and 36 % 6 = 0 for the first value.
12 % 2 = 0, 12%6 =0 and 24 % 12 = 0, 36 % 12 = 0 for the second value. 
Return 2.

Complete the getTotalX function in the editor below. 
It should return the number of integers that are betwen the sets.

getTotalX has the following parameter(s):

int a[n]: an array of integers
int b[m]: an array of integers
Returns
    int: the number of integers that are between the sets
*/

// Function to calculate the greatest common divisor (GCD) of two numbers
function getGCD(n1, n2) {
    if (n2 === 0){
        return n1
    }
    return getGCD(n2, n1 % n2)// Recursive call with updated values of n1 and n2
}

// Function to calculate the least common multiple (LCM) of two numbers
function getLCM(n1, n2) {
    if(n1 === 0 || n2 === 0){
        return 0;
    } else {
        const gcd = getGCD(n1, n2);
        return Math.abs(n1 * n2) / gcd; // Return the LCM using the GCD formula
    }
}

// Function to calculate the total number of integers between the two sets
function getTotalX(a, b) {
  let result = 0;

  // Get LCM of all elements of a
  let lcm = a[0];
  for (let i = 1; i < a.length; i++) {
    lcm = getLCM(lcm, a[i]);
  }

  // Get GCD of all elements of b
  let gcd = b[0];
  for (let i = 1; i < b.length; i++) {
    gcd = getGCD(gcd, b[i]);
  }

  // Count multiples of lcm that divide the gcd
  let multiple = 0;
  while (multiple <= gcd) {
    multiple += lcm; // Increment multiple by lcm

    if (gcd % multiple === 0) {
      result++;
    }
  }

  return result;
}


/*
COMMENTARY
I followed this explanation to get the solution: https://studyalgorithms.com/array/hackerrank-between-two-sets/
The integers should be multiples of each element of first array.
The integers should be factors of each element of second array.

A brute force method to solve this problem would be:
    Find all the multiples of each element of first array.
    Get all the factors of each element of second array.
    Make an intersection of all the above integers.
    Count the number of common integers you could find.

The efficient way
    why do you even need to find out all the multiples of array a?
    We are interested in integers that are a multiple of each of the 
        element of array a
    Thus, if we find the lowest common multiple, 
        that can give us a starting point.

    Similarly, we do not need all the factors of all the elements of array b
    We are just interested in integers that are factors of every element.
    So, finding the greatest common divisor can give you a good starting point.

    Next, we are sure that the integers are in the range of LCM (Lowest common multiple) 
    and GCD (Greatest common divisor). The algorithm will be:

    1. Find the LCM of all integers of array a.
    2. Find the GCD of all integers of array b.
    3. Count the number of multiples of LCM that are divisible by the GCD.

*/