class Graph {
  late Map<int, List<int>> nums = {};
  void addVertex(int vertex) {
    if (!nums.containsKey(vertex)) {
      nums[vertex] = [];
    }
  }

  void addEdge(int start, int end) {
    if (!nums.containsKey(start)) {
      addVertex(start);
    }
    if (!nums.containsKey(end)) {
      addVertex(end);
    }
    nums[start]!.add(end);

    // for underdirected Graph
    // nums[end]!.add(start);
  }

  removeEdge(int start, int end) {
    if (nums.containsKey(start)) {
      nums[start]!.remove(end);
    }
    // For undirected graph, remove the reverse edge as well
    // if (nums.containsKey(end)) {
    //   nums[destination].remove(start);
    // }
  }

  removeVertex(int vertex) {
    nums.remove(vertex);
    nums.forEach((key, value) {
      value.remove(vertex);
    });
  }

  bool hasEdge(int start, int end) {
    return nums.containsKey(start) && !nums[start]!.contains(end);
  }

  List<int> getVertex() {
    return nums.keys.toList();
  }

  List<int>? getNeighbors(int vertex) {
    return nums.containsKey(vertex) ? nums[vertex] : [];
  }

  void printGraph() {
    nums.forEach((key, value) {
      print('$key - ${value.toString()}');
    });
  }
}

void main() {
  Graph graph = Graph();

  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 3);

  print("Graph:");
  graph.printGraph();

  print("\nVertices:");
  print(graph.getVertex());

  print("\nNeighbors of vertex 2:");
  print(graph.getNeighbors(2));

  print("\nRemoving edge between 0 and 2:");
  graph.removeEdge(0, 2);
  graph.printGraph();

  print("\nRemoving vertex 2:");
  graph.removeVertex(2);
  graph.printGraph();
}
