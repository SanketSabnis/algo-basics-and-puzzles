defmodule Grokking.Parallel do
  @moduledoc """
  A module that includes various parallelized utility functions.
  """

  def pmap(collection, function) do
    collection
    |> Enum.map(&Task.async(fn -> function.(&1) end))
    |> Enum.map(&Task.await(&1))
  end
end
