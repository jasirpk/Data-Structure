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
}
