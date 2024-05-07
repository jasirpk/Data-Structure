class MaxHeap {
  late List<int> heap = [];

  // Insertion operation
  void insert(int value) {
    heap.add(value);
    _heapifyUp(heap.length - 1);
  }

  // Deletion operation
  void delete(int value) {
    int index = heap.indexOf(value);
    if (index != -1) {
      heap[index] = heap.last;
      heap.removeLast();
      _heapifyDown(index);
    }
  }

  // Extracting maximum element operation
  int extractMax() {
    if (heap.isEmpty) {
      throw StateError("Heap is empty");
    }
    int maxVal = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    _heapifyDown(0);
    return maxVal;
  }

  // Get maximum element operation
  int getMax() {
    if (heap.isEmpty) {
      throw StateError("Heap is empty");
    }
    return heap[0];
  }

  // Heapify Up operation
  void _heapifyUp(int index) {
    int parentIndex = (index - 1) ~/ 2;
    while (index > 0 && heap[index] > heap[parentIndex]) {
      // Change to >
      _swap(index, parentIndex);
      index = parentIndex;
      parentIndex = (index - 1) ~/ 2;
    }
  }

  // Heapify Down operation
  void _heapifyDown(int index) {
    int largest = index; // Change variable name
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;

    if (leftChild < heap.length && heap[leftChild] > heap[largest]) {
      // Change to >
      largest = leftChild;
    }

    if (rightChild < heap.length && heap[rightChild] > heap[largest]) {
      // Change to >
      largest = rightChild;
    }

    if (largest != index) {
      _swap(index, largest);
      _heapifyDown(largest);
    }
  }

  // Utility function to swap two elements in the heap
  void _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  // Method to find parent index
  int parentIndex(int index) {
    if (index == 0) {
      return -1; // Root node has no parent
    }
    return (index - 1) ~/ 2;
  }

  // Method to find left child index
  int leftChildIndex(int index) {
    return (index * 2) + 1;
  }

  // Method to find right child index
  int rightChildIndex(int index) {
    return (index * 2) + 2;
  }

  // Display parent index, left child index, and right child index
  void displayIndices(int index) {
    int parent = parentIndex(index);
    int leftChild = leftChildIndex(index);
    int rightChild = rightChildIndex(index);

    print("Parent index of node at index $index: $parent");
    print("Left child index of node at index $index: $leftChild");
    print("Right child index of node at index $index: $rightChild");
  }

  void display() {
    print('displaying elements are $heap');
  }
}

void main() {
  MaxHeap maxHeap = MaxHeap();

  maxHeap.insert(3);
  maxHeap.insert(2);
  maxHeap.insert(1);
  maxHeap.insert(5);
  maxHeap.insert(4);

  print("Max element: ${maxHeap.getMax()}"); // Output: Max element: 5

  maxHeap.delete(2); // Delete element 2
  print(
      "Max element after deletion: ${maxHeap.getMax()}"); // Output: Max element after deletion: 5

  print(
      "Extracted Max element: ${maxHeap.extractMax()}"); // Output: Extracted Max element: 5
  print(
      "Max element after extraction: ${maxHeap.getMax()}"); // Output: Max element after extraction: 4
  maxHeap.display();
  maxHeap.displayIndices(2);
}
