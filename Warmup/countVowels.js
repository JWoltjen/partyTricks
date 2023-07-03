/* given a str, count the vowels within the string and return them
let str = "The quick brown fox"

*/































const countVowels = (str) => {
    //set the variables we need to solve
    let vowels = "aeiou";
    let count = 0;
    // set up a for loop using of--this is the tricky part because you must know what 'of' does
    for (let char of str){
        if (vowels.includes(char.toLowerCase())){
            count++
        }
    }
    return count; 
}

/*
Commentary

I screw this up by going to fast and mistaking for let char of str 
with for let char in string

Both for...in and for...of are looping constructs in JavaScript, 
but they are used in different scenarios and work differently:
for...in is used to iterate over the enumerable properties of an object. 
It returns a list of keys on the object being iterated. 
So, when you use for...in to iterate over a string, 
it will return the index (i.e., the position) of each character:

        let str = "hello";
        for(let index in str) {
        console.log(index); // logs 0, 1, 2, 3, 4 (the indices of each character)
        }

for...of, on the other hand, is used to iterate over iterable objects 
(like Arrays, Strings, Maps, Sets, etc). When you use for...of on a string, 
it will return the characters of the string:

        let str = "hello";
        for(let char of str) {
        console.log(char); // logs "h", "e", "l", "l", "o" (the characters of the string)
        }

In the context of your countVowels function, 
you want to check each character of the string to see if it's a vowel, 
so for...of is the appropriate choice.

*/