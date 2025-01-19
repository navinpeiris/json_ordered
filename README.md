# JSONOrdered

A simple struct and encoder for the Elixir 1.18+ [JSON](https://hexdocs.pm/elixir/JSON.html) module that allows you to encode JSON data with the keys in the specified order.

This is handy for external facing API's where the order of keys makes it easier to reason about the response content.

## Installation

```elixir
def deps do
  [
    {:json_ordered, "~> 0.1.0"}
  ]
end
```

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

## Development

Use the following mix task before pushing commits to run the same checks that are run in CI:

```
mix ci
```

## License

The MIT License

Copyright (c) 2025-present Navin Peiris

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
