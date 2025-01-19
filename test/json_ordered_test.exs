defmodule JSONOrderedTest do
  use ExUnit.Case, async: true

  doctest JSONOrdered

  test "encodes empty list" do
    assert JSONOrdered.new([]) |> JSON.encode!() == "{}"
  end

  test "encodes to json with keys in given order" do
    assert JSONOrdered.new(
             one: 1,
             two: 2,
             three: 3,
             another:
               JSONOrdered.new(
                 ten: 10,
                 eleven: 11
               ),
             str: "oh hello there",
             map: %{a: 1},
             list: [1, 2, 3]
           )
           |> JSON.encode!() ==
             ~S({"one":1,"two":2,"three":3,"another":{"ten":10,"eleven":11},"str":"oh hello there","map":{"a":1},"list":[1,2,3]})
  end
end
