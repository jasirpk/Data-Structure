class Node {
  dynamic key;
  dynamic data;
  Node? next;

  Node(this.key, this.data);
}

class HashTable {
  List<Node?>? table;
  int size;

  HashTable(this.size) {
    table = List.generate(size, (index) => null);
  }

  int _getIndex(dynamic key) {
    return key.hashCode.abs() % size;
  }

  getall() {
    for (int i = 0; i < size; i++) {
      Node? temp = table?[i];
      while (temp != null) {
        print(temp.data);
        temp = temp.next;
      }
    }
  }

  void get(String key) {
    int index = _getIndex(key);
    if (table?[index] == null) {
      print('Empty');
    } else {
      print(table?[index]?.data);
    }
  }

  void push(dynamic key, dynamic data) {
    int index = _getIndex(key);
    Node? newnode = Node(key, data);
    if (table?[index] == null) {
      table?[index] = newnode;
    } else {
      newnode.next = table?[index];
      table?[index] = newnode;
    }
  }

  update(dynamic data, dynamic key) {
    int index = _getIndex(key);
    Node? temp = table?[index];
    Node? newval = Node(key, data);
    if (temp == null) {
      print('empty');
    }
    while (temp != null) {
      if (temp.key == key) {
        table?[index] = newval;
        // print('value updated');
      }
      temp = temp.next;
    }
  }

  remove(dynamic key) {
    int index = _getIndex(key);
    if (table?[index] != null) {
      Node? temp = table?[index];
      Node? prev;
      while (temp != null) {
        if (temp.key == key) {
          if (prev == null) {
            table?[index] = temp.next;
          } else {
            prev.next = temp.next;
          }
          return;
        }
        prev = temp;
        temp = temp.next;
      }
    }
  }
}

void main() {
  HashTable value = HashTable(6);
  value.push(1, 'adnan');
  value.push(2, 'jasir');
  value.push(3, 'fouzan');
  value.push(4, 'jaseem');
  value.update('sugu', 4);
  value.remove(1);
  value.getall();
}
