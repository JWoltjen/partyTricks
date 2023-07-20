/*
Unique Characters
Write a function to determine if a string has all unique characters. 
Return true if all characters in the string are unique and false 
otherwise.

*/

let str = ('I am the greatest programmer alive')

const uniqueChar = (str) => {
  let set = new Set(str);
  return set.size === str.length ? "All characters are unique" : "Not unique";
}

console.log(uniqueChar(str))

/*
COMMENTARY

This new approach works by creating a Set from the string. 
A Set is a JavaScript object that only allows unique values: 
when you try to add a duplicate value, it simply ignores the addition. 
Therefore, if all the characters in the string are unique, 
the Set will be the same length as the string. 
If any characters are repeated, the Set will be shorter.

This solution has O(n) complexity because the Set object ensures 
uniqueness in a more efficient manner.


*/