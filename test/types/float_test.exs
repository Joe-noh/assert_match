defmodule ExUnitAssertMatch.Types.FloatTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  setup do
    %{type: %Types.Float{}, opts: %Option{}, state: %InternalState{}}
  end

  describe "assert" do
    test "return true if it's float", %{type: type, opts: opts, state: state} do
      Type.assert(type, 0.0, opts, state)
      Type.assert(type, 3.14, opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, 1, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, "1.0", opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts, state))
    end
  end
end
