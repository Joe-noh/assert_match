defmodule ExUnitAssertMatch.Types.MapTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch, as: M

  setup do
    %{opts: [assertion_module: M.ThrowTupleOnFail]}
  end

  describe "without example" do
    setup do
      %{type: M.map()}
    end

    test "return true if it's map", %{type: type, opts: opts} do
      M.assert(type, %{}, opts)
      M.assert(type, %{a: 1}, opts)

      assert {:error, _} = catch_throw(M.assert(type, "1", opts))
      assert {:error, _} = catch_throw(M.assert(type, :map, opts))
    end
  end

  describe "with example" do
    setup do
      %{type: M.map(%{name: M.binary()})}
    end

    test "fails if the element does not match", %{type: type, opts: opts} do
      M.assert(type, %{name: "John"}, opts)

      assert {:error, _} = catch_throw(M.assert(type, %{}, opts))
      assert {:error, _} = catch_throw(M.assert(type, %{name: :john}, opts))
      assert {:error, _} = catch_throw(M.assert(type, %{age: 28}, opts))
    end
  end

  describe "with example and exact_same_keys: true" do
    setup do
      %{type: M.map(%{name: M.binary()}, exact_same_keys: true)}
    end

    test "fails if there are extra keys", %{type: type, opts: opts} do
      M.assert(type, %{name: "John"}, opts)

      assert {:error, _} = catch_throw(M.assert(type, %{}, opts))
      assert {:error, _} = catch_throw(M.assert(type, %{name: :john}, opts))
      assert {:error, _} = catch_throw(M.assert(type, %{name: "John", age: 28}, opts))
    end
  end
end
