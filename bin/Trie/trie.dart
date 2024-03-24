class TrieNode {
  late Map<String, TrieNode> children = {};
  late bool isEndOfWord = false;
}

class Trie {
  late TrieNode _root;

  Trie() {
    _root = TrieNode();
  }

  void insert(String word) {
    TrieNode current = _root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        current.children[char] = TrieNode();
      }
      current = current.children[char]!;
    }
    current.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode current = _root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        return false;
      }
      current = current.children[char]!;
    }
    return current.isEndOfWord;
  }

  bool _isEmptyNode(TrieNode node) {
    return node.children.isEmpty && !node.isEndOfWord;
  }

  bool _deleteHelper(TrieNode node, String word, int index) {
    if (index == word.length) {
      if (!node.isEndOfWord) {
        return false;
      }
      node.isEndOfWord = false;
      return _isEmptyNode(node);
    }

    String char = word[index];
    if (!node.children.containsKey(char)) {
      return false;
    }

    bool shouldDeleteCurrentNode =
        _deleteHelper(node.children[char]!, word, index + 1);

    if (shouldDeleteCurrentNode) {
      node.children.remove(char);
      return _isEmptyNode(node);
    }

    return false;
  }

  void delete(String word) {
    if (word.isEmpty) return;
    _deleteHelper(_root, word, 0);
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("apple");
  trie.insert("app");
  trie.insert("application");

  print(trie.search("apple")); // true
  print(trie.search("app")); // true
  print(trie.search("application")); // true
  print(trie.search("appl")); // false

  trie.delete("app");
  print(trie.search("app")); // false
  print(trie.search("apple")); // true
}
