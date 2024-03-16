class Minheap {
  late List<int> heap = [];
  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  void heapifyup(int index) {
    int parent = (index - 1) ~/ 2;
    while (index > 0 && heap[index] < heap[parent]) {
      swap(index, parent);
      index = parent;
      parent = (index - 1) ~/ 2;
    }
  }

  void heapifyDown(int index) {
    int smallest = index;
    int leftchild = 2 * index + 1;
    int rightchild = 2 * index + 2;
    if (leftchild < heap.length && heap[leftchild] < heap[smallest]) {
      smallest = leftchild;
    }
    if (rightchild < heap.length && heap[rightchild] < heap[smallest]) {
      smallest = rightchild;
    }
    if (smallest != index) {
      swap(index, smallest);
      heapifyDown(smallest);
    }
  }

  void insert(int value) {
    heap.add(value);
    heapifyup(heap.length - 1);
  }

  void delete(int value) {
    int index = heap.indexOf(value);
    if (index != -1) {
      heap[index] = heap.last;
      heap.removeLast();
      heapifyDown(index);
    }
  }

  int extrctMin() {
    if (heap.isEmpty) {
      throw StateError('Heap is empty');
    }
    int minval = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    heapifyDown(0);
    return minval;
  }

  int getMin() {
    if (heap.isEmpty) {
      throw StateError("heap is Empty");
    }
    return heap[0];
  }

  int parentIndex(int index) {
    if (index == 0) {
      return -1;
    }
    return (index - 1) ~/ 2;
  }

  int leftchildIndex(int index) {
    return (index * 2) + 1;
  }

  int rightchildIndex(int index) {
    return (index * 2) + 2;
  }

  void displayIndices(int index) {
    int parent = parentIndex(index);
    int leftchild = leftchildIndex(index);
    int rightchild = rightchildIndex(index);
    print('parent index of node at index $index: $parent');
    print('Left child index of node at index $index: $leftchild');
    print('Right child index of node at index $index: $rightchild');
  }

  void display() {
    print('heap elements are $heap');
  }
}

void main() {
  Minheap minheap = Minheap();
  minheap.insert(3);
  minheap.insert(2);
  minheap.insert(7);
  minheap.insert(1);
  minheap.insert(9);
  print("min element :${minheap.getMin()}");
  minheap.delete(7);
  print('min element after delete ${minheap.getMin()}');
  print('Extarct min ele ${minheap.extrctMin()}');
  minheap.display();
  minheap.displayIndices(2);
}
