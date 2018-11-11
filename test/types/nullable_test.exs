defmodule ExUnitAssertMatch.Types.NullableTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch, as: M

  setup do
    %{opts: [assertion_module: M.ThrowTupleOnFail]}
  end

  describe "assert" do
    setup do
      %{type: M.nullable(M.binary())}
    end

    test "pass if it's binary or nil", %{type: type, opts: opts} do
      M.assert(type, nil, opts)
      M.assert(type, "hello", opts)

      assert {:error, _} = catch_throw(M.assert(type, 1, opts))
      assert {:error, _} = catch_throw(M.assert(type, 1.0, opts))
    end
  end
end
