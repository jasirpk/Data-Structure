// ignore_for_file: prefer_initializing_formals

class HashTable {
  List<List<dynamic>> table;
  late int size;

  HashTable(int size) : table = List.generate(size, (index) => []) {
    this.size = size;
  }

  int hashFunction(dynamic key) {
    return key.hashCode.abs() % size;
  }

  void insert(dynamic key, dynamic value) {
    int index = hashFunction(key);
    table[index].add(value);
  }

  List<dynamic> search(dynamic key) {
    int index = hashFunction(key);
    return table[index];
  }

  void remove(dynamic key, dynamic value) {
    int index = hashFunction(key);
    table[index].remove(value);
  }

  void displayall() {
    for (int i = 0; i < size; i++) {
      List<dynamic> temp = table[i];
      print(temp);
    }
  }
}

void main() {
  HashTable hashtable = HashTable(10);

  hashtable.insert(1, "apple");
  hashtable.insert(2, "banana");
  hashtable.insert(3, "orange");

  print(hashtable.search(1));
  print(hashtable.search(2));
  print(hashtable.search(2));

  hashtable.remove(1, "apple");
  print(hashtable.search(1));
  // Output: []
  hashtable.displayall();
}
