// ignore_for_file: prefer_final_fields

class Graph {
  late Map<int, List<int>> _adjacencyList = {};

  // Graph() {
  //   _adjacencyList = {};
  // }

  void addVertex(int vertex) {
    if (!_adjacencyList.containsKey(vertex)) {
      _adjacencyList[vertex] = [];
    }
  }

  void addEdge(int source, int destination) {
    if (!_adjacencyList.containsKey(source)) {
      addVertex(source);
    }
    if (!_adjacencyList.containsKey(destination)) {
      addVertex(destination);
    }
    _adjacencyList[source]!.add(destination);
    // For undirected graph, add the reverse edge as well
    // _adjacencyList[destination].add(source);
  }

  void removeEdge(int source, int destination) {
    if (_adjacencyList.containsKey(source)) {
      _adjacencyList[source]!.remove(destination);
    }
    // For undirected graph, remove the reverse edge as well
    // if (_adjacencyList.containsKey(destination)) {
    //   _adjacencyList[destination].remove(source);
    // }
  }

  void removeVertex(int vertex) {
    _adjacencyList.remove(vertex);
    _adjacencyList.forEach((key, value) {
      value.remove(vertex);
    });
  }

  bool hasEdge(int source, int destination) {
    return _adjacencyList.containsKey(source) &&
        _adjacencyList[source]!.contains(destination);
  }

  List<int> getVertices() {
    return _adjacencyList.keys.toList();
  }

  List<int>? getNeighbors(int vertex) {
    return _adjacencyList.containsKey(vertex) ? _adjacencyList[vertex] : [];
  }

  void printGraph() {
    _adjacencyList.forEach((key, value) {
      print("$key -> ${value.toString()}");
    });
  }
}

void main() {
  var graph = Graph();

  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(1, 2);
  graph.addEdge(2, 3);

  print("Graph:");
  graph.printGraph();

  print("\nVertices:");
  print(graph.getVertices());

  print("\nNeighbors of vertex 2:");
  print(graph.getNeighbors(2));

  print("\nRemoving edge between 0 and 2:");
  graph.removeEdge(0, 2);
  graph.printGraph();

  print("\nRemoving vertex 2:");
  graph.removeVertex(2);
  graph.printGraph();
}
