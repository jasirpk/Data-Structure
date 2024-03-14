// ignore_for_file: prefer_typing_uninitialized_variables, body_might_complete_normally_nullable

class Node {
  var value;
  Node? left;
  Node? right;
  Node(this.value);
}

class BianryTree {
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

  void inOrderTraversal(Node? node) {
    if (node != null) {
      inOrderTraversal(node.left);
      print(node.value);
      inOrderTraversal(node.right);
    }
  }

  void dele(int value) {
    root = delete(root, value);
  }

  Node? delete(Node? root, int value) {
    if (root == null) {
      return root;
    }
    if (value < root.value) {
      root.left = delete(root.left, value);
    } else if (value > root.value) {
      root.right = delete(root.right, value);
    } else {
      if (root.left == null) {
        return root.right;
      } else if (root.right == null) {
        return root.left;
      }
      root.value = minvalue(root.right);
      root.right = delete(root.right, root.value);
    }
    return root;
  }

  int minvalue(Node? node) {
    var min = node?.value;
    if (node?.left != null) {
      min = node?.left?.value;
      node = node?.left;
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

  int findclosestvalu(Node? node, int target) {
    int closestvalu = node?.value;
    while (node != null) {
      if ((node.value - target).abs() < (closestvalu - target).abs()) {
        closestvalu = node.value;
      }
      if (node.value == target) {
        break;
      } else if (target < node.value) {
        node = node.left;
      } else {
        node = node.right;
      }
    }
    return closestvalu;
  }

  bool isBst() {
    int? prevvalue;
    bool isBstUtil(Node? node) {
      if (node == null) return true;
      if (!isBstUtil(node.left)) return false;
      if (prevvalue != null && prevvalue! >= node.value) return false;
      prevvalue = node.value;
      return isBstUtil(node.right);
    }

    return isBstUtil(root);
  }
}

void main() {
  BianryTree tree = BianryTree();
  tree.insert(2);
  tree.insert(1);
  tree.insert(3);
  tree.insert(5);
  tree.insert(4);
  print('in order traversal is ');
  tree.inOrderTraversal(tree.root);
  print('after delete');
  tree.dele(2);
  tree.inOrderTraversal(tree.root);
  var searchval = tree.search(3);
  if (searchval != null) {
    print('searched value ${searchval.value}');
  } else {
    print('value not fuunnt');
  }
  int targetvalue = 6;
  int clossestvalue = tree.findclosestvalu(tree.root, targetvalue);
  print('closset value is $targetvalue in thr $clossestvalue');
  bool isBST = tree.isBst();
  print("Is the binary tree a BST? $isBST");
}
