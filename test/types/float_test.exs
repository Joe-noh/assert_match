defmodule ExUnitAssertMatch.Types.FloatTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types}

  setup do
    %{type: %Types.Float{}}
  end

  describe "assert" do
    test "return true if it's float", %{type: type} do
      Type.assert(type, 0.0)
      Type.assert(type, 3.14)

      opts = [assertion_module: ExUnitAssertMatch.ThrowTupleOnFail]
      assert {:error, _} = catch_throw(Type.assert(type, 1, opts))
      assert {:error, _} = catch_throw(Type.assert(type, "1.0", opts))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts))
    end
  end
end
