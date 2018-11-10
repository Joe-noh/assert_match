defmodule ExUnitAssertMatch.Types.AtomTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  setup do
    %{type: %Types.Atom{}, opts: %Option{}, state: %InternalState{}}
  end

  describe "assert" do
    test "pass if atom is given", %{type: type, opts: opts, state: state} do
      Type.assert(type, :atom, opts, state)
      Type.assert(type, :"hello world", opts, state)
      Type.assert(type, Elixir, opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, 'abc', opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts, state))
    end
  end
end
