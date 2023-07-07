/*
Given pointers to the heads of two sorted linked lists, 
merge them into a single, sorted linked list. 
Either head pointer may be null meaning that the 
corresponding list is empty.

Example
headA refers to 1 -> 3 -> 7 -> Null
headB refers to 1 -> 2 -> Null
the new list is 1 -> 1 -> 2 -> 3 -> 7 -> Null

*/

function mergeLists(headA, headB) {
    if (headA === null) {
        return headB;
    } else if (headB === null) {
        return headA;
    }

    let mergedHead;

    if (headA.data <= headB.data) {
        mergedHead = headA;
        mergedHead.next = mergeLists(headA.next, headB);
    } else {
        mergedHead = headB;
        mergedHead.next = mergeLists(headA, headB.next);
    }

    return mergedHead;
}


/*
Commentary

This function works by comparing the data in the first nodes of each list,
and making the node with the smaller data the new head of the merged list. 
It then sets the next node of the merged list to be the result of a 
recursive call to mergeLists, passing in the next node of the list 
that had the smaller data, and the current node of the other list. 
If one of the lists is empty (i.e., its head is null), 
it returns the head of the other list.


*/