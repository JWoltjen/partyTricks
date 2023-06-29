/* given a str, count the vowels within the string and return them*/

const countVowels = (str) => {
    let vowels = "aeiou";
    let count = 0;
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