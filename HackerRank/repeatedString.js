/*There is a string, , of lowercase English letters that is repeated infinitely many times. Given an integer, n, find and print the number of letter a's in the first n letters of the infinite string.*/


function repeatedStrings(s, n) {
    //declare global variables
    let count = 0; 

    //count the number of times the letter a appears in a given s
    //multiply that number by how many s's there are in substring n
    //if there is a remainder to that number, splice the remaining letters to get the most accurate count


    //first part - how many times is s repeated in n completely?
    if(n >= s.length){
        let occurencesOfA = [...s].filter(e => e === 'a').length;
        count = Math.floor(n/s.length) * occurencesOfA; 
    }

    //second part - if there are leftovers, take the modulo and clean it up
    let tailStringLength = n % s.length; 
    for (let i = 0; i < tailStringLength; i++){
        if(s[i] === 'a'){
            count++
        }
    }

    //return what is asked
    return count
}

/*


*/