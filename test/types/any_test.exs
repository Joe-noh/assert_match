defmodule ExUnitAssertMatch.Types.AnyTest do
  use ExUnit.Case, async: false

  alias ExUnitAssertMatch.{Type, Types, Option, InternalState}

  setup do
    %{type: %Types.Any{}, opts: %Option{}, state: %InternalState{}}
  end

  describe "assert" do
    test "always pass", %{type: type, opts: opts, state: state} do
      Type.assert(type, "abc", opts, state)
      Type.assert(type, 123, opts, state)
      Type.assert(type, 3.14, opts, state)
      Type.assert(type, %{}, opts, state)
      Type.assert(type, [1, 2, 3], opts, state)
      Type.assert(type, :atom, opts, state)
    end
  end
end
