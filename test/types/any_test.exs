defmodule ExUnitAssertMatch.Types.AnyTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch, as: M

  describe "assert" do
    test "always pass" do
      M.assert(M.any(), "abc")
      M.assert(M.any(), 123)
      M.assert(M.any(), 3.14)
      M.assert(M.any(), %{})
      M.assert(M.any(), [1, 2, 3])
      M.assert(M.any(), :atom)
    end
  end
end
