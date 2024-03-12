class TreeNode {
  int value;
  TreeNode? leftChild;
  TreeNode? rightChild;

  TreeNode(this.value);
}

class LinkedListNode {
  int value;
  LinkedListNode? next;

  LinkedListNode(this.value);
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

  LinkedListNode? preOrderTraversal() {
    LinkedListNode? resultList = LinkedListNode(-1); // Dummy node
    _preOrderTraversalHelper(root, resultList);
    return resultList.next; // Return the actual head of the list
  }

  LinkedListNode? _preOrderTraversalHelper(
      TreeNode? node, LinkedListNode? resultList) {
    if (node != null) {
      resultList?.next = LinkedListNode(
          node.value); // Append the current node value to the list
      resultList = resultList?.next; // Move to the next node
      resultList = _preOrderTraversalHelper(
          node.leftChild, resultList); // Recur on left subtree
      resultList = _preOrderTraversalHelper(
          node.rightChild, resultList); // Recur on right subtree
    }
    return resultList;
  }
}

void main() {
  BinaryTree tree = BinaryTree();

  tree.insert(5);
  tree.insert(3);
  tree.insert(8);
  tree.insert(1);
  tree.insert(4);

  print("Pre-order traversal of the binary tree stored in a linked list:");

  LinkedListNode? result = tree.preOrderTraversal();
  while (result != null) {
    print(result.value);
    result = result.next;
  }
}
