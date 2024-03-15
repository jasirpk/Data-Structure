//**********************************insertion Only*********************** */

// class TreeNode {
//   int value;
//   TreeNode? leftChild;
//   TreeNode? rightChild;

//   TreeNode(this.value);
// }

// class BinaryTree {
//   TreeNode? root;

//   void insert(int value) {
//     root = _insertRec(root, value);
//   }

//   TreeNode _insertRec(TreeNode? root, int value) {
//     if (root == null) {
//       return TreeNode(value);
//     }

//     if (value < root.value) {
//       root.leftChild = _insertRec(root.leftChild, value);
//     } else if (value > root.value) {
//       root.rightChild = _insertRec(root.rightChild, value);
//     }

//     return root;
//   }

//   void postOrderTraversal(TreeNode? node) {
//     if (node != null) {
//       postOrderTraversal(node.leftChild);
//       postOrderTraversal(node.rightChild);
//       print(node.value);
//     }
//   }
// }

// void main() {
//   BinaryTree tree = BinaryTree();

//   tree.insert(5);
//   tree.insert(3);
//   tree.insert(8);
//   tree.insert(1);
//   tree.insert(4);

//   print("Post-order traversal of the binary tree:");
//   tree.postOrderTraversal(tree.root);
// }

//**********************************Every Operations*********************** */

// ignore_for_file: unnecessary_null_comparison

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

  void postOrderTraversal(TreeNode? node) {
    if (node != null) {
      postOrderTraversal(node.leftChild);
      postOrderTraversal(node.rightChild);
      print(node.value);
    }
  }

  TreeNode? search(int value) {
    return _searchRec(root, value);
  }

  TreeNode? _searchRec(TreeNode? node, int value) {
    if (node == null || node.value == value) {
      return node;
    }

    TreeNode? leftResult = _searchRec(node.leftChild, value);
    TreeNode? rightResult = _searchRec(node.rightChild, value);

    return leftResult ?? rightResult;
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
      if (root.leftChild == null) {
        return root.rightChild;
      } else if (root.rightChild == null) {
        return root.leftChild;
      }

      root.value = _minValue(root.rightChild!);
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

  int findClosestValue(TreeNode? node, int target) {
    int closestValue = node!.value;

    while (node != null) {
      if ((node.value - target).abs() < (closestValue - target).abs()) {
        closestValue = node.value;
      }

      if (node.value == target) {
        break;
      } else if (target < node.value) {
        node = node.leftChild;
      } else {
        node = node.rightChild;
      }
    }

    return closestValue;
  }

  bool isBst() {
    int? prevvalue;
    bool isBstUtil(TreeNode? node) {
      if (node == null) return true;
      if (!isBstUtil(node.leftChild)) return false;
      if (prevvalue != null && prevvalue! >= node.value) return false;
      prevvalue = node.value;
      return isBstUtil(node.rightChild);
    }

    return isBstUtil(root);
  }

  int? findSecondLargestValue(TreeNode? node) {
    // Handle the case where the tree is empty or has only one node
    if (node == null || (node.leftChild == null && node.rightChild == null)) {
      return null;
    }

    // If the largest node has no right child but has a left child, the second largest is the largest in the left subtree
    if (node.rightChild == null && node.leftChild != null) {
      return findLargestValue(node.leftChild);
    }

    // If the largest node has a right child and that child has no left child, then the largest node is the second largest
    if (node.rightChild != null && node.rightChild!.leftChild == null) {
      return node.value;
    }

    // Otherwise, continue traversing the right subtree to find the second largest
    return findSecondLargestHelper(node.rightChild);
  }

  int findSecondLargestHelper(TreeNode? node) {
    while (node!.rightChild!.rightChild != null) {
      node = node.rightChild;
    }
    return node.value;
  }

  int findLargestValue(TreeNode? node) {
    // Traverse to the rightmost node
    while (node!.rightChild != null) {
      node = node.rightChild;
    }
    return node.value;
  }
}

void main() {
  BinaryTree tree = BinaryTree();

  tree.insert(5);
  tree.insert(3);
  tree.insert(8);
  tree.insert(1);
  tree.insert(4);

  print("Post-order traversal of the binary tree:");
  tree.postOrderTraversal(tree.root);

  var searchResult = tree.search(3);
  if (searchResult != null) {
    print("Node found: ${searchResult.value}");
  } else {
    print("Node not found");
  }

  tree.delete(3);
  print("Post-order traversal after deleting node with value 3:");
  tree.postOrderTraversal(tree.root);

  // Find the closest value to the target value
  int targetValue = 8;
  int closestValue = tree.findClosestValue(tree.root, targetValue);
  print("Closest value to $targetValue in the binary tree: $closestValue");
  bool isBST = tree.isBst();
  print("Is the binary tree a BST? $isBST"); // Printing the first largest value
  int? largestValue = tree.findLargestValue(tree.root);
  if (largestValue != null) {
    print('First largest value: $largestValue');
  } else {
    print('The tree is empty.');
  }

  // Printing the second largest value
  int? secondLargestValue = tree.findSecondLargestValue(tree.root);
  if (secondLargestValue != null) {
    print('Second largest value: $secondLargestValue');
  } else {
    print('There is no second largest value.');
  }
}
