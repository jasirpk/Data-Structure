class Node {
  late Map<String, Node> words = {};
  late bool isEndofWord = false;
}

class Trie {
  Node? root;
  Trie() {
    root = Node();
  }
  void isert(String word) {
    Node? current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current!.words.containsKey(char)) {
        current.words[char] = Node();
      }
      current = current.words[char];
    }
    current!.isEndofWord = true;
  }

  bool search(String word) {
    Node? current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current!.words.containsKey(char)) {
        return false;
      }
      current = current.words[char];
    }
    return current!.isEndofWord;
  }

  bool isEmpty(Node? node) {
    return node!.words.isEmpty && !node.isEndofWord;
  }

  bool deleteHelper(Node? node, String word, int index) {
    if (index == word.length) {
      if (!node!.isEndofWord) {
        return false;
      }
      node.isEndofWord = false;
      return isEmpty(node);
    }
    String char = word[index];
    if (!node!.words.containsKey(char)) {
      return false;
    }
    bool currentNode = deleteHelper(node.words[char], word, index + 1);
    if (currentNode) {
      node.words.remove(char);
      return isEmpty(node);
    }
    return false;
  }

  void delete(String word) {
    if (word.isEmpty) return;
    deleteHelper(root, word, 0);
  }
}

void main() {
  Trie trie = Trie();
  trie.isert('Mapp');
  trie.isert('Gap');
  trie.isert('top');
  print(trie.search('top'));
  trie.delete('Mapp');
  print(trie.search('Mapp'));
}
