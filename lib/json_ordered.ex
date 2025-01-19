defmodule JSONOrdered do
  @moduledoc """
  A simple struct and encoder for the Elixir 1.18+ [JSON](https://hexdocs.pm/elixir/JSON.html) module that allows you to encode JSON data with the keys in the specified order.

  This is handy for external facing API's where the order of keys makes it easier to reason about the response content.

  ## Usage

  Provide the data as a keyword list to `JSONOrdered.new/1`:

  ```elixir
  JSONOrdered.new(a: 1, b: 2, c: 3)
  ```

  When the JSON module encodes the data, the order of the keys will be preserved:

  ```json
  {
    "a": 1,
    "b": 2,
    "c": 3
  }
  ```

  For example, in a Phoenix controller, you could do something like:

  ```elixir
  def index(conn, _params) do
    conn
    |> json(JSONOrdered.new(
      id: "123",
      name: "John Doe",
      email: "john.doe@example.com"
    ))
  end
  ```
  """

  defstruct [:data]

  def new(data) when is_list(data), do: %JSONOrdered{data: data}
end

defimpl JSON.Encoder, for: JSONOrdered do
  def encode(%{data: []}, _encoder), do: "{}"

  def encode(%{data: data}, encoder) do
    {io, _} =
      data
      |> Enum.flat_map_reduce(?{, fn {field, value}, prefix ->
        key = IO.iodata_to_binary([prefix, :elixir_json.encode_binary(Atom.to_string(field)), ?:])
        {[key, encoder.(value, encoder)], ?,}
      end)

    io ++ [?}]
  end
end
