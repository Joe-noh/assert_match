defmodule ExUnitAssertMatch.Types.IntegerTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch, as: M

  setup do
    %{opts: [assertion_module: M.ThrowTupleOnFail]}
  end

  describe "assert" do
    setup do
      %{type: M.integer()}
    end

    test "return true if it's integer", %{type: type, opts: opts} do
      M.assert(type, 1, opts)
      M.assert(type, 0, opts)
      M.assert(type, -1, opts)

      assert {:error, _} = catch_throw(M.assert(type, "1", opts))
      assert {:error, _} = catch_throw(M.assert(type, 1.0, opts))
    end
  end
end
