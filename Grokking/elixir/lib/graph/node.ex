defmodule Grokking.Node do
  @moduledoc """
  Defines a graph node struct.
  """

  @enforce_keys [:id]
  defstruct [
    :id,
    :data
  ]
end
