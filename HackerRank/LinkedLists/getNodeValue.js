/*
Given a pointer to the head of a linked list and a 
specific position, determine the data value at that position. 
Count backwards from the tail node. The tail is at postion 0, 
its parent is at 1 and so on.

Example
head refers to 3 -> 2 -> 1 -> 0 -> null
positionFromTail = 2;
each of the data values matches its distance from the tail
The value 2 is at the desired position
*/
function getNode(head, positionFromTail) {
    let pointer1 = head;
    let pointer2 = head;

    // Move pointer1 positionFromTail nodes ahead in the list
    for (let i = 0; i <= positionFromTail; i++) {
        pointer1 = pointer1.next;
    }

    // Move both pointers at the same speed. 
    // When pointer1 reaches the end, pointer2 will be 
    // positionFromTail nodes from the end
    while (pointer1 !== null) {
        pointer1 = pointer1.next;
        pointer2 = pointer2.next;
    }

    // Return the data at pointer2
    return pointer2.data;
}


/*
COMMENTARY
This function works by maintaining two pointers to nodes in the list. 
It first moves one pointer (pointer1) positionFromTail nodes 
ahead in the list. 

Then it moves both pointers at the same speed towards the end of the list. 
When pointer1 reaches the end of the list, pointer2 will be positionFromTail 
nodes from the end of the list, because it started positionFromTail 
nodes behind pointer1. 

The function then returns the data in the node pointed to by pointer2.
*/