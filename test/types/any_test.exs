defmodule ExUnitAssertMatch.Types.AnyTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types, Option}

  setup do
    %{type: %Types.Any{}, opts: %Option{}}
  end

  describe "assert" do
    test "always pass", %{type: type, opts: opts} do
      Type.assert(type, "abc", opts)
      Type.assert(type, 123, opts)
      Type.assert(type, 3.14, opts)
      Type.assert(type, %{}, opts)
      Type.assert(type, [1, 2, 3], opts)
      Type.assert(type, :atom, opts)
    end
  end
end
