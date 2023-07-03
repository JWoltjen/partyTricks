/*
Given two strings, determine if they share a common substring.
A substring may be as small as one character.

example:
s1 = "and"
s2 = 'art'

these share a common substring a.

Function Description

Complete the function twoStrings in the editor below.

twoStrings has the following parameter(s):

string s1: a string
string s2: another string
*/



const twoStrings = (s1, s2) => {
    let set1 = new Set(s1);
    let set2 = new Set(s2);

    for (let char of set1){
        if(set2.has(char)){
            return "YES";
        }
    }
    return "NO";
}


/*
Commentary:

The basic idea is to iterate over the characters in each string, 
and add them to separate sets. Sets in JavaScript only contain unique elements. 
Then, we iterate over one set, and for each character, 
we check if it's in the other set. If we find a common character, 
we return 'YES'. If we finish checking all characters without finding 
a common character, we return 'NO'.

This code will work for the provided input constraints because 
JavaScript sets and the Set.prototype.has method both operate 
in average time complexity of O(1), making the solution very efficient.

*/