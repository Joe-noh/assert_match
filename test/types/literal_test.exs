defmodule ExUnitAssertMatch.Types.LiteralTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch, as: M

  setup do
    %{opts: [assertion_module: M.ThrowTupleOnFail]}
  end

  describe "assert" do
    setup do
      %{type: M.literal("hello")}
    end

    test "pass if match with `==`", %{type: type, opts: opts} do
      M.assert(type, "hello", opts)

      assert {:error, _} = catch_throw(M.assert(type, :hello, opts))
      assert {:error, _} = catch_throw(M.assert(type, "Hello", opts))
    end
  end
end
