// ignore_for_file: prefer_typing_uninitialized_variables

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class Sample {
  Node? reversefunction(Node? head) {
    Node? prevNode;
    Node? nextNode;
    Node? currentNode = head;
    while (currentNode != null) {
      nextNode = currentNode.next;
      currentNode.next = prevNode;
      prevNode = currentNode;
      currentNode = nextNode;
    }
    return prevNode;
  }
}

void printlist(Node? head) {
  if (head == null) {
    print('List is empty');
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
  print('Original list');
  printlist(node1);
  print('Reverse list');
  Node? newvalue = sample.reversefunction(node1);
  printlist(newvalue);
}
