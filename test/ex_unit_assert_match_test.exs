defmodule ExUnitAssertMatchTest do
  use ExUnit.Case
  alias ExUnitAssertMatch, as: M

  test "integration" do
    expected =
      M.map(%{
        name: M.binary(),
        age: M.integer(),
        height: M.float(),
        orgs:
          M.list_of(
            M.map(%{
              name: M.binary()
            })
          )
      })

    M.assert(expected, %{
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
