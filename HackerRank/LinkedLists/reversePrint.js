/*
Given a pointer to the head of a singly-linked list, 
print each  value from the reversed list. 
If the given list is empty, do not print anything.
*/

function reversePrint(llist) {
 
    const values = [];

    let current = llist;
    while (current !== null) {
        values.unshift(current.data);
        current = current.next;
    }

    for (let i = 0; i < values.length; i++) {
        console.log(values[i]);
    }
}

/*
COMMENTARY
Unshift inserts an element at the beginning of the array
So we iterate through the llist with our loop pushing data
into the new values array, then console log every element in values


*/