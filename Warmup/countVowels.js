/* given a str, count the vowels within the string and return them*/

const countVowels = (str) => {
    //set the variables we need to solve
    let vowels = "aeiou";
    let count = 0;
    // set up a for loop using of--this is the tricky part because you must know what 'of' does
    for (let char of str){
        if (char.includes(str.toLowerCase())){
            count++
        }
    }
    return count; 
}

/*
Notice that char of and char in are different. char in will simply return the index of the char within the string (0, 1, 2, 3)
while char in will return the value at that position "h, e, l, l, o"
*/