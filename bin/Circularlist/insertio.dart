// ignore_for_file: prefer_typing_uninitialized_variables

// **********************Insertion at Beginning..!*********************

// class Node {
//   var data;
//   Node? next;
//   Node(this.data);
// }

// class Sample {
//   Node? display(Node? head, int newData) {
//     Node? newNode = Node(newData);
//     if (head == null) {
//       newNode.next = newNode;
//       return newNode;
//     }
//     Node? currentNode = head;
//     while (currentNode?.next != head) {
//       currentNode = currentNode?.next;
//     }
//        currentNode?.next = newNode;
// newNode.next = head;
// head = newNode;
// return head;
//   }
// }

// void printlist(Node? head) {
//   if (head == null) {
//     print('List is Empty');
//     return;
//   }
//   Node? currentNode = head;
//   do {
//     print(currentNode!.data);
//     currentNode = currentNode.next;
//   } while (currentNode != head);
// }

// void main() {
//   Sample sample = Sample();
//   Node? head = Node(10);
//   var node2 = Node(20);
//   var node3 = Node(30);

//   head.next = node2;
//   node2.next = node3;
//   node3.next = head;

//   print('After adding');
//   Node? newvalue = sample.display(head, 5);
//   printlist(newvalue);
// }

// ************************************last Node in circular linked list..!***********************

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class Sample {
  Node? addToFront(Node? head, int newData) {
    Node newNode = Node(newData);
    if (head == null) {
      newNode.next = newNode;
      return newNode;
    }
    Node? lastNode = head;
    while (lastNode!.next != head) {
      lastNode = lastNode.next;
    }
    lastNode.next = newNode;
    newNode.next = head;
    return newNode;
  }
}

void printList(Node? head) {
  if (head == null) {
    print('List is Empty');
    return;
  }
  Node? currentNode = head;
  do {
    print(currentNode!.data);
    currentNode = currentNode.next;
  } while (currentNode != head);
}

void main() {
  Sample sample = Sample();
  Node? head = Node(10);
  head.next = head;

  print('Original list:');
  printList(head);

  print('\nAfter adding:');
  head = sample.addToFront(head, 5);
  head = sample.addToFront(head, 20);
  printList(head);
}
