defmodule ExUnitAssertMatch.Types.NullableTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  setup do
    %{type: %Types.Nullable{example: %Types.Binary{}}, opts: %Option{}, state: %InternalState{}}
  end

  describe "assert" do
    test "pass if it's binary or nil", %{type: type, opts: opts, state: state} do
      Type.assert(type, nil, opts, state)
      Type.assert(type, "hello", opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, 1, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts, state))
    end
  end
end
