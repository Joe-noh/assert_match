defmodule ExUnitAssertMatch.Types.AtomTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types, Option}

  setup do
    %{type: %Types.Atom{}, opts: %Option{}}
  end

  describe "assert" do
    test "pass if atom is given", %{type: type, opts: opts} do
      Type.assert(type, :atom, opts)
      Type.assert(type, :'hello world', opts)
      Type.assert(type, Elixir, opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, 'abc', opts))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts))
    end
  end
end
