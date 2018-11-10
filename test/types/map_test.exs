defmodule ExUnitAssertMatch.Types.MapTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  describe "without example" do
    setup do
      %{type: %Types.Map{}, opts: %Option{}, state: %InternalState{}}
    end

    test "return true if it's map", %{type: type, opts: opts, state: state} do
      Type.assert(type, %{}, opts, state)
      Type.assert(type, %{a: 1}, opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, "1", opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, :map, opts, state))
    end
  end

  describe "with example" do
    setup do
      type = %Types.Map{
        example: %{
          name: %Types.Binary{}
        }
      }

      %{type: type, opts: %Option{}, state: %InternalState{}}
    end

    test "fails if the element does not match", %{type: type, opts: opts, state: state} do
      Type.assert(type, %{name: "John"}, opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, %{}, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, %{name: :john}, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, %{age: 28}, opts, state))
    end
  end

  describe "with example and exact_same_keys: true" do
    setup do
      type = %Types.Map{
        example: %{
          name: %Types.Binary{}
        },
        exact_same_keys: true,
      }

      %{type: type, opts: %Option{}, state: %InternalState{}}
    end

    test "fails if there are extra keys", %{type: type, opts: opts, state: state} do
      Type.assert(type, %{name: "John"}, opts, state)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, %{}, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, %{name: :john}, opts, state))
      assert {:error, _} = catch_throw(Type.assert(type, %{name: "John", age: 28}, opts, state))
    end
  end
end
