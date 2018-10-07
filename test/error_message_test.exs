defmodule ExUnitAssertMatch.ErrorMessageTest do
  use ExUnit.Case, async: true

  alias ExUnitAssertMatch.{ErrorMessage, Option}

  describe "build without stack" do
    setup do
      %{opts: %Option{key_stack: []}}
    end

    test "return given message as is", %{opts: opts} do
      assert ErrorMessage.build("something went wrong", opts) == "something went wrong"
    end
  end

  describe "build with stack" do
    setup do
      %{opts: %Option{key_stack: ["name", 1, :orgs]}}
    end

    test "append keys", %{opts: opts} do
      message = ErrorMessage.build("something went wrong", opts)

      assert message =~ "something went wrong"
      assert message =~ ":orgs > 1 > \"name\""
    end
  end
end
