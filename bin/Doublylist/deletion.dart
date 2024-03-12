// ignore_for_file: prefer_typing_uninitialized_variables

// ****************************Deletion in first..!************************

class Node {
  var data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class Sample {
  Node? headdeletion(Node? head) {
    Node? currentNode = head?.next;
    currentNode?.prev = null;
    head?.next = null;
    return currentNode;
  }
}

void printlist(Node? head) {
  if (head == null) {
    print('There are new values');
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
  var node3 = Node(30);

  node1.next = node2;
  node2.next = node3;
  node3.next = null;
  Node? newvaalue = sample.headdeletion(node1);
  printlist(newvaalue);
}

// ******************Deletion if last..!******************

// class Node {
//   var data;
//   Node? next;
//   Node? prev;
//   Node(this.data);
// }

// Node? tail;

// class Sample {
//   Node? deletionlast(Node? head) {
//     if (head == null) {
//       print('List is empty');
//       return null;
//     }
//     if (head.next == null) {
//       return null;
//     }
//     Node? currentNode = head;
//     while (currentNode?.next?.next?.next != null) {
//       currentNode = currentNode?.next;
//     }
//     currentNode?.next?.next = null;
//     currentNode?.next?.prev = currentNode;
//     tail = currentNode?.next;
//     return head;
//   }
// }

// void printlist(Node? head) {
//   if (head == null) {
//     print('List is Empty');
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
//   var node4 = Node(50);
//   node1.next = node2;
//   node2.next = node3;
//   node3.next = node4;
//   node4.next = null;
//   print('original list');
//   printlist(node1);
//   print('afer Deletion..');
//   Node? newvalue = sample.deletionlast(node1);
//   printlist(newvalue);
// }


// **********************************Deletion in specified position...!**************************

// class Node {
//   var data;
//   Node? next;
//   Node? prev;
//   Node(this.data);
// }

// Node? tail;

// class Sample {
//   Node? insertion(Node? head, int position) {
//     if (position < 1) {
//       print('Invalid positon');
//       return head;
//     } else if (position == 1) {
//       return head?.next;
//     }
//     Node? currentNode = head;
//     Node? prevNode;
//     for (int i = 1; i < position; i++) {
//       prevNode = currentNode;
//       currentNode = currentNode?.next;
//     }
//     prevNode?.next = currentNode?.next;
//     tail = prevNode;
//     tail?.prev = currentNode;
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
//   Node? newvalue = sample.insertion(node1, 2);
//   printlist(newvalue);
// }