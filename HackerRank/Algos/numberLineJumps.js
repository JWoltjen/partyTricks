/*
You are choreographing a circus show with various animals. 
For one act, you are given two kangaroos on a number line ready to jump 
in the positive direction (i.e, toward positive infinity).

The first kangaroo starts at location x1 and moves at a rate of v1 meters per jump.
The second kangaroo starts at location x2 and moves at a rate of v2 meters per jump.

You have to figure out a way to get both kangaroos at the same location at the 
same time as part of the show. If it is possible, return YES, otherwise return NO.

Example

x1 = 2
v1 = 1
x2 = 1 
v2 = 2

After one jump, they are both at x = 3, so the answer is yes

*/

/*
Thought process
this screams loop to me where we check if the values are equal after running an iteration
we want to output a boolean, so if the values are equal, print yes else no
what is the ending position? we can't just write an infinite loop
let's arbitrarily say 50000 is the end
*/

const kangaroo = (x1, v1, x2, v2) => {

    for(let i = 0; i < 50000; i++){
        let position1 = (x1 + (v1 * [i]))
        let position2 =  (x2 +(v2 * [i]))
        if( position1 == position2){
            return "YES"
        }
    }
    return "NO"
}

/*
COMMENTARY
typing out my thought process here really helped me think this through. I got stuck
setting up the conditions of the loop too quickly, and set it up as v1[i] instead of 
v1 * [i], which of course is weirder looking. When you're doing these problems in an 
interview setting, you're nervous and full of adrenaline. When you're doing them at 
home, you want to click clack click clack and be all hackerman. But you have to fight
that urge because literally no one gives a shit how fast or loud you type. They're looking
for deliberate programmers, not actors. So slow down and think it through.
*/