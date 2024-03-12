class Stack {
  List<int> nums = [];
  bool isEmpty() {
    return nums.isEmpty;
  }

  void push(int value) {
    nums.add(value);
  }

  int pop() {
    if (isEmpty()) {
      throw Exception("Stack is Empty");
    }
    return nums.removeLast();
  }

  int peak() {
    if (isEmpty()) {
      throw Exception("Stack is Empty");
    }
    return nums.last;
  }

  @override
  String toString() {
    return nums.toString();
  }

  reverse() {
    List<int> reverse = [];
    while (!isEmpty()) {
      reverse.add(pop());
    }
    nums = reverse;
  }

  int sum() {
    int sum = 0;
    for (var element in nums) {
      sum += element;
    }
    return sum;
  }
}

void main() {
  Stack stack = Stack();
  stack.push(3);
  stack.push(3);
  stack.push(1);
  print(stack);
  print("top element ${stack.peak()}");

  while (!stack.isEmpty()) {
    print("popped element ${stack.pop()}");
  }

  stack.push(3);
  stack.push(3);
  stack.push(1);
  print(stack);
  stack.reverse();
  print("Reversed stack: $stack");
  print(stack.sum());
}
