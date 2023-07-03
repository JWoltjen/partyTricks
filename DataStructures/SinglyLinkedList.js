/*
In JavaScript, a singly linked list is a data structure 
that consists of nodes linked together in a linear manner. 
Each node in the list contains a value and a reference 
(or link) to the next node in the sequence. 
The last node in the list typically points to null to indicate the end of the list.
*/

class Node {
    constructor(value) {
      this.value = value;
      this.next = null;
    }
  }
  
  class SinglyLinkedList {
    constructor() {
      this.head = null;
      this.tail = null;
      this.length = 0;
    }
  
    append(value) {
      const newNode = new Node(value);
  
      if (this.head === null) {
        // If the list is empty, set the new node as both the head and tail
        this.head = newNode;
        this.tail = newNode;
      } else {
        // If the list is not empty, add the new node to the tail and update the tail reference
        this.tail.next = newNode;
        this.tail = newNode;
      }
  
      this.length++;
    }
  
    // Other methods (e.g., prepend, insert, delete, search, etc.) can be implemented here
  }

  /*
    Commentary

    In the example above, the SinglyLinkedList class represents the linked list itself. 
    It has a head property pointing to the first node and a tail property pointing to the last node.
    The length property keeps track of the number of nodes in the list.

    The Node class represents a single node in the linked list. 
    It contains a value property to store the value of the node 
    and a next property to point to the next node in the list.

    With a singly linked list, you can perform various operations 
    such as appending elements, prepending elements, inserting elements 
    at specific positions, deleting elements, searching for values, and more.
  */