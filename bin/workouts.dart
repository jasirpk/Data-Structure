class Queue {
  List<int> nums = [];
  late int size;

  bool isEmpty() {
    return nums.isEmpty;
  }

  enqueue(dynamic data) {
    return nums.add(data);
  }

  dequeue() {
    return nums.removeAt(0);
  }

  int limit() {
    return nums.length;
  }

  peak() {
    return nums[0];
  }

  @override
  String toString() {
    return nums.toString();
  }

  // displayAll() {
  //   for (dynamic i = 0; i < size; i++) {
  //     List<int> temp = n;
  //     print(temp);
  //   }
  // }
}

class Stack {
  late List<List<int>> stack;
  push(dynamic data) {
    return stack.add(data);
  }

  pop() {
    return stack.removeLast();
  }
}

void main() {
  Queue queue = Queue();
  queue.enqueue(49);
  queue.enqueue(20);
  queue.enqueue(30);
  print(queue);
  print('pop element is ${queue.dequeue()}');
  print('peak element is ${queue.dequeue()}');
}
