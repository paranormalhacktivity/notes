# Depth-First Search (DFS)

## Overview
- Type: Graph traversal algorithm
- Technique: Recursive and backtracking
- Objective: Explore all nodes and edges in a graph tree, or nested structure by
diving as deep as possible along each path before backtracking.

## Key Idea
- Traversal: Starts at a node (or root) and explores as far as possible along each branch
before backtracking.
- Recursion: Uses recursion to keep track of nodes visited, moving back only when all
possible paths from the current node are explored.
- Backtracking: When no more nodes can be visited from the current node, it backtracks
to explore alternative paths.

## How It Works
1. Start at the Root: Begin at the initial node or arbitrary starting point.
2. Mark as Visited: Mark the node as visited to avoid reprocessing.
3. Recursive Exploration: Visit each connected node that hasn't been visited.
4. Backtrack When Necessary: If there are no unvisited adjacent nodes, backtrack and
explore other nodes.

## Complexity

### Time Complexity
O(V + E)

- V = Number of vertices (nodes)
- E = Number of edges

### Space Complexity
O(V)

Space needed for the call stack due to recursion and to track visited nodes.

## Significance
- Versatile: Used in various applications like cycle detection, pathfinding, and
connectivity checking.
- Foundational: DFS forms the basis for many other graph algorithms and concepts,
including finding connected components and topological sorting.

## Applications
- Finding connected components in graphs.
- Detecting cycles in directed and undirected graphs.
- Solving puzzles like mazes, where the algorithm can explore all possible paths.
- Performing tree traversals: pre-order, in-order, and post-order.

## Limitations
- Stack Overflow: For very deep or infinite graphs, the recursive nature of DFS may
lead to a stack overflow.
- May Not Find Shortest Path: Unlike Breadth-First Search (BFS), DFS doesn't guarantee
the shortest path in unweighted graphs.

## Code Example
This example demonstrates a basic DFS traversal on an adjacency list representation
of a graph in Ruby.
```ruby
require 'set'

graph = {
  'A' => ['B', 'C'],
  'B' => ['D', 'E'],
  'C' => ['F'],
  'D' => [],
  'E' => ['F'],
  'F' => [],
}

def dfs(node, visited = Set.new, graph)
  # Mark the current node as visited
  visited.add(node)

  # Print the node or perform any other processing
  puts node

  # Recursively visit all unvisited adjacent nodes
  graph[node].each do |neighbor|
    dfs(neighbor, visited, graph) unless visited.include?(neighbor)
  end
end
```

## Implementation Note
- Handling Large Structures: Ensure recursion depth is managed when dealing with
deep structures, as Ruby's default recursion limit may need adjustment.
- Adaptability: Can be modified to perform tasks beyond traversal, such as collecting
or transforming data during traversal.
