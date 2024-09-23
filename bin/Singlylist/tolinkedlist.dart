// ignore_for_file: prefer_typing_uninitialized_variables

class Node {
  Node? next;
  Node? prev;
  var data;
  Node(this.data);
}

class LinkedList {
  Node? head;
  void insert(int data) {
    Node? newNode = Node(data);

    if (head == null) {
      head = newNode;
    } else {
      Node? current = head;

      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  void printNode() {
    Node? current = head;
    List<int> store = [];

    while (current != null) {
      print(current.data);
      store.add(current.data);
      current = current.next;
    }
    print(store);
  }

  void printList(List<int> nums) {
    if (nums.isEmpty) {
      print('lis is Empty');
    }
    for (var val in nums) {
      Node? newNode = Node(val);
      if (head == null) {
        head = newNode;
      } else {
        Node? current = head;
        while (current!.next != null) {
          current = current.next;
        }
        current.next = newNode;
      }
    }
  }
}

void main() {
  LinkedList list = LinkedList();

  list.insert(5);
  list.insert(4);
  list.insert(2);
  list.insert(1);
  list.insert(9);

  list.printNode();
  List<int> nums = [3, 7, 4, 2, 4, 6, 9];
  list.printList(nums);
  list.printNode();
}
