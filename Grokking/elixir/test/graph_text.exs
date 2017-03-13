defmodule Grokking.GraphTest do
  alias Grokking.Edge
  alias Grokking.Graph
  alias Grokking.Node
  use ExUnit.Case, async: true

  test "it should create a graph Struct" do
    assert %Graph{}
  end

  test "it should create a node struct" do
    assert %Node{
      edges: %{
        in: [],
        out: []
      },
      id: _,
      data: %{
        name: "Mikey"
      }
    } = Graph.create_node(%{name: "Mikey"})
  end

  test "it should create an edge between two node structs" do
    %Node{ id: fromId }= Graph.create_node(%{name: "Mikey"})
    %Node{ id: toId } = Graph.create_node(%{name: "Chunk"})

    Graph.create_edge(fromId, toId, "HAS_FRIEND", %{city: "Astoria"})

    assert %Edge{
      data: %{
        city: "Astoria",
      },
      label: "HAS_FRIEND",
      from: fromId,
      id: _,
      to: toId
    } = Graph.create_edge(fromId, toId, "HAS_FRIEND", %{city: "Astoria"})
  end
end
