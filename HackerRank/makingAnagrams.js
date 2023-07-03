/*
A student is taking a cryptography class and has found anagrams to be very useful. 
Two strings are anagrams of each other if the first string's letters can be rearranged to form the second string.
In other words, both strings must contain the same exact letters in the same exact frequency.
For example, bacdc and dcbac are anagrams, but bacdc and dcbad are not.

The student decides on an encryption scheme that involves two large strings. 
The encryption is dependent on the minimum number of character deletions 
required to make the two strings anagrams.Determine this number.

Given two strings,  and , that may or may not be of the same length, 
determine the minimum number of character deletions required to make  and  anagrams.
Any characters can be deleted from either of the strings.

Example
a = 'cde'
b = 'dcf'

Detele e from a and f from b so the remaining strings are anagrams. This takes two 
character deletions. 
*/

const makeAnagram = (a, b) => {
    let count = new Array(26).fill(0);

    // count the frequency of each character in string1
    for(let char of a) {
        // char.charCodeAt() gets the ASCII (numeric representation) value of a character. 
        // For example, the ASCII value of the lowercase 'a' is 97.

        // 'a'.charCodeAt() is getting the ASCII value of 'a' (which is 97), and it's 
        // subtracted from the ASCII value of char. 
        // The purpose of this is to get an index value that starts from 0 for 'a', 1 for 'b', and so on until 25 for 'z'.
        // So, char.charCodeAt() - 'a'.charCodeAt() 
        // effectively gives us a unique index for each lowercase letter.
        count[char.charCodeAt() - 'a'.charCodeAt()]++;
    }

    // subtract the frequency of each character in string2
    //The count array holds the difference in the frequency of each character in the two strings.
    for(let char of b){
        count[char.charCodeAt() - 'a'.charCodeAt()]--;
    }

    //sum absolute values of the frequency array
    let result = 0;
    // for each element in the count array,
    for(let i of count){
        // add to the result the sum of the absolute value of that position
        //  Math.abs(i) is used to get the absolute value, 
        // because we're interested in the number of differences, 
        // regardless of which string has more of each character.
        result +=  Math.abs(i);
    }

    return result;
}



/*
Commentary

There are multiple ways to do this. The most obvious way of using
indexOf to find the first occurrence of a character and slicing to
create a new string and incrementing the deletions has a quadratic
time complexity. 

The more complicated way of using Array(26).fill(0) that we've set
forth above is more esoteric to beginners but has a linear time
complexity and should therefore be favored.

the keys here are knowing how to set up an array with New Array(26).fill(0) -I've never seen this before
and then being comfortable with the charCodeAt syntax to set up the unique value for each element in the count

Yes i understand that the solution is 100% computer brain and not intuitive at all. 
So it goes.
*/