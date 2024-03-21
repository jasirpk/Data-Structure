class Graph {
  late Map<int, List<int>> adjacencyList;

  Graph() {
    adjacencyList = {};
  }

  void addVertex(int vertex) {
    if (!adjacencyList.containsKey(vertex)) {
      adjacencyList[vertex] = [];
    }
  }

  void addEdge(int vertex1, int vertex2) {
    adjacencyList[vertex1]!.add(vertex2);
    // adjacencyList[vertex2]!
    //     .add(vertex1); // Uncomment this line for undirected graph
  }

  void dfs(int startVertex) {
    Set<int> visited = {};
    _dfsRecursive(startVertex, visited);
  }

  void _dfsRecursive(int vertex, Set<int> visited) {
    visited.add(vertex);
    print(vertex);

    for (int neighbor in adjacencyList[vertex]!) {
      if (!visited.contains(neighbor)) {
        _dfsRecursive(neighbor, visited);
      }
    }
  }
}

void main() {
  Graph graph = Graph();

  // Adding vertices
  graph.addVertex(0);
  graph.addVertex(1);
  graph.addVertex(2);
  graph.addVertex(3);
  graph.addVertex(4);
  graph.addVertex(5);

  // Adding edges
  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 4);
  graph.addEdge(3, 4);
  graph.addEdge(3, 5);
  graph.addEdge(4, 5);

  // Perform DFS
  print("Depth-First Search:");
  graph.dfs(0);
}
