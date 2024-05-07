// ignore_for_file: prefer_typing_uninitialized_variables

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class Sample {
  Node? createlinkedlist(List<int> dataList) {
    if (dataList.isEmpty) {
      print('List is Empty');
    }
    Node? head;
    Node? tail;
    for (var data in dataList) {
      Node? newNode = Node(data);
      if (head == null) {
        head = newNode;
        tail = newNode;
      } else {
        tail?.next = newNode;
        tail = newNode;
      }
    }
    return head;
  }
}

void printlist(Node? head) {
  if (head == null) {
    print('List is Empty');
  }
  Node? currentNode = head;
  while (currentNode != null) {
    print(currentNode.data);
    currentNode = currentNode.next;
  }
}

void main() {
  List<int> numlist = [1, 2, 3, 4, 5, 6];
  print('arraylist');
  print(numlist);
  Sample sample = Sample();
  print('Original list');
  Node? newhead = sample.createlinkedlist(numlist);
  printlist(newhead);
}
