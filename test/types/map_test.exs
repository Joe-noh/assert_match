defmodule ExUnitAssertMatch.Types.MapTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types}

  describe "without example" do
    setup do
      %{type: %Types.Map{}}
    end

    test "return true if it's map", %{type: type} do
      Type.assert(type, %{})
      Type.assert(type, %{a: 1})

      opts = [assertion_module: ExUnitAssertMatch.ThrowTupleOnFail]
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts))
      assert {:error, _} = catch_throw(Type.assert(type, :map, opts))
    end
  end

  describe "with example" do
    setup do
      type = %Types.Map{expected: %{
        name: %Types.Binary{}
      }}

      %{type: type}
    end

    test "fails if the element does not match", %{type: type} do
      Type.assert(type, %{name: "John"})

      opts = [assertion_module: ExUnitAssertMatch.ThrowTupleOnFail]
      assert {:error, _} = catch_throw(Type.assert(type, %{}, opts))
      assert {:error, _} = catch_throw(Type.assert(type, %{name: :john}, opts))
      assert {:error, _} = catch_throw(Type.assert(type, %{age: 28}, opts))
    end
  end
end
