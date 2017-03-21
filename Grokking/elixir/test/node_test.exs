defmodule Grokking.NodeTest do
  alias Grokking.Node
  use ExUnit.Case, async: true

  test "it should create a new node" do
    assert %Node{id: 1}
  end
end
