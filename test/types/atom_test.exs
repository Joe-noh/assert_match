defmodule ExUnitAssertMatch.Types.AtomTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch, as: M

  setup do
    %{opts: [assertion_module: M.ThrowTupleOnFail]}
  end

  describe "assert" do
    setup do
      %{type: M.atom()}
    end

    test "pass if atom is given", %{type: type, opts: opts} do
      M.assert(type, :atom, opts)
      M.assert(type, :"hello world", opts)
      M.assert(type, Elixir, opts)

      assert {:error, _} = catch_throw(M.assert(type, 'abc', opts))
      assert {:error, _} = catch_throw(M.assert(type, 1.0, opts))
      assert {:error, _} = catch_throw(M.assert(type, [:a], opts))
    end
  end
end
