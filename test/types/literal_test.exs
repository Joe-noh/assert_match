defmodule ExUnitAssertMatch.Types.LiteralTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option}

  setup do
    %{type: %Types.Literal{example: "hello"}, opts: %Option{}}
  end

  describe "assert" do
    test "pass if match with `==`", %{type: type, opts: opts} do
      Type.assert(type, "hello", opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, :hello, opts))
      assert {:error, _} = catch_throw(Type.assert(type, "Hello", opts))
    end
  end
end
