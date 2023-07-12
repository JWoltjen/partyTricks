/*There is a string, , of lowercase English letters that is repeated 
infinitely many times. 
Given an integer, n, find and print the number of letter a's in 
the first n letters of the infinite string.*/






























function repeatedStrings(s, n) {
    //declare global variables
    let count = 0; 

    //count the number of times the letter a appears in a given s
    //multiply that number by how many s's there are in substring n
    //if there is a remainder to that number, splice the remaining letters to get the most accurate count


    //first part - how many times is s repeated in n completely?
    if(n >= s.length){
        let occurencesOfA = [...s].filter(e => e === 'a').length;
        //we use the spread operator to iterate over the stringf
        //we use filter to take the 'a's from the string and make a substring
        //we grab the number with .length property
        count = Math.floor(n/s.length) * occurencesOfA; 
        //the count is now obtained by an arithmetic expression rounded down
    }

    //second part - if there are leftovers (or if s.length > n), take the modulo and clean it up
    let tailStringLength = n % s.length; 
    //tailstringlength is how many characters remain after we divide 
    //n by the legnth of s
    for (let i = 0; i < tailStringLength; i++){
        if(s[i] === 'a'){
            count++
        }
    //we simply iterate over this substring and increment count for each 'a' found
    }
    //return what is asked
    return count
}

/*
This question is about the spread operator and the filter array prototype method. If you know them, then the question becomes super easy. 

Spread syntax ([...s]) allows an iterable such as an array expression or a string to be expanded in places where zero or more arguments (for function calls) or elements(for array literals) are expected, or an object expression to be expanded in places where zero or more key-value pairs are expected.

In this problem, we have a string s, that has a given number of letters "a" inside. By enclosing s with brackets and using the spread operator, we can treat the string like an array and use the filter method on it to create a substring of only 'a's. 

*/