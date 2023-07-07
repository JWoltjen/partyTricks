/*
You’re given the pointer to the head nodes of two linked lists.
Compare the data in the nodes of the linked lists to check 
if they are equal. If all data attributes 
are equal and the lists are the same length, return 1.
 Otherwise, return 0.
*/

function compareLists(head1, head2) {
    while (head1 !== null && head2 !== null) {
        if (head1.data !== head2.data) {
            return 0;
        }
        head1 = head1.next;
        head2 = head2.next;
    }

    // If one of the lists is longer than the other
    if (head1 !== null || head2 !== null) {
        return 0;
    }

    return 1;
}

/*
Commentary

There are no gotchas here, just a new llist to contend with.
iterate over the lists with the while head! !== null syntax,
comparing each data point to the other and then assigning
each to head(n).next

Then, check to see if the lists are different lengths.
*/