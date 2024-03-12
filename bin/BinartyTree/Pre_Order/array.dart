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

  List<int> preOrderTraversal() {
    List<int> result = [];
    _preOrderTraversalHelper(root, result);
    return result;
  }

  void _preOrderTraversalHelper(TreeNode? node, List<int> result) {
    if (node != null) {
      result.add(node.value); // Add the current node value
      _preOrderTraversalHelper(node.leftChild, result); // Recur on left subtree
      _preOrderTraversalHelper(
          node.rightChild, result); // Recur on right subtree
    }
  }
}

void main() {
  BinaryTree tree = BinaryTree();

  tree.insert(5);
  tree.insert(3);
  tree.insert(8);
  tree.insert(1);
  tree.insert(4);

  print("Pre-order traversal of the binary tree:");
  print(tree.preOrderTraversal());
}
