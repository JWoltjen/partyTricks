/*

A left rotation operation on an array shifts each of the array's elements  unit to the left.
For example, if  left rotations are performed on array [1, 2, 3, 4, 5], then the array would become [2, 3, 4, 5, 1]. 
Note that the lowest index item moves to the highest index in a rotation. This is called a circular array.

Given an array  of  integers and a number, , perform  left rotations on the array. Return the updated array to be printed as a single line of space-separated integers.

Complete the function rotLeft in the editor below.

rotLeft has the following parameter(s):

int a[n]: the array to rotate
int d: the number of rotations
*/

const leftRotation = (nums, rotation) => {
    // create variable to return
    let rotatedArray = [];
    // create for loop to iterate over the original array
    for(let i = 0; i<nums.length; i++){
        // calculate the new index of each element by adding the rotation value
        // to the current index (i) and taking the modulus of the array length
        // This ensures that the index wraps around when it exceeds the array length!
        let newIndex = (i + rotation) % nums.length;
        // assign the value at the new index to the corresponding index in rotatedArray
        rotatedArray[i] = nums[newIndex];
    }
    return rotatedArray
}