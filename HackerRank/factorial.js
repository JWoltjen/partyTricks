/*
Create a function that takes a number as an argument and returns 
its factorial. The factorial of a number is the product of an 
integer and all the integers below it. 
For example, the factorial of 4 is 4*3*2*1 = 24.
*/

const num = 4

const factorialFunction = (num) => {
    if(num == 1 || num == 0){
        return num
    }
    let result = 1
    for(let i = num; i > 1; i--){
        result *= i
    }
    return result
}