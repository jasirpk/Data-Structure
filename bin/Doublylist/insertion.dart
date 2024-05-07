// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_null_comparison

// *******************Adding New Node in first***************************

class Node {
  var data;
  Node? next;
  Node? prev;
  Node(this.data);
}

Node? tail;

class Sample {
  Node? firstNode(Node? head) {
    Node? newAdd = Node(12);
    newAdd.next = head;
    if (head != null) {
      head.prev = newAdd;
    }
    return newAdd;
  }
}

void printlist(Node? head) {
  if (head == null) {
    print('There are no values');
    return;
  }
  Node? currentNode = head;
  while (currentNode != null) {
    print(currentNode.data);
    currentNode = currentNode.next;
  }
}

void main() {
  Sample sample = Sample();
  Node? node1 = Node(10);
  var node2 = Node(20);
  var node3 = Node(40);

  node1.next = node2;
  node2.next = node3;
  node3.next = null;
  Node? newvalue = sample.firstNode(node1);
  printlist(newvalue);
}

// *********************Adding a new Node in last....****************************

// class Node {
//   var data;
//   Node? next;
//   Node? prev;
//   Node(this.data);
// }

// Node? tail;

// class Sample {
//   Node? insertion(Node? head) {
//     Node? newNode = Node(56);
//     Node? currentNode = head;

//     while (currentNode?.next != null) {
//       currentNode = currentNode?.next;
//     }

//     currentNode?.next = newNode;
//     newNode.prev = currentNode;
//     tail = newNode;
//     return head;
//   }
// }

// void printlist(Node? head) {
//   if (head == null) {
//     print('There are no values');
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
//   var node3 = Node(40);

//   node1.next = node2;
//   node2.next = node3;
//   node3.next = null;
//   Node? newvalue = sample.insertion(node1);
//   printlist(newvalue);
// }


// ****************************Inserting in spocified position..!***********************


// class Node {
//   var data;
//   Node? next;
//   Node? prev;
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
//       if (head != null) {
//         head.prev = newNode;
//       }
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
//     if (currentNode?.next != null) {
//       currentNode?.next!.prev = newNode;
//     }
//     newNode.next = currentNode?.next;
//     currentNode?.next = newNode;
//     newNode.prev = currentNode;
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
//   Node? newvalue = sample.insertpos(node1, 4);
//   printlist(newvalue);
// }

