// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, dead_code

// *****************************print a linkedlist..!*******************

class Node {
  var data;
  Node? next;
  // Node? prev;
  Node(this.data);
}

class Sample {
  void display(Node? head) {
    if (head == null) {
      print('Empty');
      return;
    }
    Node? currentNode = head;
    while (currentNode != null) {
      print(currentNode.data);
      currentNode = currentNode.next;
    }
  }
}

void main() {
  Sample sample = Sample();
  Node? node1 = Node(23);
  var node2 = Node(8);
  var node3 = Node(89);

  node1.next = node2;
  node2.next = node3;
  node3.next = null;
  sample.display(node1);
}

//******************Node adding in first And last**************

// class Node {
//   var data;
//   Node? next;
//   Node? prev;
//   Node(this.data);
// }

// class Sample {
//   Node? createNode(Node? head) {
//     Node? newNode = Node(5);
//     newNode.next = head;
//     head = newNode;
//     return head;
//   }

//   Node? lastNode(Node? head) {
//     Node? lastvalue = Node(40);
//     if (head == null) {
//       head = lastvalue;
//       return null;
//     }
//     Node? currentNode = head;
//     while (currentNode?.next != null) {
//       currentNode = currentNode?.next;
//     }
//     currentNode?.next = lastvalue;
//      return head;
//   }
// }

// void prinlist(Node? head) {
//   if (head == null) {
//     print("value is empty");
//   }
//   Node? currentNode = head;
//   while (currentNode != null) {
//     print(currentNode.data);
//     currentNode = currentNode.next;
//   }
// }

// void main() {
//   Sample sample = Sample();
//   Node? node1 = Node(10);
//   var node2 = Node(20);
//   var node3 = Node(30);

//   node1.next = node2;
//   node2.next = node3;
//   node3.next = null;
//   Node? newNode = sample.createNode(node1);
//   sample.lastNode(newNode);
//   prinlist(newNode);
// }

// *************************Adding newNode in last linkes list...!****************

// class Node {
//   var data;
//   Node? next;
//   Node(this.data);
// }

// class Sample {
//   Node? lastNode(Node? head) {
//     Node? lastNew = Node(40);
//     if (head == null) {
//       print('Empty');
//       return lastNew;
//     }
//     Node? currentNode = head;
//     while (currentNode?.next != null) {
//       currentNode = currentNode?.next;
//     }
//     currentNode?.next = lastNew;
//     return head;
//   }
// }

// void printlist(Node? head) {
//   if (head == null) {
//     print('There are No values');
//   }
//   Node? currentNode = head;
//   while (currentNode != null) {
//     print(currentNode.data);
//     currentNode = currentNode.next;
//   }
// }

// void main() {
//   Sample sample = Sample();
//   Node? node1 = Node(10);
//   var node2 = Node(20);
//   var node3 = Node(30);

//   node1.next = node2;
//   node2.next = node3;
//   node3.next = null;
//   Node? newvalue = sample.lastNode(node1);
//   printlist(newvalue);
// }

//********************** */ Node adding in first..!*****************

// class Node {
//   var data;
//   Node? next;
//   Node(this.data);
// }

// class Sample {
//   Node? firstNode(Node? head) {
//     Node? newadd = Node(12);
//     newadd.next = head;
//     head = newadd;
//     return head;
//   }
// }

// void printlist(Node? head) {
//   if (head == null) {
//     print('List is Empty');
//   }
//   Node? currentNode = head;
//   while (currentNode != null) {
//     print(currentNode.data);
//     currentNode = currentNode.next;
//   }
// }

// void main() {
//   Sample sample = Sample();
//   Node? node1 = Node(10);
//   var node2 = Node(20);
//   var node3 = Node(40);

//   node1.next = node2;
//   node2.next = node3;
//   node3.next = null;
//   Node? newhead = sample.firstNode(node1);
//   printlist(newhead);
// }

// **************************insert postion at specified...!********************

// class Node {
//   var data;
//   Node? next;
//   Node(this.data);
// }

// class Sample {
//   Node? insertpos(Node? head, int position) {
//     Node? newNode = Node(25);
//     if (position < 1) {
//       print('invalid position');
//       return head;
//     }
//     if (position == 1) {
//       newNode.next = head;
//       return newNode;
//     }
//     Node? currentNode = head;
//     for (int i = 1; i < position - 1; i++) {
//       if (currentNode == null) {
//         print('Position exceeds the length of the list');
//         return head;
//       }
//       currentNode = currentNode.next;
//     }
//     newNode.next = currentNode?.next;
//     currentNode?.next = newNode;
//     return head;
//   }
// }

// void printlist(Node? head) {
//   if (head == null) {
//     print('List is empty');
//     return;
//   }
//   Node? currentNode = head;
//   while (currentNode != null) {
//     print(currentNode.data);
//     currentNode = currentNode.next;
//   }
// }

// void main() {
//   Sample sample = Sample();
//   Node? node1 = Node(10);
//   var node2 = Node(20);
//   var node3 = Node(30);

//   node1.next = node2;
//   node2.next = node3;
//   node3.next = null;
//   Node? newvalue = sample.insertpos(node1, 2);
//   printlist(newvalue);
// }

