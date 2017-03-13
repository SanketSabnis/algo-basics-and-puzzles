defmodule Grokking.GraphTest do
  alias Grokking.Edge
  alias Grokking.Graph
  alias Grokking.Node
  use ExUnit.Case, async: true

  # https://github.com/elixir-lang/elixir/blob/master/lib/elixir/lib/access.ex#L63
  import Access, only: [key!: 1]

  setup _context do
    {:ok, [graph: %Graph{edges: %{}, nodes: %{}}]}
  end

  test "it should create a graph Struct", context do
    assert %Graph{} = context[:graph]
  end

  test "it should create a node struct", context do
    {%Graph{} = graph, %Node{} = node} = Graph.create_node(context[:graph], %{name: "Mikey"})
    assert %Node{
      id: _,
      data: %{
        name: "Mikey"
      }
    } = node

    assert get_in(graph, [key!(:nodes), node.id]) == node
  end

  test "it should create an edge between two node structs", context do
    {%Graph{} = graph, %Node{} = from} = Graph.create_node(context[:graph], %{name: "Mikey"})
    {%Graph{} = graph, %Node{} = to} = Graph.create_node(graph, %{name: "Chunk"})

    spec = %{
      data: %{city: "Astoria", state: "Oregon"},
      from: from.id,
      label: :HAS_FRIEND,
      to: to.id
    }

    {%Graph{} = graph, %Edge{} = edge} = Graph.create_edge(graph, spec)

    assert %Edge{
      data: %{city: "Astoria", state: "Oregon"},
      from: _,
      id: _,
      label: :HAS_FRIEND,
      to: _
    } = edge

    assert get_in(graph, [key!(:edges), edge.id]) == edge
  end
end
