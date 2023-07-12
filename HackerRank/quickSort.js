/*
Your favorite performer, our favorite performer, actually. 
Quicksort.

Set up a sorting algorithm that sorts a given array of numbers quickly

example

let arr = [3, 10, 1, 19, 23, 4, 15, 20]
*/































function quicksort(arr) {
    if (arr.length <= 1) {
      return arr;
    }
  
    const pivot = arr[Math.floor(arr.length / 2)];
    const less = [];
    const equal = [];
    const greater = [];
  
    for (let element of arr) {
      if (element < pivot) {
        less.push(element);
      } else if (element > pivot) {
        greater.push(element);
      } else {
        equal.push(element);
      }
    }
  
    return quicksort(less).concat(equal, quicksort(greater));
  }
  
  // Example usage:
  const unsortedArray = [5, 2, 9, 1, 7, 6, 4, 3, 8];
  const sortedArray = quicksort(unsortedArray);
  console.log(sortedArray);

/*
the algorithm selects a pivot element, which is usually chosen as 
the middle element of the array. It then partitions the array into 
three parts: elements less than the pivot, elements equal to the pivot, 
and elements greater than the pivot. This partitioning step is performed 
using the less, equal, and greater arrays.

The function then recursively calls quicksort on the less and greater arrays, 
concatenating the sorted less, equal, and greater arrays together to 
produce the final sorted array.
*/