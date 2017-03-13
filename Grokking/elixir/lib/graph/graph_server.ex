defmodule Grokking.GraphServer do
  @moduledoc """
  The naieve graph data structure using GenServer.
  """

  use GenServer

  alias Grokking.Edge
  alias Grokking.Graph
  alias Grokking.Node

  ### GenServer API

  def init(_state) do
    {:ok, %Graph{edges: %{}, nodes: %{}}}
  end

  def handle_call({:create_edge, spec}, _from, graph) do
    {%Graph{} = updated_graph, %Edge{} = edge} = Graph.create_edge(graph, spec)
    {:reply, edge, updated_graph}
  end

  def handle_call({:create_node, data}, _from, graph) do
    {%Graph{} = updated_graph, %Node{} = node} = Graph.create_node(graph, data)
    {:reply, node, updated_graph}
  end

  def handle_call({:get_graph}, _from, graph) do
    {:reply, graph, graph}
  end

  ### Client API

  def create_edge(from_id, to_id, label, data \\ %{}) do
    spec = %{
      data: data,
      from: from_id,
      label: label,
      to: to_id
    }

    GenServer.call(__MODULE__, {:create_edge, spec})
  end

  def create_node(data \\ %{}) do
    GenServer.call(__MODULE__, {:create_node, data})
  end

  def get_graph do
    GenServer.call(__MODULE__, {:get_graph})
  end

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end
end
