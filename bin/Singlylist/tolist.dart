// ignore_for_file: prefer_typing_uninitialized_variables

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class Sample {
  List<int> storelist(Node? head) {
    List<int> arraylist = [];

    Node? cuurentNode = head;
    while (cuurentNode != null) {
      arraylist.add(cuurentNode.data);
      cuurentNode = cuurentNode.next;
    }
    return arraylist;
  }
}

void arraylist(List<int> arraylist) {
  if (arraylist.isEmpty) {
    print('List is Empty');
  }
  for (var item in arraylist) {
    print(item);
  }
}

void printlist(Node? head) {
  if (head == null) {
    print('Nodes are Empty');
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

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;
  node5.next = null;
  print('Original linked list');
  printlist(node1);
  print('Original arraylist');
  List<int> originallist = sample.storelist(node1);
  arraylist(originallist);
}
