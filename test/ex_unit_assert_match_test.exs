defmodule ExUnitAssertMatchTest do
  use ExUnit.Case
  alias ExUnitAssertMatch, as: M

  test "integration" do
    expected =
      M.map(%{
        first_name: M.binary(),
        last_name: M.any(),
        nickname: M.nullable(M.binary()),
        age: M.integer(),
        height: M.float(),
        shoe_size: M.literal(10.5),
        orgs:
          M.list_of(
            M.map(%{
              id: M.atom(),
              name: M.binary()
            })
          )
      })

    M.assert(expected, %{
      first_name: "John",
      last_name: "Doe",
      nickname: nil,
      age: 28,
      height: 172.5,
      shoe_size: 10.5,
      orgs: [
        %{
          id: :github,
          name: "GitHub"
        }
      ]
    })
  end

  describe "aliases" do
  end
end
