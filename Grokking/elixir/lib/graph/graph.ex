defmodule Grokking.Graph do
  @moduledoc """
  A naieve graph data structure.
  """

  alias Grokking.Edge
  alias Grokking.Graph
  alias Grokking.Node

  # https://github.com/elixir-lang/elixir/blob/master/lib/elixir/lib/access.ex#L63
  import Access, only: [key!: 1]

  @enforce_keys [:nodes]
  defstruct [
    :edges,
    :nodes
  ]

  def create_node(%Graph{} = graph, %{} = data) do
    node = %Node{
      data: data,
      id: UUID.uuid4()
    }

    updated_graph = put_in(graph, [key!(:nodes), node.id], node)

    {updated_graph, node}
  end

  def create_edge(
    %Graph{} = graph,
    %{from: from, data: data, label: label, to: to}
  ) do
    edge = %Edge{
      data: data,
      from: from,
      id: UUID.uuid4(),
      label: label,
      to: to
    }

    updated_graph = put_in(graph, [key!(:edges), edge.id], edge)

    {updated_graph, edge}
  end

  def shortest_path(%Graph{}, %{from: from, to: to, label: label, predicate: predicate}) do
  end
end
