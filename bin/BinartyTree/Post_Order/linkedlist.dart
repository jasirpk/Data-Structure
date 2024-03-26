// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, unnecessary_null_comparison, unused_element

class Node {
  var value;
  Node? left;
  Node? right;
  Node(this.value);
}

class BinaryTree {
  Node? root;

  void insert(int value) {
    root = insertRec(root, value);
  }

  Node? insertRec(Node? root, int value) {
    if (root == null) {
      return Node(value);
    }

    if (value < root.value) {
      root.left = insertRec(root.left, value);
    } else if (value > root.value) {
      root.right = insertRec(root.right, value);
    }
    return root;
  }

  void postOrderTraversal(Node? node) {
    if (node != null) {
      postOrderTraversal(node.left);
      postOrderTraversal(node.right);
      print(node.value);
    }
  }

  void delete(int value) {
    root = deleteRec(root, value);
  }

  Node? deleteRec(Node? root, int value) {
    if (root == null) {
      return root;
    }
    if (value < root.value) {
      root.left = deleteRec(root.left, value);
    } else if (value > root.value) {
      root.right = deleteRec(root.right, value);
    } else {
      if (root.left == null) {
        return deleteRec(root.right, value);
      } else if (root.right == null) {
        return deleteRec(root.left, value);
      }
      root.value = minvalue(root.right);
      root.right = deleteRec(root.right, root.value);
    }
    return root;
  }

  int minvalue(Node? node) {
    int min = node!.value;
    while (node!.left != null) {
      min = node.left!.value;
      node = node.left;
    }
    return min;
  }

  Node? search(int value) {
    return searchRec(root, value);
  }

  Node? searchRec(Node? node, int value) {
    if (node == null || node.value == value) {
      return node;
    }
    if (value < node.value) {
      return searchRec(node.left, value);
    } else if (value > node.value) {
      return searchRec(node.right, value);
    }
  }

  int findsmallestvalue(Node? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node.value;
  }

  int findlargestvalue(Node? node) {
    while (node!.right != null) {
      node = node.right;
    }
    return node.value;
  }

  int findSeconLargestValue(Node? node) {
    if (node!.right == null && node.left != null) {
      return findlargestvalue(node.left);
    }
    if (node.right != null &&
        node.right!.left == null &&
        node.right!.right == null) {
      return node.value;
    }
    return findSeconLargestValue(node.right);
  }

  int findClossestvalue(Node? node, int target) {
    int clossestvalue = node!.value;
    while (node != null) {
      if ((node.value - target).abs() < (clossestvalue - target).abs()) {
        clossestvalue = node.value;
      }
      if (node.value == target) {
        break;
      } else if (node.value < target) {
        node = node.left;
      } else {
        node = node.right;
      }
    }
    return clossestvalue;
  }

  bool isBST() {
    int? prevevalue;
    bool isBstUtil(Node? node) {
      if (node == null) return true;
      if (!isBstUtil(node.left)) return false;
      if (prevevalue != null && prevevalue! >= node.value) return false;
      prevevalue = node.value;
      return isBstUtil(node.right);
    }

    return isBstUtil(root);
  }
}

void main() {
  BinaryTree tree = BinaryTree();
  tree.insert(8);
  tree.insert(10);
  tree.insert(60);
  tree.insert(80);
  tree.insert(73);

  tree.postOrderTraversal(tree.root);
  tree.delete(6);
  print('afere delerek');
  tree.postOrderTraversal(tree.root);

  Node? searchval = tree.search(3);
  if (searchval != null) {
    print('searched value is ${searchval.value}');
  } else {
    print('not found');
  }

  int? smallestvalue = tree.findsmallestvalue(tree.root);
  if (smallestvalue != null) {
    print('smallest value is $smallestvalue');
  } else {
    print('value not found');
  }

  int? largestvalue = tree.findlargestvalue(tree.root);
  if (largestvalue != null) {
    print('largest value is $largestvalue');
  } else {
    print('value not found');
  }

  int? secondlargestvalue = tree.findSeconLargestValue(tree.root);
  if (secondlargestvalue != null) {
    print('second largest value is $secondlargestvalue');
  } else {
    print('value not found');
  }

  int target = 10;
  int clossestvalue = tree.findClossestvalue(tree.root, target);
  if (clossestvalue != null) {
    print('clossestvalue is $clossestvalue');
  } else {
    print('not found');
  }
  bool isBSt = tree.isBST();
  print('Is the binary tree a isBST $isBSt');
}
