defmodule ExUnitAssertMatch.Types.IntegerTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option}

  setup do
    %{type: %Types.Integer{}, opts: %Option{}}
  end

  describe "assert" do
    test "return true if it's integer", %{type: type, opts: opts} do
      Type.assert(type, 1, opts)
      Type.assert(type, 0, opts)
      Type.assert(type, -1, opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts))
    end
  end
end
