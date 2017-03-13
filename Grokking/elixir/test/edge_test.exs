defmodule Grokking.EdgeTest do
  alias Grokking.Edge
  use ExUnit.Case, async: true

  test "it should create an edge struct" do
    assert %Edge{
      data: %{
        name: "Anna"
      },
      from: 1,
      id: 1,
      label: "HAS_WIFE",
      to: 2
    }
  end
end
