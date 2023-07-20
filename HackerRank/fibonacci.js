/*
Fibonacci Series
Write a function that takes a number n as an argument and returns 
the nth number in the Fibonacci sequence. The Fibonacci sequence 
starts with 0 and 1, and the next number in the sequence is always 
the sum of the previous two.
*/
n = 9
const fibo = (n) => {
let a = 0; b = 1; temp;
for(let i = 2; i <= n; i++){
    //get the sum of the two numbers, (starting at 2 of n)
    temp = a + b;
    //a now becomes the next number in the sequence because we are moving UP
    a = b 
    //b now becomes the next number in the sequence as well
    b = temp
}
    //we return the last number of the sequence.
    return b;
}