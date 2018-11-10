defmodule ExUnitAssertMatch.Types.BinaryTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  setup do
    %{type: %Types.Binary{}, opts: %Option{}, state: %InternalState{}}
  end

  describe "assert" do
    test "return true if it's binary", %{type: type, opts: opts, state: state} do
      Type.assert(type, "abc", opts, state)
      Type.assert(type, "", opts, state)
      Type.assert(type, <<123, 456>>, opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, 1, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts, state))
    end
  end

  describe "regex" do
    setup %{type: type} do
      %{type: %Types.Binary{type | regex: ~r/a/}}
    end

    test "return true if it's binary and match the regex", %{type: type, opts: opts, state: state} do
      Type.assert(type, "abc", opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, "bb", opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts, state))
    end
  end
end
