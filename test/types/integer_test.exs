defmodule ExUnitAssertMatch.Types.IntegerTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types}

  setup do
    %{type: %Types.Integer{}}
  end

  describe "assert" do
    test "return true if it's integer", %{type: type} do
      Type.assert(type, 1)
      Type.assert(type, 0)
      Type.assert(type, -1)

      opts = [assertion_module: ExUnitAssertMatch.ThrowTupleOnFail]
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts))
    end
  end
end
