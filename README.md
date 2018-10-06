# ExUnitAssertMatch

A package helps to assert that given data matches expected structure.

## Installation

Can be installed by adding `ex_unit_assert_match` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_unit_assert_match, "~> 0.1.0", only: :test}
  ]
end
```

## Usage

```elixir
defmodule SomeTest do
  use ExUnit.Case
  alias ExUnitAssertMatch, as: Match

  test "match" do
    expected = Match.map %{
      name: Match.binary(),
      age: Match.integer(),
      height: Match.float(),
      orgs: Match.list_of(Match.map %{
        name: Match.binary(),
      }),
    }

    Match.assert(expected, %{
      name: "John Doe",
      age: 28,
      height: 172.5,
      orgs: [%{
        name: "GitHub",
      }],
    })
  end
end
```
