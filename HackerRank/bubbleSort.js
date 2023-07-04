/*
Given an array of integers, sort the array in ascending order using the Bubble Sort algorithm above. 
Once sorted, print the following three lines:

Array is sorted in numSwaps swaps., where [numSwaps] is the number of swaps that took place.
First Element: firstElement, where [firstElement] is the first element in the sorted array.
Last Element: lastElement, where [lastElement] is the last element in the sorted array.
Hint: To complete this challenge, you must add a variable that keeps a running tally of all swaps 
that occur during execution.



Consider the following version of Bubble Sort:


for (int i = 0; i < n; i++) {
    
    for (int j = 0; j < n - 1; j++) {
        // Swap adjacent elements if they are in decreasing order
        if (a[j] > a[j + 1]) {
            swap(a[j], a[j + 1]);
        }
    }
    
}
Given an array of integers, sort the array in ascending order using 
the Bubble Sort algorithm above. Once sorted, print the following three lines:
Example output for a = [6, 4, 1]
Array is sorted in 3 swaps.  
First Element: 1  
Last Element: 6  
*/






















const bubbleSort = (array) => {
    let swaps = 0;

    for(let i = 0; i < array.length; i++){
        for(let j = 0; j<array.length -1; j++){
            if(array[j] > array[j+1]){
                // the magic solution at Quadratic time complexity:
                // temporarily hold the value of j
                let temp = array[j]
                array[j] = array[j + 1]
                array[j + 1] = temp
                swaps++
            }
        }
    }
    console.log(`Number of swaps is ${swaps}`)
    console.log(`First element is ${array[0]}`)
    console.log(`Last element is ${array[array.length -1]}`)
}