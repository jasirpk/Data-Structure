// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names

class Node {
  dynamic data;
  Node? next;

  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear;
  late int size;

  Queue() {
    front = null;
    rear = null;
    size = 0;
  }

  // Check if the queue is empty
  bool isEmpty() {
    return size == 0;
  }

  // Get the size of the queue
  int Size() {
    return size;
  }

  // Add an element to the end of the queue
  void enqueue(dynamic data) {
    Node newNode = Node(data);
    if (rear == null) {
      front = newNode;
      rear = newNode;
    } else {
      rear?.next = newNode;
      rear = newNode;
    }
    size++;
  }

  // Remove and return the first element in the queue
  dynamic dequeue() {
    if (front == null) {
      return null;
    }

    dynamic data = front?.data;
    front = front?.next;
    if (front == null) {
      rear = null;
    }
    size--;
    return data;
  }

  // Get the first element in the queue without removing it
  dynamic peek() {
    if (front != null) {
      return front?.data;
    } else {
      return null;
    }
  }
}

printQueue(Node? front) {
  Node? currentNode = front;
  while (currentNode != null) {
    print(currentNode.data);
    currentNode = currentNode.next;
  }
}

void main() {
  Queue myQueue = Queue();

  // Enqueue elements
  myQueue.enqueue(10);
  myQueue.enqueue(20);
  myQueue.enqueue(30);
  printQueue(myQueue.front);
  // Dequeue elements
  print(myQueue.dequeue()); // Output: 10
  print(myQueue.dequeue()); // Output: 20

  // Get the size of the queue
  print(myQueue.Size()); // Output: 1

  // Check if the queue is empty
  print(myQueue.isEmpty()); // Output: false

  // Peek at the first element
  print(myQueue.peek()); // Output: 30
}
