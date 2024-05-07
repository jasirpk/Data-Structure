// ignore_for_file: prefer_final_fields

class Queue {
  List elements = [];

  // Add an element to the end of the queue
  void enqueue(dynamic element) {
    elements.add(element);
  }

  // Remove and return the first element in the queue
  dynamic dequeue() {
    if (elements.isNotEmpty) {
      return elements.removeAt(0);
    } else {
      return null; // or throw an exception, depending on your requirements
    }
  }

  // Get the size of the queue
  int size() {
    return elements.length;
  }

  // Check if the queue is empty
  bool isEmpty() {
    return elements.isEmpty;
  }

  // Get the first element in the queue without removing it
  dynamic peek() {
    if (elements.isNotEmpty) {
      return elements[0];
    } else {
      return null; // or throw an exception, depending on your requirements
    }
  }

  // Optional: Clear the queue
  void clear() {
    elements.clear();
  }
}

void main() {
  Queue myQueue = Queue();

  // Enqueue elements
  myQueue.enqueue(10);
  myQueue.enqueue(20);
  myQueue.enqueue(30);

  // Dequeue elements
  print(myQueue.dequeue()); // Output: 10
  print(myQueue.dequeue()); // Output: 20

  // Get the size of the queue
  print(myQueue.size()); // Output: 1

  // Check if the queue is empty
  print(myQueue.isEmpty()); // Output: false

  // Peek at the first element
  print(myQueue.peek()); // Output: 30
}
