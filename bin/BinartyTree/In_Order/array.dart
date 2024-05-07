// ignore_for_file: prefer_final_fields

class BinaryTree {
  List<int?> _tree;

  BinaryTree(int capacity) : _tree = List<int?>.filled(capacity, null);

  void insert(int value) {
    _insertRec(0, value);
  }

  void _insertRec(int index, int value) {
    if (_tree[index] == null) {
      _tree[index] = value;
      return;
    }

    if (value < _tree[index]!) {
      if (_leftChild(index) < _tree.length) {
        _insertRec(_leftChild(index), value);
      } else {
        throw Exception("Tree capacity exceeded");
      }
    } else {
      if (_rightChild(index) < _tree.length) {
        _insertRec(_rightChild(index), value);
      } else {
        throw Exception("Tree capacity exceeded");
      }
    }
  }

  void inOrderTraversal(int index) {
    if (index < _tree.length && _tree[index] != null) {
      inOrderTraversal(_leftChild(index));
      print(_tree[index]);
      inOrderTraversal(_rightChild(index));
    }
  }

  int _leftChild(int index) => 2 * index + 1;

  int _rightChild(int index) => 2 * index + 2;
}

void main() {
  BinaryTree tree = BinaryTree(10); // Assuming capacity of 10 for the array

  tree.insert(5);
  tree.insert(3);
  tree.insert(8);
  tree.insert(1);
  tree.insert(4);

  print("In-order traversal of the binary tree:");
  tree.inOrderTraversal(0);
}
