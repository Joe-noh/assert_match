defmodule ExUnitAssertMatch.Types.BinaryTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types}

  setup do
    %{type: %Types.Binary{}}
  end

  describe "assert" do
    test "return true if it's binary", %{type: type} do
      Type.assert(type, "abc")
      Type.assert(type, "")
      Type.assert(type, <<123, 456>>)

      opts = [assertion_module: ExUnitAssertMatch.ThrowTupleOnFail]
      assert {:error, _} = catch_throw(Type.assert(type, 1, opts))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts))
      assert {:error, _} = catch_throw(Type.assert(type, [:a], opts))
    end
  end
end
