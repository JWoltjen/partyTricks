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

using System;

class Program
{
    static void HouseCount(int s, int t, int a, int b, int[] apples, int[] oranges)
    {
        int appleCount = 0;
        int orangeCount = 0;

        foreach (int apple in apples)
        {
            if (a + apple >= s && a + apple <= t)
            {
                appleCount++;
            }
        }

        foreach (int orange in oranges)
        {
            if (b + orange >= s && b + orange <= t)
            {
                orangeCount++;
            }
        }

        Console.WriteLine(appleCount);
        Console.WriteLine(orangeCount);
    }

    static void Main()
    {
        int s = 7;
        int t = 11;
        int a = 5;
        int b = 15;
        int[] apples = { -2, 2, 1 };
        int[] oranges = { 5, -6 };

        HouseCount(s, t, a, b, apples, oranges);
    }
}