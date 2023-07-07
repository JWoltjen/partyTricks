/*
You are given the pointer to the head node of a sorted linked list, 
where the data in the nodes is in ascending order. 
Delete nodes and return a sorted list with each distinct value 
in the original list. 
The given head pointer may be null indicating that the list is empty.

Example
head refers to the first node in the list
1 -> 2 -> 2 -> 3 -> 3 -> 3 -> 3 -> Null
remove 1 of the 2 data values and return head pointing to the revised list
1 -> 2 -> 3 -> null

*/

function removeDuplicates(llist) {
    let node = llist;

    while (node !== null && node.next !== null) {
        if (node.data === node.next.data) {
            // Skip the next node
            node.next = node.next.next;
        } else {
            // Move to the next node
            node = node.next;
        }
    }

    return llist;
}

/*
Commentary
This function works by iterating through the list and checking if the data 
in the current node is the same as the data in the next node. 
If it is, it skips the next node by setting the next attribute of the 
current node to the node after the next node. If the data is not the same, 
it moves to the next node. This effectively removes all duplicate nodes 
from the list.
*/