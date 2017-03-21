defmodule Grokking.Edge do
  @moduledoc """
  Defines a graph edge struct.
  """

  @enforce_keys [:from, :id, :label, :to]
  defstruct [
    :data,
    :from,
    :id,
    :label,
    :to
  ]
end
