defmodule ExUnitAssertMatch.Types.ListTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch, as: M

  setup do
    %{opts: [assertion_module: M.ThrowTupleOnFail]}
  end

  describe "without example" do
    setup do
      %{type: M.list()}
    end

    test "return true if it's list", %{type: type, opts: opts} do
      M.assert(type, [], opts)
      M.assert(type, [1, 2, 3], opts)

      assert {:error, _} = catch_throw(M.assert(type, "1", opts))
      assert {:error, _} = catch_throw(M.assert(type, :list, opts))
    end
  end

  describe "with example" do
    setup do
      %{type: M.list_of(M.binary())}
    end

    test "fails if the element does not match", %{type: type, opts: opts} do
      M.assert(type, [], opts)
      M.assert(type, ["a", "b", "c"], opts)

      assert {:error, _} = catch_throw(M.assert(type, [1, 2, 3], opts))
    end
  end
end
