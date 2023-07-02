/*Problem Statement:
John works at a clothing store. He has a large pile of socks that he must pair by color for sale. 
Given an array of integers representing the color of each sock, 
determine how many pairs of socks with matching colors there are.

John can only sell complete pairs of socks. He cannot sell an odd number of socks or socks with mismatched colors.

Example:

Input: [10, 20, 20, 10, 10, 30, 50, 10, 20]
Output: 3
*/

const sockMerchant = (socks) => {
    // create an empty object to store the count of each color
    const drawer = {};

    // iterate through the socks array and count the occurences of each color
    for (let i = 0; i < socks.length; i++){
        // again, semantically naming the variable helps conceptualize the problem
        const color = socks[i];
        // if the color already exists in the drawer, increase it by one 
        if(drawer[color]){
            drawer[color++]
        } else {
            // otherwise, intialize that color at 1
            drawer[color] = 1;
        }
    }

    // count the number of match pairs
    let pairCount = 0;
    for (const color in drawer){
        let count = drawer[color]
        // the number of pairs is the whole number of the count divided by 2
        pairCount += Math.floor(count /2)
    }
    return pairCount
}

/*
Commentary

The key to this problem is knowing that it requires an object.
The first time I tried the problem, that wasn't obvious to me. 
Also I find that semantically naming the object something like drawer
makes a lot more sense than naming it some bullshit like colorCount.
It's a lot easier to understand what drawer[color] is asking for than
colorCount[color], in my opinion.

Finally, never underestimate the importance of using Math. operators correctly when 
the situation calls for it. 
*/