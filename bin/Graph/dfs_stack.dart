// ignore_for_file: prefer_initializing_formals, prefer_collection_literals

class Graph {
  late int vertices;
  late List<List<int>> adjacencyList;

  Graph(int vertices) {
    this.vertices = vertices;
    adjacencyList = List<List<int>>.generate(vertices, (index) => []);
  }

  void addEdge(int v, int w) {
    adjacencyList[v].add(w);
  }

  void dfs(int startVertex) {
    Set<int> visited = Set<int>();
    List<int> stack = [];

    visited.add(startVertex);
    stack.add(startVertex);

    while (stack.isNotEmpty) {
      int currentVertex = stack.removeLast();
      print(currentVertex);

      List<int> neighbors = adjacencyList[currentVertex];
      for (int neighbor in neighbors) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          stack.add(neighbor);
        }
      }
    }
  }
}

void main() {
  Graph graph = Graph(4);
  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 0);
  graph.addEdge(2, 3);
  graph.addEdge(3, 3);

  print("Depth First Traversal starting from vertex 2:");
  graph.dfs(2);
}
