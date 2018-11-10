defmodule ExUnitAssertMatch.ErrorMessageTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{ErrorMessage, InternalState}

  describe "build without stack" do
    setup do
      %{state: %InternalState{key_stack: []}}
    end

    test "return given message as is", %{state: state} do
      assert ErrorMessage.build("something went wrong", state) == "something went wrong"
    end
  end

  describe "build with stack" do
    setup do
      %{state: %InternalState{key_stack: ["name", 1, :orgs]}}
    end

    test "append keys", %{state: state} do
      message = ErrorMessage.build("something went wrong", state)

      assert message =~ "something went wrong"
      assert message =~ ":orgs > 1 > \"name\""
    end
  end
end
