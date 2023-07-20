/*
Find the most frequent item in an array:
Write a function to find the most frequent item of an array. 
You can assume that input is an array of integers.

*/

let arr = [3, 3, -1, 3, 3, 2, 4, 4, 2, 2]

const mostFreq = (arr) => {
    let numDrawer = new Map();
    for(let i = 0; i < arr.length; i++){
      if(numDrawer.has(arr[i])){
        numDrawer.set(arr[i], numDrawer.get(arr[i]) + 1);
      } else {
        numDrawer.set(arr[i], 1);
      }
    }
  
    let mostFrequentItem = null;
    let maxCount = 0;
    for(let pair of numDrawer.entries()){
        let item = pair[0] // the key
        let count = pair[1] // the value
      if(count > maxCount){
        mostFrequentItem = item;
        maxCount = count;
      }
    }
  
    return mostFrequentItem;
  }
  
  console.log(mostFreq([3, 3, -1, 3, 3, 2, 4, 4, 2, 2]));  // Outputs: 3

  
  /*





OR, if you're sure the set of numbers doens't include negatives:
  */

const mostFreq2 = (arr) => {
    let numDrawer = new Map();
    for(let i = 0; i < arr.length; i++){
      if(numDrawer.has(arr[i])){
        numDrawer.set(arr[i], numDrawer.get(arr[i]) + 1);
      } else {
        numDrawer.set(arr[i], 1);
      }
    }
  
    let mostFrequentItem = null;
    let maxCount = 0;
    for(let [item, count] of numDrawer.entries()){
      if(count > maxCount){
        mostFrequentItem = item;
        maxCount = count;
      }
    }
  
    return mostFrequentItem;
  }
  
  console.log(mostFreq([3, 3, -1, 3, 3, 2, 4, 4, 2, 2]));  // Outputs: 3
  