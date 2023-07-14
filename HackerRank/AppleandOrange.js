/*
Sam's house has an apple tree and an orange tree that yield an abundance of fruit. 
Using the information given below, determine the number of apples and oranges that 
land on Sam's house.

In the diagram below:

The red region denotes the house, where  s is the start point, and t is the endpoint. 
The apple tree is to the left of the house, and the orange tree is to its right.
Assume the trees are located on a single point, where the apple tree is at point a, 
and the orange tree is at point b.
When a fruit falls from its tree, it lands d units of distance from its tree of origin 
along the -axis. *A negative value of d means the fruit fell d units to the tree's left, 
and a positive value of  means it falls  d units to the tree's right. *

Given the value of d for m apples and n oranges, 
determine how many apples and oranges will fall on Sam's house 
(i.e., in the inclusive range [s,t] )?

For example, Sam's house is between  s = 7 and t=10. 
The apple tree is located at a=4  and the orange at b=12. 
There are m=3 apples and  n=3 oranges. Apples are thrown apples=[2,3,-4] units distance 
from a, and oranges = [3, -2, 4] units distance. 
Adding each apple distance to the position of the tree, they land at [4+2, 4+3, 4+-4] = [6, 7,0]. 
Oranges land at [12+3, 12+-2, 12+ -4] = [15, 10, 8]. 
One apple and two oranges land in the inclusive range [7-10] so we print

1
2


*/

//we're outputing num apples within 7-10
//we're outputing num oranges within 7-10


//we need to find 
//      the difference between a nd s
//      the difference between a and t (inclusive)
//      the difference between b and s
//      the difference between b and t (inclusive)


// once we grab these differences, we can know the potential values d that will score true


const houseCount = (s, t, a, b, apples, oranges) => {
    let appleCount = 0;
    let orangeCount = 0;

    for(let i = 0; i<=apples.length; i++){
        if(a+ apples[i] >= s && a+apples[i] <= t){
            appleCount += 1
        }
    }
    for(let i = 0; i<=oranges.length; i++){
        if(b+ oranges[i] >= s && b+oranges[i] <= t){
            orangeCount += 1
        }
    }
    console.log(appleCount);
    console.log(orangeCount);
}

