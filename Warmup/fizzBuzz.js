/*

Write a program that prints the numbers from 1 to n. But for multiples of three, 
print "Fizz" instead of the number, and for multiples of five, print "Buzz". 
For numbers that are multiples of both three and five, print "FizzBuzz".

Your task is to implement the FizzBuzz program and test it with different values of n.

Your solution should satisfy the following conditions:

The program should print the numbers from 1 to n (inclusive).
For multiples of three, print "Fizz" instead of the number.
For multiples of five, print "Buzz" instead of the number.
For numbers that are multiples of both three and five, print "FizzBuzz".

*/

//the key here is understanding the modulus operater and the && operator.
// remember that something like 1/3rd of employed programmers in the United States cannot solve fizzbuzz, so keep your chin up.

const fizzBuzz = (n) => {
    for(let i = 1; i <= n; i++){
        if(i%3 == 0 && i%5 != 0){
            console.log("Fizz")
        } else if 
            (i%3 !== 0 && i%5 == 0){
                console.log("Buzz")
            } else if
            (i%3 == 0 && i%5 == 0){
                console.log("FizzBuzz")
            } else {
                console.log(i)
            }
        }
    }
