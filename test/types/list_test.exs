defmodule ExUnitAssertMatch.Types.ListTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option}

  describe "without example" do
    setup do
      %{type: %Types.List{}, opts: %Option{}}
    end

    test "return true if it's list", %{type: type, opts: opts} do
      Type.assert(type, [], opts)
      Type.assert(type, [1, 2, 3], opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts))
      assert {:error, _} = catch_throw(Type.assert(type, :list, opts))
    end
  end

  describe "with example" do
    setup do
      type = %Types.List{example: %Types.Binary{}}

      %{type: type, opts: %Option{}}
    end

    test "fails if the element does not match", %{type: type, opts: opts} do
      Type.assert(type, [], opts)
      Type.assert(type, ["a", "b", "c"], opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, [1, 2, 3], opts))
    end
  end
end
