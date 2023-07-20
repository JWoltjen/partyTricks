/*
Someone wrote HTML code but forgot to close the divs with </div>
Write a function that will correctly close the divs that need to be closed

*/


let str = "<div><div><div><div>"

const closer = (str) => {
  let openTag = "<div>";
  let closeTag = "</div>";
  let count = 0;
  let position = str.indexOf(openTag);

  // Count the number of "<div>" tags
  while (position != -1) {
    count++;
    position = str.indexOf(openTag, position + 1);
  }

  // Count the number of "</div>" tags
  position = str.indexOf(closeTag);
  while (position != -1) {
    count--;
    position = str.indexOf(closeTag, position + 1);
  }

  // Append necessary number of "</div>" tags
  while (count > 0) {
    str += closeTag;
    count--;
  }

  console.log(str);
}

closer(str)


/*

If str.indexOf(openTag) does not return -1, 
that means we've found an occurrence of openTag in the string str. 
So we enter the while loop.

In the loop, we increment the count by one because we've found a openTag.

Then, we set position to the index of the next occurrence of
openTag in the string, starting from the character after the 
openTag we just found. This is what str.indexOf(openTag, position + 1) 
is doing. If there are no more occurrences of openTag in str, 
str.indexOf(openTag, position + 1) will return -1.

We go back to the start of the while loop. 
If position is not -1 (which means we found another openTag), 
we repeat steps 2 and 3. If position is -1 
(which means we didn't find another openTag), 
we exit the loop.

*/