// ignore_for_file: unnecessary_null_comparison, prefer_typing_uninitialized_variables

class Node {
  var data;
  Node? next;

  Node(this.data);
}

class Stack {
  Node? top;

  Stack();

  bool isEmpty() {
    return top == null;
  }

  void push(int data) {
    Node? newNode = Node(data);
    if (isEmpty()) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
  }

  Node? pop() {
    if (isEmpty()) {
      throw Exception('Stack is empty');
    }
    Node? data = top;
    top = top?.next;
    return data;
  }

  Node? peek() {
    if (isEmpty()) {
      throw Exception('Stack is empty');
    }
    return top;
  }

  void printStack() {
    if (isEmpty()) {
      throw Exception("stack is empty");
    }

    Node? current = top;
    print('Stack: ');
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  Stack stack = Stack();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);

  stack.printStack(); // Output: 4 3 2 1
  Node? popNode = stack.pop();
  if (popNode != null) {
    print("popped element is ${popNode.data}");
  }
  Node? peakNode = stack.peek();
  if (peakNode != null) {
    print("Top element is ${peakNode.data}");
  }
}
