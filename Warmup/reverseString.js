/*
Given a string, reverse it. 
*/

const reverseString = (str) => {
    // initialize the variable that will hold the reverse string
    let reverse = "";

    for (let i = 0; i < str.length -1; i--){
        reverse += str[i]
    }
    // return the reversedStr
    return reverse
}