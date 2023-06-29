/*An avid hiker keeps meticulous records of their hikes. During the last hike that took exactly  steps, for every step it was noted if it was an uphill,
 , or a downhill,  step. Hikes always start and end at sea level, and each step up or down represents a  unit change in altitude. We define the following terms:
A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
Given the sequence of up and down steps during a hike, find and print the number of valleys walked through.
*/

function countingValleys(n, s) {

    /*the most important part of the problem is setting up the variables needing to be kept track of. */

    let valleys = 0; 
    let elevation = 0; 

    //iterate over the path string n number of times
    for(let i = 0; i < n; i++) {
        if (s[i] == "D"){
            elevation--; 
        //if it's going down, simply decrement 
        } else {
            //otherwise we need to check each time if the current elevation is about to go out of a valley
            if (elevation == -1){
                valleys++
                //in which case we increment valley count
            }
            elevation++
            //either way we're going up
        }
        
    }
    return valleys; 
}