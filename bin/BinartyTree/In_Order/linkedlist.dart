//**********************************insertion Only*********************** */

// class TreeNode {
//   int value;
//   TreeNode? leftChild;
//   TreeNode? rightChild;

//   TreeNode(this.value);
// }

// class BinaryTree {
//   TreeNode? root;

// void insert(int value) {
//   root = _insertRec(root, value);
// }

// TreeNode _insertRec(TreeNode? root, int value) {
//   if (root == null) {
//     return TreeNode(value);
//   }

//   if (value < root.value) {
//     root.leftChild = _insertRec(root.leftChild, value);
//   } else if (value > root.value) {
//     root.rightChild = _insertRec(root.rightChild, value);
//   }

//   return root;
// }

// void inOrderTraversal(TreeNode? node) {
//   if (node != null) {
//     inOrderTraversal(node.leftChild);
//     print(node.value);
//     inOrderTraversal(node.rightChild);
//   }
// }
// }

// void main() {
//   BinaryTree tree = BinaryTree();

//   tree.insert(5);
//   tree.insert(3);
//   tree.insert(8);
//   tree.insert(1);
//   tree.insert(4);

//   print("In-order traversal of the binary tree:");
//   tree.inOrderTraversal(tree.root);
// }

//**********************************Every Operations*********************** */

class TreeNode {
  int value;
  TreeNode? leftChild;
  TreeNode? rightChild;

  TreeNode(this.value);
}

class BinaryTree {
  TreeNode? root;

  void insert(int value) {
    root = _insertRec(root, value);
  }

  TreeNode _insertRec(TreeNode? root, int value) {
    if (root == null) {
      return TreeNode(value);
    }

    if (value < root.value) {
      root.leftChild = _insertRec(root.leftChild, value);
    } else if (value > root.value) {
      root.rightChild = _insertRec(root.rightChild, value);
    }

    return root;
  }

  void inOrderTraversal(TreeNode? node) {
    if (node != null) {
      inOrderTraversal(node.leftChild);
      print(node.value);
      inOrderTraversal(node.rightChild);
    }
  }

  TreeNode? search(int value) {
    return _searchRec(root, value);
  }

  TreeNode? _searchRec(TreeNode? node, int value) {
    if (node == null || node.value == value) {
      return node;
    }

    if (value < node.value) {
      return _searchRec(node.leftChild, value);
    } else {
      return _searchRec(node.rightChild, value);
    }
  }

  void delete(int value) {
    root = _deleteRec(root, value);
  }

  TreeNode? _deleteRec(TreeNode? root, int value) {
    if (root == null) return root;

    if (value < root.value) {
      root.leftChild = _deleteRec(root.leftChild, value);
    } else if (value > root.value) {
      root.rightChild = _deleteRec(root.rightChild, value);
    } else {
      // Node with only one child or no child
      if (root.leftChild == null) {
        return root.rightChild;
      } else if (root.rightChild == null) {
        return root.leftChild;
      }

      // Node with two children: Get the inorder successor (smallest in the right subtree)
      root.value = _minValue(root.rightChild!);

      // Delete the inorder successor
      root.rightChild = _deleteRec(root.rightChild, root.value);
    }
    return root;
  }

  int _minValue(TreeNode node) {
    int minv = node.value;
    while (node.leftChild != null) {
      minv = node.leftChild!.value;
      node = node.leftChild!;
    }
    return minv;
  }
}

void main() {
  BinaryTree tree = BinaryTree();

  tree.insert(5);
  tree.insert(3);
  tree.insert(8);
  tree.insert(1);
  tree.insert(4);

  print("In-order traversal of the binary tree:");
  tree.inOrderTraversal(tree.root);

  var searchResult = tree.search(3);
  if (searchResult != null) {
    print("Node found: ${searchResult.value}");
  } else {
    print("Node not found");
  }

  tree.delete(3);
  print("In-order traversal after deleting node with value 3:");
  tree.inOrderTraversal(tree.root);
}
