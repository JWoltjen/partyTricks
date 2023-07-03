/*
Problem: Given an array of integers nums, write a function called TwoSum 
that returns an array of two numbers such that they add up to a specific target value.
You may assume that each input would have exactly one solution, and you may not use the same element twice.
Your task is to implement the TwoSum function and test it with different inputs.
*/





























const twoSum = (array, target) => {
    
    //create a map to store key value pairs
    let map = new Map(); 
    // set up a loop to traverse the array
    for(let i in nums){
        // create a complement--the value that would solve the target
        // if paired with the value of the current element within the array
        let complement = target - array[i];
        // if the map has the complement return it and the index of the array
        if(map.has(complement) && map.get(complement) !== i){
            return [map.get(complement), i]
        } else {
            // otherwise, add the index as the key and its value as the value within the map
            map.set(nums[i], i);
        }
    }
    //if we go through the whole array and don't find what we're looking for, throw a new error
    throw new Error("No two elements add up to the target!")
}