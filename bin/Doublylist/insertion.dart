class Node {
  int value;
  Node? next;
  Node? prev;

  Node(this.value);
}

class DoublyLinkedList {
  Node? head;
  Node? tail;

  // Insert at the beginning (head)
  void insertAtHead(int value) {
    Node newNode = Node(value);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  // Insert at the end (tail)
  void insertAtTail(int value) {
    Node newNode = Node(value);
    if (tail == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.prev = tail;
      tail!.next = newNode;
      tail = newNode;
    }
  }

  // Insert at a specific position
  void insertAtPosition(int value, int position) {
    if (position <= 0) {
      insertAtHead(value);
      return;
    }

    Node newNode = Node(value);
    Node? current = head;
    for (int i = 0; i < position - 1; i++) {
      if (current?.next == null) {
        insertAtTail(value);
        return;
      }
      current = current!.next;
    }

    newNode.next = current!.next;
    if (current.next != null) {
      current.next!.prev = newNode;
    }
    current.next = newNode;
    newNode.prev = current;
  }

  // Display the list
  void display() {
    Node? current = head;
    while (current != null) {
      print(current.value);
      current = current.next;
    }
  }
}

void main() {
  DoublyLinkedList list = DoublyLinkedList();

  // Insert at head
  list.insertAtHead(10);
  list.insertAtHead(5);

  // Insert at tail
  list.insertAtTail(15);
  list.insertAtTail(20);

  // Insert at position (e.g., insert 12 at position 2)
  list.insertAtPosition(12, 2);

  // Display list
  list.display(); // Output: 5, 10, 12, 15, 20
}
