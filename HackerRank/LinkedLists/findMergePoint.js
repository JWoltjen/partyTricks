/*
Given pointers to the head nodes of 2 linked lists that 
merge together at some point, find the node where the two lists merge.
The merge point is where both lists point to the same node, 
i.e. they reference the same memory location. 
It is guaranteed that the two head nodes will be different,
and neither will be NULL. 
If the lists share a common node, return that node's data value.

Note: After the merge point, both lists will share the same node pointers.


*/
function findMergeNode(headA, headB) {
    let nodeA = headA;
    let nodeB = headB;

    // Traverse both lists. When A reaches the end of the list, switch to headB, and vice versa.
    while (nodeA !== nodeB) {
        nodeA = (nodeA.next !== null) ? nodeA.next : headB;
        nodeB = (nodeB.next !== null) ? nodeB.next : headA;
    }

    // When both pointers meet, that's the merge point.
    return nodeA.data;
}


/*
COMMENTARY

This function works by iterating through both lists at the same time. 
If one pointer reaches the end of its list, it switches to the start of the other list. 
Eventually, both pointers will meet at the merge point. 
This is because when one pointer switches lists, it will be exactly the length 
of the non-overlapping part of the other list behind the other pointer. 
So, after they both traverse the length of the non-overlapping part 
of the other list, they will meet at the start of the overlapping part, 
which is the merge point.


*/