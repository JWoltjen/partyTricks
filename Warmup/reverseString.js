/*
Given a string, reverse it. 
*/

const reverseString = (str) => {
    // initialize the variable that will hold the reverse string
    let reverse = "";
    // the key is to set i to the end of the string and decrement, which looks weird
    for (let i = str.length -1; i >= 0; i--){
        reverse += str[i]
    }
    // return the reversedStr
    return reverse
}