defmodule ExUnitAssertMatch.Types.NullableTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{Type, Types, Option}

  setup do
    %{type: %Types.Nullable{example: %Types.Binary{}}, opts: %Option{}}
  end

  describe "assert" do
    test "pass if it's binary or nil", %{type: type, opts: opts} do
      Type.assert(type, nil, opts)
      Type.assert(type, "hello", opts)

      opts = %Option{opts | assertion_module: ExUnitAssertMatch.ThrowTupleOnFail}
      assert {:error, _} = catch_throw(Type.assert(type, 1, opts))
      assert {:error, _} = catch_throw(Type.assert(type, 1.0, opts))
    end
  end
end
