defmodule ExUnitAssertMatch.Types.MapTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option}

  describe "without example" do
    setup do
      %{type: %Types.Map{}, opts: %Option{}}
    end

    test "return true if it's map", %{type: type, opts: opts} do
      Type.assert(type, %{}, opts)
      Type.assert(type, %{a: 1}, opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts))
      assert {:error, _} = catch_throw(Type.assert(type, :map, opts))
    end
  end

  describe "with example" do
    setup do
      type = %Types.Map{example: %{
        name: %Types.Binary{}
      }}

      %{type: type, opts: %Option{}}
    end

    test "fails if the element does not match", %{type: type, opts: opts} do
      Type.assert(type, %{name: "John"}, opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, %{}, opts))
      assert {:error, _} = catch_throw(Type.assert(type, %{name: :john}, opts))
      assert {:error, _} = catch_throw(Type.assert(type, %{age: 28}, opts))
    end
  end
end
