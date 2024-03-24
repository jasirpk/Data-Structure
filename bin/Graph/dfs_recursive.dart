class Graph {
  late Map<int, List<int>> nums = {};
  void addVertex(int vertex) {
    if (!nums.containsKey(vertex)) {
      nums[vertex] = [];
    }
  }

  void addEdge(int start, int end) {
    nums[start]!.add(end);

    // for undirected Graph
    // nums[end]!.add(start);
  }

  void dfs(int startvertex) {
    Set<int> visited = {};
    dfsRecursive(startvertex, visited);
  }

  void dfsRecursive(int vertex, Set<int> visited) {
    visited.add(vertex);
    print(vertex);
    for (int neighbor in nums[vertex]!) {
      if (!visited.contains(neighbor)) {
        dfsRecursive(neighbor, visited);
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
  print('Depth_First Search:');
  graph.dfs(0);
}
