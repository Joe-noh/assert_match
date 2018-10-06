defmodule AssertMatchTest do
  use ExUnit.Case

  test "integration" do
    expected =
      AssertMatch.map(%{
        name: AssertMatch.binary(),
        age: AssertMatch.integer(),
        height: AssertMatch.float(),
        orgs:
          AssertMatch.list_of(
            AssertMatch.map(%{
              name: AssertMatch.binary()
            })
          )
      })

    AssertMatch.assert(expected, %{
      name: "John Doe",
      age: 28,
      height: 172.5,
      orgs: [
        %{
          name: "GitHub"
        }
      ]
    })
  end
end
