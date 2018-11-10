defmodule ExUnitAssertMatch.Types.ListTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  describe "without example" do
    setup do
      %{type: %Types.List{}, opts: %Option{}, state: %InternalState{}}
    end

    test "return true if it's list", %{type: type, opts: opts, state: state} do
      Type.assert(type, [], opts, state)
      Type.assert(type, [1, 2, 3], opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, :list, opts, state))
    end
  end

  describe "with example" do
    setup do
      type = %Types.List{example: %Types.Binary{}}

      %{type: type, opts: %Option{}, state: %InternalState{}}
    end

    test "fails if the element does not match", %{type: type, opts: opts, state: state} do
      Type.assert(type, [], opts, state)
      Type.assert(type, ["a", "b", "c"], opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, [1, 2, 3], opts, state))
    end
  end
end
