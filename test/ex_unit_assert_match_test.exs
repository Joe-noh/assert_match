defmodule ExUnitAssertMatchTest do
  use ExUnit.Case
  alias ExUnitAssertMatch, as: M

  test "integration" do
    expected =
      M.map(%{
        first_name: M.binary(),
        last_name: M.any(),
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
      first_name: "John",
      last_name: "Doe",
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
