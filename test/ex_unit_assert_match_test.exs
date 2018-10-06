defmodule ExUnitAssertMatchTest do
  use ExUnit.Case

  test "integration" do
    expected =
      ExUnitAssertMatch.map(%{
        name: ExUnitAssertMatch.binary(),
        age: ExUnitAssertMatch.integer(),
        height: ExUnitAssertMatch.float(),
        orgs:
          ExUnitAssertMatch.list_of(
            ExUnitAssertMatch.map(%{
              name: ExUnitAssertMatch.binary()
            })
          )
      })

    ExUnitAssertMatch.assert(expected, %{
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
