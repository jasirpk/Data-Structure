// ignore_for_file: prefer_typing_uninitialized_variables, dead_code

class Node {
  var data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class Sample {
  Node? findMiddle(Node? head) {
    if (head == null) {
      return null;
    }

    Node? slow = head;
    Node? fast = head;

    // Move slow pointer one step and fast pointer two steps at a time
    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
    }

    // At this point, slow pointer is at the middle node
    return slow;
  }
}

void printlist(Node? head) {
  if (head == null) {
    print('List is Empty');
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
  var node4 = Node(40);
  var node5 = Node(50);
  var node6 = Node(60);

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;
  node5.next = node6;
  node6.next = null;

  print('Original List');
  printlist(node1);
  Node? newvalue = sample.findMiddle(node1);
  print('After');

  if (newvalue != null) {
    print('Middle value of the linked list: ${newvalue.data}');
  } else {
    print('Linked list is empty');
  }
}
