defmodule ExUnitAssertMatch.Types.BinaryTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types, Option}

  setup do
    %{type: %Types.Binary{}, opts: %Option{}}
  end

  describe "assert" do
    test "return true if it's binary", %{type: type, opts: opts} do
      Type.assert(type, "abc", opts)
      Type.assert(type, "", opts)
      Type.assert(type, <<123, 456>>, opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, 1, opts))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts))
    end
  end
end
