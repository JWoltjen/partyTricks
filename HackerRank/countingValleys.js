/*An avid hiker keeps meticulous records of their hikes. During the last hike that took exactly  steps, for every step it was noted if it was an uphill, , or a downhill,  step. Hikes always start and end at sea level, and each step up or down represents a  unit change in altitude. We define the following terms:
A mountain is a sequence of consecutive steps above sea level, starting with a step up from sea level and ending with a step down to sea level.
A valley is a sequence of consecutive steps below sea level, starting with a step down from sea level and ending with a step up to sea level.
Given the sequence of up and down steps during a hike, find and print the number of valleys walked through.
*/

function countingValleys(steps, path) {

    //assign a global valley count and an elevation
    const valleyCount = 0
    const elevation = 0

    //loop through each step in the path

    //what is the relationship between a step and a path? 
    //a path is made up of steps
    //we know that each journey begins and ends at sea level 
    //so the number of Us and Ds needs to be the same and even
    for(let i = 0; i < steps.length; i++){
        if (path[i] === "D"){
            //check whether we're entering a valley
            //if we are entering a valley, valleyCount++
            //if we are simply going down further, elevation--
        } else {

        }
    }

    //return total valleys walked through
}