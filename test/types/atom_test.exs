defmodule ExUnitAssertMatch.Types.AtomTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types}

  setup do
    %{type: %Types.Atom{}}
  end

  describe "assert" do
    test "pass if atom is given", %{type: type} do
      Type.assert(type, :atom)
      Type.assert(type, :'hello world')
      Type.assert(type, Elixir)

      opts = [assertion_module: ExUnitAssertMatch.ThrowTupleOnFail]
      assert {:error, _} = catch_throw(Type.assert(type, 'abc', opts))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts))
    end
  end
end
