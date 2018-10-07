defmodule ExUnitAssertMatch.Types.ListTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types}

  describe "without example" do
    setup do
      %{type: %Types.List{}}
    end

    test "return true if it's list", %{type: type} do
      Type.assert(type, [])
      Type.assert(type, [1, 2, 3])

      opts = [assertion_module: ExUnitAssertMatch.ThrowTupleOnFail]
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts))
      assert {:error, _} = catch_throw(Type.assert(type, :list, opts))
    end
  end

  describe "with example" do
    setup do
      type = %Types.List{expected: %Types.Binary{}}

      %{type: type}
    end

    test "fails if the element does not match", %{type: type} do
      Type.assert(type, [])
      Type.assert(type, ["a", "b", "c"])

      opts = [assertion_module: ExUnitAssertMatch.ThrowTupleOnFail]
      assert {:error, _} = catch_throw(Type.assert(type, [1, 2, 3], opts))
    end
  end
end
