/* 
There is a new mobile game that starts with consecutively numbered clouds. Some of the clouds are thunderheads and others are cumulus. The player can jump on any cumulus cloud having a number that is equal to the number of the current cloud plus 1 or 2. The player must avoid the thunderheads. Determine the minimum number of jumps it will take to jump from the starting postion to the last cloud. It is always possible to win the game.

For each game, you will get an array of clouds numbered 0 if they are safe or 1 if they must be avoided.

*/

function jumpingOnClouds(c) {
   
    //set global variables
    //Because we're using a do while loop, we keep track of the index externally.
    let jumps = 0; 
    let ind = 0; 

        do{
            jumps++; 
            //we know we have to jump, the question is how far

            ind = c[ind + 2] == 0 ? ind + 2 : ind + 1

            //a ternary operator lets us look into the future of the array: is index + 2 safe? If yes, increment the index by 2, if it's not safe, only increment the index by 1. 

        } while( ind < c.length -1); 
        //the while portion sets the scope of the loop. 
        //as long as ind is less than the clouds in the array, perform
        //a jump
    return jumps

}


