// ignore_for_file: unnecessary_null_comparison, prefer_initializing_formals

class Node {
  dynamic key;
  dynamic value;
  Node? next;

  Node(this.key, this.value);
}

class HashTable {
  late int capacity;
  late List<Node?> table;

  HashTable(int capacity) {
    this.capacity = capacity;
    table = List<Node?>.filled(capacity, null);
  }

  int _hashFunction(dynamic key) {
    // A simple hash function: taking the length of the key and modulo by capacity
    return key.length % capacity;
  }

  void insert(dynamic key, dynamic value) {
    int index = _hashFunction(key);
    if (table[index] == null) {
      table[index] = Node(key, value);
    } else {
      Node? currentNode = table[index];
      while (currentNode?.next != null) {
        currentNode = currentNode?.next;
      }
      currentNode?.next = Node(key, value);
    }
  }

  dynamic search(dynamic key) {
    int index = _hashFunction(key);
    Node? currentNode = table[index];
    while (currentNode != null) {
      if (currentNode.key == key) {
        return currentNode.value;
      }
      currentNode = currentNode.next;
    }
    return null; // Key not found
  }

  void delete(dynamic key) {
    int index = _hashFunction(key);
    Node? currentNode = table[index];
    Node? prevNode;
    while (currentNode != null) {
      if (currentNode.key == key) {
        if (prevNode != null) {
          prevNode.next = currentNode.next;
        } else {
          table[index] = currentNode.next!;
        }
        return;
      }
      prevNode = currentNode;
      currentNode = currentNode.next;
    }
  }

  void display() {
    for (int i = 0; i < capacity; i++) {
      Node? currentNode = table[i];
      print('Bucket $i:');
      while (currentNode != null) {
        print('${currentNode.key}: ${currentNode.value}');
        currentNode = currentNode.next;
      }
    }
  }
}

void main() {
  HashTable hashTable = HashTable(7);

  hashTable.insert('apple', 10);
  hashTable.insert('banana', 20);
  hashTable.insert('orange', 30);

  print('Searching for banana: ${hashTable.search('banana')}');
  print('Searching for orange: ${hashTable.search('orange')}');

  hashTable.delete('banana');

  print('Searching for banana after deletion: ${hashTable.search('banana')}');

  hashTable.display();
}
