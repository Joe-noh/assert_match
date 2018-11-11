defmodule ExUnitAssertMatch.Types.BinaryTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch, as: M

  setup do
    %{opts: [assertion_module: M.ThrowTupleOnFail]}
  end

  describe "assert" do
    setup do
      %{type: M.binary()}
    end

    test "return true if it's binary", %{type: type, opts: opts} do
      M.assert(type, "abc", opts)
      M.assert(type, "", opts)
      M.assert(type, <<123, 456>>, opts)

      assert {:error, _} = catch_throw(M.assert(type, 1, opts))
      assert {:error, _} = catch_throw(M.assert(type, 1.0, opts))
      assert {:error, _} = catch_throw(M.assert(type, [:a], opts))
    end
  end

  describe "assert with regex" do
    setup do
      %{type: M.binary(regex: ~r/a/)}
    end

    test "return true if it's binary and match the regex", %{type: type, opts: opts} do
      M.assert(type, "abc", opts)

      assert {:error, _} = catch_throw(M.assert(type, "bb", opts))
      assert {:error, _} = catch_throw(M.assert(type, 1.0, opts))
    end
  end
end
