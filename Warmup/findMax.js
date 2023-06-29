/* Given an array of numbers, return the number with the maximum value*/

const maxNum = (arr) => {
    // create a variable that sorts the given array in ascending order, remembering the proper synatx for sort.
    let sortedArray = arr.sort((a, b) => a-b);
    // the pop method returns a value
    sortedArray.pop();
}