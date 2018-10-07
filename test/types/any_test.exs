defmodule ExUnitAssertMatch.Types.AnyTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types}

  setup do
    %{type: %Types.Any{}}
  end

  describe "assert" do
    test "always pass", %{type: type} do
      Type.assert(type, "abc")
      Type.assert(type, 123)
      Type.assert(type, 3.14)
      Type.assert(type, %{})
      Type.assert(type, [1, 2, 3])
      Type.assert(type, :atom)
    end
  end
end
