class Person {
  int id;
  String name;
  Person(this.id, this.name);
}

class Testnode {
  Person person;
  Testnode? left, right;
  Testnode(this.person);
}

class Binaryobjectadd {
  Testnode? root;
  void insert(Person person) {
    root = insertionrec(person, root);
  }

  Testnode? insertionrec(Person person, Testnode? node) {
    if (node == null) {
      return Testnode(person);
    }
    if (person.id < node.person.id) {
      node.left = insertionrec(person, node.left);
    } else if (person.id > node.person.id) {
      node.right = insertionrec(person, node.right);
    }
    return node;
  }

  void inorderTraversal(Testnode? node) {
    if (node != null) {
      inorderTraversal(node.left);
      print("ID: ${node.person.id}, Name: ${node.person.name}");
      inorderTraversal(node.right);
    }
  }
}

void main() {
  Binaryobjectadd tree = Binaryobjectadd();
  tree.insert(Person(12, 'adnan'));
  tree.insert(Person(51, 'usman'));
  tree.insert(Person(9, 'kadhar'));
  tree.insert(Person(1, 'ismailikkaa'));
  tree.insert(Person(18, 'sugu'));
  print("Inorder traversal:");
  tree.inorderTraversal(tree.root);
}
