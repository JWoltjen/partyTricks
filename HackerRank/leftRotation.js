/*

A left rotation operation on an array shifts each of the array's elements  unit to the left.
For example, if  left rotations are performed on array [1, 2, 3, 4, 5], then the array would become [2, 3, 4, 5, 1]. 
Note that the lowest index item moves to the highest index in a rotation. This is called a circular array.

Given an array  of  integers and a number, , perform  left rotations on the array. Return the updated array to be printed as a single line of space-separated integers.

Complete the function rotLeft in the editor below.

rotLeft has the following parameter(s):

int a[n]: the array to rotate
int d: the number of rotations

let nums = [1, 2, 3, 4, 5]
let rotation = 3
*/























const leftRotation = (nums, rotation) => {
  // They key to this problem is to calculate effective rotations using modulus (avoid unnecessary repetitions)
  // if the number of rotations is less than the length, it's just that number, if it's more, it's the remainder.
  // This greatly simplifies the rest of the problem. So really, this is testing your knowledge of the power of % operator.
  const rotations = rotation % nums.length; 
  // create the array to be returned
  const rotatedArray = [];

  // set the index to the number of rotations, say 4.
  // if 4 is less than nums.length, say 5, i++
  for (let i = rotations; i < nums.length; i++) {
    // push 4 into the beginning of the array, then we stop because 5 !> 5
    rotatedArray.push(nums[i]);
  }

  // Copy the remaining elements to the new array
  // we are now starting at zero and FINISHING at the number of rotations, 
  // this ensures we take caree of the remaining elements in the array
  for (let i = 0; i < rotations; i++) {
    rotatedArray.push(nums[i]);
  }

  return rotatedArray;
}
