// ignore_for_file: prefer_typing_uninitialized_variables

class Node {
  Node? next;
  var data;
  Node(this.data);
}

class Sample {
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

  void firstvalue(int data) {
    Node? firstValue = Node(data);
    if (head == null) {
      head = firstValue;
    } else {
      firstValue.next = head;
      head = firstValue;
    }
  }

  void lastValue(int data) {
    Node? lastValue = Node(data);
    if (head == null) {
      head = lastValue;
    } else {
      Node? current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = lastValue;
    }
  }

  void specefiedPosition(int data, int position) {
    Node? specefied = Node(data);
    if (head == null) {
      head = specefied;
    } else {
      Node? current = head;
      for (int i = 1; i < position - 1; i++) {
        current = current!.next;
      }
      specefied.next = current!.next;
      current.next = specefied;
    }
  }

  void middleValue() {
    Node? slow = head;
    Node? fast = head;
    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    print(slow!.data);
  }

  void reverse() {
    Node? current = head;
    Node? nextNdoe;
    Node? preveNode;
    while (current != null) {
      nextNdoe = current.next;
      current.next = preveNode;
      preveNode = current;
      current = nextNdoe;
    }
    while (preveNode != null) {
      print(preveNode.data);
      preveNode = preveNode.next;
    }
  }

  void toList() {
    List<int> nums = [];
    Node? current = head;
    while (current != null) {
      nums.add(current.data);
      current = current.next;
    }
    print(nums);
  }

  void toLinkedList(List<int> values) {
    Node? current;
    Node? newNode;
    for (var data in values) {
      newNode = Node(data);
      if (current == null) {
        current = newNode;
      } else {
        current.next = newNode;
        current = newNode;
      }
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }

  printlist() {
    Node? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  Sample sample = Sample();
  sample.insert(10);
  sample.insert(20);
  sample.insert(30);
  sample.insert(40);
  sample.printlist();
  print('FirstValue----------------');
  sample.firstvalue(50);
  sample.printlist();
  print("LastValue----------");
  sample.lastValue(60);
  sample.printlist();
  print("Specefied-------");
  sample.specefiedPosition(70, 3);
  sample.printlist();

  print('middle value----');
  sample.middleValue();

  print('toLIst----');
  sample.toList();
  print("Reverse-------------");
  sample.reverse();
  List<int> values = [1, 2, 3, 4, 5, 5, 6];
  print('toLinkedList-------');
  sample.toLinkedList(values);
}
