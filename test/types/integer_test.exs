defmodule ExUnitAssertMatch.Types.IntegerTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  setup do
    %{type: %Types.Integer{}, opts: %Option{}, state: %InternalState{}}
  end

  describe "assert" do
    test "return true if it's integer", %{type: type, opts: opts, state: state} do
      Type.assert(type, 1, opts, state)
      Type.assert(type, 0, opts, state)
      Type.assert(type, -1, opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts, state))
    end
  end
end
