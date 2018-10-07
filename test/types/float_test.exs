defmodule ExUnitAssertMatch.Types.FloatTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option}

  setup do
    %{type: %Types.Float{}, opts: %Option{}}
  end

  describe "assert" do
    test "return true if it's float", %{type: type, opts: opts} do
      Type.assert(type, 0.0, opts)
      Type.assert(type, 3.14, opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, 1, opts))
      assert {:error, _} = catch_throw(Type.assert(type, "1.0", opts))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts))
    end
  end
end
