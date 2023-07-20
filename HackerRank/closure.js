/*
What is a closure?

A closure is a function that has access to its own scope, the outer 
(enclosing) function's scope, and the global scope, as well as access to 
the function parameters of the outer function.

*/

function createCounter() {
    let count = 0;

    return function () {
        count+=1;
        return count;
    }
}
let counter = createCounter();

console.log(counter()); //Outputs: 1
console.log(counter()); //Outputs: 2
console.log(counter()); //Outputs: 3

/*
In this example, 'craeteCounter' function defines a variable 'count' and then
returns a function. This returned function, when invoked, increments the count
variable by 1 and then returns its value.

The key thing to note here is that the returned function has access to the
'count' variable from 'createCounter' function's scope, even after 'createCounter'
has finished execution. This returned function is a closure. 

when we call 'createCounter()' it returns this closure, which we store in 
the 'counter' variable. Each time we invoke counter(), it increments the 
'count' variable and outputs its value. As you can see, the 'count' variable
is preserved between calls to 'counter()', because it's part of the 
closure's scope.


Remember, a closure is when an inner function has access 
to the outer function's variables, even after the outer function 
has returned. They 'close over' the variables they need, keeping them alive.

*/