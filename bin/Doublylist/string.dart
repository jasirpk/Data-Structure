// ignore_for_file: prefer_typing_uninitialized_variables

class Node {
  Node? next;
  Node? prev;
  var value;
  Node(this.value);
}

class DoubleLinkedList {
  Node? head;
  Node? tail;
  void insert(String value) {
    Node? newNode = Node(value);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  void printList() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

void main() {
  DoubleLinkedList list = DoubleLinkedList();
  String text = 'hello';
  for (int i = 0; i < text.length; i++) {
    list.insert(text[i]);
  }
  list.printList();
}
