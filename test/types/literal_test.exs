defmodule ExUnitAssertMatch.Types.LiteralTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  setup do
    %{type: %Types.Literal{example: "hello"}, opts: %Option{}, state: %InternalState{}}
  end

  describe "assert" do
    test "pass if match with `==`", %{type: type, opts: opts, state: state} do
      Type.assert(type, "hello", opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, :hello, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, "Hello", opts, state))
    end
  end
end
