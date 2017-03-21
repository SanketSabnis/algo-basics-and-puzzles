defmodule Grokking.SearchTest do
  alias Grokking.Search
  use ExUnit.Case, async: true

  @list [
    147, 692, 2673, 2820, 3464, 3803, 3855, 4867, 6164, 6254,
    6805, 7015, 7648, 8122, 8134, 8256, 8680, 8757, 9072, 9425
  ]

  test "it should return nil for a value not found" do
    assert Search.binary(@list, 100000) == nil
    assert Search.binary([], 100) == nil
  end

  test "it should return a index for a value" do
    index = Search.binary(@list, 4867)
    assert is_integer(index)
    assert Enum.at(@list, index) == 4867
  end
end
