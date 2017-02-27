defmodule Grokking.SortTest do
  alias Grokking.Sort
  use ExUnit.Case, async: true

  @list [
    8133, 7556, 7422, 1992, 2224, 8117, 4972, 1094, 31, 1743,
    9727, 8697, 638, 3929, 8133, 8464, 2238, 2276, 628, 6383
  ]

  test "selection sort: it should sort a list of values" do
    assert Sort.selection(@list) == Enum.sort(@list)
  end

  test "quicksort: it should sort a list of values" do
    assert Sort.quick(@list) == Enum.sort(@list)
  end
end
