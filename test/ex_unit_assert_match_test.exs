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
      }, exact_same_keys: true)

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

  test "aliases" do
    assert M.literal("Hello") == M.equal("Hello")
    assert M.nullable_atom() == M.nullable(M.atom())
    assert M.nullable_binary() == M.nullable(M.binary())
    assert M.nullable_integer() == M.nullable(M.integer())
    assert M.nullable_float() == M.nullable(M.float())
    assert M.nullable_map() == M.nullable(M.map())
    assert M.nullable_list() == M.nullable(M.list())
    assert M.nullable_map(M.atom()) == M.nullable(M.map(M.atom()))
    assert M.nullable_list_of(M.atom()) == M.nullable(M.list_of(M.atom()))
    assert M.nullable_literal("Hello") == M.nullable(M.literal("Hello"))
  end
end
