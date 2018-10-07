# ExUnitAssertMatch

[![CircleCI](https://circleci.com/gh/Joe-noh/ex_unit_assert_match.svg?style=svg)](https://circleci.com/gh/Joe-noh/ex_unit_assert_match)

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
      first_name: Match.binary(),
      last_name: Match.any(),
      age: Match.integer(),
      height: Match.float(),
      orgs: Match.list_of(Match.map %{
        id: Match.atom(),
        name: Match.binary(),
      }),
    }

    Match.assert(expected, %{
      first_name: "John",
      last_name: "Doe",
      age: 28,
      height: 172.5,
      orgs: [%{
        id: :github,
        name: "GitHub",
      }],
    })
  end
end
```
